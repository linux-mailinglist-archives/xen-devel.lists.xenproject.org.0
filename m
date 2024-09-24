Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9D798407B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802458.1212693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0t5-0000BP-Jt; Tue, 24 Sep 2024 08:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802458.1212693; Tue, 24 Sep 2024 08:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0t5-00008p-Gy; Tue, 24 Sep 2024 08:27:11 +0000
Received: by outflank-mailman (input) for mailman id 802458;
 Tue, 24 Sep 2024 08:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Gt=QW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1st0t3-00008j-Mi
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:27:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2613::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8eec85e-7a4e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:27:07 +0200 (CEST)
Received: from DBBPR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:c0::13)
 by DB9PR08MB7583.eurprd08.prod.outlook.com (2603:10a6:10:307::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 08:26:51 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:c0:cafe::d6) by DBBPR09CA0001.outlook.office365.com
 (2603:10a6:10:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 08:26:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 24 Sep 2024 08:26:50 +0000
Received: ("Tessian outbound ff7cc14e3a8a:v465");
 Tue, 24 Sep 2024 08:26:50 +0000
Received: from Lfdc8015f2d2d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1D59F81-BA6C-4808-8077-EC9F5625D120.1; 
 Tue, 24 Sep 2024 08:26:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lfdc8015f2d2d.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2024 08:26:44 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB10296.eurprd08.prod.outlook.com (2603:10a6:20b:648::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Tue, 24 Sep
 2024 08:26:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 08:26:36 +0000
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
X-Inumbo-ID: c8eec85e-7a4e-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JWyT73TgdA3ysDOwXeYSA1Dc5vMgW9FXZy+XJoS+9P9wRDGeA0MwxrTUlTPgA9vI7uCKBJeT3SI/SRWnKDwjvUw7ROvQhdmu0AwTaB5klohQp1LSH87p1mKoAT70Aq81wClPTJsfsxurRR8WYkcmQJyoKA3HICR02q0fd8rAsW5pQm5f7Jk+eTS9joPOY4DCCb03+rOfkXFGbIlXI+Ali1NALHab7q4JcgZkfoZcu1hOa6O+1SW5DqwyLUF26QSFvJIRMn65QvqHHbnaFl6yoa+5o8TzMuUVNQiz/F2vJ2M3Bo59C9cTI+45yKGYl3oDtTkip3hhqKZEmeK2JzOLXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WALSn8EshjMyNCAnuDZphwE72NLda7kXeHIAbGuXqw0=;
 b=i+KLAw5Sqj0Mw3ws3pnfnM2G2Sx8lpQstBlw4CE50ZE/3tCmTr0nqOJfL9eZq0r47Z41BKLCXL267RJiJM6Aqmatx3TNw/ycdWrsoqfsSE89ByJ8PuaA1QYOnI/9PKjhuCnDHNpcCzm2LWwqZxvZC7aih1tgmOXNtFIk6XRgoQ2zHKfKdU7pkn3LaBEKyTa/6du/U8ZX5KFfwDfV3Lr/n6c8xI/NYpkoGS0UmaLTy+azIr7ba75fUR9rwShqWSZQDAIjb8GK3CApUIFINucm0VWR4YekhWjYuiTu9pgs128JiZJ/b1yUFDWK7ScX00z73x0KReLGOqy9G6XO9WzyBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WALSn8EshjMyNCAnuDZphwE72NLda7kXeHIAbGuXqw0=;
 b=kTZXerywc4ulXGXOI4+8RH5glkgcOYDGBdWBYwj4ptPSR9f2ApbuOy1fKffeLmOHPhBUc4A3gLuRxsEZ67hw8XNqHIze5t1EXjvU+9x3E0AVzzX0A0rJF5F8G05xZtvO+N8g8ixbonMOYCAJDUb5IzGsYz0lq+jMKDTYA83E72U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09168af80780cbf3
X-TessianGatewayMetadata: zGn5/2aWfz+85XpJGIjc6aWuTQ9ysVTI7uqbt1QYzf7HizZnI58cqMbyKqFpnEumfl3zyUrbEdYCy9anKgrTxiJLirVbwY3kaUJLOX6SJsJKi0zDdZFEjEcwXuMC9DSBmH12OPA0d82kpeGJdvH5jG0kBW3NU5+q7s4m/75CA44=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYW1MvKOZgZQMyHmf8SWu0qsuyeYgkdQLcmEkgOqs2crK7SHj10+9Zq/f4f9XDWHivZqdF0PlejsXfkzRrlQFvOyKBO6uIX+twZcsJiCtWp2qyny53AAqoCTZIxu3QEmdMZLupXF+kPeLZEYEX+RuAr3V2X6tNIC65MVUNel0RZjHlv5ex980cjA/jqMYC2d/QCHG5jm9L40SBxqT3DX9SmuebY3UWxLnAf1i1Y+sqs1lvg+fT4v86+WTJf2ouFy8YnNuT0SVx+2Gc/HhbWC2Dm1JuzKg6AFyX3qprDVYjmPQUVKHq8njYYu8NSuw3Lr9gsxn7DM5ZBRt+3jWe2WBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WALSn8EshjMyNCAnuDZphwE72NLda7kXeHIAbGuXqw0=;
 b=MV2hLdIvImrsGQHMdF+EtM5TA9lNMhyTG7tpABnSE9zan4A331nGdMdEdwyUopR2EEi4VzB0D6mR6rGzhEAIq12F1AZEWgjdgYpMsW9I7fkGOvAfWQAjg73oetxjur/YDQ/DEaNBP8Lk6DBuTod7wQ8jvDAgnDMCf+rSqNb+MRxv8d51DQUT7EJU4HMsS1NetR3KkzsB3bHQyk46uqJ0yN9Sc9XvR2ZWxF+E+or4DvJz1Fng2kryERGDhMZSqlYX5WWKNeQZZyRfWsfslFZBj/tbvfvny4GVv/1EY3xnfKcCWuS8rRr5awjuymJOMSx3HC53GRvWsiL0vxWgBEoj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WALSn8EshjMyNCAnuDZphwE72NLda7kXeHIAbGuXqw0=;
 b=kTZXerywc4ulXGXOI4+8RH5glkgcOYDGBdWBYwj4ptPSR9f2ApbuOy1fKffeLmOHPhBUc4A3gLuRxsEZ67hw8XNqHIze5t1EXjvU+9x3E0AVzzX0A0rJF5F8G05xZtvO+N8g8ixbonMOYCAJDUb5IzGsYz0lq+jMKDTYA83E72U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 01/10] xen/arm: ffa: Rework firmware discovery
Thread-Topic: [PATCH 01/10] xen/arm: ffa: Rework firmware discovery
Thread-Index: AQHbCo5BamB/XsNnokyTz9637lD4+bJjhr0AgAMbCwA=
Date: Tue, 24 Sep 2024 08:26:36 +0000
Message-ID: <97667604-C3F0-42FE-80BD-4531B376C9B1@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <9931c299450a1e0a2384161eb9b514ead8895ecc.1726676338.git.bertrand.marquis@arm.com>
 <00461ab7-1cbd-4b72-9722-293a20ebbe81@xen.org>
In-Reply-To: <00461ab7-1cbd-4b72-9722-293a20ebbe81@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB10296:EE_|DB3PEPF00008860:EE_|DB9PR08MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d17ca97-965e-4f3a-1ce0-08dcdc72a3a7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?XBHiYLrSx2sM3EIiMUspw+vZXPFeexBiZ2bp/mCrtyaRVyHRQ65RvY9ems/y?=
 =?us-ascii?Q?NwFaMdYXX370ukIqAylNgCiQnAVhaJiQ2WJd+zCzcer/bgcF0GjEN1FDooPg?=
 =?us-ascii?Q?vk52DP4bW5tmKl92aOIUpL7h8ZtrmXOTmPisjI+jI8EcPh98quTUZiQG7aOf?=
 =?us-ascii?Q?wXYAnpcYCrKrfshLBxSG7c5tTECYkt+qfxDJnccBtQSEpX6TQawafMe4eATB?=
 =?us-ascii?Q?+Q41gciyzTRWfW+ZM2iEr5gMRNDUYwaAMOyLBVaPqjTKjBWuEMGMLYjxXZjB?=
 =?us-ascii?Q?bXXmv9GALknQWro3zcByVy0b/+inS+jtJD5zQYYAn+Oj+n5qJV0YZeUtw9zp?=
 =?us-ascii?Q?YjkIP7W15n3zip2ZfgdbDPlcwxuI7T3zchVVyxueuRFGJ8F0DR19dR5nUgU+?=
 =?us-ascii?Q?MShWycmoRKjqjYG7KZz1UkR5X7dM7ICUKUZM5SnYASNVZ5fTUk1GVDJLU/8e?=
 =?us-ascii?Q?ht+cm9hU5xUOpgxTz3Ab1E+V4ZLOtfL4ixObXcEIHKEWkJlpCcL92AME31W9?=
 =?us-ascii?Q?/0FdVDUc31l5uP97BgosFCHM7CdM4U0wwgmr9+bGGOIugOJ8d7HR2mVMXhaN?=
 =?us-ascii?Q?fzOWjdxLzUH5LBUrYACty52PgeZJwtniOswlgknJwxAnI6lzYzyPU+Pew/uB?=
 =?us-ascii?Q?wJuD5AVm9uevQXz9TWP6SlZbjYKFQaq6TthIj9qmdZ5Xkuk0nf2MUf98oIYP?=
 =?us-ascii?Q?9tXtXkHljBG2sf2gY9VdYl6J0lI0Pirz2Hy00tAMNpX1hgjOlAiqPnzPV7cz?=
 =?us-ascii?Q?fE0agIEvkxxJd6JcCx63UN6U3lOCUjW/bhPOkH+Ht6hcx5hgRECF4U9/kthu?=
 =?us-ascii?Q?qSfb0tXxksFvD8St86Gzfrr9LChJu+jO9N1BAe+SjxPVO5Gm/tQscJwV6LLE?=
 =?us-ascii?Q?YG8Ni6tupSkjg4bF0+vWyVmPyeDhLoL3WNsvjaqqb4PMQY5+qfQUxvv+oymc?=
 =?us-ascii?Q?D2lsRp5BuG7vRaHfNZCm/I3t2R/gDUFTZjD027L2PB2cjNFpsToUSs6r1gcO?=
 =?us-ascii?Q?BtoOfVazgDoM3Y/U6h+TO2Uu52oUmFL9iovKhXtDkX6SKAQPuCyeB339fSb8?=
 =?us-ascii?Q?DsL+frgcI6xi37ALHZu9HkO6VQXzW0TD4I7Y2qEcjs6SItXk4xPYGu3atgoo?=
 =?us-ascii?Q?mb+WoZZ1S7JWYznkaBEfrqNrMSptxJykKfSccbf/YZIbrB95Y0Ddr79hcn0e?=
 =?us-ascii?Q?TarXsrTTl1UFzC1CDVV6x4ny7wfFMscRq3OjSTgnulpgUK/svk9KldHzI5Ul?=
 =?us-ascii?Q?X0Wvr23OfmJYjKKkLeb2UEDMe4uAnRm4GRoijH0/mls3Aw92Xj/K7WXZHZ27?=
 =?us-ascii?Q?ibWsh846SCcZDHWzeqWBZNFTmu9NXFpG/Ag4nCcbEl/s2A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6DB94CC93592841B947CF7573FD709A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10296
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7c920ac-a4bb-4418-185d-08dcdc729aea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UA9U/VrZJDppgVMjo0SHFEDrpcKThdbM+RHcqV5KcICAFnoRYr+UAhAO7Irh?=
 =?us-ascii?Q?NKmcxk8g7CXAgtCFSXeKvmHaEFMB30NcLqv0enSbuHsL3u1PYt0YRa1otfg/?=
 =?us-ascii?Q?+3el+boSUxSj/IEI6uPjWKegOo+n9pRsfPIcdnM+8WM/JDXcgLjaauegKxNU?=
 =?us-ascii?Q?ewTdJEMeWmfnPpoacLKa8b6+wTk9qwG+G90+Nnpl6r5P3X4lC2SEWMh6XNfd?=
 =?us-ascii?Q?ySwM6uZtIO9kObIzpTU+WNiQhhk0tFlTKtYVQ7tS9OQeqAdxeDgZUs8B5dbB?=
 =?us-ascii?Q?ITenqhhSg5DUq+ivX+Om5VGckte8tQtSxz60//UpoYCdL/M8ZQ+v8MWwOTAb?=
 =?us-ascii?Q?/WaRme0TBlx7Az34C4VTZZL36vK9k/ed6rbXDl0uGKY7iWn3y0uIzSylbXjR?=
 =?us-ascii?Q?1ZW0TNBcUB9QRJNltA2J/5NPnRLi+DElu0FeoS0SX/6V8ck1UqpzsYGXTJiB?=
 =?us-ascii?Q?gR/3KRuc/3C+LzpP+ursAx3qzwvJnXvHCMu7OvVrmg+AeCCXV1j34NOm5diu?=
 =?us-ascii?Q?mQU5xcyPCjRlX8oRfDTRWNq8uGhKoK8zNC1E9PiQA901LKQsE3BSjscnTJYJ?=
 =?us-ascii?Q?rlzabSCsIvectWw3psO9nq8zvz4+saRwgVwqBZIfWonWvdvmTJHxB/ryOdrr?=
 =?us-ascii?Q?BhWlBE5ONafBBEqs9EubVHMTSLMX9FqSAhoh1znlCI21o3WodKp9U5yIvgq0?=
 =?us-ascii?Q?AWlj2mrw0vOWVmEqRVcjyRp0QJlrHoxz9oNchDe44rS0p2XqZnq8UPFNuzH3?=
 =?us-ascii?Q?HSNX1vJIeZ86EYc3p1z+yTyNFQifSK3Sxaf1SP3lT3o0st9YIjfZ4701jkfj?=
 =?us-ascii?Q?69sJR+2RzOnoFLcwQtRhMyHs5qejpBMLzSZtV1Hy3OJub0uDexGX7f9HpMtd?=
 =?us-ascii?Q?QFfZFZhrUKQXcyuuZ4pegEeN73W2YLgH3f2RwbmRprvLkCwBRTe/5f3PylRb?=
 =?us-ascii?Q?3NyJABqUYlKqUNsxfmQfzvZitNE5cxp64RVlG0b9Ad83w5G8EwTTGS31UIkp?=
 =?us-ascii?Q?m1yHjqv4IJSgM+KYq+5gkAA67ffxNLulsfinCr5WYS3m8XMljgZdUFBYmTA6?=
 =?us-ascii?Q?EXlpArQB4+KMVcgU2BX9vnQnDJRloIP+ltyEir4UhX7y/BtLqa3OkJs+W4NP?=
 =?us-ascii?Q?MkMH9RZ9N1DEJ0V3oZx7ts+y48EfjCEu2TH5YtdWyeQUPePqrgL6D6lph5Rg?=
 =?us-ascii?Q?wOUKfAStB6sgovhoDvdjTlq049gAFru1VW2/7ODOGu9e6lMNNO9QXdEPNHYW?=
 =?us-ascii?Q?l+3iITX/5dg/LhcHtpbx6RZ9AN5yTUP8qIx1fLIU7cQ/dh/1JAxjmb4VTZnO?=
 =?us-ascii?Q?D7wJSzZS9g/vOYdBxY2D26EZwFAL2TtHIgXpSvGXhKs1rFO6bo1N9jSixK+t?=
 =?us-ascii?Q?JBxbPTo3bcpxFuO3ANG0ZPwRvcuwlO7GCZhEJV/lNAorDhX8Jl2iwmipPWuP?=
 =?us-ascii?Q?zrEGqjGVuE4mHzCYu4nAXKk1Ri5Igoxw?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:26:50.9319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d17ca97-965e-4f3a-1ce0-08dcdc72a3a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7583

Hi Julien,

> On 22 Sep 2024, at 11:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 19/09/2024 14:19, Bertrand Marquis wrote:
>> Rework firmware discovery during probe:
>> - move prints into the probe
>> - rename ffa_version to ffa_fw_version as the variable identifies the
>>   version of the firmware and not the one we support
>> - add error prints when allocation fail during probe
>> No functional changes.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/tee/ffa.c | 52 +++++++++++++++++++++++++-----------------
>>  1 file changed, 31 insertions(+), 21 deletions(-)
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 022089278e1c..7c84aa6aa43d 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -71,8 +71,8 @@
>>    #include "ffa_private.h"
>>  -/* Negotiated FF-A version to use with the SPMC */
>> -static uint32_t __ro_after_init ffa_version;
>> +/* Negotiated FF-A version to use with the SPMC, 0 if not there or supp=
orted */
>> +static uint32_t __ro_after_init ffa_fw_version;
>>      /*
>> @@ -105,10 +105,7 @@ static bool ffa_get_version(uint32_t *vers)
>>        arm_smccc_1_2_smc(&arg, &resp);
>>      if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
>> -    {
>> -        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n"=
);
>>          return false;
>> -    }
>>        *vers =3D resp.a0;
>>  @@ -372,7 +369,7 @@ static int ffa_domain_init(struct domain *d)
>>      struct ffa_ctx *ctx;
>>      int ret;
>>  -    if ( !ffa_version )
>> +    if ( !ffa_fw_version )
>>          return -ENODEV;
>>       /*
>>        * We can't use that last possible domain ID or ffa_get_vm_id() wo=
uld
>> @@ -505,6 +502,9 @@ static bool ffa_probe(void)
>>       */
>>      BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>>  +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> > +>       /*
>>       * psci_init_smccc() updates this value with what's reported by EL-=
3
>>       * or secure world.
>> @@ -514,25 +514,21 @@ static bool ffa_probe(void)
>>          printk(XENLOG_ERR
>>                 "ffa: unsupported SMCCC version %#x (need at least %#x)\=
n",
>>                 smccc_ver, ARM_SMCCC_VERSION_1_2);
>> -        return false;
>> +        goto err_no_fw;
>>      }
>>        if ( !ffa_get_version(&vers) )
>> -        return false;
>> +    {
>> +        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n"=
);
>=20
> This error message relies on the implementation of ffa_get_version(). It =
made sense in the previous placement, but here, it seems a little bit odd. =
So if you want to move the error message, then I think it should be reworde=
d to be more generic.
>=20
> Maybe: "Cannot retrieve the FFA version".

Ack

>=20
>> +        goto err_no_fw;
>> +    }
>>        if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
>>      {
>>          printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers=
);
>> -        return false;
>> +        goto err_no_fw;
>>      }
>>  -    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJ=
OR_MASK;
>> -    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
>> -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>> -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>=20
> I kind of understand why we are moving the Medatior version early but...
>=20
>> -    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>> -           major_vers, minor_vers);
>=20
> ... I am not sure why we would move this print later. Wouldn't this be us=
eful to know if there is a missing feature?

True I will move it back up.

>> -
>>      /*
>>       * At the moment domains must support the same features used by Xen=
.
>>       * TODO: Rework the code to allow domain to use a subset of the
>> @@ -546,12 +542,24 @@ static bool ffa_probe(void)
>>           !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>>           !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>>           !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>> -        return false;
>> +    {
>> +        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n=
");
>> +        goto err_no_fw;
>> +    }
>>  -    if ( !ffa_rxtx_init() )
>> -        return false;
>> +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT)
>> +                 & FFA_VERSION_MAJOR_MASK;
>> +    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
>> +    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>> +           major_vers, minor_vers);
>> +
>> +    ffa_fw_version =3D vers;
>>  -    ffa_version =3D vers;
>> +    if ( !ffa_rxtx_init() )
>> +    {
>> +        printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
>> +        goto err_no_fw;
>> +    }
>>        if ( !ffa_partinfo_init() )
>>          goto err_rxtx_destroy;
>> @@ -564,7 +572,9 @@ static bool ffa_probe(void)
>>    err_rxtx_destroy:
>>      ffa_rxtx_destroy();
>> -    ffa_version =3D 0;
>> +err_no_fw:
>> +    ffa_fw_version =3D 0;
>> +    printk(XENLOG_INFO "ARM FF-A No firmware support\n");
>=20
> I am guessing if we are trying to probe FFA, then most likely the user ex=
pected to use it. So shouldn't this be a XENLOG_WARN?

Ack.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



