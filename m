Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMUHNmmA72moBwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:27:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AD4752A9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295016.1571714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNrd-0002v8-8J; Mon, 27 Apr 2026 15:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295016.1571714; Mon, 27 Apr 2026 15:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNrd-0002tc-5Y; Mon, 27 Apr 2026 15:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1295016;
 Mon, 27 Apr 2026 15:27:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHNrb-0002tU-A0
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:27:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNra-005tYx-JM
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:27:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef8048-2eae-0a2a0a5409dd-0a2a4507a43c-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:27:09 +0200
Received: from [52.101.72.16]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef804d-229c-0a2a45070019-34654810e918-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:27:09 +0200
Received: from AS9PR06CA0718.eurprd06.prod.outlook.com (2603:10a6:20b:49f::33)
 by AM8PR08MB5715.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 15:27:05 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::e4) by AS9PR06CA0718.outlook.office365.com
 (2603:10a6:20b:49f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:27:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 15:27:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB10077.eurprd08.prod.outlook.com (2603:10a6:20b:63e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 15:26:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 15:26:00 +0000
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
 b=hzNBD8tbCo75YoFLpEFLN0s0MAso36PZKZs7oZtKbTeKkyWdeNTQvYXLvep48AS4ZXW3ibRP73hT9i2zCUTr2sxsbpsA/4xYIGsDJNQRlS2AAIzvQeiTPA081bo6CpcBfW+YPUSo4JKPDDJl4C/TDeVLnfOQeQuweu2YVMtw+zTjAr4Fu5jrkcJ4G+WJ3Nh374M/mjRh7WYzkfxEyMT5radZu1OzEb5veIZRYthbR1Rt9HGCM1Nc7ZoOXuqoCiPmsdkZo8MR6+e3GbQUip7b/9dw3z4ABjIyptSq3v8c9ajpIp1GbmbRvXBbP3v3TfZX0IsPD1YD/eEenoeJR6X6yQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4ShT6GvlSujcGQUnL7CVoen9wfpB10+b/cLPUQSSlU=;
 b=IwyrY6SbjrpydkzdjLarmos67XINQZhDhOw1HsVPc6O7/Fhc2ifatiNyJ5NXSTK/beEq4xJsgVYxktvHB0yHZGI/Yf9Xfj3zt1quLEuxaH3QOFgyTgfQV9HWM4+Z1f/flLD/mqWjf8RaecmD82amJDlBD8KlyTCNVHuyDEYsSpwPdb2A/ENrklNihG1qdBL5ll8SQw6qHrixSjyNG84336YI4OYgGN7P5eY8p1hgA8vacCZxcW9oWoDlyrh8CLYfzr6z70295+eXH3vmIcX4korjJlpptyOTfBy9vch+sYPqKwi6/H9PGB0WeYFsyYGvE3Qu2W5XwilqcCNWAd6kHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ShT6GvlSujcGQUnL7CVoen9wfpB10+b/cLPUQSSlU=;
 b=MCpvPDoreGZHUWPlf+3sOuD+I+ZTxEEeJrTJnPLAbCaVvKMZjY1jSn6d3yi650A/yihLsHuTy/7Q+tPnk0fbj2PZUGBEEOLL4uonhUY5zvpk5ujDoD4V9bVW7bxddeIzQAhO76t5WAb+3M6Oa+IrvQwqenQOwCVe4VOrcGmbTrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UghylKoLGh0KDuIrnxyhTdfkXidFPmVP9XrB/67KdPmzBSGzmtB94/ZXEqiPwJmIAx1XDNQtNip3/BE3wQ6+1fP+01FkCPQPh0ihnn6V12zQPqtBM9oueN3MpNlTLWyEyOlIMt4qwziPvkEwI5ytNHNkZrkctSMOBUfR3U4rXOhar/GnZqgcAz3MNo1B0/dfl/fZjjgQMu4ys4t+NVlRUfpnEosqSa1VZd96htG6ZES515Z/1mTqpPtdZ4Xh0FS5Q/QjbQhfPCr3PG753V+yrwFMEZ53HC1cVrtOWp3LGPbDjWWKiLVctv839rKAeRFzFYJ4WWiEh/7aUspw5ZF8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4ShT6GvlSujcGQUnL7CVoen9wfpB10+b/cLPUQSSlU=;
 b=FrbJVk7qrHZnWIXyxcT2LVbpM2/SHLES/2pSQgD8QcCzAst0bMRje0DTjkkTddSICVr/wuTC2wybCkkBUoCrPrWliuNqeigMF1RCeOi5SqSsrcE5ITPqy2Dc/EQ++RMH0sr5WDGYHlMrOp78sVWbvLaGbwUfDVcg2B9nVH7HxJ6WBPz+dtOd9PDTzKrNS/Ygwe5vhTfj0zn6MnlkngfcoDH7MYdWrjTbvIKnwrcvhBku6WG8J+Z0EMFXpFJl4/mfpUMKc9l1xdxV9u/0ZNHaVcbSjW4GP7lfJQVmnqELskXQ/vNNnPI3yYXgqsHwnSLaLeMpPTsr/phTv8uPL+BVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ShT6GvlSujcGQUnL7CVoen9wfpB10+b/cLPUQSSlU=;
 b=MCpvPDoreGZHUWPlf+3sOuD+I+ZTxEEeJrTJnPLAbCaVvKMZjY1jSn6d3yi650A/yihLsHuTy/7Q+tPnk0fbj2PZUGBEEOLL4uonhUY5zvpk5ujDoD4V9bVW7bxddeIzQAhO76t5WAb+3M6Oa+IrvQwqenQOwCVe4VOrcGmbTrw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
Thread-Topic: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
Thread-Index: AQHc1lonfl/HZr0bRU6yMGs4M1GHKA==
Date: Mon, 27 Apr 2026 15:26:00 +0000
Message-ID: <BF235081-E9F4-48E1-BDE2-854DBAFAAA7F@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB10077:EE_|AM4PEPF00027A6C:EE_|AM8PR08MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 10676d10-920f-4394-c849-08dea471700d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 a/rwLwgr5y8rLdfdwbnyJWejl+B8qgCsyPZBrLMAbrlLtNzAOsEffQWjb/pbjxcBMH1k4xo1mSbupRCO5FJSogklFn4dfZIip1KvpLHTOclgNGmBmzF8OjMb9IE6QVBADxCNEYfAwsbQEzfSHOGGilTVdGGukLgH/2v507Tk7O//IVBkk17ogftBYqClUwDToqarnwEb3lxuam90irgDLY2p8efS4R5Txaay8jW9s5+rknSD/besTDC5pl43z2TZk0cuf9mlXi2pUqJlnY0SE4+ZJ3hHDQwCw3ZAleFLQKvNnjqHhCiP/lsav2qUWHXccDVQlRL393na6pb4IBkfpDW6+zjK9C3anOrGKbX/5V6DP1wmIOrkbaNgfG/Uf5zKaE8t+pLMNJ8lDjmZLqB9e32p1RTgmyCloNzv1CXPvUtLpIOIgdzQY2d6Z9yhwaZGyZ/TQONgBAwd96IEjQ76KA8x0+wEJkFUvc1KU/TENnxBUO7/JBrm8h5OPZduLl86FZHPolQ/xMvYe47dgznxwRXf0IoM8d+HiS192AEnb/dKI+2/2Bnlq4y26D20VQEZqwWF3Ozv9GtmY01vXMcvuceIn3FVsSvWQpa7I/d/zHiKV8wjHqnMrxjcBHgDqhxqepUObX5KtqwsdKd/46gCm0TcVjfXQvkwW3Yw3SlqgdHGRxL3og5iiT/djVYITMT1s1kswbrllk0uhiCYoxviVNI86WkTBdaJp8nserU2wMmEfceiMCS2jrcy2y+45LoFP9Cp1xf7DpS8EsErYJBu4sfEEQ4GjcsJZ3lpCATr9SE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E73D316B94ADB54F862ED2AB71004E43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 P0fdS0X+1iG/eBdWvORxFlq26VKhhigVCp6Z83wiLvtNiFKzkE51iTRxb/54tbEsLHT9ByjcR8Ia3PsZUMr8d4ndJomgmdESxy0HN2BrgCFEH1QHo2ycOJh2NSmuKTYda+qgUdLRPWGNICB9p4F7lbZZ1eM81v05kEZQVoBPnDlNBxzOTzvtdxwlO/O0wB85Hc2Hz5d4CJvDHAYdb7cslcos9zG81QrFQysPMBBPaqMtPUR2XxE3XKBmC/pl15CVoVlpwlzsCkh9i5JRxXIk1+9DBcJlmMYK27pNoXDWQUJP8lSRgo0/HLUWTN8/A2rHBzkIQt7L5+KoZYMTwxAy/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10077
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	603728b6-175f-489b-7f9a-08dea47149b1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|14060799003|82310400026|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uZfxt5RSf0SU0jX1rwD7mCzoeueaeIC7IEs/xWmyzOXyD9f5xmfHHvdrOvSfjvnTdVRYSNec1Cq4JU/TWq8BDzJ395g30JYmDT6byXYBFOTfeZpAtC6IV/O/KqmCnPh/L8fvBDxrTStyRPjzkzXFpqKFMkn32f027A3EElzQXwEmYeJ7CLzEM0OFZqz1DOIolkshZUxHHHrI+WABayw6x2158ExXsPJvIVvdY2D3MnEqKpIV/4sdGyvvx2x7qOv2PJmr1ZUYBtTq1cWzMbgXjFoYp8SaiUl+2zJmWWs/0f9S+Ud6yR9dBp9s5TrROO8+STtPoeO2IIWu40JPHhS3TtAfGJ1FyyZG1kQyrAskKqTiaTStWBdm5SMhQ6VVfX1th9OciXPEHhXEDH0IITaZrCW3UbptJKHIgtoWXxIwQKj7wjF29B537Cxvl+bPfVbYgIFGGIGJQpimqHssHkSxxEXY3VAwaSVK0LXPTf8i/IKNfeHSZvpa84wDakLDqLPPdEiooq7ajxt2dswVWMD2Mg6sh1f0om/RJs1aYkj/2aEcviUyKoaGtbt6jlJ5H9reFHwKZs4EPERmEcIx8BjwegA/puNfSVoOLxCLvx62u8PrxKD9F6q/BWmGVPrfuuJKnnKOhdcH1oGNu6CDdrGZPDQngNaW2RSsv1AuKwbimu/t4SWjYXgRkbOARllxSmw06MHh3YiY2hPdWDc25Q7iH9zg0wLzQM2OLF7AVf9EU6SkNON5BU3s04KlxwIloovBtYjWs0WXyuWx77Ls3L8Glw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(82310400026)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ne29DuKG8nJmoXMDL61WVq4zi0n5RYCr/alsIAKxI+UQQfSix3fWLH2pyqMe/s9n8lRNHHPRSrFcBDDsPkCTQS/b1HiW9kq6jv1HoJubTY1czLR4nlEbbLvHZSh8v0Xp81S6vuXd/N/DdxkYe21VM+lLme+YgA9MFHyvETUYsop/fHO5dlt6A27tMY+TuaSOiENh2MHuXWZSXDq0DTb9eS01NPEQx4XKSnHYN4o284659/0oHjDMY4M75FUYTR+STbidpqWo4zl/cQMr6U0oLHg6pOLNn4W2rLpm+SexbpZoElXfE+plTrXkm1kwx2MSWo8Q340orBLYzDqO/05JeH+NpG+cET4K03+jXIl5iCV24qw691NNfGAX+mWN2h5lNskh+M5Jn42Uud2yr/b8k48Egf0xuOfUnUtIImbhAAm1rc39TzNenvhz2D4w//hM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:27:05.0470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10676d10-920f-4394-c849-08dea471700d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5715
X-purgate-ID: tlsNG-ef75cf/1777303629-2B77AC48-2817BC72/0/0
X-purgate-type: clean
X-purgate-size: 2398
X-Rspamd-Queue-Id: 230AD4752A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,aggios.com:email,epam.com:email,xilinx.com:email]

SGkgTXlrb2xhLA0KDQo+IE9uIDIgQXByIDIwMjYsIGF0IDExOjQ1LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gRnJvbTogTWlyZWxhIFNpbW9ub3Zp
YyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPg0KPiANCj4gVGhlIGNvbnRleHQgb2YgQ1BV
IGdlbmVyYWwgcHVycG9zZSBhbmQgc3lzdGVtIGNvbnRyb2wgcmVnaXN0ZXJzIG11c3QgYmUNCj4g
c2F2ZWQgb24gc3VzcGVuZCBhbmQgcmVzdG9yZWQgb24gcmVzdW1lLiBUaGlzIGlzIGltcGxlbWVu
dGVkIGluDQo+IHByZXBhcmVfcmVzdW1lX2N0eCBhbmQgYmVmb3JlIHRoZSByZXR1cm4gZnJvbSB0
aGUgaHlwX3Jlc3VtZSBmdW5jdGlvbi4NCj4gVGhlIHByZXBhcmVfcmVzdW1lX2N0eCBtdXN0IGJl
IGludm9rZWQganVzdCBiZWZvcmUgdGhlIFBTQ0kgc3lzdGVtIHN1c3BlbmQNCj4gY2FsbCBpcyBp
c3N1ZWQgdG8gdGhlIEFURi4gVGhlIHByZXBhcmVfcmVzdW1lX2N0eCBtdXN0IHJldHVybiBhIG5v
bi16ZXJvDQo+IHZhbHVlIHNvIHRoYXQgdGhlIGNhbGxpbmcgJ2lmJyBzdGF0ZW1lbnQgZXZhbHVh
dGVzIHRvIHRydWUsIGNhdXNpbmcgdGhlDQo+IHN5c3RlbSBzdXNwZW5kIHRvIGJlIGludm9rZWQu
IFVwb24gcmVzdW1lLCB0aGUgY29udGV4dCBzYXZlZCBvbiBzdXNwZW5kDQo+IHdpbGwgYmUgcmVz
dG9yZWQsIGluY2x1ZGluZyB0aGUgbGluayByZWdpc3Rlci4gVGhlcmVmb3JlLCBhZnRlcg0KPiBy
ZXN0b3JpbmcgdGhlIGNvbnRleHQsIHRoZSBjb250cm9sIGZsb3cgd2lsbCByZXR1cm4gdG8gdGhl
IGFkZHJlc3MNCj4gcG9pbnRlZCB0byBieSB0aGUgc2F2ZWQgbGluayByZWdpc3Rlciwgd2hpY2gg
aXMgdGhlIHBsYWNlIGZyb20gd2hpY2gNCj4gcHJlcGFyZV9yZXN1bWVfY3R4IHdhcyBjYWxsZWQu
IFRvIGVuc3VyZSB0aGF0IHRoZSBjYWxsaW5nICdpZicgc3RhdGVtZW50DQo+IGRvZXMgbm90IGFn
YWluIGV2YWx1YXRlIHRvIHRydWUgYW5kIGluaXRpYXRlIHN5c3RlbSBzdXNwZW5kLCBoeXBfcmVz
dW1lDQo+IG11c3QgcmV0dXJuIGEgemVybyB2YWx1ZSBhZnRlciByZXN0b3JpbmcgdGhlIGNvbnRl
eHQuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIG9yZGVyIG9mIHNhdmluZyByZWdpc3RlciBjb250ZXh0
IGludG8gY3B1X2NvbnRleHQgc3RydWN0dXJlDQo+IG11c3QgbWF0Y2ggdGhlIG9yZGVyIG9mIHJl
c3RvcmluZy4NCj4gDQo+IFN1cHBvcnQgZm9yIEFSTTMyIGlzIG5vdCBpbXBsZW1lbnRlZC4gSW5z
dGVhZCwgY29tcGlsYXRpb24gZmFpbHMgd2l0aCBhDQo+IGJ1aWxkLXRpbWUgZXJyb3IgaWYgc3Vz
cGVuZCBpcyBlbmFibGVkIGZvciBBUk0zMi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBT
aW1vbm92aWMgPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
U2FlZWQgTm93c2hhZGkgPHNhZWVkLm5vd3NoYWRpQHhpbGlueC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+IC0tLQ0KDQpUaGlz
IHBhdGNoIGxvb2tzIG9rIHRvIG1lLCBJ4oCZbGwgbGVhdmUgbXkgUi1ieSB3aGVuIG1haW50YWlu
ZXJzIHdpbGwgZ2l2ZSBhbiBvcGluaW9uDQphYm91dCBzcXVhc2hpbmcgdGhpcyBvbmUgd2l0aCB0
aGUgcHJldmlvdXMgb25lLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0KDQo=

