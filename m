Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B966E91D19B
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751112.1158989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtl4-0007ie-99; Sun, 30 Jun 2024 12:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751112.1158989; Sun, 30 Jun 2024 12:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtl4-0007gv-5k; Sun, 30 Jun 2024 12:34:18 +0000
Received: by outflank-mailman (input) for mailman id 751112;
 Sun, 30 Jun 2024 12:34:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtl2-0007C0-In
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f941557-36dd-11ef-b4bb-af5377834399;
 Sun, 30 Jun 2024 14:34:15 +0200 (CEST)
Received: from CH2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:610:20::30)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:34:09 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::57) by CH2PR07CA0017.outlook.office365.com
 (2603:10b6:610:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:05 -0500
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
X-Inumbo-ID: 0f941557-36dd-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KukuOpk1c36Yr7w+M1qNTo0E55qx74DYBOcAk8cHFTWBEJJ6Wp3dYteAvC8l1Y+tFZUsmm+JDnPfcEvxm1JvG3T9K6S34e1uMJ1J5QIvmmwENtvQKXEkNF2cYmLgXVYHUW1Jgsqkc0NxTXusPP1scTEyyWURxRiCff5UnQhaa1n7VgE38pNr2I6pdZxOFzlU5K1K/ATl39gWP6CKouatqj4RSdMq7jc1KC+lfLyRlwME88WUmJQNWH4bfhPJVM4jOyekjrHeS8gui40gZ3/d7OqjkLKgKDZMn+i3E8xEyj22G1YRXMbxviO84R5yHxNH2myPio3Y4rXnlepLOrKVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHdK6TgicDi/JB8CaCsM4rODqFcXf5GdnKfGXKkjABM=;
 b=oPW0I5MYAQPKmN9RJsRcyeD2mw8iG2a6azH9yIhzjHxlgYKgBtrzRPBh0aPvf7Z8PUP7/0jvlMajgTeTO+yIbYtTV8fqQZzb0Mrdgc6UJzMcB1i22mn+cQDbbHGdcAV7uE/83zMaT60lcCx7Nwgb6zcqSkifDCmdQFcgNMlvYhpiNhVQXkEwxte/mH5ebkN45qGypaLtZJEblkcesEMIMbyktDb0JskZpMd2kyyaehlyEv5b4oH1ew0ReIjVLh0JYl9HVdsLGlmUye0vS1TbhdMNpc0J008w0m+pxYwc0hku3BKvzgDq5R/W2G5oUMLypAU4dnislt3AnDIOF06pAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHdK6TgicDi/JB8CaCsM4rODqFcXf5GdnKfGXKkjABM=;
 b=kmmW6vkYKPOa4k/LTXEbbchUFpA6RJYeLeImWqzttEnNAWuBZArbbjZxSXF06eRqXLjut4puley9c6o+4JztL5Mq0LAD0JTrIgDG3bL+J6L7eUK/f6AH4lbNNIw+V7s0hz402RqixftdfI25ytlxO7WeOqAPwqBPXdu28CDG/ik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Sun, 30 Jun 2024 20:33:38 +0800
Message-ID: <20240630123344.20623-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630123344.20623-1-Jiqian.Chen@amd.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 010176f9-6078-493f-8fc9-08dc9900f072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cFHiZCdLtY4Vy/ONe2AizWskVRuI6fq7LeyPZAgmEQBSNrioUEwlfIrNbFIq?=
 =?us-ascii?Q?GOX7PDQ1dTwp8g3GMYzdycIC3S8Ap21GTd507QLamm/IU1BLOazEC1WyCSyt?=
 =?us-ascii?Q?bsYY4SedBb5CMUpHtg1YZKVfsy1ld3mInEcmFSHmEElIcNGl15jSMrrd1kBe?=
 =?us-ascii?Q?IglfcCtFPdU+5qXLDHJj6G4N0jWsMBW71eXmeJgqS716Om5Rht1Xp0xHeZB/?=
 =?us-ascii?Q?Md7pdC9/s7V9f3m/L+ARKNBNf6V9lzYI1KtSmrITzrxR3d3lsKVKN+05BtXF?=
 =?us-ascii?Q?q1iqOvzso/YQLGX2EAot5pdjjnjpHF9NEnFQNl4H+9IiSXvyr/Tmoo52ccGc?=
 =?us-ascii?Q?t5Ra+wlctBcVOZ9xpR2cLNJlw0bPWw6tI1RBPp8VhbkoDMAJHXwgE4LbqFji?=
 =?us-ascii?Q?m0YvLN8LL/D/CH27j2OL95/UgTCC/FfH017ltMGnz2R8pfkGHfc5gebOnd2s?=
 =?us-ascii?Q?77/m2Jdub95Z18InNkLhLyrw6EkdsyEHMp68ig+s5lCOsDgCut3AoCA9b3/M?=
 =?us-ascii?Q?pxhCP7r3/R7VmhHzW67etosFdvwMNziWjM6tXM5e5NZIiOe26k9we3IBPxCw?=
 =?us-ascii?Q?Qa9bjWlaEEWZZj+KmuTMsG4+ldY/ZmVoXR3j3FGQTQOIixn+2sfGgSbb4xQN?=
 =?us-ascii?Q?7gj4vn1q+q5s/SiTcKlneZIG5x7PxChFLe6Z5QA51/qfO54YPt3UlGOPuJ6G?=
 =?us-ascii?Q?E4F4n0eCYrbiVfi9SfiUx9VbGd7aGBJVjHNLORbXdx3QJsrdDL6CnOf+xpgd?=
 =?us-ascii?Q?8KTI/6+DwrRDDUkDjhlSrmE5U9ljdl7ZVX9hQz2ZuNTFH5wDdQ737DnGwBPB?=
 =?us-ascii?Q?v+PEx0CfHYn6eT+9EMZ3ceqbu0HtCVtbxpAiX0dzctIUXmz4Nn61275Gmzqb?=
 =?us-ascii?Q?yOGbkp3CQC227VUmSchGSldQwuiE+RrqWSmnkR62D9XY9/rhy52xVQMxzq68?=
 =?us-ascii?Q?2FqSCIJ+HnRWiSOvWtrBU//yhYzzynFek6j4vqV2eH0uK7w4IZoY6+MlNCco?=
 =?us-ascii?Q?fk/PVkKDXqmhtRwQYyluZDNBQaPSOpvbkTrcFfv3JzfNpc04SdRTP9MtovlN?=
 =?us-ascii?Q?kTUS943Z8FqHsYU9Pi1+pRHKI/6qYUQnXBrMEGK72p0AdAfRn+UCDQyVy3Zs?=
 =?us-ascii?Q?Rwz5b2U0OQR73/5IeXkkLpxw5N/8WslqxEUKM/jYeXFeD041/9YRFRNRcbgb?=
 =?us-ascii?Q?UNNDSQ1jhH0RlK7DEzeG8kL4H8xXbBoD+tq+jzMWh/bsqy+8s8G2Is+CR6RM?=
 =?us-ascii?Q?ZFBZb32twToxx//WYvjRmQaEjTO4ujyzlEqB5B0ZbEShN65MgTN+y5f+xRo0?=
 =?us-ascii?Q?4hgArKP79fyjhF/wNtKibdPn1RAAALva0lrVb9SYgDXqTYFUTIkV2EeF4pmP?=
 =?us-ascii?Q?AXIdQRH2HTPfgJzJLlarrvdYH4TzYgETXdwfMwN1tmgrDaEW+T7jnGoeJJOe?=
 =?us-ascii?Q?vc5hwxb4COKi/Ng/gNRqI81Mofl6mXaD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:09.1919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010176f9-6078-493f-8fc9-08dc9900f072
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see qemu code
xen_pt_realize->xc_physdev_map_pirq and libxl code
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
And add a new check to prevent (un)map when the subject domain
has no X86_EMU_USE_PIRQ flag.

So that the interrupt of a passthrough device can be
successfully mapped to pirq for domU with X86_EMU_USE_PIRQ flag
when dom0 is PVH

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  6 ++++++
 xen/arch/x86/physdev.c       | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 0fab670a4871..03ada3c880bd 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -71,8 +71,14 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
+        /*
+        * Only being permitted for management of other domains.
+        * Further restrictions are enforced in do_physdev_op.
+        */
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index d6dd622952a9..a165f68225c1 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -323,6 +323,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !d )
             break;
 
+        /* Prevent mapping when the subject domain has no X86_EMU_USE_PIRQ */
+        if ( is_hvm_domain(d) && !has_pirq(d) )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+
         ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
 
         rcu_unlock_domain(d);
@@ -346,6 +353,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !d )
             break;
 
+        /* Prevent unmapping when the subject domain has no X86_EMU_USE_PIRQ */
+        if ( is_hvm_domain(d) && !has_pirq(d) )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+
         ret = physdev_unmap_pirq(d, unmap.pirq);
 
         rcu_unlock_domain(d);
-- 
2.34.1


