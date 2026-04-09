Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDSoHnaa12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:24:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A03CA5E3
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277241.1562471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoQa-0005sB-HU; Thu, 09 Apr 2026 12:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277241.1562471; Thu, 09 Apr 2026 12:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoQa-0005pY-EL; Thu, 09 Apr 2026 12:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1277241;
 Thu, 09 Apr 2026 12:24:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAoQZ-0005pS-LR
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:24:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAoQY-005QtI-Lk
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:24:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d79a5c-bab6-0a2a0a5309dd-0a2a4501c6c4-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:24:06 +0200
Received: from [52.101.65.9]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d79a65-6fc9-0a2a45010019-3465410952d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:24:05 +0200
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by PAWPR08MB10090.eurprd08.prod.outlook.com (2603:10a6:102:367::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:24:02 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::3a) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 12:24:02 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 12:24:02 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB6394.eurprd08.prod.outlook.com (2603:10a6:10:25b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 12:22:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 12:22:59 +0000
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
 b=W4CeHh5y5uUwp/ESN9zACyyCSBnnhbjbC7+PvE/L64+13XgWW0gHf4SX7Uznd4u8da5m+EMlVolt4Pd6m47R4Jvhv5E67IED/GCCecHvC+tBZ8GrSzQ8K1Rc+gqE57WS1Nbr3/EiH5fiVl2qxvK8WxYw4YGl3v2uqdXJEE7gwxdWX+UA2tcLMdg3k0Mtd9co4RI9sh5dEEJ/VGWTEjl4i8kyw4eAmiDe8RB2kb/NOKdrAo59yrwteNnHrFGQDE/iPxelZRPooh+sUWp9BTeraFhJmDPGddP4wdFSBSX/TbfTxVFcN5VoHcHq3YZSxo0qANS2PO+q2j7QIIoxl8UXZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ROx8QQJcwPWsFXms6bd60bnGVW/c/0+SxbZfnYXEMY=;
 b=n1fQN9pObs0QAEkH0c9+MPoEkeWuscNbpPClXU5s6TnysOFqNTyHGQCBnHbfMQ+tbSrVVAB1PbvYWEnrQlk48UJVadRfu/KEcW/D+KhLADO0tOg8ZVu1PdcQrAZHPyY9+P0CAECmBekaBv8fqJ22t820oIOsRlcreTfbzhKIs/0BUmP4/az1Y9g4LaRMftYJOd9uZ8Tm5J+8/UNBlbQ3yiqE9K8ADF9SiSaGZZEWpB1k5QWAVA9wUdPcFNL1Z1csSM3QlAEuKHqKlyZ7MskkntFSKelqD2PlZY6LrIEoFRnI548gfA1ItTCl5b0d3jlYOfE+kpM4khRFtN53OpHHQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ROx8QQJcwPWsFXms6bd60bnGVW/c/0+SxbZfnYXEMY=;
 b=De5RHvk1ouU0HL41qFaO6H1CvfcelDhd0zISUgahJ4GcJ3LkTplRlkOdUF2cZQ57jt8VGtF8ctoi2qOw+so7f44M5YuknQSSLCCCUmNRoURS6eG/UaETym/Ys0pYikE/KCbnsIW17xRIKSWIKku0AMIj2FkdRmxTC9RkMKRzjiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3lM/MN7jMmyJLpgchdS7h6x0TvkdhIjHjeFsX5IuGA8ry6Hcn3cQgXr7cPeLOjhXogPqN/wEcMC0XB35gURC9Z6EJvWo2Pb7AFAvPsybG+KDNVLROwAcKKpgxmEHDk2TTXjLcBuQLO5xEFS6xA9csdr6Qc8kHo1VoShIqFlzOq+Z7WK5BH8waGKawzvwFFtxQVa1057D16ZTczBhcrxjTOz8MZXzSpYeruPl2Vqp6N8+vBUB2luSyfb+cIvfsQ2Hq39o/+7MvUIQC9snS6UGCOlf9MyVufVkAPGWfNkPObsF+Hx2v0j+GyJ2t+X+TNgXPwjVJOfnPhO9MXiTNRNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ROx8QQJcwPWsFXms6bd60bnGVW/c/0+SxbZfnYXEMY=;
 b=yjCCTPC6ZK2lkCm8MB98sh470SJpq2CbhCpSxm9Jd+SxGWww3RXWSFILnVN/jTBYoVEAYt9nsR4ziL+gL8iR6V6j/XAt44WJbOzodqrvS3/TiFOkUknD65mNMNlzWiqCTZ5vVhl7eRdopfJvyhf070uPwZZjDQvkGzwhccOQsOXLGgSV+tY3xZU3OMlGMNf2et1AKkmBOnyO9cJx51jlLzik8jsXE7HEGnGreW6CczohHNsME3hreTpZYSi+Bp9cSh3M5Gp5hdXJht61wWp3MAmFY5XHus2/Fef0xTMgukkx/ZakLV9cV9ccV9PoYO68SDFX/8OHGpnpt0dbN8G65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ROx8QQJcwPWsFXms6bd60bnGVW/c/0+SxbZfnYXEMY=;
 b=De5RHvk1ouU0HL41qFaO6H1CvfcelDhd0zISUgahJ4GcJ3LkTplRlkOdUF2cZQ57jt8VGtF8ctoi2qOw+so7f44M5YuknQSSLCCCUmNRoURS6eG/UaETym/Ys0pYikE/KCbnsIW17xRIKSWIKku0AMIj2FkdRmxTC9RkMKRzjiM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Topic: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Index: AQHcyBWdW2bjkWPifku6XWocvaXOWrXWpuWA
Date: Thu, 9 Apr 2026 12:22:59 +0000
Message-ID: <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
In-Reply-To: <20260409113934.197619-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB6394:EE_|DB5PEPF00014B8F:EE_|PAWPR08MB10090:EE_
X-MS-Office365-Filtering-Correlation-Id: b44f09b2-517a-4862-889c-08de9632e29b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|38070700021|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 7xTrwRgs5RLOcD1E9ob8vSYbxT29f5+7LHD6L3BhAEJ/XtrBkzQtuUGH2VO9/D8ShBlFrgORGBIG4dXNc0G8uDMz5PSAViVMNr0dy7mWtWsQnriezLd/QsAPopOx2lyf8tgb+f8i7rlZv5l0UZkwd17hvHFLV4UdKr14D6MhJBfEYklq62e/x3RGEtyEW+rBmRF2obyX9CdLil8fFKUFA60XzWxgb7nD/GeKUSTFbJrk6h06+eNyQzrHbvgEucOkMm05D12qZJFdf+S4TOxWi9PMBvI2U/+Ft402yrmbbrgUhNWV4XLph/RtTKsiOmUjWhTE6BdwtdeMiNvnt18Q1Y3Yfp8LLhCgqkZ8b+tSIZIK3kLuFSn5osDZLKkZPg9eiw2NeZH47Sym1LkA0/wbRjtQ/bG0jyofYYqDuQcowgEmCbNbEcoSssHkUBanN9fzfyyo7GLLR5ra1U5yFbJV/I1cdICQPCWVhArktoQjeznikai09+CdpSAgd6A1z3YguMrRYYqwCcU2lTc3yA4QvOgONArn0M89Q8tZKUOvhgQXexH05tkkdJ3locbNJp08qqKvaVN0KcyC3dP+0QR/tfFpX/pPug4fmIdHpTk8+IXQOo3bkskRaF2uqFuJLi3yz6SO3GTxHW7xPUl/sKGA6PU36sxG2X3uy9lkHcYJp+UU9PngI1Fa2AVURwIqCrKYl8s3NWAArMsVez4WnWN2xDFfDaoiw4hyJAbmo2blxbKO4ns0GnK6Lqbx+To2W24vPAXrve3fAfgRyjy4L/gvH2TDnyESKEmXukfpR9mEOFQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F370DAF453677244ACF5B78AF03193E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 byhpsh2XmrylTQL+brZmWYvmfGJRpGyc2bJi0zPkWlMFKY1eqvrtaxn4qh5cT7oKDoS7R0hnA9wCPmFNlVlasntznn/dW5FHp0VYCf0Pu+k/dC0+Jg1y5Xgzd/JjX7mOhP1Ihav4nS9saiMEw6hPc1hxPiDc3IBaIwc1OTDCwLW9nHhi7WFF0oMbtVr2iyyuNLsKAeYnh1XDsWLApqR3Ec+c8zjUh5qJn71qISpIEQS4P6HX391rRhZwKSatRFGxxS7mszVu+pn41xBQ/rLBZibrTbJUatl80VLgzFQ87/tlN7zBya+zgIXaJWwywVnwz9O5CZK/lPN1qw/qoIVWIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6394
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2329ddb-fb0b-47a3-e77e-08de9632bcd7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|35042699022|14060799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GKTHE4xwluMEsZE6E1/3X6sr9pNxOR6/CTvmrdwR0vnLneFgUJpTbBx42HIohYCtBH39cdK8fFB39inMSwuR30rKhJFvibsx9RWyp6NJZUg4/j/TWCSWb6szieF4nDhpgMYJgnYbZX9FYngCQf0HXMrUGTfLtSBXD8kZItpZ8hh4Bc3GftqNyQx/Jk/u85tpRsekjrz2WoYL0G8BB23b6Wo7X/VKRu15/pGgJu09PUi0WshoNc02WvBPkqR6qUdPdBAN9Xw7P0LIm9UFDndGrCasQukeoXHKED2J7wK0ZPtGitAK+8oOXeCWJJ1R9uXmD7UevIOhx9PnRb3FOUm4Y9c1t8QGrWvpqSAoq81aIA5yrBEdqZnPCghfwIGV3XtXAmRRqZNyZOWWELerHHnH3fhsVCKqzVJm+Je4/6YA83Ld4RCI7lfS9d1MMMOT8FOZlusSB71s3C4f+AN9RnMWPoFcOHHvishtC0JB++fmzsR1N8u8H+2KCnK1sFbADI1l1NwthnOIZzAy+G35V/01jEm9fOT/EuZIgYh+vbFE4xpI1tmzcsbG+bHpmzpXIIVpSOJsYPvqFL/Qn2VlZPQYJq/WOEquOYpjvUK16DzzDMVWmeEF58c4CCdTXlmOs2EyISwHw/D9N8ubbO/qEtF9/WpsKUohhvvLPsWUkrLmVTcAGBk4GWWH1tXrfYRAWT76yXiKj8uTXgKALT/WYMhIRSEruEBpRKrm7o2eN9zwC2GKqHOT+REKud6qXtqwlaU2Pxu8xM0B2zSC9vepRJThEA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(35042699022)(14060799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IIK1ax/KOApDZ7SyrqdNjhr01Xqa31m0UVgSkm/2C8a6deKEc9oNrifPIgrZmB3ctoSUjsM3Ih6siL2V3wD6p1f6pBK6sVy4M/39ihJTAuxHhLJfG3gclpkVWgPKlXFbM1DDuSXtc9J3K08eiMmV0sfRnyiTO0HdUkyhOGJBPfmM8dXa6dRUGUZF9HdTwYvw0AN2dnxwQatuuexE9bgU9fALnPRkt0OQ+AzaoCbF+zWF5fDxCFZ5q6oqiV7CLKk6XyflKNWo5ghoyvTymnUl9GFPoe7blf8uAh9HBUw2qATNb6otV7Msl5zE3qTBW8EfFZ1gk/1USgCx2lkJTRIUcXvmCF18QAN7U10WxnOY8CZaMXowgkU84VqxXcI+Kyic78Ub+1+HGzr/J7gu5ht02qdh7Qh1c16rGKSfoS+P62/UPMNmJPt0TGRp2rVjMrKA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:24:02.6593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b44f09b2-517a-4862-889c-08de9632e29b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10090
X-purgate-ID: tlsNG-d62444/1775737445-B7AFD185-D659E387/0/0
X-purgate-type: clean
X-purgate-size: 676
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A27A03CA5E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> The check uses >=3D to compare the total number of colors against
> max_num_colors (which is ARRAY_SIZE of the colors array).  This
> incorrectly rejects input that would exactly fill the array.
>=20
> For example, with NR_LLC_COLORS=3D16, specifying 1 color for Xen and 15
> for dom0 would fail.
>=20
> Change >=3D to > so that exactly filling the array is permitted.
>=20
> Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


