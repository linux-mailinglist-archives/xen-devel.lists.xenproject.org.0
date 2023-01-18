Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B767116C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 04:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480102.744308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHygy-0003gg-PE; Wed, 18 Jan 2023 03:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480102.744308; Wed, 18 Jan 2023 03:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHygy-0003dL-Li; Wed, 18 Jan 2023 03:00:48 +0000
Received: by outflank-mailman (input) for mailman id 480102;
 Wed, 18 Jan 2023 03:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHygx-0003dC-G7
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 03:00:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c2dcbf1-96dc-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 04:00:43 +0100 (CET)
Received: from AM7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:100::21)
 by AM0PR08MB5330.eurprd08.prod.outlook.com (2603:10a6:208:17f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 03:00:41 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::61) by AM7PR02CA0011.outlook.office365.com
 (2603:10a6:20b:100::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 03:00:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 03:00:40 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Wed, 18 Jan 2023 03:00:40 +0000
Received: from 1bcd013e2a90.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92EB5855-E45B-4677-885F-09541CA4543D.1; 
 Wed, 18 Jan 2023 03:00:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1bcd013e2a90.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 03:00:34 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB9515.eurprd08.prod.outlook.com (2603:10a6:10:453::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 03:00:20 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 03:00:19 +0000
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
X-Inumbo-ID: 4c2dcbf1-96dc-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nadhZKla++sk9BClc+JQe0CyknQhMdPc1lvqjqwQUHg=;
 b=mS1oWg/xsuVFyEUoidHLry19qAL4mNRdjgIgjTXWUu3OKqJZculdXxSHr7WzGZ12Cgc6kJr2EkeA2OShB3ef3e8pVTO4RvjwGP+ZtGA+ugTp5v4izFzG4cR59yeWend+7HIL1sFPVKK/MnSgJTWDEALsGQaFI42I6brfVi+uunY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv7nGRTjV3BdL3IvR9z5F3nNr270cFkvXqJYGSg5wLkQtzgQNA8R6FNgrI33XmalnEAfGMJdS+sAiiZch3WREeer5c9D5pLL3OSk4ecc0EVdo8i6Nz95hmkTKiWagMbtkFZCr4GHBvhCOkAcROnGvMJNPob1eQunvqbtxMGMmVEzrUbBxVmOGHpElmSX5kRKy4W33kfACN3rP8vq0FjCpN0+MgfSt6i7RXYqdfd4Iwr7M7eyyG4Ivc/d4t63iXh0U//6JGEElC7wmgkWJNeeKWHHKdzvUp1OKfPxLMiRRzNknVGjGLN+qoyYQ+RUSNr/JKYNxvPl0uyLuTsvhjgqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nadhZKla++sk9BClc+JQe0CyknQhMdPc1lvqjqwQUHg=;
 b=W1JkOb4QOpq6JhnX7UgXJPV9wB5vgm8S0S+ymU17G8WuVGvWL00lR6RNGL47Ob41Xl2GIX5YdYbTM+KQnR3Vu0zAGO4P3SpjORc1GUWTaKHxaCiJfLRrIdAd42rIOluToccxyaXOSgMczyMIBAS2Pp3NNGLGpoymgecGCeCekWk3e0DAfHsYBpFxvDf+UvjPeZdFpd2eFY2KY1Fqi9FRnTKlEBcRYuH1Zaw9RE/LgbDzdckit/fy7F+FBNUMpc2l7A4ce9zw92g2N8OhZUkEPDexefTcvJh8kWqcM98ayxO+bB/8uCFzQYva5dEDoTbehBI3LGOdyCTxFkS+tCLf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nadhZKla++sk9BClc+JQe0CyknQhMdPc1lvqjqwQUHg=;
 b=mS1oWg/xsuVFyEUoidHLry19qAL4mNRdjgIgjTXWUu3OKqJZculdXxSHr7WzGZ12Cgc6kJr2EkeA2OShB3ef3e8pVTO4RvjwGP+ZtGA+ugTp5v4izFzG4cR59yeWend+7HIL1sFPVKK/MnSgJTWDEALsGQaFI42I6brfVi+uunY=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Thread-Topic: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Thread-Index: AQHZJxAXLGszZRVrMECopJok59rQha6jR3wAgAA4E5A=
Date: Wed, 18 Jan 2023 03:00:19 +0000
Message-ID:
 <PAXPR08MB7420A5C7F93F23F14C77C9BA9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-5-Penny.Zheng@arm.com>
 <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
In-Reply-To: <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E48362B22AC3AB4486C986892A382C5A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DB9PR08MB9515:EE_|AM7EUR03FT037:EE_|AM0PR08MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: c281917f-c0f5-4a6b-0bff-08daf9002ed3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 USATQ7xQMrsPEQ6xA0XNvG2eBwEOEaVPOX55rZpIlxE76yA/lHZX6RkYLNWlTpcxZwVm6A8Rmb2Z52z1M+2Iy41VrR+4xiI3WPMmGQRmB/crtLp5rfksIWCBwjdasfAnxgCuEsf4c6AiVjO1o5ouXdevz9CIq70f8Q39Dh8Ssln3hFIhjz6RFb6e3pzMWypR3mozFRYaaHvur+kXu6EeHeTrsNUThU8nQUnAK3tVz15zdmImNHL+32C01PTVxSXmMmDFF3wtxcQeomlO2tlOK/WU1y8vvGlkDsA2vGGZwekR47oS4YsJdB+kKT56XEmN0ZHF5KY1EALmUqtpWsKboKsFNT1aKqR4wAIrAINFKdX/AmyBkeBKVuzudRffTx88W8zzGNHD1XSy+cxgWihrCXhjKjrgzp7hKWVkYwrovujcyHzd4eSi/j/Fn7WMHw8Pg9uZ1q6N2um2ye02/XjPu/CZjzfahPza3L5l9zcjxuhSeBitqobsS+TGGaDJTQmZeE2/9eyRyzxvJ95QOF0FFeOc3nazu4F3CSGF5eff8HZJa+xNW3Wbnm+nhZ1kNommrFZo8nfzhgIH92/tI7fD5ssv2HD9b5MjB5/HNa/mAl1y3HOu1eLeIwzC60I6Iage4FFpmelzmHtFmrXwYXo7hGrmLGvP2ii+UN4EZH14C5xe5uwSDsvBJF1AWzm2j8vJxRTXbtQWo9StGUE/91kZXHp/5ImOLET7b7yg2/roNNA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199015)(33656002)(186003)(26005)(66946007)(66556008)(9686003)(4326008)(52536014)(41300700001)(478600001)(6506007)(53546011)(64756008)(66446008)(66476007)(76116006)(8676002)(966005)(55016003)(86362001)(2906002)(83380400001)(110136005)(122000001)(8936002)(54906003)(7696005)(71200400001)(316002)(38100700002)(38070700005)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9515
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b82f0d84-b6dc-49a1-9c98-08daf9002225
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CRfATf6cZ/sh1Wdwi9uGXu0q0pIcisI8BdDKrvLhD5T20sS5nOO3O+wymsQzRixwES89ADyNuxnLtXqY6Fuydz/dV7SgtGIkh8SC6hN76T/y36RylPFuKnvYEGemKKqFiE/eUfhqYUwYx5GA/F2yRLGmt4I1f1xydfCAt+/1F0ZDTJaEb/K1HNhYAI5tRwG+dCJNc+WkX5EvQasVH768lat6VRuDOMRelN8cv8b15yPoRrucXBLOcLAL/CTV2QDSqfwnLlPDfNJwDNfPBRXUv4hJj1iv3n7vJ5oD2cDjHBACyuv0sua/lxjDMKkAxez43ryZigjQkf95rLR/RKo+hrt1NJsv2sujinRElBnurvJdn3F+/LMQ5oA3Bq4RXExuGvX3YVu5KQu8imicPUUj6lBHMljwsFJ0IzMu2c7LX/mKp+wWURsLh2mpFx5muNXR1yNkHaBgIlm07svikPh73Hi0HkpMAu2l/5DBExudyGrGcYDsLD15uteR7yBtKRB6WAMgFf30Pm2PDXYYanBaXPAcm8V/HSKVfsMCZM89A4m371/6H1JdZRvNsJDaGWrCIsA3CAV71RZ71Y68SgsC7oM3kaayOy1cktEvVmnfK1kYRSdbEs1I0TLZqwMjsG5RPQtxKkqyxzLNTakRD5cHM9oLrEcexB9Ulzob9uWYOWcxrip8xfs67GmwWzR60Rfts96mRKTsVUvYZc/2T49j7W2IdZJCVE+0tnio+CHUcMw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(86362001)(36860700001)(2906002)(356005)(81166007)(82740400003)(40460700003)(55016003)(40480700001)(33656002)(47076005)(82310400005)(316002)(7696005)(54906003)(110136005)(70206006)(4326008)(70586007)(8676002)(52536014)(9686003)(41300700001)(6506007)(966005)(53546011)(26005)(8936002)(83380400001)(5660300002)(478600001)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 03:00:40.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c281917f-c0f5-4a6b-0bff-08daf9002ed3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5330

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgNzoyNA0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPjsgSmlhbWVpIFhpZQ0KPiA8SmlhbWVpLlhpZUBhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA0LzQwXSB4ZW4vYXJtOiBhZGQgYW4gb3B0aW9u
IHRvIGRlZmluZSBYZW4gc3RhcnQNCj4gYWRkcmVzcyBmb3IgQXJtdjgtUg0KPiANCj4gSGkgUGVu
bnksDQo+IA0KPiBPbiAxMy8wMS8yMDIzIDA1OjI4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBG
cm9tOiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPg0KPiA+IE9uIEFybXY4LUEsIFhl
biBoYXMgYSBmaXhlZCB2aXJ0dWFsIHN0YXJ0IGFkZHJlc3MgKGxpbmsgYWRkcmVzcw0KPiA+IHRv
bykgZm9yIGFsbCBBcm12OC1BIHBsYXRmb3Jtcy4gSW4gYW4gTU1VIGJhc2VkIHN5c3RlbSwgWGVu
IGNhbg0KPiA+IG1hcCBpdHMgbG9hZGVkIGFkZHJlc3MgdG8gdGhpcyB2aXJ0dWFsIHN0YXJ0IGFk
ZHJlc3MuIFNvLCBvbg0KPiA+IEFybXY4LUEgcGxhdGZvcm1zLCB0aGUgWGVuIHN0YXJ0IGFkZHJl
c3MgZG9lcyBub3QgbmVlZCB0byBiZQ0KPiA+IGNvbmZpZ3VyYWJsZS4gQnV0IG9uIEFybXY4LVIg
cGxhdGZvcm1zLCB0aGVyZSBpcyBubyBNTVUgdG8gbWFwDQo+ID4gbG9hZGVkIGFkZHJlc3MgdG8g
YSBmaXhlZCB2aXJ0dWFsIGFkZHJlc3MgYW5kIGRpZmZlcmVudCBwbGF0Zm9ybXMNCj4gPiB3aWxs
IGhhdmUgdmVyeSBkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZSBsYXlvdXQuIFNvIFhlbiBjYW5ub3Qg
dXNlDQo+ID4gYSBmaXhlZCBwaHlzaWNhbCBhZGRyZXNzIG9uIE1QVSBiYXNlZCBzeXN0ZW0gYW5k
IG5lZWQgdG8gaGF2ZSBpdA0KPiA+IGNvbmZpZ3VyYWJsZS4NCj4gPg0KPiA+IEluIHRoaXMgcGF0
Y2ggd2UgaW50cm9kdWNlIG9uZSBLY29uZmlnIG9wdGlvbiBmb3IgdXNlcnMgdG8gZGVmaW5lDQo+
ID4gdGhlIGRlZmF1bHQgWGVuIHN0YXJ0IGFkZHJlc3MgZm9yIEFybXY4LVIuIFVzZXJzIGNhbiBl
bnRlciB0aGUNCj4gPiBhZGRyZXNzIGluIGNvbmZpZyB0aW1lLCBvciBzZWxlY3QgdGhlIHRhaWxv
cmVkIHBsYXRmb3JtIGNvbmZpZw0KPiA+IGZpbGUgZnJvbSBhcmNoL2FybS9jb25maWdzLg0KPiA+
DQo+ID4gQW5kIGFzIHdlIGludHJvZHVjZWQgQXJtdjgtUiBwbGF0Zm9ybXMgdG8gWGVuLCB0aGF0
IG1lYW5zIHRoZQ0KPiA+IGV4aXN0ZWQgQXJtNjQgcGxhdGZvcm1zIHNob3VsZCBub3QgYmUgbGlz
dGVkIGluIEFybXY4LVIgcGxhdGZvcm0NCj4gPiBsaXN0LCBzbyB3ZSBhZGQgIUFSTV9WOFIgZGVw
ZW5kZW5jeSBmb3IgdGhlc2UgcGxhdGZvcm1zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2Vp
IENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbWVpLlhpZSA8
amlhbWVpLnhpZUBhcm0uY29tPg0KPiANCj4gWW91ciBzaWduZWQtb2ZmLWJ5IGlzIG1pc3Npbmcu
DQo+IA0KPiA+IC0tLQ0KPiA+IHYxIC0+IHYyOg0KPiA+IDEuIFJlbW92ZSB0aGUgcGxhdGZvcm0g
aGVhZGVyIGZ2cF9iYXNlci5oLg0KPiA+IDIuIFJlbW92ZSB0aGUgZGVmYXVsdCBzdGFydCBhZGRy
ZXNzIGZvciBmdnBfYmFzZXI2NC4NCj4gPiAzLiBSZW1vdmUgdGhlIGRlc2NyaXB0aW9uIG9mIGRl
ZmF1bHQgYWRkcmVzcyBmcm9tIGNvbW1pdCBsb2cuDQo+ID4gNC4gQ2hhbmdlIEhBU19NUFUgdG8g
QVJNX1Y4UiBmb3IgWGVuIHN0YXJ0IGFkZHJlc3MgZGVwZW5kZW5jeS4NCj4gPiAgICAgTm8gbWF0
dGVyIEFybS12OHIgYm9hcmQgaGFzIE1QVSBvciBub3QsIGl0IGFsd2F5cyBuZWVkIHRvDQo+ID4g
ICAgIHNwZWNpZnkgdGhlIHN0YXJ0IGFkZHJlc3MuDQo+IA0KPiBJIGRvbid0IHF1aXRlIHVuZGVy
c3RhbmQgdGhlIGxhc3Qgc2VudGVuY2UuIEFyZSB5b3Ugc2F5aW5nIHRoYXQgaXQgaXMNCj4gcG9z
c2libGUgdG8gaGF2ZSBhbiBBUk12OC1SIHN5c3RlbSB3aXRoIGFuIE1QVSBub3IgYSBwYWdlLXRh
YmxlPw0KPiANCg0KWWVzLCBmcm9tIHRoZSBDb3J0ZXgtUjgyIHBhZ2UgWzFdLCB5b3UgY2FuIHNl
ZSB0aGUgTVBVIGlzIG9wdGlvbmFsIGluIEVMMQ0KYW5kIEVMMjoNCiJUd28gb3B0aW9uYWwgYW5k
IHByb2dyYW1tYWJsZSBNUFVzIGNvbnRyb2xsZWQgZnJvbSBFTDEgYW5kIEVMMiByZXNwZWN0aXZl
bHkuIg0KDQpBbHRob3VnaCBpdCBpcyB1bmxpa2VseSB0aGF0IHZlbmRvcnMgdXNpbmcgdGhlIEFy
bXY4LVIgSVAgd2lsbCBkbyBzbywgaXQNCmlzIGluZGVlZCBhbiBvcHRpb24uIEluIHRoZSBJRCBy
ZWdpc3RlciwgdGhlcmUgYXJlIGFsc28gcmVsYXRlZCBiaXRzIGluDQpJRF9BQTY0TU1GUjBfRUwx
IChNU0FfZnJhYykgdG8gaW5kaWNhdGUgdGhpcy4NCg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gv
YXJtL0tjb25maWcgICAgICAgICAgIHwgIDggKysrKysrKysNCj4gPiAgIHhlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvS2NvbmZpZyB8IDE2ICsrKysrKysrKysrKystLS0NCj4gPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gaW5k
ZXggYWNlNzE3OGM5YS4uYzZiNmI2MTJkMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0v
S2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gQEAgLTE0NSw2ICsx
NDUsMTQgQEAgY29uZmlnIFRFRQ0KPiA+ICAgCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBnZW5lcmlj
IFRFRSBtZWRpYXRvcnMgc3VwcG9ydC4gSXQgYWxsb3dzDQo+IGd1ZXN0cw0KPiA+ICAgCSAgdG8g
YWNjZXNzIHJlYWwgVEVFIHZpYSBvbmUgb2YgVEVFIG1lZGlhdG9ycyBpbXBsZW1lbnRlZCBpbiBY
RU4uDQo+ID4NCj4gPiArY29uZmlnIFhFTl9TVEFSVF9BRERSRVNTDQo+ID4gKwloZXggIlhlbiBz
dGFydCBhZGRyZXNzOiBrZWVwIGRlZmF1bHQgdG8gdXNlIHBsYXRmb3JtIGRlZmluZWQNCj4gYWRk
cmVzcyINCj4gPiArCWRlZmF1bHQgMA0KPiA+ICsJZGVwZW5kcyBvbiBBUk1fVjhSDQo+IA0KPiBJ
dCBpcyBzdGlsbCBwcmV0dHkgdW5jbGVhciB0byBtZSB3aGF0IHdvdWxkIGJlIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4NCj4gSEFTX01QVSBhbmQgQVJNX1Y4Ui4NCj4gDQoNCklmIHdlIGRvbid0IHdh
bnQgdG8gc3VwcG9ydCBub24tTVBVIHN1cHBvcnRlZCBBcm12OC1SLCBJIHRoaW5rIHRoZXkgYXJl
IHRoZQ0Kc2FtZS4gSU1PLCBub24tTVBVIHN1cHBvcnRlZCBBcm12OC1SIGlzIG1lYW5pbmdsZXNz
IHRvIFhlbi4NCg0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gc2V0
IHRoZSBjdXN0b21pemVkIGFkZHJlc3MgYXQgd2hpY2ggWGVuIHdpbGwNCj4gYmUNCj4gPiArCSAg
bGlua2VkIG9uIE1QVSBzeXN0ZW1zLiBUaGlzIGFkZHJlc3MgbXVzdCBiZSBhbGlnbmVkIHRvIGEg
cGFnZSBzaXplLg0KPiA+ICsNCj4gPiAgIHNvdXJjZSAiYXJjaC9hcm0vdGVlL0tjb25maWciDQo+
ID4NCj4gPiAgIGNvbmZpZyBTVEFUSUNfU0hNDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9wbGF0Zm9ybXMvS2NvbmZpZw0KPiBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZw0K
PiA+IGluZGV4IGM5M2E2YjI3NTYuLjA5MDQ3OTNhMGIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jt
cy9LY29uZmlnDQo+ID4gQEAgLTEsNiArMSw3IEBADQo+ID4gICBjaG9pY2UNCj4gPiAgIAlwcm9t
cHQgIlBsYXRmb3JtIFN1cHBvcnQiDQo+ID4gICAJZGVmYXVsdCBBTExfUExBVA0KPiA+ICsJZGVm
YXVsdCBGVlBfQkFTRVIgaWYgQVJNX1Y4Ug0KPiA+ICAgCS0tLWhlbHAtLS0NCj4gPiAgIAlDaG9v
c2Ugd2hpY2ggaGFyZHdhcmUgcGxhdGZvcm0gdG8gZW5hYmxlIGluIFhlbi4NCj4gPg0KPiA+IEBA
IC04LDEzICs5LDE0IEBAIGNob2ljZQ0KPiA+DQo+ID4gICBjb25maWcgQUxMX1BMQVQNCj4gPiAg
IAlib29sICJBbGwgUGxhdGZvcm1zIg0KPiA+ICsJZGVwZW5kcyBvbiAhQVJNX1Y4Ug0KPiA+ICAg
CS0tLWhlbHAtLS0NCj4gPiAgIAlFbmFibGUgc3VwcG9ydCBmb3IgYWxsIGF2YWlsYWJsZSBoYXJk
d2FyZSBwbGF0Zm9ybXMuIEl0IGRvZXNuJ3QNCj4gPiAgIAlhdXRvbWF0aWNhbGx5IHNlbGVjdCBh
bnkgb2YgdGhlIHJlbGF0ZWQgZHJpdmVycy4NCj4gPg0KPiA+ICAgY29uZmlnIFFFTVUNCj4gPiAg
IAlib29sICJRRU1VIGFhcmNoIHZpcnQgbWFjaGluZSBzdXBwb3J0Ig0KPiA+IC0JZGVwZW5kcyBv
biBBUk1fNjQNCj4gPiArCWRlcGVuZHMgb24gQVJNXzY0ICYmICFBUk1fVjhSDQo+ID4gICAJc2Vs
ZWN0IEdJQ1YzDQo+ID4gICAJc2VsZWN0IEhBU19QTDAxMQ0KPiA+ICAgCS0tLWhlbHAtLS0NCj4g
PiBAQCAtMjMsNyArMjUsNyBAQCBjb25maWcgUUVNVQ0KPiA+DQo+ID4gICBjb25maWcgUkNBUjMN
Cj4gPiAgIAlib29sICJSZW5lc2FzIFJDYXIzIHN1cHBvcnQiDQo+ID4gLQlkZXBlbmRzIG9uIEFS
TV82NA0KPiA+ICsJZGVwZW5kcyBvbiBBUk1fNjQgJiYgIUFSTV9WOFINCj4gPiAgIAlzZWxlY3Qg
SEFTX1NDSUYNCj4gPiAgIAlzZWxlY3QgSVBNTVVfVk1TQQ0KPiA+ICAgCS0tLWhlbHAtLS0NCj4g
PiBAQCAtMzEsMTQgKzMzLDIyIEBAIGNvbmZpZyBSQ0FSMw0KPiA+DQo+ID4gICBjb25maWcgTVBT
T0MNCj4gPiAgIAlib29sICJYaWxpbnggVWx0cmFzY2FsZSsgTVBTb0Mgc3VwcG9ydCINCj4gPiAt
CWRlcGVuZHMgb24gQVJNXzY0DQo+ID4gKwlkZXBlbmRzIG9uIEFSTV82NCAmJiAhQVJNX1Y4Ug0K
PiA+ICAgCXNlbGVjdCBIQVNfQ0FERU5DRV9VQVJUDQo+ID4gICAJc2VsZWN0IEFSTV9TTU1VDQo+
ID4gICAJLS0taGVscC0tLQ0KPiA+ICAgCUVuYWJsZSBhbGwgdGhlIHJlcXVpcmVkIGRyaXZlcnMg
Zm9yIFhpbGlueCBVbHRyYXNjYWxlKyBNUFNvQw0KPiA+DQo+ID4gK2NvbmZpZyBGVlBfQkFTRVIN
Cj4gPiArCWJvb2wgIkZpeGVkIFZpcnR1YWwgUGxhdGZvcm0gQmFzZVIgc3VwcG9ydCINCj4gPiAr
CWRlcGVuZHMgb24gQVJNX1Y4Ug0KPiA+ICsJaGVscA0KPiA+ICsJICBFbmFibGUgcGxhdGZvcm0g
c3BlY2lmaWMgY29uZmlndXJhdGlvbnMgZm9yIEZpeGVkIFZpcnR1YWwNCj4gPiArCSAgUGxhdGZv
cm0gQmFzZVINCj4gDQo+IFRoaXMgc2VlbXMgdW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2guDQo+IA0K
DQpDYW4gd2UgYWRkIHNvbWUgZGVzY3JpcHRpb25zIGluIGNvbW1pdCBsb2cgZm9yIHRoaXMgY2hh
bmdlLCBvciB3ZQ0KU2hvdWxkIG1vdmUgaXQgdG8gYSBuZXcgcGF0Y2g/IFdlIGhhZCBwcmVmZXJy
ZWQgdG8gdXNlIHNlcGFyYXRlDQpwYXRjaGVzIGZvciB0aGlzIGtpbmQgb2YgY2hhbmdlcywgYnV0
IHdlIGZvdW5kIHRoZSBudW1iZXIgb2YgcGF0Y2hlcw0Kd291bGQgYmVjb21lIG1vcmUgYW5kIG1v
cmUuIFRoaXMgcHJvYmxlbSBoYXMgYmVlbiBib3RoZXJpbmcgdXMgZm9yDQpvcmdhbml6aW5nIHBh
dGNoZXMuDQoNClsxXSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL1Byb2Nlc3NvcnMvQ29ydGV4
LVI4Mg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+ID4gKw0KPiA+ICAgY29uZmlnIE5PX1BMQVQN
Cj4gPiAgIAlib29sICJObyBQbGF0Zm9ybXMiDQo+ID4gKwlkZXBlbmRzIG9uICFBUk1fVjhSDQo+
ID4gICAJLS0taGVscC0tLQ0KPiA+ICAgCURvIG5vdCBlbmFibGUgc3BlY2lmaWMgc3VwcG9ydCBm
b3IgYW55IHBsYXRmb3JtLg0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg==

