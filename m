Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C470786D94
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 13:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589984.922072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8Mb-0001C0-TP; Thu, 24 Aug 2023 11:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589984.922072; Thu, 24 Aug 2023 11:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8Mb-00019f-Pl; Thu, 24 Aug 2023 11:18:57 +0000
Received: by outflank-mailman (input) for mailman id 589984;
 Thu, 24 Aug 2023 11:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPn2=EJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qZ8Ma-00019Z-8R
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 11:18:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 025a0c11-4270-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 13:18:54 +0200 (CEST)
Received: from AM0PR04CA0060.eurprd04.prod.outlook.com (2603:10a6:208:1::37)
 by PAWPR08MB9066.eurprd08.prod.outlook.com (2603:10a6:102:342::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 11:18:51 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1:cafe::70) by AM0PR04CA0060.outlook.office365.com
 (2603:10a6:208:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 11:18:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.17 via Frontend Transport; Thu, 24 Aug 2023 11:18:50 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Thu, 24 Aug 2023 11:18:50 +0000
Received: from 8b88c1f03dfe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13A2CD84-606E-4F0F-ABE5-058DE5CA2FEE.1; 
 Thu, 24 Aug 2023 11:18:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b88c1f03dfe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Aug 2023 11:18:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8320.eurprd08.prod.outlook.com (2603:10a6:150:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 11:18:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:18:34 +0000
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
X-Inumbo-ID: 025a0c11-4270-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E2YycaUmRjglDnO14BI3Olfi3l6vYkXLEaDHaGO4lw=;
 b=Ww1h6/oJ1PrE3jDndEEjNUE8HP/U0z8QjNzD5djv/iZ2bYQ4z9GRccV6uEfA+jaEzBKWNjsY6vEAw9ZGhzCkaALRIGyVvRLeixZZzEHZuYKr1IdfIPXsXyHiW8B1eCq10EzQciRSGo+/OFg2ekqlD2YpseJcDK42HGNcKmx78Ps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e2cdfcb2f3cb89d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpw5VREKBEfL0tCEMHWBju5pRvHcpNU8ROV1nhil/kyaKre8CXHFskzEeAP2Vf8LA+2qXtGGQlym5F92qk7Dm5IQh7abgmhvaK40JMRUyEUgDShPswz0sosLl2+GdkwOJLp1I18bY3m9+zc/8aqGXZY+ANmWOdTbR02LfftUrhSJLEaUyrnqQoPUPOLRg+c5G9U+g5V4hkIc3WZHuaEFp4RCtonMDc+fjpP1C7KtLb/SMkTuYp2ivFjeVULw+5Tj973kYaQLReCXGYuhA4p1nOW05ZG4VyXkIZl1nLOb1a+UH0oh+1fGyeyqdAqOMnc3i9FSUZ+nJp1hrDj8Rc7anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E2YycaUmRjglDnO14BI3Olfi3l6vYkXLEaDHaGO4lw=;
 b=E7/FDr9PqNxy/we9AD11HLOw8L2TXSevDqPQIdEj2/En00BQEa1mTM2gbThqGec5dIg6U0M+L4EijsLiOJg8hsRFVeVDiruVFXRhpYx1VWAozTF2e6yqjmXvr14Z04dP24Edwa8B2L0l+8wWaA8Er1pgaJkl4lR5O7jWRgsyblFUGuBokRPOITVCp2xz2KLr0NUX4YBJqtoC2pvAEoK+4kh/jd9F1iRPL3RBvq9TOzbW3CLo/KV2r/ZqNxnr6wF0ifKqRjkS9rXBawqiYABehgZQyqQU6HUBnZaF433no2cf9e2TZwgA9eXoNdrFxzrq5wnNdUw23uRew070ZU16pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E2YycaUmRjglDnO14BI3Olfi3l6vYkXLEaDHaGO4lw=;
 b=Ww1h6/oJ1PrE3jDndEEjNUE8HP/U0z8QjNzD5djv/iZ2bYQ4z9GRccV6uEfA+jaEzBKWNjsY6vEAw9ZGhzCkaALRIGyVvRLeixZZzEHZuYKr1IdfIPXsXyHiW8B1eCq10EzQciRSGo+/OFg2ekqlD2YpseJcDK42HGNcKmx78Ps=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 09/13] xen/arm: mm: Use generic variable/function names
 for extendability
Thread-Topic: [PATCH v5 09/13] xen/arm: mm: Use generic variable/function
 names for extendability
Thread-Index: AQHZzmeKSbzvNCb8Y0ecj302axbRZK/1HuGAgAQj9YCAAAlTgIAAEGoA
Date: Thu, 24 Aug 2023 11:18:34 +0000
Message-ID: <EB7DCE8F-E7FD-4F77-9D78-9E7ED119A0EC@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-10-Henry.Wang@arm.com>
 <c039015f-43d4-491f-b44c-8ece186e08e4@xen.org>
 <FBF340E4-5927-48E0-A23B-7D2F8DC8C33C@arm.com>
 <33e90d86-973f-4a32-941f-140db9aaa90c@xen.org>
In-Reply-To: <33e90d86-973f-4a32-941f-140db9aaa90c@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8320:EE_|AM7EUR03FT014:EE_|PAWPR08MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ad1c26-17d9-446d-f8f3-08dba493e49a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 P8zj3iiq8ccgx+BMoIDfF2Iy1PMva2zKVTgtezO7CV8spRr1U8k8U+Q06NTFZD+TcGe755WaDl4jNNzFAHiK8xJ0S5PCGOcJQnlScF7DMwO5kaiMr5QdNnuc2S9ED09eNcRV/oudgseNnJh5Nelq7dMY0Hl66sQ/JBh0NdQpx51XE0CLa7YqIR1igvW0zgLIJdrYP4YVNJ/uOtQCPpkHYQtpiU27z+FO5ANjfOFd14vuT4ZnnReZWWHSiK3Qanc8Z7OALgDTcB29TnD1zjp9nbUqwJkniZMjanmiWRZrsHDkIBoahOZ9DTgsCsZLhRiwi803vR28CtJV7x9o11YBWvGjwGKrij7yLa+GY+fYipLxtTHsSgUAgVJZKPdb+qXzarzcASHffHFA2AqzAE4sOXDed3IDyIiopTVSWxflJjgaiVbAB0JG3CPmHzR2TrXKt4m1szajAxFUTFTIWjQTaXPsVzaeQn7Scv5zimxkIaVzloBgbbFeQrJwUb9PP/qypANNNgpIhOO57KOVAfrQL3NcvU6Qi3ye7EiRUqQycsRKW+1ept/HysR5UACbtOWoZFlGtVWNhdaxHlQMbZKQRr3qa8vA/nXMyMlwXGNyEQc1uSHdDKBFWocFTeXUtcxt/PoetPE0R4rbR0ZI9i89aW+TKbTyaYrpKUoDFv61GHs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(1800799009)(451199024)(186009)(33656002)(86362001)(122000001)(38100700002)(38070700005)(36756003)(6506007)(71200400001)(478600001)(6486002)(966005)(5660300002)(54906003)(2906002)(316002)(6916009)(8676002)(4326008)(91956017)(8936002)(76116006)(26005)(6512007)(53546011)(83380400001)(64756008)(66946007)(66556008)(66476007)(66446008)(41300700001)(2616005)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6866C5AB52624745AEC044673C8363C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a334921a-5d6b-462b-cd45-08dba493daea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSn3E0B19PvluVleMHFqi73RGr80/pu6IirNzZGoFMRS24Pn7THNQPCZn12cbyg1aG2wojudSYxRwlldaJAB+xtQoMUpNwQoqxgIsddIioRZiFAugmTtsAfQ7LkWGlEiGbDvObrgkCru3TTEszApKbmaKUbG1kbqzd+NTPcNiM++3RAtwyyqMtiXY5saUfsRQG08gvkPcDH3eoqxm87j1OYm5DsSBBNv4e2ycyUZ4laqLj2tqwETEbVkecOElJvo4UNXbCyws7cLsXDzc7IuZV9tD10rdzr1p00pQAdtwq8hk2tl5BJ3UNFbgAzZvM4nSPAB1HutZS2OQ+0LE/sdQrwLCKgyeVIccf5ldSZRk1w2ydiaDbQ81ITpl6mrVd4cUPdnQAl/24NkKOxpEKYbFID9k2STpm1tzY9xaEFOua7EJfvof8hoNeuZle9gfJ7NxQYRcKR27ni4DwC6PK3rmzBGB00qrHbwb52mt4hS4b27PQUqAtY94vrzR3P+WeAkbeSBYb3tIRUIi/g+WM51n19KGQZuCUr/g286hxRhbYMHTacQOnpLDqtMu4r+0E/dKSyy2eG2X7vdOPn/rwrZoIpC59T0RvI5CSlcCbn9Vm1PIWN7+Spnnb5ik1YxzUIwiArYhrNGWU1zMMl3f+nqFnUVQQyT52GLyPrmxXVUoeaZl7oClo5dFtXhgYKseS/1YQAn8mLyP0fossBcXFpvaZrsWmh3kad0uyAVEGoBIfzYGloffpmXfCw8qHvySzp4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(186009)(451199024)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(2616005)(6506007)(6486002)(316002)(53546011)(6862004)(8676002)(4326008)(8936002)(40480700001)(70586007)(54906003)(70206006)(6512007)(41300700001)(336012)(26005)(107886003)(5660300002)(966005)(478600001)(83380400001)(40460700003)(33656002)(47076005)(36860700001)(36756003)(86362001)(2906002)(82740400003)(356005)(81166007)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 11:18:50.4785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ad1c26-17d9-446d-f8f3-08dba493e49a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9066

SGkgSnVsaWVubQ0KDQo+IE9uIEF1ZyAyNCwgMjAyMywgYXQgMTg6MTksIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAyNC8wOC8y
MDIzIDEwOjQ2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4+IE9uIEF1ZyAyMiwgMjAyMywgYXQgMDI6
MzIsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEhpLA0K
Pj4+IA0KPj4+IE9uIDE0LzA4LzIwMjMgMDU6MjUsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+Pj4+IEZy
b206IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPj4+PiBBcyBwcmVwYXJhdGlv
biBmb3IgTVBVIHN1cHBvcnQsIHdoaWNoIHdpbGwgdXNlIHNvbWUgdmFyaWFibGVzL2Z1bmN0aW9u
cw0KPj4+PiBmb3IgYm90aCBNTVUgYW5kIE1QVSBzeXN0ZW0sIFdlIHJlbmFtZSB0aGUgYWZmZWN0
ZWQgdmFyaWFibGUvZnVuY3Rpb24NCj4+Pj4gdG8gbW9yZSBnZW5lcmljIG5hbWVzOg0KPj4+PiAt
IGluaXRfdHRiciAtPiBpbml0X21tLA0KPj4+IA0KPj4+IFlvdSBtb3ZlZCBpbml0X3R0YnIgdG8g
bW0vbW11LmMuIFNvIHdoeSBkb2VzIHRoaXMgbmVlZCB0byBiZSByZW5hbWVkPw0KPj4+IA0KPj4+
IEFuZCBpZiB5b3UgcmVhbGx5IHBsYW5uZWQgdG8gdXNlIGl0IGZvciB0aGUgTVBVIGNvZGUuIFRo
ZW4gaW5pdF90dGJyIHNob3VsZCBub3QgaGF2ZSBiZWVuIG1vdmVkLg0KPj4gWW91IGFyZSBjb3Jy
ZWN0LiBJIHRoaW5rIHdlIG5lZWQgdG8gdXNlIHRoZSDigJxpbml0X21t4oCdIGZvciBNUFUgU01Q
IHN1cHBvcnQsDQo+PiBzbyBJIHdvdWxkIG5vdCBtb3ZlIHRoaXMgdmFyaWFibGUgaW4gdjYuDQo+
IA0KPiBZb3VyIGJyYW5jaCBtcHVfdjUgZG9lc24ndCBzZWVtIHRvIGNvbnRhaW4gYW55IHVzZS4g
QnV0IEkgd291bGQgZXhwZWN0IHRoYXQgdGhlIGNvbW1vbiBpcyBuZXZlciBnb2luZyB0byB1c2Ug
dGhlIHZhcmlhYmxlLiBBbHNvLCBhdCB0aGUgbW9tZW50IGl0IGlzIDY0LWJpdCBidXQgSSBkb24n
dCBzZWUgd2h5IGl0IHdvdWxkIGJlIG5lY2Vzc2FyeSB0byBiZSBiaWdnZXIgdGhhbiAzMi1iaXQg
b24gMzItYml0Lg0KPiANCj4gU28gSSB0aGluayBpdCB3b3VsZCBiZSBwcmVmZXJhYmxlIGlmIGlu
aXRfdHRiciBpcyBtb3ZlIGluIG1tL21tdS5jLiBZb3UNCj4gY2FuIHRoZW4gaW50cm9kdWNlIGFu
IE1QVSBzcGVjaWZpYyB2YXJpYWJsZS4NCg0KU291bmRzIGdvb2QgdG8gbWUuDQoNCj4gDQo+IElu
IGdlbmVyYWwsIG9ubHkgdmFyaWFibGVzIHRoYXQgd2lsbCBiZSB1c2VkIGJ5IGNvbW1vbiBjb2Rl
IHNob3VsZCBiZSBkZWZpbmVkIGluIGNvbW1vbi4gQWxsIHRoZSByZXN0IHNob3VsZCBiZSBkZWZp
bmVkIGluIHRoZWlyIHNwZWNpZmljIGRpcmVjdG9yeS4NCg0KR290IGl0IDopKQ0KDQo+IA0KPj4+
PiAtIG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKSAtPiBtbV9pbml0X3NlY29uZGFyeV9jcHUoKQ0K
Pj4+PiAtIGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoKSAtPiBpbml0X3NlY29uZGFyeV9tbSgp
DQo+Pj4gDQo+Pj4gVGhlIG9yaWdpbmFsIG5hbWluZyB3ZXJlIG5vdCBncmVhdCBidXQgdGhlIG5l
dyBvbmUgYXJlIGEgbG90IG1vcmUgY29uZnVzaW5nIGFzIHRoZXkgc2VlbSB0byBqdXN0IGJlIGEg
cmVzaHVmZmxlIG9mIHdvcmQuDQo+Pj4gDQo+Pj4gbW1faW5pdF9zZWNvbmRhcnlfY3B1KCkgaXMg
b25seSBzZXR0aW5nIHRoZSBXeE4gYml0LiBGb3IgdGhlIE1NVSwgSSB0aGluayBpdCBjYW4gYmUg
ZG9uZSBtdWNoIGVhcmxpZXIuIERvIHlvdSBoYXZlIGFueXRoaW5nIHRvIGFkZCBpbiBpdD8gSWYg
bm90LCB0aGVuIEkgd291bGQgY29uc2lkZXIgdG8gZ2V0IHJpZCBvZiBpdC4NCj4+IEnigJl2ZSBn
b3QgcmlkIG9mIG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKSBmdW5jdGlvbiBpbiBteSBsb2NhbCB2
NiBhcyBpdCBpcyBub3cNCj4+IGZvbGRlZCB0byB0aGUgYXNzZW1ibHkgY29kZS4NCj4+PiANCj4+
PiBGb3IgaW5pdF9zZWNvbmRhcnlfbW0oKSwgSSB3b3VsZCByZW5hbWVkIGl0IHRvIHByZXBhcmVf
c2Vjb25kYXJ5X21tKCkuDQo+PiBTdXJlLCB0aGFua3MgZm9yIHRoZSBuYW1lIHN1Z2dlc3Rpb24u
DQo+Pj4gDQo+Pj4+ICAtdm9pZCB1cGRhdGVfaWRlbnRpdHlfbWFwcGluZyhib29sIGVuYWJsZSkN
Cj4+Pj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9pZGVudGl0eV9tYXBwaW5nKGJvb2wgZW5hYmxlKQ0K
Pj4+IA0KPj4+IFdoeSBub3Qgc2ltcGx5IHJlbmFtaW5nIHRoaXMgZnVuY3Rpb24gdG8gdXBkYXRl
X21tX21hcHBpbmcoKT8gQnV0Li4uDQo+Pj4gDQo+Pj4+ICB7DQo+Pj4+ICAgICAgcGFkZHJfdCBp
ZF9hZGRyID0gdmlydF90b19tYWRkcihfc3RhcnQpOw0KPj4+PiAgICAgIGludCByYzsNCj4+Pj4g
QEAgLTEyMCw2ICsxMjAsMTEgQEAgdm9pZCB1cGRhdGVfaWRlbnRpdHlfbWFwcGluZyhib29sIGVu
YWJsZSkNCj4+Pj4gICAgICBCVUdfT04ocmMpOw0KPj4+PiAgfQ0KPj4+PiAgK3ZvaWQgdXBkYXRl
X21tX21hcHBpbmcoYm9vbCBlbmFibGUpDQo+Pj4gDQo+Pj4gLi4uIHRoZSBuZXcgbmFtZSBpdCBx
dWl0ZSBjb25mdXNpbmcuIFdoYXQgaXMgdGhlIG1hcHBpbmcgaXQgaXMgcmVmZXJyaW5nIHRvPw0K
Pj4gU28gSSBjaGVja2VkIHRoZSBNUFUgU01QIHN1cHBvcnQgY29kZSBhbmQgbm93IEkgdGhpbmsg
SSB1bmRlcnN0YW5kIHRoZSByZWFzb24NCj4+IHdoeSB1cGRhdGVfbW1fbWFwcGluZygpIHdhcyBp
bnRyb2R1Y2VkOg0KPj4gSW4gdGhlIGZ1dHVyZSB3ZSBldmVudHVhbGx5IG5lZWQgdG8gc3VwcG9y
dCBTTVAgZm9yIE1NVSBzeXN0ZW1zLCB3aGljaCBtZWFucw0KPj4gd2UgbmVlZCB0byBjYWxsIGFy
Y2hfY3B1X3VwKCkgYW5kIGFyY2hfY3B1X3VwX2ZpbmlzaCgpLiBUaGVzZSB0d28gZnVuY3Rpb25z
IGNhbGwNCj4+IHVwZGF0ZV9pZGVudGl0eV9tYXBwaW5nKCkuIFNpbmNlIHdlIGJlbGlldmUgImlk
ZW50aXR5IG1hcHBpbmciIGlzIGEgTU1VIGNvbmNlcHQsDQo+PiB3ZSBjaGFuZ2VkIHRoaXMgdG8g
Z2VuZXJpYyBuYW1lICJtbSBtYXBwaW5n4oCdIGFzIGFyY2hfY3B1X3VwKCkgYW5kDQo+PiBhcmNo
X2NwdV91cF9maW5pc2goKSBpcyBhIHNoYXJlZCBwYXRoIGJldHdlZW4gTU1VIGFuZCBNUFUuDQo+
IA0KPiBUaGUgZnVuY3Rpb24gaXMgdG9kYXkgY2FsbGVkICJ1cGRhdGVfaWRlbnRpdHlfbWFwcGlu
ZygpIiBiZWNhdXNlIHRoaXMgaXMgd2hhdCB0aGUgaW1wbGVtZW50YXRpb24gZG9lcyBvbiBhcm02
NC4gQnV0IHRoZSBnb2FsIG9mIHRoaXMgZnVuY3Rpb24gaXMgdG8gbWFrZSBzdXJlIHRoYXQgYW55
IG1hcHBpbmcgbmVjZXNzYXJ5IGZvciBicmluZy11cCBzZWNvbmRhcnkgQ1BVcyBhcmUgcHJlc2Vu
dC4NCj4gDQo+IFNvIGlmIHlvdSBkb24ndCBuZWVkIHNpbWlsYXIgd29yayBmb3IgdGhlIE1QVSB0
aGVuIEkgd291bGQgZ28gd2l0aC4uLg0KPiANCj4+IEJ1dCBJIHRoaW5rIE1QVSB3b27igJl0IHVz
ZSB1cGRhdGVfbW1fbWFwcGluZygpIGZ1bmN0aW9uIGF0IGFsbCwgc28gSSB3b25kZXIgZG8NCj4+
IHlvdSBwcmVmZXIgY3JlYXRpbmcgYW4gZW1wdHkgc3R1YiB1cGRhdGVfaWRlbnRpdHlfbWFwcGlu
ZygpIGZvciBNUFU/IE9yIHVzZSAjaWZkZWYNCj4+IGFzIHN1Z2dlc3RlZCBpbiB5b3VyIHByZXZp
b3VzIGVtYWlsLi4uDQo+IA0KPiANCj4gLi4uICNpZmRlZi4gSSBoYXZlIHNvbWUgcHJlbGltaW5h
cnkgd29yayB3aGVyZSB0aGUgY2FsbCB0byB1cGRhdGVfaWRlbnRpdHlfbWFwcGluZygpIG1heSBl
bmQgdXAgdG8gYmUgbW92ZWQgc29tZXdoZXJlIGVsc2UgYXMgdGhlIHBhZ2UtdGFibGVzIHdvdWxk
IG5vdCBiZSBzaGFyZWQgYmV0d2VlbiBwQ1BVIGFueW1vcmUuIFNvIHRoZSBsb2dpYyB3aWxsIG5v
dCBzb21lIHJld29yayAoc2VlIFsxXSkuDQoNClRoYW5rcyBmb3Igc2hhcmluZyB0aGlzIGluZm8s
IEkgd2lsbCBkcm9wIHRoZSBtb2RpZmljYXRpb24gdG8gdXBkYXRlX2lkZW50aXR5X21hcHBpbmco
KQ0KZnJvbSB0aGlzIHBhdGNoLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQoNCj4gDQo+IENo
ZWVycywNCj4gDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMjE2
MTE0ODUzLjgyMjctMjEtanVsaWVuQHhlbi5vcmcvDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxs
DQoNCg==

