Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FD5FC638
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421175.666380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibbg-0004kS-OH; Wed, 12 Oct 2022 13:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421175.666380; Wed, 12 Oct 2022 13:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibbg-0004h5-Kf; Wed, 12 Oct 2022 13:17:08 +0000
Received: by outflank-mailman (input) for mailman id 421175;
 Wed, 12 Oct 2022 13:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAAv=2N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oibbf-0004R6-MH
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:17:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2afc641e-4a30-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 15:17:06 +0200 (CEST)
Received: from AM6P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::22)
 by AS8PR08MB9017.eurprd08.prod.outlook.com (2603:10a6:20b:5b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 13:16:59 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::2a) by AM6P192CA0009.outlook.office365.com
 (2603:10a6:209:83::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 13:16:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 13:16:58 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Wed, 12 Oct 2022 13:16:57 +0000
Received: from 61d9815d83af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2761C29D-6DE8-460C-85C3-B31BEFDA1099.1; 
 Wed, 12 Oct 2022 13:16:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61d9815d83af.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Oct 2022 13:16:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6624.eurprd08.prod.outlook.com (2603:10a6:102:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 13:16:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 13:16:47 +0000
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
X-Inumbo-ID: 2afc641e-4a30-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PbLvPxiv437oXziVxk+RGyEzKQXlDBNHtuUahDFTVPPS7u/Iib6PzocUjSRpYec4BiSwfq3Nlux4UIkBYdSPxpFN1vsFZjFLrUWvLZifSq2v45CWB3rEMAAzyO1Lc5oGDg2V5nqBMYui9m4AGvDeH4WBiSl7zXa36/uBSG6HAncy1IPnLrIToHiMnBJSmD2qj1YNDnmvaBiw2wk83EMxAWJN7sxEvvCcwedxV0BPuTM22bfQE8QmwyILiAysEnELTjBzCuUj/nHopKNjDRje7cfJca0DIqJ0kW6DZu47ogZUK0NyN4KwbYe4AqCRuluIj/MyhI0mOJDKXbblXUSTNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ey/tiq3ryzq0B4YzFNq3KzGVSZxgfTzgiz74Mho5XZo=;
 b=aiTOg2037SB/q3sJW+pYDsYZW2T+xdqvqpay98Ut2ksSc06FEBF9CY+Y6iEpkDN7n74rDwRFaqjEgyvwlXs7aE/2jrhRe+U8mdkwJVNMlkuJgKvhmxN4/aBn7bu7+zxke9YvsyBMc03CnL95kBva3GTZu6lgru4rLnx1Udibo+x+oUqFIWMivrS9zyQN7ChqpVfPOhbZzqyYk7D2wzTHQqx7sOu6YLRikZTeomq2rngu4gEGHZ9rrM48H5sG7sZfb9+HYijRWBzv47gvmMRlHh1P8XtdYalAmXwWEcWQzWBgky++yxgFa6nGAiJg0AcVTAjH/Q4IFQnLSkGKGB3wwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ey/tiq3ryzq0B4YzFNq3KzGVSZxgfTzgiz74Mho5XZo=;
 b=oL8tba/ERZ3szX89Z+34Dk7s3vAMFAp20nuDcPLt8bhgsoZ8IismyDpu/SBesUz5FO8MBdj/CginXkHoBxT88TI8QESywH7Kz06b7K90JUUp9DSyuNS5j31ty8QTgOdIN+IQtStpsxu/yIxnf6hxEwBXUnLgWCDagDOc/IPUFhU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a64eMV9MiezgWYm2Fb/tSyMIN+pTMgWFrAYtTmQFulUwU6xcptOnUaaimCRG/HYzHf5mVWJ545iTgj062p1CeBd3Jprdpu8WOoaFdMtr/lj1AjKs01c0RVOslp96Pn0MoJu64/ThQsirfKLN5sZsv0fCNfY1cvpY9J6CzztGsFGrrP+pR+SvVTzMQvSOiJd3op6A5VI8kjAzdS+tnMBBIXNAMw4Ql9xUS4ePnDvcnFZRhs2GvqwiNZFQKsa87KK+FSzcbzfraOpP5Ljbpl1Nyy8cwv0IDoiNENIAYjK+VGzVtyoEDWE4Sd2N8dtGOhTILOeWjqAzQbERMq7xa97QeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ey/tiq3ryzq0B4YzFNq3KzGVSZxgfTzgiz74Mho5XZo=;
 b=MW7ZQEAPFP5vDQI/uZPX6GeynpWMC/m5M++msAG2xKAi47Sp3WLfj32JIl+SyN8SKVDSg+pb3NlfVA4cm26YCQ6hp/5bi3ft0TFxcYGb95Wee/Wpw+e0JTO+Inf3wVDkYoVzGOMCCvEtRBVFvtpiu5qMp/XnFbzsobcyaTqAP8t4lCirZs5zm34DVroXU474us1/XqgO8HCIKFjonEnTJCaqvqHEjdp1S+3nZNLL+bjcJqO5ir4q/Zw+ObyB/AiQwc2a/F50aEDKZGJz85mcR2PQi0EWSGm22X8mfHl4YVY6qhi4O2iVZAV6nY/NJugvYWinxnJJprrpslETeVdkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ey/tiq3ryzq0B4YzFNq3KzGVSZxgfTzgiz74Mho5XZo=;
 b=oL8tba/ERZ3szX89Z+34Dk7s3vAMFAp20nuDcPLt8bhgsoZ8IismyDpu/SBesUz5FO8MBdj/CginXkHoBxT88TI8QESywH7Kz06b7K90JUUp9DSyuNS5j31ty8QTgOdIN+IQtStpsxu/yIxnf6hxEwBXUnLgWCDagDOc/IPUFhU=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH v2][4.15] libxl/Arm: correct xc_shadow_control()
 invocation to fix build
Thread-Topic: [PATCH v2][4.15] libxl/Arm: correct xc_shadow_control()
 invocation to fix build
Thread-Index: AQHY3jyGWQFzc6aKeEmXpDlYlShzFq4KvTJw
Date: Wed, 12 Oct 2022 13:16:47 +0000
Message-ID:
 <AS8PR08MB79910144ACE4842C43A205C392229@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <af81d6d5-5d2b-3db8-634f-17392ef328f9@suse.com>
In-Reply-To: <af81d6d5-5d2b-3db8-634f-17392ef328f9@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C1AEA40DD7187949BE621A0FE1B08CC0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6624:EE_|VE1EUR03FT059:EE_|AS8PR08MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4be2ea-4919-4278-a3b1-08daac540ac5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FRDtcrsT1W0qQlW/WafC3NQyoxyHhX6Qr01Pb+tR8tT2XY9kiLWI13uxL8biMV2EwjDQcih9C9FWe1h+mUGhuPjPwWuduFuPxZbzLcdG9b6Jp+Cmu+BHd88hJn494B/x4nIH0KFbwgVTBJf1ilRgNeJrGKXTCgfRNu7NrDa4Q4Brmth7TmrXx19n4lU7+V1thIYF2oolCOMqq04Sq6Iq1uETOJgKuUhL77vONZLmCR95cvUnNE5nnZSANe8Z47vA9WNao9YVEtxwm9wrGeFbyeQoWox7SuDTcFrg4Ko38EcixinKDgjjNPv4Z7dtKdE5BlMMuqm5jZ8M/xin6HlbSZ6q0TbW/ekHAuRfLNDsx4xRbf0pJskeWPct6MWJ3zCRKcQ1j47VT9kxk44aM8j13BYP3QGYC6+cxigHDkGdSQRpUNnUR+CNmNnXAIFuk492s1Dse4eQIN7VllEcpheuJHEEro6+Nlrfj078wpnnremT+bIcqYq+v2qTgnc32h6FPHHKuUK+W3wrJQDwMSNo4waOncq14egyPCsmQ1AgS6hZMmxggPziU5qrSCkjBP2o0NDzkfprVT+pd3aXbbFoBSSrqhkAhp3v1Uk6an7hMmWGOj1UoPX2gWDTkyFLfKehrjPsxBX+Nh3IZreh7EDI1tAe0GtjMfi+9uiSooYePBbQw3uGxCBofwhpQql0EWAJu0YgJuNC9whFVik8SlxqmdCQjOvLgKpWRNNR7kti+cgvQ2T7VL/gRT+zDl9hyXgCsE+90SF/CCqOCuFWKpPA4Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199015)(55016003)(33656002)(76116006)(6506007)(9686003)(7696005)(122000001)(110136005)(71200400001)(66946007)(66556008)(66476007)(66446008)(64756008)(478600001)(8676002)(4326008)(38100700002)(86362001)(38070700005)(52536014)(186003)(83380400001)(5660300002)(4744005)(8936002)(41300700001)(2906002)(316002)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6624
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd256f28-c0c5-4963-b63b-08daac54043a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHxMO9bpfKd4XBr+k8BVxXpQnCjHRRfHAvTnx2W+sZIOwmBx0zzK1IGqzn0gL6Y1xJ8MbNMN7D3p1jCSAsFF+2znFCIrsCxKTYvCgoUo6vhEqh6wMCrs/sTaGqNQEJEsO1o5MxRBEtYf6fy6czGHLFyFsiY9uZmUrd2Z9uDAQ5gy4eVDPdpTCxj64kIwxkoy4O7heYHxCveN7nHY8PqcJXE/GRNs9On5ItKKkuFM/LgzEj+UqgIdjG85cRWIvLLPOWxm/C9LwLTn7urEdjms3OMId/3mw/9mDfVUCdtrm27UkJrnwPOqYxmc8L545kGTr8A/h1uFIUFfFiSw5m4j5eTgZBJiEH8Fk+Vms2fiXlahd/xN5nPfHj3XoUK44t8M1qO+cjoRRWuiHo+wmE+Bn889QnoKtKdJirNLs8Lxeq/MdVRIkhsTGk7L7fW4owpUqxX+SE4Cyhsw+hY9wozFkUs9nuchTk9HHAwAq5D+X+ZGpgnvurUReNOBLa6q2Hpk0rQel3O/ZsZqXI5Io7dqHnZNaOcq3bqS6OTcCxpbAnRZ5L0nzPSeVqaYwZmsBt+4Sk4cD4L1o7cpE5BY9cFfgBCc4bC0idQURxplC+sGKxpIG3qQwRSbyBV96Xm1+UrJ0EyhDLEeVWiS1W4feG2wm5NNDlYp5ejaVnGwbMVkeVa7ZdBtbNo4Y6fYbgaVG/q34A8tITnTKVYi3J81QJeF6nL54LQujJ3jGzMB6cfGfKhPyCNbZw24guq+Tmn3b/3EWo4LR6tNE1/SS9dqIVibyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(52536014)(336012)(83380400001)(316002)(478600001)(107886003)(54906003)(41300700001)(110136005)(33656002)(47076005)(40480700001)(82740400003)(82310400005)(356005)(186003)(81166007)(2906002)(40460700003)(86362001)(36860700001)(4744005)(5660300002)(55016003)(8936002)(70206006)(9686003)(7696005)(70586007)(26005)(8676002)(6506007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:16:58.3143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4be2ea-4919-4278-a3b1-08daac540ac5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9017

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyXVs0LjE1XSBsaWJ4
bC9Bcm06IGNvcnJlY3QgeGNfc2hhZG93X2NvbnRyb2woKSBpbnZvY2F0aW9uDQo+IHRvIGZpeCBi
dWlsZA0KPiANCj4gVGhlIGJhY2twb3J0IGRpZG4ndCBhZGFwdCB0byB0aGUgZWFybGllciBmdW5j
dGlvbiBwcm90b3R5cGUgdGFraW5nIG1vcmUNCj4gKHVudXNlZCBoZXJlKSBhcmd1bWVudHMuDQo+
IA0KPiBGaXhlczogYzUyMTUwNDQ1NzhlICgieGVuL2FybSwgbGlieGw6IEltcGxlbWVudCBYRU5f
RE9NQ1RMX3NoYWRvd19vcA0KPiBmb3IgQXJtIikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogSGVucnkgV2FuZyA8SGVucnku
V2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KIA0K

