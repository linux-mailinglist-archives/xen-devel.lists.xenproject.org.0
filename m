Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7FEADA896
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016650.1393580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hO-0002Fr-Qu; Mon, 16 Jun 2025 06:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016650.1393580; Mon, 16 Jun 2025 06:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hO-0002DL-Nr; Mon, 16 Jun 2025 06:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1016650;
 Mon, 16 Jun 2025 06:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3YK-0008AT-PG
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a2116e8-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:42 +0200 (CEST)
Received: from PH7P220CA0038.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::21)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:42:35 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::ca) by PH7P220CA0038.outlook.office365.com
 (2603:10b6:510:32b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Mon,
 16 Jun 2025 06:42:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:29 -0500
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
X-Inumbo-ID: 1a2116e8-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKjT1ndByP//M8rFHWQE582hF/30/TCl+rgNEJbH7H3Em0mPvapD7k6Y6ewnv0jzcH8JhyRj/5rPMyuIVIUdmCeZNbqiiBlTJyIaP3G96V8358soqE+5XSzxGcA5o5eSc2JrT9oOc8C1q004/yp3AvwFpYy9j5pmasSZbWzvgFOWPHaZCfvqVBECtcDuQsQIxXbv0iw0Hb/k9sFWFLxSPoenZoYUPCdAHxNYM7O8ir2nqX6Q//xukzDjAqmB3+aRW6eOyAuez4lwwu3LPdkVt27avBxLmYVYnR/wLoPZ8wBEEkvPOu+RzZMdZfa9o91PyTeOJ2k+nDF6mAqTBEGKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uc/bKe0ZCt/bgI6oHn77LOKodpngQIQmpimP9vAyxM=;
 b=mMFvkVHLS/U5ln8BNFoQyPwhcz4Qjjs5H5WDVK5alMumdtF102FSM0wSnc4gWDoPHhfSsBHa3mBQd2B0A9Gk/2GNZ5lVooWL5gg1N1gW+JaxxbDHh0wE/UM9KU23ZAw4JOatNtzguWyI2zrF4/11nXJ7G+8YM/rgPZgBO1Xt9v2LWXZwx5x8Ie08SAFmaSRIeLqPOl7xiCTXrDhJxqEUwE7O29Jc9enmnSegUdqiyzygvYLMI3+5hyZwqkOYP6OiuF9J5+Dkn3FywdtFB9Kccaz4CBi5pfX6QyEg5MleHWJrkbFR5G0MvxqR9G0L0HtelKgk15V/naq88iWMAx69cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uc/bKe0ZCt/bgI6oHn77LOKodpngQIQmpimP9vAyxM=;
 b=CrIyVFWLBSTgGEFYwG4zOOxVeQmasaFcaJLKY93XyTToMBdz9ylBeIMFQ70+1Ha4dJizCOH+74N1xiSHi9wFBimZFnOVo+BaJa2H+qtwG9fECs1glOm11LthrJDdhIPqSo30ZVvnUUQAueEr56sOYL7OWNKbjPdHqBOozwcXUnU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 14/18] xen/sysctl: wrap around XEN_SYSCTL_physinfo
Date: Mon, 16 Jun 2025 14:41:24 +0800
Message-ID: <20250616064128.581164-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2cf989-4196-4d31-7dad-08ddaca0f9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nxY+vf7oazKJkWncovIqEFvpQpG/sus6XBiBDdb0MqU3RKco5wqraTtxB8Cq?=
 =?us-ascii?Q?cJgqL7R7uBSPz9a9qfFoBGZQdajDq8YDydC0VImx1yGuALbu2Hy3UyYoy4FZ?=
 =?us-ascii?Q?GLaPw5lDScUHlELyLOynB3403XtznnMRmLJx6JpNdF8vO8fNCysf4vFCjZsy?=
 =?us-ascii?Q?YAd92tangbRYqmbEx8LK1b/YCUFKdK9Lv4cAO+HMouecaPZr/zG55XZURQAC?=
 =?us-ascii?Q?w7GlEHB2qRnMZtuN4HOzSVfiFdMybVHeeI064slOZ9+mmKlLXsegfLE5wrXg?=
 =?us-ascii?Q?nnKl2lGCbAMu9c+TYTdUZGaZI0hzf0LKxBCQYcPurwaL8ireLKwocFh5+soB?=
 =?us-ascii?Q?lICZDqs81pMyMrC7jEqY8EpePY+oZYl/Sgs7lchIcJHdbS+PNsDLGpmAHFpS?=
 =?us-ascii?Q?W9Pz6NPaWIoiyqCVlqdbGMHeS+GF5+6qNas/0Zt6ENnGMLEv2mBVAJxBZjkO?=
 =?us-ascii?Q?h0kIzpKhsfd5WfdKgBWAwUkK2U3tpqaFH6uC98b25QlexeSuv00XnolAWBol?=
 =?us-ascii?Q?PwowNuTNizuxSWe0HpCX1H5uxW8CRVajWgQyhG1scohZXLQsKFN7tvHkbL68?=
 =?us-ascii?Q?eeQ0+TEOgguzRKFpXCN3j4MVcN7jJ/yVfOn1tFG3Y6hT6jS0eC8bgVb3pA/J?=
 =?us-ascii?Q?T+YGLnTQtJH/qkUVkGl9XX8mKoJL9iMp4ciV0xOA5NC0k0B/3Z0ciM3PVTdq?=
 =?us-ascii?Q?jnqeINQSaNz+uQTl+icpP8E/+gf9tmSzKQ2G+JE0KEf1fS/afnb+xU4f+gJx?=
 =?us-ascii?Q?Gd7pXoYMakYoLLPM0I2IfMhrEWUc4QQb4FyDKMIp0tJ8C0PjHetFpJF4OkqB?=
 =?us-ascii?Q?8Pecg9fhTrRbwxQi4ysOycT/SrINvVrOnC9je52fmEpeomrIBtHhEQ4QbRma?=
 =?us-ascii?Q?2jYW10Ggw+Cspdx7trwTmv1ErfVm0s6mXlDSnxXgwqf+0KpICRLDNyrAONHl?=
 =?us-ascii?Q?HIIwPxB1gSIp2T2Du8KqDfKG+oVXhRu9nRyQoypawtT9IUxVOzBvpcXlojfE?=
 =?us-ascii?Q?CnrAZRJ0feu/ggJ/upnmdJ61WQ/+/LnUOx442myBEqE3f+J+qC2HMmoqgYP+?=
 =?us-ascii?Q?Icro4lIQVqP96xoclVIjINdvszdxBcG7vVcjEmSRsWTOaUIdos98tnMRu7xP?=
 =?us-ascii?Q?QwKuUMPDQk1XnuvNODvKZc/FEA4CsK7yPPzr9Y32xpvgs5k01YxePtKHAo8H?=
 =?us-ascii?Q?/7YJA2dEsLA+oY1WWEhFuaHV2eCQNkgjDHCybxplEUtNc/kcOm3ZKs24LSaX?=
 =?us-ascii?Q?R0V8VV+2t6PhDmLM3XlDRtMs3MQtp5voQhDy1AgGU93N6uVNjn4d52HuMYuH?=
 =?us-ascii?Q?uZYW2VgThvCBPatckJIYBQaVFGqooMRr7KcnH+h4nrpI1uXGm+lr3FehgXhk?=
 =?us-ascii?Q?8jD44mXSE1c8SZBE7DECNb7O8wSMEFWyxut03GBw69sRf2TM+fUdpLRVIE5c?=
 =?us-ascii?Q?It4Y9waewRMYLSlhrqqfC7gMNaOvEiUgVXnI+XlT5cy9v2k+XFcGzKWbsNoC?=
 =?us-ascii?Q?YeLsPNwEMzOwM6oQHh3MzFU7/0LXrtn4i+9i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:33.8486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2cf989-4196-4d31-7dad-08ddaca0f9a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo()
- get_outstanding_claims()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/arch/arm/sysctl.c   | 2 ++
 xen/arch/riscv/stubs.c  | 2 ++
 xen/arch/x86/sysctl.c   | 2 ++
 xen/common/page_alloc.c | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..2d350b700a 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
+#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index e396b67cd3..f86a1c17cb 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -310,10 +310,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_SYSCTL */
 
 /* p2m.c */
 
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..f64addbe2b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
@@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
+#endif /* CONFIG_SYSCTL */
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index dec4cb2ab1..8177d12f50 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -601,6 +601,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&heap_lock);
@@ -608,6 +609,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
     *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
     spin_unlock(&heap_lock);
 }
+#endif /* CONFIG_SYSCTL */
 
 static bool __read_mostly first_node_initialised;
 #ifndef CONFIG_SEPARATE_XENHEAP
-- 
2.34.1


