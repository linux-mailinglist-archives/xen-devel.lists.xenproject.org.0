Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE079271E6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 10:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753616.1161801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPI0c-0004n7-Ve; Thu, 04 Jul 2024 08:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753616.1161801; Thu, 04 Jul 2024 08:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPI0c-0004kw-Sx; Thu, 04 Jul 2024 08:40:06 +0000
Received: by outflank-mailman (input) for mailman id 753616;
 Thu, 04 Jul 2024 08:40:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWvH=OE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sPI0b-0004bR-EV
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 08:40:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f403:2612::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d05d87-39e1-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 10:40:03 +0200 (CEST)
Received: from AM6PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:20b:2e::48)
 by DU0PR08MB8833.eurprd08.prod.outlook.com (2603:10a6:10:478::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 08:40:00 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e:cafe::7) by AM6PR05CA0035.outlook.office365.com
 (2603:10a6:20b:2e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Thu, 4 Jul 2024 08:40:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7741.18
 via Frontend Transport; Thu, 4 Jul 2024 08:40:00 +0000
Received: ("Tessian outbound b61e5184672a:v359");
 Thu, 04 Jul 2024 08:39:59 +0000
Received: from 17062c7f126f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46721410-7F70-40BC-8A1D-2C48CD58070F.1; 
 Thu, 04 Jul 2024 08:39:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17062c7f126f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Jul 2024 08:39:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9862.eurprd08.prod.outlook.com (2603:10a6:10:3f1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 08:39:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%3]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 08:39:45 +0000
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
X-Inumbo-ID: 01d05d87-39e1-11ef-bbf9-fd08da9f4363
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AT5T1blVBQcJ1wkXKZeuORYX+IfGITmSe4ecOYISwiIZ3YdkW2R2/B7ZFSONt0FtvwdmGHk3dgJo1/94KA1A7RLGKQQm8Ddz7sWnhx2LgQXj5JJi4RTP31JPMpR+YS1Y1b4bldtDqbbu2CDgtq6MTle6jCO84d/qH5tNBu+ZT0pIHGZfx0MJP652HUxKZimq0l9WZHf2V6f7yN3RL1Ep7DNYsOknVqeCSc2Ik9aTLwud1BUfNMHbB3JfhklfmRKgLCIW8GAk+PYmP68slCbkHRbOsly9r7pUZazxz6wSuHScWb5DEXyz/1FK/1uRNAe9khcvOjfUoG6wM2TAeml56Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7wv1gyWKHNKDF+fHFoQBtFgIc3ke44LpXbpRzajLlQ=;
 b=SHPhcM+7kh8BlISdPFCslqQG2CEPrVu9hn2PEN28YhRNP3iTtzYqnVLJfN3ZYRhGQlBgnMcLM6qj4R3VhsQqIh9YrnkcL8k2K2M/VoQI+7qDNcv49Ql1gdK6YRa2A7MEI5gcou099cB8iLlxx5ki1E4++V4FiVX0sKnDZXK8e7/3L9rRT/3ZnkItx2J+c/Dm+EWBxq+ySQwXOCYKQKLpbPqAOaDNFlNOP2uYUGpkP98xMpp8wf31pDHQ9y7xkayN87mWrknr0UsWw7YHi2tUFLIlfnRVPqbBbU5RvPscvDczoMqCT1jgX8Iokm90yQ/pPdEhZUUE1zT1kUt+3GM3ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7wv1gyWKHNKDF+fHFoQBtFgIc3ke44LpXbpRzajLlQ=;
 b=hXTyZyRzZ/JX2/hlpph+f0aoeTuPlbhDSqegLNutdh8TdqKAx8D3BOESgTP9V25QdRzEugEfQJNvMMwJHqeY7sprs0l6Kby2eSq4OrMVLlNtMgSGEGx5ssn466+qaBZEucgn5EYxQp5gnBpDv2nsvm5Ka+OVh3ooBXXlAkpS8gM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd5fa9cea8a6741f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQ5Q/Q5HQJn+ikiDYZLgQTKSA0hBZObwRWoWmK3tssyd9X67ADag2OQLv9yxmi81ZrvCSjWRgtkZE2WWT4VeaalkXxwaTVIr7i19RCHy7LDckfmKKphptz4VBtegSUQ39TZU0WRBgmDO+0HLnVMV6+ptCM741sWAihaqM1jDWAF7LQKbqG9nDW669AMVqaZHz7wjKygI+ZUPuDA9acLWutvrNjuoAZrmcAzLdkl/Gi3y96yQhfxRUSbA0E4W8CCqDZ6fK9ooaZluFgINn0+dflhzJ1z8MRzZu9Uiv9m9W07K7hlv/xXJeiA78q2eOigIA5s++QNIu2zKUuB0iQMSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7wv1gyWKHNKDF+fHFoQBtFgIc3ke44LpXbpRzajLlQ=;
 b=jh2/1SrbJgddVWN8tDkgYG57vw8zzrsHOPEvTBJHwGfZCU25LY1Avs2lQNXT7m01cqPyus0WJOsfz5xbrmk8AluJeIN7jQ0X43zkxvVXVWdkd0StBrleeK/UQh99mjUGDofeDumjXwW0TyPvW/cTy5sKP4//o0YhUf+ILUVfrvJ5MXjJUQ6jm85so9h37VQTXVmy4YkDOc1nw4kYy2+MTxUw39U3++CxRSPcD4TRTMPhGFtDqk6sovhOUH7TzovH73xVHzPE/kUlNHcDyBxXcXeKqeN2wqRC6gqAoov5t+3NBmivpSsV2ysODo4CR3Zcw7aCWF77sZNnrRossat9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7wv1gyWKHNKDF+fHFoQBtFgIc3ke44LpXbpRzajLlQ=;
 b=hXTyZyRzZ/JX2/hlpph+f0aoeTuPlbhDSqegLNutdh8TdqKAx8D3BOESgTP9V25QdRzEugEfQJNvMMwJHqeY7sprs0l6Kby2eSq4OrMVLlNtMgSGEGx5ssn466+qaBZEucgn5EYxQp5gnBpDv2nsvm5Ka+OVh3ooBXXlAkpS8gM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.20] xen/arm: dom0less: Add #redistributor-regions
 property to GICv3 node
Thread-Topic: [PATCH for-4.20] xen/arm: dom0less: Add #redistributor-regions
 property to GICv3 node
Thread-Index: AQHazed12zZt44Ds3ki/zr1lurRVMbHmP5UA
Date: Thu, 4 Jul 2024 08:39:44 +0000
Message-ID: <19A039ED-1B56-4C16-B1D0-72F28AA123C5@arm.com>
References: <20240704075419.34966-1-michal.orzel@amd.com>
In-Reply-To: <20240704075419.34966-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9862:EE_|AMS0EPF000001A8:EE_|DU0PR08MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 719603d8-e5ab-4eaf-58bf-08dc9c04e442
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?nu3eMbRKHwNBAXbaQquShje3Z0Vqu4AeNdb+zS0NyVo7U2UgD6+RndmiJ/D4?=
 =?us-ascii?Q?Qp+fFcR/R5cxzFZpT/nvfWC3V5vwOIriPfmYWB+Mr92dFHr9OacySrTmYZCg?=
 =?us-ascii?Q?ooprFmpPgnX7mla+6+UlKeLdxZFqRF6Yo0ae6DkKQFsQLIXXtI3PabJqT2f3?=
 =?us-ascii?Q?6ekerNbNUMTQah1/ymaWiFnz2V0WSczG7qZtSujmGAHQJDIlb7e32D9Os69F?=
 =?us-ascii?Q?NEa2EcIVuLi7GK+XfqTqkD7yyglt4oUnF26bGitk6C+EShyoCbLby3cK5gwW?=
 =?us-ascii?Q?c6QVyBPNmQr1pDa78ZnIcMT0Pcn8HR0NXIQGXm7/MA2YZA6SpAfvF3Xka7ex?=
 =?us-ascii?Q?yg0+cOVJZcRVQNZf1oj4qBT2B35hMsZCiWqB8HyV5Ix/MKP4CHKwJAOMduIE?=
 =?us-ascii?Q?NKLjvURReaYjY1v8V17USF+taYw9gkC6eRtIaFd9UNnmZ0XS2uC2GWpTzAcv?=
 =?us-ascii?Q?efOIyCax29xVdDTnVD9asGxCwxx0Z9zJsN8gSSY3SssrvnOL8zGi28BKEQnx?=
 =?us-ascii?Q?V3shiF6aCvTSMkkZuDyHylnXM9zZrCBuLBSNKMq39eq6z/SIWzvecG+Z3dOE?=
 =?us-ascii?Q?2GUaBqlSu47AH13R7poz3ToDrTFLj65nR62WUcooIo/46NN4+87E+El/h+V6?=
 =?us-ascii?Q?Z/2Q3Puh1LXjLxKbqACQQmuiZbuosAEbnoA+VHR5NyuJJIEBM6UXctG9bmdW?=
 =?us-ascii?Q?jy4d5RCCqTOwqMLwx5iSZ2H1laDq5fHoPdlBo1vlteZhCNn+GCgnaHny/rrr?=
 =?us-ascii?Q?ATWNUOKGQIZ+0edn6ZUXdSibqZgsnR1hRppR86RPd96uR1cdoKv6Z/2tqgc7?=
 =?us-ascii?Q?tSbzvPRSe5CpSEPlnk+gZElHH2eZMn3Z3if2W5F14X1objiQ93VsjPGZzci7?=
 =?us-ascii?Q?8qXK6TwYDc36XdhAMxOphyn9YSKx/Lwe3aRPRz5jLaijyMk1NzVfxFD3oskB?=
 =?us-ascii?Q?3+u+UVAPVURPDpUk5Hb3lK53HnPnPYQFpWM1UnMDh1toju51/w9XhnRg+oTY?=
 =?us-ascii?Q?/ybkOMZ813eM6fn4paW7DLmV8LroWruFEHY/NE4meUdvgugJOX7gq3MqLsxZ?=
 =?us-ascii?Q?XvSI6/QAgohK0TqKpMu1nGCpVj5jQKZcVxgTQiQr2mv/2rha3pUGOogo/jE2?=
 =?us-ascii?Q?rgfvSVebXu9RzLHKvVdKQKFvL7BR3qIOJpjRaWAD5tGYFgKZx7DQHshr20Ct?=
 =?us-ascii?Q?G/q47bXprIWSTfCbLlIXP9dibeTLa9EqCfLzNChZZP0G1e83BXj/Q8f1GCz1?=
 =?us-ascii?Q?k3BLvjYjtjLCkionX3PgEb4ZZ1ZGb53qliUOKVXyHMm6C0YoalcgVfHwUzWf?=
 =?us-ascii?Q?0roBg6fAsUkIDkJl+FGs2L2Y3+7L2krc59kVvsQOgLGtPZrumS5AU4ZvD9Yj?=
 =?us-ascii?Q?wm0YU4MPLgAVeFAXeNiiMg0RUIz280iAdB3AiOLUgrp1L/JDew=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA83E3203B65FC448DD290DF0B3E7AB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9862
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7f98709-ab39-4e2e-4870-08dc9c04db20
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZZtL98S5HlsQeAU02SbyJOfjfR3GXKnCTsMyEBph52mv/P3ofoDgj1cldpLb?=
 =?us-ascii?Q?NtDvlsZEAZEEkW2/7yCgRhVWSWeQHBedTsqE3VoHMzIDP4qoNpThZgZaMHaz?=
 =?us-ascii?Q?XA73mS84hFGu1OyLlHD/pjhTHm/nNHILIqFQvcM1JAaBrAUn2z4J0xE0sfcm?=
 =?us-ascii?Q?KmjQGvJSYiZdoBfaMYBOd77fv/MVhvWGRufRKAqbSOs876Zg/ziR+MW9TNLe?=
 =?us-ascii?Q?bMw4CvxYv7ZUKk0GTvrFF3Lc1C3lw76NiY7jR9TTzKOeItEDMHvLgli69Mk0?=
 =?us-ascii?Q?cKoFoXV9hEST1loisTApBLCCAOwjrUcc1X0AfTDFVx9Jb5+g4d+7lDCzwOkJ?=
 =?us-ascii?Q?mjGkHDwIJ4VAaS0pYirOOziEB8gCtJPPsbf0jGstqUdGbI0SVm7/BuajT6Bo?=
 =?us-ascii?Q?9s6qT3Z1vWQkYcx8FRrSaDddhXW5vTRPbq/SXNQn+0U0ZgIPvFdg8NIHISOm?=
 =?us-ascii?Q?xn3/Z89Vsxnponz12K8gEuvEJ/shP/X+X0xsQrg/slPf0qshGJgTnE0tBB2X?=
 =?us-ascii?Q?Ej7N7Pfu7/7tE2U/eYAmAIkGxQ/5UtbcompPEH3XCu/9C0IhCHGVxhyWB1MZ?=
 =?us-ascii?Q?U+nS+kb1IndMouJsOf7M0ejRTLzDUesGaGVrr0m/CPB8/duiX7LSwP5cvw4M?=
 =?us-ascii?Q?7Mz/Yk31jryfmfQ060Yv0ZosXnGq9e0/ZcqihOebOVmXfdRpcG0qKxRwuXe1?=
 =?us-ascii?Q?B0VwZvA/bGD/t8Sg7ue7eUJ+CZp/xNgDUKa9MgpEq5/Mg2igphC0hmJQ3bAH?=
 =?us-ascii?Q?pCyWyaVL+FkPkzM113M7IgPEjJdD6hrwMdxnRYvOM1oRlP0t3bCSNngn5M6x?=
 =?us-ascii?Q?zpSoux+Wid/PJnRAHFsYSTsdCVtLNG8t7cGAZn7xnBWv5zc9u0kRNqILImQ2?=
 =?us-ascii?Q?cfNE+naYTBckZ9GMHDbIU2pht1JF78/hVMMgAD6749btiaRqVWR121w87ToI?=
 =?us-ascii?Q?yp/n2lpoIQ7/AOkGPKO3eqyuee8FDe7t5oB0zJgq5myFdk0rGaUc/o+OmQsp?=
 =?us-ascii?Q?bAdzrBM0E6MTEFGlab3NoT+BGSfAa/0AR0fWJM+u6D1L9gBVWavrHnwsn08p?=
 =?us-ascii?Q?Y3iMsIAeMIP0+tcP+MxS8Ssce66kM9EclqDZ+47saG1uHl/r2Lw7hwSz3GgM?=
 =?us-ascii?Q?GaM1GOZ4v+AKiO9NWso7s4KQONt+L0oqtW/Xwypk7PVxm7Si9AepWXTD3haW?=
 =?us-ascii?Q?ymapp5l6+83y3KFfvg42zjI7s6Oj/HZHeP/mpf8YCIa805XKQwpbjbgmfnHW?=
 =?us-ascii?Q?mVttR8KJivm76hiMLFHAjF5ded5z7TTEw1/9C79N6RasW/O0OWO4tZMk46cI?=
 =?us-ascii?Q?Y+xSWs4qrp9+RL9mQeUHWRUX4F8cAS/vvY/3Rp3c/BvCoGcanh9+zL/JwzHX?=
 =?us-ascii?Q?hLynN4SaXdr/bIeNMcB0OxKUF0nLdXrRkO+K6p6Q8UIO9CfQol9v867o3xTd?=
 =?us-ascii?Q?5AF/kWhECF8nqNOBRqJtzxrPkIXPTJAb?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:40:00.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 719603d8-e5ab-4eaf-58bf-08dc9c04e442
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8833



> On 4 Jul 2024, at 08:54, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Dom0less domain using host memory layout may use more than one
> re-distributor region (d->arch.vgic.nr_regions > 1). In that case Xen
> will add them in a "reg" property of a GICv3 domU node. Guest needs to
> know how many regions to search for, and therefore the GICv3 dt binding
> [1] specifies that "#redistributor-regions" property is required if more
> than one redistributor region is present. However, Xen does not add this
> property which makes guest believe, there is just one such region. This
> can lead to guest boot failure when doing GIC SMP initialization. Fix it
> by adding this property, which matches what we do for hwdom.
>=20
> [1] Linux: Documentation/devicetree/bindings/interrupt-controller/arm,gic=
-v3.yaml
>=20
> Fixes: 4809f9ec7d71 ("xen/arm: if direct-map domain use native addresses =
for GICv3")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Looks good to me!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




