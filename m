Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4974A9BADC2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 09:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829857.1244761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7sBC-0000oS-CA; Mon, 04 Nov 2024 08:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829857.1244761; Mon, 04 Nov 2024 08:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7sBC-0000mA-9H; Mon, 04 Nov 2024 08:11:18 +0000
Received: by outflank-mailman (input) for mailman id 829857;
 Mon, 04 Nov 2024 08:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gxyb=R7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t7sBA-0000m4-CN
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 08:11:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2612::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59a7a3ef-9a84-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 09:11:10 +0100 (CET)
Received: from AS9PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:50e::27)
 by DU0PR08MB8400.eurprd08.prod.outlook.com (2603:10a6:10:404::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 08:11:05 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:50e:cafe::db) by AS9PR04CA0105.outlook.office365.com
 (2603:10a6:20b:50e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 08:11:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Mon, 4 Nov 2024 08:11:05 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Mon, 04 Nov 2024 08:11:04 +0000
Received: from Le6445e6b6737.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30B8B3FF-9F84-4AD8-873D-435BB06572C6.1; 
 Mon, 04 Nov 2024 08:06:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le6445e6b6737.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Nov 2024 08:06:40 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB9741.eurprd08.prod.outlook.com (2603:10a6:20b:617::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Mon, 4 Nov
 2024 08:06:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 08:06:37 +0000
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
X-Inumbo-ID: 59a7a3ef-9a84-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjBiIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU5YTdhM2VmLTlhODQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzA3ODcwLjU0NzMxLCJzZW5kZXIiOiJiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fT+foLyNSMVazAT9umpyet3ws9pUqMCLYpJyHDqPgQ/CwZzFX2SVL9YCSb7y+N8J/eliZ7Y8FvA2MRRVuJfAnYXXwhmzisjUvHlflSt7zKrxO/FV8+5M3+TXDxWxzzTllc9dRIqrpeTkj/XELm8v7IDndXrOXCkMpFwtmjmJId0ORWZxQspTXvdpNfxTKbQ6mEiiyAa5FF0NU4GlvSEeWhAxxDEmMJ8aqdCQNIMUMobWSQEdu6dSNxU/QDrUxNcf5+lW1RwwsB3ACrBtwR7/U+IBmGZUEYnV2cmhls4JSujGM2QoR4Rw0mJpEf5UZd+TKGU+qRZnb/aQ6uOgNuZuCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z1hpBIDy2slJcSESPQiMzH7oHSvsq0gGPgg4e9XOm0=;
 b=jgds4KQMl3pGv9C39RoMRXDb08eOSJelWxcLMPd5tOrp2Vp4tQkf79FpqsMu3RF5MqSYPCf+zplLh776vAO/vM+3CMkIyxKOZ6T60zxngU/Rlre0k7m0karUKeClF36N9lcxmYfQ1q6guC8UmcS3+zC7TA3l3FRrAsLuDx/wV5XM/QOr4l2ut+DuSS3S89FyzGc1c7a3e57TOepjP72wm00EBFpBAQ17daVv5dw37hF8LWH3W9lpCM9GU9xnp8w1qDIE65UPOha7fj7PMmlUasK8OfOeq387MaJpMNo7dH/xRicO6lcrCo7Jx3hQLdkSdSzGhK4e6/sJxU1uugQ2Kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z1hpBIDy2slJcSESPQiMzH7oHSvsq0gGPgg4e9XOm0=;
 b=A5YbJrYMYawVA2Q5hFROjbwgxbJVrNlbOKXoInh/DjY5SwWOQk4a+yRJJ9Bh+NqZgOxEJBq6/aVqjv46LwZ3ojmF6rTVHV/mXzsQdGTT8HoHOF7FDMuTOjYSpjMFrcqdwJF+9979ILHoteKG9Tu2UWGqyQrYpkKjycxhjl2VMSw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54ee78ab3aa381ed
X-TessianGatewayMetadata: g9zYzbc9HJGRmEYY0R6JS7QPb613S32CH0KybfJyX9h0HZsNyYPM3iPu3V4viwqBSTdGYV2rfaSMMrAzKDqtzrVV91DooKCwk9D11MqfRTTcAsB3x82kAiGnv3XO6XJzcv3bS7D38E+kpOgj9z2YrItxbAS/ZT/qehjZqpK5pGA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBoFWe01DC2OfNu3/pwxeP4Nf9G6ts0Y+KtpJ2WR76qBf/y9HDvE3CRdt1WIR11ECZnFMaTAiKEXBWtCf6yPos7h6VVk+YakQ6PUVPgTzUmg9vTruyS+XmCX6xPApuGGfBX1Gi1gJXIWHK1RrQVxx+dyoNxsHExNApI822eY/wMp6NGT+cwkYDekVAnlSWMIdNCz7WRzPxKcg4dGOamcH8z1pb3wkgfWimLgCCeDP/ROdsogUPLM/peOMAk6ywWPOTJnGQRoVXzfLtF2JMpDLOoQaQOO+XTkcdfcf3CBlw8KLvcZTPjjLhWb0DpyBlFWzN88KHnfyPwmf5O9BfCe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z1hpBIDy2slJcSESPQiMzH7oHSvsq0gGPgg4e9XOm0=;
 b=VT5TZv2kOizUE19lLskVxNZaqPyzpDxWCZnzpsx9h526uUjPodk/COh/ARKjjLHQ8rm4QTTHGqNni7FMJ0P9Kj08TTkI4AKHPooxplQgkXA0L2k1jyS05vxTYlGVUu/xxmzxrHs9Lmfxq2tcEgK750LC4hS+vY/X7wW9gT2bbNCiVbvlvIDfQUOWhayG7ww9tw6x8abLiuFaWmEoJQAkWTEYAxXwGHiZvh/JU8cmvQUhy8wOjcDvi7bHw2oNVDdUMXaFw3QQoyKEyL9c+NbUokD7r3nB+DVwfX+7OVRFrL4x/bdQ8t3nbwbZcxgHVZLPfCHqiRNto0nWaNMwRQB8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z1hpBIDy2slJcSESPQiMzH7oHSvsq0gGPgg4e9XOm0=;
 b=A5YbJrYMYawVA2Q5hFROjbwgxbJVrNlbOKXoInh/DjY5SwWOQk4a+yRJJ9Bh+NqZgOxEJBq6/aVqjv46LwZ3ojmF6rTVHV/mXzsQdGTT8HoHOF7FDMuTOjYSpjMFrcqdwJF+9979ILHoteKG9Tu2UWGqyQrYpkKjycxhjl2VMSw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [RFC PATCH 1/4] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [RFC PATCH 1/4] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbH6z3/b07Z+H2iEKVEGebQub3/bKiXKqAgAR3wYCAAAejgIAABXwA
Date: Mon, 4 Nov 2024 08:06:37 +0000
Message-ID: <8A562771-39B3-49CB-85FF-F3A047BACA4F@arm.com>
References: <cover.1729069025.git.bertrand.marquis@arm.com>
 <0475e48ace0acd862224e7ff628d11db94392871.1729069025.git.bertrand.marquis@arm.com>
 <93715b7e-d968-4526-96c5-497a7a1f9dfa@citrix.com>
 <765C7E37-0ECB-4BFC-B98C-57FCE303828B@arm.com>
 <8d5b6935-183f-460d-8107-4ed3119c4d8c@suse.com>
In-Reply-To: <8d5b6935-183f-460d-8107-4ed3119c4d8c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB9741:EE_|AMS0EPF0000019D:EE_|DU0PR08MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfd9f31-2c24-4b1d-4ba1-08dcfca83ad9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7vQR0C1L8SIiPQalpS6hoPu8xEShlwyUB7PwXQ0m6W7Gf7a0b1LaQb2Ih0Ui?=
 =?us-ascii?Q?ZEBs5j8tq3qBqTGATr+7pliiUg0Uxe1eekVDGlBXE5k9sCGMFgMYBLs4LwfA?=
 =?us-ascii?Q?wEQQ9JHcN4t0xgmSgMskxnttrBGziDid0UY5JAVkCRK2uF/WcIpZbsHwTOq3?=
 =?us-ascii?Q?IuBHSsZegyXrC9c8slI5eInzULrJhvyCmDp5Jel1ipDS+v/4LqPldWYba6MY?=
 =?us-ascii?Q?jN+5GHOUP5nCnvuOPHCeW/NqloYiXsLDDE7gRNg7ae1uNTD98OytQvPa8vVA?=
 =?us-ascii?Q?XxtVaIlqpxam8X3UdasAodRNqCVyyaF/jh/vXa/WzIHrOaeQH1CP1eJYNT3X?=
 =?us-ascii?Q?2AMHtCjlzZPMbeF5inXA2+ltTfVZGyQXlsC6n2ZdLEfUDSZSL+XXxLErnMNh?=
 =?us-ascii?Q?qEFiKKxOaPr+Kahqlg+1AIcp+Mg/jqLflplBW1cL+Jvxg8kuFZnRbgilQYnR?=
 =?us-ascii?Q?vd+v1AMotfz5ys7NYJ8hzsdow6VtEnaRJHRvun7Jm/pxO79aLjDtyL03Xis2?=
 =?us-ascii?Q?VNaQXiBmkf6gWuaHEEunphcD4AkT1iSbfE1GcBRnnVWmZOY8T2rhf3fr9aTh?=
 =?us-ascii?Q?Yl3JUs5hlsmCY8d+/yiPJRmemq6fb88BykZSnKtVenEQd9UOJbOBa/ogz3Bh?=
 =?us-ascii?Q?fbzDUA1bbYYPDcSo5HmhVQQCAj/gg3cD7rFst05AoaPUWpPyHCVXygxevBBs?=
 =?us-ascii?Q?Hq52wXjTf4eodo69xw0yTTCQ5dzPUzh51sC1q3k9m7v/CNUEubN9vnF0whJP?=
 =?us-ascii?Q?GWxCQMrfXpHgSGbeblbheUpzepjxvzEC9GKXFOFccIsooo5BqzgzLmqj4zg7?=
 =?us-ascii?Q?mdPk++1eBYuTSdVljT7ZNnY9Q956MWrMPsqp3o1zXpeXJtGLBjK76YXdjX6p?=
 =?us-ascii?Q?CqS+roDKJwBG1rs/wzwScHNt2PeEB2lqG1KJ7FXvmNvkINhwBfYzUzz4o+Hz?=
 =?us-ascii?Q?jbgHf/Y88TEQMg0DQuSyvFL48ipHGPgB//eOpiayedAzNn3oqdO8p3eZQtHm?=
 =?us-ascii?Q?sZpjoXCQXsKegoS2yJ3bqbH6RV9ow+RJ/RIJQgmHKg12vSNGdcYp2j+QrIUv?=
 =?us-ascii?Q?XP09BQt/l65oxPVaulJvZyNAWUs5hvueSMp/3DL8kRuPs+5deHd+FXEKZFd1?=
 =?us-ascii?Q?QlRJvDpRD1+vTmghwL/4OZGg/Tdw6aXfZQH9Rybexnfa9HFgjyh8RIWXOF22?=
 =?us-ascii?Q?SFtQzyzdTkSaw1JYKh+BLzrBYL/P7G24CrX+BpBdAmlLPDMYdIspGHM4VNW0?=
 =?us-ascii?Q?0MwVzLZVRLchRSs5xCMM0UCi2zWVJEI0DBZXeOOaMZe+X46ZAVCRif39E8mg?=
 =?us-ascii?Q?4+5oyjEr3AVxXeUOgKQWjscq0fzEAAcdxBpOgI2pW6rwFFkqIeobAWjw+0WL?=
 =?us-ascii?Q?Bcn/ahg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <875D7375641CA74C8945881E3C9C473C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9741
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a22ee6b4-c7de-413c-0311-08dcfca79b27
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bBycQB8MF2U0w8kfhvCFYmvsP5LypoFeCPVWMARPEzaueAoS4XOqlVRXGUx?=
 =?us-ascii?Q?sbPDVFlkPTnVAGjxUQvLvL+ziyo9ZE+GBdl12vJG/EaRtc3/e8vYZJXvpPc0?=
 =?us-ascii?Q?jQeurPjq1okJq87FWuC3AoXhvCU6meNhPjVBa1959bZQgY8TN38zvXcxUwuN?=
 =?us-ascii?Q?wIPyGKQGmYf9DsSiW6ZrpVXtbLc2/34ayBAgSATBxMQ0qPNzgj3nUe+fmgiZ?=
 =?us-ascii?Q?boF70rQfAYv2YzqQ0V10gDOpFM/hJadvuIoxumW9FzUqpagopSSRvhhR5mDf?=
 =?us-ascii?Q?GWPDTpnp/YpRxWP3iR9tV6cYdJsKRvwEaQSG03eQTin+VX2nvOD09CSdFny8?=
 =?us-ascii?Q?whtYao+licYgzMxNiiiv49IZyytis0YBjF7WtE+OEpA3aJRvL7rsK6VRYxiV?=
 =?us-ascii?Q?gN1de8mZRE90WcK1lObdm4hSpMu+2HzddqsMd3mijHqLTeC7fOQ65DvPwO7y?=
 =?us-ascii?Q?eYgfsO8NhbBtem+BXydgLClEcj3DqeI417DQ+EH8ikVnwh5k4NQvmx6Ayw2d?=
 =?us-ascii?Q?nytbvG+FED1xhxU1IzKCEybV4l5dmdzbCH+dFVibO4Yq+nyCEFtDlIKyS5G0?=
 =?us-ascii?Q?wPSMkaq7Bf8aiWSQYKyWbYadMmlkq4d5hk7o/VJkmV7yhQiYKQGkrjVqiujt?=
 =?us-ascii?Q?DpbjzKJ6ULnGnABfJcED5GY80/Vu+kxoeQkj6G6EA+AT6VMnbQT+M8WM7AzD?=
 =?us-ascii?Q?4DTM7xYC8OYvTK895anUr2oaqt7z1G/kviRxlrrm/Ez6QlWYTbZowNAFgWam?=
 =?us-ascii?Q?beeGmYxQvhM6PvDkgyANgxHRcZjEeS0aMMUYJMJFEUllfCCa/7vmRjZwo1+S?=
 =?us-ascii?Q?aP8NtoSAvyKmZEWWoNYU9dN+JYkbqEpohxoF9gjReYBDxZbxtvQrdw+SPl6x?=
 =?us-ascii?Q?FHwpXcNJIxTdriwguenq9E7ytQP2R/5C4udqFlHGyz39CZ5bIddg7wTtQ+3M?=
 =?us-ascii?Q?j2kwJRU3p4v2lMt82Xu4rKfCA55T3AnFJ5wSLQBPjVStClwU0cszBwQYtO4c?=
 =?us-ascii?Q?p56Yu65M319SsId5eKv8hzV1E8OkAk9zOXYGoqtI6rl+ESdtdXGJ/+fwbUrm?=
 =?us-ascii?Q?P3fCZSgr5u4/XA7bj8AVEovP6fr0lHRS47n87xlMe18KppSTRaFgH5NvR4JN?=
 =?us-ascii?Q?YOEb86Ml4TmKHu/D29Afd9IIhKPyVa86m+wXfmbcsBsbqw/DV3zKWEjkxqWD?=
 =?us-ascii?Q?01Ljw4LNr1NMfzHey2J80WKJ3A32NincsD4fRL1E3sdVIPqOps+pO4Wm9Bp7?=
 =?us-ascii?Q?DsMY/HNLpnTIF31WhB36nuIcETqaDeO9JFXPiZJMUJPcG1c7BFHaym+Xk4s3?=
 =?us-ascii?Q?B1NoUafGZzrZFCK2UJHM+y7Kk/P9teNIubfNeA30zU2PfTorhsjzK3lpp9n3?=
 =?us-ascii?Q?9LHGFdIRTZVCwIwqWrfdN/v66Rao11HMX8wvCz2gHXOALwf5Lg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 08:11:05.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfd9f31-2c24-4b1d-4ba1-08dcfca83ad9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8400

Hi Jan,

> On 4 Nov 2024, at 08:46, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.11.2024 08:19, Bertrand Marquis wrote:
>> Hi Andrew,
>>=20
>>> On 1 Nov 2024, at 12:05, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>>>=20
>>> On 16/10/2024 10:21 am, Bertrand Marquis wrote:
>>>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
>>>> index fde187dba4e5..d699a267cc76 100644
>>>> --- a/xen/arch/arm/tee/ffa_partinfo.c
>>>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
>>>> @@ -77,7 +77,21 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>>>>    };
>>>>    uint32_t src_size, dst_size;
>>>>    void *dst_buf;
>>>> -    uint32_t ffa_sp_count =3D 0;
>>>> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>>>> +#ifdef CONFIG_FFA_VM_TO_VM
>>>> +    struct domain *dom;
>>>> +
>>>> +    /* Count the number of VM with FF-A support */
>>>> +    rcu_read_lock(&domlist_read_lock);
>>>> +    for_each_domain( dom )
>>>> +    {
>>>> +        struct ffa_ctx *vm =3D dom->arch.tee;
>>>> +
>>>> +        if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
>>>> +            ffa_vm_count++;
>>>> +    }
>>>> +    rcu_read_unlock(&domlist_read_lock);
>>>> +#endif
>>>=20
>>> ...
>>> struct domain *dom;
>>>=20
>>> if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>>> {
>>>    /* Count the number of VM with FF-A support */
>>>    rcu_read_lock(&domlist_read_lock);
>>>    ...
>>>    rcu_read_unlock(&domlist_read_lock);
>>> }
>>>=20
>>> drops the explicit ifdef.  Hiding function-level variable declarations
>>> behind an ifdef like that works exactly once, and it doesn't make
>>> pleasant code.
>>=20
>> Ack I will fix that.
>=20
> While at that, please also name struct domain * type variables "d", not
> "dom". For consistency with (almost) all other code we have.

Sure, I will fix that.

Cheers
Bertrand

>=20
> Jan



