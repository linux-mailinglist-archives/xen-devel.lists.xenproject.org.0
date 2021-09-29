Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260CA41C12F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198892.352629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVR4-00022W-Ih; Wed, 29 Sep 2021 08:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198892.352629; Wed, 29 Sep 2021 08:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVR4-0001z5-EJ; Wed, 29 Sep 2021 08:59:30 +0000
Received: by outflank-mailman (input) for mailman id 198892;
 Wed, 29 Sep 2021 08:59:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AY/=OT=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mVVR2-0001yt-W8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:59:29 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c8eb0e0-2103-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 08:59:27 +0000 (UTC)
Received: from AM6PR10CA0064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::41)
 by AM9PR08MB6915.eurprd08.prod.outlook.com (2603:10a6:20b:30f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Wed, 29 Sep
 2021 08:59:25 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::b0) by AM6PR10CA0064.outlook.office365.com
 (2603:10a6:209:80::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 08:59:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 08:59:25 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Wed, 29 Sep 2021 08:59:23 +0000
Received: from 039d4f51148a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B183071-0C17-4C8F-8569-D2B040691BFE.1; 
 Wed, 29 Sep 2021 08:59:14 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 039d4f51148a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 08:59:14 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 08:59:09 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 08:59:09 +0000
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
X-Inumbo-ID: 8c8eb0e0-2103-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AeOF3KYIOF4Q8MoXwvV1uJhsAmxB4uwLExzJVehyrc=;
 b=nbGLQRZGeMwWWo/L62vDZ6+Vs/Bnx09Oz83ClZwsSZ9js6/mD9+wRjRZWvDJ33lX2qVLy+LejkDwBpCZTad53IUTvNw3sVzgV7yExBrypriDOuRd3zaT/Oe+sotlzWjFv75MKDgVCsNuLxOt+T38szxXPG1qXZZ/R3fjtRDI8kk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 220ff5382ab26446
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey73Hy5HUL+0WSXm0fXcDIQrtj1A4B3nMZkRYHv8q1zfj/QDPuxI7YJdekJa7HBTsBLIAkB2x2ZUcV3pDjnmDmm9RMFIujk+SLg6yUjhYsouuY6qfopAkPMseisw9firUcGZsjpa5YGhhec5Q4de12b0CTLrldo9VrZnSZZoQUL6YkxL7guIMKVloffmxyUdcuc+RBvMInYRe+PGtF/LNZt+1IQEWzBEeq6y/jYFue696aLduX2N3HbAF7JgUXV3PkZ1Kjm6VHhM3egQz1LqihOOF7BiIIxwLiuOYkj/MBRDT/2Lf97AT81K9abm6hWxnglYniRHFQGgbclMp7yiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4AeOF3KYIOF4Q8MoXwvV1uJhsAmxB4uwLExzJVehyrc=;
 b=gL1kl+mLsxUobpo3dsbkithMX2WYjDtQVea/2SXtBr09sCrb4uLPw3eQn/1scqCz7zjqIF6HJNbFoSe9fxlrw3UK6Irnd4ItCav0rUaYVfAqMnf2y/qoLo4V0gS2VrVvazyWwXj0NAV76YMHQ9QdVxi6KKAybLFT914zYMzH4/Dtb7fH1A7e5SBTBU/7yprzo2E/MyIs7xybmIyUjPm4cdXsjJ3xvGtTAJgdEfRz5VSUGHVUzfc8cikFnadw6rOMjDLB1ShrWGPCsQj7hyAf6ZkH4DYlUrKiHtt7JrbjYjP9cRT4wlE9uds6Upk9wo76VzkUgB69G3yWxcbQfQmZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AeOF3KYIOF4Q8MoXwvV1uJhsAmxB4uwLExzJVehyrc=;
 b=nbGLQRZGeMwWWo/L62vDZ6+Vs/Bnx09Oz83ClZwsSZ9js6/mD9+wRjRZWvDJ33lX2qVLy+LejkDwBpCZTad53IUTvNw3sVzgV7yExBrypriDOuRd3zaT/Oe+sotlzWjFv75MKDgVCsNuLxOt+T38szxXPG1qXZZ/R3fjtRDI8kk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 11/17] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v3 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXtJXbn2GMwMXPv0CHEFVVsLXHhKu6r4SAgAAH1gA=
Date: Wed, 29 Sep 2021 08:59:09 +0000
Message-ID: <31E0D735-C7A4-48C1-AE5A-2906A140617E@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <a16e90a04ecb722e0f6c5fb8f9a9b0129b4fe96c.1632847120.git.rahul.singh@arm.com>
 <27b97adb-c7f2-949e-140b-bbdb8f01457e@suse.com>
In-Reply-To: <27b97adb-c7f2-949e-140b-bbdb8f01457e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 381feac0-5c86-4f02-d2d6-08d983277010
x-ms-traffictypediagnostic: AS8PR08MB6919:|AM9PR08MB6915:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6915FCEE1473FF7067A1464BFCA99@AM9PR08MB6915.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y/c4O7xZxacaXShbUNOFhpCyBFA8Hq7B2YJCSJqvMwq/g115yoIYYTDMsdUEutNsoA59JKmLTUdAgngVGK+PglI3V8z3+6ZB67lqqe200uUVW4TeNyDs+JYiurpdsZzYMh3GjbuDUde5iwWBPWz66PnMVCRpSYu/AVSwd6X79Uin6gPNhQmaHhw1Zob35k4s5uCTz4eSrorsFJ5HWnDf6vmxb7gn3+wOWO7S65IWrmhmcAglUgFNaLNtColzJfPZ2t9zU2BIYNkEXt4qasnZ2RoO240Kn1wRRJfhvuxLNBwvJcxVEfofi/UOm9o9hbrn3/goBNX6V2HvFYef2sHlTt8GwvC04bnDKhbbi6XPYiZJU+1EEv88pI9qosoZwmWpNHpYuQjbClRT6mAgUNDjToXa8td2XPvENOfKy30Zv72l+w4TGH+1bVpJ+bPBSlYgY+zGtoM6iFj1pnx5hF4rN1rNKmzawhoTTojflOuOirhV7oNu72yn50j1CSXwHw7vvUqPgCFFYgT9K3Hicv4+BMc5CsyguIw20e/9cjt/HF7e8xLpjGemQPWPEpbfJ3rRQHLJFSAqFw/WYh6sXJg/2DP20pbNqDdu5+K1+3tR9eZ6pY4ilrPSj9uB5PvVAK5jr67AaQjQaItSKoly3TWyR5+dAAxV2a1gjujGwC/KYZQwYpFdiw+set2wUP6K48owGpeUQ9NidVCoI2e09XP8tuybOiv9eFnVdnSX/v11Y/CBXV/Wq+27HjBOOJhfW3fN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66476007)(6506007)(38100700002)(508600001)(6512007)(66946007)(53546011)(4326008)(76116006)(91956017)(64756008)(66556008)(66446008)(186003)(2906002)(54906003)(2616005)(83380400001)(71200400001)(122000001)(26005)(6486002)(6916009)(316002)(33656002)(8676002)(38070700005)(36756003)(8936002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <382926DEEFB26E4393E8DB6021043B38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6919
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5b4cf52-2ebf-4684-2d6b-08d98327666a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LiRIFbh2E/RmcZzX9inhkZLBdJTcw1vu7OyRf420p2C+wkIci4IHLv6hHfLEh8x1Ut3dw6KtpuzsQlBsx1iBEnDlibWBGsZC36NfjtGzrgrGxoJROQMAZcXcgPfHuv936B0HlkG4rOKQEZR9JaXALnfD/wK0jp3iAkwUy9TPSijWRtfEZvQLkDFaGzOL/krVzF+xNmZy7P6qNS8DNxvDMGbJUiKOS8qFF3+tvqeTYm/xJdIsjhpqOZ54iXRZqFinCci/H197L2C5minPq9wTaKiQA1AlF1iHP+AGfMU+frvkLU5pUiVYA9YJun/UcpaYrV/3l/4F/ZZU19ILRpfiNolT2F+LMxaoMegnqs6u8guTkiZOnziBKJTqeIbGJiiS3cBbuIXkj81TckZmwVG8vi3r8QI/I3p5KUYOWEQKl/6qkJlAzXXXFlo/l6Sc8sI9FHO1wjE0R8d6xul+sSgEDHbKmALrYWQaqEE04dHbtC88L09JgadilCRPC64559lagFJkJaXZ3NhCr+0Kd3rEgJsEIfItkcfKTtIQGOLY6rrQUSBTs9TDlST5IMduXgmt8LShJzRXupGq4ro8AAwAkRKnS1fQi06dw4OslF5YL52F6YJFkVq00VtGfpGYcnDkbiRTI6dmGOcy1sPxa3w7aR4ia6Pb5PU6HbGzj0K6dyRaEcvxjv1tG06jqOYpr7+A+S2xW992WrlxOewW3lJWnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(81166007)(6506007)(53546011)(508600001)(8936002)(4326008)(5660300002)(8676002)(356005)(70206006)(2616005)(54906003)(70586007)(6862004)(2906002)(26005)(186003)(316002)(6512007)(6486002)(86362001)(36860700001)(47076005)(36756003)(82310400003)(336012)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:59:25.5650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 381feac0-5c86-4f02-d2d6-08d983277010
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6915

SGkgSmFuLA0KDQo+IE9uIDI5IFNlcCAyMDIxLCBhdCA5OjMxIGFtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMDkuMjAyMSAyMDoxOCwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBYRU4gZHVyaW5nIGJvb3Qgd2lsbCByZWFkIHRoZSBQQ0kgZGV2aWNl
IHRyZWUgbm9kZSDigJxyZWfigJ0gcHJvcGVydHkNCj4+IGFuZCB3aWxsIG1hcCB0aGUgUENJIGNv
bmZpZyBzcGFjZSB0byB0aGUgWEVOIG1lbW9yeS4NCj4+IA0KPj4gQXMgb2Ygbm93IG9ubHkgInBj
aS1ob3N0LWVjYW0tZ2VuZXJpYyIgY29tcGF0aWJsZSBib2FyZCBpcyBzdXBwb3J0ZWQuDQo+PiAN
Cj4+ICJsaW51eCxwY2ktZG9tYWluIiBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBhc3NpZ25zIGEgZml4
ZWQgUENJIGRvbWFpbg0KPj4gbnVtYmVyIHRvIGEgaG9zdCBicmlkZ2UsIG90aGVyd2lzZSBhbiB1
bnN0YWJsZSAoYWNyb3NzIGJvb3RzKSB1bmlxdWUNCj4+IG51bWJlciB3aWxsIGJlIGFzc2lnbmVk
IGJ5IExpbnV4LiBYRU4gYWNjZXNzIHRoZSBQQ0kgZGV2aWNlcyBiYXNlZCBvbg0KPj4gU2VnbWVu
dDpCdXM6RGV2aWNlOkZ1bmN0aW9uLiBBIFNlZ21lbnQgbnVtYmVyIGluIHRoZSBYRU4gaXMgc2Ft
ZSBhcyBhDQo+PiBkb21haW4gbnVtYmVyIGluIExpbnV4LiBTZWdtZW50IG51bWJlciBhbmQgZG9t
YWluIG51bWJlciBoYXMgdG8gYmUgaW4NCj4+IHN5bmMgdG8gYWNjZXNzIHRoZSBjb3JyZWN0IFBD
SSBkZXZpY2VzLg0KPj4gDQo+PiBYRU4gd2lsbCByZWFkIHRoZSDigJxsaW51eCxwY2ktZG9tYWlu
4oCdIHByb3BlcnR5IGZyb20gdGhlIGRldmljZSB0cmVlIG5vZGUNCj4+IGFuZCBjb25maWd1cmUg
dGhlIGhvc3QgYnJpZGdlIHNlZ21lbnQgbnVtYmVyIGFjY29yZGluZ2x5LiBJZiB0aGlzDQo+PiBw
cm9wZXJ0eSBpcyBub3QgYXZhaWxhYmxlIFhFTiB3aWxsIGFsbG9jYXRlIHRoZSB1bmlxdWUgc2Vn
bWVudCBudW1iZXINCj4+IHRvIHRoZSBob3N0IGJyaWRnZS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1i
eTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZSBp
biB2MzoNCj4+IC0gTW9kaWZ5IGNvbW1pdCBtc2cgYmFzZWQgb24gcmVjZWl2ZWQgY29tbWVudHMu
DQo+PiAtIFJlbW92ZSBhZGRlZCBzdHJ1Y3QgbWF0Y2hfdGFibGV7fSBzdHJ1Y3QgaW4gc3RydWN0
IGRldmljZXt9DQo+PiAtIFJlcGxhY2UgdWludDMyX3Qgc2JkZiB0byBwY2lfc2JkZl90IHNiZGYg
dG8gYXZvaWQgdHlwZWNhc3QNCj4+IC0gUmVtb3ZlIGJ1c19zdGFydCxidXNfZW5kIGFuZCB2b2lk
ICpzeXNkYXRhIGZyb20gc3RydWN0IHBjaV9ob3N0X2JyaWRnZXt9DQo+PiAtIE1vdmUgIiNpbmNs
dWRlIDxhc20vcGNpLmg+IiBpbiAieGVuL3BjaS5oIiBhZnRlciBwY2lfc2JkZl90IHNiZGYgZGVj
bGFyYXRpb24NCj4gDQo+IFRoaXMgcGFydCwgaWYgbm90IHNwbGl0IGludG8gYSBzZXBhcmF0ZSBw
YXRjaCBpbiB0aGUgZmlyc3QgcGxhY2UsIHdhbnRzDQo+IG1lbnRpb25pbmcgaW4gYXQgbGVhc3Qg
aGFsZiBhIHNlbnRlbmNlIG9mIHRoZSBkZXNjcmlwdGlvbi4gVGhlbiAuLi4NCg0KTGV0IG1lIG1v
dmUgdGhpcyB0byBuZXcgcGF0Y2ggaW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9wY2kuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+PiBAQCAt
MTUsNyArMTUsNiBAQA0KPj4gI2luY2x1ZGUgPHhlbi9wZm4uaD4NCj4+ICNpbmNsdWRlIDxhc20v
ZGV2aWNlLmg+DQo+PiAjaW5jbHVkZSA8YXNtL251bWEuaD4NCj4+IC0jaW5jbHVkZSA8YXNtL3Bj
aS5oPg0KPj4gDQo+PiAvKg0KPj4gICogVGhlIFBDSSBpbnRlcmZhY2UgdHJlYXRzIG11bHRpLWZ1
bmN0aW9uIGRldmljZXMgYXMgaW5kZXBlbmRlbnQNCj4+IEBAIC02Miw2ICs2MSw4IEBAIHR5cGVk
ZWYgdW5pb24gew0KPj4gICAgIH07DQo+PiB9IHBjaV9zYmRmX3Q7DQo+PiANCj4+ICsjaW5jbHVk
ZSA8YXNtL3BjaS5oPg0KPj4gKw0KPj4gc3RydWN0IHBjaV9kZXZfaW5mbyB7DQo+PiAgICAgLyoN
Cj4+ICAgICAgKiBWRidzICdpc19leHRmbicgZmllbGQgaXMgdXNlZCB0byBpbmRpY2F0ZSB3aGV0
aGVyIGl0cyBQRiBpcyBhbiBleHRlbmRlZA0KPj4gDQo+IA0KPiAuLiB0aGlzIHBhcnQNCj4gQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gKGFsc28gaWYgeW91IGRl
Y2lkZSB0byBtb3ZlIHRoaXMgdG8gYSBzZXBhcmF0ZSBwYXRjaCkNCg0KUmVnYXJkcywNClJhaHVs
DQo+IA0KPiBKYW4NCg0K

