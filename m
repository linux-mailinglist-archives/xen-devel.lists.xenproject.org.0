Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670367E398
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485498.752783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN5E-0002sr-9E; Fri, 27 Jan 2023 11:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485498.752783; Fri, 27 Jan 2023 11:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN5E-0002qH-6F; Fri, 27 Jan 2023 11:39:52 +0000
Received: by outflank-mailman (input) for mailman id 485498;
 Fri, 27 Jan 2023 11:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLN5C-0001VA-Lw
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:39:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2049.outbound.protection.outlook.com [40.107.15.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc76280-9e37-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:39:48 +0100 (CET)
Received: from DB3PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:8:1::19) by
 AS2PR08MB10054.eurprd08.prod.outlook.com (2603:10a6:20b:649::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Fri, 27 Jan
 2023 11:39:47 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::db) by DB3PR06CA0006.outlook.office365.com
 (2603:10a6:8:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 11:39:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.25 via Frontend Transport; Fri, 27 Jan 2023 11:39:46 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Fri, 27 Jan 2023 11:39:46 +0000
Received: from 4c3590cb03cd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 550DF01F-B657-453F-BFA4-711DF4424243.1; 
 Fri, 27 Jan 2023 11:39:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c3590cb03cd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:39:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8735.eurprd08.prod.outlook.com (2603:10a6:20b:563::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 11:39:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:39:33 +0000
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
X-Inumbo-ID: 4dc76280-9e37-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfodZ64Uf/SDdmV+PCiWIuFLK5VSWHLzT2tcYByaAcA=;
 b=9Cnv9c0MU15ix2qvV43cMlFs4loahaf25rQGdD4dHIN+fOsXm+pZuLG/G7sRJweDwSzQsHyJlvQD+rLIM7zZEBQVu6n6OYlgue3R6i16rp3tM5zjGjULj13yLvG4ALlDTFD7M0Ot1MhSTjlZHm5K1atG+fQEc6C4APOiJOFczng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLAnR+iAJjQiT6eOlqO8rnMu7G/He/p9abF9Rq7aGw6tPWkEo/4i3YeIEWO+NoCyzXur9wejkJM0FoRq740jNwCjHs4FGwEmza2s4w9pFKZMt0Akla2BQoBPkSz7wWTQ5JVA3QncxDgahJjmfbsRQk6MXwNzx15TNIhNqWNARyBQzXTKQrRfo+r7Wa/UftA/KwGRYOWd6QKXex0o0mSaF/qVqhEvT3dqPMsjgHySn2YXSlpI7Ova3f/WlgUIwKwF39q7K9dqGI+OT1ACbbqy03gP5ejDHIbQfiFp1cVm6zY8uClA8l1wGLKL5oL7Nv9uSk1NKIN9rzcmtL+zb8oGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfodZ64Uf/SDdmV+PCiWIuFLK5VSWHLzT2tcYByaAcA=;
 b=QsFktrjytGQbsK5AcTooBTwbZtbuzz/Ael6sPgG6wFO007hqn4kIXwzr8258kK9yG3uEFQLgbvg+UNIlAMXG/N9TXVRSZd42ELYM++l0hb8GcaA20zyQh31xxSwpUGvwYfQfll0RGfUFOWWAhOUnUnAgiI1C8PpXFLKilwK8/y90toAPb05CyhPIvBxb/Tmhxk/M5oHsMM+MELsQcuy3QI7T5eYJXxE6eHHQ9dK102eLmyYnbg0H8DuiTQTQneviXOChiu2ETrgkLIwiBe77blFJcnNJkPRYmNJiLslKgbAFd2zCbNlpeOkeeS3Y107muz1l7/F5dDJN7t3mDtnjwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfodZ64Uf/SDdmV+PCiWIuFLK5VSWHLzT2tcYByaAcA=;
 b=9Cnv9c0MU15ix2qvV43cMlFs4loahaf25rQGdD4dHIN+fOsXm+pZuLG/G7sRJweDwSzQsHyJlvQD+rLIM7zZEBQVu6n6OYlgue3R6i16rp3tM5zjGjULj13yLvG4ALlDTFD7M0Ot1MhSTjlZHm5K1atG+fQEc6C4APOiJOFczng=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Thread-Topic: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Thread-Index:
 AQHZKU4eIUricNo750ej72nDJ2giuq6nF8cAgAsT2vCAAASHgIAAAULQgAAC6wCAAAA1gA==
Date: Fri, 27 Jan 2023 11:39:32 +0000
Message-ID:
 <AS8PR08MB7991EA180B325C6E58B0157F92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-3-Henry.Wang@arm.com>
 <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
 <AS8PR08MB79913487DBC6F434758EAE5A92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a729bf36-8c67-ccd4-c787-d62aaf7e24b2@xen.org>
 <AS8PR08MB799127D46D09BCFEF9A0392192CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ed09cf44-cb7b-6713-6ea4-ac38e80b3549@xen.org>
In-Reply-To: <ed09cf44-cb7b-6713-6ea4-ac38e80b3549@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C327ABF5DD689948BBD8543CCDEB539B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8735:EE_|DBAEUR03FT062:EE_|AS2PR08MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: e4481670-57ab-4e24-ab93-08db005b3113
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5RWcS3AWyItnstCss+Ld+B0Lni75Ywvyn8rt7ziimcoWxNVvRsetNbr4CiDNTJSPU3vu7mkWH4e9lU6inAw6bcJ82cjoiY+fdJ5xkcgdducXr6lz05UIrh8PkXDumV8ZudC3MljE4NkuSGXnSAty+7dFrFQRCP1x08It6srDyXWHeLiDWmwb3YL5rL0eu4f6jKCDhU1AYuT8W2ChJlaoEOxkaMqr2wa3CAnkoh++2AmMrvwhcp0Jh0lA3s3HTds72SaL+qp4qkgxAYuxc6acOZ597Js+56g0AYRCKIed+BiJ3tumugo9fBSo2BPg+gfCdERKW1491F1H1E81IKpYb9LFAUJ1VeiCYBtmHrgjR9dfhCFiGNpO58K605BwhUpATogSk4ys6SIbtbzGB+iQTRbB4fA+nL4+5T2dFSskBjSYDiFW3cDT36DG07Wbd3mwe4CAgXrTGmIbpp8qwuegumn0Hys9W8gYPS28fVMHNCdfqd76vG/ZO4i1AeWJoHMa5N9DgRX71vg06Gzi0FrDfOQP5fDDB/WO3YLVxLCweft3T6Fm57Ug4muvbY1t7t/Cs7bGoLd4aFQqsVADiXw0SKU7DxJWA+Q4+Bg7reTvfHMf3N42jZc3wlnbVW5lIhbNCPYEdQ6/50wlc0b4/aKFNQBqFzM/eBuPH2CnDURyuVoilVOoFitbfvz4eOmlfsE7Lujn3y+k5HLI045I0LQfEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199018)(2906002)(8936002)(5660300002)(8676002)(4326008)(41300700001)(64756008)(33656002)(66946007)(83380400001)(76116006)(66446008)(66476007)(66556008)(52536014)(9686003)(186003)(26005)(478600001)(316002)(6506007)(55016003)(38070700005)(86362001)(122000001)(71200400001)(54906003)(110136005)(38100700002)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8735
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ed41414-f7b6-4984-8822-08db005b28d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g8qo3NLwlgI09UH+j61FAzQw/fyVoBusS2AiM1v4wPLSWgSAmbeI6d1FCidIBNg5hn9SSM3GFBxoF3aataRZQlzW44THNEE9ktOCCy21gfma6FQn+F7DAFA6NOq+ISja8Eyf+klTyDX+83zQpyidnhydI5mB49o19LtXK2rARsLkCMBoYqlg9X5GLQrvN5wKfAkF4OveD+KWb02PfzTkuWY5PNQcKhpDAf6Y3HE4rVf/Gd+YOIjwIW7eJsQd7d+NKHi59Nce5wZW4HQmJzdLQVkJo4fGD2YnpD4JT1QmNUbwnFYdkc/GkFVfrCjZjTLUsry4gercYvNuFbOuisqQZXsB+4dFwFCQpKuSVFdbVpIsAbiMqUl3VQk3odsPRQt2EwD3PXNOOTaq4AbMyJOOEqc6hVgHdlSLCuKGGiUIhtk9ILS9Q6oP7GuOWzUgkYFAOpwzpJ/c806ZMZjYG0EeiuMAEczkkX/nvpSXW7LJuUuilWoIpoCdBCC2QiI76wT270hp4hofeVHqDQr9K1Va49YGsKIvmYr2WckqrRCxF0W8by7LN+aPBAMJU/OG1EwePqrpil0mS46632WqvnuJ7VXzyWHqngbH5ggcObKKLhhMkWXVog8US8ZNAUC6OuJbx+pe9b07sGEq3RKdOQAe0muUsPL3tGeRh0RQTEAOasqyuVN3be99UgAMnOXMCp4RtW4DAG/BNWxg44uc4tnMPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(9686003)(186003)(478600001)(107886003)(26005)(4326008)(70586007)(70206006)(7696005)(6506007)(8936002)(336012)(47076005)(52536014)(5660300002)(41300700001)(36860700001)(83380400001)(2906002)(8676002)(40480700001)(55016003)(33656002)(356005)(82310400005)(81166007)(82740400003)(110136005)(86362001)(54906003)(316002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:39:46.8453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4481670-57ab-4e24-ab93-08db005b3113
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10054

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSB4ZW4v
YXJtOiBEZWZlciBHSUN2MiBDUFUgaW50ZXJmYWNlIG1hcHBpbmcgdW50aWwNCj4gdGhlIGZpcnN0
IGFjY2Vzcw0KPiA+Pj4+PiBAQCAtMTUzLDYgKzE1Myw4IEBAIHN0cnVjdCB2Z2ljX2Rpc3Qgew0K
PiA+Pj4+PiAgICAgICAgLyogQmFzZSBhZGRyZXNzIGZvciBndWVzdCBHSUMgKi8NCj4gPj4+Pj4g
ICAgICAgIHBhZGRyX3QgZGJhc2U7IC8qIERpc3RyaWJ1dG9yIGJhc2UgYWRkcmVzcyAqLw0KPiA+
Pj4+PiAgICAgICAgcGFkZHJfdCBjYmFzZTsgLyogQ1BVIGludGVyZmFjZSBiYXNlIGFkZHJlc3Mg
Ki8NCj4gPj4+Pj4gKyAgICBwYWRkcl90IGNzaXplOyAvKiBDUFUgaW50ZXJmYWNlIHNpemUgKi8N
Cj4gPj4+Pj4gKyAgICBwYWRkcl90IHZiYXNlOyAvKiB2aXJ0dWFsIENQVSBpbnRlcmZhY2UgYmFz
ZSBhZGRyZXNzICovDQo+ID4+Pj4gQ291bGQgeW91IHN3YXAgdGhlbSBzbyB0aGF0IGJhc2UgYWRk
cmVzcyB2YXJpYWJsZXMgYXJlIGdyb3VwZWQ/DQo+ID4+Pg0KPiA+Pj4gU3VyZSwgbXkgb3JpZ2lu
YWwgdGhvdWdodCB3YXMgZ3JvdXBpbmcgdGhlIENQVSBpbnRlcmZhY2UgcmVsYXRlZCBmaWVsZHMN
Cj4gYnV0DQo+ID4+PiBzaW5jZSB5b3UgcHJlZmVyIGdyb3VwaW5nIHRoZSBiYXNlIGFkZHJlc3Ms
IEkgd2lsbCBmb2xsb3cgeW91ciBzdWdnZXN0aW9uLg0KPiA+Pg0KPiA+PiBJIHdvdWxkIGFjdHVh
bGx5IHByZWZlciB5b3VyIGFwcHJvYWNoIGJlY2F1c2UgaXQgaXMgZWFzaWVyIHRvIGFzc29jaWF0
ZQ0KPiA+PiB0aGUgc2l6ZSB3aXRoIHRoZSBiYXNlLg0KPiA+Pg0KPiA+PiBBbiBhbHRlcm5hdGl2
ZSB3b3VsZCBiZSB0byB1c2UgYSBzdHJ1Y3R1cmUgdG8gY29tYmluZSB0aGUgYmFzZS9zaXplLiBT
bw0KPiA+PiBpdCBpcyBldmVuIGNsZWFyZXIgdGhlIGFzc29jaWF0aW9uLg0KPiA+Pg0KPiA+PiBJ
IGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiBlaXRoZXIgb2YgdGhlIHR3byBhcHByb2Fj
aCBJIHN1Z2dlc3RlZC4NCj4gPg0KPiA+IE1heWJlIHdlIGNhbiBkbyBzb21ldGhpbmcgbGlrZSB0
aGlzOg0KPiA+IGBgYA0KPiA+IHBhZGRyX3QgZGJhc2U7IC8qIERpc3RyaWJ1dG9yIGJhc2UgYWRk
cmVzcyAqLw0KPiA+IHBhZGRyX3QgdmJhc2U7IC8qIHZpcnR1YWwgQ1BVIGludGVyZmFjZSBiYXNl
IGFkZHJlc3MgKi8NCj4gPiBwYWRkcl90IGNiYXNlOyAvKiBDUFUgaW50ZXJmYWNlIGJhc2UgYWRk
cmVzcyAqLw0KPiA+IHBhZGRyX3QgY3NpemU7IC8qIENQVSBpbnRlcmZhY2Ugc2l6ZSAqLw0KPiA+
IGBgYA0KPiA+DQo+ID4gU28gd2UgY2FuIGVuc3VyZSBib3RoICJiYXNlIGFkZHJlc3MgdmFyaWFi
bGVzIGFyZSBncm91cGVkIiBhbmQNCj4gPiAiQ1BVIGludGVyZmFjZSB2YXJpYWJsZXMgYXJlIGdy
b3VwZWQiLg0KPiA+DQo+ID4gSWYgeW91IGRvbid0IGxpa2UgdGhpcywgSSB3b3VsZCBwcmVmZXIg
dGhlIHdheSBJIGFtIGN1cnJlbnRseSBkb2luZywgYXMNCj4gPiBwZXJzb25hbGx5IEkgdGhpbmsg
YW4gZXh0cmEgc3RydWN0dXJlIHdvdWxkIHNsaWdodGx5IGJlIGFuIG92ZXJraWxsIDopDQo+IA0K
PiBUaGlzIGlzIHJlYWxseSBhIG1hdHRlciBvZiB0YXN0ZSBoZXJlLg0KDQpJbmRlZWQsDQoNCj4g
TXkgcHJlZmVyZW5jZSBpcyB5b3VyIGluaXRpYWwNCj4gYXBwcm9hY2ggYmVjYXVzZSBJIGZpbmQg
c3RyYW5nZSB0byBoYXZlIHZpcnR1YWwgQ1BVIGludGVyZmFjZQ0KPiBpbmZvcm1hdGlvbiB0aGUg
cGh5c2ljYWwgb25lLg0KDQp0aGVuIEkgd2lsbCBrZWVwIGl0IGFzIGl0IGlzIGlmIHRoZXJlIGlz
IG5vIHN0cm9uZyBvYmplY3Rpb24gZnJvbSBNaWNoYWwuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

