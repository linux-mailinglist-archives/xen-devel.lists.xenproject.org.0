Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Dc5IRvJDGrAlwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 22:33:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDF584BD2
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 22:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313405.1583534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPR72-0007jt-Qs; Tue, 19 May 2026 20:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313405.1583534; Tue, 19 May 2026 20:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPR72-0007hv-No; Tue, 19 May 2026 20:32:24 +0000
Received: by outflank-mailman (input) for mailman id 1313405;
 Tue, 19 May 2026 20:32:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wPR71-0007hp-8b
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 20:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPR70-007y3Z-Ho
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 22:32:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0cc8cc-2eae-0a2a0a5409dd-0a2a450cebdc-4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 22:32:22 +0200
Received: from [52.101.70.56]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0cc8d5-62f1-0a2a450c0019-3465463858cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 22:32:21 +0200
Received: from AS4P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::19)
 by DB9PR08MB8739.eurprd08.prod.outlook.com (2603:10a6:10:3d1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 20:32:16 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::f) by AS4P195CA0035.outlook.office365.com
 (2603:10a6:20b:65a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 20:32:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 20:32:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB7730.eurprd08.prod.outlook.com (2603:10a6:150:51::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 20:31:08 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 20:31:08 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DxUuthYMAAuzAeWISwNH0Sz1d/4qy37lE7sc5SHsslNpOJtEiDfkq6py0MEli0wfoR/bS7ILRvGnmx/MA8cgBJXWW3d1XijcfEiAnUhKqFw+Cu4H0wwVsawSJ0ma63OLhgaBeX2tvHGtpWVFBS8Dgc+RU3QlcIFi+vRrfAdbSp76i0WIa6nY1J8KCbW0cXTBXvmfoq+XLfKaX+d3X7Sp4RhqQ/LPfttCBzxqVxw7LCU5OE9ec7AazfWOJ9zw19cJYXpqMtNH7EkJYwaPhglLL9g9ecdJmsjn6Ld3s51FRz91WN4gOKuY0+SwMaRUGbg4EM+65fy+mjxRH2hA6vkutg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggP6mE4pgsMMj14IvM+asEVHGETF/xyPvBsMDIMk9ks=;
 b=rHzE2up+jPPt5sws7m9PPXt8aCCmEuA+bSAUemTAF11q/eFWe2lCtyPbtrtES1icUQDuoqEfqBDx8ptEk3Yu9V0sqh1JOz0Ap551/T4SFLcAz0wyoAdunKoaLbAjyvgWcv9u5p4Iq+zFEcv863nHHRogZl5BMiFmlGAqiWhJJDZdVo8viiihudYooAuhOGFW4YPWudZVxH+pHl/6Dml9PoAjKh1f9BLxof/idUKuecT0TTvFAfeG1pe3s+85habjt65YJHI7yLpCTGbZa0lM77Y1RCLtsptYzZmneJp7b9CinFrQxiPghxz7d2FB5MjXIFhVFWpdcWH7P++rbmM2DQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggP6mE4pgsMMj14IvM+asEVHGETF/xyPvBsMDIMk9ks=;
 b=lp4BKJZTEvVBRDyHge40pYT8b4lWQmmfZLnwtcyrPG0UoPxlIfegY4F9r5b8NLjA2JXiIWGfZnmO9tudL3jI8TO13YTAVA6sjY8fqvVg3VjEECelif69yUnbJxkxh6UNzt6jOAa1H5FLxGWuHogU5krAhOWrP8uddgcfN2D+xH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bbgm3pV9iFjKNhkGRrEdme2IGo1jSORLfNbwdJrIFj1vz5gAGXgrtw4U9oKgFqacKWuerZMUlaRVGVuHiV5jcsI2IUtismOhLm6/63aTcFKLablbfKcBU4JgJwsgfy9axyp/UZKbywnoPA/hs3AkQVTz7GzE0D28Wzqe5Zs4xbscBltUnvnIvE7DyBIasO3DL782uE/UEuBcwXn8ej0qg+GqPo9KggTsplCwwUmzg0NKNiKYc9O3cNF92j3pSLpOepAvo5/xrnOVkgiJNSccfYxGlOfc9R4IF+mdBf5BGR541lJjcegnJskldPHWOJRYU7etwb0wcieSgATGMx8PTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggP6mE4pgsMMj14IvM+asEVHGETF/xyPvBsMDIMk9ks=;
 b=rPT8I7nrAU5TgQQxeDAcQv3KBWSFZAR7mfN8fLVATQPbMZi6KVSX1rMV7QCk8jFN++PXdYwKI6bhMf5MHwu9+nD4Ug0M+Yw+HypazYbhGe6Lrjsd0lL7c8EftYcsBx/f849seevSC3HX0c1zrj8V2JoRCrV8xAirWOVquvOBdsSxgvJWfPvlP4svYRUb0EfIqgn5S9hYBhqXV5OdDnPn883E5MRF3EXS2Z2G6cKNGHNuY5HKj6/92t6i8DFqxd1Gm2YLIdlxyBiEazsU01SuOmYekXGE4DFGYhK0Q7D4RMHAyHGPhnaRxopu8C5v3nkQmaXY4mEVS+ltPnVFfiUsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggP6mE4pgsMMj14IvM+asEVHGETF/xyPvBsMDIMk9ks=;
 b=lp4BKJZTEvVBRDyHge40pYT8b4lWQmmfZLnwtcyrPG0UoPxlIfegY4F9r5b8NLjA2JXiIWGfZnmO9tudL3jI8TO13YTAVA6sjY8fqvVg3VjEECelif69yUnbJxkxh6UNzt6jOAa1H5FLxGWuHogU5krAhOWrP8uddgcfN2D+xH4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/arm: gic-v3: Preserve ARE_NS when disabling the
 distributor
Thread-Topic: [PATCH] xen/arm: gic-v3: Preserve ARE_NS when disabling the
 distributor
Thread-Index: AQHc55ylTZMtKVDVD0+QjroHtjvpLLYVzXqA
Date: Tue, 19 May 2026 20:31:08 +0000
Message-ID: <7FB76638-6C8A-4D29-B7CF-3EBBE82095E0@arm.com>
References:
 <0bc584018c025ee9fa5557276b9f3914ca9205d4.1779200467.git.mykola_kvach@epam.com>
In-Reply-To:
 <0bc584018c025ee9fa5557276b9f3914ca9205d4.1779200467.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB7730:EE_|AMS0EPF000001A0:EE_|DB9PR08MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbef979-bcfc-40ee-8420-08deb5e5b70f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|11063799006|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 CmuPitCUD8scnVeqTmC3HKc7SuxTF9bwuDu5kqZ4Gb+AqB7B8Czey85pWYbuxsUwhcr3HPsdBjG0sM1/wNcYB6Xx0Fb67oYJu3GBLZjUjqNGAqGCBOVm38N0UCShHytYBcxFoFljml7+9W+z9S/Lq/Pj1p8mz7RmqBNWXNCq5j3opa+dzEynpclYETtacX2z1SV43wivBMQPSUEmPRFaFKGzwcksTLK72k6NPt3uT6JBomhT6MUWML+I9F61kIcedZR6qHzbKKyoyJx/xMkW2QJXEaYheSoZOw9KzMODck/RxTeSgTkyBfT4bmsUWLJu4Hl12DUymIEKGpCHED3clTsxN1er/0PD1BFtCAVHeBoPLLsG3d67b3MOITG6+cRGE7NoWBjTFrpe8nEYKIAJCSAENgbjwwUePnZlw1+4RTC0Z+9kczEzFGbipvPUayeYCAvWUL0Jz9t3/6eYlwMr5PA8Ver+u9ESGvB8RWgaipMMS3uDwpVaHZhV0WJMNNEnm1mY9BBMAWqyZFhSH6rQZg/6D6BWcPP97DbhlR5T7lYSVqkloLpBbs9KFk84ZJPoz7/pCmgn22LGMiReH7XVYqppoy+/Zd1km3hDx1joZ0nCjhZbYkaQowU707DUC1aG0bF7YWIwmfLI/vEBzicsJvZD1E8JEF8WED60/XWV7ett/td+bdn+7MngzUNEzXNtlNtTmV8ttfcuWEitkjhZ6kNugh0lN3eT6AI/rtaZVwFQtRyVtFwFdtaPEv1iRgch
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9EB9CBF5E6DDD47A9B278449F1E16FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 CRZocTkXdGQwzm2WlfmMylDOSpSRAQyuYD1QyFX0Y7F20BnpjWQJGNH+TqpOu2PCiWwC+TdNIDO/YeJ4yfqXahLGQJpEiTKgiY+zXRBlY/Hdnu4WhucVl/ehL/EwFwZiQOQp0ywlREcuICYMv3ntpqeKFTI/W810iBOxz+pEOu9ztcsQQCEFqDCSUDRnvellzl0npNK93wNt4htIexbrZSIzoTHNFP8n5ab8SbAeMbBJ2tbgu+dWrttdxqr/ClRFHLFzOP6AP172UqzuG2bfmLR9eukm6Bj09olv3t5l44/0HH00cR5lee0ZllKynj/Enk/3ZOq20G8xmoZbmTPUuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7730
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	432582c8-da2c-4efc-b575-08deb5e58ecc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|82310400026|35042699022|376014|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qkwVN9hc1tbH2zFrD86C5YWrHlxwZum22xFXybEv+Lcz/q/bvnszgb25Q6CQceM+ib8ejAB1tgouaN3EQSbuk6I4QbvJdaP58fbQmMXAQX2sWIZ/G1/ziCNrRNjIdmHyOdBPCu0UFEA0aS0/+K5r18ObvbgmyY/zFVjxykeW640B9LNUUgM6xqkoceKdGgwCWvhNEs2vEa4mL28dkBuLvzvvh279DmjnFg7K6RoVrE6nLjpY0eFgQ3ELb1FbpIlBLkkaPbq9p50JGwzr9yBRtPvQgId8WwJPp4AQwGZjsmEecGw0tjHsyORjgwVEUt3TbA5HmPFFVR0Yu0ycbcIJubZIMUTJznLgNpYijYerwQ6lk6jAPbqYzVPK2177ZQb/Wa5fKGGUsEJxv0xOqCpZgWsB8FMrRHEFYstDILqBc9NDGhRLDda1U5PJ88Tu0r5TDXotJlPGWc6WzSjtlccCcseptXhwp+T1QqBSGhrudfmOamdMOz2PZvCsWF09yomQ2WqXh0NALg9U2hJ9Z/b0P+pC1GxgjME7rCJGDaY3tGCArLleVb4ZDv736FKNdw47sltLgTsifQT5oU/ptm32q/t3RoQqmLz/cxOnFksXWTOeEWJXCzXR+1cL20/jn95hJHdQGXgD4gbbYleib1AVOmkZiom3oRy9t7N3EW4vUmB7xgUlcxz+HRA69IAK90nI95U5yvMc3iPY0BlXF/pOXrYoBuDHyEK74u1mPnMWuk8=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(82310400026)(35042699022)(376014)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3QzEn8BZFfrIYmevgcTRrj3Th2Q+eR8U4wfgVvV/dTp0fNhMws6KMfMr8LY/w0Xcsa8fLU4dJ3/khUaVJxuAQ+nVsS5T6ZP0Bk74UVnBNOKjI9mBdw+LzkJfqekz9m81ZPDVSuK4HJxu6wVaOINc0TswmsxeFjHNmtSpb4XOKiTk3h29vamHt1vvrP5DosdkXnOegrhktGocqaZTqEEtDJwzHyMX2HdiOD9mGPrGWdh8sMQ5PiuaOc1Fwiyo6diR3sL3Qy7EUhJ5keblSWKFQvFiTHycbxA6AJEJB/FUvzeWS38j7w4gJywwgriYhHPmZBcfdNYs5KrQH94aEVZ8iAQRlzGJToGS3/7hda/upxgimom5wh//UZEU6aMQ/660/VpNDSJu9r+OyJAZNBWW3uM8hZZq5NJtrTdNwhAg44YA/vHtb2lSFKmJ5otRAvTm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 20:32:15.5618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbef979-bcfc-40ee-8420-08deb5e5b70f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8739
X-purgate-ID: tlsNG-d25034/1779222742-E0965CF5-F1159BA6/0/0
X-purgate-type: clean
X-purgate-size: 1188
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Queue-Id: 8CFDF584BD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 19 May 2026, at 15:31, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> gicv3_dist_init() disables the distributor before reprogramming the
> global interrupt state. It used to do this by writing 0 to GICD_CTLR.
>=20
> On a system where firmware has already enabled Non-secure affinity
> routing, a zero write clears the Non-secure view's GICD_CTLR.ARE_NS bit.
> Arm IHI 0069H.b, section 2.3.3 ("Changing affinity routing enables"),
> states that changing GICD_CTLR.ARE_NS from 1 to 0 is UNPREDICTABLE. The
> GICD_CTLR register description in section 12.9.4 carries the same rule
> for the ARE_NS field.
>=20
> Preserve ARE_NS while clearing the group enable bits. If firmware left
> ARE_NS clear, the value written is still 0, preserving the existing
> initialization flow.
>=20
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

Looks ok to me and aligned to the specifications, bit 4 is preserved on bot=
h
Armv8-A (ARE_NS) and Armv8-R (ARE).

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca




