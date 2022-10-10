Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99445F9D19
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 12:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419210.663979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqPj-0005lm-7L; Mon, 10 Oct 2022 10:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419210.663979; Mon, 10 Oct 2022 10:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqPj-0005ik-3s; Mon, 10 Oct 2022 10:53:39 +0000
Received: by outflank-mailman (input) for mailman id 419210;
 Mon, 10 Oct 2022 10:53:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pai1=2L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ohqPh-0005ie-BI
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 10:53:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c967fca1-4889-11ed-964a-05401a9f4f97;
 Mon, 10 Oct 2022 12:53:34 +0200 (CEST)
Received: from AS4PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::19)
 by DU0PR08MB9751.eurprd08.prod.outlook.com (2603:10a6:10:445::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 10:53:28 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5dc:cafe::8b) by AS4PR10CA0002.outlook.office365.com
 (2603:10a6:20b:5dc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 10:53:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 10:53:27 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Mon, 10 Oct 2022 10:53:27 +0000
Received: from 166f743c75a7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92EA9236-8100-4409-8700-5B5F410C18B0.1; 
 Mon, 10 Oct 2022 10:53:21 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 166f743c75a7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 10 Oct 2022 10:53:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6346.eurprd08.prod.outlook.com (2603:10a6:10:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 10:53:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 10:53:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c967fca1-4889-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dx2Zqf+nhiHhdXb2pUTj2t+93oSIdlzurQp9ESi0OkRJ11rWrE+ylRA9wK3DdwZyecMAfcv8GiWyiXvcQ3A3ydCBvkF8mxnSwb0KDdaAZouWIrALPhsSiQ7qGU7odxNqZhtQGpWAKmTLjuH8T8NJXY75RNkIE13I0qbNm3LVv/SKG6XWJzwEAVBelFCfFztzgK55TzqUIFpwZSVgCSNZOKDr/r9s2pd49zRVqZQxIgdJ056qwwWVKi4fRn512ayn64tlwLbC68vFw9DhKC1m5390BdvUVHlELB14FOpjosO8t4jPQ4/maNnQvg/WvZkkcCikPF4YyzxqiHsqVdjHRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVWEMsvpSV6M9Z34qOHiGgzzMXl2a+1Jgr+E0j4hWJU=;
 b=F+sBsb6QcS5/aQeSkAmB2TzyiJb9vNZ8/2PqW/IATaL7DiBp2s42+DkIO/OT9cgUxDY++cCcOmWSJoDx9MZfXu7dipxlE/4fssvGGCLCDHdlilt0n6P6+OUloI9bAOh13nmoX5lyTwF4zWeSqYeRSbgfFC+rKRWlIieAd8ltSgqm0BQsxvhChBQLP1lVg0HlxiK9Hm5FwYngaZrN5+IFiCVTym8OET4RpdI5LCxhK+FE6gbIV/voQQKdRfYupkKFUUBgvhflQOv2HVFJI4DIQP4Q3U3m1xnDEvis6kZwDySJ/klOtaBMfg5pmFZRXPZYb+SN3OHKXET04/Al+8vClA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVWEMsvpSV6M9Z34qOHiGgzzMXl2a+1Jgr+E0j4hWJU=;
 b=lvaHLFB4Od/tDVGCt1E+b69eeSAczM4gewtN++bZi9Tq2mHfZhYmG+F2tth9AVHUvxCa6N0nkfAPoVHr4tQvzMJxvd42JyADkP3ANK2gqnrNFnsIZSBKg+yY2TXfiKpaXDFMmuy6nsmwUK96GbVnGWxEJzRZWFh9cqE/SKzI/GE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G77Hs/dBEz0zoRMRByVmWg36KyjHe4WP1XwADTND/g9yGMww17Bab0h7CgyYGTaDHF/9T+7RcuSOxUshv124pz7NC0iryWktSkzQ/p8fHdJ2+IIPofMlfWGRze645tl7nhnEJlne2qx5Sg8D3SifcuKEzhQPeiOPpOg9Q2JIdaK/t2CgE0kMPOqHXtwkgjv33MGjV+xrHx8XyBOhY4C53ylGRIdctRTvhY5457PYByBexkS193Oc5cCnpkzX5n2Vlmk+6Nsw6UZi67hw7HjYAGvdIt2S6/sQI6XnQXQ30u17m0NIEsLZueBp6k/6ekdXh3CeGiQfHxLg19DrLUE65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVWEMsvpSV6M9Z34qOHiGgzzMXl2a+1Jgr+E0j4hWJU=;
 b=VgC0aiB4wtRO5ZstMwUlK8gj1w2K8WXC8/TN3QeI9XOII9pHojlbVWlpPYttzVrjcSxPTqxm/1wGrO2VuzwOM2iW17okZHpCtbpAeTDHXfQcaF0YK8jQ9F9qVFZc0upeNqU78O1IH62+fuR9sO5MMLLz6gZgFITPwm3Iz2L2LviHhLp1jeV5ne40WEy8+wFqCzhAEW8QWhWelLcDvgGP9bnolnC+CH9OnltomIyJPyAkxlAD7P2gOxse5FYriJ3VZZUt/eeTW0kxVPYMhMd4PZF/F72Bf29Z+VL90jh6WgRwrilEa3/wMeDrqJ0rBEVfzyGqSJzig/tnZvVURA7G/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVWEMsvpSV6M9Z34qOHiGgzzMXl2a+1Jgr+E0j4hWJU=;
 b=lvaHLFB4Od/tDVGCt1E+b69eeSAczM4gewtN++bZi9Tq2mHfZhYmG+F2tth9AVHUvxCa6N0nkfAPoVHr4tQvzMJxvd42JyADkP3ANK2gqnrNFnsIZSBKg+yY2TXfiKpaXDFMmuy6nsmwUK96GbVnGWxEJzRZWFh9cqE/SKzI/GE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH][4.17?] VMX: correct error handling in vmx_create_vmcs()
Thread-Topic: [PATCH][4.17?] VMX: correct error handling in vmx_create_vmcs()
Thread-Index: AQHY3JKk95KKydAo1UWcu6C5J8zQU64Hckhw
Date: Mon, 10 Oct 2022 10:53:19 +0000
Message-ID:
 <AS8PR08MB79916EB4B9BE42E3238AF14392209@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <4c1cc983-6c16-4efc-9686-1e7a79c3122f@suse.com>
In-Reply-To: <4c1cc983-6c16-4efc-9686-1e7a79c3122f@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B19BE698B9BF8544B3DE2B4612C0943B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6346:EE_|VE1EUR03FT009:EE_|DU0PR08MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b90197-5b18-4a78-4457-08daaaada99b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CL64yAQlCi6pkqdf/h3ku5z1e13+1AtpEV5C5O5jjvG96/lw8T465vluOdsE1FyY4VNhCXHnaK0F+nBaHkW9Z2ecmONlM8Y+fM71acopW6iNm1E20VGLVQ8bk3NyDWUl3ZFXbodXYSTlYG3kwoGa8sooNs02kBmCIssFbgY6ddCuVhhX4H9u0Y2BXWHyaY9ixZgkC04EBR3J8bImux1meIUbW6nLvsfD/kVJDK6RVEdYU07924g6AwWFdWvclYHPAscyBAMc9O2/66wMdVwVrJhAMoP+4aoJcsQzdxVrzV91LewEGcxyiheGBJdw4lizAO5GuGl+sMP0U5yDAmmG6QqaqtUn/rMZ79UpUj3Om7X4Uz43EloHIZ81w2BCmtHLvqKjYq0+sVMpql1+BvVM/kwSuo8O29/f9PV3x4XCQ2+kxPFDWDGsO5LGnH1NeGl/yeMLDcXURwP1NeP4v3DnRwNLo+TR7vZCTYJahZOjsqs12CvL4RbBxPMMwjHg5y5v5wiisjSDArGdK1KR7+8/jnRs9TZsehEf7snPbS7rUNhrAiVtK4Fb0DSXz/uR8PiA8gIPgymlRTtZ5I0gx1Vcu9blAolNu5i/z+snJCWAKSFRY2Z5GPDPjaEElrJFhYjwdWpGWY3E/PwNC8NiDrVdrGiTcp4LdxyLBtIAyJVYH8x7ZDgM5J9pIeZ8GwmKizWR7IZNWOD/Bdw7ef9mCRdVNKOc44wl4Domfi7bBpn7u5/j/tEHNty4qs1cYOO2E1FMr50qkg8fdX6OpP7J8nL+3w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(66556008)(83380400001)(186003)(9686003)(26005)(66446008)(76116006)(4326008)(2906002)(66946007)(52536014)(86362001)(66476007)(4744005)(5660300002)(64756008)(8676002)(71200400001)(38100700002)(6506007)(7696005)(478600001)(122000001)(55016003)(110136005)(54906003)(8936002)(38070700005)(41300700001)(33656002)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52f2b67c-1925-4db4-3831-08daaaada4b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AjGhsYNZ020o0GMEK/h9Kp+1bW2qIGdzzCJX0i6vUCp9l5SCMeIlbJ/UkeI/0dm2rzrHILmrbBlXlP2o0Bef4XaQxpZLbsIgxxn3NoUjyKaiG5SyvBKDJ/GFQ4/Vo/Zyjk1yGgCIaDkH2cd3rK8coxUM+39dCn2ToR0FkHV3/rCVy6EWDzmmYk7MYhnthyz+/xT4qEWEkJOq+SOPGWPI+hx/HJA3E0/9uA3U32iQGmot3IwsuetvFuONpGmJQYXyyXBOdtTHPsShbA/iAubZJmMlk5dgvsvSlLhnJYvTyOHzn89xqF36/PWidtcx5bQPXYm1TgoMf05UTGI/BqX3nsnY+lqVT7bq3FyQbdgnU1MOG9Tq25Yp57hXn/uCn5haaE6Powk+wYDAiXG5VTw5JL2i60p5RemQd8XUvhMm1rJkMJl497yCn3Y44QvaoG27J/Dh6PF9hz7olntNOGNMlnjWdmKvfZxgTElE+ckxrE2i6ODITHel+Eoy/6kJbxFOep2ymUzGgMO3xj15GppAlzSfHh8sFKEQvYLs/AWMjWfoSmeTCnaRU6K9HcSw4M47FgutNxZ6o8lPEK3MZ8IOOo+jjzNvGo4GTArJsKAKaA5Y1jfr7r6cXaHBYaJC+Br+NE/9ZFV6yjDDCCt3LtTW7+qYBGFJSfaoj4lKMhzCLMgNb+gDETcpmnDih5ymzSPe6mN0EKyrwUTzzdE5YnfXV+NEUl6l1sZ9M5yFbyUrghnzxk5QSr2HtKIZOAowtlr98BH0TjCi7g3QUnUuIbdrNQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(26005)(9686003)(6506007)(47076005)(107886003)(478600001)(186003)(336012)(83380400001)(4744005)(55016003)(2906002)(40480700001)(7696005)(40460700003)(316002)(5660300002)(82310400005)(110136005)(54906003)(70586007)(41300700001)(4326008)(8676002)(8936002)(70206006)(52536014)(86362001)(356005)(81166007)(33656002)(82740400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:53:27.6217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b90197-5b18-4a78-4457-08daaaada99b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9751

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXVs0LjE3P10gVk1YOiBj
b3JyZWN0IGVycm9yIGhhbmRsaW5nIGluIHZteF9jcmVhdGVfdm1jcygpDQo+IA0KPiBXaXRoIHRo
ZSBhZGRpdGlvbiBvZiB2bXhfYWRkX21zcigpIGNhbGxzIHRvIGNvbnN0cnVjdF92bWNzKCkgdGhl
cmUgYXJlDQo+IG5vdyBjYXNlcyB3aGVyZSBzaW1wbHkgZnJlZWluZyB0aGUgVk1DUyBpc24ndCBl
bm91Z2g6IFRoZSBNU1IgYml0bWFwDQo+IHBhZ2UgYXMgd2VsbCBhcyBvbmUgb2YgdGhlIE1TUiBh
cmVhIG9uZXMgKGlmIGl0J3MgdGhlIDJuZCB2bXhfYWRkX21zcigpDQo+IHdoaWNoIGZhaWxzKSBt
YXkgYWxzbyBuZWVkIGZyZWVpbmcuIFN3aXRjaCB0byB1c2luZyB2bXhfZGVzdHJveV92bWNzKCkN
Cj4gaW5zdGVhZC4NCj4gDQo+IEZpeGVzOiAzYmQzNjk1MmRhYjYgKCJ4ODYvc3BlYy1jdHJsOiBJ
bnRyb2R1Y2UgYW4gb3B0aW9uIHRvIGNvbnRyb2wNCj4gTDFEX0ZMVVNIIGZvciBIVk0gSEFQIGd1
ZXN0cyIpDQo+IEZpeGVzOiA1M2E1NzBiMjg1NjkgKCJ4ODYvc3BlYy1jdHJsOiBTdXBwb3J0IElC
UEItb24tZW50cnkiKQ0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpJIHRoaW5rIHRoZSBjaGFuZ2UgbWFrZXMgc2Vuc2UgdG8gbWUgYW5kIGl0IGlz
IHF1aXRlIHNpbXBsZSwgc28gSSB3b3VsZA0Kbm90IG9iamVjdCB0byBoYXZpbmcgdGhpcyBjaGFu
Z2UgaW4gNC4xNy4gV2l0aCBwcm9wZXIgcmV2aWV3L2FjayBmcm9tDQpvdGhlciB4ODYgbWFpbnRh
aW5lcnM6DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNv
bT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg==

