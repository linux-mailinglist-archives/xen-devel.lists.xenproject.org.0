Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC+SFUZc12kCNAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:59:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9C3C75CF
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276759.1562077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkHR-0003yS-Bn; Thu, 09 Apr 2026 07:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276759.1562077; Thu, 09 Apr 2026 07:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkHR-0003wI-97; Thu, 09 Apr 2026 07:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1276759;
 Thu, 09 Apr 2026 07:58:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAkHP-0003wC-JM
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:58:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkHO-00Ccg6-RM
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:58:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d75c1c-e002-0a2a0a5209dd-0a2a450692ec-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:58:22 +0200
Received: from [52.101.83.57]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d75c1e-0df0-0a2a45060019-34655339b7db-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:58:22 +0200
Received: from AS4P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::11)
 by DB9PR08MB7770.eurprd08.prod.outlook.com (2603:10a6:10:396::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 07:58:17 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::f7) by AS4P189CA0023.outlook.office365.com
 (2603:10a6:20b:5db::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 07:58:17 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 07:58:17 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AMBPR08MB11887.eurprd08.prod.outlook.com (2603:10a6:20b:75f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 07:57:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 07:57:15 +0000
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
 b=fsOvdA2D66fQXCncR9b2ExXhdQDlHqtQwI+5RxXV/vZ4gYcFuRIKQgvttGVLq3JDu6YtVXIo8RTYZj4STaFDcmx+dV71K2/IfaZo4aKX5cgilX+QHOr+s56Z2IhRgsJfWxsDQZV8PQVNrLdOUaXap1WqUJEtVMeST1kSQn/zgiXXRNfGRgxVGUwPr4snYx3f4OKTauOMfX4pwsDAAOgB2KZQcv7KTWtpvI65YkndvshHpd0tafrEscw+qPJ48NTTyD2Y0mrr4qiL6+h6i58Ujl2dX1uLsT8dhWO/ip6zF7dHsxxlwaOGkg7QLGyPFfiaQNue3iVNVYWTiiVrHhF4cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8fp1gfOA+2YBKEiqWeRSTQg4+XY/p8AK6BhfIMdXoc=;
 b=K/Q8evT2KdYlepRW3ZNC1TkKCKR4xhz0g/pRkct2uTYdUhxoFZiGGN7GLTlqvU686QA3DtN4DM4API6XjtkA01ABcjhITaeooKiQEL3lV1LbkAXM2RjCtu5Buw4mOFYeNYxa8uyjLyvZXVspE9hhi8DH1tooAQlvOPjMAhm7/xSepwyVW79iGXGqRVG3S1ggjs3VE+sRBn8uFYB5C5p4b3A1KzlXqe7wkXPFjmkYw/QdA2hoFS+f9KvojFMkgm4iYrHrvliP6YcUM2/BBMLZ+j28R07k+hXzAnW7tnCysAxnCcwfUJxuUq13bFN3tBF8tv/n4pzZPMB8LF383hl8GA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8fp1gfOA+2YBKEiqWeRSTQg4+XY/p8AK6BhfIMdXoc=;
 b=mK3OcB6isEvjSlYoCcnBrkEmegsgkFvAM/w4OYL7ImYiPzl4Z+LocN5/dqPalqsT+4SraLByuor8lGyvUMofiSgRhH0Bvg30CCji4oIu+HiMK+yQAca5erGuNiu3a9LZI1qldxA0vX/uWRhLaJfb3Xga5XhtBkRM157WJ2q0H0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXYMGjmRd2r+7uAj1ZGl/o0tsKCrj1lyC9Kp3SiJYPUxr1OdyqQS6ex2srHBgHrtlGi0NMFGMX0EnTh+nLEqPBGjm3xZDvqSOnctnwKsCEMoqm3I+AzcK/jCqqGE0LRtz+fOHV8CSViPsVpGEBBZS4uO1H9zdQi2te4ZPqth5nrj6NeziYSw/Ln7/IjyycccP0o3PIcqA4MRcz184SUg7ggu+1QsMoGrzrAjj5q2ILlzudE/XNRbJVA3KrIXvilRBryFjh92iUckJDtbc3K4ALG1FHT/uydDIeBoPGXTKROvBSeGmic4FUY+ZQrgTFJyuS9+zU+MbyXLc8WwHQgJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8fp1gfOA+2YBKEiqWeRSTQg4+XY/p8AK6BhfIMdXoc=;
 b=B4tCu9jsDodEr6z6AJPBEEz3x1kihNWgwsCddHbYzWdnjo6GJR55kcgnrUuR9SsNz1l75MjTtD8cS5Gwsxa5A8LNvOny1UX3pjPjNZjAdsQYc6CxZZDagw10BXixMBy87PUSiIpd4znq1spjZFs5JA7ViEEv9QbdxOOPzaXzclTFBxh9aoJBCxK2gSoiBNbQ/h7bXIGAlGSmhSmEG+VCQOfQpMliL1KexRGYd9iGSz1oXSnBvlOj3EuXG0eMrxxC/Ihy+6YP1aGYxqASBqsuHfKg6wwqrT5WQeH3bfAqktkG4zfeYPAfCIXLz99QjM4R/bZKi/BRAZ+PNfj9eMzH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8fp1gfOA+2YBKEiqWeRSTQg4+XY/p8AK6BhfIMdXoc=;
 b=mK3OcB6isEvjSlYoCcnBrkEmegsgkFvAM/w4OYL7ImYiPzl4Z+LocN5/dqPalqsT+4SraLByuor8lGyvUMofiSgRhH0Bvg30CCji4oIu+HiMK+yQAca5erGuNiu3a9LZI1qldxA0vX/uWRhLaJfb3Xga5XhtBkRM157WJ2q0H0A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] make ioremap_wc() x86 only (for the time being)
Thread-Topic: [PATCH v2 2/2] make ioremap_wc() x86 only (for the time being)
Thread-Index: AQHcx/ZoNwRbpuR1hESvXQYM/OEtSg==
Date: Thu, 9 Apr 2026 07:57:15 +0000
Message-ID: <664133F3-A65C-4005-A5B7-94F99CD693F4@arm.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <da4bf81d-7591-4f5d-8e0d-e6ed9ecb834e@suse.com>
In-Reply-To: <da4bf81d-7591-4f5d-8e0d-e6ed9ecb834e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AMBPR08MB11887:EE_|AMS1EPF0000003F:EE_|DB9PR08MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7acde3-87f8-4239-b3b5-08de960dc294
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 kT/YKXHoXE88GrVPFnn03nwE7QqE/UuORW06PGlNNwHz6RIbVKGPb7SsrfbIj505zWr+KvDSmXsYxIfUg/ylDqhLu84P5n4xmKbj8CcfmdKQVsHVE3dgGrh0pKbqfaUcoq4IsNM191adD7WpJiCiYrI2HCF/n/9/Q7pAZGaXU/Ti2gs6VldGQRW65gXcseL7MQnbVkVXLVG50U13sMob19edmPfnNokU/qMS+VulJnIiNDonNbj3qwPGV/OUUWN12t/OOez/ZTs36zlUZVmgwnMkAs+L3Mofj22pFlFkxxeCzw6+Jov3giu/whzTIQrnRu7cWM6shEtMrKiCtLc+SaETcTzgbTMD2ScVbVg5rPOXJQcr1PwxCdQkjaHPvcPVhVVuTlAAVtYCkdNMFSQWDuHMsUILwQ81Isr3siwS9sHip5YXLMsw9vfSrCc2wYuIkETwJ7U8Rk7HU1sFLbU7gGlY84hFH8wkLF2mZutQwU2OduOOxBQruKUxvdXLyXPYEZMdWSv4rUV9iUKLlY7gz6vUEKSuoMClP00+h3vxOFW3g/6psI6YiKKLy0IAK3kMFpmmfDmZ/bGew7lHT2rSaJrPPP1w4V49ZHwfe8W/SVGboY3OkuVpR/0YK8GEy9dYAP4xcFjTLkSxYaY1usk7CfVyl8qgCI/jcoN9rQiwXp+Gg/5sDtloGR5zRFX07GAiY1V4tmMnIYitHB03fuM5yd0Tg8mDH4KHFnAJh+cMgXH5e1mJaoiskav6zc3fBcZVxHGM94ctOh3i9l7fK/rQEVYWFhOOP7nlcgusHueEYq8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3F719F16CB83A4DA35374DECCF8DA70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 p3i9GztgGnw6k9xmqOSgc0OaaklbEi3T902Vcz2g0soMH3CxtXmBXwI0VaSeezij6ZrHhOLgVWuneSWfJU+Af1sk9//sK1H0Wrx1YAXvuZYP1W4KT7HkmHeO5zSGqLN/kRIlYyUfxOroUdkb7ljzW2TfBn+XXE4ald4G2998U7Ydt5pbmzStnooEjbv/gHrmx8U+UYVQhdA6zEt9O/iWuz7XT1kU9mVW56QICeihGyiZbkZRoxxPhN1+V3KtrWrPOK6X8X2b4yarSUdcNM/+UD3mWGDF6d/ZBexgFH5aLR02teJRVglfBuuWZvIn0IqhJm6k/I7royEkEDakWwpiGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11887
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	287532db-ce4c-414e-ee7c-08de960d9d84
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|14060799003|1800799024|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ODJlhN3pN/wX64MMKmbVCscc1QdxJcswMEW5uhZ0AI0cW/55W/ZPZ9R8Ql4DqMb+ayEl5ylZcNBcUd7j8HC2VCukt/jst1hw4R75VcDRX0+lsuYJIixTykp1AMtPLl7kKbviU8AyRr4NHInlpbDRJhXik3U56TmnGNK/Z0KMdjlvlJGLwoC91cQr8PSyeV5D+3Awwbf27oIu1JBnlSffqqAbtI0eor72chVvuVoHRZ4pJ4QjTdymiEse/4p3SvZWhDg639nJmwa9dalJ/AYa9HEpmp49HF+b44pTxgN3BNu4OUG4S+k4FcORkLUuRSZbkOsZNZW8784CupMXEZLtHxI8GMVuanECrxLm2bJ5gCjWWQQ4e2IaEtZt8EPWmImnkCKB/BxZSKVy6iXefacJIZyluVstUtcYXZDGbZZbDUClkrGcCCq/FGLIhf79O7ZzgY/ZD50LUxoHfpXJm3GOx93qMmjDbJGvOzI/+hVenWvDem5EG/8vZV8BxZ0VzOhKdWT7Iqw4j+U7lbefLyWcPi7k4LF1y/85Z/P5a8E8LnCV98+DKKsDJcTooZdo2fDnaPu5wy8gFmAGgeKvC+J2onV9wSoU/4++6fbdounkKmb88JMvGmmEvbfwQ0Y7QGLabQ+yby/Y06TNOp0wZbJT8kKTqIxUYENXPpTGC/fuDZTk4UyUeVnPGjJzXW6cnVJu6JTwypJinIknn8PQvS9JBoIZ7Rq7i74/F97DGHm5Hy59r9ujSSs/562WNhRVRez+2ZnDn8MNKG1CqE4cTMT3uQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(14060799003)(1800799024)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6I4POG6TjNobee2+mLlFfg/umvpsvgP6fwMLIlQhdgBS5WjUzy4o1oWJLMKN0j1Eb6mcPczfZP99m9yaKLWGC+QflEwkl9qEUAVewkDxnVUWCvK0IZyAxlqFM0fd1y0A4AUcAn5TuiCEa2r5OktuhXXqibXxGGN25pw6Vvi2HAeKGWqRjyUghJikA3exORWctAm2ssVtKU/JwGDLRgqS+64/4A0wcLHz+7ZF9Pt8UVgaOOPGe1/W9oOpVBhszcA6l8uZ9giwfvfQP0AHFTf27dcTqtznwLpzJWrd0uXWwP58G2bWZ4mwhrKeEVY20kvvb6LEGz8FDk2h1Rhm7aCtEYU74CsYfr2/igh14RaV0eD8uU7asytpd53SQlinQx9tZnLU8VNHXrwxqt9JQRhBatJ+ymq4cY4ih+CNxr14ddSQMPI1hmKTWvSEsh9/OLiL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 07:58:17.5521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7acde3-87f8-4239-b3b5-08de960dc294
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7770
X-purgate-ID: tlsNG-16d1c6/1775721502-5FD3C3D8-96A8565A/0/0
X-purgate-type: clean
X-purgate-size: 510
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:Bertrand.Marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: BCB9C3C75CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuLA0KDQpSZXZpZXdlZCB0aGUgYXJtIGFuZCBjb21tb24gcGFydCwgdGVzdGVkIG9uIGFy
bTY0IG1tdSwgYXJtMzIgbW11LCBhcm02NCBtcHU6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNl
bGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+ICMgYXJtLCBjb21tb24NClRlc3RlZC1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPiAjIGFybSwgY29tbW9uDQoNClAuUy4g
SeKAmW0gZmlnaHRpbmcgYWdhaW5zdCB0aGUgc3BhbSBmaWx0ZXIgdG8gc2VuZCB0aGlzLCBoZW5j
ZSBJ4oCZdmUgZGVsZXRlZCB0aGUgd2hvbGUgY29kZSBwYXRjaCwNCmxldOKAmXMgc2VlIGlmIGl0
IHdvcmtzLi4uDQoNCkNoZWVycywNCkx1Y2ENCg0K

