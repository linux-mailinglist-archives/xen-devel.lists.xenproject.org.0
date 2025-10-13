Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A8BD2809
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141907.1476117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbh-0005IS-9r; Mon, 13 Oct 2025 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141907.1476117; Mon, 13 Oct 2025 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbh-0005Fu-5V; Mon, 13 Oct 2025 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1141907;
 Mon, 13 Oct 2025 10:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbf-0004Hi-4S
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:43 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e5c306-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:16:42 +0200 (CEST)
Received: from MW2PR16CA0025.namprd16.prod.outlook.com (2603:10b6:907::38) by
 DS0PR12MB9725.namprd12.prod.outlook.com (2603:10b6:8:226::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 10:16:38 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::db) by MW2PR16CA0025.outlook.office365.com
 (2603:10b6:907::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:16:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:33 -0700
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
X-Inumbo-ID: b6e5c306-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0b/THGj7JIVVp3pdxbqNFlY+oSeFNu3PiJaLahhhDPJIhKpaKmECsV54rtHUt8SlUpqn9aehqMtRIfNqQ4ds9vGGM58KZY0B0qA4AubD8DZTcG2jziIAONAWB3thu1G2U1QNiq+2CW+J8eheUxb+m4UT2gwAxYoq2yPP8IFoUKpZm5MoUPWajdm1BKanturIVNFU3b1ppZyJnkLvG2PuHd9RKn5dQfJyoBxMejX8y2Ik8MV4BIA0C5Wv8E0p8tLApRnYcSVuM///2K5m36omgTFj+qAod2/vZqQDrgrJW1nwf1M2TmV0GrSeaMpjgH2UO3iTAm+4vqjevDqAtauMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z/pSsUa3YtE1f7FvQvi+IxLN38uxBzuO8S4No8CmOs=;
 b=iMBEYZSITPxh2CxLCCW3IzZOUujjXqhN3tfkO4tKMuEgH0pQ3CvVcIgkiATmCc+IV+YbAIk9iiSTycpIL8166tq+PxKuqikoc9CCuDtlJpwOILwDdoYRBE987QWJ6mZTWyMUg9YU3BO3ytBfq+Zfuocm/HwBX08RZU7ANbfHIFvnEHMbmqGxTQthJ25X0uJu0x15ktXHBCYhyX1eZt4/7hK+Rwfm12nGFLsKeKmttV6+nD7/3erk0oSIF3mLN+rTd5z1c63bEYyonq7MoMwXGmcp5IKLsbxuw89gf6wOa5zScjWwU1xr2JH1XrQQFOXhmMF0mT6OEOcVqK6GUlwqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z/pSsUa3YtE1f7FvQvi+IxLN38uxBzuO8S4No8CmOs=;
 b=itRDusZEUaUVSCVkXpbw4iO0ndHWGMZGg2LBHTJK7Y76kdjtyANycdTvKKjSOibnIwssDVG6MaIpTvqvwHyNW1evm40UvblmwxAbcMvz2lWAb3Ed+ROx9QCIOSFXGCQjRUu4JBSozz5KPXqB/yY+BW0mT2WKdWhhpMJG6U3mMPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3 04/28] xen/sched: remove vcpu_set_soft_affinity()
Date: Mon, 13 Oct 2025 18:15:16 +0800
Message-ID: <20251013101540.3502842-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS0PR12MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 0649f73b-7723-451e-dd15-08de0a419833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VIK1DfWcwLyhK1o1ptWoQ/4rpQQH2c780TySL03zXVKCtbwo9Kw1Nnsp/M4U?=
 =?us-ascii?Q?HPS4J203hYfUPrC7ZowD0hGHja9fOZbCXqKkbcYlP1jL8apq41aMega8cFRl?=
 =?us-ascii?Q?ipRbmc6CBBf8SC48Jy241KDup/FehN5CYdxzPIi6J6y5ap+WYqm/tDdsz0BQ?=
 =?us-ascii?Q?KUkKWFROkeTaHXOFfOcq6VNjVjoDLtZR2/2nrwOOfQUDhDWu8EyaxEAi0vf6?=
 =?us-ascii?Q?uPixZWJ8pKsh7bRz8M8dEEwYnN7Y8njW9xrdrq2rPUsMO38HAo/WtHejSugn?=
 =?us-ascii?Q?fKF2VGdI2F9PXXI9ma60bI6hKAJNR+m9TdWl963v1Ur0Mv/QoYl8y8UvJ5SX?=
 =?us-ascii?Q?PmXOD4vUwdKj19j1bnTqKikBu5xxcXkUV5Z//o7JKLUtp2DOe6rQNm6XWyer?=
 =?us-ascii?Q?7UywWwMbnVpFDU0Eelaah3QVGPkvWzAWkpIbAwWAyCfHWEglt0X3xD+6PUMx?=
 =?us-ascii?Q?Qas73aE3qwqE3MPXxSCOh9WIJhLmusyjQktGiEMX3Wuy/p5nND3le76DlSsI?=
 =?us-ascii?Q?3/FKfZf2rec4X04HnZEEdCbY540SzRoeiNPkI/NeeGwjHR/QPl6cSlGSQFmM?=
 =?us-ascii?Q?+I8y+40ZfrwyHDeht7Ypi8nMFnVYow/HDk8ok+JW0eB8P79Xz1+vGGk4JkeK?=
 =?us-ascii?Q?CdY/BBYIey02iZ8Tjvq8bJCk198fUgR6bzJTkirA+1t9hDq5+553V8J3xZFs?=
 =?us-ascii?Q?JVuUnfakmi2ROET9/O+vPuQwd3eoMyqBv+jlXTfR3lDbiJs4VpPRezDcA316?=
 =?us-ascii?Q?wiQRhAz8mNoU2V61X14nGPHqwiNQCzstGOawBdAZ6W/xXs/U3iCGsZBzRSDR?=
 =?us-ascii?Q?A+mbjwPOUDf9b/p8K72237aUlio7EdbpYUWv9gKoswg3snv7new5C4KhPYDP?=
 =?us-ascii?Q?SA8i9aYZ4I6cWcRhau0or9tcNkM+h6TczbzFiQziicx5oxAHnN5WQSJUWxit?=
 =?us-ascii?Q?+WuJqcmPiW73SNkck+YChHVQsrdw/dYx+Xq28vlu/DSGo8j5Q03mmXH6axr0?=
 =?us-ascii?Q?fjH04t3PkhK9Ex+Eg2prdOWnp6JI7iyjS8JeF0wP+GNd+hM7dkEJICW+uKLr?=
 =?us-ascii?Q?ESRZyIw0uoBXGu9kfsU3qa6shN1FKI5xUENvOK9ZqHlB6EBb9dlPISqu+Bk+?=
 =?us-ascii?Q?s7nZ0/5eeNSFHsxfSH6nMRvEVolC1NwxEAB+HJI5b9i5t/KBVhPndFltLRfD?=
 =?us-ascii?Q?kpZ7B9HRKD1Sr+T7WyhjDHMM6k7W5+cHmBYoa6vkaAjSF/OcHcc2aWY4LuEn?=
 =?us-ascii?Q?jIl8gvwlapHIgre3pubooz3KuovWM+hh3e9HgD4n939gfV7XL9qbZa5/rq18?=
 =?us-ascii?Q?OyigNEhhrTCZzgiQ0Oei62JS9C177ht6b+CmxOpeAeCbskdGWFFG0axj6ynH?=
 =?us-ascii?Q?g+ZHK4gZb8eitZFrYM8znmWejYWlauAPIJYGo7eoymKqGqbmJGgbfnOKA4uW?=
 =?us-ascii?Q?lcuIIHWyGlEnq4G6iOgSvHjHvQP0SJSfMRvHSoxVS9OYgrlqaoZj78H+FaUL?=
 =?us-ascii?Q?wrTYz5m0/a0Ay1eKuMIC+8jmmuKl8liYd5poleJXZ3O2b4JwqxvgIYmL39y4?=
 =?us-ascii?Q?iCnanWQwOkJt03gjhh4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:37.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0649f73b-7723-451e-dd15-08de0a419833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9725

Helper vcpu_set_soft_affinity() only has a single caller, so it is of little
value to keep it as a helper and could easily be expanded at the sole call
site.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/common/sched/core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 2ab4313517..ec2448cfa1 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1402,11 +1402,6 @@ int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity)
     return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_hard_affinity);
 }
 
-static int vcpu_set_soft_affinity(struct vcpu *v, const cpumask_t *affinity)
-{
-    return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_soft_affinity);
-}
-
 /* Block the currently-executing domain until a pertinent event occurs. */
 void vcpu_block(void)
 {
@@ -1762,8 +1757,9 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
         {
             ret = xenctl_bitmap_to_bitmap(cpumask_bits(new_affinity),
                                           &vcpuaff->cpumap_soft, nr_cpu_ids);
-            if ( !ret)
-                ret = vcpu_set_soft_affinity(v, new_affinity);
+            if ( !ret )
+                ret = vcpu_set_affinity(v, new_affinity,
+                                        v->sched_unit->cpu_soft_affinity);
             if ( ret )
             {
                 /*
-- 
2.34.1


