Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27567E2CA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485441.752664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMe4-0002IO-4r; Fri, 27 Jan 2023 11:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485441.752664; Fri, 27 Jan 2023 11:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMe4-0002Eq-1A; Fri, 27 Jan 2023 11:11:48 +0000
Received: by outflank-mailman (input) for mailman id 485441;
 Fri, 27 Jan 2023 11:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLMe2-0002Ei-NV
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:11:46 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2070.outbound.protection.outlook.com [40.107.241.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 612c6fa6-9e33-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:11:43 +0100 (CET)
Received: from AM6P192CA0059.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::36)
 by DU0PR08MB10367.eurprd08.prod.outlook.com (2603:10a6:10:409::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 11:11:39 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::13) by AM6P192CA0059.outlook.office365.com
 (2603:10a6:209:82::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 11:11:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 11:11:39 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Fri, 27 Jan 2023 11:11:38 +0000
Received: from d4e6941d166e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 438ED51A-D488-4F9C-BB60-304B9BB7803D.1; 
 Fri, 27 Jan 2023 11:11:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4e6941d166e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:11:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Fri, 27 Jan
 2023 11:11:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:11:25 +0000
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
X-Inumbo-ID: 612c6fa6-9e33-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LojGeEAsI1TEiePLXv4nJT33G4Xly4OKlP8v8NBl+P0=;
 b=DED2ZW+NsyEE8ULo+ghgxhMpaX2nE2u1ZYtK1nSRuKV+TzdHg0+gTq4kn1YjQ3bdnvESjephWfUtgR+SjP0FaO0c/mObLTPMv9PSPfA7op+eXVIB4xD7Dt9Dhwcdw9hKui5UY3cmsfVg2orLS8e6X1trkzSWsFovyb1yLLbml1s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYd6K+IF7bxBGyoqJ7xq4jv4Dz/Pt5MNTqiL6PmFojAzkdbANbmqv7w1ypTsEjMmlq8gO37yGAkpQg94RFXzjwcpfADc52oRF3wTlrSVyZLHV+9UH4a0pTRWPiOsDQO3Qx50PGni2f87cdZ5g08Wkn50TNGtpodRy0v+/3F/Mrd+IkWpFODypJVAHsEvqFspgY3idqloAfUCICTsl9Rg3YrvZMXtP8vo3yMiOe1d1ajLcftWoCnWHjHGxZsC8YviWfRmrdBfghF+0waWpbSxNM4n+Aq0VnRh0E2HIMsVO81dJ309i4kBXjVNDxphLK2HY2EtlLyhHliVBzrxehVjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LojGeEAsI1TEiePLXv4nJT33G4Xly4OKlP8v8NBl+P0=;
 b=SF8e6KS/dIJpPfqyLF0TagvxXbYTJEC+87zeYJfIBq/KUmMUEPJtWs6xmlBxw/rMSCsio06zD8WVo0WhzGt1tJZwVgiIIT4fRxQRk8/P4xXcSpPv8rlPHRe/lVbORmWuSAoBaaJJNTxrdpMUHEkcxmZx7m8zEjxTZQnU+ss6WJZSYcapDreRsS4oufb4IUwc0jiLvdZPbUyrQQKMeG+tmLGhDq/gW+7Kt3rre0nAI+MaIEoQXTvWZ2Ie8U/NHG6VO7x/J2Oc37lviiHIVksZXHEXk6vaDYrkhysNhtPaaYGDl6Q3/i3B2KmrInPG1p0SNoqgb5Sx4jkGn+TGg5RYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LojGeEAsI1TEiePLXv4nJT33G4Xly4OKlP8v8NBl+P0=;
 b=DED2ZW+NsyEE8ULo+ghgxhMpaX2nE2u1ZYtK1nSRuKV+TzdHg0+gTq4kn1YjQ3bdnvESjephWfUtgR+SjP0FaO0c/mObLTPMv9PSPfA7op+eXVIB4xD7Dt9Dhwcdw9hKui5UY3cmsfVg2orLS8e6X1trkzSWsFovyb1yLLbml1s=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Thread-Topic: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Thread-Index: AQHZKU4eIUricNo750ej72nDJ2giuq6nF8cAgAsT2vA=
Date: Fri, 27 Jan 2023 11:11:25 +0000
Message-ID:
 <AS8PR08MB79913487DBC6F434758EAE5A92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-3-Henry.Wang@arm.com>
 <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
In-Reply-To: <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 74C4A913DDA654468B36A9DE6BB03100.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7313:EE_|AM7EUR03FT034:EE_|DU0PR08MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: a306298e-11e9-444f-8cca-08db0057432d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W30xP7Ltqi3Y0n7CVjIcspcwJVhUN2dx8QWKepigo0iDluvbpcsND5+bUBfeB0D89eXXKZqrf2a3i2EpWVtM+VMqGKUWx2E0xsvc6T7rDEx5369v1KYLoi5+lUFCEjaEU3ahbJbfjElnfQ+QTUtM73P/2lNsiMWftGukCrpQ1VXSe5blOnS1ftk8cwzEV8hA1xjWleYPEA/pGHqsIgANfvW2wTua0GifRJFCYM61PiOs+4kQtuPMitT3x+A78xOBReN8sw2rA6M/R23rI4b0cEHrWWrhJC5V6ccgHP9MuIjzhjbxbpMv9ru3S3gXVXNsSM9ehELiWANDtcBPVLKVzz873QZ2+i13ac89tAMoBToHsNjXlHx55+hnbJcVyXGxuKxAY5bHrFgT7xd7ArVa1ptcM/Y2DpWIjsJZ/CmEs8oKFvgxhOyFVgQ07AyLjPjA5zXt+OW+vYvNxOuo2j7B91LzVAR7ZgJVDO01X/gRSWpPjSC4IplMJOQorRU7QcTEdt30Rova5KRj2q1JAzSmoOQv746xg+fBq+H/P/xDoPn6LyJ2YHx0szGnHoPopJ8aB6wi01qMHTaE92abOrgfTRmq4LjY5q1tff/RDRQW3DBR9yrAaYjtSizuk1Z9wIvlLuD4kl4soO7k5cCNmoPufhNotDH83hgLmqJtzy7T5femTTIq+WEhWhKk658NgyUJsoTGZfQP1FS0O4LH4/NLIRAHoyfo3lfJlCz9/Ksn2hibRsMpa3ipsyTki6mmgR29
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(316002)(8936002)(52536014)(6506007)(53546011)(86362001)(71200400001)(478600001)(7696005)(38100700002)(186003)(122000001)(26005)(38070700005)(9686003)(54906003)(33656002)(110136005)(5660300002)(55016003)(2906002)(83380400001)(41300700001)(66476007)(64756008)(66446008)(4326008)(66556008)(8676002)(76116006)(66946007)(414714003)(473944003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f532b16-e628-4ca5-2cf3-08db00573b15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dNgkRFcLS/Y875o3Y+8A+s8vmgOlag+61lGFYCz92itxExClo/f1jZzINY90+vxCQXaTC9C+rD/E64lGOT2mmQlBkPttXADewupJmyM371IUILcVBN2m/fuh06ClQDD+bs55e0gTZ+zA2IJ8Su48mQ7+3/CBsPkzliLhwThFujP5llWE9M9yKk3LY5KTZw9EKW0+dF0c4Mx5EoJo8bhcl2BeSA4si8IFhf6uNZ8r5UTrzvjXHw/sMG1RXqirqh9xi2RqiRRxf7tOgPxD543xYlnkoyRoxAEaBWnODTWpQu+bDYK5am6up2XGCkKnbvnn7L5XCSkQuliiD1jXILlE+iU+wVvzrriZhngi8vGhoNyVPu5d1CeM9sFKbGF0kBA7JTg21i5mdkChmEiAej0sh3gkLM2/fAvcwfX4d2ecXbRWmVbVlLiMXAy3yQkRI0G7pwBAt5ZPLy2ogBq6ZeSp0UoPQbChcmsJW0x4VEA5KJ4hnMKuUoDymaz6dJ2++7BTIifBgEKxeVorYU1dmFM3sng4VQoWpd0edeojQ5p8eM0RoPNuTiXwCV0iHyJiSC3v9Bi3JQXfeW/8B1dWUS2UUDR4NnKIfqf7vQKzIH7ZEW/8swE2NgPUbiXGC3sR6H24Sk3WUzHqADR4BnVks7pn0IUn6yetW/T877idMMfy31ohzOcUtKs0HsKuGrKOIQ4CNiRdX9rt5yJs0Ltqs3kgb7H+KkIf4+gztGl9OTEg0BSu4r0NJn2L0SyH1WMvRtBG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(110136005)(41300700001)(107886003)(54906003)(478600001)(70206006)(316002)(7696005)(82310400005)(70586007)(40460700003)(33656002)(86362001)(336012)(9686003)(356005)(186003)(47076005)(26005)(83380400001)(8936002)(8676002)(40480700001)(4326008)(2906002)(81166007)(53546011)(5660300002)(6506007)(55016003)(82740400003)(52536014)(36860700001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:11:39.1489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a306298e-11e9-444f-8cca-08db0057432d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10367

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8z
XSB4ZW4vYXJtOiBEZWZlciBHSUN2MiBDUFUgaW50ZXJmYWNlIG1hcHBpbmcgdW50aWwNCj4gdGhl
IGZpcnN0IGFjY2Vzcw0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAxNi8wMS8yMDIzIDAyOjU4
LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IE5vdGUgdGhhdCBHSUN2MiBjaGFuZ2VzIGludHJvZHVj
ZWQgYnkgdGhpcyBwYXRjaCBpcyBub3QgYXBwbGllZCB0byB0aGUNCj4gPiAiTmV3IHZHSUMiIGlt
cGxlbWVudGF0aW9uLCBhcyB0aGUgIk5ldyB2R0lDIiBpcyBub3QgdXNlZC4gQWxzbyBzaW5jZQ0K
PiBUaGUgZmFjdCB0aGF0ICJOZXcgdkdJQyIgaXMgbm90IHVzZWQgdmVyeSBvZnRlbiBhbmQgaXRz
IHdvcmsgaXMgaW4tcHJvZ3Jlc3MNCj4gZG9lcyBub3QgbWVhbiB0aGF0IHdlIGNhbiBpbXBsZW1l
bnQgY2hhbmdlcyByZXN1bHRpbmcgaW4gYSBidWlsZCBmYWlsdXJlDQo+IHdoZW4gZW5hYmxpbmcg
Q09ORklHX05FV19WR0lDLCB3aGljaCBpcyB0aGUgY2FzZSB3aXRoIHlvdXIgcGF0Y2guDQo+IFNv
IHRoaXMgbmVlZHMgdG8gYmUgZml4ZWQuDQoNCkkgd2lsbCBhZGQgdGhlICJOZXcgdkdJQyIgY2hh
bmdlcyBpbiB2Mi4NCg0KPiANCj4gPiBAQCAtMTUzLDYgKzE1Myw4IEBAIHN0cnVjdCB2Z2ljX2Rp
c3Qgew0KPiA+ICAgICAgLyogQmFzZSBhZGRyZXNzIGZvciBndWVzdCBHSUMgKi8NCj4gPiAgICAg
IHBhZGRyX3QgZGJhc2U7IC8qIERpc3RyaWJ1dG9yIGJhc2UgYWRkcmVzcyAqLw0KPiA+ICAgICAg
cGFkZHJfdCBjYmFzZTsgLyogQ1BVIGludGVyZmFjZSBiYXNlIGFkZHJlc3MgKi8NCj4gPiArICAg
IHBhZGRyX3QgY3NpemU7IC8qIENQVSBpbnRlcmZhY2Ugc2l6ZSAqLw0KPiA+ICsgICAgcGFkZHJf
dCB2YmFzZTsgLyogdmlydHVhbCBDUFUgaW50ZXJmYWNlIGJhc2UgYWRkcmVzcyAqLw0KPiBDb3Vs
ZCB5b3Ugc3dhcCB0aGVtIHNvIHRoYXQgYmFzZSBhZGRyZXNzIHZhcmlhYmxlcyBhcmUgZ3JvdXBl
ZD8NCg0KU3VyZSwgbXkgb3JpZ2luYWwgdGhvdWdodCB3YXMgZ3JvdXBpbmcgdGhlIENQVSBpbnRl
cmZhY2UgcmVsYXRlZCBmaWVsZHMgYnV0DQpzaW5jZSB5b3UgcHJlZmVyIGdyb3VwaW5nIHRoZSBi
YXNlIGFkZHJlc3MsIEkgd2lsbCBmb2xsb3cgeW91ciBzdWdnZXN0aW9uLg0KDQo+IA0KPiA+ICAj
aWZkZWYgQ09ORklHX0dJQ1YzDQo+ID4gICAgICAvKiBHSUMgVjMgYWRkcmVzc2luZyAqLw0KPiA+
ICAgICAgLyogTGlzdCBvZiBjb250aWd1b3VzIG9jY3VwaWVkIGJ5IHRoZSByZWRpc3RyaWJ1dG9y
cyAqLw0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2Fy
bS90cmFwcy5jDQo+ID4gaW5kZXggMDYxYzkyYWNiZC4uZDk4ZjE2NjA1MCAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5j
DQo+ID4gQEAgLTE3ODcsOSArMTc4NywxMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaHBmYXJfaXNf
dmFsaWQoYm9vbCBzMXB0dywNCj4gdWludDhfdCBmc2MpDQo+ID4gIH0NCj4gPg0KPiA+ICAvKg0K
PiA+IC0gKiBXaGVuIHVzaW5nIEFDUEksIG1vc3Qgb2YgdGhlIE1NSU8gcmVnaW9ucyB3aWxsIGJl
IG1hcHBlZCBvbi0NCj4gZGVtYW5kDQo+ID4gLSAqIGluIHN0YWdlLTIgcGFnZSB0YWJsZXMgZm9y
IHRoZSBoYXJkd2FyZSBkb21haW4gYmVjYXVzZSBYZW4gaXMgbm90DQo+ID4gLSAqIGFibGUgdG8g
a25vdyBmcm9tIHRoZSBFRkkgbWVtb3J5IG1hcCB0aGUgTU1JTyByZWdpb25zLg0KPiA+ICsgKiBU
cnkgdG8gbWFwIHRoZSBNTUlPIHJlZ2lvbnMgZm9yIHNvbWUgc3BlY2lhbCBjYXNlczoNCj4gPiAr
ICogMS4gV2hlbiB1c2luZyBBQ1BJLCBtb3N0IG9mIHRoZSBNTUlPIHJlZ2lvbnMgd2lsbCBiZSBt
YXBwZWQgb24tDQo+IGRlbWFuZA0KPiA+ICsgKiAgICBpbiBzdGFnZS0yIHBhZ2UgdGFibGVzIGZv
ciB0aGUgaGFyZHdhcmUgZG9tYWluIGJlY2F1c2UgWGVuIGlzIG5vdA0KPiA+ICsgKiAgICBhYmxl
IHRvIGtub3cgZnJvbSB0aGUgRUZJIG1lbW9yeSBtYXAgdGhlIE1NSU8gcmVnaW9ucy4NCj4gPiAr
ICogMi4gRm9yIGd1ZXN0cyB1c2luZyBHSUN2MiwgdGhlIEdJQ3YyIENQVSBpbnRlcmZhY2UgbWFw
cGluZyBpcyBjcmVhdGVkDQo+ID4gKyAqICAgIG9uIHRoZSBmaXJzdCBhY2Nlc3Mgb2YgdGhlIE1N
SU8gcmVnaW9uLg0KPiA+ICAgKi8NCj4gPiAgc3RhdGljIGJvb2wgdHJ5X21hcF9tbWlvKGdmbl90
IGdmbikNCj4gPiAgew0KPiA+IEBAIC0xNzk4LDYgKzE4MDEsMTYgQEAgc3RhdGljIGJvb2wgdHJ5
X21hcF9tbWlvKGdmbl90IGdmbikNCj4gPiAgICAgIC8qIEZvciB0aGUgaGFyZHdhcmUgZG9tYWlu
LCBhbGwgTU1JT3MgYXJlIG1hcHBlZCB3aXRoIEdGTiA9PSBNRk4NCj4gKi8NCj4gPiAgICAgIG1m
bl90IG1mbiA9IF9tZm4oZ2ZuX3goZ2ZuKSk7DQo+ID4NCj4gPiArICAgIC8qDQo+ID4gKyAgICAg
KiBNYXAgdGhlIEdJQ3YyIHZpcnR1YWwgY3B1IGludGVyZmFjZSBpbiB0aGUgZ2ljIGNwdSBpbnRl
cmZhY2UNCj4gTklUOiBpbiBhbGwgdGhlIG90aGVyIHBsYWNlcyB5b3UgdXNlIENQVSAoY2FwaXRh
bCBsZXR0ZXJzKQ0KDQpPaCBnb29kIGNhdGNoLCB0aGFuayB5b3UuIEkgdGhpbmsgdGhpcyBwYXJ0
IGlzIHRoZSBzYW1lIGFzIHRoZSBvcmlnaW5hbCBpbi1jb2RlDQpjb21tZW50LCBidXQgc2luY2Ug
SSBhbSB0b3VjaGluZyB0aGlzIHBhcnQgYW55d2F5LCBpdCB3b3VsZCBiZSBnb29kIHRvDQpjb3Jy
ZWN0IHRoZW0uDQoNCj4gDQo+ID4gKyAgICAgKiByZWdpb24gb2YgdGhlIGd1ZXN0IG9uIHRoZSBm
aXJzdCBhY2Nlc3Mgb2YgdGhlIE1NSU8gcmVnaW9uLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBp
ZiAoIGQtPmFyY2gudmdpYy52ZXJzaW9uID09IEdJQ19WMiAmJg0KPiA+ICsgICAgICAgICBnZm5f
eChnZm4pID09IGdmbl94KGdhZGRyX3RvX2dmbihkLT5hcmNoLnZnaWMuY2Jhc2UpKSApDQo+IFRo
ZXJlIGlzIGEgbWFjcm8gZ25mX2VxIHRoYXQgeW91IGNhbiB1c2UgdG8gYXZvaWQgb3BlbmNvZGlu
ZyBpdC4NCg0KVGhhbmtzISBJIHdpbGwgZml4IGluIHYyLg0KDQo+IA0KPiA+ICsgICAgICAgIHJl
dHVybiAhbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4oZC0+YXJjaC52Z2ljLmNiYXNl
KSwNCj4gQXQgdGhpcyBwb2ludCB5b3UgY2FuIHVzZSBqdXN0IGdmbiBpbnN0ZWFkIG9mIGdhZGRy
X3RvX2dmbihkLT5hcmNoLnZnaWMuY2Jhc2UpDQoNCldpbGwgZml4IGluIHYyLg0KDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkLT5hcmNoLnZnaWMuY3NpemUgLyBQ
QUdFX1NJWkUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3Rv
X21mbihkLT5hcmNoLnZnaWMudmJhc2UpKTsNCj4gPiArDQo+ID4gICAgICAvKg0KPiA+ICAgICAg
ICogRGV2aWNlLVRyZWUgc2hvdWxkIGFscmVhZHkgaGF2ZSBldmVyeXRoaW5nIG1hcHBlZCB3aGVu
IGJ1aWxkaW5nDQo+ID4gICAgICAgKiB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdmdpYy12Mi5jIGIveGVuL2FyY2gvYXJtL3ZnaWMtdjIuYw0KPiA+
IGluZGV4IDAwMjZjYjQzNjAuLjIxZTE0YTVhNmYgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL3ZnaWMtdjIuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYyLmMNCj4gPiBAQCAt
NjQ0LDEwICs2NDQsNiBAQCBzdGF0aWMgaW50IHZnaWNfdjJfdmNwdV9pbml0KHN0cnVjdCB2Y3B1
ICp2KQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgdmdpY192Ml9kb21haW5faW5pdChzdHJ1Y3QgZG9t
YWluICpkKQ0KPiA+ICB7DQo+ID4gLSAgICBpbnQgcmV0Ow0KPiA+IC0gICAgcGFkZHJfdCBjc2l6
ZTsNCj4gPiAtICAgIHBhZGRyX3QgdmJhc2U7DQo+ID4gLQ0KPiA+ICAgICAgLyoNCj4gPiAgICAg
ICAqIFRoZSBoYXJkd2FyZSBkb21haW4gYW5kIGRpcmVjdC1tYXBwZWQgZG9tYWluIGJvdGggZ2V0
IHRoZQ0KPiBoYXJkd2FyZQ0KPiA+ICAgICAgICogYWRkcmVzcy4NCj4gPiBAQCAtNjY3LDggKzY2
Myw4IEBAIHN0YXRpYyBpbnQgdmdpY192Ml9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0K
PiA+ICAgICAgICAgICAqIGFsaWduZWQgdG8gUEFHRV9TSVpFLg0KPiA+ICAgICAgICAgICAqLw0K
PiA+ICAgICAgICAgIGQtPmFyY2gudmdpYy5jYmFzZSA9IHZnaWNfdjJfaHcuY2Jhc2U7DQo+ID4g
LSAgICAgICAgY3NpemUgPSB2Z2ljX3YyX2h3LmNzaXplOw0KPiA+IC0gICAgICAgIHZiYXNlID0g
dmdpY192Ml9ody52YmFzZTsNCj4gPiArICAgICAgICBkLT5hcmNoLnZnaWMuY3NpemUgPSB2Z2lj
X3YyX2h3LmNzaXplOw0KPiA+ICsgICAgICAgIGQtPmFyY2gudmdpYy52YmFzZSA9IHZnaWNfdjJf
aHcudmJhc2U7DQo+ID4gICAgICB9DQo+ID4gICAgICBlbHNlIGlmICggaXNfZG9tYWluX2RpcmVj
dF9tYXBwZWQoZCkgKQ0KPiA+ICAgICAgew0KPiA+IEBAIC02ODMsOCArNjc5LDggQEAgc3RhdGlj
IGludCB2Z2ljX3YyX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICAgICAgICAg
ICovDQo+ID4gICAgICAgICAgZC0+YXJjaC52Z2ljLmRiYXNlID0gdmdpY192Ml9ody5kYmFzZTsN
Cj4gPiAgICAgICAgICBkLT5hcmNoLnZnaWMuY2Jhc2UgPSB2Z2ljX3YyX2h3LmNiYXNlOw0KPiA+
IC0gICAgICAgIGNzaXplID0gR1VFU1RfR0lDQ19TSVpFOw0KPiA+IC0gICAgICAgIHZiYXNlID0g
dmdpY192Ml9ody52YmFzZSArIHZnaWNfdjJfaHcuYWxpYXNlZF9vZmZzZXQ7DQo+ID4gKyAgICAg
ICAgZC0+YXJjaC52Z2ljLmNzaXplID0gR1VFU1RfR0lDQ19TSVpFOw0KPiA+ICsgICAgICAgIGQt
PmFyY2gudmdpYy52YmFzZSA9IHZnaWNfdjJfaHcudmJhc2UgKyB2Z2ljX3YyX2h3LmFsaWFzZWRf
b2Zmc2V0Ow0KPiA+ICAgICAgfQ0KPiA+ICAgICAgZWxzZQ0KPiA+ICAgICAgew0KPiA+IEBAIC02
OTcsMTkgKzY5MywxMCBAQCBzdGF0aWMgaW50IHZnaWNfdjJfZG9tYWluX2luaXQoc3RydWN0IGRv
bWFpbiAqZCkNCj4gPiAgICAgICAgICAgKi8NCj4gPiAgICAgICAgICBCVUlMRF9CVUdfT04oR1VF
U1RfR0lDQ19TSVpFICE9IFNaXzhLKTsNCj4gPiAgICAgICAgICBkLT5hcmNoLnZnaWMuY2Jhc2Ug
PSBHVUVTVF9HSUNDX0JBU0U7DQo+ID4gLSAgICAgICAgY3NpemUgPSBHVUVTVF9HSUNDX1NJWkU7
DQo+ID4gLSAgICAgICAgdmJhc2UgPSB2Z2ljX3YyX2h3LnZiYXNlICsgdmdpY192Ml9ody5hbGlh
c2VkX29mZnNldDsNCj4gPiArICAgICAgICBkLT5hcmNoLnZnaWMuY3NpemUgPSBHVUVTVF9HSUND
X1NJWkU7DQo+ID4gKyAgICAgICAgZC0+YXJjaC52Z2ljLnZiYXNlID0gdmdpY192Ml9ody52YmFz
ZSArIHZnaWNfdjJfaHcuYWxpYXNlZF9vZmZzZXQ7DQo+ID4gICAgICB9DQo+ID4NCj4gPiAtICAg
IC8qDQo+ID4gLSAgICAgKiBNYXAgdGhlIGdpYyB2aXJ0dWFsIGNwdSBpbnRlcmZhY2UgaW4gdGhl
IGdpYyBjcHUgaW50ZXJmYWNlDQo+ID4gLSAgICAgKiByZWdpb24gb2YgdGhlIGd1ZXN0Lg0KPiA+
IC0gICAgICovDQo+ID4gLSAgICByZXQgPSBtYXBfbW1pb19yZWdpb25zKGQsIGdhZGRyX3RvX2dm
bihkLT5hcmNoLnZnaWMuY2Jhc2UpLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBj
c2l6ZSAvIFBBR0VfU0laRSwgbWFkZHJfdG9fbWZuKHZiYXNlKSk7DQo+ID4gLSAgICBpZiAoIHJl
dCApDQo+ID4gLSAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAtDQo+IE1heWJlIGFkZGluZyBzb21l
IGNvbW1lbnQgbGlrZSAiTWFwcGluZyBvZiB0aGUgdmlydHVhbCBDUFUgaW50ZXJmYWNlIGlzDQo+
IGRlZmVycmVkIHVudGlsIGZpcnN0IGFjY2VzcyINCj4gd291bGQgYmUgaGVscGZ1bC4NCg0KU3Vy
ZSwgSSB3aWxsIGFkZCB0aGUgY29tbWVudCBpbiB2Mi4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkN
Cg0KPiANCj4gfk1pY2hhbA0K

