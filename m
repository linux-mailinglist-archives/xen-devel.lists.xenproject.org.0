Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F47BBAF4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613713.954444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomGj-0002rA-49; Fri, 06 Oct 2023 14:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613713.954444; Fri, 06 Oct 2023 14:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomGj-0002p7-14; Fri, 06 Oct 2023 14:57:33 +0000
Received: by outflank-mailman (input) for mailman id 613713;
 Fri, 06 Oct 2023 14:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qomGh-0002nk-US
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:57:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abac25ec-6458-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 16:57:29 +0200 (CEST)
Received: from AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::37)
 by DB9PR08MB6377.eurprd08.prod.outlook.com (2603:10a6:10:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 14:57:27 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::39) by AM5PR1001CA0024.outlook.office365.com
 (2603:10a6:206:2::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37 via Frontend
 Transport; Fri, 6 Oct 2023 14:57:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Fri, 6 Oct 2023 14:57:25 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Fri, 06 Oct 2023 14:57:25 +0000
Received: from f73fa1a4af4c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 704D2128-838F-4A54-BAFA-E9B567116645.1; 
 Fri, 06 Oct 2023 14:57:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f73fa1a4af4c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 14:57:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6442.eurprd08.prod.outlook.com (2603:10a6:10:259::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Fri, 6 Oct
 2023 14:57:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:57:15 +0000
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
X-Inumbo-ID: abac25ec-6458-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRt0gxeNiKlYBfOjGCHbGIkRam60tGaeGXPUfV2ErnU=;
 b=eH7FKVSZr9FQV5A6GfRyhV/t6dTxrx8Fo3Trg6r5Z3p+Nhtql64CG5t8L6Ha5wUihaUWGOmhG7r80/5AH8R9UqmECQHgFsCxYw3f5BwWRPa8M43mLE44ldNajh/d8pr0pfnaWVGV16EQ+khpCwodZpNK8EbF74nroPZ8gefnvtY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e7b589237b5f9c8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxkylTd4BXGdNf82pUJCtWJ26DLIeUs68lH32LOPXrNhOrdknptDN0E3wFBtXJyXRUMpbpgLcwnKqfXOHhv/1qn9RAWJqRihVVzaLVGppp7a1GfK5P5NzFiiBzco9hSN4PmFn7kiAGHVOldjaeItY2rnecWSVyitSbr5g5NR6YKRW900G3cw6azvtERVOLtRUQyLIX2CyKrySQMZkXeGJMZ0YNuE8e+Xn0Zs5wJr9321fkf3CZqJEHwsSiKF+kssOc2j+/C8akjh9XXTN4sUHdHlomKbWUKWsIKEECBg/WMeeQrF5nA+gf/XKuJHbqOqKJ+wuyEJ3EveRcIiouRO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRt0gxeNiKlYBfOjGCHbGIkRam60tGaeGXPUfV2ErnU=;
 b=TaJKr53KvLKS03gpbgaa8g2hS8L3e91Kzz+PKgTgFYdVcSIut48XuoY0VwBEa1lg0FAyEn49/Idk2TIsS1FiNupU1OVD/BIPDvhgoaLkU6jbzhWCW4hkO2wHyJytxQzu+B9tCaA7KsTVtTIKFS9CUPoepW/uIUmVXoRQseJmIPu2EUKl5aCdbG5PZ2YlnVAUuywEn847I5azaY9YxH5drWWcqih1y9e+y+KpCzpE4ue7TfMVQTQSVYyonHqDlQ/qt2bPuLgAk9Kom5wUSQMs7UVKuTdcNHs/FGMuDh61ibehkCqkdFQR7IgYVO3iF3xovuD52CqbNTLGMvUvi9yKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRt0gxeNiKlYBfOjGCHbGIkRam60tGaeGXPUfV2ErnU=;
 b=eH7FKVSZr9FQV5A6GfRyhV/t6dTxrx8Fo3Trg6r5Z3p+Nhtql64CG5t8L6Ha5wUihaUWGOmhG7r80/5AH8R9UqmECQHgFsCxYw3f5BwWRPa8M43mLE44ldNajh/d8pr0pfnaWVGV16EQ+khpCwodZpNK8EbF74nroPZ8gefnvtY=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/xenpvboot: remove as unable to convert to Python 3
Thread-Topic: [PATCH] tools/xenpvboot: remove as unable to convert to Python 3
Thread-Index: AQHZ+GSuiyqA87xC/k2xl+J2CZcV8bA82XkAgAAAdwA=
Date: Fri, 6 Oct 2023 14:57:12 +0000
Message-ID: <3CA70B97-8C94-4B00-B0E8-DDD7B112C2E7@arm.com>
References: <20231006145046.98450-1-roger.pau@citrix.com>
 <6c7661a7-316d-4551-9a1f-d832f80c55ab@citrix.com>
In-Reply-To: <6c7661a7-316d-4551-9a1f-d832f80c55ab@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6442:EE_|AM7EUR03FT016:EE_|DB9PR08MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc3fb52-af22-41fb-74dc-08dbc67c8d5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6fMjAnvElt/Ls7tkdt/xzJiZp0RwB0Emb8/kvsdVtQt77OnT3VgSCUU+2e/FDfoy3qLhJYGks4SPLZp1iBQ0oJ4FWJ81Va1bshfChBhq96xCwB2FLXEHrttbX7H5YiKpsf1SeK2TEGcXzIOd7+qUYBEJq0jeiNX0L1s4q/040KlK86mU0AZ9IZe+wn7kvjsuwDmF0ZP7Cze0AUri+aBJBaeHE1NgAOaOxWEv+0Ji1t7KOOMD8jebjqWViUIRxLRBqM0wO5kYCBjRj6glLBginUphfX/CZ/c8aaGFHBNVK7ViDWlndH+y/kdb/1Mee+F0EQJ7dUuS2g0fIVi6vfwoiqou4QWeQm3atAQ5yYHbxFW2mzevxuwdG6Ph5+h5EMvI+fKuVcV+KKIsUkVSqvyh0VM3YUIDvecn6oJCka5mYPxp+OXY1OZJ5RvXi6BEhrExgCBBWHpjdUFaxIua/HfuMUnyZyxgJwzfsUkZCYAlwk2yBSaW5UVe4uqYAGoCG+ayjpQo35eGWkN0p67UOkmSvNA44RPvvLQdcvt1PLCqRMu9BH0YZ5uILSR3QYhvQSEKarVsE6IcUZkHWjCp0vjqsTHaFcI/haNaI8G4EsiEZOjaOUpxAq6q16eVBwTwwP2Dwt2hmd8z2zOmh/Dz2PFI7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(53546011)(2616005)(6506007)(6512007)(6666004)(33656002)(122000001)(38100700002)(86362001)(38070700005)(36756003)(66556008)(26005)(2906002)(66946007)(71200400001)(6486002)(83380400001)(8676002)(4326008)(8936002)(41300700001)(66476007)(316002)(54906003)(5660300002)(64756008)(91956017)(6916009)(66446008)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B88919AAA0800A4DA3CED0F91FA94730@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6442
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cfc24ea-fca8-4e49-dd19-08dbc67c85cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6HcESemTk75tp0UVI9a5S7Gy08o9oP8in3UJ4efRg+BPtkXR26/rTnILJ8jvvkMlLhM0nrQTVolqOXZAOFbg6goofxWAOKDciHrvHBVLO3hm42Gw8kQqmxDwl92PuRKirTJHm+CMiByb4mxhTgdvtrydqdlP0ve9rMl41wzvHO7O5J8PPtkiUS0BBxGxn+mH7yfHfXEonb/m47BcC4GtEjin2m96gBjbQP7/jmKedOqIvsYRVuP44hQ41XI+XjSGr1SlgHxbdqfKeqB3tTB1QF0y1bwBtzLjGbpbhnDb7kCNyS30jYrJnEXpeEynOERrwv3/Sfh+mknEN7Zhtg0m9ZTKJMa18xeghb97becfp9UE7+Jev33UwRm2eFu5LDoT8at3O8RgKeLZAcVD97P+Ip23hPkmTrh4HGQMPNbrWY8leBSkhmQ8/+cM3R1lOpffcRks1tYb7sgHsm4q2+nogDRsTU3ImaHtfp5a7FX8mE6i1hBnT64Ja1Nhm6mlby7S4Jd+SF4QcfDL6IO7GXOxsvtHoLaJ/AusrKdI0NqQftZE/FqPW9tZh8w5lKAOg34Hzkpg6VgNAccUNBs7sT2wxxBqqm13fK1Z0MsCTmNcF65XsVxE8p7wE1tERDRrQt5l1VJf/APdbehuJvDHcm1JvnU2/3y8ZbMoupecmldeUaYenyacWexwhmRViF4HEs0QGHDc6ppVf1l5ZrxX4jaks2hFqGe4Ig8G2pTKbbA9OJPfsaxCL09LqKersp19rLPU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(26005)(40460700003)(316002)(36860700001)(36756003)(6862004)(86362001)(33656002)(47076005)(8936002)(82740400003)(6506007)(53546011)(83380400001)(2616005)(107886003)(6666004)(336012)(356005)(4326008)(81166007)(6512007)(8676002)(40480700001)(5660300002)(478600001)(2906002)(6486002)(70206006)(70586007)(54906003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:57:25.2519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc3fb52-af22-41fb-74dc-08dbc67c8d5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6377

SGksDQoNCj4gT24gT2N0IDYsIDIwMjMsIGF0IDIyOjU1LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDA2LzEwLzIwMjMgMzo1MCBwbSwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4gVGhlIHNjcmlwdCBoZWF2aWx5IHJlbGllcyBvbiB0
aGUgdXJsZ3JhYmJlciBweXRob24gbW9kdWxlLCB3aGljaCBkb2Vzbid0IHNlZW0NCj4+IHRvIGJl
IHBhY2thZ2VkIGJ5IGFsbCBkaXN0cm9zLCBpdCdzIG1pc3NpbmcgZnJvbSBuZXdlciBEZWJpYW4g
dmVyc2lvbnMgYXQNCj4+IGxlYXN0Lg0KPj4gDQo+PiBBbHNvIHRoZSB1c2FnZSBvZiB0aGUgY29t
bWFuZHMgbW9kdWxlIGhhcyBiZWVuIGRlcHJlY2F0ZWQgc2luY2UgUHl0aG9uIDIuNiwgYW5kDQo+
PiByZW1vdmVkIGluIFB5dGhvbiAzLCBzbyB0aGUgY29kZSB3b3VsZCBuZWVkIHRvIGJlIHJlLXdy
aXR0ZW4gdG8gbm90IHJlbHkgb24NCj4+IHVybGdyYWJiZXIgYW5kIHRoZSBjb21tYW5kcyBtb2R1
bGVzLg0KPj4gDQo+PiBBcmd1YWJseSB0aGUgcHVycG9zZSBvZiB0aGUgeGVucHZuZXRib290IGJv
b3Rsb2FkZXIgY2FuIGFsc28gYmUgYWNoaWV2ZWQgd2l0aA0KPj4gYW4gaXNvbGF0ZWQgc2NyaXB0
IHRoYXQgZmV0Y2hlcyB0aGUga2VybmVsIGFuZCByYW1kaXNrIGJlZm9yZSBhdHRlbXB0aW5nIHRv
DQo+PiBsYXVuY2ggdGhlIGRvbWFpbiwgd2l0aG91dCBoYXZpbmcgdG8gcnVuIGluIGxpYnhsIGNv
bnRleHQuICBUaGVyZSBhcmUgbm8geGwuY2ZnDQo+PiBvcHRpb25zIGNvbnN1bWVkIGJ5IHRoZSBi
b290bG9hZGVyIGFwYXJ0IGZyb20gdGhlIGJhc2UgbG9jYXRpb24gYW5kIHRoZQ0KPj4gc3VicGF0
aHMgb2YgdGhlIGtlcm5lbCBhbmQgcmFtZGlzayB0byBmZXRjaC4NCj4+IA0KPj4gQW55IGludGVy
ZXN0ZWQgcGFydGllcyBpbiBrZWVwaW5nIHN1Y2ggZnVuY3Rpb25hbGl0eSBhcmUgZnJlZSB0byBz
dWJtaXQgYW4NCj4+IHVwZGF0ZWQgc2NyaXB0IHRoYXQgd29ya3Mgd2l0aCBQeXRob24gMy4NCj4g
DQo+IFJlc29sdmVzOiB4ZW4tcHJvamVjdC94ZW4jMTcyDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBSZXZpZXdlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KUmVsZWFzZS1h
Y2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQo+IA0KPiBUaGFua3Mg
Zm9yIGRvaW5nIHRoaXMuDQoNCisxDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IH5B
bmRyZXcNCg0K

