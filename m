Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKQGFmaQBGoVLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:53:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74D8535832
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308156.1579695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAxT-00046W-17; Wed, 13 May 2026 14:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308156.1579695; Wed, 13 May 2026 14:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAxS-00044F-UP; Wed, 13 May 2026 14:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1308156;
 Wed, 13 May 2026 14:53:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNAxR-000447-06
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:53:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAxP-00Ead7-VD
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:53:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a049049-bab6-0a2a0a5309dd-0a2a450588fa-10
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:53:06 +0200
Received: from [52.101.66.67]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a049052-aaa8-0a2a45050019-346542435bd6-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:53:06 +0200
Received: from DUZPR01CA0138.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::14) by DU0PR08MB7858.eurprd08.prod.outlook.com
 (2603:10a6:10:3b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:53:00 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::bd) by DUZPR01CA0138.outlook.office365.com
 (2603:10a6:10:4bc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 14:53:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 14:52:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB6505.eurprd08.prod.outlook.com (2603:10a6:10:23e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:51:56 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:51:56 +0000
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
 b=nOyicki5ijhmJu731vwbmVxA+IT25uDHRjapAbrx3gdxpw97JyUs6F4htcSsvWP3jn0/1sB2gbYAFS3xsQyau3XQt3yxdP3sPxKocPmQmGWSSzesH/NXK4+c5eNpxuOjyMw9iJbToZ6121Bh4ByTWtlcfK1fAaAfBOoZgPNafgUxL9+ToH7nDRtQA+DzgSiEtjsod1sJsuirVRctFnmjHDpSCN1qIxTXdzS8Dw+oennY+4amcILnOmkieTaZY3LwvSSLj/HgV/ub8w47R5kKA1jsm6KTRnbczaDBSg2YCvpkZXy5pxb9lwS60GoNdt2FEZc/4X78EgqT+GF3a3F0qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO7ShRY36w57wbiMsIK3Rl4eb8jS6Nq9Afir6qTjEhA=;
 b=D6oYLP7ARTd9+uq0/9WTDheV1mmeQWBCZMZRPAWhHE7VGvvv+nCMYIFRxPgpx0z7qSanczWDwsN7sDsPA0OcOEy2o3ZmAuMYThW9onXzCgF+02gpNT7KHEKkuZ3S3zN0GEnUCWzQWGMa7AQIFL0LtglYP0GgRH875r7lmQQQSmU1vrSY7ZnnGXO9CO0ouok18rGjby89YVFgP8cvHPFbEiEvBX4Yk24KxbOfBbxkfIbk3NNXJYKpergve89iSDAVyr8QI99xYs8kz3ACXm6E8VbWjm7MW/vo9faIz0fvd+wTX6hAdrp3NDX9BOvfvt97UMOT1qcrVnDxZZIVB37cJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO7ShRY36w57wbiMsIK3Rl4eb8jS6Nq9Afir6qTjEhA=;
 b=UwUvl1u7nKAGxCseL4ka+2PGbkTNH03wUtOxRQg1RBXBzFBzjmSljFHfD6D4y4fchnbzCNSC4HYjos95CGRzFRCqwxT5d1rwQFSJpfJd0aRWi37aL0EYYlPu307ElbvLM/zkTP8T8UTjqrVAEiGyBk34BddqmaUMRj/4WLCQMqg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz90EdWJmdEnQpVutLPuuo6+TTnees29v0I+QovIASUO61WogDKERl3Ooknru4RSGkg+b2QG6NnOdexXblVn0h3qvf9tNsKqDRb0xRZH5Ru5z59Mhb00Sk1oGeVjGKsmNOaQmQGSi3fdAnJT5TdVvmT1Uo6BcoMRckUrR+iSTceS6R7iYmXQyCN2rEfNAPBzKqqsJxGS501L6TIQlEVBZFEKpTrQBJU8CLjsKg3HvcWwpd5HQJV18H1Q7XRIU+CVpPG2vVmsGP9gtFXUp9fzBdSzL0L2+6cUtMQAtI/i2jqYXS6fH29AD5LqkDFr2jqlDfLGQZITrvK++j/bpqhX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO7ShRY36w57wbiMsIK3Rl4eb8jS6Nq9Afir6qTjEhA=;
 b=IfotcW2fRv0AjjKXQsm0MLTDSAruvZG5ExgE9aElHhHXe7U5o1GiCWM7Xz2vy0Hvdq/vD85mQd67RY8eJIWEQkt9FubJKrME7HnYepUI79VcFa+5uQ8wZMsjDYVcgFC9ONRcUAGlJfVSnQLgQRWxU+lcAucCl1mtN1AI2kwZ3zcOtl5ZU6t0bzVXjBGennJ4eQNM8eufcuzWj7az8oGuusDuBBz65l9NVKMhtW5eG73BCBQRP7FvVt3LzCw4bidAieOCwGtIOnx3+Y7b1vLZ1RQo3G5IH6/7apPZzXy0a5ulQW22lucKtKTHQsItQu/AUXhLb75Rzr4kBDugJCiMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO7ShRY36w57wbiMsIK3Rl4eb8jS6Nq9Afir6qTjEhA=;
 b=UwUvl1u7nKAGxCseL4ka+2PGbkTNH03wUtOxRQg1RBXBzFBzjmSljFHfD6D4y4fchnbzCNSC4HYjos95CGRzFRCqwxT5d1rwQFSJpfJd0aRWi37aL0EYYlPu307ElbvLM/zkTP8T8UTjqrVAEiGyBk34BddqmaUMRj/4WLCQMqg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 03/13] xen/arm: gic-v3: tolerate retained redistributor
 LPI state across CPU_OFF
Thread-Topic: [PATCH v9 03/13] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
Thread-Index: AQHc4jIy41V2wcxbLEmxgJuFq+19qLYMC40A
Date: Wed, 13 May 2026 14:51:56 +0000
Message-ID: <B1776A58-502C-403E-8EDD-6FF3B62E1EBE@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <ddf37bff562e7e2055ee049ab63111c5a2a2e611.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <ddf37bff562e7e2055ee049ab63111c5a2a2e611.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB6505:EE_|DU6PEPF0000B61F:EE_|DU0PR08MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ceafd1-6b12-4393-7c81-08deb0ff53a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 +qoBPr/4k5oDhvt0YRpM5rt9B0FgILZ9YXu5NiORVyFlmylHxdXixGaWif02p0LJQxLGFmeF0+7zpmYev4UFdubYFgx+4LpFrkIYK559REYOg3LBI7c7fLlwcBgNaphFasrVEXfb9VkYLMAHK5BHfFE0g2IqD94KUa+O4lgrzWpXJ40a2k8CBfvPMHQcAJrfhE6hF8SY5dOrC4Kka27UHvZJ1LHuzD/Fp+M4VSkg/eibqI7qFU/PSSqu+paSmKr7Bs6Ps2LzcQxYCJRbNrE2ltcVfyYP02t7b8ziG0mHnNwWIuwmam/ne9k62xywvW5FFMSfzVtWHXseMYf/zo5Mqtal9o67pjedxTuaPoHGkJX7ZtTCqjdAg5L6aYEQ+VFPM93Jw9DV3ELtxW6/XxUrlYtRhdmaOz3CNcffpjqPW2sMQ8IPOm26sXuGJ8RQt9CxObQhjQ6bFOFk6UkW2PxMhlOjb//Gtv/grVO8wREiF+FS6sYJGfCWbuK+11BSmy5H8peNVhkdocacKqCTGNd8C/ED+yc2WFrF1RqPKgksyefXPcC2MowJR/eyrrDBUCMd7q3NdZtn0p8YCcVAzlb/3PJReGlRHi+NR8rwLqAcLKPrAmqWqCiLfj0wnUgNd4QaFE7AyJMfSSnGYv2924NDT/0cHb4IdTd5nUissftX+CzzMgBjCd9POq1aqzX4xP84fDNECdBJU7kYDVuc4mnLelUADoH9E6IU2bkhbo+3pkP/DmasG2NH8xQYtBMrBhZx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <35CC3BC2AE65114E8508E8105E11A42C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 QG2F01IAOeqViD3xy6r0GSWXVDK1oLM6lifSQcyWtVMovhEin9vUcPCuP7XBGtaxqkFpHEHXYW4Si5iyt6biAo8/x6Lh7dnzMCAaNM8RRj1ZoSK0ghfu4e9rTnIAZbY0paDKNBGye5BLGGdZj4OIZeypeYYEAaCIGyb4fgaTGJ19g+FxJueIoLp6I40Kren1nhjd6qb3PWHbxLTMaPbk4PINIeMLMdwrGKoGRScfppna7x9HnO/X8Q5bZzSA1amKne4Fa39S7NHRYGftPUyPfrWfJPuJGGLfJu2u/Y8VW8HpHBH9SOfvOzUTwgYGUlYnQ3Txi0DYk01jnbB1jvdpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31b511aa-9e4b-4231-8acf-08deb0ff2dbe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|376014|35042699022|82310400026|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	4Awc6UAurnfY5ZFUnZllHP0bIusKtkOXTtWF0SUfHeSuV0R6taIxoWpyldO+DYppZw15dESZ/w99tUfmSXKQnZQGEJVU5Lf3wveAU/85sw/y5vOPMEy/KrtfCaxv/Z4LrkkYLJAzNnch82rDcLq9wz5xCovVe9BW6m1GoL6T4Hurds0rnUw/Rqe6vIRNEv8g+uUu3obmX3U3DpBGZsrmu/CJy2ITZCE1umelsXiFB0xHF411mIN7vjRmU2nQIeT5ReTmpkQLhs5oiuQxyT5RfuzDNDAh7KRnG2T1M1Fy/jd0wrM3H+EJyciy6IXS7k7BYb5zfMbC1d0OIEFIT/ruGh/NXNhMvEO4hUtFA0Lk5b2dXkT/MWHOIq5PHFSNCXnSBAvQgEJigvNNTWTahFPFPLV2Z2fYJOl8AbYbntXIo6VrNhDqfEBhP6ltjO7xILFQIW4ii+0lSv6C8BkS2kubALr8PQ7dDlxMy2glkTcP4S2e7fcwj2Oip8C4Y9tdSB4TupdUaRTGuYnogmUqO/08h+doMJ6OPPqmvFuKReA08mAhs9iRS9UerU5RVpdDb6+bGu6DdSQVlZeZl7HzSxTY731LH+Ctp8rjeTzvpiqpl7NC9ZmbMFds5k3QPxHjvAZNFD0QdiSFtKdELTt76+qw/t+qtYFKuTICs3zCRvX1wbhYxly+U9nmt/b4jmXC6Bw+vcx6WAFsYTVThp11KiuHav/RGUxbgb/hBKJfBdebL6g=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(376014)(35042699022)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ADsHmcLLsJBiREKU2nYAnCsY+vp8MZJEjJi8O01YQq5SJ0NAJGd7sNBg4W+KIN4FFokjhD8nIGrGZwa6taX62qxTq7qVDID1j5CtYtF+XF3AtlumSXvvUYIVh3n13E7GYG4RTQcqZ05qdty4cJMJ66LNAWNZ4g/utb/pI9MXm5m6ManlTPGvtb+3f116DhlFYOTqRBFp+/SLZZdXkmGE0YERHJtLBop0kPjHfIPsZ8JzE+ATKduPGMHK6n87Zg18zYz/xNcb/uKtq+nH/JmClDBNiZLr4QEcovka6GZyivHVk7fDySmpt6TmzLv1Jay+6Y/lQNQGyo4nfTxVr+iRXcte8gLylZMpDFr9FTk8uYvs/4sUPRFQTj0C0II39069qMehdQJ1Z/vd7vkvBfFeIaAhbPhTUqq6RuPCszu9Q47YzmDHng09qElnfjNTggBJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:52:59.8429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ceafd1-6b12-4393-7c81-08deb0ff53a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7858
X-purgate-ID: tlsNG-c201ff/1778683986-D917D443-FAF8D808/0/0
X-purgate-type: clean
X-purgate-size: 5158
X-Rspamd-Queue-Id: A74D8535832
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:mid,arm.com:dkim,epam.com:email]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IE9uIDEyIE1heSAyMDI2LCBhdCAxODowNywgTXlrb2xhIEt2YWNoIDx4
YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IE15a29sYSBLdmFjaCA8
bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPiANCj4gUFNDSSBkb2VzIG5vdCBndWFyYW50ZWUgdGhh
dCBhIEdJQ3YzIHJlZGlzdHJpYnV0b3IgaXMgcG93ZXJlZCBkb3duIGFjcm9zcw0KPiBDUFVfT0ZG
IC0+IENQVV9PTi4NCj4gDQo+IERFTjAwMjJGLmIgc2F5cyBDUFVfT0ZGIHBvd2VycyBkb3duIHRo
ZSBjYWxsaW5nIGNvcmUgKDUuNSkgYW5kIENQVV9PTg0KPiBicmluZ3MgdGhlIGNvcmUgYmFjayB3
aXRoIGEgZGVmaW5lZCBpbml0aWFsIENQVSBzdGF0ZSAoNS42LCA2LjQpLg0KPiBIb3dldmVyLCBQ
U0NJIGxlYXZlcyBpbnRlcnJ1cHQgbWlncmF0aW9uIGFuZCBHSUMgcmUtaW5pdGlhbGl6YXRpb24g
dG8gdGhlDQo+IHN1cGVydmlzb3J5IHNvZnR3YXJlL2Zpcm13YXJlIHN0YWNrOiB0aGUgY2FsbGVy
IG11c3QgbWlncmF0ZSBpbnRlcnJ1cHRzDQo+IGF3YXkgYmVmb3JlIENQVV9PRkYgKDUuNS4yKSwg
YW5kIHRoZSBleGVjdXRpb24gY29udGV4dCB0aGF0IGlzIGxvc3QgaW4gYQ0KPiBwb3dlcmRvd24g
c3RhdGUgbXVzdCBiZSBzYXZlZCBhbmQgcmVzdG9yZWQgYnkgc29mdHdhcmUgKDYuOCkuIFBTQ0kg
YWxzbw0KPiBjYWxscyBvdXQgR0lDIG1hbmFnZW1lbnQgZXhwbGljaXRseSBpbiA2LjgsIGluY2x1
ZGluZyByZXRhcmdldGluZyBTUElzLA0KPiBwcmV2ZW50aW5nIFBQSXMvU0dJcyBmcm9tIHRhcmdl
dGluZyBhIHBvd2VyZWQgZG93biBDUFUsIGFuZCByZWluaXRpYWxpemluZw0KPiB0aGUgQ1BVIGlu
dGVyZmFjZSBhZnRlciBDUFVfT04uDQo+IA0KPiBUaGlzIG1hdGNoZXMgdGhlIEdJQyBhcmNoaXRl
Y3R1cmUuIElISTAwNjlILmIgQ2hhcHRlciAxMS4xIHJlcXVpcmVzIHRoZSBQRQ0KPiBhbmQgQ1BV
IGludGVyZmFjZSB0byBzaGFyZSBhIHBvd2VyIGRvbWFpbiwgYnV0IGV4cGxpY2l0bHkgYWxsb3dz
IHRoZQ0KPiBhc3NvY2lhdGVkIHJlZGlzdHJpYnV0b3IsIGRpc3RyaWJ1dG9yLCBhbmQgSVRTIHRv
IHJlbWFpbiBwb3dlcmVkIHdoaWxlIHRoZQ0KPiBQRSBhbmQgQ1BVIGludGVyZmFjZSBhcmUgb2Zm
LiBBbGwgb3RoZXIgR0lDIHBvd2VyLW1hbmFnZW1lbnQgYmVoYXZpb3IgaXMNCj4gSU1QTEVNRU5U
QVRJT04gREVGSU5FRC4gREVOMDA1MEQgQ2hhcHRlciA0LjIsICJHZW5lcmljIEludGVycnVwdA0K
PiBDb250cm9sbGVyIChHSUMpIiwgc2F5cyB0aGUgR0lDdjMgcmVkaXN0cmlidXRvciBtYXkgbGl2
ZSBlaXRoZXIgaW4gdGhlIEFQDQo+IGNvcmUgcG93ZXIgZG9tYWluIG9yIGluIGEgcmVsYXRpdmVs
eSBhbHdheXMtb24gcGFyZW50IGRvbWFpbi4gU28gYWZ0ZXINCj4gQ1BVX09GRiAtPiBDUFVfT04g
YSBzZWNvbmRhcnkgQ1BVIGNhbiBsZWdpdGltYXRlbHkgY29tZSBiYWNrIHRvIGEgbGl2ZQ0KPiBy
ZWRpc3RyaWJ1dG9yIHdpdGggR0lDUl9DVExSLkVuYWJsZUxQSXMgc3RpbGwgc2V0Lg0KPiANCj4g
SGFuZGxlIHRoYXQgY2FzZSBpbiB0aGUgTFBJIHNldHVwIHBhdGggaW5zdGVhZCBvZiBhc3N1bWlu
ZyBhIGZ1bGx5IHJlc2V0DQo+IHJlZGlzdHJpYnV0b3IuDQo+IA0KPiBUaGUgTFBJIHBhdGggbmVl
ZHMgc3BlY2lhbCBjYXJlIGJlY2F1c2UgdGhlIEdJQyBzcGVjIG1ha2VzIHJlZGlzdHJpYnV0b3IN
Cj4gTFBJIHN0YXRlIHN0aWNreSBhbmQgcGFydGlhbGx5IGltcGxlbWVudGF0aW9uIGRlZmluZWQu
IElISTAwNjlILmIgNS4xLjENCj4gYW5kIDUuMS4yIHNheSB0aGF0IGNoYW5naW5nIEdJQ1JfUFJP
UEJBU0VSIG9yIEdJQ1JfUEVOREJBU0VSIHdoaWxlDQo+IEdJQ1JfQ1RMUi5FbmFibGVMUElzID09
IDEgaXMgVU5QUkVESUNUQUJMRS4gQWZ0ZXIgY2xlYXJpbmcgRW5hYmxlTFBJcywNCj4gc29mdHdh
cmUgbXVzdCB3YWl0IGZvciBHSUNSX0NUTFIuUldQID09IDAgYmVmb3JlIHRvdWNoaW5nIHRoZSBw
ZW5kaW5nDQo+IHRhYmxlLiBUaGUgYXJjaGl0ZWN0dXJlIGFsc28gcGVybWl0cyBpbXBsZW1lbnRh
dGlvbnMgd2hlcmUsIG9uY2UNCj4gRW5hYmxlTFBJcyBoYXMgYmVlbiBzZXQsIGNsZWFyaW5nIGl0
IGFnYWluIGlzIG5vdCBndWFyYW50ZWVkIHRvIHdvcmsuDQo+IFdoZXJlIGFuIElUUyBpcyBwcmVz
ZW50LCB0aGUgc3BlYyBzdHJvbmdseSByZWNvbW1lbmRzIG1vdmluZyBMUElzIHRvDQo+IGFub3Ro
ZXIgcmVkaXN0cmlidXRvciBiZWZvcmUgY2xlYXJpbmcgRW5hYmxlTFBJcy4NCj4gDQo+IEJlY2F1
c2Ugb2YgdGhhdCwgdHJlYXQgYSByZXRhaW5lZCBFbmFibGVMUElzIHN0YXRlIGFzIHZhbGlkIHdo
ZW4gdGhlDQo+IHJlZGlzdHJpYnV0b3Igc3RpbGwgcG9pbnRzIGF0IFhlbidzIGV4cGVjdGVkIFBS
T1BCQVNFUi9QRU5EQkFTRVIgdGFibGVzLg0KPiBPbmx5IHRyeSB0byBjbGVhciBFbmFibGVMUElz
IHdoZW4gdGhlIHJldGFpbmVkIGNvbmZpZ3VyYXRpb24gZG9lcyBub3QNCj4gbWF0Y2ggWGVuJ3Mg
c3RhdGUsIGFuZCB3YWl0IGZvciBSV1AgYmVmb3JlIHJlcHJvZ3JhbW1pbmcgdGhlIHRhYmxlcy4N
Cj4gDQo+IFRoaXMgaXMgYWxzbyBjb25zaXN0ZW50IHdpdGggcGxhdGZvcm0gZmlybXdhcmUgcmVh
bGl0eTogUFNDSSBhbmQgdGhlIEdJQw0KPiBhcmNoaXRlY3R1cmUgYWxsb3cgcGxhdGZvcm0tc3Bl
Y2lmaWMgcmVkaXN0cmlidXRvciBwb3dlciBoYW5kbGluZywgYW5kIG5vdA0KPiBhbGwgcGxhdGZv
cm0gZmlybXdhcmUgaW1wbGVtZW50YXRpb25zIGZvcmNlIGEgZnVsbCByZWRpc3RyaWJ1dG9yIHBv
d2VyLW9mZg0KPiB0aHJvdWdoIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29udHJvbHMgZHVyaW5n
IENQVV9PRkYuIFhlbiB0aGVyZWZvcmUgbmVlZHMNCj4gdG8gdG9sZXJhdGUgcmV0YWluZWQgcmVk
aXN0cmlidXRvciBzdGF0ZSBvbiBzZWNvbmRhcnkgQ1BVIGJyaW5nLXVwLg0KPiANCj4gS2VlcCBn
aWN2M19wb3B1bGF0ZV9yZGlzdCgpIHJlc2lkZW50IGFzIHdlbGwsIGJlY2F1c2UgZ2ljdjNfY3B1
X2luaXQoKQ0KPiByZXVzZXMgaXQgb24gc2Vjb25kYXJ5IENQVSBicmluZy11cCBhZnRlciBpbml0
Lg0KPiANCj4gVGVzdGVkIHVzaW5nIFhlbidzIG5vbi1ib290IENQVSBkaXNhYmxlL2VuYWJsZSBw
YXRoIG9uIEFybQ0KPiBGVlBfQmFzZV9SZXZDLTJ4QUVNdkEsIGJvdGggd2l0aCBhbmQgd2l0aG91
dDoNCj4gLUMgZ2ljX2Rpc3RyaWJ1dG9yLmFsbG93LUxQSUVOLWNsZWFyPTENCj4gLUMgZ2ljX2Rp
c3RyaWJ1dG9yLkdJQ1ItY2xlYXItZW5hYmxlLXN1cHBvcnRlZD0xDQo+IGFuZCBvbiBPcmFuZ2Ug
UGkgNS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVw
YW0uY29tPg0KPiAtLS0NCg0KSSB1bmRlcnN0YW5kIHlvdSB3aWxsIHNlbmQgYSBzZXBhcmF0ZSBw
YXRjaCB0byBmaXggUldQLg0KDQpMb29rcyBvayB0byBtZSwgSSBzZWUgeW914oCZdmUgdG91Y2hl
ZCBzb21lIHByaW50ayBpbiBnaWN2M19wb3B1bGF0ZV9yZGlzdCgpIHdoaWNoDQp3ZXJlIHdyb25n
bHkgaGF2aW5nICVkIGZvciBzbXBfcHJvY2Vzc29yX2lkKCksIHNvbWV0aW1lcyBtYWludGFpbmVy
cyBhcmUgbm90DQpyZWFsbHkgb2sgd2l0aCB0aGF0IHdoZW4gdGhlIGNoYW5nZXMgYXJlIG5vdCBy
ZWxhdGVkIHRvIHRoZSBjb21taXQsIGJ1dCBhcGFydCBmcm9tIHRoYXQ6DQoNClJldmlld2VkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCkNoZWVycywNCkx1Y2EN
Cg0KDQo=

