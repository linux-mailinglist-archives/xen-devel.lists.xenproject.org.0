Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727347826F5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 12:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587485.918874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY22d-00063N-LA; Mon, 21 Aug 2023 10:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587485.918874; Mon, 21 Aug 2023 10:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY22d-00060L-IC; Mon, 21 Aug 2023 10:21:47 +0000
Received: by outflank-mailman (input) for mailman id 587485;
 Mon, 21 Aug 2023 10:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xF=EG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qY22b-00060F-MY
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 10:21:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8657c971-400c-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 12:21:43 +0200 (CEST)
Received: from AS4P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::19)
 by AS8PR08MB10361.eurprd08.prod.outlook.com (2603:10a6:20b:56d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 10:21:41 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5de:cafe::8f) by AS4P190CA0015.outlook.office365.com
 (2603:10a6:20b:5de::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 10:21:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.12 via Frontend Transport; Mon, 21 Aug 2023 10:21:40 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Mon, 21 Aug 2023 10:21:40 +0000
Received: from c88798c87a09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2726504-A764-4525-A6E4-24A9ED381F9D.1; 
 Mon, 21 Aug 2023 10:21:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c88798c87a09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Aug 2023 10:21:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9934.eurprd08.prod.outlook.com (2603:10a6:10:402::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 10:21:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 10:21:25 +0000
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
X-Inumbo-ID: 8657c971-400c-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRgYvTj8wV8X8LLf91UC7F94WM1Aew4R1zcWAuUR9rI=;
 b=BNnSzksRYmgLFVzGJkqOo/pWMaFDu4eDZzlPwcopFxzH6T3GBBrpJWfxP+ZP6KFD3cMP2IPvuzRvJNrYA6qD27bYL7L2WPg+ZhB4g2fgjJcxNFLWbqJzhh0jLPQ+DHPaOVRJ4UX/R+lDjgJIeGf6vFWtoIurckP8AqW3aM1z4Xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 906d24883230ce5b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdNXKPMXmZ9ryeumSi6bEVG2Jg+VtBeE8FAqQB25i9q2ff1MMW38P0lRDC1IqyV7eWUe9E4TR2UYVq+tfjj2k1ProBaaPzmE0llJaGonuoJlctG2kWDoSe7JMyK0q0uwMvGmJWDoI6Py2w6BcG5ImbScL0XIoF+cNOKj1WCq5LaK7cF8N+tcTZ6oXq8PYx1GS1BQGDV5LKzN3dejBOjsnxNYxIttuefwWVvyODkanQdaroVLK3zTxUIWERK/cE2i8z9ywbnddJcL+Fbq09lQXn1PSOqy609BN1mR33B0OECneFxi5dpTuJknMbdXUv0YnuKG6H+RAA0WjmAGw6sjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRgYvTj8wV8X8LLf91UC7F94WM1Aew4R1zcWAuUR9rI=;
 b=LIz61pTiK/l2u8/z2/rOGM3qPvBevjF0kx5RK+87gWecSNbdXJwaJ1+DH8r5jDAIkK+9tafbf/MCL8bJzVS1uXLJxp7h6NV0rL+fd9gQCsFqjrXtnqwBLUGfJk4dUclNZPwrA0v16VVGDmJnAteuH7jWybEuSRflL9YrYzXt/YibshmLVX1p+jxXUr1PpebiT+kXrVvZKowSKYMRMTl3BflFd3prT/ikwegqpjUioL2UF0CU3cZ4lXuIMRBlD4u2c9PQgIhYTPWcj1NPyZqlm9zhCZOVUyStcmbr8lZ8ak3AeyQe3AIHzDph8dS4TIc91svcpWG9QkP+JGK3DKzTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRgYvTj8wV8X8LLf91UC7F94WM1Aew4R1zcWAuUR9rI=;
 b=BNnSzksRYmgLFVzGJkqOo/pWMaFDu4eDZzlPwcopFxzH6T3GBBrpJWfxP+ZP6KFD3cMP2IPvuzRvJNrYA6qD27bYL7L2WPg+ZhB4g2fgjJcxNFLWbqJzhh0jLPQ+DHPaOVRJ4UX/R+lDjgJIeGf6vFWtoIurckP8AqW3aM1z4Xg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny
 Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 04/13] xen/arm64: Split and move MMU-specific head.S to
 mmu/head.S
Thread-Topic: [PATCH v5 04/13] xen/arm64: Split and move MMU-specific head.S
 to mmu/head.S
Thread-Index: AQHZzmd/BB25uAPEnE2BQngtG1/sgq/0g/oAgAADOQCAAA0rAIAAAUAA
Date: Mon, 21 Aug 2023 10:21:25 +0000
Message-ID: <F9430E52-762E-465D-8E9C-DBB7750BAD95@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-5-Henry.Wang@arm.com>
 <bffdb783-fd63-4a93-b80b-42634643b2d3@xen.org>
 <5111F5D4-49E0-45B2-B58A-EE2F178E65AE@arm.com>
 <e2bb3025-e1e7-451f-8cdd-5d7ca14a9886@xen.org>
In-Reply-To: <e2bb3025-e1e7-451f-8cdd-5d7ca14a9886@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9934:EE_|AM7EUR03FT047:EE_|AS8PR08MB10361:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ddd79f4-fa8e-4653-3468-08dba230691d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4Yyoda3HBvbdiHxiCcnJwNjuTbF6h2T9KZuePkg5gSkdFUVUChtrgkXwRi3EbYM5D9Y3OmrU6cx4g76urhTzs5YgFjrNMZU7S2mKEmNwgVY6nDSbLgdj1mUObBIHkASDYeLYt+g3qhan5ByRcARjadNgDMoDOib6IVAH7NgId0dIFRQBzSDURiHn52JO7rx2G7EJa/Btg6pSx9P6/iPRasVr4zmS4C5XfECwW++a3fvcp0rKqC/ddNjlWX8Ka4bsyMeQDoJFoj20p9bACLZfVqOiIgV6COHhzimQsT3zWq2IT12oQyhRi2CVdCgZJZD9W9JqT9zu0MFvOnaYm+6ZodQ4O0mYh+vj9gOBQQwmfTPhu3bUVhENeWWW2TWostqG9xxpLi0cfVwQx9Rzj4nJV8wGgJyzI5YO7YJJ33jNJzmRqop0StZn01qNtsq7aMBTSV0nJnIRApKi1IkozNXbrAZs2tEO0gSg+eZPJhSn/qthjXfMOgitwNEgCmwzDwpN4mgFHAqGZAwmh7u6mUZI2udLQWqNHFaEmJutdrfi2QWAiAKt8NPfLRRCsAapVN3JJgSVke0KCFh9XznLz9DbY5vsJ0jd3N2R8WXGnRIZcJ5KLwBncsDBaCtbSXmQ822Hc+a2cTkV/LFZHoYd9/Fv9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(38070700005)(6506007)(6486002)(5660300002)(33656002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(64756008)(54906003)(6916009)(66446008)(66556008)(76116006)(66476007)(91956017)(478600001)(122000001)(71200400001)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CA2748A88FC2947AACE297BC2F17F01@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9934
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ec4ab3a-79ab-4886-604f-08dba2305fd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NzD5laHkoOJDfC0Bu0a3AqyY01XKeMAX5ZXho8255ELl8vOiDqApZ+lxaLDk3tXohji7iz57b+CFfvQg12nf6TMfdCu5laOPiy6AgAMG5uXM3kD/NKYMZmSoTcpcHz/H08E+DoielUb5RN45CFgXe8B6By3HIy9apDRyA1Ps3Vo4lmwGFY+OMhIHiLTxvKR4pIYE6cP3HKVyDDVt0d6bREww3inCYCNSXQIL7cGdKv6uH/jwS+zz3RkznjBM7kQZr8+ifv2VCPyg8e1wWVuXsFNSiYmRNfUs7awfIDSGN69qyeBFGP0hrfHpVjaf4bJ4pcsLOc4rBNboIH1rL+ISkM5WP2D4qJaAQ/HEEKYNEil1WJE4R0vnJ1SKinczgZwO9EFH7s79V1Jzta7EJaUN01JRZK0FP7P/rfXpmgFpe9TJOnPwyg0YrsO+e4xzOsL9NRePXq3kbBBzK9CSPpBYfsAZpnZHzPJq5V/dlem+QsdhpCsbORCqS2zoiTjQoR00VLG5a+AboyLslm98qMAygFaAefQ5vwBNQFOMOK56vLRWfUP4DSo5UejA/QBy8EeVfRpYLuLSDNjvW8PqhNltYBE4f3hy6XTjkyc49V3GwI/sf78AV3TQ92XczyxZNlvrgn2gladTHlYowZK74pVDFxmI4m0wvtDNA0EueNOlQkwaPardaft4hIkftlzY5Yd1vSadXKWe2U20zx0SZBkgiPj5IyszrBAutZcNEd1ZvDILSMUdpKz6ICZE9L5EdORR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(53546011)(6506007)(6486002)(40480700001)(5660300002)(336012)(33656002)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(6862004)(4326008)(70206006)(316002)(6512007)(54906003)(70586007)(478600001)(82740400003)(356005)(81166007)(40460700003)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:21:40.8083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddd79f4-fa8e-4653-3468-08dba230691d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10361

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMSwgMjAyMywgYXQgMTg6MTYsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiBPbiAyMS8wOC8yMDIzIDEwOjI5LCBIZW5yeSBXYW5n
IHdyb3RlOg0KPj4+IE9uIEF1ZyAyMSwgMjAyMywgYXQgMTc6MTgsIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IE9uIDE0LzA4LzIwMjMgMDU6MjUsIEhlbnJ5IFdhbmcg
d3JvdGU6DQo+Pj4+IFRoZSBNTVUgc3BlY2lmaWMgY29kZSBpbiBoZWFkLlMgd2lsbCBub3QgYmUg
dXNlZCBvbiBNUFUgc3lzdGVtcy4NCj4+Pj4gSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBtb3JlICNp
ZmRlZnMgd2hpY2ggd2lsbCBicmluZyBjb21wbGV4aXR5DQo+Pj4+IHRvIHRoZSBjb2RlLCBtb3Zl
IE1NVSByZWxhdGVkIGNvZGUgdG8gbW11L2hlYWQuUyBhbmQga2VlcCBjb21tb24NCj4+Pj4gY29k
ZSBpbiBoZWFkLlMuIFR3byBub3RlcyB3aGlsZSBtb3Zpbmc6DQo+Pj4+IC0gQXMgImZhaWwiIGlu
IG9yaWdpbmFsIGhlYWQuUyBpcyB2ZXJ5IHNpbXBsZSBhbmQgdGhpcyBuYW1lIGlzIHRvbw0KPj4+
PiAgIGVhc3kgdG8gYmUgY29uZmxpY3RlZCwgZHVwbGljYXRlIGl0IGluIG1tdS9oZWFkLlMgaW5z
dGVhZCBvZg0KPj4+PiAgIGV4cG9ydGluZyBpdC4NCj4+Pj4gLSBVc2UgRU5UUlkoKSBmb3IgZW5h
YmxlX3NlY29uZGFyeV9jcHVfbW0sIGVuYWJsZV9ib290X2NwdV9tbSBhbmQNCj4+Pj4gICBzZXR1
cF9maXhtYXAgdG8gcGxlYXNlIHRoZSBjb21waWxlciBhZnRlciB0aGUgY29kZSBtb3ZlbWVudC4N
Cj4+PiANCj4+PiBJIGFtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aHkgeW91IGFyZSBzYXlpbmcg
InRvIHBsZWFzZSB0aGUgY29tcGlsZXIiIGhlcmUuIElzbid0IGl0IG5lY2Vzc2FyeSBmb3IgdGhl
IGxpbmtlciAobm90IHRoZSBjb21waWxlcikgdG8gZmluZCB0aGUgZnVuY3Rpb24/IEFuZCB0aGVy
ZWZvcmUgdGhlcmUgaXMgbm8gcGxlYXNpbmcgKGFzIGluIHRoaXMgaXMgbm90IGEgYnVnIGluIHRo
ZSB0b29sY2hhaW4pLg0KPj4gWWVzIGl0IG1lYW50IHRvIGJlIGxpbmtlciwgc29ycnkgZm9yIHRo
ZSBjb25mdXNpb24uIFdoYXQgSSB3YW50IHRvIGV4cHJlc3MgaXMNCj4+IHdpdGhvdXQgdGhlIEVO
VFJZKCksIGZvciBleGFtcGxlIGlmIHdlIHJlbW92ZSB0aGUgRU5UUlkoKSBhcm91bmQgdGhlDQo+
PiBzZXR1cF9maXhtYXAoKSwgd2Ugd2lsbCBoYXZlOg0KPj4gYGBgDQo+PiBhYXJjaDY0LW5vbmUt
bGludXgtZ251LWxkOiBwcmVsaW5rLm86IGluIGZ1bmN0aW9uIGBwcmltYXJ5X3N3aXRjaGVkJzoN
Cj4+IC9ob21lL3hpbndhbjAyL3JlcG9zX2Zvcl9kZXZlbG9wbWVudC94ZW5fcGxheWdyb3VuZC94
ZW4veGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUzoyNzg6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YHNldHVwX2ZpeG1hcCcNCj4+IC9ob21lL3hpbndhbjAyL3JlcG9zX2Zvcl9kZXZlbG9wbWVudC94
ZW5fcGxheWdyb3VuZC94ZW4veGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUzoyNzg6KC50ZXh0Lmhl
YWRlcisweDFhMCk6IHJlbG9jYXRpb24gdHJ1bmNhdGVkIHRvIGZpdDogUl9BQVJDSDY0X0NBTEwy
NiBhZ2FpbnN0IHVuZGVmaW5lZCBzeW1ib2wgYHNldHVwX2ZpeG1hcCcNCj4+IG1ha2VbMl06ICoq
KiBbYXJjaC9hcm0vTWFrZWZpbGU6OTU6IHhlbi1zeW1zXSBFcnJvciAxDQo+PiBtYWtlWzFdOiAq
KiogW2J1aWxkLm1rOjkwOiB4ZW5dIEVycm9yIDINCj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6NTk4
OiB4ZW5dIEVycm9yIDINCj4+IGBgYA0KPj4gSSB3aWxsIHVzZSB0aGUgd29yZCDigJxsaW5rZXLi
gJ0gaW4gdjYgaWYgeW91IGFncmVlLg0KPiANCj4gVGhlIHNlbnRlbmNlIGFsc28gbmVlZCB0byBi
ZSByZXdvcmRlZC4gSG93IGFib3V0Og0KPiANCj4gIlVzZSBFTlRSWSgpIGZvciAuLi4gYXMgdGhl
eSB3aWxsIGJlIHVzZWQgZXh0ZXJuYWxseS4iDQoNClN1cmUsIEkgd2lsbCB1c2UgdGhlIHN1Z2dl
c3RlZCBzZW50ZW5jZS4NCg0KPiANCj4+PiANCj4+PiBPdGhlciB0aGFuIHRoYXQsIHRoZSBzcGxp
dCBsb29rcyBnb29kIHRvIG1lLg0KPj4gTWF5IEkgcGxlYXNlIHRha2UgdGhpcyBhcyBhIFJldmll
d2VkLWJ5IHRhZz8gSSB3aWxsIGFkZCB0aGUgdGFnIGlmIHlvdSBhcmUNCj4+IGhhcHB5IHdpdGgg
dGhhdC4NCj4gDQo+IFN1cmUuIFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPg0KDQpUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

