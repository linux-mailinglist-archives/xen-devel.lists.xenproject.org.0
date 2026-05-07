Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDZFHNxb/GndOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 11:31:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0D4E5EED
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 11:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302469.1576406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKv4O-0006jr-Hj; Thu, 07 May 2026 09:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302469.1576406; Thu, 07 May 2026 09:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKv4O-0006i6-EE; Thu, 07 May 2026 09:31:00 +0000
Received: by outflank-mailman (input) for mailman id 1302469;
 Thu, 07 May 2026 09:30:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKv4M-0006hq-Pa
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:30:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKv4M-001Sp6-62
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 11:30:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fc5bce-bab6-0a2a0a5309dd-0a2a4505ea9a-14
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:30:57 +0200
Received: from [52.101.65.9]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fc5bd0-aaa8-0a2a45050019-34654109ffdb-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:30:56 +0200
Received: from AS4P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::14)
 by PAVPR08MB9139.eurprd08.prod.outlook.com (2603:10a6:102:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:30:50 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::cb) by AS4P251CA0022.outlook.office365.com
 (2603:10a6:20b:5d3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 09:30:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 09:30:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:29:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 09:29:47 +0000
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
 b=cLzvIIkuuWiUklH9AllXlH4tl19X84nOHBHHMOcXh6GbFs2a60hf0CN6m3Z9XzKC2BCMvyFJsdH0KXbhr9lzw/Eb0HqKn5cJP2VTUb2J9OR7XwqbJrUMhfDHPkF6X/scSYjA8FfUk9UwipSoFn0Oq1F8J6Yqi3YcBstNoajtllcKwdwuNXB4xw1IFnxbpKMlU9qOUJHk4LXdiG9Zo9OvoZsfSQ2gFWoehnb9T5Y2Ba22/xUCGlTWDKHTtecm0VZR3on+UoQUD/x5LWMj7kmM4yoJFhGWJa93D8J6QEFSMPzIkJpfZ9EMuwkEkTqn3XmDRoOxg+Gr8ERNNBQIItuz+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+A8zX1om3juMx3/wt1f11s4ICIvjH6BqaxW8YRnGmU=;
 b=lXzdMovXOR3Rx7pIpsMPrrfxaYl/exc+AKuNonOAizPEz8ht9O10wyGD5+DGfKz15bCaI84296O0uiQ72oef2w4UuuEMLkvstqGsvDsiie8tgOTUZU+GXfZZqy52OUD9tmcozeZn5Xv2iuANgI+yY6gkzA5rpIq9zG3oc3wc+y5mctsmc4eh2a2y+EB8BYP6yOvaMT6g5A/K0swGyP9wyOgmGUnLZxp+9PncJX2/alOpBFYYhTlODB3A6Z7eCAMJGRrUuLqRwCe4sGN/OQSgfdQt82zQQv6YHLKnVBg6HVQcPWlD/9F5tj7x+IFo8RyERxJR4Im7Meui5jCtBFuM9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+A8zX1om3juMx3/wt1f11s4ICIvjH6BqaxW8YRnGmU=;
 b=qCgXQs52Xzg997MvRVO04hRtm/zGYYOxviMjZihktx6tPzm86i5N8s6df0xGjyPlzBAEhfkEUQ+TZN+ezINbv2tUZDnrRUxe7V2bjje2UogfLnsOoJrY0MtKIHRe0owZJY2utvL2I01QwMlANHp+cxTjFcXllxU+rGsneFOc/e8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUYvEMU4FwOZ4/aCvha7c9IKCpEJMrjPHCVf7V4C5+cdpp6sD0D/ecb3qtVL2zhm3R0pJi2yyDL7GXtJud4OsldBWF02Qyql3JMo5vS1I7O6h28ONXVn5aqzDSXKjxDdQ5j0Khm62hDuXC2GU4zCtspXGCmie48CI292Dg+It9W7UXB+1mQcTV3yR3H/2ZtuIKsuWhYBZ3lB0qVSkMW7tes4nK79XJmKCVrgbHuhqe2xj4FWjAGan2/fCPv5EQuxkUU/CJg7KBfLJtcdhm0RJXm2wv6RJU44+Art4JnE9VqRcj8k25WDibDzfx4qWucTuqmTafJbMs/mCd2RJFgttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+A8zX1om3juMx3/wt1f11s4ICIvjH6BqaxW8YRnGmU=;
 b=Koor/4YGtrXMc4n9ulkJGRzOSOtTgK6D30s1te15uz8JmmjUZU0ghDIP1zPlWqzN4qDbZhTIz0/VBjMiwda+CWWQpYgKKc123G9Me+2bOWZmKIQLiDku8Dkq/TUzJh4mvCbbPD/vMhsn1wmBn3qvnL5x3lmrn1egr5lK1lvGUQGT0tausvlwOM5wV3RSPII1NS/AHkXP/Pig9tKp0qspnwjuT6m6Z0hbUH9JdQE/ZZN4skBy/BaV7gILMyGsNwGDSmhTWMk+EJgN09e0l9CAiE9oXRv9JnxlflCDVpWWGnL+tkmUlvjjc0xlR1O85kH/MzDH6BpszDL4DVvTIKT/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+A8zX1om3juMx3/wt1f11s4ICIvjH6BqaxW8YRnGmU=;
 b=qCgXQs52Xzg997MvRVO04hRtm/zGYYOxviMjZihktx6tPzm86i5N8s6df0xGjyPlzBAEhfkEUQ+TZN+ezINbv2tUZDnrRUxe7V2bjje2UogfLnsOoJrY0MtKIHRe0owZJY2utvL2I01QwMlANHp+cxTjFcXllxU+rGsneFOc/e8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 02/11] xen/dom0less: rename kernel_zimage_probe() to
 kernel_image_probe()
Thread-Topic: [PATCH v5 02/11] xen/dom0less: rename kernel_zimage_probe() to
 kernel_image_probe()
Thread-Index: AQHc3f/H1VfJSuHKN06L0Yl3rhRDM7YCS/OA
Date: Thu, 7 May 2026 09:29:47 +0000
Message-ID: <4B9F0BDB-DD0B-4993-B680-D4A78E93585D@arm.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <ceddcb0daabf3e58b1811e3499265dc6588ea4b4.1778140240.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <ceddcb0daabf3e58b1811e3499265dc6588ea4b4.1778140240.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAXPR08MB6365:EE_|AMS0EPF000001A6:EE_|PAVPR08MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa2dd44-c764-4715-119f-08deac1b53b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 lksX0LwWvxhJisqZfQRs3KhW/Td8y9QOIDxyUWa5vSJe1NcvWdTp70j2rOplXYalPo9pP6Iakrkt6Gty5oN5sHtIcKqbhIZk6DTnU9QHnDbsghygk/RTdsUMVWdTaD/q8iwSb3NLvB/b5oQKe/sfg5pRgZpjOQwJ87Mlv9/R9zjC/PdyJZrLVZAt81TXxUdjdVuxPuTA/Y7sqF9dRyRX0dt4gzAa2XnQmiTGkeqSybvx/iX3bGrj1XDbB4KQ0PMCICHkycwtvo31xIjBpt2IeogD4h90aaPJ8/LBmU/yreF1aM/inqI+j0sUSb/JfS5OABQWyNnR/ZqOCThuW4RGP8UdvNXRoVVOUrRRMWVLz6ILtrfZr/d3HxmgcRhTnQRfqp7jZj6mofY8Hb+/bctt98urR5je7aUGeDoZSlbxR+yEWUTNzgT11yftwVw18OrQmtp5S3tpIPo9VoYoj9w55MkymZayHQoH0Gib0MgTFKrvHWSQsLMUN9kfPcESibTLwEF3qf+PW/y/1q8KmEovrPhoF2SwFuMbYSdwrHuY8TLetvkLzOuKFnwCw/mAmFufUm4MIkzuQxqlo9/2T27R7gyQdJYm/ZLTVOOVGufJHzVDhw85o0JZEoT0rwg2V/I/iAoKT5DhBUr5KDabtWYaYuwHCJTveUFhCVnCRMHIKL6DfSR+JE+HB8iIjfk9yusciTfH52FhMmFqfx7xYU+PZz84J/4Wpv/r2u631n5Bz00ILnQRhJ+W1UIxLBHoltXL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9D0813CD2B1CA34E982874EA81397C07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 hww90ElwT1RtZ5XgN5NtL6run0gmTmFYP2diwxLBzWIjmQWK5sOknYpqGlTCck+9JdJ+YAbvUH762UIbQ0Cg7FgGQ8/43O+DyPX5FwUClLgIdaV6IDGvLyg3vNhDYJYt1zl/jl2E2gIjpQQDpqu+0/B1L1udRMM+Ou8l6CnuZbMsCkONdsCX4PRYCzBHzlZiJbKanm2uraq4idH4hhHICu21mRfXiF+QiSWS85dXSOk7+7BkXURdrlUSSD7baZbtlHz4W6LFpQ33HFtF9EuZyK8rs5JGgG+Sr1qWbgLAyOSdN4rj9HheOM5sIydBnZZqePsO5kSJjNHTi6TPuX+wgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	917fc654-61ec-4aa3-6256-08deac1b2e50
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|7416014|35042699022|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NZsgb6MiOU60Ym8giqKiFbbrAui+zwXcmucYWp/DM4Fcg5/kvpHhahcrNYev6bveFLEZOEl84eJ3D1gqc6xHWVipObUGQIE4eiCwcRXs3DpMZznq/j8ylaqN+zASO5ZmnESPjshAS/bBaPPYyKnOoVa2VBOaTnQ6blBLJvDONV2/HD9pyECEDdDkfVYNfQ9/ed4ZVAmKtnBIfXSgcNlfUxQx+TtvUjgxafuh/Jcl3O1MGEKkXxlXZICs8wNIxv2Y9BYPI0HL4xDgxr0V2DYmoP46e4ovxsr82jM1WDa4drtlPp5BoDBN5HtKbWY/YsvUPJrEFHBjZlPS9RaHa16M2IaWHg0TzLMGXQVjeZQMxCf11g8Xkekn+9/f8gxUHQXH9Mvjgp/Hzflt99YqXv6HFC4Q16FGmWTIYRkksDHXtj8WRNdMyxfxJ3w3QeHKXX/yIktYHF42OeOyjpyLl4j5Um+Lv08hvDlyn1GAFydYdnUL4idgrm4madept0r/bOGi2dCnvSkLTy6GZc5+XT7JNxprP7MQKedaRF7QAvgNw9zaJtIFbOVCxUf95piU5wKmMbow2eLL/JFtQ0esKwDLSiYN57Dz4uu+H8lFvuRrWYcVt5GyhP17abPgVEMnt3MfYpGJ/XxLwvOqtUZ6y0cOvgh6DfUyxZO8tNKABDkDTyEIPwPyPf4w5zq8FsSO5u24EVqBcsX6AWDKAKTscZb4M7OOovO9faMCg3v6sW09J3g=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(7416014)(35042699022)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SVQ19P00x7ApmOUx3duq+6LZjq0uCzGOFJw3Uee2s2UjXbdEaXdAEsHUlSSA6/MgSOAVy7XE8nM7GoCs1ncRV9ENoP9mBfawWm3hTQccAbgWCEynXPfXBvoxg1eY+ZTg/bDNQgDix0kqKTyzW4df+57MuHuCpzZgwifYJEA9yGnrMOyHr3Bd0cwMBJagQlz+7EDOe8Z9WBCaDlkdVecWQk+OZnVJMd+JvNmOgPlnuAIflj9/PVe4pLr9nJnylSdtyhOz3t/nsBUYeLOEoq/WpGNWBhRPBP2g87bL4QKNgmNWb54A7SLiFOw+rvPizgunaQMSfKRNtUKLC8ALdyIs7nE4jX/htfS7SCDGzNJTzYyl473CsaUBhQN55TicnBhlruU9dRxsXhNfvGnSJgdu21OuQd2cGq5GnFu/PFrTenL2g6S5KCIcX2u1yn3OB0ue
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:30:50.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa2dd44-c764-4715-119f-08deac1b53b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9139
X-purgate-ID: tlsNG-c201ff/1778146256-E1798443-9FC17548/10/73395122804
X-purgate-type: spam
X-purgate-size: 1087
X-Rspamd-Queue-Id: 29C0D4E5EED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Oleksii,

> On 7 May 2026, at 09:58, Oleksii Kurochko <oleksii.kurochko@gmail.com> wr=
ote:
>=20
> The helper kernel_zimage_probe() is referenced from common code
> (xen/common/device-tree/kernel.c), but its name is tied to the zImage
> format which is specific to Arm (from architectures supported by Xen).
>=20
> Other architectures supported by Xen, such as RISC-V, do not use the
> zImage format and instead rely on other kernel image types (e.g. Image
> or compressed Image variants: Image.gz, etc). Using "zimage" in the
> name is therefore misleading in architecture-independent code.
>=20
> Rename kernel_zimage_probe() to kernel_image_probe() and update the
> associated structure field from "zimage" to "image" to reflect that the
> code handles generic kernel images rather than the zImage format
> specifically.
>=20
> No functional change intended.
>=20
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---


Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



