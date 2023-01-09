Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BB661C07
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 02:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473299.733805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEh9w-0001XL-5M; Mon, 09 Jan 2023 01:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473299.733805; Mon, 09 Jan 2023 01:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEh9w-0001Uo-1Q; Mon, 09 Jan 2023 01:41:08 +0000
Received: by outflank-mailman (input) for mailman id 473299;
 Mon, 09 Jan 2023 01:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhPP=5G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pEh9u-0001Ui-Sw
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 01:41:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2087.outbound.protection.outlook.com [40.107.6.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad9135d6-8fbe-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 02:41:04 +0100 (CET)
Received: from ZR0P278CA0157.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::22)
 by AS8PR08MB6341.eurprd08.prod.outlook.com (2603:10a6:20b:33f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 01:41:02 +0000
Received: from VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:41:cafe::96) by ZR0P278CA0157.outlook.office365.com
 (2603:10a6:910:41::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 01:41:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT055.mail.protection.outlook.com (100.127.144.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 01:41:01 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Mon, 09 Jan 2023 01:41:00 +0000
Received: from 4d1961368fd6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9CB8763-F1E7-4A7F-BF3A-D8121F8A50BE.1; 
 Mon, 09 Jan 2023 01:40:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d1961368fd6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Jan 2023 01:40:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB10317.eurprd08.prod.outlook.com (2603:10a6:102:330::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 01:40:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 01:40:47 +0000
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
X-Inumbo-ID: ad9135d6-8fbe-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gElYYVRIq6cb2IFc9bv0ot+K3mKiPjAQBlshZI0YrbY=;
 b=LwuMYO/RoNMUY/KYHCgKDTiIZ91Zlp/Uwbt/kCvOsGBoX+JPZTDJ3NjEZA/gqklO4hRCwCNx+vGmjGgOib7rup4sfg2GLijvaiyL3P2epMUkpu372v10YtJF7Ok2vCKhcTU8u3HDeHgjVoi9fQu6AkhsRjmraaJC7dW96c6TDIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPXIH5vrmiTndYmYAmug2xAUgVrAiqb7U35Di6qvwYiXKv0NnGP5JVicdJF/6XzVAMpuw34IFsI2W3vrOO/f90WMFeK8AqG8TUjsI0U8SuBJjUKKnWG4IAfqBgN8/opqLRRbtsKhOQPVywEh8tJSx29wH4T+CZ8hms1DOW/qafo3c84K/W434oYTA7xZsWmh03YXhRc2pr0z/I/EG+sM2uejzHpI89uA8l4GaHPp9JDWEMQKmf7oE/D73z+HAX9YYZivmYhbQ3VE9ZNajx2J5aTomVzMYvfZ+bo8K+XR2PMdrgUlxt5gdlx8EXB7Nk4XpMqLhCmlzABb2ZqXyxs6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gElYYVRIq6cb2IFc9bv0ot+K3mKiPjAQBlshZI0YrbY=;
 b=gB+iPuV4z5yYYKmC64JICGQWV84A0ZKg9SBO5Gyqyazl+O4CJO6PJ7hp197aYVc7LfpZdZBo4tHOfOwDU2WcJX6EfojYn3dLdXOwUovsH/rE+pouemC/rUFaKYGTXhYdQpdDuMK6SXulmixl3d5uan5w7R9fbDQ/Ar3fXeDTnU2oIITCURD3K3Mj2F4BwZT1pmqUpz2kRNQ9wkMr6UPsV77jhs4GjfrD+1pZomhAZFONIaIQ2HktFgvPROQvpk0TT/QfyNc7EJFuBFFpDzYL0nXgCfrzsrQj1wa8PJ3XLgqo/Jg1y9uclVZaBohs9OATdordh06psSPW/eJQWT9fIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gElYYVRIq6cb2IFc9bv0ot+K3mKiPjAQBlshZI0YrbY=;
 b=LwuMYO/RoNMUY/KYHCgKDTiIZ91Zlp/Uwbt/kCvOsGBoX+JPZTDJ3NjEZA/gqklO4hRCwCNx+vGmjGgOib7rup4sfg2GLijvaiyL3P2epMUkpu372v10YtJF7Ok2vCKhcTU8u3HDeHgjVoi9fQu6AkhsRjmraaJC7dW96c6TDIA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RSrOIThkYtnEq9RrtWc+uYX64NsO2AgAACdYCAAZeJAIBUVNkAgAKflACAADe5AIAmqQQAgAgZZwCAAJ2dcA==
Date: Mon, 9 Jan 2023 01:40:45 +0000
Message-ID:
 <AS8PR08MB799108673439A1983DB695BA92FE9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
 <alpine.DEB.2.22.394.2212091409020.3075842@ubuntu-linux-20-04-desktop>
 <A52E1C09-40F1-416C-A085-2F2320EE69EA@arm.com>
 <611b0857-155a-a50b-5996-ce735ebce22d@xen.org>
In-Reply-To: <611b0857-155a-a50b-5996-ce735ebce22d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A7E01A4412B29B418CE6B5E56B7E40E9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB10317:EE_|VI1EUR03FT055:EE_|AS8PR08MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b29914d-64ac-4c81-14b2-08daf1e2906b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s6EMuGyWFEz2wj2+xlPeCYuJu1E4/6ahNhwLCMkxIzpjMdLjKvKYHbSI8JICMU3Mp9axUZSJd1pzYWwusWHxWGr3wtxTpU6Rk2bgEqkgnJy8xp9dGGKU6XkoYv3YFole3OH0iRVEjyxHtf7smxb0ztwmmnynqEqZzWiuH2c/8NS52WFoUHMF9y6o0UyYYS0WUcDKo+TwxALBHLkmIl1jwIcyz3xtDn8K1TK46f1j39nr5SWnuN+4XJ3RNK9NiQT2Pm77n1XStzwDKZV+yrb988hgM12UqnPWmUx+8c95j+oUoQc4KOom4duF1242P3KIDkltGzmXnIMbci+ui449U9OhlfrQVEhmUAwh5z9iWdK7TRSVbsIq9TjezGXEtdQEk6Pw2I4nBIsfNWzol7JOw5o/kTwZ7hAUZseU0Tz3S17lCI5NWzfnAaF5qpO1KqytOu+0XBmyd+5MUWqIynzIcTkdTJuoNvDrv6sPFjJ/N3IxEL6it/BIpz6Z5IOHlWeaLEcDdpKzwmpB7ncqRDUghwq9A5cSa7KwfGdsElCr7+wIDWUjyMm9cxJh/DYd/flqO1hsmeJX20zPHLkQVjFnpkaOhd4XuHLkL+5VrW9f+Kfo9IIjp/m2K0eXmjZMLb2qw1K9iMgi4EWx+pgh7MI9zTVMb+DiBvHaEANVTYbA8InnIbNNanKTpDIMRUXD2Kl3iRH2uE70Hu5F+fA6FLcC/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(38100700002)(122000001)(38070700005)(33656002)(66476007)(66556008)(66946007)(66446008)(8676002)(64756008)(4326008)(54906003)(76116006)(41300700001)(86362001)(110136005)(316002)(55016003)(5660300002)(2906002)(52536014)(8936002)(9686003)(83380400001)(478600001)(71200400001)(7696005)(6506007)(26005)(186003)(53546011)(66899015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c511e29-7120-4f37-506c-08daf1e28704
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eKwde+RqZGq4jXxZXBk0bx9Qmb/KPdIp/+LiGJkNLkvyp/6v6FW7nnk3SZod0M1mJ/EnMcwka5IXXCQ/WdtTJIp5Y24reeFE2Bzl5cj98jTe8dgkqJRe8p4kqb8Bc6z6YrWQpmH1VZv5M9GuB0PMwQ3Qk2zek/ZGypM5JgRZLN3agqBhr20L7w6lzC54Tbvtyjt0tHA8krLwOigwqnthswcbMvwEYmfniv2IOEhxNXwQvpTkPynS1n5/sArVyoEaZgeQWOkQk3yaDZo1yhEKQwMu+SJj/b20pR+uV81D2bObVeUMRxmWYXPYwgpY1IPw3hZ9tm7DO2SlJCW/glIxBLWeUDxzYtxVsGbiuj1UM3SHa6TRnchRp7rQsQJEFZuPsCLNhuMl2an7DO0lPbiOYaLb0iegOmk0BLJY44pBbkCSMtWmrYAkTw0MEo9czmzfqQdmFIPWMpMS0I5ls7flTX7MqJIo0gHq67g89upPo64C3AER4JFbp+2R46EcaZJpUO8a67ejuO46vLtPMsgR+eg18vBATMyrtznknhKzGOuqY9MZ528RncycYKWcQ2t85SvJN7wytawiSoGIDYEFtnfxGjIQ/P/+ll5akq1ZvV9sr7QQImckPSCPcOihfhO5kSyichVTFU+fczdKR6rajB09kv1Mn1N503CPazR8YDI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(5660300002)(66899015)(8936002)(52536014)(41300700001)(110136005)(54906003)(2906002)(83380400001)(8676002)(70206006)(70586007)(316002)(4326008)(33656002)(7696005)(26005)(9686003)(186003)(478600001)(53546011)(6506007)(336012)(86362001)(55016003)(40480700001)(47076005)(82740400003)(81166007)(82310400005)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 01:41:01.2780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b29914d-64ac-4c81-14b2-08daf1e2906b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6341

SGkgSnVsaWVuIGFuZCBCZXJ0cmFuZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyXSB4ZW4vYXJtOiBwMm06IFBvcHVsYXRlIHBhZ2VzIGZvciBHSUN2MiBtYXBwaW5nIGlu
DQo+IGFyY2hfZG9tYWluX2NyZWF0ZSgpDQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDAz
LzAxLzIwMjMgMTI6MzQsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4g
PiBTb3JyeSBmb3IgdGhlIGRlbGF5IGJ1dCBJIGhhdmUgdmVyeSBsaW1pdGVkIGFjY2VzcyB0byBt
eSBtYWlscyByaWdodCBub3cuDQo+ID4NCj4gPj4gT24gOSBEZWMgMjAyMiwgYXQgMjM6MTEsIFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+PiA8bWFpbHRvOnNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+PiB3cm90ZToNCj4gPj4NCj4gPj4gT24gRnJpLCA5IERlYyAy
MDIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4+PiBIaSBIZW5yeSwNCj4gPj4+DQo+ID4+PiBP
biAwOC8xMi8yMDIyIDAzOjA2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+Pj4+IEkgYW0gdHJ5aW5n
IHRvIHdvcmsgb24gdGhlIGZvbGxvdy11cCBpbXByb3ZlbWVudHMgYWJvdXQgdGhlIEFybSBQMk0N
Cj4gPj4+PiBjb2RlLA0KPiA+Pj4+IGFuZCB3aGlsZSB0cnlpbmcgdG8gYWRkcmVzcyB0aGUgY29t
bWVudCBiZWxvdywgSSBub3RpY2VkIHRoZXJlIHdhcyBhbg0KPiA+Pj4+IHVuZmluaXNoZWQNCj4g
Pj4+PiBkaXNjdXNzaW9uIGJldHdlZW4gbWUgYW5kIEp1bGllbiB3aGljaCBJIHdvdWxkIGxpa2Ug
dG8gY29udGludWUgYW5kDQo+IGhlcmUNCj4gPj4+PiBvcGluaW9ucyBmcm9tIGFsbCBvZiB5b3Ug
KGlmIHBvc3NpYmxlKS4NCj4gPj4+Pg0KPiA+Pj4+IEZvciB0aGUgYmFja2dyb3VuZCBvZiB0aGUg
ZGlzY3Vzc2lvbiwgdGhpcyB3YXMgYWJvdXQgdGhlIGZhaWx1cmUgcGF0aCBvZg0KPiA+Pj4+IGFy
Y2hfZG9tYWluX2NyZWF0ZSgpLCB3aGVyZSB3ZSBvbmx5IGNhbGwgcDJtX2ZpbmFsX3RlYXJkb3du
KCkgd2hpY2gNCj4gZG9lcw0KPiA+Pj4+IG5vdCBjYWxsIHJlbGlucXVpc2hfcDJtX21hcHBpbmco
KS4uLg0KPiA+Pj4gU28gYWxsIHRoaXMgbWVzcyB3aXRoIHRoZSBQMk0gaXMgbmVjZXNzYXJ5IGJl
Y2F1c2Ugd2UgYXJlIG1hcHBpbmcgdGhlDQo+ID4+PiBHSUN2Mg0KPiA+Pj4gQ1BVIGludGVyZmFj
ZSBpbiBhcmNoX2RvbWFpbl9jcmVhdGUoKS4gSSB0aGluayB3ZSBzaG91bGQgY29uc2lkZXIgdG8N
Cj4gPj4+IGRlZmVyIHRoZQ0KPiA+Pj4gbWFwcGluZyB0byBsYXRlci4NCj4gPj4+DQo+ID4+PiBP
dGhlciB0aGFuIGl0IG1ha2VzIHRoZSBjb2RlIHNpbXBsZXIsIGl0IGFsc28gbWVhbnMgd2UgY291
bGQgYWxzbyB0aGUNCj4gPj4+IFAyTSByb290DQo+ID4+PiBvbiB0aGUgc2FtZSBudW1hIG5vZGUg
dGhlIGRvbWFpbiBpcyBnb2luZyB0byBydW4gKHRob3NlIGluZm9ybWF0aW9uDQo+ID4+PiBhcmUg
cGFzc2VkDQo+ID4+PiBsYXRlciBvbikuDQo+ID4+Pg0KPiA+Pj4gVGhlcmUgaXMgYSBjb3VwbGUg
b2Ygb3B0aW9uczoNCj4gPj4+IDEuIEludHJvZHVjZSBhIG5ldyBoeXBlcmNhbGwgdG8gZmluaXNo
IHRoZSBpbml0aWFsaXphdGlvbiBvZiBhIGRvbWFpbg0KPiA+Pj4gKGUuZy4NCj4gPj4+IGFsbG9j
YXRpbmcgdGhlIFAyTSBhbmQgbWFwIHRoZSBHSUN2MiBDUFUgaW50ZXJmYWNlKS4gVGhpcyBvcHRp
b24gd2FzDQo+ID4+PiBicmllZmx5DQo+ID4+PiBkaXNjdXNzZWQgd2l0aCBKYW4gKHNlZSBbMl0p
Li8NCj4gPj4+IDIuIEFsbG9jYXRlIHRoZSBQMk0gd2hlbiBwb3B1bGF0ZSB0aGUgUDJNIHBvb2wg
YW5kIGRlZmVyIHRoZSBHSUN2Mg0KPiBDUFUNCj4gPj4+IGludGVyZmFjZSBtYXBwaW5nIHVudGls
IHRoZSBmaXJzdCBhY2Nlc3MgKHNpbWlsYXIgdG8gaG93IHdpdGggZGVhbA0KPiA+Pj4gd2l0aCBN
TUlPDQo+ID4+PiBhY2Nlc3MgZm9yIEFDUEkpLg0KPiA+Pj4NCj4gPj4+IEkgZmluZCB0aGUgc2Vj
b25kIG9wdGlvbiBpcyBuZWF0ZXIgYnV0IGl0IGhhcyB0aGUgZHJhd2JhY2sgdGhhdCBpdA0KPiA+
Pj4gcmVxdWlyZXMgb24NCj4gPj4+IG1vcmUgdHJhcCB0byB0aGUgaHlwZXJ2aXNvciBhbmQgd2Ug
Y2FuJ3QgcmVwb3J0IGFueSBtYXBwaW5nIGZhaWx1cmUNCj4gPj4+ICh3aGljaA0KPiA+Pj4gc2hv
dWxkIG5vdCBoYXBwZW4gaWYgdGhlIFAyTSB3YXMgY29ycmVjdGx5IHNpemVkKS4gU28gSSBhbSBs
ZWFuaW5nDQo+ID4+PiB0b3dhcmRzDQo+ID4+PiBvcHRpb24gMi4NCj4gPj4+DQo+ID4+PiBBbnkg
b3BpbmlvbnM/DQo+ID4+DQo+ID4+IE9wdGlvbiAxIGlzIG5vdCBncmVhdCBkdWUgdG8gdGhlIGV4
dHJhIGh5cGVyY2FsbC4gQnV0IEkgd29ycnkgdGhhdA0KPiA+PiBvcHRpb24gMiBtaWdodCBtYWtl
IHRoaW5ncyBoYXJkZXIgZm9yIHNhZmV0eSBiZWNhdXNlIHRoZQ0KPiA+PiBtYXBwaW5nL2luaXRp
YWxpemF0aW9uIGJlY29tZXMgImR5bmFtaWMiLiBJIGRvbid0IGtub3cgaWYgdGhpcyBpcyBhDQo+
ID4+IHZhbGlkIGNvbmNlcm4uDQo+ID4+DQo+ID4+IEkgd291bGQgbG92ZSB0byBoZWFyIEJlcnRy
YW5kJ3MgdGhvdWdodHMgYWJvdXQgaXQuIFB1dHRpbmcgaGltIGluIFRvOg0KPiA+DQo+ID4gSG93
IG9wdGlvbiAxIHdvdWxkIHdvcmsgZm9yIGRvbTBsZXNzID8NCj4gDQo+IFhlbiB3b3VsZCBjYWxs
IHRoZSBmdW5jdGlvbiBkaXJlY3RseS4gRWZmZWN0aXZlbHksIHRoaXMgd291bGQgdGhlIHNhbWUN
Cj4gYXMgYWxsIHRoZSBvdGhlciAiaHlwZXJjYWxscyIgd2UgYXJlIHVzaW5nIHRvIGJ1aWxkIGEg
ZG9tMGxlc3MgZG9tYWluLg0KPiANCj4gPg0KPiA+IE9wdGlvbiAyIHdvdWxkIG1ha2Ugc2FmZXR5
IG1vcmUgY2hhbGxlbmdpbmcgYnV0IG5vdCBpbXBvc3NpYmxlICh3ZSBoYXZlDQo+ID4gYSBsb3Qg
b2Ygb3RoZXIgdXNlIGNhc2VzIHdoZXJlIHdlIGNhbm5vdCBtYXAgZXZlcnl0aGluZyBvbiBib290
KS4NCj4gPg0KPiA+IEkgd291bGQgdm90ZSBmb3Igb3B0aW9uIDIgYXMgSSB0aGluayB3ZSB3aWxs
IG5vdCBjZXJ0aWZ5IGdpY3YyIGFuZCBpdCBpcw0KPiA+IG5vdCBhZGRpbmcgYW4gb3RoZXIgaHlw
ZXIgY2FsbC4NCg0KVGhhbmtzIGZvciB0aGUgaW5wdXQuDQoNCj4gDQo+IEl0IHNvdW5kcyBsaWtl
IG9wdGlvbiAyIGlzIHRoZSBwcmVmZXJyZWQgd2F5IGZvciBub3cuIEhlbnJ5LCBjYW4geW91DQo+
IGhhdmUgYSBsb29rPw0KDQpZZXMsIEkgd291bGQgbG92ZSB0byBwcmVwYXJlIHNvbWUgcGF0Y2hl
cyB0byBmb2xsb3cgdGhlIG9wdGlvbiAyLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0K
PiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

