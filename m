Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A900DB011BF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040188.1411622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nW-00030P-8O; Fri, 11 Jul 2025 03:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040188.1411622; Fri, 11 Jul 2025 03:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nW-0002rj-0n; Fri, 11 Jul 2025 03:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1040188;
 Fri, 11 Jul 2025 03:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nU-0002LK-Cd
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2414::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59286e1b-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:39 +0200 (CEST)
Received: from SJ0PR03CA0124.namprd03.prod.outlook.com (2603:10b6:a03:33c::9)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Fri, 11 Jul
 2025 03:51:33 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::c2) by SJ0PR03CA0124.outlook.office365.com
 (2603:10b6:a03:33c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 03:51:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:29 -0500
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
X-Inumbo-ID: 59286e1b-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgjM4j3DWhIz5EXdI3G7b2oUpqfzcmLRcQOM92HYO/UhDID/4jVgir03KegPnCdBQHnqr0WsLEMqDnYuLinlXXbXsHap463CAc+1rLfQEkGuew7QUNF6lXKWDfneAqpBltWzzUS8lWe1LDMIICTBYFwTc2retMJ0aonxugrHrt0z/7BvZMQouKN9eXySYrMrS2oXrqxieEw096vbrHAk208msLxEBdyLRjIXl4iWGJnQFvAg9WgBLC8j/IU+/gQWC44Vj4zXBRPvYcy27zGTY3STueBGyTWKq6afaxsWbWUYZI1S87TdxDlm/k5t3Rfgba2JLmqfe9/mw+uBriZzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csUm6MQZ2YF7odyOgUXFh5L1IPB/rJvNmUyhadixoYA=;
 b=xN29tV/LtsbNhuZExhW9Qy9QRaE2ndxKilpObVx4WfKWQOgind0t2rSFwBfjb4Ge071xR69pXSJpXb9F87GzycHGwKdIUJmT8k/qzbun1wWOjlE/62d6HPhHCks49agWcFPF6r29P4KNyGcJ7Slom0yLnstpDUCt6TE8xvoaAY3GenwGxgIly5ObX7vlCuociMfAwoI/GnY8AdZXfyhpzCYjQ7DyGxE2Ph2Rbq9YqGGyVmRfqU/TlNOrtXU2cEIM/eSkZZ4LJcoASilMod2WnuVaZ5Gwng8SrEvesMptGobqmmV8fvZ5+OZQ5MKmy9Mq4gc+3gZvvx6wZvmYrwKn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csUm6MQZ2YF7odyOgUXFh5L1IPB/rJvNmUyhadixoYA=;
 b=cYE8D7ekvJu0La/BA8IKZo9AaRSrlt8rW8eJNBg1JW8ic1FZIX++6NLqDQONNx9k5vWps8kVgz/aO5GH/dti732zuK7LgrAelQHCrfpeY7mPzWPWHfesPw9hGAG3nEpEh74XAapfm3DTmx+bQvl29qzYr+4TxaMXW8pWo9lpxIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 04/19] x86/cpufreq: continue looping other than -EBUSY or successful return
Date: Fri, 11 Jul 2025 11:50:51 +0800
Message-ID: <20250711035106.2540522-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: 961037b7-2f78-4320-82b1-08ddc02e3987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8uvXO3UkrTmz0gwKCzvfGtVuF+RNpEsWrydQE3XBGl6OmTdJubLlxCxZUigE?=
 =?us-ascii?Q?CR0SdjL3or4XkPxlJE1h8ghSL1glYmc5gl3whXdz/hgqQ+AzVH4Ephcov6kj?=
 =?us-ascii?Q?OfHXcRhQOoU/OvfZxMPWFkC5VkOnv0XLu+uFGkieRPhqp0o3E18rhCPz/98E?=
 =?us-ascii?Q?cREzcQ4AhewWM+FCvwG8JWU4+BUGas1ccIoszxL5UKs23/V2IlccI/qtJUna?=
 =?us-ascii?Q?8UiMNFLFJyWTrdaelf26KyS6PsQpYnxcr5GZQC7vvhooR9O7Qe3KmR+qzjXj?=
 =?us-ascii?Q?8LMYeg5ngp8o3V4zSCRJk60bEaLk0EcVA7aATYW+da1+0XY8Wrkse802CaXB?=
 =?us-ascii?Q?Bd8JkmAPqfU8lYpPnmeYqop7r/HpV6pjW1yFgZgZlurGJ8GLoQ+Y58EQgddx?=
 =?us-ascii?Q?OHLN1vlL2BFDJSn5nkRvzFgJQLOWQ/NrqaKm39RxECUaVecIXCZivsrKl760?=
 =?us-ascii?Q?ACB/iO74i9ZaED9NOD2tV8XXnUwP0YRLFfYcKTV/fsOWwaThyHmCMSK6rYRn?=
 =?us-ascii?Q?M/iy3MVETwaF24pl34a8j3S26fFuq/zyRF+bTJJ626YhLd/xp/prC970AlUi?=
 =?us-ascii?Q?b5yLTdfydZOeIQxbUjRPf9LZkNorVRJ1cv9LrD49jivtdg6w34mKGa8SqFGL?=
 =?us-ascii?Q?Qpu3k7NXZDAGn4K3WK6LcrJZCSqAtE49bOpLsJLLTcfXiMBNKKhVvC+uCwCt?=
 =?us-ascii?Q?/QuaZazvjQfvSIxRt75946buCsSBUg3aF/1rt6smvSdRt44GQnPEGnAkDoVx?=
 =?us-ascii?Q?okPU2vG7tOynDefpOL4BE/i+akNZc77J/4YAsPzkC3lTEvd3p9J0yhVpxHYa?=
 =?us-ascii?Q?9xhn5T9lonsEoh+EoXZo3qGol8WgvtFZFCvtbXBiEhRL969ICm76lUciGoUj?=
 =?us-ascii?Q?pZ19x8n5gBsjjDJwihAaTNSa40nn4JRKye3W8YTHbfn0OBpqd9hciM2ZBOjw?=
 =?us-ascii?Q?SUJjf6Fh5VGQyiqRzvBmiuKhGB2K2H3WsanBqR8fMNtZh60to6N1CYbQbvIi?=
 =?us-ascii?Q?l7+6iMI/+ik/XoPe/Y9wJuaPvgMDS+6/12MOtyvQhCfM3LxV6t3tDyzkJTiX?=
 =?us-ascii?Q?p53nPPOPJyxNF2ejOqPLeiQzVzdOAOD56DQ5YjjOAWPOknIunaR+50inNbi3?=
 =?us-ascii?Q?zE3kiaXhW+vSqNZl3Fp3q6oelCj4BPEApiHX2VzIE3QVifRFnrWRtIPUXg1i?=
 =?us-ascii?Q?YoHEvMOVs/ZsVaPIXtzd9OYyTgsnJxJk3tRs9NFFR2a31NvfSh4N+y8h7/2+?=
 =?us-ascii?Q?yq3fpn9x/PKX//m7BrbgaU3hWIspA6jJo0mxtHk0SxEsp7y+hCdAqYkHy4Fh?=
 =?us-ascii?Q?n4yzrN7TX+LGk7+IwqcEHHYXKvclIV2m/yn52IZghhesFBljb+jNp9FF0EWs?=
 =?us-ascii?Q?soCFgHq86Gj1M/z1Ch47kEpqCiY/5/cMfVt5nu87JLQ1ggjSXp0QvideaTuE?=
 =?us-ascii?Q?HSifrBMI84QXaJgRtLI3HIv9Wp3HEhQF3ig6BSG1FTAiU6DPexjjvpckUwTH?=
 =?us-ascii?Q?/Js5zBUQeqp916nMirekU7tNyk2RrXYmzJRU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:32.1345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961037b7-2f78-4320-82b1-08ddc02e3987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104

Right now, only when we failed cpufreq driver registration with -ENODEV, we get
the chance to try the fallback option.
There are two code path erroring out other than -ENODEV in cpufreq driver
registration: one is when the driver itself is broken, like missing mandatory
hooks, cpufreq_register_driver() will fail with -EINVAL, in which we shall
be able to try the fallback option, and the other is -EBUSY due to repeated
registration, in which we shall just exit the loop.

So in conclusion, when error code is -EBUSY or successful return, both
indicating a proper driver is already registered, we shall bail the loop,
other than that, we shall continue to try the fallback option.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v5 -> v6:
- new commit
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 61e98b67bd..45f301f354 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -150,7 +150,7 @@ static int __init cf_check cpufreq_driver_init(void)
                     break;
                 }
 
-                if ( ret != -ENODEV )
+                if ( !ret || ret == -EBUSY )
                     break;
             }
             break;
-- 
2.34.1


