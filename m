Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DA41EC72
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 13:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200579.355102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGy2-00054U-DP; Fri, 01 Oct 2021 11:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200579.355102; Fri, 01 Oct 2021 11:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGy2-00052h-8Q; Fri, 01 Oct 2021 11:44:42 +0000
Received: by outflank-mailman (input) for mailman id 200579;
 Fri, 01 Oct 2021 11:44:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRx5=OV=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mWGy0-00052b-Oy
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 11:44:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f55a7af1-22ac-11ec-bd9d-12813bfff9fa;
 Fri, 01 Oct 2021 11:44:39 +0000 (UTC)
Received: from AM6PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:20b:b2::29)
 by DBAPR08MB5574.eurprd08.prod.outlook.com (2603:10a6:10:1ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 1 Oct
 2021 11:44:35 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::b5) by AM6PR08CA0017.outlook.office365.com
 (2603:10a6:20b:b2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 11:44:35 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 11:44:35 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Fri, 01 Oct 2021 11:44:30 +0000
Received: from 4e00c071d7da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5840AD74-C597-428A-86EE-CDDCA7D11CF0.1; 
 Fri, 01 Oct 2021 11:44:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e00c071d7da.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Oct 2021 11:44:19 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3240.eurprd08.prod.outlook.com (2603:10a6:209:49::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 11:44:17 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 11:44:15 +0000
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
X-Inumbo-ID: f55a7af1-22ac-11ec-bd9d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww3YhWzFzgwNJME0fXWreJsT0pyiJ/loE2Ammw1ruaw=;
 b=blRD9+ABtYjgjGfyfpdRDYLAzrWlRxCulxvrCuD+cxrEeNTuk5EeMJvfvS5mIuFxsKS9Zo1KtShf6HvMWvpw/H1GiAKIAbDJEOtyMQLXkJ4nCvJtTJyezCv0RrqD1m/rtc39fbjpqd/ecNF/UlqPWZr7fwzBkKFPgCqszApF6LI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b744de02b018b1ed
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS8K3w79/GOdCftEwneko+uRNDapI7sxKAg3LzfNkhLgrqDkEiwCjnfEhaWjGCgLTSP9O//nWduh9aStU7fKN5KvesOKH5XahEg1JunQ5zMcnH3HK8MVrl5ap808z5kV+d4TA+YuyBB15ts5vmf6yr3S8rav1Juf1sW/H2gXkme/429ZNrMZr4M1Jp1wCUckR644o8Acgkn7PKn1i6UnYLS0zGA6Yz9G3ae/3Z6tu4BOZd1yDa+7AywsyxLOYtaKj2mrYKLH0/1bKox56MG+NqwK+uuEWSs+/QpE4rJLBx0Rloo2Zx1ybJk9TYrbLiWNTLWyy9wdqs4iLN73Aztp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww3YhWzFzgwNJME0fXWreJsT0pyiJ/loE2Ammw1ruaw=;
 b=LEopWJr5+2vzbgC2nN71ki/ZvCYUZdfr5FJRftmaHJ2uRXUC/29lwc6kvNgDzC+NxqfFY3a/YZHRMIfM9/85/QiXeS+i9D/dfze2+cHMNpvipMlT+Uqb0X1StEFLIYRTjNr80NiEg2SR9ZemIt3gzh8oggHl+dwQBafwaHjpAgD6O9rsJ+KDcDP1SsvdwBgSoMMQH2YvPPG7crMsrwDFgInmX5ZBit92nOE8dYMwxjtMHYPwbix3i2fxJsLs1PNPAsDExJF58YXqPwiR61PTxJx646PKmH+aP28xtueZbcO8zxDZqX9fJ1uO9z5qQUt3717rQ25IkKm0heOyKy85mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww3YhWzFzgwNJME0fXWreJsT0pyiJ/loE2Ammw1ruaw=;
 b=blRD9+ABtYjgjGfyfpdRDYLAzrWlRxCulxvrCuD+cxrEeNTuk5EeMJvfvS5mIuFxsKS9Zo1KtShf6HvMWvpw/H1GiAKIAbDJEOtyMQLXkJ4nCvJtTJyezCv0RrqD1m/rtc39fbjpqd/ecNF/UlqPWZr7fwzBkKFPgCqszApF6LI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v3 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXtJX8zP5xkk7akk+L97tLPArIN6u8s9KAgAFWUgA=
Date: Fri, 1 Oct 2021 11:44:15 +0000
Message-ID: <F537F4D7-A4D3-45D4-9A0C-AB573CAA724A@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <d7f62249e6aa7b33017ef707d6bc451b5e2c7047.1632847120.git.rahul.singh@arm.com>
 <491a49c0-d609-c122-f64a-999b16ef3a83@suse.com>
In-Reply-To: <491a49c0-d609-c122-f64a-999b16ef3a83@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c8371f53-286e-4494-fe70-08d984d0d776
x-ms-traffictypediagnostic: AM6PR08MB3240:|DBAPR08MB5574:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5574111F35BC6E2D4C3A3F8CFCAB9@DBAPR08MB5574.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZtiPnpb1Nysi9OjwylNdfxV9UwC+diaLbGM7LJ9gO8u2SOUKQgHTT66bxMBiXqsmjx+bkiRUfYHm2BweYt1bI0WbKII+uynQabk8+zex3MDvuBfZw2ziF1auD9lOOIziLrxyqsOnVSUQw7xYjCRTdxk0iNq5nwm2cj/JMjXPqb+iHvR29mc7BhqLkQTwHhXnfFRi1LrBb6oXvZzvv74Fc3Md5G1Mw5LvjvspHJw5g2/TQCMfdMRpJAnbLoS+IOXaNQh2Y3sGDwk47CuFQFd/xJ6+JiZtzgtA+4AD9pDf+QwrKrN2uXN94a79OC6JxS+imgGFBK8IBfxU/6iI9lrYVXb3sH+TIysCrsX59/GOyXHBTRqtISxajq4oBgu81SKyArjPSoYcZYXEzY6Y3ro5zOUz36NEGXRB0JFQ4jRdfvrrI0tmxOmgdypYxdYH0MLqje1FRg7jnFp0XLF/B0+9P2iowqA9wf0rWM1Okw7rg4hF5S19hpD3dJ0PjlriSQqLA+nI1QRaXWJl0ZevHeNcXNt8Tg4uktQL1l6ZqfbC5VjB2c2SdkotF+2pj7f79rftOaChhe1SXK5FoQjRrOpK8wYmGm+ghs6Zz7eCzBaZn96lfoGXmLsU7ZpbBDeiAGmJECYd6bqoP2onSUh8v1MIcQxETmVFwDlHzu3NYOQrvp+EQnRNQ0BFv1wqrxrRmIaR1xRjhJEKMS4aH7MaYeZ9Jm8pzGLWzXm9BC5MBj0i1Ya6qfyQg1fqg4Hk8S0WMpJt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(2906002)(6512007)(6506007)(6486002)(53546011)(66946007)(26005)(8676002)(33656002)(36756003)(54906003)(38070700005)(6916009)(66556008)(66476007)(186003)(66446008)(64756008)(2616005)(4326008)(7416002)(71200400001)(76116006)(91956017)(38100700002)(8936002)(5660300002)(316002)(86362001)(508600001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <126C29721BD71F438D187BF1D1CCDE59@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3240
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6de3438-0147-410c-328e-08d984d0cb9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HNaarUwf3xYb1GtpeHATDP5pcAzsjq91VIPJm2GYe7WaFuu9waprdbe7Enbr7hnzDnXPr3SZcrfo26yatroYAIf973BYlWZPGAtOysxWB1r9cCp9htNCsaIqhmaavsQxEM87AC0vugPkf9kveMx2Kqobv4EcRGgmqWwOjvEEru2pfVBODngyKRbFdTk+kyW3EXAHbM+SioeWvbDMrhfa6YmWFbDD10I8+/wsStsVe0SPfxaNdpGtIvi9307VozyNUJj5yuEJnaHs0FFC8Y1EDhQAMSAAn2tDY0/DMKVNXRBBx3NfDmP6TOoOZNez8KYhgouTyoKMr5yVWLJr9KnV5VHL+mDuwqKgjQfjK/VkzAicuWY4HntdGFbk2zjh/EyVX7+4u5yfa7bVnVehe/f/73k7YM99hAZM+2eAcIqDez0tV1vtgMRWUbWlwFodpkz+a2dov/a+XVGwhEp8J2qs3rMBBEwvDBcy+2ccMKE8fHH7kmR/oBSfzndGKWsUfdKhQJGVSbmzTT5U3XhpPJIYTMl01FYA+SC+4Xn8QE2+ax6EGUrwfQFwvWvZ8cHGEJ2XNx4hW7Khbl6OeMPEkzVZJwE03TIf1U7ZmMbZHE9murnyJr9dwhdrYWqTdKmNYPAK7ti85BAGBmXolXHluj2fnB2nphGQXSHR9x2tuKO/2dEYsa1BmE1PmeW/LOahRqBDNjVqI8X0fKZlnoFImJE30w==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(6486002)(316002)(6512007)(26005)(8936002)(36860700001)(5660300002)(6862004)(8676002)(6506007)(53546011)(36756003)(83380400001)(508600001)(82310400003)(2616005)(33656002)(86362001)(81166007)(186003)(47076005)(70586007)(54906003)(2906002)(4326008)(336012)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 11:44:35.1750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8371f53-286e-4494-fe70-08d984d0d776
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5574

SGkgSmFuLA0KDQo+IE9uIDMwIFNlcCAyMDIxLCBhdCA0OjE5IHBtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMDkuMjAyMSAyMDoxOCwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBUaGUgZXhpc3RpbmcgVlBDSSBzdXBwb3J0IGF2YWlsYWJsZSBmb3Ig
WDg2IGlzIGFkYXB0ZWQgZm9yIEFybS4NCj4+IFdoZW4gdGhlIGRldmljZSBpcyBhZGRlZCB0byBY
RU4gdmlhIHRoZSBoeXBlciBjYWxsDQo+PiDigJxQSFlTREVWT1BfcGNpX2RldmljZV9hZGTigJ0s
IFZQQ0kgaGFuZGxlciBmb3IgdGhlIGNvbmZpZyBzcGFjZQ0KPj4gYWNjZXNzIGlzIGFkZGVkIHRv
IHRoZSBYZW4gdG8gZW11bGF0ZSB0aGUgUENJIGRldmljZXMgY29uZmlnIHNwYWNlLg0KPj4gDQo+
PiBBIE1NSU8gdHJhcCBoYW5kbGVyIGZvciB0aGUgUENJIEVDQU0gc3BhY2UgaXMgcmVnaXN0ZXJl
ZCBpbiBYRU4NCj4+IHNvIHRoYXQgd2hlbiBndWVzdCBpcyB0cnlpbmcgdG8gYWNjZXNzIHRoZSBQ
Q0kgY29uZmlnIHNwYWNlLFhFTg0KPj4gd2lsbCB0cmFwIHRoZSBhY2Nlc3MgYW5kIGVtdWxhdGUg
cmVhZC93cml0ZSB1c2luZyB0aGUgVlBDSSBhbmQNCj4+IG5vdCB0aGUgcmVhbCBQQ0kgaGFyZHdh
cmUuDQo+IA0KPiBBbGwgb2YgdGhpcyBpcyBqdXN0IGZvciBEb20wLCBJIHVuZGVyc3RhbmQ/IENv
dWxkIHlvdSBzYXkgc28sIHBlcmhhcHMNCj4gYWxyZWFkeSBpbiB0aGUgdGl0bGU/DQo+IA0KDQpE
T01VIGd1ZXN0IHdpbGwgYWxzbyB1c2UgdGhlIHNhbWUgVlBDSSBoYW5kbGVyLiBXaGVuIHdlIGFz
c2lnbiB0aGUgUENJIGRldmljZXMgdG8gRE9NVSBndWVzdHMNClhFTiB3aWxsIGRlcmVnaXN0ZXIg
dGhlIFZQQ0kgaGFuZGxlciBmcm9tIERPTTAgYW5kIHJlZ2lzdGVyIGl0IGZvciBET01VIGd1ZXN0
cy4gDQoNCg0KPj4gRm9yIERvbTBsZXNzIHN5c3RlbXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdvdWxk
IGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+PiBQQ0kgZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBo
YW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5nIFhFTiBib290cy4NCj4gDQo+IFNvICJ3b3VsZCBi
ZSIgaGVyZSBtZWFucyBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUsIHJhdGhlciB0aGFuDQo+
IGJlZm9yZSBvciBpbiB0aGlzIHBhdGNoPyBUaGlzIGNvdWxkIGRvIHdpdGggbWFraW5nIHVuYW1i
aWd1b3VzLg0KDQpZZXMgd2UgYXJlIGN1cnJlbnRseSB3b3JraW5nIG9uIHRvIGltcGxlbWVudCBz
dXBwb3J0IGZvciBEb20wbGVzcy4gSSB0aG91Z2h0IGl0IGlzIGdvb2QgDQp0byBtZW50aW9uIGhl
cmUgaG93IHdlIGdvaW5nIHRvIGFkZCB0aGUgdnBjaV9oYW5kbGVyKC4uKSBmb3IgRG9tMGxlc3Mg
c3lzdGVtLiAgDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+PiArKysgYi94
ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4+IEBAIC02NjIsNiArNjYyLDEyIEBAIGludCBhcmNoX3Nh
bml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25m
aWcpDQo+PiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gICAgIH0NCj4+IA0KPj4gKyAgICBp
ZiAoIGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl92cGNpICkNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlZQQ0kgbm90IHN1cHBvcnRlZFxuIik7DQo+
IA0KPiBUaGlzIGlzIGEgbWlzbGVhZGluZyBtZXNzYWdlLCBhdCBsZWFzdCBpZiBmb3Igc29tZSBy
ZWFzb24gaXQgd2FzIHRvDQo+IHRyaWdnZXIgZm9yIERvbTAuIEJ1dCBkb3duIHRoZSByb2FkIHBl
cmhhcHMgYWxzbyBmb3IgRG9tVSwgYXMgSSBjb3VsZA0KPiBpbWFnaW5lIHZQQ0kgdG8gZ2V0IGVu
YWJsZWQgYWxvbmdzaWRlIHBhc3N0aHJvdWdoIHJhdGhlciB0aGFuIHZpYSBhDQo+IHNlcGFyYXRl
IGNvbnRyb2wuDQoNCkNhbiBJIHNpbGVudGx5IHJlamVjdCB0aGUgZmxhZyBvciBkbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbiBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQo+PiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMNCj4+IEBAIC03NjcsNiArNzY3LDE4IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYg
c2VnLCB1OCBidXMsIHU4IGRldmZuLA0KPj4gICAgIGVsc2UNCj4+ICAgICAgICAgaW9tbXVfZW5h
YmxlX2RldmljZShwZGV2KTsNCj4+IA0KPj4gKyNpZmRlZiBDT05GSUdfQVJNDQo+PiArICAgIC8q
DQo+PiArICAgICAqIE9uIEFSTSBQQ0kgZGV2aWNlcyBkaXNjb3Zlcnkgd2lsbCBiZSBkb25lIGJ5
IERvbTAuIEFkZCB2cGNpIGhhbmRsZXIgd2hlbg0KPj4gKyAgICAgKiBEb20wIGluZm9ybSBYRU4g
dG8gYWRkIHRoZSBQQ0kgZGV2aWNlcyBpbiBYRU4uDQo+PiArICAgICAqLw0KPj4gKyAgICByZXQg
PSB2cGNpX2FkZF9oYW5kbGVycyhwZGV2KTsNCj4+ICsgICAgaWYgKCByZXQgKSB7DQo+IA0KPiBO
aXQ6IFN0eWxlLg0KQWNrLg0KPiANCj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJzZXR1
cCBvZiB2UENJIGZvciBmYWlsZWQ6ICVkXG4iLHJldCk7DQo+IA0KPiBOaXQ6IFN0eWxlIGFnYWlu
Lg0KDQpBY2suDQo+IA0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+IA0KPiBObyBvdGhlciBlcnJv
ciBoYW5kbGluZyAoY2xlYW51cCk/DQo+IA0KDQpJIHdpbGwgYWRkIHRoZSBiZWxvdyBlcnJvciBo
YW5kbGluZyBuZXh0IHZlcnNpb24gOg0KDQojZGVmaW5lIENPTkZJR19BUk0NCnJldCA9IHZwY2lf
YWRkX2hhbmRsZXJzKHBkZXYpOw0KaWYgKCByZXQgKSANCnsNCiAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgInNldHVwIG9mIHZQQ0kgZm9yIGZhaWxlZDogJWRcbuKAnSwgcmV0KTsNCiAgICAgICAg
aW9tbXVfcmVtb3ZlX2RldmljZShwZGV2KTsNCiAgICAgICAgaWYgKCBwZGV2LT5kb21haW4gKQ0K
ICAgICAgICAgICBsaXN0X2RlbCgmcGRldi0+ZG9tYWluX2xpc3QpOw0KICAgICAgICBmcmVlX3Bk
ZXYocHNlZywgcGRldik7DQogICAgICAgIGdvdG8gb3V0Ow0KfQ0KI2VuZGlmDQoNCj4+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vZG9tYWluLmgNCj4+IEBAIC0yNjIsNyArMjYzLDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBh
cmNoX3ZjcHVfYmxvY2soc3RydWN0IHZjcHUgKnYpIHt9DQo+PiANCj4+ICNkZWZpbmUgYXJjaF92
bV9hc3Npc3RfdmFsaWRfbWFzayhkKSAoMVVMIDw8IFZNQVNTVF9UWVBFX3J1bnN0YXRlX3VwZGF0
ZV9mbGFnKQ0KPj4gDQo+PiAtI2RlZmluZSBoYXNfdnBjaShkKSAgICAoeyAodm9pZCkoZCk7IGZh
bHNlOyB9KQ0KPj4gKy8qDQo+PiArICogRm9yIFg4NiBWUENJIGlzIGVuYWJsZWQgYW5kIHRlc3Rl
ZCBmb3IgUFZIIERPTTAgb25seSBidXQNCj4+ICsgKiBmb3IgQVJNIHdlIGVuYWJsZSBzdXBwb3J0
IFZQQ0kgZm9yIGd1ZXN0IGRvbWFpbiBhbHNvLg0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgaGFzX3Zw
Y2koZCkgKCh2b2lkKShkKSwgXA0KPj4gKyAgICAgICAgZXZhbHVhdGVfbm9zcGVjKGQtPm9wdGlv
bnMgJiBYRU5fRE9NQ1RMX0NERl92cGNpKSkNCj4gDQo+IFdoeSB0aGUgKHZvaWQpKGQpPyBJbnN0
ZWFkIHlvdSB3YW50IHRvIHBhcmVudGhlc2l6ZSB0aGUgb3RoZXIgdXNlIG9mIGQuDQoNCkkgd2ls
bCBtb2RpZnkgYXMgYmVsb3c6DQojZGVmaW5lIGhhc192cGNpKGQpIChldmFsdWF0ZV9ub3BzZWMo
KGQpLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfdnBjaSkpDQoNCg0KPiBKYW4NCj4gDQogDQpS
ZWdhcmRzLA0KUmFodWwNCg0KDQo=

