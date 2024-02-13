Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E528534CC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680025.1057843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZupo-0004DP-Hy; Tue, 13 Feb 2024 15:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680025.1057843; Tue, 13 Feb 2024 15:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZupo-0004Aa-Ep; Tue, 13 Feb 2024 15:36:36 +0000
Received: by outflank-mailman (input) for mailman id 680025;
 Tue, 13 Feb 2024 15:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpMr=JW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rZupn-0004AU-K9
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:36:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe02::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9576d4a-ca85-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:36:32 +0100 (CET)
Received: from AS8PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:20b:451::10)
 by DU5PR08MB10756.eurprd08.prod.outlook.com (2603:10a6:10:51e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.32; Tue, 13 Feb
 2024 15:36:28 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:451:cafe::68) by AS8PR07CA0001.outlook.office365.com
 (2603:10a6:20b:451::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25 via Frontend
 Transport; Tue, 13 Feb 2024 15:36:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:36:28 +0000
Received: ("Tessian outbound 1076c872ecc6:v228");
 Tue, 13 Feb 2024 15:36:27 +0000
Received: from bc95c49f6eb3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4996C959-A3ED-42DB-8C69-781C565FFD7D.1; 
 Tue, 13 Feb 2024 15:36:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc95c49f6eb3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Feb 2024 15:36:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 15:36:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 15:36:16 +0000
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
X-Inumbo-ID: a9576d4a-ca85-11ee-98f5-efadbce2ee36
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=l32j02c7yzlBQMcBPHy2Re3d53WDECK3MF4qZ/m1vb5CDwkfNuhwOsn6dEeM7vhNUWBl+1anSpSQTBPkxWOTD/yiFhp4i5irykJAvnjh2mXyHqpS55lgC7YTNnSVI2S5R5wDTlHolZ8EdQxB0KHqxfCAqJE669rrf1NW10W3SEqbzqjcggg3xCv7kDYApE8AkobsF+8IrWM7qjtrP0mmM18V3WRoueDgdSxt+RmbnHzoW2yzuPPzkaNSWr3007fHVLSx5y24xWuwa9k51N9u1J0IfAUEAwkkqxger3MFuKLOIv6mZV+TL2BAx0L5kaquHXWMJgAeO/Keu8+Bd0T7rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMDqOAOqUlR6SMcP0KYloozBSpPOQU4mqbd8n5tfTiE=;
 b=afl9eFcYAaAxjGWCX7Az2SQXaQ4I6lDcGJVXUV8VcmBYyoFn9eC6XqciZ2xqNPY22eC/MrrQc3qWI6t5eJhAsF9KOa+/ADnCWU/jjMj5iVMiiGv+6BeB2XTFr9W9aY4anJauXqp95UZWAZdDn02icNcwngi1uUgqIZO9FHRyJZP0g7uCLOuGua2oyeTIqoCAh30MNfykuIaqdsrFMyaCOfH1Cmh3SUrbACsgQjZ6HXc/IvLKvrKlUO/Zp0o8abllO9AD49cF+vOlIvGRRDe5iEW0YPNSQY6fobPTjy0uGxSr4z3ElAp1ZWpBs6HtYiHX8J9P+NGrS6kmw05FeklNeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMDqOAOqUlR6SMcP0KYloozBSpPOQU4mqbd8n5tfTiE=;
 b=YTtbr3r1Mte8XjdhY8ritlb9Ulm+M566u7rCLYI10syC+w7ma/oawZYCa9AtTSxASdyto3aBxq7CpReUrMIfuLCmp0yWUIdnL5ETaP7A6IyvHcocxkuzxZz/ov+tTwQuUXQXBqrYf87q/Mr2UiPh2bUsjv6Q/1KUw6hxc50yupA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd3bca1f42d31f29
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHDE1E43bva9Wq4iUYDFZ3JMidMcYw0kTxRCAKpD6zyXtdqEKDQhMHPJUO3kwH8Qju2xr6/66m3rjLsUJi8C6GFOcOGm6IW6tWN226k88TrEyuE3GLMkcYRtpMMFYHz7m0rBNrgFbf3PnZe0PEVgLzrFdnMUSB5jb9H2AzR3nQS2X/kkoUYrLJoMja3rfPDrsXOwHWecMdFRHXgL6mS1WdDcy/EnK7tjBnxEQojG0hnXmGWiOv87EHNwAgIp2gEC1ETG/N48vySvwvbLJmpLiFDjRNrI2W5zHd8JsVDlBYlUjBSh723Ju/xNuk6ck5VpgDicXN4L5VGXA/TiKhO5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMDqOAOqUlR6SMcP0KYloozBSpPOQU4mqbd8n5tfTiE=;
 b=myjdHFmIlbJ+RNGWUHkwID5ByeRM/RD/zYm2sTNlZPsPwfg+lfAaETCmPQGXaEuk9PBIjZBnD0hmyeD7GEct3lZdO1n7Gk34pXaK/yD97Ts+JBwlu8oHnHxKe6VV7AwfJr9jQqGenHqFK7NAjP1ZJIpmrlFDtZi3m5UXEIvRLUpnmTZts7Qw++403E+XXzNVZoDXzAgT/ZjHecKxUzrHsGV7H/Y4dtbUN0omYGPxTirBUkt5nmVfedFnuC1K8XOoUoAymNJ/v700WUPEAAmNAFBqdMma1xgZyQqETiP3lgg77LoQRMTi6Gk95B/5Yj/r+7pQIpgIRmtiBTcjOQ1KtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMDqOAOqUlR6SMcP0KYloozBSpPOQU4mqbd8n5tfTiE=;
 b=YTtbr3r1Mte8XjdhY8ritlb9Ulm+M566u7rCLYI10syC+w7ma/oawZYCa9AtTSxASdyto3aBxq7CpReUrMIfuLCmp0yWUIdnL5ETaP7A6IyvHcocxkuzxZz/ov+tTwQuUXQXBqrYf87q/Mr2UiPh2bUsjv6Q/1KUw6hxc50yupA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?UGV0ciBCZW5lxaE=?= <w1benny@gmail.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Thread-Topic: [PATCH v2] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Thread-Index: AQHaXo2+7VlqRIHhmU23d/RZTQZ3VLEIYAUAgAAFEwCAAAKDgA==
Date: Tue, 13 Feb 2024 15:36:16 +0000
Message-ID: <8D75402C-D476-40FD-86E6-E188CA8DB6F0@arm.com>
References:
 <4ced67935b2e1a2fc79ccda7624c0849bea6cd87.1707836102.git.w1benny@gmail.com>
 <34bfa65b-5537-4bd3-a017-c9a3b01fb331@suse.com>
 <CAKBKdXiZ1wcz7_GnUHUmuboTHHVEE03QPSeWhdRKMoV=o7nf3w@mail.gmail.com>
 <c8d747a9-e164-460a-9e50-e976580d10ef@suse.com>
In-Reply-To: <c8d747a9-e164-460a-9e50-e976580d10ef@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB8PR08MB5371:EE_|AM1PEPF000252DF:EE_|DU5PR08MB10756:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e84576-299f-48bf-7972-08dc2ca98b93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ua/LQtnZhsD7Ni7g74oL1d1Rze728RB6GNOeTLs7uFSNq8CQAwGqOWj1uzKLNRiPMT4NNy3mgxjjOnkNg6vJ5P2JkLFq3WlsfoxvN0EauiZu//HGNoH2Z70RrFodQD9Xjei/qR/8GyrI2AEiMMrR0f1R7FHXVFlBhg9WiacE1Xo12WH6Oouhbedq5JwJkkV0wyIByAtf/gmL2zzjC3wtkFnwd+yrLsNDwock//ACkgBbpHU8++VyCy3ppcnDflq0vuic+ugAEWeun46/0zzByF72n6+HSjNqM+BWbDdXOe3b8oEYiXSbfcGtOnTaFLNL172Lpr1gBjygIlKZzLzqbnnXz5rzJcm8Mm4+noXtJE7LV+kmMTwIkJFyXdbW0fSdtKox7u7ULivLGrMMfx4ihV3Y2i1w+WS6Eoy1fPNvBCVxkFr+T0Y6JOLCut8Jh5dQMg0+KW3fgy2R3d3YgTq+30L3US4qpKtO06UnjCW+b0TA2BeXM43yK/ckCN+bSn2IuIklSr9q1x9pWxL7U2EFPND0sFaBbG7PkZWy2WfvsL6oyT1QRLSPMKtMzm3LB8gGSispQLugbK95y1utUKpmmY12PkRQRIWy75rGPvmyZ5g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(966005)(76116006)(6486002)(41300700001)(2906002)(5660300002)(66476007)(6916009)(54906003)(66556008)(86362001)(83380400001)(66946007)(8936002)(4326008)(8676002)(316002)(64756008)(33656002)(71200400001)(36756003)(66446008)(6506007)(2616005)(26005)(6512007)(53546011)(38100700002)(478600001)(122000001)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3DFC9F6817EEF48BDE130E031D7979D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f263f6e-fc3d-4161-900a-08dc2ca98462
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sspevaa0TUMmpRrUOPjULW9h/FX2v841QQPDe3212eiGEGXscQZNfmhvEfKdN98ZVTjZTANRXrd+4PpIriDKHxtjGizK8rDQIfZOm0fVNVgCeWJslMAiW9Mw/P+fTMjU3SekV+8iCh2EhqrIA/CZnknqE4yBP9I4Q2yt212Hr4eLayTdZu1Q/gxfsgg+GdWPpd/5wPE5H4ePEgTg4RC7jqwiLKFHyiYY/K1oFlYwuiX0mHnX6lHaQaDoE7ggCK2MUzx+N9JgKDgmAmp3EBtUMLhA9hdD6Lq3iJT0MzLjIrRSXWhKMgoU+nJ4397lzLe31c94B5XqIUzu97kFpZjCG3TxcUbOM6MtK70p27J9UEtr6yvHJFQachdxhePd1EisRJOtdauYxXpm7IVEAdnUI5JMiwtayLBsuC85f/Y7nnxa9QF9AiH1+7YIDrVz87HHXTJYwiVdcc0N9TSOfztaDe/uRLyQRNMWYcV76K2EBk5L1l6e2nND04sbM4KmPk2KeulRF70I0ka1Lz6YzSKsVEmkga0kJHD75nUY8ue7iPKZnWRECg7ngCV+W2TKEP2zm1uG49SgGr3W3eF/uGXXjQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(46966006)(40470700004)(36840700001)(26005)(336012)(41300700001)(2616005)(4326008)(70586007)(6862004)(8936002)(2906002)(5660300002)(8676002)(70206006)(54906003)(83380400001)(316002)(6512007)(966005)(6486002)(478600001)(53546011)(6506007)(86362001)(107886003)(82740400003)(356005)(36756003)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:36:28.2092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e84576-299f-48bf-7972-08dc2ca98b93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10756

DQoNCj4gT24gMTMgRmViIDIwMjQsIGF0IDE1OjI3LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMDIuMjAyNCAxNjowOCwgUGV0ciBCZW5lxaEgd3Jv
dGU6DQo+Pj4gT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgNDowMuKAr1BNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMTMuMDIuMjAyNCAxNTo1Niwg
UGV0ciBCZW5lxaEgd3JvdGU6DQo+Pj4+IEZyb206IFBldHIgQmVuZcWhIDx3MWJlbm55QGdtYWls
LmNvbT4NCj4+Pj4gDQo+Pj4+IEl0J3MgbG9jYXRlZCBpbiBsaWJ4bF9kb21haW5fYnVpbGRfaW5m
bywgbm90IGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mby4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFBldHIgQmVuZcWhIDx3MWJlbm55QGdtYWlsLmNvbT4NCj4+Pj4gQWNrZWQtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4+IA0KPj4+IEFueSByZWFz
b24geW91IGRpZG4ndCBhbHNvIGFkZCB0aGUgRml4ZXM6IHRhZyB0aGF0IEFudGhvbnkgc3VnZ2Vz
dGVkDQo+Pj4gdG8gcHV0IHRoZXJlIChmb3IgbWUgdG8gcmVjb2duaXplIHRoYXQgdGhpcyBtYXkg
bmVlZCBiYWNrcG9ydGluZzsNCj4+PiBkaWRuJ3QgY2hlY2sgeWV0IHdoZW4gdGhhdCBlYXJsaWVy
IGNvbW1pdCB3ZW50IGluKT8NCj4+IA0KPj4gQXBvbG9naWVzLiBObyBvdGhlciByZWFzb24gdGhh
dCBpdCdzIG15IGZpcnN0IGV4cGVyaWVuY2Ugd2l0aCBjcmVhdGluZw0KPj4gdjIgcGF0Y2ggYW5k
IEkgaG9uZXN0bHkgZGlkbid0IGtub3cgdGhhdCB0aGUgIkZpeGVzOiB0YWciIHN1Z2dlc3Rpb24N
Cj4+IHdhcyBkaXJlY3RlZCBhdCBtZS4gSG93IHNob3VsZCBJIHByb2NlZWQgZnJvbSBoZXJlPw0K
DQpIaSBQZXRyLA0KDQpJbiB0aGlzIGNhc2UgSmFuIHdpbGwgdHJ5IHRvIHRha2UgY2FyZSBvZiB0
aGF0LCBpZiB5b3UgYXJlIGludGVyZXN0ZWQgb24gaG93IHRvIGRvIHRoYXQsDQp0aGUgc2VjdGlv
biDigJgxLjIgVGhlIGNvbW1pdCBtZXNzYWdl4oCZIG9mIGh0dHBzOi8veGVuYml0cy54ZW4ub3Jn
L2RvY3MvdW5zdGFibGUvcHJvY2Vzcy9zZW5kaW5nLXBhdGNoZXMuaHRtbA0Kd2lsbCBleHBsYWlu
IGhvdyB0byBzZXR1cCBnaXQgdG8gaGF2ZSB0aGUgY29ycmVjdCBjb25maWd1cmF0aW9uIGZvciB0
aGUgZml4ZXMgdGFnLCBhZnRlcndhcmRzIHlvdSBjYW4ganVzdDoNCg0KMSkgdGFrZSB0aGUgU0hB
IG9mIHRoZSBjb21taXQgd2hvIGludHJvZHVjZWQgdGhlIGlzc3VlOg0KICAgIGdpdCBibGFtZSAt
TDxsaW5lIG51bSBmcm9tPiw8bGluZSBudW0gdG8+IC0tIDxwYXRoIHRvIHRoZSBmaWxlPg0KDQoy
KSBHZXQgdGhlIEZpeGVzIHRhZyB0byBiZSBwdXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlOg0KICAg
IGdpdCBzaG93IC0tcHJldHR5PWZpeGVzIDxTSEE+DQogICAgDQogICAgWW91IHdpbGwgc2VlIGFz
IGZpcnN0IGxpbmUgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lOiDigJxGaXhlczogNmU5Y2NkYTVl
NDc1ICjigJxibGEgYmxhIGJsYSBibGEgYmxhIGJsYSIpIg0KDQpUaGVyZSBjb3VsZCBiZSBiZXR0
ZXIgZ2l0IGNvbW1hbmQgdG8gb2J0YWluIHRoZSBzYW1lIHRoaW5nLCBidXQgSSBhbHdheXMgdXNl
IHRoZSBhYm92ZS4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

