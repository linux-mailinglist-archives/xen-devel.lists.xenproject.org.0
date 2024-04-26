Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED408B33DA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712593.1113381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HoL-0002k6-Q6; Fri, 26 Apr 2024 09:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712593.1113381; Fri, 26 Apr 2024 09:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HoL-0002hl-NE; Fri, 26 Apr 2024 09:24:05 +0000
Received: by outflank-mailman (input) for mailman id 712593;
 Fri, 26 Apr 2024 09:24:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Jki=L7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1s0HoK-0002hd-4p
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 09:24:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7fbb73c-03ae-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 11:24:02 +0200 (CEST)
Received: from DBBPR09CA0022.eurprd09.prod.outlook.com (2603:10a6:10:c0::34)
 by DU0PR08MB8834.eurprd08.prod.outlook.com (2603:10a6:10:47b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 09:23:31 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:c0:cafe::1c) by DBBPR09CA0022.outlook.office365.com
 (2603:10a6:10:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 09:23:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19 via
 Frontend Transport; Fri, 26 Apr 2024 09:23:31 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Fri, 26 Apr 2024 09:23:30 +0000
Received: from fa77b07b2e66.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30FCDB9B-FCDC-454F-A7CD-D4CE993A3B95.1; 
 Fri, 26 Apr 2024 09:23:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa77b07b2e66.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Apr 2024 09:23:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6310.eurprd08.prod.outlook.com (2603:10a6:20b:292::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 09:23:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 09:23:22 +0000
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
X-Inumbo-ID: b7fbb73c-03ae-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RoAJhDRMCJ2/bHYO/Frar1eWZDiLcUoRRnlzzUbuTPD1wiGzRIJFpszfUjqbJ9U8ooeN1/WCHZuvWlmdFVkq4hZS5CIiCEngtB4ywZjdr+oB35HEeYMB1unrymNqf/K927wnfI5EmRFEusxvkbADc75YKVlM3LCJbLvKaoPz9sjEQpyp9NRb0VCitJ3smmow1oJwnbAHNZMOXjR29Hq3HH4ike/ZeZiwzpGcC7TohoVoWCZ0D3q2pmfrZ0PRtaWIXnxCP56EarJ0uNn59eh+KfXbRjpatEabeKZ3POkcngl43yxPa1In0gUL7jI6O0gc1erI+v8gHVC+Mb5agRuXZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnfeMiupf5ZJtGRQX/qIIqjz8YmKZy6FB5ZRxt3mw1k=;
 b=VSM8/S/eV+RZUqOvPQWrcXUMzlKNB6x1NY8N61JPPTVW2CovmZFWozU4CLR5UtAWD5pS+QA/YKcH5iA4sMO7sljo5MMG0WsHAzmyPaBf2d8CpIiEo0olVKp+EGsuJ+kc0NP1nwxqHf/c80vZSsEmKD4DHJdqU32GY3ALUwBatio6npD4X7DzKJKM7xlehDSJiKYaRyF0WlZzuEY4Fnr0REAsKHqz9avlL1sZbSyk+rTiIHIO83s7t4rLUEGl8pLnyPxk3qOv97UNszNKP32urz0s++is2QEu13dreOu77iMccBi5hm/bED4f9+NvQSV31r67DHGSL4QihwHMw6TQdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnfeMiupf5ZJtGRQX/qIIqjz8YmKZy6FB5ZRxt3mw1k=;
 b=UftPU5+5Z92mcjs8iqZiKX0QTOyxq5ahMKE64k9nxuo5XtQPhRX7U76Blwx9sAcBSF58ZHDJpzzVrxtPKuZa0BNip09xY7wDGCW2VEwlykP5h8eWWssCRouvBL5UzJE0SjUS2J832kL9qra+WIm96PT8qJorBzYgF3i89/+zWZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75f9cf829eb60666
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doIutRPTrq9vo4eEiMptLIxPuzfecnzmmR61qvO8UMXB7BxhvYd+6ZkrcTMMMoDNE5aDP2bdEEaivNHyEYRA0Z4OXEoEE07YH+FE4u9DAX0RabfDuX5mCaUa8ndJ5oBrzQvjLZv5i6UgsNFcINN63bsxFcTDgslTo844PHawxNUaYRplWhLU9XExi5Hqxa4ff5rnIbZ1W+edemiWz9NjmSIXpaFXjH5qPFRNp7zd3lshe0+5tMEoHaF/7VR3VcvpawRG5VWUNSvxuRSTcZR5ZQTaA7WaO4uQs9mZ7zXQ7tw1RoJ+mtVCYrCeLPC9qXwT8vDSu8D8Ho6FMToh+xmdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnfeMiupf5ZJtGRQX/qIIqjz8YmKZy6FB5ZRxt3mw1k=;
 b=Z3Qj7fdB2+nsZ00InQaRMZq3OsRsSf4iAsUpymgMlguHcKAYFehWXZ88tP58VgAV8WTJ9JuoM3fDLxCcBIg89lIghPeVX/TsusXobaWZEXzCvpovqRk/aiNShCY/WvmsxMu/paLaWhw6YwEnCiJ5LCkQWMx9/pqPUbgzqxr6hSkGweLaKvozL5O+eqmme3OdhfDgDscXu4KTBPoYS73pVDVKw46cBHVsM1vjczwgu6+2Wh8cMywEexMrcbcmeBOGb4GikNd/kAO9Wo8fxtMkC1iBwWID/fb3jIIcMnZnOuNyqGBRsAJopmgrjdiP40mtcjtzUJGtQ5A+AgLqsVt2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnfeMiupf5ZJtGRQX/qIIqjz8YmKZy6FB5ZRxt3mw1k=;
 b=UftPU5+5Z92mcjs8iqZiKX0QTOyxq5ahMKE64k9nxuo5XtQPhRX7U76Blwx9sAcBSF58ZHDJpzzVrxtPKuZa0BNip09xY7wDGCW2VEwlykP5h8eWWssCRouvBL5UzJE0SjUS2J832kL9qra+WIm96PT8qJorBzYgF3i89/+zWZA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v3 0/5] FF-A notifications
Thread-Topic: [XEN PATCH v3 0/5] FF-A notifications
Thread-Index: AQHal7Zpi/+zN0xmAUWEyp+UnnJztrF6R0sA
Date: Fri, 26 Apr 2024 09:23:22 +0000
Message-ID: <9094E02F-B4EF-4E22-8DEA-179AAA4CACE0@arm.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
In-Reply-To: <20240426084723.4149648-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6310:EE_|DU6PEPF00009523:EE_|DU0PR08MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd21eb4-9952-4935-90c8-08dc65d289f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?tl9E/VmoyCECR6g/HLnap1K7s7PbcfXQznSz+XA0YhTX5bs7oqUT0T15tUp7?=
 =?us-ascii?Q?yTeRv2JMA9PaCTpwlsZHyU/nj5/plHvJyVDI0TbJYcK/uGe/6qloM0QAZEAm?=
 =?us-ascii?Q?SOgkB1sx3K5f9Ci4tD8VcWZWF3hRk4theZx+YGVd5Sqfdp7MVlb4G3ES82KS?=
 =?us-ascii?Q?Avl7W9HBS0LIUFv8W/3ZSRA4wCQjQSsgdBIbQzmaXB5LHhIu0tX2YuU2Dt3P?=
 =?us-ascii?Q?PwoqZ8O/WnWO95TKzCfl9zoLNdTkLjOvUz/1Gf/NYKhjfSwr59Jbt5z/gePU?=
 =?us-ascii?Q?gyb/uofq9S0yEXJg13FPxMsfGMsRASUqjyDTqznhzUYyp+WB2QMplgd8onG5?=
 =?us-ascii?Q?4v+5woKrLsveli7se1OZBG8ZS5yMAON0Ia6q7r1NFiVs6rH55NY6nlbxoohl?=
 =?us-ascii?Q?PqP993qf9i8osHylGs3mEJnrxJVudetSaCWiEZbcIAxxcN2k/AgnCcMX4vaN?=
 =?us-ascii?Q?tm5exfIPYZC+8UYfpgfHf6gElqywtSgDXJIkn4ckdeNgnHs/D8/YF450VjvX?=
 =?us-ascii?Q?VjlEFLlaqCCOycJN+7h/5WHQx6BZlTRSZPWTsHxnPJw34p+x8AiMNNi/lPal?=
 =?us-ascii?Q?bXC7h0ZY+eB89GypmtqgUEAzx14lxyClStiGFdyfF7DheJ4I3Zhb0nGsp1uu?=
 =?us-ascii?Q?s4CRw8YfXzzr4YG+/zFi4pkflZ5qHTx8I6JBsCElZgIyadTrEWVdp/O7z37Z?=
 =?us-ascii?Q?Ghe1Lz4BbZlAdViK2LyRJ0Us0U3eFWlKBRD8SdkaJg+a3dOqTG3v/K1q8mY8?=
 =?us-ascii?Q?puB/yuAbFvINxolnUJHA4h9aDeuYSkvQ0bBNb25B8a+tGkVY330HQ/B1rc+B?=
 =?us-ascii?Q?J4q+GqvSvuDNX+JbWV8RRfqRxgiuR9o5ehnpldqRT/V7yAbp+sUf08ycxwr5?=
 =?us-ascii?Q?KRaRoSp3aoOfsVNIwRhsveITDyMF6sCi/9s9G7QPP/9FvXk0VZmVOkD96yI1?=
 =?us-ascii?Q?3Z+b1ggFkhlI9dC1h2JWWN85JCFwAtt+EQsR0Pp623rDYHVtsQ9flSAKTmtw?=
 =?us-ascii?Q?Ux/RdqqpjBzq8bLADFX/dpAB04FBiZzkNz7JXa0XsUVOSHjfT8cUz9NGE8+N?=
 =?us-ascii?Q?5DRYy6jVAGdJCNncmWqJICsYFgErmf64P/q8Gy8/PIB3vAZV/9aPca8YRXFT?=
 =?us-ascii?Q?LTgCtIniCezoK26x0rp8peR9b6icU/0QFN3naDJRVGIINvPMOoHrkQMMoi1h?=
 =?us-ascii?Q?hg0py0MVuaxxYEuULBkDy6H6F5tJAbgNz7X/rTAmjF2HQVZ9dzK1WeFNagnn?=
 =?us-ascii?Q?K8IUmIBZIHroLj/u0BRkS2bS1En2ECA6b3Gn35a2G9Mm7QbSSQn4FNGMUs0U?=
 =?us-ascii?Q?rsj62ydkwnLJIny2XrBENS1MXzT17L3D7OfwFLD4kHakbA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BFCB284CF7876B4CB56984A850AF3BD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54a6798a-51b7-4985-e29e-08dc65d284c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z3IeiDDNio5F66T3HE8FlwWRcJqGlgN0YZGFcwrhyRMoiObHYgbEJzycgS/Q?=
 =?us-ascii?Q?HjHtcRvoOxZH/0NsUR6vH5mACRVDct0BsXUTZMvrVkwHzMQMdUWnmpeuXZPO?=
 =?us-ascii?Q?0TmDnGTIl6rNQF7rXKSrzn6ml32iG8DImycBfpwMKtoJMJ0MG+nBlsF1HtOo?=
 =?us-ascii?Q?ZHiZuoPgfHNRnAn1SufLBiwIednWrOudPaQ8Zvpq11i/hRFzdIkf8NXJvKtz?=
 =?us-ascii?Q?zPvZVSH+74JlCvbIqdTsAlf+Lfx5pvL2jmGe9zzVbIGzCZ1deNbrMuIZ4+Al?=
 =?us-ascii?Q?7ztugqX93OgQZoQvSQ2bl2+WMd82LcNaXs3XNcnICkzUOAVVxCCr7cQS9QKd?=
 =?us-ascii?Q?2SJ+Zo4I88z8Rl6RgmRv+SaQFb6Gg4Anwua03/vFLXFZWiB2mi+YNsKoN3Ll?=
 =?us-ascii?Q?/lKQ/1pfc1ZNhw1fCteC0SNU1S34C4N+3xun5yXmWSReaVQdSooEuTIK0sqg?=
 =?us-ascii?Q?gSoIntRIWlgOFGKy9lYvNOW0an0CfglP8bs2HbjjIFTB4lJFU10V2Yf4Mwwm?=
 =?us-ascii?Q?CTgGbfUpgbDH1SIKxvAGjHTVpfJs6veMO10xKpI3NGJoPFvAOXxPxbv6d0AI?=
 =?us-ascii?Q?F2XMd78JCCTFTkxePPyt6GW7HN9v8n1SJlMvvLkc7cfe4dIrTdH61WKzx1ZL?=
 =?us-ascii?Q?RPMNl1op5+JT651rhop6oN1gBYTOC0VaZ19JDIWD3bBG82WyH6nW+f7BLExA?=
 =?us-ascii?Q?I2ssEGIklaj1WT6Ht3EvZdrOukZTqXyxpaFy2t1SHNDNHJWhHRZJ1GLVX5I1?=
 =?us-ascii?Q?Fud/PP8aeF0rY5pm+bU/eHxpArF0mOUl3NOv0S3Cs3Jiu5p3S4trbpLQk6GX?=
 =?us-ascii?Q?BPCHVOyNzige5IqT+xJvsYeJ/d2uxRMZNWg4fY0BoWllN8VMYVsF5f08sWZM?=
 =?us-ascii?Q?1OyMB2FxEGqSwUpewyJDImCmYXtEtDtkwGl8nD22dlfPV/6hwp3T6DuPndiL?=
 =?us-ascii?Q?XDekX3AerKJdXEWr3KvtZjxF1eAf7XhBFdpWoop41qc1v8uxiwsSD3EarpnM?=
 =?us-ascii?Q?SnlmNCrc22Xkf3AFxmrCgAjoJIDd4iRlR6PYfw3/kbGyIDKpgCZhVtp1p0cz?=
 =?us-ascii?Q?05ttBcNt+QxVy/GwoQolPYCtn1M78N7iYIlxw5DrykIqIQq5QkpWQLZxFGzr?=
 =?us-ascii?Q?UId11dCtQtCFW5UK/a6HO8eh81d622vrm+qGEq8HT31SBhp0PfNTpuKXUcWW?=
 =?us-ascii?Q?ipjH61l/lRlZkSadau5T7D5Ta+Hxj8X1XG/ksY/zJlKCe4CfuNL1VJ20zlxn?=
 =?us-ascii?Q?NpBvpGmKW59mKyIfZM8UDeoxxW+f9vkK1zlmGdebzOw9O50jhZeeSy9Mg7HA?=
 =?us-ascii?Q?hNSAMOFCp24Y2YPbLS4xktOfltsL6GEyM/nHqwcgOzu8LDeZY94APvyL2tX/?=
 =?us-ascii?Q?T6CqwqNQoUXwssoqVX9v1cHwSr7F?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 09:23:31.1549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd21eb4-9952-4935-90c8-08dc65d289f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8834

Hi Jens

> On 26 Apr 2024, at 10:47, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Hi,
>=20
> This patch set adds support for FF-A notifications. We only support
> global notifications, per vCPU notifications remain unsupported.
>=20
> The first three patches are further cleanup and can be merged before the
> rest if desired.
>=20
> A physical SGI is used to make Xen aware of pending FF-A notifications. T=
he
> physical SGI is selected by the SPMC in the secure world. Since it must n=
ot
> already be used by Xen the SPMC is in practice forced to donate one of th=
e
> secure SGIs, but that's normally not a problem. The SGI handling in Xen i=
s
> updated to support registration of handlers for SGIs that aren't statical=
ly
> assigned, that is, SGI IDs above GIC_SGI_MAX.

From my point of view:
- patches 1 to 3 are ready to be commited.
- patch 4 will need a R-b from an other maintainer.
- patch 5 has still some stuff to be checked or fixed but could be
handled as a single patch if the rest or the serie is merged.


Regards
Bertrand


>=20
> Thanks,
> Jens
>=20
> v2->v3:
> - "xen/arm: ffa: support notification" and
>  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed=
,
>  details in each patch.
>=20
> v1->v2:
> - "xen/arm: ffa: support notification" and
>  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed=
,
>  details in each patch.
> - Added Bertrands R-B for "xen/arm: ffa: refactor ffa_handle_call()",
>  "xen/arm: ffa: use ACCESS_ONCE()", and
>  "xen/arm: ffa: simplify ffa_handle_mem_share()"
>=20
> Jens Wiklander (5):
>  xen/arm: ffa: refactor ffa_handle_call()
>  xen/arm: ffa: use ACCESS_ONCE()
>  xen/arm: ffa: simplify ffa_handle_mem_share()
>  xen/arm: allow dynamically assigned SGI handlers
>  xen/arm: ffa: support notification
>=20
> xen/arch/arm/gic.c              |  12 +-
> xen/arch/arm/include/asm/gic.h  |   2 +-
> xen/arch/arm/irq.c              |  18 +-
> xen/arch/arm/tee/Makefile       |   1 +
> xen/arch/arm/tee/ffa.c          |  83 +++++--
> xen/arch/arm/tee/ffa_notif.c    | 378 ++++++++++++++++++++++++++++++++
> xen/arch/arm/tee/ffa_partinfo.c |   9 +-
> xen/arch/arm/tee/ffa_private.h  |  56 ++++-
> xen/arch/arm/tee/ffa_shm.c      |  33 ++-
> xen/include/public/arch-arm.h   |  14 ++
> 10 files changed, 551 insertions(+), 55 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_notif.c
>=20
> --=20
> 2.34.1
>=20


