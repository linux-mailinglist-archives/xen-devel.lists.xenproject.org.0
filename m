Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB954D8B16
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 18:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290398.492461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTopw-0005oM-TC; Mon, 14 Mar 2022 17:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290398.492461; Mon, 14 Mar 2022 17:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTopw-0005kt-PB; Mon, 14 Mar 2022 17:50:28 +0000
Received: by outflank-mailman (input) for mailman id 290398;
 Mon, 14 Mar 2022 17:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTopu-0005kn-Ix
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 17:50:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39f3299c-a3bf-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 18:50:25 +0100 (CET)
Received: from AM7PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:20b:130::23)
 by AM6PR08MB4149.eurprd08.prod.outlook.com (2603:10a6:20b:b0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 17:50:17 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::14) by AM7PR03CA0013.outlook.office365.com
 (2603:10a6:20b:130::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Mon, 14 Mar 2022 17:50:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 17:50:16 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Mon, 14 Mar 2022 17:50:15 +0000
Received: from aab43fb04fd5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CDCF891-5CFE-499A-85F1-9F5DCDF2CABF.1; 
 Mon, 14 Mar 2022 17:50:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aab43fb04fd5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 17:50:09 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 17:50:07 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 17:50:07 +0000
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
X-Inumbo-ID: 39f3299c-a3bf-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiG+/a6mvwD6GubzpusYumkwSGLXGuQwmI4TO6kbxUY=;
 b=wxoimGHJZldPMufcVGeEep+EGiU92LKeljJuipvO5I04++9lpWY7mTzbROp5yguXeYbm7ZiMxlhwCp3Qd/NAX4k56SKZeVnkLs6ouhy+W3nu1vy7dVT6P7mXpF+S1tXm4XwwZ4ddGiq4uaBZ7upghuPziuZFeQK4lXa5Lr6VaHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd5e977986559a17
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVv1wg57utP8vH/2pxROAY3hK+PdBK4AbqiRyqQtEC9G/AuZRDg9AaLNWI4F6bfx8FMS3GtYd/LBy1p5f5UkxqL99zyjElCW0mG/gtqdemjC47Mi0metAggEY25fyJKHGuyr+gf2Pd9eOWWef7viFqOkBwV3cGJ4ujmNZ7jdZmd7dIZaKMgqhONO3EjA9CyRVbzwPb7ZOHfYc/CkFc9OLb43Sgi7Alnf/22aKbqkz3mWGIXfn6F3rLHlonb2pJTgQvYwKNIcD1wdu+PrjTice/tsg2OXGFDBhmo5+1sGUD3HAMvqgol3CqzKy3VLiI26L9U7o5KJd15EZuytqOjQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiG+/a6mvwD6GubzpusYumkwSGLXGuQwmI4TO6kbxUY=;
 b=eTfVB9ifjLvugLr2TRIeqlKUs4awO7mRLAkE05IVMbteoYhstD87sgjHPzTnOG+GzcNc2e7vXogrx1J7KtlMAClH0pdCC2GlAgYxW1XxtGB4IwQ+W6iEoGlcHfETnMCrqbsfEhq+vWcS3wMfUl+0tZfR3x2YD4BbmGOZKX2X6yE/GAvK0Kq1MYcd8N9MiF18/wQjjMLeUd49dCBz733Tp9x7Q4EU2pNbKdbT9rE0MEX03nHCnjAdeTWzZ6CClXgXHlE4YAoMDFqbe6CsuOmAT9Smni/0CUBo7HKr7fJhsAa5lz7ZCNVM9iQtUG2NEP1govtG4G53vQ0wYDeJx2YrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiG+/a6mvwD6GubzpusYumkwSGLXGuQwmI4TO6kbxUY=;
 b=wxoimGHJZldPMufcVGeEep+EGiU92LKeljJuipvO5I04++9lpWY7mTzbROp5yguXeYbm7ZiMxlhwCp3Qd/NAX4k56SKZeVnkLs6ouhy+W3nu1vy7dVT6P7mXpF+S1tXm4XwwZ4ddGiq4uaBZ7upghuPziuZFeQK4lXa5Lr6VaHk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [XEN][RFC PATCH v3 09/14] xen/iommu: Introduce
 iommu_remove_dt_device()
Thread-Topic: [XEN][RFC PATCH v3 09/14] xen/iommu: Introduce
 iommu_remove_dt_device()
Thread-Index: AQHYMyV0f/eLDa9bQkuzPbuk19t2X6y/MZYA
Date: Mon, 14 Mar 2022 17:50:07 +0000
Message-ID: <996B7C26-0D15-40FC-BE58-84B4A1F51A62@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-10-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-10-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bdf15f30-ed92-4c14-6af1-08da05e3191c
x-ms-traffictypediagnostic:
	DBBPR08MB4821:EE_|VE1EUR03FT014:EE_|AM6PR08MB4149:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4149E71C85A5ED94E4205F2CE40F9@AM6PR08MB4149.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rnsqms4XereQtxEt1olZeDWhgpdhLgxTV6WaGAbgt0hd5Uy94K4+w+wcbQGo1ypOFr0uag6iVIVdLKPZh73aDKnTk79VYsy85aKkeDIiAEPq/kh5u2OugAq4AYLvwUJ9TwlohL2BuQRepkYxbzxsSDoDd8qgihCHhtYv2SiKFoQ8NdaYaVUFNB/68u2/Wv1wkHjFAqBXNELrdyMjLxlk/mQXjppMRvZq/DwUCYl1jIiuFoM5B3GXAvbDPj5jsSRtKMBETbhoYd0dAJZDUr2apszgfHTXJ697jog0wkU6KT4GFow5+DiyAU88pfKemUnaS9sEbmHqwDX0MJ5ZjvScuimTggZ/O6EntH2ClneYaqYx/P8Fix1rZSSlsRUrec4FxPqogSgwwJ3h4L5VhcoutJHB6weZBG+7yeOqkhIo/MYF+GiaH/hjNnLbKduGAXbj5/0nERw9GMAvSSUNmiLEIwSvrKc8PZwxc+QN6xPH6GRNixc0lo9g4LfGORUz+P0yssyFXMz5RUfFnAA96Cyn7VIPGH/kqHnOMSGcdoeqA/FZMePc90rdt6T05uWHUdBr1QKLk1LsBrFwistWsD8lmeEkArZbpAsIwZ81vm3nl0m72B68n9/3yLEclhpeHKyhWBPwWFfGr6ma6QqllhwdLuTPfbGUr7yVy7qM4LwJYU/uQeGPctbRACJ2qnMn1VykN3zF6kbfRhQlNxNa1lNKaL+aT+b+vZBpoDeNpoNLuDtTcXONMDkg2sZXvitqHI1q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(508600001)(186003)(26005)(6486002)(6512007)(6506007)(71200400001)(33656002)(122000001)(38070700005)(38100700002)(86362001)(8936002)(4326008)(8676002)(64756008)(66946007)(66446008)(66476007)(66556008)(83380400001)(2906002)(91956017)(36756003)(54906003)(76116006)(316002)(6916009)(5660300002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <20A3933821160245B389E8BFAAC43BBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7a9f19e-334a-4c54-654a-08da05e31406
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPeCzRZW/3QdG9nX+Ca7NRBwKOMbIkbFpqchTpRCziUaMWVZOTZhbMdgS4UtUh3eqzUlvlhGG8NtYX7ixNCB7bB8rA6GdAq/Xg1tJWE0g7sllDbeulapkCtNKko2ts57I/zyDS+kkoOlSt899PI6tYyYJgWU6YEsfTflCTQm4zUr4gBQ+5WY1Mx37sPPguzfTGHEJftB0IXdJx2jVGWHQ3zgGVYh8a2eVs4WP1THiSYKcTFFFtEFnyKtpZrivHhYzvgxgriVvxJHdXiBb1NSBbfLxBReWDCDavpwK+SMHLkpUqBlze2Y+qUBdNPDo/DKeJfUH9EclYd2Zp5TDaFaePBdf+iyFuTpD8ipbaxhmVCaTstMhjfkp2gyNvND3ilyvxWtO8j40/9OfuqHFPZVGnrGJ6cSQfRvIt5E154Bd9/n+pkA888Wbg3WZcV3ic9bJv/ftEhvPTCgk04ED9hdV35PbfciQhD2SWfbqNr4gl47Krmzd+qX/nclwS3KWCFdgj4pyxz7hmehpIlRdFPKGPMsC+OZbzYcsrSpSKCK1YNfscjs6DJyojGmu4Geu17+swodYtigzlfuQSX++jWmW4IML/fqlo/SwtZd2FKF2LEk64nXBKD8ylojxTwUUGxRY9VG0v+Ox4mWJNxX9K5DxZr+3sTsnhTsmz7fdqpbJQoM9zHRU4e2zBPU3katwLEs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(8676002)(6862004)(81166007)(356005)(40460700003)(186003)(83380400001)(86362001)(2616005)(6512007)(6506007)(47076005)(26005)(336012)(36756003)(70586007)(70206006)(508600001)(82310400004)(316002)(54906003)(36860700001)(33656002)(8936002)(6486002)(4744005)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 17:50:16.2260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf15f30-ed92-4c14-6af1-08da05e3191c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4149

DQo+ICtpbnQgaW9tbXVfcmVtb3ZlX2R0X2RldmljZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5w
KQ0KPiArew0KPiArICAgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKm9wcyA9IGlvbW11X2dldF9v
cHMoKTsNCj4gKyAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkdF90b19kZXYobnApOw0KPiArICAg
IGludCByYzsNCj4gKw0KPiArICAgIGlmICggIW9wcyApDQo+ICsgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsNCg0KSGVyZSB3ZSBoYXZlIHRoYXQgdGhlIGNvdW50ZXJwYXJ0IGlvbW11X2FkZF9k
dF9kZXZpY2UgcmV0dXJucyBFSU5WQUwgaGVyZSBhbmQuLi4NCg0KPiArDQo+ICsgICAgc3Bpbl9s
b2NrKCZkdGRldnNfbG9jayk7DQo+ICsNCj4gKyAgICBpZiAoIGlvbW11X2R0X2RldmljZV9pc19h
c3NpZ25lZF9sb2NrKG5wKSApIHsNCj4gKyAgICAgICAgcmMgPSAtRUJVU1k7DQo+ICsgICAgICAg
IGdvdG8gZmFpbDsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIFRoZSBkcml2
ZXIgd2hpY2ggc3VwcG9ydHMgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5ncyBtdXN0IGhhdmUNCj4g
KyAgICAgKiB0aGVzZSBjYWxsYmFjayBpbXBsZW1lbnRlZC4NCj4gKyAgICAgKi8NCj4gKyAgICBp
ZiAoICFvcHMtPnJlbW92ZV9kZXZpY2UgKSB7DQo+ICsgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7
DQoNCuKApiBoZXJlIChmb3IgIW9wcy0+YWRkX2RldmljZSksIHNvIEnigJltIHdvbmRlcmluZyBp
ZiB0aGVyZSBpcyBhIG1pc3Rha2UuDQoNCj4gKyAgICAgICAgZ290byBmYWlsOw0KPiArICAgIH0N
Cj4gKw0KDQo=

