Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504D4429454
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206317.361866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxvD-00042a-Sr; Mon, 11 Oct 2021 16:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206317.361866; Mon, 11 Oct 2021 16:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxvD-00040i-PU; Mon, 11 Oct 2021 16:13:03 +0000
Received: by outflank-mailman (input) for mailman id 206317;
 Mon, 11 Oct 2021 16:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZxvC-00040U-E9
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:13:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3ee4ff4-3300-40d2-ad15-6cd39f2afa34;
 Mon, 11 Oct 2021 16:13:01 +0000 (UTC)
Received: from AM5PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:206:1::18)
 by DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 16:12:58 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::38) by AM5PR04CA0005.outlook.office365.com
 (2603:10a6:206:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Mon, 11 Oct 2021 16:12:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 16:12:58 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Mon, 11 Oct 2021 16:12:57 +0000
Received: from e6baa6345c7a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CEAF04C5-0E8D-4B2F-B39B-5A26FC17E779.1; 
 Mon, 11 Oct 2021 16:12:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6baa6345c7a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 16:12:50 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB4188.eurprd08.prod.outlook.com (2603:10a6:10:b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 16:12:49 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 16:12:49 +0000
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
X-Inumbo-ID: b3ee4ff4-3300-40d2-ad15-6cd39f2afa34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmsZcGbCpd1UA3j1GaBrLYFQDJN2ob9Lwxfs3j+OyVo=;
 b=Wd7qtZDnAVBqFsAIfVdyQ79ouFZ7s0A/hZZAFjwUtBY4PPNFN91eKtC66Qi/vu1J3pH0UWGM8aLWO1GeBQqXC+EFTRxKAOLGk51TUYAqHgOFLWREJ/vcbqYaQJ93w83WZkeJjvIV5Yk3saLid4/TV8SDXVICa86dBkFP0iFbIlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b65b29f6758d7b32
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nx5nRxYL7/p0FImECYgVavWIWMUi7DTKSswH5nh9P2OZs02qNk8UzJ4CkvDxdgLegyOin+aM2qzqLUo/VZLqxacRkKsEWRmsEEmnFgpP53+bO9ekmYwHtOg2L3zIaeUko8vJ8j36P9SiYGzfJImv3vQNxrt7Mi3kBwKzDmazsH1FGdBh3WoqJoJOwjRtBB7Zals1dHY0wkzO8LW54Ams0I54ox7wy8mScY79sM7ReqTdpbQQvRYWx+XcPy3iRC+GurJvptaza5QduDUaYBO+N5V7f9kSriL6WhSO7C430gagcHBvjGe09UXgVJcxGegGigSoZM91vLbg5FsFsxMr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmsZcGbCpd1UA3j1GaBrLYFQDJN2ob9Lwxfs3j+OyVo=;
 b=k1H3s9Efhu+T8Un8MncicnMXvyZO8c8W3zKkldRYqOvfKarxJSXn/0XO81HdH5hNmnG6J2knVdHUeiHit/VDznuVPW3zZwDsdm/00woOgNX60jUgH4Hha53/TCvHjmzcQxXSjEB40o4kX7hKZpYiU8glL2pj1gbWAtOq5pFg9nDujnX93uBuCOw36mcVvbjX1k8Yn4H/RFgcEsgg0T/Zivtc+nvv5rvUUtFOW7jZibT+gDggzANqNa8NLNh8GJWV7j+7Nwhd10YFsY6jhsuRjQxDlYRxdB1VmV3rYueHedRW3/e637u3RvCScQMEpERXsi9sg95PwNKcrtBN/ywBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmsZcGbCpd1UA3j1GaBrLYFQDJN2ob9Lwxfs3j+OyVo=;
 b=Wd7qtZDnAVBqFsAIfVdyQ79ouFZ7s0A/hZZAFjwUtBY4PPNFN91eKtC66Qi/vu1J3pH0UWGM8aLWO1GeBQqXC+EFTRxKAOLGk51TUYAqHgOFLWREJ/vcbqYaQJ93w83WZkeJjvIV5Yk3saLid4/TV8SDXVICa86dBkFP0iFbIlY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavNphKAgABZ5QA=
Date: Mon, 11 Oct 2021 16:12:48 +0000
Message-ID: <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
In-Reply-To: <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d897ac1-bd62-4d7a-0476-08d98cd1fdad
x-ms-traffictypediagnostic: DB8PR08MB4188:|DBAPR08MB5702:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5702CF6E589D0C83DA7008BB9DB59@DBAPR08MB5702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wza5m80Q79URnvv1p3w82uvRz/4V7lcGn7HAE4ei5+KrgRzUHTDxsHyONi7VwJpmIlxYcTJVY0sqV2jygWUrz98fmO6ouIOPPbbzNAB+vX0tUQSABL2R/yq42PW6wqBZBUfqkDaIrr8jfQOHoxLqCddd/o7+CWOUIrRRCsmcz9jFLrLPM0uTtfw8U6Uo7yzmJmo5CuPt3kTom1OTLJOZsTVte9gJnyPVUnWtdKD98xIitDTPTpIRMxayOvEW28bUKC3MpeSwt2/kwxNjYFplFE5qN64VClDlRnRuV0wllxAIgbtFxtUbQbwqzLmonSTMTToYeYqox83W7p5vSWqOTEtit6bs6sQOnr1FlmQJy1qxQWnRx9XedQRrS1jWUZ/3QsTM20SqEHc6+EoXdk91/MMqn3VAP8fx4FLqR98YYCadca4DK8Gq2sMupZaHO1i5z28SXOv2K+/CflUdhdkPJJUyGZaXCD6S7P48Z1sGSTZJSdXsG5c2DbhYEYMt8f6cvs+k1H9dHJX7N7buglOlQzFBvMVuxu+nzgiThv4DM0qVBEIytlXX1gCMKtcFksbiNff6BYPDIChO4Us3Dt3gbNFGZSKZinD9EvMB2NnG9VtB1GwmMal9AF03icrlZ/q68LEccVSHy8Yqz50MYAng2Iy4MqM3xSlpPFNiRSHoxCmwiH09SoQhpHXWBYb7Zyui7MZl0t4XFzfNLJEaPFG1wwOdI+9TAl236wR1QcupV/GP3JOi+ix5QxscvL1WRzd70DhzNdP+x2fXSFoN0m0GWg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(71200400001)(91956017)(36756003)(2906002)(86362001)(66446008)(64756008)(76116006)(66476007)(53546011)(66556008)(6506007)(8936002)(66946007)(7416002)(6486002)(508600001)(6512007)(2616005)(8676002)(4326008)(316002)(38100700002)(5660300002)(122000001)(33656002)(54906003)(38070700005)(110136005)(26005)(83380400001)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B10D9B95326914A83A728B94BB640F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4188
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86173882-41f0-4784-2c3b-08d98cd1f84a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QxfLeZPlKdX47NeDdcVdIQ3XKMJWggoqfk4choSWZd7cpAQJ3nY5o1aRuIPbmCxeoVpDGjkwn+CQRIPB5u7V3TyIvsdW36+iXd3hoorOUzcEHhVaYfuJigxXWoAEp5flQLII3iZbgVHMRy2o+kLRY4nIx7Y+fTfbzBUqO13l6yYv4heMyd0gwpzqzuITqTYLAVrvwjBuNc81cCMKbDFfLyvTRu2FBgvEX06BtUpiCMxI/B543j7glO4Au6BcBypvjR4qi7/tx7Z/cNEOmcXxRmCrl3nogD9lcQjy1DINXy6scd1c7vQ9Ui1HuhVgPvK7ZTagjUUfWzzBApeB9NXOfLdTWDyk6MuTVHrdFeZILGgOkYCgBEJsfTGuKAHsCDY+8FiNwKYcyUhJVJRm18q5x/b4iaCTl3iOBo2vZ9wJVLrZvUveiMeshYi18aDG5bgNiXD/5BnAZxSxxkIvcXv1YfJbETxmXMti59s+Q9qsCGOoTUy51dEU5iyHUCx9TXmnWCAMZcbJhXSexkDdkAZEb9vOyCO5tqMa6SelCuqdMWHc1qFy2Tq+7E1NK2nV2TXMrPnrh95YnRzSaukceDmNm11JbM7jomKXAdxzs0+AY472KOBjsibfNhkjRO/y8ccXP117bz/p9/REbgrNJMfM66jATKf1Y/xZzVpItMhB6gkHuiBUVuWt+f7kYc26NDH1Qkv2UCx80eMomP8PmYBt31xtrs2H+99VUP2FDnu/Nr4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(6512007)(33656002)(336012)(70206006)(54906003)(4326008)(110136005)(70586007)(316002)(81166007)(356005)(82310400003)(2616005)(5660300002)(8676002)(26005)(8936002)(53546011)(83380400001)(2906002)(36756003)(186003)(47076005)(36860700001)(508600001)(6486002)(6506007)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 16:12:58.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d897ac1-bd62-4d7a-0476-08d98cd1fdad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5702

SGkgUm9nZXIsDQoNCj4gT24gMTEgT2N0IDIwMjEsIGF0IDExOjUxLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAwNiwgMjAy
MSBhdCAwNjo0MDozNFBNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IFRoZSBleGlzdGlu
ZyBWUENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMgYWRhcHRlZCBmb3IgQXJtLg0KPj4g
V2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVkIHRvIFhFTiB2aWEgdGhlIGh5cGVyIGNhbGwNCj4+IOKA
nFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZOKAnSwgVlBDSSBoYW5kbGVyIGZvciB0aGUgY29uZmln
IHNwYWNlDQo+PiBhY2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQQ0kg
ZGV2aWNlcyBjb25maWcgc3BhY2UuDQo+PiANCj4+IEEgTU1JTyB0cmFwIGhhbmRsZXIgZm9yIHRo
ZSBQQ0kgRUNBTSBzcGFjZSBpcyByZWdpc3RlcmVkIGluIFhFTg0KPj4gc28gdGhhdCB3aGVuIGd1
ZXN0IGlzIHRyeWluZyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UsWEVODQo+PiB3aWxs
IHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFu
ZA0KPj4gbm90IHRoZSByZWFsIFBDSSBoYXJkd2FyZS4NCj4+IA0KPj4gRm9yIERvbTBsZXNzIHN5
c3RlbXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdvdWxkIGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+
PiBQQ0kgZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5n
IFhFTiBib290cy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNp
bmdoQGFybS5jb20+DQo+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPg0KPj4gLS0tDQo+PiBDaGFuZ2UgaW4gdjU6DQo+PiAtIEFkZCBwY2lf
Y2xlYW51cF9tc2kocGRldikgaW4gY2xlYW51cCBwYXJ0Lg0KPj4gLSBBZGRlZCBSZXZpZXdlZC1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gQ2hhbmdl
IGluIHY0Og0KPj4gLSBNb3ZlIGFkZGl0aW9uIG9mIFhFTl9ET01DVExfQ0RGX3ZwY2kgZmxhZyB0
byBzZXBhcmF0ZSBwYXRjaA0KPj4gQ2hhbmdlIGluIHYzOg0KPj4gLSBVc2UgaXNfcGNpX3Bhc3N0
aHJvdWdoX2VuYWJsZWQoKSBpbiBwbGFjZSBvZiBwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCB2YXJp
YWJsZQ0KPj4gLSBSZWplY3QgWEVOX0RPTUNUTF9DREZfdnBjaSBmb3IgeDg2IGluIGFyY2hfc2Fu
aXRpc2VfZG9tYWluX2NvbmZpZygpDQo+PiAtIFJlbW92ZSBJU19FTkFCTEVEKENPTkZJR19IQVNf
VlBDSSkgZnJvbSBoYXNfdnBjaSgpDQo+PiBDaGFuZ2UgaW4gdjI6DQo+PiAtIEFkZCBuZXcgWEVO
X0RPTUNUTF9DREZfdnBjaSBmbGFnDQo+PiAtIG1vZGlmeSBoYXNfdnBjaSgpIHRvIGluY2x1ZGUg
WEVOX0RPTUNUTF9DREZfdnBjaQ0KPj4gLSBlbmFibGUgdnBjaSBzdXBwb3J0IHdoZW4gcGNpLXBh
c3N0aG91Z2ggb3B0aW9uIGlzIGVuYWJsZWQuDQo+PiAtLS0NCj4+IC0tLQ0KPj4geGVuL2FyY2gv
YXJtL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPj4geGVuL2FyY2gvYXJtL2RvbWFpbi5jICAg
ICAgICAgfCAgIDQgKysNCj4+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgIHwgICAzICsN
Cj4+IHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgMTAyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+IHhlbi9hcmNoL2FybS92cGNpLmggICAgICAgICAgIHwgIDM2
ICsrKysrKysrKysrKw0KPj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAgMTggKysr
KysrDQo+PiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAgNyArKy0NCj4+IHhlbi9p
bmNsdWRlL2FzbS14ODYvcGNpLmggICAgIHwgICAyIC0NCj4+IHhlbi9pbmNsdWRlL3B1YmxpYy9h
cmNoLWFybS5oIHwgICA3ICsrKw0KPj4geGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAg
IDIgKw0KPj4gMTAgZmlsZXMgY2hhbmdlZCwgMTc5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS92cGNpLmgNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4gaW5kZXggNDRk
N2NjODFmYS4uZmI5Yzk3NmVhMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmls
ZQ0KPj4gKysrIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+PiBAQCAtNyw2ICs3LDcgQEAgaWZu
ZXEgKCQoQ09ORklHX05PX1BMQVQpLHkpDQo+PiBvYmoteSArPSBwbGF0Zm9ybXMvDQo+PiBlbmRp
Zg0KPj4gb2JqLSQoQ09ORklHX1RFRSkgKz0gdGVlLw0KPj4gK29iai0kKENPTkZJR19IQVNfVlBD
SSkgKz0gdnBjaS5vDQo+PiANCj4+IG9iai0kKENPTkZJR19IQVNfQUxURVJOQVRJVkUpICs9IGFs
dGVybmF0aXZlLm8NCj4+IG9iai15ICs9IGJvb3RmZHQuaW5pdC5vDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBpbmRleCAz
NjEzOGMxYjJlLi5mYmI1MmY3OGYxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bi5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+IEBAIC0zOSw2ICszOSw3IEBA
DQo+PiAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4NCj4+ICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+DQo+
PiANCj4+ICsjaW5jbHVkZSAidnBjaS5oIg0KPj4gI2luY2x1ZGUgInZ1YXJ0LmgiDQo+PiANCj4+
IERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIGN1cnJfdmNwdSk7DQo+PiBAQCAtNzY3LDYg
Kzc2OCw5IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAg
ICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiAocmMgPSBkb21haW5fdnVhcnRfaW5pdChk
KSkgKQ0KPj4gICAgICAgICBnb3RvIGZhaWw7DQo+PiANCj4+ICsgICAgaWYgKCAocmMgPSBkb21h
aW5fdnBjaV9pbml0KGQpKSAhPSAwICkNCj4+ICsgICAgICAgIGdvdG8gZmFpbDsNCj4+ICsNCj4+
ICAgICByZXR1cm4gMDsNCj4+IA0KPj4gZmFpbDoNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IGluZGV4
IGM1YWZiZTJlMDUuLmY0Yzg5YmRlOGMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAg
LTMwNTMsNiArMzA1Myw5IEBAIHZvaWQgX19pbml0IGNyZWF0ZV9kb20wKHZvaWQpDQo+PiAgICAg
aWYgKCBpb21tdV9lbmFibGVkICkNCj4+ICAgICAgICAgZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RP
TUNUTF9DREZfaW9tbXU7DQo+PiANCj4+ICsgICAgaWYgKCBpc19wY2lfcGFzc3Rocm91Z2hfZW5h
YmxlZCgpICkNCj4+ICsgICAgICAgIGRvbTBfY2ZnLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX3Zw
Y2k7DQo+IA0KPiBJIHRoaW5rIEknbSBjb25mdXNlZCB3aXRoIHRoaXMuIFlvdSBzZWVtIHRvIGVu
YWJsZSB2UENJIGZvciBkb20wLCBidXQNCj4gdGhlbiBkb21haW5fdnBjaV9pbml0IHdpbGwgc2V0
dXAgdHJhcHMgZm9yIHRoZSBndWVzdCB2aXJ0dWFsIEVDQU0NCj4gbGF5b3V0LCBub3QgdGhlIG5h
dGl2ZSBvbmUgdGhhdCBkb20wIHdpbGwgYmUgdXNpbmcuDQoNCkkgdGhpbmsgYWZ0ZXIgdGhlIGxh
c3QgZGlzY3Vzc2lvbnMsIGl0IHdhcyBkZWNpZGVkIHRvIGFsc28gaW5zdGFsbGVkIHRoZSB2cGNp
DQpoYW5kbGVyIGZvciBkb20wLiBJIHdpbGwgaGF2ZSB0byBsb29rIGludG8gdGhpcyBhbmQgY29t
ZSBiYWNrIHRvIHlvdS4NCkBPbGVrc2FuZHI6IENvdWxkIHlvdSBjb21tZW50IG9uIHRoaXMuDQoN
Cj4gDQo+PiArDQo+PiAgICAgZG9tMCA9IGRvbWFpbl9jcmVhdGUoMCwgJmRvbTBfY2ZnLCB0cnVl
KTsNCj4+ICAgICBpZiAoIElTX0VSUihkb20wKSB8fCAoYWxsb2NfZG9tMF92Y3B1MChkb20wKSA9
PSBOVUxMKSApDQo+PiAgICAgICAgIHBhbmljKCJFcnJvciBjcmVhdGluZyBkb21haW4gMFxuIik7
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZwY2kuYyBiL3hlbi9hcmNoL2FybS92cGNp
LmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi43NmMxMmI5
MjgxDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBA
QCAtMCwwICsxLDEwMiBAQA0KPj4gKy8qDQo+PiArICogeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4g
KyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQ0KPj4gKyAqIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2Us
IG9yDQo+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+ICsgKg0K
Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdp
bGwgYmUgdXNlZnVsLA0KPj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBl
dmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KPj4gKyAqIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+PiArICovDQo+PiArI2luY2x1
ZGUgPHhlbi9zY2hlZC5oPg0KPj4gKw0KPj4gKyNpbmNsdWRlIDxhc20vbW1pby5oPg0KPj4gKw0K
Pj4gKyNkZWZpbmUgUkVHSVNURVJfT0ZGU0VUKGFkZHIpICAoIChhZGRyKSAmIDB4MDAwMDBmZmYp
DQo+PiArDQo+PiArLyogRG8gc29tZSBzYW5pdHkgY2hlY2tzLiAqLw0KPj4gK3N0YXRpYyBib29s
IHZwY2lfbW1pb19hY2Nlc3NfYWxsb3dlZCh1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQg
bGVuKQ0KPj4gK3sNCj4+ICsgICAgLyogQ2hlY2sgYWNjZXNzIHNpemUuICovDQo+PiArICAgIGlm
ICggbGVuID4gOCApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAgIC8q
IENoZWNrIHRoYXQgYWNjZXNzIGlzIHNpemUgYWxpZ25lZC4gKi8NCj4+ICsgICAgaWYgKCAocmVn
ICYgKGxlbiAtIDEpKSApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAg
IHJldHVybiB0cnVlOw0KPj4gK30NCj4gDQo+IFRoZXJlJ3MgYSB2cGNpX2FjY2Vzc19hbGxvd2Vk
IHdoaWNoIEkgdGhpbmsgeW91IGNvdWxkIGdlbmVyYWxpemUgYW5kDQo+IHVzZSBoZXJlLCB0aGVy
ZSdzIG5vIG5lZWQgdG8gaGF2ZSB0aGlzIGR1cGxpY2F0ZWQgY29kZS4NCg0KSXQgZGVmaW5pdGVs
eSBsb29rcyBleGFjdGx5IGxpa2Ugd2hhdCB3ZSB3YW50IHRvIGRvLg0KDQpJIHdvdWxkIG5lZWQg
dG8gdHVybiB0aGlzIGludG8gYSBzdGF0aWMgaW5saW5lIGFuZCBwdXQgaXQgaW4gc29tZSBnbG9i
YWwgaGVhZGVyLg0KSXQgaXMgY3VycmVudGx5IGluIGFyY2gveDg2L2h2bS9pby5jLCBhbnkgc3Vn
Z2VzdGlvbiBvbiB0aGUgaGVhZGVyIHRvIG1vdmUgaXQgdG8gPw0KDQpSZWdhcmRzDQpCZXJ0cmFu
ZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

