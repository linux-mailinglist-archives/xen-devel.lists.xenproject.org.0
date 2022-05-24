Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E05321A5
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 05:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336140.560463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntLOW-0001dJ-Dt; Tue, 24 May 2022 03:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336140.560463; Tue, 24 May 2022 03:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntLOW-0001Zr-AA; Tue, 24 May 2022 03:39:40 +0000
Received: by outflank-mailman (input) for mailman id 336140;
 Tue, 24 May 2022 03:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aI9d=WA=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ntLOU-0001Zf-Lm
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 03:39:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 217f06b7-db13-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 05:39:36 +0200 (CEST)
Received: from AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30)
 by DB9PR08MB6377.eurprd08.prod.outlook.com (2603:10a6:10:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 03:39:32 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::e2) by AM7PR03CA0020.outlook.office365.com
 (2603:10a6:20b:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Tue, 24 May 2022 03:39:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 03:39:31 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 24 May 2022 03:39:31 +0000
Received: from 345f871bd50d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E12282F-37BB-449F-954A-FBA8D07442A1.1; 
 Tue, 24 May 2022 03:39:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 345f871bd50d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 03:39:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB6758.eurprd08.prod.outlook.com (2603:10a6:20b:39a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Tue, 24 May
 2022 03:39:18 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 03:39:18 +0000
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
X-Inumbo-ID: 217f06b7-db13-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SZtki8n0Q5iSYvCKDtVErz83ns6FQ+03uEJRr3wadO/f9fh1IGiStOjnc1xaRdtIsRQDSs6KpaKEtt1ltjsnGGMZiT7tOL8wOIJhTr53YgakVAdHfWMiHdypJcFNLvw/ckh2gUVz85LMTjhlzQ3StCvntRI3keHV16NO1MN3bUOQOeZPAKMlhpCCQfNGMRnzHT8FnUC2GaAX7e74emdl969LYAvRW6l0uKdZsVl1tjAYw5PfLPmoYCBvy9KNGPWgFg2u6wFhce3pqOIewVrQks/mNXPZdT8cfTnVDZd14L5KmUvsZry25Dn+yiHKZX8+FLUq5W4wEbBtOez7GZ5fHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j5+e8nvvx8Iz1kQEQ2og9dWLYJPFNkP1BWFq1A/U+U=;
 b=d6nSELZf/JT/XCQKfrtbiUctQWoY+orW1XowE6COLVDL7VrtKTB3DZUquBH+4uEGyyoieLKmUiW/WbQy7VagWbzI25tZXh35vTyS26lhLWJeANV7QBFnOClkdCAun/9Zf1H5DimUn4CK79NX29lw9Zmb5Vn8ksD1E0w06wZzxKK+39WSUo6sMdFjrPC/1t4q/xUZHqNshR0/0itelca3znNvVogVPlhfMJ6zXst93TtQa1dNk/FdeJQ83hbwkoWWOdWx6XHSSk0Yo5iP3/aKGka6lnOoI2BNNPWe5RaN27K8+ThkQ1MGFMh6BdQsfFy32nzw1QSki8TBvj8i/IH2Hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j5+e8nvvx8Iz1kQEQ2og9dWLYJPFNkP1BWFq1A/U+U=;
 b=F97IPcuXnA7mMuDQv7Pyze4qQUoA2aWNlMFC2mV1C17cewKgh9XZjN54O1KLv7QYUv6S/skKOGr4+4THJ5W65acN4xBxL6hq79be65uCGCVJqsg4FbSNUMbuGzKJwjeNLkE3k0OwjYLr+UnaSj6qdMs2jjGt2ql2UbqDjIkIz6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxh1PmNhwEk7KtcnSulwAD4eUXpl21qGdkqsoaBXI8IDcOTuD0aEjrtBBvMxn+8qLLk+h+96ZSsZt63B9dfPbpYlkIfos03eKMQ+Az+mNPz8tvsVzMJhYQqkxc5cGxYx6top1eloIsfSwg7k0l+IAB65e04ChZfvqKhlT0DKwI6Tj6I4jxSSoiXIUtvH6v4Pci+pSOukUMR36eoxime00SYk6K2HNZB0PxZcvf+C1wTeeKqRDUbROxR1QDha0eWCM7ESW1dxx3mYsi7SpI/NNSfSeB/oPzgaWvIErVLPKM1lk7ethsoqOsbfNchrnBu92TBh/5MyX/E60CTZr3nhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j5+e8nvvx8Iz1kQEQ2og9dWLYJPFNkP1BWFq1A/U+U=;
 b=j9XAsFp6tB6eSK7I6qLKrBsaW4ohVmXrNegqVb3+4r0opOuWzjNEUiONjjp8fhNHWcEIbKcKky3ED4FES4GbLPIrFpbCWMugkp+AmEpLpR5FuDG1XO3zA0wy6UFEyYWiqQPvMyILuNPOXNnINn/l+ctNz2t8bs5DfSglWEKIONe7CnA9AiQtaiDBHi2T6tgMp9Bgq/3ehth5r4o26Ga5LrlHzLWKsZjmwZxfzv0GB4ruEv8Tz/CNVFjyS0828AHFtAHM1aTHoQVjHRIgbOeQOAcG2eLig6KG0z+7hozomQr7W84MOfsJ5/7ahJs9b6NOVrRhA4qV3int6ENFe4UziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j5+e8nvvx8Iz1kQEQ2og9dWLYJPFNkP1BWFq1A/U+U=;
 b=F97IPcuXnA7mMuDQv7Pyze4qQUoA2aWNlMFC2mV1C17cewKgh9XZjN54O1KLv7QYUv6S/skKOGr4+4THJ5W65acN4xBxL6hq79be65uCGCVJqsg4FbSNUMbuGzKJwjeNLkE3k0OwjYLr+UnaSj6qdMs2jjGt2ql2UbqDjIkIz6c=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: RE: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYbt50tGidbD5g50ygNS2KCABD4q0tYcLA
Date: Tue, 24 May 2022 03:39:18 +0000
Message-ID:
 <PAXPR08MB74207875B1EB2097E63B9C789ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523194953.70636-1-julien@xen.org>
In-Reply-To: <20220523194953.70636-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F6B82C075C64124CAC9065EA26B05892.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b0fd1fd7-b27a-44ae-8e3d-08da3d370367
x-ms-traffictypediagnostic:
	AS8PR08MB6758:EE_|VE1EUR03FT052:EE_|DB9PR08MB6377:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6377A14F4FF29F842F8545C79ED79@DB9PR08MB6377.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RtbvKUGGj9r6Tpn3Ul6tpTiO7W30au/5G/Dox5gyHfINboGCnGdziCKx7l1sx+ojI9dceLZEgIOqpJ+y6dqbb7Tfc0H5znJT0uCSQ/1ym352qCYaaHpWipkZncNAasY4I0pGq6/A1RkhNGKwCY2U//fI/bmzjTwVRpwKJKrl1dIR5SUQEuCsGRpSQZkxfGukNgpJhMyg3SopWg88WXqATb9i6gXJWUrvkLZas/AUZOYEeJ6Bd1BRm13nFxeJJ2ZpeRQCjnns8x3cYC4/WI5/y9DIwkAi2u+9r6ONZyTV0zHZ7zGPmVqeBRl47EbBw0t4TpWknK13V0LgTDdp1488MPGsQUIimieN8IN+EM2cyOKjJsTbIiGJyAZqZ/PowI+vOvkxgMM1LsHvIA3Lc9Ud1+mYs26syD/AYhZN477QrT21TnANQIO3o6DICu5jrAoEM2CABD4zc0T5nEi2ohYwEAN/hQ+skbL2Q0VQ3b5MSWQtGXzkxUkf0N9eqXBTtBx9ZlyLH+Htez+eN07tqKRzMmPnZLotiiOBdI+vO11YMi3N9eZB3pAFpukmEIt5XuJvGoXObZhbxT+f/fj2iB0oOfSbNZkeYBN626wWelAwRozn3fkIuABRzqIBJjpOcz8oSalNEAKfO2BvnKOGfzbXbSP6ig1SnJeHqqreI2Zupdv6QzZfQLuevIWNqzZPpdwF9t3qNlOapBTqWPgkSayyzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(316002)(122000001)(4326008)(54906003)(52536014)(8936002)(5660300002)(38100700002)(110136005)(8676002)(64756008)(66556008)(66476007)(66946007)(66446008)(38070700005)(86362001)(53546011)(76116006)(6506007)(2906002)(33656002)(55016003)(83380400001)(7696005)(71200400001)(508600001)(26005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6758
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53fd10c2-ea02-4639-7c00-08da3d36fb9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SP9LrtQRCYrv9+BCooExU2NfGp9NYBxV2iPieKKahCNBQvhjmjKAppu+5QmZY6b+alhJOssWjut8jhy7GvHbC2wl95x/YIgYIUQPcarE99Svuux/ZaGVWlvnFJ1gDejyAfEES2JE7+X9mBfiJlFdDQOkHum6yUB4TJ1nvpdYT+fl6eqEiKYsXa76Z8DsFHHhlC14eOFqqfjcY+/F3ED8gQaD/qJ7vHCgHCpsaS/W7khqvXXL/ccItUP+strVYklYdDtl3G7dcbQd/P93F4QTtFYnqEu/R5cZosRy+TnUPIonERoWP1ZWnqU6tqWC1fbQX/0C995WrIO15BaF+prcP1ZXEnyQG5oWDxube2AbasF/tP2OhPDKVpkEkPTSucTVaVB3nHIBFqEfdITAOsg4L6thMuhi4GS9t+glXDrn2hZ5fiaLYky1+qBaLVignSBLnaJOJfeEac+B/K5Pe/Uh+2waFrN37W/0P/NKnLQeGp6FHtwRZ36cZpUADFIOrk7GmMkKfv9jMYyyTfkrrf0f9ycu+FJq/uGd9U8Vvn0a5Ws4EmoYnIWb4tf94GEfFA0AAUszkF0VdmsiTUzpXGmY5rhAyoNVnXlDHwog5Lw7v5qOUCsqiCBs2iT2HjnH/i1wp3l1u+8NR3qU0PqOLZruESEHeY9bkhgATCiMLZKg6h4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(70206006)(110136005)(336012)(52536014)(83380400001)(8936002)(508600001)(53546011)(82310400005)(186003)(55016003)(6506007)(33656002)(2906002)(81166007)(107886003)(5660300002)(8676002)(4326008)(356005)(26005)(316002)(9686003)(40460700003)(7696005)(86362001)(36860700001)(47076005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 03:39:31.4512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fd1fd7-b27a-44ae-8e3d-08da3d370367
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6377

KHJlc2VuZCBhZ2Fpbiwgc2VlbXMgdGhlIGZpcnN0IG9uZSBpcyBmYWlsZWQpDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNl
c0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEp1bGllbiBHcmFsbA0KPiBT
ZW50OiAyMDIyxOo11MIyNMjVIDM6NTANCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzoganVsaWVuQHhlbi5vcmc7IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsN
Cj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndh
bGxAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSB4ZW4vYXJtOiBSZW1vdmUgbW9zdCBv
ZiB0aGUgKl9WSVJUX0VORCBkZWZpbmVzDQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFs
bEBhbWF6b24uY29tPg0KPiANCj4gQXQgdGhlIG1vbWVudCwgKl9WSVJUX0VORCBtYXkgZWl0aGVy
IHBvaW50IHRvIHRoZSBhZGRyZXNzIGFmdGVyIHRoZSBlbmQNCj4gb3IgdGhlIGxhc3QgYWRkcmVz
cyBvZiB0aGUgcmVnaW9uLg0KPiANCj4gVGhlIGxhY2sgb2YgY29uc2lzdGVuY3kgbWFrZSBxdWl0
ZSBkaWZmaWN1bHQgdG8gcmVhc29uIHdpdGggdGhlbS4NCj4gDQo+IEZ1cnRoZXJtb3JlLCB0aGVy
ZSBpcyBhIHJpc2sgb2Ygb3ZlcmZsb3cgaW4gdGhlIGNhc2Ugd2hlcmUgdGhlIGFkZHJlc3MNCj4g
cG9pbnRzIHBhc3QgdG8gdGhlIGVuZC4gSSBhbSBub3QgYXdhcmUgb2YgYW55IGNhc2VzLCBzbyB0
aGlzIGlzIG9ubHkgYQ0KPiBsYXRlbnQgYnVnLg0KPiANCj4gU3RhcnQgdG8gc29sdmUgdGhlIHBy
b2JsZW0gYnkgcmVtb3ZpbmcgYWxsIHRoZSAqX1ZJUlRfRU5EIGV4Y2x1c2l2ZWx5IHVzZWQNCj4g
YnkgdGhlIEFybSBjb2RlIGFuZCBhZGQgKl9WSVJUX1NJWkUgd2hlbiBpdCBpcyBub3QgcHJlc2Vu
dC4NCj4gDQo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlbmFtZSBCT09UX0ZEVF9TTE9UX1NJ
WkUgdG8gQk9PVF9GRFRfVklSVF9TSVpFDQo+IGZvciBiZXR0ZXIgY29uc2lzdGVuY3kgYW5kIHVz
ZSBfQVQodmFkZHJfdCwgKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdy
YWxsQGFtYXpvbi5jb20+DQo+IA0KPiAtLS0tDQo+IA0KPiBJIG5vdGljZWQgdGhhdCBhIGZldyBm
dW5jdGlvbnMgaW4gWGVuIGV4cGVjdCBbc3RhcnQsIGVuZFsuIFRoaXMgaXMgcmlza3kNCj4gYXMg
d2UgbWF5IGVuZCB1cCB3aXRoIGVuZCA8IHN0YXJ0IGlmIHRoZSByZWdpb24gaXMgZGVmaW5lZCBy
aWdodCBhdCB0aGUNCj4gdG9wIG9mIHRoZSBhZGRyZXNzIHNwYWNlLg0KPiANCj4gSSBoYXZlbid0
IHlldCB0YWNrbGUgdGhpcyBpc3N1ZS4gQnV0IEkgd291bGQgYXQgbGVhc3QgbGlrZSB0byBnZXQg
cmlkDQo+IG9mICpfVklSVF9FTkQuDQo+IC0tLQ0KPiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2NvbmZpZy5oIHwgMTggKysrKysrKystLS0tLS0tLS0tDQo+ICB4ZW4vYXJjaC9hcm0vbGl2ZXBh
dGNoLmMgICAgICAgICAgfCAgMiArLQ0KPiAgeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICAg
ICAgIHwgMTMgKysrKysrKystLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCAxNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vY29uZmlnLmgNCj4gYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmgN
Cj4gaW5kZXggM2UyYTU1YTkxMDU4Li42NmRiNjE4YjM0ZTcgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWcuaA0KPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vY29uZmlnLmgNCj4gQEAgLTExMSwxMiArMTExLDExIEBADQo+ICAjZGVmaW5lIEZJWE1B
UF9BRERSKG4pICAgICAgICAoX0FUKHZhZGRyX3QsMHgwMDQwMDAwMCkgKyAobikgKiBQQUdFX1NJ
WkUpDQo+IA0KPiAgI2RlZmluZSBCT09UX0ZEVF9WSVJUX1NUQVJUICAgIF9BVCh2YWRkcl90LDB4
MDA2MDAwMDApDQo+IC0jZGVmaW5lIEJPT1RfRkRUX1NMT1RfU0laRSAgICAgTUIoNCkNCj4gLSNk
ZWZpbmUgQk9PVF9GRFRfVklSVF9FTkQgICAgICAoQk9PVF9GRFRfVklSVF9TVEFSVCArIEJPT1Rf
RkRUX1NMT1RfU0laRSkNCj4gKyNkZWZpbmUgQk9PVF9GRFRfVklSVF9TSVpFICAgICBfQVQodmFk
ZHJfdCwgTUIoNCkpDQo+IA0KPiAgI2lmZGVmIENPTkZJR19MSVZFUEFUQ0gNCj4gICNkZWZpbmUg
TElWRVBBVENIX1ZNQVBfU1RBUlQgICBfQVQodmFkZHJfdCwweDAwYTAwMDAwKQ0KPiAtI2RlZmlu
ZSBMSVZFUEFUQ0hfVk1BUF9FTkQgICAgIChMSVZFUEFUQ0hfVk1BUF9TVEFSVCArIE1CKDIpKQ0K
PiArI2RlZmluZSBMSVZFUEFUQ0hfVk1BUF9TSVpFICAgIF9BVCh2YWRkcl90LCBNQigyKSkNCj4g
ICNlbmRpZg0KPiANCj4gICNkZWZpbmUgSFlQRVJWSVNPUl9WSVJUX1NUQVJUICBYRU5fVklSVF9T
VEFSVA0KPiBAQCAtMTMyLDE4ICsxMzEsMTggQEANCj4gICNkZWZpbmUgRlJBTUVUQUJMRV9WSVJU
X0VORCAgICAoRlJBTUVUQUJMRV9WSVJUX1NUQVJUICsgRlJBTUVUQUJMRV9TSVpFIC0NCj4gMSkN
Cj4gDQo+ICAjZGVmaW5lIFZNQVBfVklSVF9TVEFSVCAgICAgICAgX0FUKHZhZGRyX3QsMHgxMDAw
MDAwMCkNCj4gKyNkZWZpbmUgVk1BUF9WSVJUX1NJWkUgICAgICAgICBfQVQodmFkZHJfdCwgR0Io
MSkgLSBNQigyNTYpKQ0KPiANCj4gICNkZWZpbmUgWEVOSEVBUF9WSVJUX1NUQVJUICAgICBfQVQo
dmFkZHJfdCwweDQwMDAwMDAwKQ0KPiAtI2RlZmluZSBYRU5IRUFQX1ZJUlRfRU5EICAgICAgIF9B
VCh2YWRkcl90LDB4N2ZmZmZmZmYpDQo+IC0jZGVmaW5lIERPTUhFQVBfVklSVF9TVEFSVCAgICAg
X0FUKHZhZGRyX3QsMHg4MDAwMDAwMCkNCj4gLSNkZWZpbmUgRE9NSEVBUF9WSVJUX0VORCAgICAg
ICBfQVQodmFkZHJfdCwweGZmZmZmZmZmKQ0KPiArI2RlZmluZSBYRU5IRUFQX1ZJUlRfU0laRSAg
ICAgIF9BVCh2YWRkcl90LCBHQigxKSkNCj4gDQo+IC0jZGVmaW5lIFZNQVBfVklSVF9FTkQgICAg
WEVOSEVBUF9WSVJUX1NUQVJUDQo+ICsjZGVmaW5lIERPTUhFQVBfVklSVF9TVEFSVCAgICAgX0FU
KHZhZGRyX3QsMHg4MDAwMDAwMCkNCj4gKyNkZWZpbmUgRE9NSEVBUF9WSVJUX1NJWkUgICAgICBf
QVQodmFkZHJfdCwgR0IoMikpDQo+IA0KPiAgI2RlZmluZSBET01IRUFQX0VOVFJJRVMgICAgICAg
IDEwMjQgIC8qIDEwMjQgMk1CIG1hcHBpbmcgc2xvdHMgKi8NCj4gDQo+ICAvKiBOdW1iZXIgb2Yg
ZG9taGVhcCBwYWdldGFibGUgcGFnZXMgcmVxdWlyZWQgYXQgdGhlIHNlY29uZCBsZXZlbCAoMk1C
DQo+IG1hcHBpbmdzKSAqLw0KPiAtI2RlZmluZSBET01IRUFQX1NFQ09ORF9QQUdFUyAoKERPTUhF
QVBfVklSVF9FTkQgLSBET01IRUFQX1ZJUlRfU1RBUlQgKw0KPiAxKSA+PiBGSVJTVF9TSElGVCkN
Cj4gKyNkZWZpbmUgRE9NSEVBUF9TRUNPTkRfUEFHRVMgKERPTUhFQVBfVklSVF9TSVpFID4+IEZJ
UlNUX1NISUZUKQ0KPiANCj4gICNlbHNlIC8qIEFSTV82NCAqLw0KPiANCj4gQEAgLTE1MiwxMiAr
MTUxLDExIEBADQo+ICAjZGVmaW5lIFNMT1QwX0VOVFJZX1NJWkUgIFNMT1QwKDEpDQo+IA0KPiAg
I2RlZmluZSBWTUFQX1ZJUlRfU1RBUlQgIEdCKDEpDQo+IC0jZGVmaW5lIFZNQVBfVklSVF9FTkQg
ICAgKFZNQVBfVklSVF9TVEFSVCArIEdCKDEpKQ0KPiArI2RlZmluZSBWTUFQX1ZJUlRfU0laRSAg
IEdCKDEpDQo+IA0KPiAgI2RlZmluZSBGUkFNRVRBQkxFX1ZJUlRfU1RBUlQgIEdCKDMyKQ0KPiAg
I2RlZmluZSBGUkFNRVRBQkxFX1NJWkUgICAgICAgIEdCKDMyKQ0KPiAgI2RlZmluZSBGUkFNRVRB
QkxFX05SICAgICAgICAgIChGUkFNRVRBQkxFX1NJWkUgLyBzaXplb2YoKmZyYW1lX3RhYmxlKSkN
Cj4gLSNkZWZpbmUgRlJBTUVUQUJMRV9WSVJUX0VORCAgICAoRlJBTUVUQUJMRV9WSVJUX1NUQVJU
ICsgRlJBTUVUQUJMRV9TSVpFIC0NCj4gMSkNCj4gDQo+ICAjZGVmaW5lIERJUkVDVE1BUF9WSVJU
X1NUQVJUICAgU0xPVDAoMjU2KQ0KPiAgI2RlZmluZSBESVJFQ1RNQVBfU0laRSAgICAgICAgIChT
TE9UMF9FTlRSWV9TSVpFICogKDI2NS0yNTYpKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2xpdmVwYXRjaC5jIGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jDQo+IGluZGV4IDc1ZThhZGNm
ZDZhMS4uNTdhYmM3NDZlNjBiIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNo
LmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jDQo+IEBAIC0xNzUsNyArMTc1LDcg
QEAgdm9pZCBfX2luaXQgYXJjaF9saXZlcGF0Y2hfaW5pdCh2b2lkKQ0KPiAgICAgIHZvaWQgKnN0
YXJ0LCAqZW5kOw0KPiANCj4gICAgICBzdGFydCA9ICh2b2lkICopTElWRVBBVENIX1ZNQVBfU1RB
UlQ7DQo+IC0gICAgZW5kID0gKHZvaWQgKilMSVZFUEFUQ0hfVk1BUF9FTkQ7DQo+ICsgICAgZW5k
ID0gc3RhcnQgKyBMSVZFUEFUQ0hfVk1BUF9TSVpFOw0KPiANCj4gICAgICB2bV9pbml0X3R5cGUo
Vk1BUF9YRU4sIHN0YXJ0LCBlbmQpOw0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9t
bS5jIGIveGVuL2FyY2gvYXJtL21tLmMNCj4gaW5kZXggYmUzNzE3NmE0NzI1Li4wNjA3YzY1Zjk1
Y2QgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9tbS5jDQo+IEBAIC0xMjgsOSArMTI4LDExIEBAIHN0YXRpYyBERUZJTkVfUEFHRV9UQUJMRSh4
ZW5fZmlyc3QpOw0KPiAgLyogeGVuX3BndGFibGUgPT0gcm9vdCBvZiB0aGUgdHJpZSAoemVyb2V0
aCBsZXZlbCBvbiA2NC1iaXQsIGZpcnN0IG9uIDMyLQ0KPiBiaXQpICovDQo+ICBzdGF0aWMgREVG
SU5FX1BFUl9DUFUobHBhZV90ICosIHhlbl9wZ3RhYmxlKTsNCj4gICNkZWZpbmUgVEhJU19DUFVf
UEdUQUJMRSB0aGlzX2NwdSh4ZW5fcGd0YWJsZSkNCj4gLS8qIHhlbl9kb21tYXAgPT0gcGFnZXMg
dXNlZCBieSBtYXBfZG9tYWluX3BhZ2UsIHRoZXNlIHBhZ2VzIGNvbnRhaW4NCj4gKy8qDQo+ICsg
KiB4ZW5fZG9tbWFwID09IHBhZ2VzIHVzZWQgYnkgbWFwX2RvbWFpbl9wYWdlLCB0aGVzZSBwYWdl
cyBjb250YWluDQo+ICAgKiB0aGUgc2Vjb25kIGxldmVsIHBhZ2V0YWJsZXMgd2hpY2ggbWFwIHRo
ZSBkb21oZWFwIHJlZ2lvbg0KPiAtICogRE9NSEVBUF9WSVJUX1NUQVJULi4uRE9NSEVBUF9WSVJU
X0VORCBpbiAyTUIgY2h1bmtzLiAqLw0KPiArICogc3RhcnRpbmcgYXQgRE9NSEVBUF9WSVJUX1NU
QVJUIGluIDJNQiBjaHVua3MuDQo+ICsgKi8NCj4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVShscGFl
X3QgKiwgeGVuX2RvbW1hcCk7DQo+ICAvKiBSb290IG9mIHRoZSB0cmllIGZvciBjcHUwLCBvdGhl
ciBDUFUncyBQVHMgYXJlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZA0KPiAqLw0KPiAgc3RhdGljIERF
RklORV9QQUdFX1RBQkxFKGNwdTBfcGd0YWJsZSk7DQo+IEBAIC00NzYsNyArNDc4LDcgQEAgbWZu
X3QgZG9tYWluX3BhZ2VfbWFwX3RvX21mbihjb25zdCB2b2lkICpwdHIpDQo+ICAgICAgaW50IHNs
b3QgPSAodmEgLSBET01IRUFQX1ZJUlRfU1RBUlQpID4+IFNFQ09ORF9TSElGVDsNCj4gICAgICB1
bnNpZ25lZCBsb25nIG9mZnNldCA9ICh2YT4+VEhJUkRfU0hJRlQpICYgWEVOX1BUX0xQQUVfRU5U
UllfTUFTSzsNCj4gDQo+IC0gICAgaWYgKCB2YSA+PSBWTUFQX1ZJUlRfU1RBUlQgJiYgdmEgPCBW
TUFQX1ZJUlRfRU5EICkNCj4gKyAgICBpZiAoICh2YSA+PSBWTUFQX1ZJUlRfU1RBUlQpICYmICgo
Vk1BUF9WSVJUX1NUQVJUIC0gdmEpIDwNCj4gVk1BUF9WSVJUX1NJWkUpICkNCj4gICAgICAgICAg
cmV0dXJuIHZpcnRfdG9fbWZuKHZhKTsNCj4gDQo+ICAgICAgQVNTRVJUKHNsb3QgPj0gMCAmJiBz
bG90IDwgRE9NSEVBUF9FTlRSSUVTKTsNCj4gQEAgLTU3MCw3ICs1NzIsOCBAQCB2b2lkIF9faW5p
dCByZW1vdmVfZWFybHlfbWFwcGluZ3Modm9pZCkNCj4gICAgICBpbnQgcmM7DQo+IA0KPiAgICAg
IC8qIGRlc3Ryb3kgdGhlIF9QQUdFX0JMT0NLIG1hcHBpbmcgKi8NCj4gLSAgICByYyA9IG1vZGlm
eV94ZW5fbWFwcGluZ3MoQk9PVF9GRFRfVklSVF9TVEFSVCwgQk9PVF9GRFRfVklSVF9FTkQsDQo+
ICsgICAgcmMgPSBtb2RpZnlfeGVuX21hcHBpbmdzKEJPT1RfRkRUX1ZJUlRfU1RBUlQsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJPT1RfRkRUX1ZJUlRfU1RBUlQgKyBCT09UX0ZE
VF9WSVJUX1NJWkUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9QQUdFX0JMT0NL
KTsNCj4gICAgICBCVUdfT04ocmMpOw0KPiAgfQ0KPiBAQCAtODUwLDcgKzg1Myw3IEBAIHZvaWQg
X19pbml0IHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBwcywNCj4gcGFkZHJfdCBw
ZSkNCj4gDQo+ICB2b2lkICpfX2luaXQgYXJjaF92bWFwX3ZpcnRfZW5kKHZvaWQpDQo+ICB7DQo+
IC0gICAgcmV0dXJuICh2b2lkICopVk1BUF9WSVJUX0VORDsNCj4gKyAgICByZXR1cm4gKHZvaWQg
KikoVk1BUF9WSVJUX1NUQVJUICsgVk1BUF9WSVJUX1NJWkUpOw0KDQpJdCBzZWVtcyB5b3UgcHJl
ZmVyIHRvIHBvaW50IF9lbmQgdG8gdGhlIGFkZHJlc3MgYWZ0ZXIgdGhlIGVuZC4gRXZlbg0KdGhv
dWdoIHdlIGdvdCByaWQgb2YgdGhlIG1hY3JvIGRlZmluaXRpb24gb2YgX0VORC4gQnV0IHdlIGRp
ZG4ndCBhZ3JlZQ0Kb24gaG93IHRvIHVzZSBpdC4gRm9yIG1lLCB3aGVuIEkgZmlyc3Qgc2F3DQoi
ZW5kID0gc3RhcnQgKyBMSVZFUEFUQ0hfVk1BUF9TSVpFIiBJIHN1YmNvbnNjaW91c2x5IHRoaW5r
IHRoZSAtMSBpcw0KbWlzc2luZyBoZXJlLiBJIGV2ZW4gYWRkZWQgYSBjb21tZW50LCBidXQgcmVt
b3ZlZCBpdCB3aGVuIEkgcmVhY2hlZA0KdG8gdGhpcyBsaW5lIDogKQ0KTWF5IGJlIGl0J3MgYmV0
dGVyIHRvIHBsYWNlIHNvbWUgY29kZSBndWlkZSBmb3IgRU5EIGluIGNvZGUgY29tbWVudA0KaW4g
dGhlIFNJWkUgZGVmaW5pdGlvbiwgb3RoZXJ3aXNlLCB3ZSBtYXkgaGF2ZSBkaWZmZXJlbnQgcG9p
bnQgYWRkcmVzc2VzDQpvZiBfZW5kIGZ1bmN0aW9ucy4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0K
PiAgfQ0KPiANCj4gIC8qDQo+IC0tDQo+IDIuMzIuMA0KPiANCg0K

