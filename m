Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA3dE1Yz5mmOtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:08:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24742CB1F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286019.1567144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpIK-00074Y-Ey; Mon, 20 Apr 2026 14:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286019.1567144; Mon, 20 Apr 2026 14:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpIK-000720-AA; Mon, 20 Apr 2026 14:08:12 +0000
Received: by outflank-mailman (input) for mailman id 1286019;
 Mon, 20 Apr 2026 14:08:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wEpII-00070V-Qx
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:08:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpII-0045lI-7o
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:08:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e63347-bab6-0a2a0a5309dd-0a2a4506c4c4-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:08:09 +0200
Received: from [52.101.72.63]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e63348-7371-0a2a45060019-3465483f7159-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:08:08 +0200
Received: from DUZPR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::7) by DU0PR08MB9227.eurprd08.prod.outlook.com
 (2603:10a6:10:41a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 14:08:04 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::54) by DUZPR01CA0014.outlook.office365.com
 (2603:10a6:10:3c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 14:08:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via
 Frontend Transport; Mon, 20 Apr 2026 14:08:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB7754.eurprd08.prod.outlook.com (2603:10a6:150:55::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 14:07:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 14:07:00 +0000
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
 b=gOyRjI3oZU/5nbEHMdplSsoqE1oCLN2nVQDgXJcp5IviiZKMSgEBLAGu5R9BnV/BJYjT/LrHS23POeVmTi2Xqv5X1jAQyB7/XvHguFb2pZpc4QTbmd7v9QwuCHIgVgBWOSGh2sE8bx1wJ7rVV46LEwquxFwnzn9lhqRrwmapEU2sYWenBpoJ0z4cqMqjd02AHNr8c5XpR7E+uSc6CBArW5mFW12RTvJbqD5PofwOTHpWNwctDLieC0jQfipZg6QimoOuCMCZ4OPebltN7bs4+aoUllHDDiaocYUAuU7nvWvZoNZbKRvvie5ggFVRKXi/UBsiKoZDKmIHpY2Z2ii89A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3RbtOAMMkQ+oLoWdnf0f1Y7EtnKscpNvF1OZ1CLJj8=;
 b=pH+OzRXTieQEvsLGJe7AHwVT97iw7bnmjBJyisCuYrOBxxYqrUbSNbZuCaJ2D3kwBUKWIbvAF1cpznurw/NbaK9s9FJTLtK3pb3UuOvYlOcrlClADOCHU6ij4nngixd7VdqmgbyIudnHMKECG0WsbtH15B6K0I9Mo4IGAgZDOpRQCrfNb52YqF4NdsXe/e95wWwgaVNS3ODdoDlTlUzn49KNvcaUIEhVZa4QRfh9sqAuOO+lc8ljTwopcRL9rP3ZvgQCuJQjTlhfI2rF14FMUI/OVXEx8Kz00YsHff70nd29HgHlTvGCGi8BoXQmbdDD8ZiIlNqo5QgBdY28gpKyDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3RbtOAMMkQ+oLoWdnf0f1Y7EtnKscpNvF1OZ1CLJj8=;
 b=VCYJI8a90Pt6O+yvqb11LbVlD+I9VYj0MbNei3wXV8k5CYmgQsRQoVcyQGHgycWnLKKek8Qzv3i+n2f1Mkd6prN4/fdKLT8DP6YdM642tfgpejbXhIhlIhsHHBGfdUL40Bs93c3RVsrfrsIRuJvLvynb+8SJO2CLv+kLinYCrW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FU4+mLGHUBL0q8QV7CPFQR0mfPeQlbXYHwHUn2p3LSugnEk7kg8Rlj+pGpgzQ4DYnLmKQOq7btk1oHuTtdgrMi6HCC2HytwKvs2jznyscQy2VdIAbP6Mk6VlMqwfpgbTGrdCBTswYSp2yj1BJxXQzpXpm/uimWzAA3wnkARnmAOW7idqBa1rvArldvUaCXj4dxl18tlFxhtT1nSQ63TFhfDh+o8ic71xfaKCMiaVQfpnG78aECWhY9xHjfcB3G6yOVPV6RJ7Xj8uFR+mAQbofK/pboIW1+BtK5U1Y7XeCIpaEo3Wfu1Y8miAgJk203Tn6Db1syCGdSCEZaaCRdCmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3RbtOAMMkQ+oLoWdnf0f1Y7EtnKscpNvF1OZ1CLJj8=;
 b=at/h3N4e3QHdEZF1xV7jVoB9uZLxn/WzXMN8VyLWXwAIO74EnxmhbcPhWPUr9+vv8uotSa3YQ7z2P49fXP8Ikj8wL6ihyQpgGuGce2fhytiZxFuSl2En7DGPAq5RixEViWsWMNUGBxWGj5cp/LDvoyd9gJMQ5TKX2SsAi1yTLm3/K5s9mrNGbKNsn7phV374B6+LvdtJnYc+MZ9mreeLouKh4vLDVKYdOPXksvWq4MzpIDg8IxV+5EsshOXKPIzfrR3IHEu1H2K0b0Cx7mco0xMSyxP4Cnx+tbJmc8uIoA0SqwVJ2uNaA+js+FaDJkh3LapTHhWCUrdSQQ2a18Vlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3RbtOAMMkQ+oLoWdnf0f1Y7EtnKscpNvF1OZ1CLJj8=;
 b=VCYJI8a90Pt6O+yvqb11LbVlD+I9VYj0MbNei3wXV8k5CYmgQsRQoVcyQGHgycWnLKKek8Qzv3i+n2f1Mkd6prN4/fdKLT8DP6YdM642tfgpejbXhIhlIhsHHBGfdUL40Bs93c3RVsrfrsIRuJvLvynb+8SJO2CLv+kLinYCrW4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Topic: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Index: AQHczko4909b0LdR6E6hEGKgM2/tzrXjJWsAgAASSYCABMl7gA==
Date: Mon, 20 Apr 2026 14:06:59 +0000
Message-ID: <F79D2A76-9FD3-4E6F-A26F-286B57E87BD8@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
 <DB4CBEA0-B901-466E-80AE-483FE00A1282@arm.com>
 <10ef543f-ec21-47ae-aeb2-f569f8d48e27@amd.com>
In-Reply-To: <10ef543f-ec21-47ae-aeb2-f569f8d48e27@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB7754:EE_|DU6PEPF00009523:EE_|DU0PR08MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1bf034-3c67-44e9-a4f4-08de9ee63d6a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18096099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 s5SSsxLmF6r2SNlBYz4QwmhJknJ+ZiRAb6NDg0yXin9K9TQVVQdXwVf/CU/KuwcqntCRK0nN4QdLLD/VsBdIgeNdS/UXL6W26xkA3pZfoRxigmoDqe+8BDdPU0VF5U/jTFVI34lgKSAA9U+lFtKF2Y54gHM+wcTJH6vIyr6kT9hOjX5RW0KL5Ma0ae2noHmijSIS/LFOmPW9fIqC1eaFQozJmLfK5MYfKwOQDidiiGeFh+d2O+hL80thY8+OjieV+bzT9QSuEnVO7fkCc+Qk6e7j0YaAp44WLSPWu+UaNEa7j6hNggvPgYKyYFwDAEpk1RNOCxjrsTVqIQ6HK0zkiv5ygAb1Pwp/1Tk7a5vuXHIWnhnWO4hOCqjCX2dfXUdVsK03oTT3v+23npYCzqQQVAVagtGAMew3hsBdDIhwfG7nhaD65IR5STyE4L3dnUvwmetzgjK/DcuhN+Ofum/xrbIq9qBXcWy7q40C4u6Dv8tZCXQCpQUO4wCoiEN8S3KIvIntEhXYXGbZQQgjb3y77diTLcV4XzEtRvSTF0LR3tuFoPjmDygEdahlBCv8ORcjeD31HOq3xaezzcVJCJZFEbS/cueJYB4x+hHwoUTSaBL3DjbI04KfkjiC3YjHoKKP9DP43E/OhPFbljF3NmdFVTJbVegltaUDoBBw51PNlOXcBZelDWDCjzqMm42oG0NX0nUX8WtSm02HKZGmGdhMFNEoJ4sOcNkMEHuZaovE7zpU57tT678lewpZUIKnHJPVqnC8vvD8MXQjQGWvnboIXu6SETxPOaqJ4NUwGR5NhD0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18096099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8C50F7F0541C044B9500362F4E3119F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 KbUiUOGExCkajYwT90qj+PnIrQfyP++DPj5OLZuLPEUYsGMMnCaQLHLkKahiwG62PY0psyRm7m0iBpmDzFWDrxpDMbrMaa7CYVo74vqhhv5aXNpoOHWsl2By2H8GA/6Y6nwr2u9aThWBE5lvcto0vwcNgQDNCzcXogobmhWpljfTeuRsyAIeoeQLK6tvizrtpfTcFE+ugUeC4hVcF+qRX96Z7S/mRuM5hwfwLtj1+XREwETMpWJcruOW4tQu6svsSz0fahcRcY9NXE1Mvjy2gtmcDm04yNLHFj4ZzD9wnbU3FLHLywsP/yNoKHJlkzhVULl/Kq4HIbrFv3J0DRMo+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7754
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5376d82-7c96-4995-2018-08de9ee61715
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|376014|1800799024|22082099003|18002099003|18096099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LfEmI2mjXkyRwPz+oaxat913cV/TLxovJKyYKFt3RxS+PBiiglKi5psS92rwtXVH2vKFw66m+7CygTVV3y/x2W9sEKH3OSehEb09bHxzOhzEiOj45l6BoyRIqJ32lEa9U8/Iu9uTqI48hEaKM3Q5KUyL3jc+4k2qYK5mQ8LwOovJ+qJGlm9WqckOwrQL9tb6mbPRVT/2wvo0c5myAcISoaXGGp4ZbWfUnbTvLXRAyphnHD4DjVfAIFt66kdRvyHvOC/T4anC5w8LU2ZLtlZyzbmGE2nZNMcVpi/cEtuUTzdM7M7QcrWSZnAls/3+FrHCs60nvctppVUBrB4ryhjKHzNXd8EYszkZ4BVx2fa/1zvW8u5GpUClFE2ysOgKMQUdB/JzfMJoBlr+Wm4nxQGvJ6l3g2vamZjeCo++vBoIPxANn+bDr8Dw9RjsBCLmZ7l12bAiogKF4UDg8aqJRDLT1BQRxXITjt0vYaVb+Aco3wSQHPGZzlLfl4pcqph51u+72/QOhaW6ZFRDgY1KXIACGnNkMcfk+f70OgUsAFvKDgvuW7sHqBHmQJht61ekxXoC2Wjy3NOqIfjgFcfh3QtsQOax51T+jrHG6CtisYMG0cFQR5maLKbGEtBWsJLkiryXP8HTWvvhsM3IRrLP9QVfV4QLZVKSPboEDiMgh3vQdtKAMdvRlUp5bWxt5+bQKSI4dwq2VuTOBGYWU6S6L9B3CnbIQJjMQiKBNzgDVGbLstuqsd0LzZsHgDmFS0/7wvSZK0O4rwk9FE0F91bK/HBy4w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(18096099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/9c6jn+E47YcPEHDJj/pW2NRkTmuxoWYysrw56rW75bNO+tCoLQH9ezgsTF882z6iJMfoCEbET1/blEks3bmZu2H9DSAnNlj0bD/cttUmko27ZzDD1T5B15tHnaYRYFDn/HELnocuig5zhZN9/CVnQYyinsROpnd2lAeKtD5I0W6Zdef81vfX13Y475ieFFfZe/ksGKhhn3Mneyq6mePjjkCsK7pckdlLwy1iC1oEQrTnKWlLjDuNHufPKIrZmR6lkESFXsl6IHA0vHh/rwYbzab1p6JsAUEU6iECDLM3YZh713XKAntJag2HdIriMYCA//Jw24sW/7qDSU7zftP7v+9EhdeR6FZPobKymC7yeK6wXMtYtE1BBvy5DwSL7/BwtLsu/KrP1cxiocDhe/M8g1gkq99PZPf/Qya06R41aqqKkvJNRxOqC2VCwy+gGG5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 14:08:04.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1bf034-3c67-44e9-a4f4-08de9ee63d6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9227
X-purgate-ID: tlsNG-16d1c6/1776694089-CDF6BD75-5EDF456E/0/0
X-purgate-type: clean
X-purgate-size: 9304
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 9B24742CB1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SEkgTWljaGFsLA0KDQo+Pj4gK3ZvaWQgX19pbml0IGluaXRfZnJhbWV0YWJsZShwYWRkcl90IHJh
bV9zdGFydCkNCj4+PiArew0KPj4+ICsgICAgdW5zaWduZWQgaW50IHNpZHgsIG5pZHgsIG1heF9p
ZHg7DQo+Pj4gDQo+Pj4gICAgLyoNCj4+PiAgICAgKiBUaGUgc2l6ZSBvZiBwYWRkcl90IHNob3Vs
ZCBiZSBzdWZmaWNpZW50IGZvciB0aGUgY29tcGxldGUgcmFuZ2Ugb2YNCj4+PiBAQCAtMjYsMjQg
KzQ3LDM0IEBAIHZvaWQgX19pbml0IHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBw
cywgcGFkZHJfdCBwZSkNCj4+PiAgICBCVUlMRF9CVUdfT04oKHNpemVvZihwYWRkcl90KSAqIEJJ
VFNfUEVSX0JZVEUpIDwgUEFERFJfQklUUyk7DQo+Pj4gICAgQlVJTERfQlVHX09OKHNpemVvZihz
dHJ1Y3QgcGFnZV9pbmZvKSAhPSBQQUdFX0lORk9fU0laRSk7DQo+Pj4gDQo+Pj4gLSAgICBpZiAo
IGZyYW1ldGFibGVfc2l6ZSA+IEZSQU1FVEFCTEVfU0laRSApDQo+Pj4gLSAgICAgICAgcGFuaWMo
IlRoZSBmcmFtZXRhYmxlIGNhbm5vdCBjb3ZlciB0aGUgcGh5c2ljYWwgcmVnaW9uICUjIlBSSXBh
ZGRyIiAtICUjIlBSSXBhZGRyIlxuIiwNCj4+PiAtICAgICAgICAgICAgICBwcywgcGUpOw0KPj4+
ICsgICAgbWF4X2lkeCA9IERJVl9ST1VORF9VUChtYXhfcGR4LCBQRFhfR1JPVVBfQ09VTlQpOw0K
Pj4+ICsgICAgZnJhbWV0YWJsZV9iYXNlX3BkeCA9IG1mbl90b19wZHgobWFkZHJfdG9fbWZuKHJh
bV9zdGFydCkpOw0KPj4+IA0KPj4+IC0gICAgZnJhbWV0YWJsZV9iYXNlX3BkeCA9IG1mbl90b19w
ZHgobWFkZHJfdG9fbWZuKHBzKSk7DQo+Pj4gLSAgICAvKiBSb3VuZCB1cCB0byAyTSBvciAzMk0g
Ym91bmRhcnksIGFzIGFwcHJvcHJpYXRlLiAqLw0KPj4+IC0gICAgZnJhbWV0YWJsZV9zaXplID0g
Uk9VTkRVUChmcmFtZXRhYmxlX3NpemUsIG1hcHBpbmdfc2l6ZSk7DQo+Pj4gLSAgICBiYXNlX21m
biA9IGFsbG9jX2Jvb3RfcGFnZXMoZnJhbWV0YWJsZV9zaXplID4+IFBBR0VfU0hJRlQsIDMyPDwo
MjAtMTIpKTsNCj4+PiArICAgIC8qDQo+Pj4gKyAgICAgKiBwZHhfdG9fcGFnZShwZHhfcykgaW4g
aW5pdF9mcmFtZXRhYmxlX2NodW5rIG11c3QgYmUgcGFnZS1hbGlnbmVkDQo+Pj4gKyAgICAgKiBm
b3IgbWFwX3BhZ2VzX3RvX3hlbigpLiBBbGlnbmluZyB0byBQRFhfR1JPVVBfQ09VTlQgZ3VhcmFu
dGVlcyB0aGlzDQo+Pj4gKyAgICAgKiBiZWNhdXNlIFBEWF9HUk9VUF9DT1VOVCAqIHNpemVvZihw
YWdlX2luZm8pIGlzIGFsd2F5cyBhIG11bHRpcGxlIG9mDQo+Pj4gKyAgICAgKiBQQUdFX1NJWkUg
YnkgY29uc3RydWN0aW9uLg0KPj4+ICsgICAgICovDQo+Pj4gKyAgICBmcmFtZXRhYmxlX2Jhc2Vf
cGR4ID0gUk9VTkRET1dOKGZyYW1ldGFibGVfYmFzZV9wZHgsIFBEWF9HUk9VUF9DT1VOVCk7DQo+
PiANCj4+IFdlIGFyZSBub3cgcm91bmRpbmcgZG93biBmcmFtZXRhYmxlX2Jhc2VfcGR4IHdoaWNo
IGJlZm9yZSB0aGlzIHBhdGNoIGl0IHdhcyB0aGUgc3RhcnQgb2YgdGhlIHJhbSwNCj4+IGJ1dCBp
biB4ZW4veGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgsIG1mbl92YWxpZChtZm4pIGlzIHVz
aW5nIGZyYW1ldGFibGVfYmFzZV9wZHggdG8gY2hlY2sgZm9yDQo+PiBtZm4gdmFsaWRpdHksIHRo
aXMgbWVhbnMgdGhhdCB3ZSBjb3VsZCBwYXNzIGFuIG1mbiBiZWZvcmUgdGhlIHN0YXJ0IG9mIHRo
ZSByYW0gYW5kIGlmIF9fbWZuX3ZhbGlkIGlzIGhhcHB5LA0KPj4gd2UgYXJlIGdldHRpbmcgYSBy
ZWdyZXNzaW9uLg0KPj4gDQo+PiBDYW4gdGhpcyBoYXBwZW4gb3IgYW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8NCj4gbWZuX3ZhbGlkKCkgY2FuIGluZGVlZCByZXR1cm4gdHJ1ZSBmb3IgYW4gTUZOIGJl
bG93IHJhbV9zdGFydCB0aGF0IGZhbGxzDQo+IGluIHRoZSBzYW1lIFBEWCBncm91cCwgYnV0IHRo
aXMgaXMgc2FmZS4gaW5pdF9mcmFtZXRhYmxlX2NodW5rKCkgbWFwcw0KPiBhbmQgemVyb2VzIHRo
ZSBmcmFtZXRhYmxlIGZvciB0aGF0IHJhbmdlLCBzbyBtZm5fdG9fcGFnZSgpIHdvbid0IGZhdWx0
Lg0KPiBUaGUgemVyb2VkIHBhZ2VfaW5mbyBoYXMgY291bnRfaW5mbyA9PSAwIGFuZCBubyBvd25l
ciwgc28gYW55IGdldF9wYWdlKCkNCj4gY2FsbCBvbiBpdCB3aWxsIGZhaWwg4oCUIHRoZSBwYWdl
IGlzIGVmZmVjdGl2ZWx5IGluZXJ0Lg0KDQpZZXMsIEnigJl2ZSBjaGVja2VkIGFuZCBtYW55IHBh
dGggcmVseWluZyBvbiBtZm5fdmFsaWQoKSBnbyBhbHNvIHRocm91Z2ggbWZuX3RvX3BhZ2UoKQ0K
YW5kL29yIGdldF9wYWdlKCksIHRoZXJlIGlzIG9ubHkgb25lIGluIHByb2Nlc3Nfc2htKCkgdGhh
dCBwb3RlbnRpYWxseSBjb3VsZCBhZGQgYSBzaGFyZWQgbWVtb3J5IHBhZ2UNCmdpdmVuIHRoYXQg
d2UgYXJlIHJlbGF4aW5nIG1mbl92YWxpZCBub3cuDQoNCknigJltIHRyeWluZyBhbHNvIHRvIGZv
bGxvdyBpc19pb21lbV9wYWdlKCksIHRvIGNoZWNrIGlmIHN1YnNlcXVlbnQgbWZuX3RvX3BhZ2Uo
KSBmYWlsIHNhZmVseSwgYnV0IEkgdGhpbmsgdGhhdCBkZXBlbmRpbmcNCm9uIHRoYXQgKG1mbl92
YWxpZCkgdGhlIHBhZ2Ugd2lsbCBiZSBvbmx5IHRyZWF0ZWQgZGlmZmVyZW50bHksIG5vdCBzdXJl
IGlmIGl04oCZcyBhIGxhdGVudCBidWcgdG8gbGVhdmUgbWZuX3ZhbGlkKCkgYXMgaXQgaXMuDQoN
CldvdWxkIGl0IGJlIHZhbGlkIHRvIGhhdmUgc29tZXRoaW5nIGxpa2UgbWZuX3RvX3BhZ2UoKSAh
PSAwIHRvIGJlIHBhcnQgb2YgbWZuX3ZhbGlkKCkgdG8gZW5zdXJlIGl04oCZcyBhIHJlYWwgaG9z
dCByYW0gcGFnZT8NCknigJltIHRydWx5IGFza2luZyBoZXJlIGJlY2F1c2UgSSBkaWRu4oCZdCBj
aGVjayBpZiBpdOKAmXMgZG9hYmxlLg0KDQpPdGhlcndpc2Ugd2UgY291bGQgc3BsaXQgdGhlIHJv
dW5kIGRvd24gYW5kIHRoZSBmcmFtZXRhYmxlX2Jhc2VfcGR4IGluIHRoaXMgd2F5IG1heWJlPw0K
DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vbW0uaA0KaW5kZXggNjA1ZWMxYmNkMTA4Li5hNjgwMmQzMzExNzggMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KKysrIGIveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL21tLmgNCkBAIC0xODMsNiArMTgzLDcgQEAgc3RydWN0IHBhZ2VfaW5m
bw0KIA0KIC8qIFBEWCBvZiB0aGUgZmlyc3QgcGFnZSBpbiB0aGUgZnJhbWUgdGFibGUuICovDQog
ZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZnJhbWV0YWJsZV9iYXNlX3BkeDsNCitleHRlcm4gdW5zaWdu
ZWQgbG9uZyBmcmFtZXRhYmxlX2Jhc2VfZ3JwOw0KIA0KICNkZWZpbmUgUERYX0dST1VQX1NISUZU
IFNFQ09ORF9TSElGVA0KIA0KQEAgLTIyOCw5ICsyMjksOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
X19pb21lbSAqaW9yZW1hcF93YyhwYWRkcl90IHN0YXJ0LCBzaXplX3QgbGVuKQ0KIA0KIC8qIENv
bnZlcnQgYmV0d2VlbiBtYWNoaW5lIGZyYW1lIG51bWJlcnMgYW5kIHBhZ2UtaW5mbyBzdHJ1Y3R1
cmVzLiAqLw0KICNkZWZpbmUgbWZuX3RvX3BhZ2UobWZuKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KLSAgICAoZnJhbWVfdGFibGUgKyAobWZuX3RvX3BkeCht
Zm4pIC0gZnJhbWV0YWJsZV9iYXNlX3BkeCkpDQorICAgIChmcmFtZV90YWJsZSArIChtZm5fdG9f
cGR4KG1mbikgLSBmcmFtZXRhYmxlX2Jhc2VfZ3JwKSkNCiAjZGVmaW5lIHBhZ2VfdG9fbWZuKHBn
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCi0gICAgcGR4
X3RvX21mbigodW5zaWduZWQgbG9uZykoKHBnKSAtIGZyYW1lX3RhYmxlKSArIGZyYW1ldGFibGVf
YmFzZV9wZHgpDQorICAgIHBkeF90b19tZm4oKHVuc2lnbmVkIGxvbmcpKChwZykgLSBmcmFtZV90
YWJsZSkgKyBmcmFtZXRhYmxlX2Jhc2VfZ3JwKQ0KIA0KIC8qIENvbnZlcnQgYmV0d2VlbiBtYWNo
aW5lIGFkZHJlc3NlcyBhbmQgcGFnZS1pbmZvIHN0cnVjdHVyZXMuICovDQogI2RlZmluZSBtYWRk
cl90b19wYWdlKG1hKSBtZm5fdG9fcGFnZShtYWRkcl90b19tZm4obWEpKQ0KZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbXUvbW0uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9tbXUvbW0uaA0KaW5kZXggN2Y0ZDU5MTM3ZDBkLi40OGEwZTM0MjMwN2IgMTAwNjQ0DQot
LS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW11L21tLmgNCisrKyBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9tbXUvbW0uaA0KQEAgLTg4LDcgKzg4LDcgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3QgcGFnZV9pbmZvICp2aXJ0X3RvX3BhZ2UoY29uc3Qgdm9pZCAqdikNCiANCiAgICAgcGR4
ID0gKHZhIC0gWEVOSEVBUF9WSVJUX1NUQVJUKSA+PiBQQUdFX1NISUZUOw0KICAgICBwZHggKz0g
bWZuX3RvX3BkeChkaXJlY3RtYXBfbWZuX3N0YXJ0KTsNCi0gICAgcmV0dXJuIGZyYW1lX3RhYmxl
ICsgcGR4IC0gZnJhbWV0YWJsZV9iYXNlX3BkeDsNCisgICAgcmV0dXJuIGZyYW1lX3RhYmxlICsg
cGR4IC0gZnJhbWV0YWJsZV9iYXNlX2dycDsNCiB9DQogDQogLyoNCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQppbmRleCBlNmI2NTE5NTY5MjcuLjc2
NTg5NmVjMmMzMiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQorKysgYi94ZW4vYXJj
aC9hcm0vbW0uYw0KQEAgLTI4LDYgKzI4LDggQEANCiANCiB1bnNpZ25lZCBsb25nIGZyYW1ldGFi
bGVfYmFzZV9wZHggX19yZWFkX21vc3RseTsNCiANCit1bnNpZ25lZCBsb25nIGZyYW1ldGFibGVf
YmFzZV9ncnAgX19yZWFkX21vc3RseTsNCisNCiAjaWYgZGVmaW5lZChDT05GSUdfQVJNXzY0KSB8
fCBkZWZpbmVkKENPTkZJR19NUFUpDQogdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkNCiB7DQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tdS9tbS5jIGIveGVuL2FyY2gvYXJtL21tdS9tbS5j
DQppbmRleCA0YjRkYTM0OWMxNmMuLjExYzQ3YzJkMGUyNSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNo
L2FybS9tbXUvbW0uYw0KKysrIGIveGVuL2FyY2gvYXJtL21tdS9tbS5jDQpAQCAtOSw3ICs5LDcg
QEANCiAjaW5jbHVkZSA8eGVuL3N0cmluZy5oPg0KIA0KICN1bmRlZiBwZHhfdG9fcGFnZQ0KLSNk
ZWZpbmUgcGR4X3RvX3BhZ2UocGR4KSBnY2MxMV93cmFwKGZyYW1lX3RhYmxlICsgKChwZHgpIC0g
ZnJhbWV0YWJsZV9iYXNlX3BkeCkpDQorI2RlZmluZSBwZHhfdG9fcGFnZShwZHgpIGdjYzExX3dy
YXAoZnJhbWVfdGFibGUgKyAoKHBkeCkgLSBmcmFtZXRhYmxlX2Jhc2VfZ3JwKSkNCiANCiBzdGF0
aWMgdm9pZCBfX2luaXQNCiBpbml0X2ZyYW1ldGFibGVfY2h1bmsodW5zaWduZWQgbG9uZyBwZHhf
cywgdW5zaWduZWQgbG9uZyBwZHhfZSkNCkBAIC01NiwxMiArNTYsMTIgQEAgdm9pZCBfX2luaXQg
aW5pdF9mcmFtZXRhYmxlKHBhZGRyX3QgcmFtX3N0YXJ0KQ0KICAgICAgKiBiZWNhdXNlIFBEWF9H
Uk9VUF9DT1VOVCAqIHNpemVvZihwYWdlX2luZm8pIGlzIGFsd2F5cyBhIG11bHRpcGxlIG9mDQog
ICAgICAqIFBBR0VfU0laRSBieSBjb25zdHJ1Y3Rpb24uDQogICAgICAqLw0KLSAgICBmcmFtZXRh
YmxlX2Jhc2VfcGR4ID0gUk9VTkRET1dOKGZyYW1ldGFibGVfYmFzZV9wZHgsIFBEWF9HUk9VUF9D
T1VOVCk7DQorICAgIGZyYW1ldGFibGVfYmFzZV9ncnAgPSBST1VORERPV04oZnJhbWV0YWJsZV9i
YXNlX3BkeCwgUERYX0dST1VQX0NPVU5UKTsNCiANCi0gICAgaWYgKCAobWF4X3BkeCAtIGZyYW1l
dGFibGVfYmFzZV9wZHgpID4gRlJBTUVUQUJMRV9OUiApDQorICAgIGlmICggKG1heF9wZHggLSBm
cmFtZXRhYmxlX2Jhc2VfZ3JwKSA+IEZSQU1FVEFCTEVfTlIgKQ0KICAgICAgICAgcGFuaWMoIkZy
YW1ldGFibGUgdG9vIHNtYWxsXG4iKTsNCiANCi0gICAgZm9yICggc2lkeCA9IChmcmFtZXRhYmxl
X2Jhc2VfcGR4IC8gUERYX0dST1VQX0NPVU5UKTsgOyBzaWR4ID0gbmlkeCApDQorICAgIGZvciAo
IHNpZHggPSAoZnJhbWV0YWJsZV9iYXNlX2dycCAvIFBEWF9HUk9VUF9DT1VOVCk7IDsgc2lkeCA9
IG5pZHggKQ0KICAgICB7DQogICAgICAgICB1bnNpZ25lZCBpbnQgZWlkeDsNCiANCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbXB1L21tLmMgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCmluZGV4
IGJkN2IwMmZkMzNiNS4uODcwYmZkMmJlNWU3IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL21w
dS9tbS5jDQorKysgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCkBAIC0yMDcsNiArMjA3LDcgQEAg
dm9pZCBfX2luaXQgaW5pdF9mcmFtZXRhYmxlKHBhZGRyX3QgcmFtX3N0YXJ0KQ0KICAgICBCVUlM
RF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBwYWdlX2luZm8pICE9IFBBR0VfSU5GT19TSVpFKTsNCiAN
CiAgICAgZnJhbWV0YWJsZV9iYXNlX3BkeCA9IG1mbl90b19wZHgobWFkZHJfdG9fbWZuKHJhbV9z
dGFydCkpOw0KKyAgICBmcmFtZXRhYmxlX2Jhc2VfZ3JwID0gZnJhbWV0YWJsZV9iYXNlX3BkeDsN
CiAgICAgbnJfcGR4cyA9IG1heF9wZHggLSBmcmFtZXRhYmxlX2Jhc2VfcGR4Ow0KICAgICBmcmFt
ZXRhYmxlX3NpemUgPSBucl9wZHhzICogc2l6ZW9mKHN0cnVjdCBwYWdlX2luZm8pOw0KIA0KDQpO
b3Qgc3VyZSEgTWF5YmUgYW5vdGhlciBtYWludGFpbmVyIGNhbiBnaXZlIGFub3RoZXIgb3Bpbmlv
biBpZiBJ4oCZbSBvdmVydGhpbmtpbmcgdG9vIG11Y2ggb24gbWZuX3ZhbGlkKCkNCg0KQ2hlZXJz
LA0KTHVjYQ0KDQoNCg0K

