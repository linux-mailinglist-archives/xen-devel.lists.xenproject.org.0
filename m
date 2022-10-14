Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05E5FEBA5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422616.668762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGzr-0007kQ-NB; Fri, 14 Oct 2022 09:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422616.668762; Fri, 14 Oct 2022 09:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGzr-0007hb-Jf; Fri, 14 Oct 2022 09:28:51 +0000
Received: by outflank-mailman (input) for mailman id 422616;
 Fri, 14 Oct 2022 09:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojGzq-0007hV-Hf
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:28:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20057.outbound.protection.outlook.com [40.107.2.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae65a4d-4ba2-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 11:28:47 +0200 (CEST)
Received: from FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) by
 GV2PR08MB8437.eurprd08.prod.outlook.com (2603:10a6:150:c3::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Fri, 14 Oct 2022 09:28:44 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::16) by FR3P281CA0053.outlook.office365.com
 (2603:10a6:d10:4a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Fri, 14 Oct 2022 09:28:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 09:28:43 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 14 Oct 2022 09:28:43 +0000
Received: from 2b037f28070a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43EC78BA-DF87-4BA3-9543-6832F9E5A635.1; 
 Fri, 14 Oct 2022 09:28:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b037f28070a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 09:28:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7463.eurprd08.prod.outlook.com (2603:10a6:10:356::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 09:28:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 09:28:30 +0000
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
X-Inumbo-ID: 9ae65a4d-4ba2-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=G12+kTDfzZpJ2BH9SWvJqwcVTgGfUtUGqHCZRRzwtwE51N0GvSmSkPDO3NFpCwn+0xZmSm6s2NJSewppUVb89mxDrwsbwwSaRfyIqIQNH6MyW1kyV58VYbxT2e+pahDNB7aIuIy0ELB0hq5c6O+OPtfuz7+B6J/KucNU2Wu/0G21E5RDBgUk1nTWcO6bBm13IQ9g52p1DhvqCa88SHiOjcyggn3aSHWTC4pfFLAEnDyY3sMiL7Gil9kzx8PGhCgi3UmRx6O3bdAZ1O9OnNJXSip6/LLQMd2GjT/zeZ14TVbWhEAQnc+EcvzE9A3nN8eRgMuYe0mujHkPtTdgNRo5xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBWfPjwQmtuWDY3ksijI4H40WjzGzbvm6P9YpHb9phQ=;
 b=BJ5/g2Lgyj3u7byRDJ2jrCy2rgEYm2hwk7Fr2ngw9slDasXvwq5DS6VgieRWqxL2aRD9xaHaTnPLze06BNCLDISotRofSt8zOllB4mPg8Wz13yBBFihjAKeuG4inWo6zpoUQbjAWQ9eKerCuBe5pkWIG2O5eeQCs0EfSAFSUdWUwN8WEIG4S67uR1g+pzK9lsLN2xCMbcRJ2hLP1yoKO74RclrtiKIkNx8bEVrxW3iYlAlIux3s6RbgCOnAMBYIcaa21vKthyV/ix5KL/uL9wNZO118EzWasyQ7YzjuZ5fUOSawl6bWTOt71Tq2T1tCJ+8A/y5NI1Fzyeb/7vI9SxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBWfPjwQmtuWDY3ksijI4H40WjzGzbvm6P9YpHb9phQ=;
 b=LYReN2QCYtX+3zVnS10v0l9PxjIIgKKxlw0cX9NMqEzZauTspjsKW5C9+nQ5nCqMesiWYF7eETdo53uOdPBUQW8eW0OpxJlrpaeLOokjN9v5SVHJhOEaN2v78lNSLJldR+oemFyeAFxqPHDV7zQO8awxg+BJPZyeK3bTm+4Exl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gURWTbtE4wQ4ZEeGzJfIkSwpIzoL56snikmSfl+vdHxRRhO8yzRi7WZydXPJ14ZhbxDqpzIUCDrNF0FakMdXd8E56MHDCzSB4g/QZyhTLOyxMUmrP7tR/EGg+7y6xU2wBBTdvUtyU5h1u4VKsUQTc3DYyMIrSNX+DluGgBzXtd/BeD4cQwrgp8kLxvTtz6xe0mj1fqG+E6g9U8/JDVOHREY98xwOmiUGxOkVbjnETSEb6aOqY7mUAk832z3ylZoHUG9sn09JIyVJ3Ht4Tw9hRp4mhTCwDWuQnyK+PSQU1cNRgb0fg1sVIrJPhC4g+AnZGqmh04kZQLN7MfSNaaguQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBWfPjwQmtuWDY3ksijI4H40WjzGzbvm6P9YpHb9phQ=;
 b=b2ZGkGlvdvfqgs3W79KheFgPfio/JOc5u71Xyg2EDGs+mJGmaa9S2gJI/DDFPZlV3X03UMsceyDV5WtwAA2QeDmaOTxlb9u5vC6fIT1jgU6qvW/gRVIFMKVF8qYf5aPHj+Q9oEOWxAlDQCOiOavAKkUOfwWo6T2WgwCxZYEC/nsHdVYDkFzkDqEj41h8dibS940GQnnpm8/HlKHlINf0SxIHacGOgYCxrEsd9MODW11ix9rSc2XIF8JqfIGpk7qUug/aFilskNW3piHJ7zmMNUU+wpJdPhdatmHiwHwhgFf3TnEcFAXCA0c27zMGOsUKYCrdyePZpE+CWjc3bHi+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBWfPjwQmtuWDY3ksijI4H40WjzGzbvm6P9YpHb9phQ=;
 b=LYReN2QCYtX+3zVnS10v0l9PxjIIgKKxlw0cX9NMqEzZauTspjsKW5C9+nQ5nCqMesiWYF7eETdo53uOdPBUQW8eW0OpxJlrpaeLOokjN9v5SVHJhOEaN2v78lNSLJldR+oemFyeAFxqPHDV7zQO8awxg+BJPZyeK3bTm+4Exl4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY36RSrOIThkYtnEq9RrtWc+uYX64NnUwAgAAAd5A=
Date: Fri, 14 Oct 2022 09:28:29 +0000
Message-ID:
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
In-Reply-To: <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F690A591F4C21F498352633B3F53378C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7463:EE_|VE1EUR03FT015:EE_|GV2PR08MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0d06b2-31a9-4f70-549a-08daadc67cc7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ijLNaHAYBhebMr2Gjp2yVZzHxbyeeA6VPgABju3UGUZfektGSkuPI82p5ylCn1Vab21UPi7fKESd08GLX5A+svzln6JwOQftMOikXeCHd1MmmJomNQs4FxAJe6tSNWukkANfcP9gazGUf6rHAXIP9B/ajgcjkhPH/T4ohryLf1BFOIUq7Yptt7RCyV9433khP/VRavA9i4p47xNlF5NEEz/1yC1Sgbf1z+vEWRq5K8h+43uaNCCpf+EvvyyXx2boW0ix2vTIYm7lUbaNzyLlSEB6W729J3y/n/qvECYA765OrsfdOnCfwe+G/4AAYxI7CNChJQVCk9O04wUEe+y07VtIoRP6DyXVuGiFH1z0hZfplCHCNhoDVeGx8Bg7LeH0IN9tl/0DLtb/6PgwqA3KXoyj45znEu27mhWC3PgmDO/u/32/4lawy+9d9NeobN/lTPpU6lGHnKbXN4J5XJ+fIDOgUojWquDNqUGCPu+9S+WzCuHW5HmJLmr8C7TRLfdfWoHSekcDnegH3813HmFiXHFCqZ3tXwuJ9249tLpliSwnq9rKZ4qRa+bPwniQddeNz5JC08Sd05c2ZdTDIwFvnyuaZfDfNIO/gEXZmf29e1MPETekQ1fpDm6OG/UoU0YJKOWRAnmZCMW7i0106AWpL0mgu4ValLLr71UkNLjyzJHD/xt+FAo4OOUqNaPf3vV6Kva8Aq6lcPQc5rK59uOwSFELkWcygBiVMFGKD8iwGIT9GhU9dmZDvVc9yZfNTbIa3/sTxybLUGlM9Ix4NmDcRQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(86362001)(33656002)(2906002)(8936002)(54906003)(38070700005)(5660300002)(186003)(83380400001)(6916009)(478600001)(71200400001)(38100700002)(7696005)(122000001)(66446008)(66476007)(53546011)(8676002)(66946007)(66556008)(4326008)(64756008)(41300700001)(76116006)(55016003)(52536014)(9686003)(26005)(6506007)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7463
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65fa23e7-c328-4a41-ccbb-08daadc674af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6s+Nqwk+OIPcRCS6q9RwOfP3w0bnSnENwIH9u96BHzTPSeQkIrZ5vBm/eYro7+7Z1xwdE73X90L6mxK/T91oqCl6MnFy6jwShU29jhqIBrNyudvG8iNbhXEh4VdR6oAMQj82HuIt5xZ3Z3j5eLYOfEHvd5EW/+wPVS0ljYANr8seBxLL7CgvD6QB51uy6+pXpiABD59CskU/RWL4WuzfbHGrwGMQjcKmc+aVn9VWR/6p65luX0ck+xaUiDtrRDIQ599mCVpZfKTcN3PEtvAIh3mRot0HqvYloRkMl5SP52j+wLOt9nc3lb3yFyjHqVUsO+4Qe5JJnoFRmNVeoylhOqcROB++IDq0LAVuKhPymBkaKGLst9zhFOtX7OUaffUddMKTbCCPrjdVcNajKzcpGtbaaaxGndN9syi3UEiW6pCOdBr7b+9WPWfBohAh//RxcQ4xkfhujnFN5VtilNZhSnFoC5XzceVxQwkw/T66Zk6I51sffofB6Ze7zU1OpvVF6GM+RFPeE0XD/61ioYClAp4oLnFXnZrbrLXgg/XNjp7cpLsL0x88YQF9rjmzrB0mmj7TMXaF7mCN8SO9LCUGdFnto6aRLUdjc5ym8/6a65GRrdYnVRTCtOoxFAjZaSucyFe6kFGmkU4j0uoh7ju9o8YbzVavmp0nzb+khIoE0jmCR4sj7MoayCBoowP5Uzv+W1RSHTitt9gh0NohIcOHfqQa6R9l8fyJCgUjUexSXBnEZoiys5nbUbD1Q3j3/qIqTBmpPfVsMUWcVpUby7HIhQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(81166007)(356005)(82740400003)(478600001)(54906003)(47076005)(8936002)(6862004)(40460700003)(52536014)(36860700001)(316002)(86362001)(26005)(83380400001)(33656002)(53546011)(41300700001)(70206006)(70586007)(9686003)(7696005)(6506007)(40480700001)(82310400005)(186003)(5660300002)(2906002)(8676002)(55016003)(336012)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:28:43.3701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0d06b2-31a9-4f70-549a-08daadc67cc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8437

SGkgSmFuLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyXSB4ZW4vYXJtOiBwMm06IFBvcHVsYXRlIHBhZ2VzIGZvciBHSUN2
MiBtYXBwaW5nIGluDQo+IGFyY2hfZG9tYWluX2NyZWF0ZSgpDQo+IA0KPiBPbiAxNC4xMC4yMDIy
IDEwOjA5LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4u
Yw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPiA+IEBAIC03NDAsNiArNzQwLDIw
IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICAg
ICBCVUcoKTsNCj4gPiAgICAgIH0NCj4gPg0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIEhhcmR3
YXJlIHVzaW5nIEdJQ3YyIG5lZWRzIHRvIGNyZWF0ZSBhIFAyTSBtYXBwaW5nIG9mIDhLQiBHSUN2
Mg0KPiBhcmVhDQo+ID4gKyAgICAgKiB3aGVuIHRoZSBkb21haW4gaXMgY3JlYXRlZC4gQ29uc2lk
ZXJpbmcgdGhlIHdvcnN0IGNhc2UgZm9yIHBhZ2UNCj4gPiArICAgICAqIHRhYmxlcyBhbmQga2Vl
cCBhIGJ1ZmZlciwgcG9wdWxhdGUgMTYgcGFnZXMgdG8gdGhlIFAyTSBwYWdlcyBwb29sDQo+IGhl
cmUuDQo+ID4gKyAgICAgKiBGb3IgR0lDdjMsIHRoZSBhYm92ZS1tZW50aW9uZWQgUDJNIG1hcHBp
bmcgaXMgbm90IG5lY2Vzc2FyeSwgYnV0DQo+IHNpbmNlDQo+ID4gKyAgICAgKiB0aGUgYWxsb2Nh
dGVkIDE2IHBhZ2VzIGhlcmUgd291bGQgbm90IGJlIGxvc3QsIGhlbmNlIHBvcHVsYXRlIHRoZXNl
DQo+ID4gKyAgICAgKiBwYWdlcyB1bmNvbmRpdGlvbmFsbHkuDQo+ID4gKyAgICAgKi8NCj4gPiAr
ICAgIHNwaW5fbG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+ID4gKyAgICByYyA9IHAybV9z
ZXRfYWxsb2NhdGlvbihkLCAxNiwgTlVMTCk7DQo+ID4gKyAgICBzcGluX3VubG9jaygmZC0+YXJj
aC5wYWdpbmcubG9jayk7DQo+ID4gKyAgICBpZiAoIHJjICE9IDAgKQ0KPiA+ICsgICAgICAgIGdv
dG8gZmFpbDsNCj4gDQo+IFB1dHRpbmcgdGhpcyBsZXZlbCBvZiBrbm93bGVkZ2UgaGVyZSBmZWVs
cyBsaWtlIGEgbGF5ZXJpbmcgdmlvbGF0aW9uIHRvDQo+IG1lLiBNeSBmaXJzdCBzdWdnZXN0aW9u
IHdvdWxkIGJlIHRvIG1vdmUgdGhpcyBjYWxsIHNvbWV3aGVyZSB1bmRlcg0KPiBwMm1faW5pdCgp
Lg0KDQpUaGF0IGlzIGRlZmluaXRlbHkgcG9zc2libGUuIElmIEp1bGllbiBvciBvdGhlciBBcm0g
bWFpbnRhaW5lcnMgYXJlIG5vdA0KYWdhaW5zdCB0aGF0IEkgYW0gaGFwcHkgdG8gbW92ZSB0aGlz
IHRvIHAybV9pbml0KCkgaW4gdjMuDQoNClRoZSByZWFzb24gd2h5IHRoZSBhYm92ZSBibG9jayBp
cyBwbGFjZWQgaGVyZSBpcyBqdXN0IEkgdGhvdWdodCB0byB1c2UNCmQtPmFyY2gudmdpYy52ZXJz
aW9uIHRvIG9ubHkgcG9wdWxhdGUgdGhlIDE2IHBhZ2VzIGZvciBHSUN2MiBpbiB0aGUNCmJlZ2lu
bmluZywgYW5kIGQtPmFyY2gudmdpYy52ZXJzaW9uIGlzIGZpcnN0IGFzc2lnbmVkIGxhdGVyIGFm
dGVyIHAybV9pbml0KCksDQpidXQgbGF0ZXIgd2UgZGVjaWRlZCB0byBwb3B1bGF0ZWQgdGhlIHBh
Z2VzIHVuY29uZGl0aW9uYWxseSBzbyBhY3R1YWxseQ0Kbm93IHdlIGNhbiBtb3ZlIHRoZSBwYXJ0
IHRvIHAybV9pbml0KCkuDQoNCj4gSWYgdGhhdCdzIG5vdCBwb3NzaWJsZSBmb3Igc29tZSByZWFz
b24sIEknZCBsaWtlIHRvIHN1Z2dlc3QNCj4gcGFzc2luZyAxIGhlcmUgYXMgdGhlIGNvdW50IGFu
ZCB0aGVuIGFkZGluZyBhIG1pbi1hY2NlcHRhYmxlIGNoZWNrIHRvDQo+IHAybV9zZXRfYWxsb2Nh
dGlvbigpIGFsb25nIHRoZSBsaW5lcyBvZiB4ODYnZXMgc2hhZG93X3NldF9hbGxvY2F0aW9uKCku
DQo+IFRoYXQgd2F5IHlvdSdkIGFsc28gZ3VhcmFudGVlIHRoZSBtaW5pbXVtIG51bWJlciBvZiBw
YWdlcyBpbiBjYXNlIGENCj4gc3Vic2VxdWVudCB0aW55IGFsbG9jYXRpb24gcmVxdWVzdCBjYW1l
IGluIHZpYSBkb21jdGwuDQo+IA0KPiA+IEBAIC0xNzM2LDYgKzE3MzYsMTcgQEAgdm9pZCBwMm1f
ZmluYWxfdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkNCj4gPiAgICAgIGlmICggIXAybS0+ZG9t
YWluICkNCj4gPiAgICAgICAgICByZXR1cm47DQo+ID4NCj4gPiArICAgIGlmICggIXBhZ2VfbGlz
dF9lbXB0eSgmcDJtLT5wYWdlcykgKQ0KPiA+ICsgICAgICAgIHAybV90ZWFyZG93bihkLCBmYWxz
ZSk7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBkLT5hcmNoLnBhZ2luZy5wMm1fdG90YWxfcGFnZXMg
IT0gMCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgc3Bpbl9sb2NrKCZkLT5hcmNoLnBhZ2lu
Zy5sb2NrKTsNCj4gPiArICAgICAgICBwMm1fc2V0X2FsbG9jYXRpb24oZCwgMCwgTlVMTCk7DQo+
ID4gKyAgICAgICAgc3Bpbl91bmxvY2soJmQtPmFyY2gucGFnaW5nLmxvY2spOw0KPiA+ICsgICAg
ICAgIEFTU0VSVChkLT5hcmNoLnBhZ2luZy5wMm1fdG90YWxfcGFnZXMgPT0gMCk7DQo+ID4gKyAg
ICB9DQo+IA0KPiBJcyBpdCBpbnRlbnRpb25hbCB0byBsYXJnZWx5IG9wZW4tY29kZSBwMm1fdGVh
cmRvd25fYWxsb2NhdGlvbigpIGhlcmU/DQoNClllcywgQUZBSUNUIHAybV90ZWFyZG93bl9hbGxv
Y2F0aW9uKCkgaXMgcHJlZW1wdGlibGUgYW5kIHdlIGRvbid0IHdhbnQNCmFueSBwcmVlbXB0aW9u
IGhlcmUuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

