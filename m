Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CB1696029
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 11:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495103.765363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRs9N-0000Xh-1p; Tue, 14 Feb 2023 10:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495103.765363; Tue, 14 Feb 2023 10:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRs9M-0000V3-UF; Tue, 14 Feb 2023 10:03:00 +0000
Received: by outflank-mailman (input) for mailman id 495103;
 Tue, 14 Feb 2023 10:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anql=6K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pRs9L-0000Ux-7V
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 10:02:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c150f698-ac4e-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 11:02:57 +0100 (CET)
Received: from AM5PR0701CA0017.eurprd07.prod.outlook.com
 (2603:10a6:203:51::27) by AM9PR08MB6067.eurprd08.prod.outlook.com
 (2603:10a6:20b:287::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 10:02:27 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::17) by AM5PR0701CA0017.outlook.office365.com
 (2603:10a6:203:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9 via Frontend
 Transport; Tue, 14 Feb 2023 10:02:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24 via Frontend Transport; Tue, 14 Feb 2023 10:02:26 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Tue, 14 Feb 2023 10:02:26 +0000
Received: from dada6411ca7b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD08B0A1-3EB7-441F-8E2B-CC67B17C3536.1; 
 Tue, 14 Feb 2023 10:02:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dada6411ca7b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Feb 2023 10:02:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB7797.eurprd08.prod.outlook.com (2603:10a6:150:5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 10:02:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a%4]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 10:02:14 +0000
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
X-Inumbo-ID: c150f698-ac4e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWHrjZzJLOijSsGjJVv30G49BiGBRquzjp/IqgRSwck=;
 b=mk2AZKmOcm3h7TfCiJbqO5Nd7iw06ed7u+6UwxSKZnUHJVpLliwR3GXjyZIhvnkqasNPxV21laoKjxrCb5yoaY0dMK6b49x7a+5TSojOdtX5KB5g2qFdT07CI/N7Sl+swMzYotIIzK6pB9xy/jdVUkTv34cfqzniwwP2+tuMEec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1d8723a0712cd24
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxQw1KU0CEQgEUhsMYmdsvzSihGT6qrcc5gCJP8EssbDRNYTvVGKODU1Whr7XCxEydBwrXOHx/ylEvG2ijFpzNXysGdKH+noMV46RZFM1JHJYSbowSVOujbHNpQtWUFoGYW7+ki48cw7VmLBS3ht/yT/VPYufVwQJVb99HnwV6cBv4dcHfxbiQuBOg4n1kzEAl67ukApBvQ3hT0ekTc6gMoxoOin1M13GCYLFDuHlFhOCPRGJEkl83QTzmbQ/lAuKUP1FCQH6XnyL8B6Dvo/MDKJ52klY1jOmOID3XOj77cQyzkkgrOFKceuNhCkmpdUaaRjSItsTxydRA/9hTvfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWHrjZzJLOijSsGjJVv30G49BiGBRquzjp/IqgRSwck=;
 b=YY3eC8SWlaA2RH21JGzIGoGvsgIRFUuzwRJPSQaDUtsF1KR4PigE7EaSzGezjwN1Ooi/OIV1ZmAstVELIYajCV9CMhenDZF9UkWLcqUJ4yuYxLsn5TE945ZHleojOiFcAvg3bKLaSwg31UAU1A+tjGQjD8QDhZVGVfXQE2osGtW31ibkaFn44CgYgnPWax9MetPe0wNPsSrUL89I3TMKufyhNppPG8umjBOyyGL8ZYWX9KmqRo1WT76ZjZPO93S9sOnjtK5SXYA6GtpSGhFWyCORj4+d2yAumgOtiDt6E5MqxLQjWD02sRnBiSAA8JvlSqFfX8ounXVF2T9lbtChgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWHrjZzJLOijSsGjJVv30G49BiGBRquzjp/IqgRSwck=;
 b=mk2AZKmOcm3h7TfCiJbqO5Nd7iw06ed7u+6UwxSKZnUHJVpLliwR3GXjyZIhvnkqasNPxV21laoKjxrCb5yoaY0dMK6b49x7a+5TSojOdtX5KB5g2qFdT07CI/N7Sl+swMzYotIIzK6pB9xy/jdVUkTv34cfqzniwwP2+tuMEec=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/cppcheck: add a way to exclude files from the
 scan
Thread-Topic: [PATCH 1/2] xen/cppcheck: add a way to exclude files from the
 scan
Thread-Index: AQHZQFJldh/RodYIGE6PF+KtzbPV1a7OMzSAgAAC6wA=
Date: Tue, 14 Feb 2023 10:02:13 +0000
Message-ID: <F04B52BE-03A9-4EC0-81AF-3D4066FF5DDA@arm.com>
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
 <20230214085635.3170962-2-luca.fancellu@arm.com>
 <4d86325f-8706-98d1-c233-963fd42076fa@suse.com>
In-Reply-To: <4d86325f-8706-98d1-c233-963fd42076fa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB7797:EE_|AM7EUR03FT013:EE_|AM9PR08MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 0132e4ab-16b2-4868-0a81-08db0e729399
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UVJXn495K/M8nTu2dbDvExx1e746KDTrNJWixYmLToxfOl1M7OUyUpjaLBu7PmZ8Yr4G++wyOleTZgoIUI18yleHqibG2WNKMYhwjsrjbHjFj4N0T2kteLgtCAx7lJ9lGtCym7PDpZ4qWJSCIbWepdMgj5akYmKm3SgqZtpA5StliaTdZc3AiWQi1fOFvigZlCVCjKpg2VS1zRg5hq93slularRa2rTJoawPwwTS82NqvO20aCxCJoLkonZS2RJtac3ZKE/9WINMwxesUVYTJJtG+wZUyoYgko7WqLja5iShOkvxXQQp3j9FgAiBXU+Sh7ZUIdng/Zvt/tIXDDtUDEvpvBPI6qXqt8PrkEmWNo4vaqUg6tmN8KPbDTsrb01qAh0RAvGMji2fpgBriIoKaBlmrfsG5LmMYHAwUmdxcZJtamwyp2smaLlN0FA4P/cEY0G28FqCbcoyfFRwdFYmlbIKSGltC4QzI2dp6z5aZ+/LPZFX0PIC36gpLzoTos/9i8Fg1hXTsxxC9gb+fGdlHAC+JYE5omqvKsf83O+niD9pTUBgwkaVlvwnLZnmAkhOqZIxFWCSeAPSz4AfCjd5nqYCP2ImFIlOIojxmMR9/6X0/oQF5VetOLIUiV6rdIzhmaHahvMna2lGzAZtmn0uaoSa+mNstsAoQlMdC5T4k3NjY7aGpBhUdj5kKf1rkuHfoX6ZJ9FGSO+siXKmuLOL32kSATLmmC9XYnDDkwFS5xflr1s+ZFkO+2GG1rfy57Bi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(66899018)(83380400001)(53546011)(6506007)(71200400001)(33656002)(36756003)(2906002)(38070700005)(38100700002)(54906003)(478600001)(4326008)(2616005)(8676002)(66476007)(66446008)(64756008)(6916009)(41300700001)(66556008)(6486002)(26005)(6512007)(186003)(66946007)(5660300002)(8936002)(122000001)(316002)(91956017)(86362001)(76116006)(43043002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <06F17D08E5EAD94891893ACAF49B812E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7797
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d511fe1a-2014-45ce-6784-08db0e728bc4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ySuhFf/NIefLSkZyuWXcuMu9z1OptZM6dBsjxQwp1ceCF0NC+tRj728GqfA7ij+scjFuh3HUSK9YrTEKB/2wILQ8ZzgSxrlCPvYOiEftUCEwePg3EI6hKQtiRTxVrvY5LzheBDP0PNYkf7IphfSxGPOecVU3YtGMQnp93TEvIMbdC61XCl6yiEk2lPKYdWPZC4FFpNz6EEOIeAL2DAIsj8bxkviGPQkLmTrVGsxbFu/zz16QXLvI9YGli3fUS28lEew2t1QpGAsDOhKZEjif5fe+DU07HtF6zb6lYsjVCCv9zr4bXYQp6r6XLf5KoPZ6Ep62g+hKLkIwzGgEWECrhfOlKnLtNONVJ24L45NaEtiNDcr8Vc+6C+v1kD1u51z/6mQPgZp/RcHFqzKbH0qDZRnQv/AxHaJEIlA9HO7B0Sxmeb2jAbyQxgdnojRJG4bccCk2lTqZ5kh9mzl3JEPzVY/8PmBE/6VQklbVpB4OQO1o1YVxeNuJU2rjD6meFnBwmk3Wo0vwj/rWgSURwtInfkneTylfJH5ELZLSq9kFLVZYtbKP9XdADq8LC5mE7jlO5H/JnRBAiwQKUvavDLS6O2UUQsxU3rGb/Z9ZgnDBQcVxERxgzG5JheE93yWQtx9Y/ruVwsY6yNsrjZS94w2i1SgyRnYYNJNwos1uuYNuNYiRlsclgpl992UH+2QWkBsnClolaFgXF8+Ur6v4zdft2N3PCc2jJEbOIAdw1adlf8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(478600001)(356005)(33656002)(36756003)(40480700001)(40460700003)(82310400005)(86362001)(336012)(2616005)(316002)(83380400001)(54906003)(6506007)(53546011)(47076005)(6512007)(186003)(26005)(6486002)(8936002)(6862004)(66899018)(2906002)(5660300002)(82740400003)(36860700001)(70586007)(8676002)(70206006)(81166007)(4326008)(41300700001)(43043002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 10:02:26.7617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0132e4ab-16b2-4868-0a81-08db0e729399
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6067

DQoNCj4gT24gMTQgRmViIDIwMjMsIGF0IDA5OjUxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTQuMDIuMjAyMyAwOTo1NiwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEFkZCBhIHdheSB0byBleGNsdWRlIGZpbGVzIGZyb20gdGhlIHNjYW4sIGluIHRo
aXMgd2F5IHdlIGNhbiBza2lwDQo+PiBzb21lIGZpbmRpbmdzIGZyb20gdGhlIHJlcG9ydCBvbiB0
aG9zZSBmaWxlcyB0aGF0IFhlbiBkb2Vzbid0IG93bi4NCj4+IA0KPj4gVG8gZG8gdGhhdCwgaW50
cm9kdWNlIHRoZSBleGNsdWRlLWxpc3QuanNvbiBmaWxlIHVuZGVyIGRvY3MvbWlzcmEsDQo+PiB0
aGlzIGZpbGUgd2lsbCBiZSBwb3B1bGF0ZWQgd2l0aCByZWxhdGl2ZSBwYXRoIHRvIHRoZSBmaWxl
cy9mb2xkZXINCj4+IHRvIGJlIGV4Y2x1ZGVkLg0KPj4gSW50cm9kdWNlIGEgbmV3IG1vZHVsZSwg
ZXhjbHVzaW9uX2ZpbGVfbGlzdC5weSwgdG8gZGVhbCB3aXRoIHRoZQ0KPj4gZXhjbHVzaW9uIGxp
c3QgZmlsZSBhbmQgdXNlIHRoZSBuZXcgbW9kdWxlIGluIGNwcGNoZWNrX2FuYWx5c2lzLnB5DQo+
PiB0byB0YWtlIGEgbGlzdCBvZiBleGNsdWRlZCBwYXRocyB0byB1cGRhdGUgdGhlIHN1cHByZXNz
aW9uIGxpc3Qgb2YNCj4+IGNwcGNoZWNrLg0KPj4gTW9kaWZpZWQgLS1zdXBwcmVzcyBmbGFnIGZv
ciBjcHBjaGVjayB0b29sIHRvIHJlbW92ZQ0KPj4gdW5tYXRjaGVkU3VwcHJlc3Npb24gZmluZGlu
Z3MgZm9yIHRob3NlIGV4dGVybmFsIGZpbGUgdGhhdCBhcmUNCj4+IGxpc3RlZCBidXQgZm9yIGV4
YW1wbGUgbm90IGJ1aWx0IGZvciB0aGUgY3VycmVudCBhcmNoaXRlY3R1cmUuDQo+PiANCj4+IEFk
ZCBkb2N1bWVudGF0aW9uIGZvciB0aGUgZmlsZS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+PiBkb2NzL21pc3Jh
L2V4Y2x1ZGUtbGlzdC5qc29uICAgICAgICAgICAgICAgICAgfCAgNCArDQo+PiBkb2NzL21pc3Jh
L2V4Y2x1ZGUtbGlzdC5yc3QgICAgICAgICAgICAgICAgICAgfCA0NCArKysrKysrKysrKw0KPj4g
eGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2NwcGNoZWNrX2FuYWx5c2lzLnB5IHwgMjEgKysrKy0N
Cj4+IC4uLi94ZW5fYW5hbHlzaXMvZXhjbHVzaW9uX2ZpbGVfbGlzdC5weSAgICAgICB8IDc5ICsr
KysrKysrKysrKysrKysrKysNCj4+IDQgZmlsZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9taXNyYS9leGNsdWRl
LWxpc3QuanNvbg0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvbWlzcmEvZXhjbHVkZS1saXN0
LnJzdA0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9leGNs
dXNpb25fZmlsZV9saXN0LnB5DQo+IA0KPiBBcyBJIHRoaW5rIEkgaGF2ZSBhc2tlZCBmb3IgYmVm
b3JlOiBDYW4gbmV3IGZpbGVzIHBsZWFzZSBhdm9pZCB1bmRlcnNjb3Jlcw0KPiBpbiB0aGVpciBu
YW1lcywgd2hlbiBkYXNoZXMgZG8gcXVpdGUgZmluZT8gT3IgZG9lcyBQeXRob24gaGF2ZSBzcGVj
aWFsDQo+IHJlc3RyaWN0aW9ucz8NCg0KRnJvbSB0aGUgcHl0aG9uIGNvZGluZyBzdHlsZToNCg0K
TW9kdWxlcyBzaG91bGQgaGF2ZSBzaG9ydCwgYWxsLWxvd2VyY2FzZSBuYW1lcy4gVW5kZXJzY29y
ZXMgY2FuIGJlIHVzZWQgaW4NCnRoZSBtb2R1bGUgbmFtZSBpZiBpdCBpbXByb3ZlcyByZWFkYWJp
bGl0eS4gUHl0aG9uIHBhY2thZ2VzIHNob3VsZCBhbHNvIGhhdmUNCnNob3J0LCBhbGwtbG93ZXJj
YXNlIG5hbWVzLCBhbHRob3VnaCB0aGUgdXNlIG9mIHVuZGVyc2NvcmVzIGlzIGRpc2NvdXJhZ2Vk
Lg0KDQpJbiB0aGlzIGNhc2UgSSB0aGluayBpdCBpbXByb3ZlcyByZWFkYWJpbGl0eQ0KDQo+IA0K
Pj4gLS0tIGEveGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2NwcGNoZWNrX2FuYWx5c2lzLnB5DQo+
PiArKysgYi94ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvY3BwY2hlY2tfYW5hbHlzaXMucHkNCj4+
IEBAIC0xLDcgKzEsOCBAQA0KPj4gIyEvdXNyL2Jpbi9lbnYgcHl0aG9uMw0KPj4gDQo+PiBpbXBv
cnQgb3MsIHJlLCBzaHV0aWwNCj4+IC1mcm9tIC4gaW1wb3J0IHNldHRpbmdzLCB1dGlscywgY3Bw
Y2hlY2tfcmVwb3J0X3V0aWxzDQo+PiArZnJvbSAuIGltcG9ydCBzZXR0aW5ncywgdXRpbHMsIGNw
cGNoZWNrX3JlcG9ydF91dGlscywgZXhjbHVzaW9uX2ZpbGVfbGlzdA0KPj4gK2Zyb20gLmV4Y2x1
c2lvbl9maWxlX2xpc3QgaW1wb3J0IEV4Y2x1c2lvbkZpbGVMaXN0RXJyb3INCj4+IA0KPj4gY2xh
c3MgR2V0TWFrZVZhcnNQaGFzZUVycm9yKEV4Y2VwdGlvbik6DQo+PiAgICAgcGFzcw0KPj4gQEAg
LTUwLDYgKzUxLDIyIEBAIGRlZiBfX2dlbmVyYXRlX3N1cHByZXNzaW9uX2xpc3Qob3V0X2ZpbGUp
Og0KPj4gICAgICAgICAgICAgIyBoZWFkZXIgZm9yIGNwcGNoZWNrDQo+PiAgICAgICAgICAgICBz
dXBwbGlzdF9maWxlLndyaXRlKCIqOipnZW5lcmF0ZWQvY29tcGlsZXItZGVmLmhcbiIpDQo+PiAN
Cj4+ICsgICAgICAgICAgICB0cnk6DQo+PiArICAgICAgICAgICAgICAgIGV4Y2x1c2lvbl9maWxl
ID0gXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgInt9L2RvY3MvbWlzcmEvZXhjbHVkZS1saXN0
Lmpzb24iLmZvcm1hdChzZXR0aW5ncy5yZXBvX2RpcikNCj4+ICsgICAgICAgICAgICAgICAgZXhj
bHVzaW9uX2xpc3QgPSBcDQo+PiArICAgICAgICAgICAgICAgICAgICBleGNsdXNpb25fZmlsZV9s
aXN0LmxvYWRfZXhjbHVzaW9uX2ZpbGVfbGlzdChleGNsdXNpb25fZmlsZSkNCj4+ICsgICAgICAg
ICAgICBleGNlcHQgRXhjbHVzaW9uRmlsZUxpc3RFcnJvciBhcyBlOg0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgcmFpc2UgQ3BwY2hlY2tEZXBzUGhhc2VFcnJvcigNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIklzc3VlIHdpdGggcmVhZGluZyBmaWxlIHt9OiB7fSINCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5mb3JtYXQoZXhjbHVzaW9uX2ZpbGUsIGUpDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICApDQo+IA0KPiBNeSBQeXRob24gaXNuJ3QgdmVy
eSBnb29kLCBidXQgaXNuJ3QgaW5kZW50YXRpb24gb25lIGxldmVsIHRvbyBkZWVwDQo+IGhlcmU/
DQoNCkdvb2QgY2F0Y2gsIEnigJlsbCBmaXggaXQNCg0KPiANCj4gSmFuDQoNCg0K

