Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO1pBGbgqWmaGwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:58:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F12217E05
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247109.1545984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEpg-0002u3-G7; Thu, 05 Mar 2026 19:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247109.1545984; Thu, 05 Mar 2026 19:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEpg-0002rU-DS; Thu, 05 Mar 2026 19:58:04 +0000
Received: by outflank-mailman (input) for mailman id 1247109;
 Thu, 05 Mar 2026 19:58:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a8fi=BF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vyEpf-0002rO-1a
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 19:58:03 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c9bec9c-18cd-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 20:58:01 +0100 (CET)
Received: from CH0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:610:e5::15)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:57:55 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::97) by CH0PR03CA0250.outlook.office365.com
 (2603:10b6:610:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:57:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:57:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 13:57:53 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 11:57:53 -0800
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Thu, 5 Mar 2026 13:57:52 -0600
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
X-Inumbo-ID: 9c9bec9c-18cd-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nolg8v7daoe5QcxkD66iNmJAbVR4nYekC6JxGpPXvNKp5hjSFrCQlMwOLQYA569GcI/dTI8034BelXlXVqhzMThXjpAK8NCj9vnvLGpOzqfKbBv5j4yQjQ7FUGsW4JQZf8gbmzp7MUoz2n43QX3wg67eCiphsHHFmUEpQBpmCcv3Xtt5p3XtjqKi+CBM4NAgpyDeHkFif44qHJevHLXGjsKRmyrh500kmTKy/rGL0Efn46yTm/YWkxVJeiHrxHcNh50YFVpuwvrhMqoMc3cxiee9LEiVU67ygS4vGhYq9mL/kT4CytT4OzIhnvqxHkW2P/ZlYAGTQG3pSLjaPRVuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKWjP4xtpZIn1PAPpYWKkBRR1vEVbVaqpTc5je+0qvs=;
 b=mcocFVi/mYZZfIkWE6fTrn6SKPOxhRhDu5fuSSO7K8dMdwjPPxjj5ajqhCKxikQ2g05Wxl9Swu82kzaCFn4wb12d8J12m3qLTdRqretT0qkPisngc6/GuGlG0SxXEl3iNH2cJLjTq3sAFAVehufFdFkagDGQEIbqCN37P3ZxCP61woYa4FQ3+ogT1bv4xCJbVIqgFDdWfFqLqCVWMkn9EfmUJAqyBdLZTgXn6Gg+VDIt/N59q9HpB+8Q0diiNaqXvYwVeFotw8jU81tHYapFrI6Vx0H3rT5jRlE9qNyp4YXq30618xSnchiq+UC09OjHSZXm20456sS3CKYL+1OQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKWjP4xtpZIn1PAPpYWKkBRR1vEVbVaqpTc5je+0qvs=;
 b=453Tf1evMXzHcqDvXsoyYKnxIdPOaCQTxU9kiabn3GrCL+coUGa6+oUmBuZ2PRq0ePw+sXvoLeS6buBnLQdkvWviGmskoexvIZL4BY3drW8ZWp0zdmgbo8QbHTkJju+4+B9l/4lpPyFv8riDUhjg2EiKSJFYBMTZjrJjBjuiogc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
Date: Thu, 5 Mar 2026 19:57:45 +0000
Message-ID: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: bb110e49-fcda-40f9-6829-08de7af17d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	v3UqDZJi1M8iJOFUpmwfwZzXXIxdPnZ6CeuBmCk/8VZCpxZ8gwaDpnN+SQtTBvlY3JmkaHhuku+aq6palZ5ZDlv/75k6xhgKVVZ3cefgoJKrGdL0bizwwhWLXQ/Y18ZkxbpuUEGeW9ACaw47PhEii8ywGJSIoFe8hIAIK9rBi8ypTA0/bio3y+bLmHWeGW21Je5+dYLzuY/trPSorMe6liVV8rI6Ma26x2nlL0qMsH9H1wGvHVHifUQcAAmj5btM/AsuCshkOm9fhaP/iqMiAypr2htL0d0N8e6FYPvt4iXN106EHij16PHEhmKfO6baxI3g1BEJLK3BdZb1/eZMajL8vl3tXPJwFCeIDO476bdxCsptiT36NYEysUY7ZBGK7/j4T1+EFLvUzkCWqlThhPiFEdBH9iL8aD33QKU8H6e0qYYQebWJ7SNbnrSiVMIepfoC37z5cVSwNIxr+fm1aUGK2NHMZ7VKjD/oAHKchqjAhcLDpg3o3krwsk/ac4EJ04sAqmr6jvHs+5eOmNAq2RVm+kgWsCeHKCuRZN2YCEB4r9KQA5d0hD0mdvAdRoXnL1adHQ/mqq9cQ15pnPgOXBI5O1ebbkA9bk4+ogpSPY8zf+VCz2gK2V3FytNg3cA5fUhagVI6FDWP98CACGlvrh2OV8HVTwi9Hxf6QRMgSVaKsv+Mxn4VZmSPgSncXqZgT2liW+8Wbz63YG9OTCZGBIQsG7iwqUljj+mPY9MiXZU1gXF7JxPQ3XF0Ruc4+oK3/B5zYSSqWCgS6u7/Myp9bQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zyGQvV2s029w33hLtBvqWeJrKPFl4gdF75idS15b+b6kUMmMZbPEf73yHaXJkF0000KFg0ig/864Bkpy04wl2ixt+YjgZW5biAVRIi+p0cD7CSY/T3R5w/yjI0JgA5ANBXZJaAAGDhnkyevPMvDxcye8hLMbpHeoTy0FyNDZKyBNypdatUwGo9ZCCPFJ3BeIa0OtFX1yk4yEkWbAIHWUAzeqcz9cYWC0r/6sK45MZEhvluAVSUDtcPhY2+AF7nkdDsbwJtwG/Q6mqY9DiRfJ7xc+UNmJai6b3n7BBjHKCBMpIHeoxgV8gm9BKejmEwKppOMIt+bjO+owYrUr6mN8tRFblLOOx7wWWRpVOKzG4yl9dLynf9/jkFRVqRqiQwDiTDT1lOWKx+QMLzDm1BLkegWPfZeFN30EKnBWC+RzYsrBEKvEokK+dneU4ZM0mCkS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:57:54.2826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb110e49-fcda-40f9-6829-08de7af17d72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147
X-Rspamd-Queue-Id: 66F12217E05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ayan.kumar.halder@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

The lr_mask bitmap tracks which List Registers (LRs) are in use for
virtual interrupt injection. Previously, lr_mask always used uint64_t
(8 bytes) to support the maximum number of LRs across both GIC versions.

However, GICv2 and GICv3 have different hardware limits:
- GICv3: ICH_VTR_EL2[3:0] encodes LR count -> max 16 LRs (4 bits)
- GICv2: GICH_VTR[5:0] encodes LR count -> max 64 LRs (6 bits)

This patch introduces conditional compilation to optimize lr_mask size:
- CONFIG_GICV3=y: Use uint16_t (2 bytes) - sufficient for 16 LRs
- CONFIG_GICV3=n: Use uint64_t (8 bytes) - required for 64 LRs

With this, parameter 'lr' in gicv3_ich_read_lr(), gicv3_ich_write_lr()
cannot have a value > 15. Thus, it should not possible to hit the
BUG() in the default case.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/gic-vgic.c           | 11 ++++++++++-
 xen/arch/arm/gic.c                | 10 +++++++++-
 xen/arch/arm/include/asm/domain.h |  4 ++++
 xen/arch/arm/include/asm/gic.h    |  8 ++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..80d3beb225 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -16,8 +16,13 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 
+#ifdef CONFIG_GICV3
 #define lr_all_full()                                           \
-    (this_cpu(lr_mask) == (-1ULL >> (64 - gic_get_nr_lrs())))
+    (this_cpu(lr_mask) == ((uint16_t)-1 >> (16 - gic_get_nr_lrs())))
+#else
+#define lr_all_full()                                           \
+    (this_cpu(lr_mask) == ((uint64_t)-1 >> (64 - gic_get_nr_lrs())))
+#endif
 
 #undef GIC_DEBUG
 
@@ -102,7 +107,11 @@ static unsigned int gic_find_unused_lr(struct vcpu *v,
                                        struct pending_irq *p,
                                        unsigned int lr)
 {
+#ifdef CONFIG_GICV3
+    uint16_t *lr_mask = &this_cpu(lr_mask);
+#else
     uint64_t *lr_mask = &this_cpu(lr_mask);
+#endif
 
     ASSERT(spin_is_locked(&v->arch.vgic.lock));
 
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..e1121a5bb3 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -29,7 +29,11 @@
 #include <asm/vgic.h>
 #include <asm/acpi.h>
 
+#ifdef CONFIG_GICV3
+DEFINE_PER_CPU(uint16_t, lr_mask);
+#else
 DEFINE_PER_CPU(uint64_t, lr_mask);
+#endif
 
 #undef GIC_DEBUG
 
@@ -48,7 +52,7 @@ void register_gic_ops(const struct gic_hw_operations *ops)
 
 static void clear_cpu_lr_mask(void)
 {
-    this_cpu(lr_mask) = 0ULL;
+    this_cpu(lr_mask) = 0;
 }
 
 enum gic_version gic_hw_version(void)
@@ -382,7 +386,11 @@ static void maintenance_interrupt(int irq, void *dev_id)
 
 void gic_dump_info(struct vcpu *v)
 {
+#ifdef CONFIG_GICV3
+    printk("GICH_LRs (vcpu %d) mask=%"PRIx16"\n", v->vcpu_id, v->arch.lr_mask);
+#else
     printk("GICH_LRs (vcpu %d) mask=%"PRIx64"\n", v->vcpu_id, v->arch.lr_mask);
+#endif
     gic_hw_ops->dump_state(v);
 }
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e4..8654ef89ef 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -228,7 +228,11 @@ struct arch_vcpu
 
     /* Holds gic context data */
     union gic_state_data gic;
+#ifdef CONFIG_GICV3
+    uint16_t lr_mask;
+#else
     uint64_t lr_mask;
+#endif
 
     struct vgic_cpu vgic;
 
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 8e713aa477..e1559ec98c 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -237,7 +237,15 @@ enum gic_version {
     GIC_V3,
 };
 
+/*
+ * GICv3 supports up to 16 LRs (4 bits in ICH_VTR_EL2), can use uint16_t
+ * GICv2 supports up to 64 LRs (6 bits in GICH_VTR), requires uint64_t
+ */
+#ifdef CONFIG_GICV3
+DECLARE_PER_CPU(uint16_t, lr_mask);
+#else
 DECLARE_PER_CPU(uint64_t, lr_mask);
+#endif
 
 extern enum gic_version gic_hw_version(void);
 
-- 
2.25.1


