Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89AB0D117
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 07:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051937.1420404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue5BL-0008Sz-1n; Tue, 22 Jul 2025 05:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051937.1420404; Tue, 22 Jul 2025 05:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue5BK-0008SB-U8; Tue, 22 Jul 2025 05:04:50 +0000
Received: by outflank-mailman (input) for mailman id 1051937;
 Tue, 22 Jul 2025 05:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uo4O=2D=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ue5BJ-0008S5-2S
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 05:04:49 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2407::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6216dbbe-66b9-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 07:04:45 +0200 (CEST)
Received: from CY5PR15CA0193.namprd15.prod.outlook.com (2603:10b6:930:82::21)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 05:04:40 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:82:cafe::3e) by CY5PR15CA0193.outlook.office365.com
 (2603:10b6:930:82::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 05:04:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 05:04:38 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Jul 2025 00:04:32 -0500
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
X-Inumbo-ID: 6216dbbe-66b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xd1ELJBMuzCCD9TaciiQsJ7TYAphWMTcmX27uMhOB2GTSuGV0dlxmRKVcPXCGxLe0FkaGZIDwQ/QTDgDGUkt5jwDQdCqWi7KXWLTC1fz1ujr+9x3YOYoRPNSuz8GH0CP7HFwSv8GJJduOLB5l0uKFH17NNfTPaeW0gMhCH1K5/ejoBFuSGFWmU0NKsAWr7Ur15XtAjb1Uc8MFROMtmv/YatZacQ1j5BoiC2E219le7C5vB5/g3IwwxxzeXGiyqunMq2hqp3xkh8Z5eKU0nY9ULj1FgrjnCkPf1OiWtdFBwvouDonXWDtVZB0+BcWbDT26ats2fhpWbpJS37uhNkTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpJdRphsoJmZDkA9Foxsya8yC/yMG5waBZZcd72Zl44=;
 b=gFRyfd/HCGFieJUJIy6h3r+MsnXLjMsBOtg1P5ivNzOwAQAMOtqij0RhAZWZNyS5+XB/d/c8fklkOeQRaxhNiz77uO9yoJxizdWZcdAwMlWpW++1aI0t+DLwyNsf1xx+bGHRbimgBVQ+Pj9KI3wsm7qOjijW/dYoG7C6rfGwEzrHtynKFZA8eTR1/BhmRiXEWw4ZQ4UCXiDm11BSqW2/F0tZXlLRlWo0jUhYhcG9bElhGjwpRHPToBfXigq8Oc5b/WjpZdEMiobSKa87epqLpYXTIcw8pvcMKBVaqXZtMYMLiQx6E3GMZBSYmBlqDW5oYZXc5mqvMT9qWJltWui5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpJdRphsoJmZDkA9Foxsya8yC/yMG5waBZZcd72Zl44=;
 b=Kp4qaDKJW7+Hss5RbZoMa2toQ/uVcEJHD0URig4mY75IjsYOPPluV4xqq0pZMB29wplr0kidc9OlvTrWOxqaYrjQK/bl0OWHJAVKSLm4HVm+PWc23YVxLbmQMtepY+H6zPakmcdKqoDmUW3+L4ldzbo4jtptZcTwpoXziR38fQ0=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1] xen: move getdomaininfo() to domain.c
Date: Tue, 22 Jul 2025 13:04:10 +0800
Message-ID: <20250722050410.853783-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d96869-6f89-454b-2b60-08ddc8dd42ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Q62UmsvcnOK756jlH+rkz9yncO5Xkx5ajjh/H8Zd9pkq+yYE5+g9vfR5WrS?=
 =?us-ascii?Q?WpeQCGrtftrzqOhZi+GxYpR/E0kuZ3MF+9XjAP3M1qwtV9bDiXdoSlQKmZuo?=
 =?us-ascii?Q?MpY4/X3J1sk6WnY3mF45mLl6LfehWfjqrC8TtuwuyKD0I3w8vRhpQ2MNTQSu?=
 =?us-ascii?Q?HCgxBvc5M2oD3y+WTNs2TJxJ4A0alClBj5fzenLecp+T335nn7Vc6pGmU9rT?=
 =?us-ascii?Q?rkDJsfdiam/FVbynwe+zyD6+ST8QiX9XvCIj7fJK3oNBGzZ89DTyFqp/Ma1x?=
 =?us-ascii?Q?1uKjuKx7348zZVe323mPSTULlFZs9KKONj1JK482YuPSVQ9eKDXTLaScGAcL?=
 =?us-ascii?Q?E/KVqF70YoCTPx4ykHZrRTcoCUE3d2nIQIBxzaAzXKFGIkIzCTAJDt5pnzCU?=
 =?us-ascii?Q?zvJtGoQ/LwWHuJNEDT7Bo57BjD46sSgHXd+esbFI3dmZaoptxzdWbkgC9QGM?=
 =?us-ascii?Q?9Kz7YUk/OBg6hUon8zM6COGumxVO/1npCTE+BAQUDvDqMwiqp/69WHyxnF9d?=
 =?us-ascii?Q?UFcnkDxmYg8xH1DBafLIy5UXTl8yi2xH7kn85svAPz3WOyckLugFqcjFaBHd?=
 =?us-ascii?Q?fQ7lAy68jDaB7bUIYtd68JLDyUUl4o9PQy10CQGr/KKl2l3v+whrIj9vpkD8?=
 =?us-ascii?Q?CrGDOoFav5VW5OQSJxj+FxfOA4+O16rJEO9THiic+5k2N0Ca1dZekC8YaZaA?=
 =?us-ascii?Q?+9pvh1A231NeKHz9GBT/clRsR2ikJQDWNf7toyp2aovuuVTdGrjrU/iVr9bU?=
 =?us-ascii?Q?+saGyxdS35Plip29IJCD8eTK8O19IhLpvOA1n2u4BmaIk8IdKqgo+4d7PAWr?=
 =?us-ascii?Q?tpXKu0l52NA9jhVUST5mS2WOgXiQejAVYc3TFWoSqY++5PlhvrolN0NN8rOr?=
 =?us-ascii?Q?UD7/rOFHlifUNgSRf1nzKZo/ZJry3aDc6qlFLYTQZu8w72gdXorwidSy00MD?=
 =?us-ascii?Q?HrAZIOG/QeRuKN+jTxKd79CrgfCyGRdTwlM8Lj2FKBTzO2HEV0BMzb4tl0ry?=
 =?us-ascii?Q?+rRIwQNrufEeKLB+RUK3NJ4Kxs2YZz4ZSlqtLvs6449T8S0x6uBhI3zI8/iI?=
 =?us-ascii?Q?Sxu0kkXgWP/lqHAnyCLNjaotQ5XEwZXkbdX34GeAGCUtflqlrU8s6qAtLTxe?=
 =?us-ascii?Q?1ydV7evsNWnWOnYNbvdTRG1cKoulZVzJ0WUenzKAf3o8Nd6P/BebAtoHYCir?=
 =?us-ascii?Q?9jwJCwC1kAArNrXtc5fVQeDuOj7PkL7L1lYMgPuUcZzE7D6YFSeV7W+aiuj2?=
 =?us-ascii?Q?lwULNW7/Pzp8qMJ20rFpKqlAV0TqR0kM7Voy9iheJRYoi8q+7nOjFjRiVdHh?=
 =?us-ascii?Q?bOEvynGQ4rD41AdALWjmWvscdpV7jN/YOgPtNtG+sAL0GS+ru27cK3uH18Ds?=
 =?us-ascii?Q?WTS2DezJnvXuMh8M7a6CmdQtz19jigwVU+oxbc0Nw1wxQK0EHsgKwORt7MFk?=
 =?us-ascii?Q?NgSiG4i5TbfL9kpE3Ia/w9urI53/qNHUHDiTgN6jYuYXjcUFlCkTLG7Mfl9J?=
 =?us-ascii?Q?DCddRz5o18Kp02RNyMNDKJlyFnLnerPPr0Pt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 05:04:38.9478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d96869-6f89-454b-2b60-08ddc8dd42ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233

Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
so it shall better live in domain.c, rather than domctl.c. Which is also
applied for arch_get_domain_info(). Style corrections shall be applied at
the same time while moving these functions, such as converting u64 to
uint64_t.

The movement could also fix CI error of a randconfig picking both SYSCTL=y
and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
being built, which leaves getdomaininfo() undefined, causing linking to fail.

Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/domain.c |  9 ++++++
 xen/arch/arm/domctl.c |  9 ------
 xen/arch/x86/domain.c | 10 +++++++
 xen/arch/x86/domctl.c | 10 -------
 xen/common/domain.c   | 64 +++++++++++++++++++++++++++++++++++++++++++
 xen/common/domctl.c   | 64 -------------------------------------------
 6 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61b..2c2ef639ee 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1206,6 +1206,15 @@ void vcpu_kick(struct vcpu *v)
     }
 }
 
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    /* All ARM domains use hardware assisted paging. */
+    info->flags |= XEN_DOMINF_hap;
+
+    info->gpaddr_bits = p2m_ipa_bits;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..e0ea73005a 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -17,15 +17,6 @@
 #include <xsm/xsm.h>
 #include <public/domctl.h>
 
-void arch_get_domain_info(const struct domain *d,
-                          struct xen_domctl_getdomaininfo *info)
-{
-    /* All ARM domains use hardware assisted paging. */
-    info->flags |= XEN_DOMINF_hap;
-
-    info->gpaddr_bits = p2m_ipa_bits;
-}
-
 static int handle_vuart_init(struct domain *d, 
                              struct xen_domctl_vuart_op *vuart_op)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..4af9f41cca 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2639,6 +2639,16 @@ unsigned int domain_max_paddr_bits(const struct domain *d)
     return bits;
 }
 
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    if ( paging_mode_hap(d) )
+        info->flags |= XEN_DOMINF_hap;
+
+    info->arch_config.emulation_flags = d->arch.emulation_flags;
+    info->gpaddr_bits = hap_paddr_bits;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3044f706de..35572767ba 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -138,16 +138,6 @@ static int vcpu_set_vmce(struct vcpu *v,
     return vmce_restore_vcpu(v, &vmce);
 }
 
-void arch_get_domain_info(const struct domain *d,
-                          struct xen_domctl_getdomaininfo *info)
-{
-    if ( paging_mode_hap(d) )
-        info->flags |= XEN_DOMINF_hap;
-
-    info->arch_config.emulation_flags = d->arch.emulation_flags;
-    info->gpaddr_bits = hap_paddr_bits;
-}
-
 static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..b74d4c7549 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2440,6 +2440,70 @@ void thaw_domains(void)
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
+void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
+{
+    struct vcpu *v;
+    uint64_t cpu_time = 0;
+    int flags = XEN_DOMINF_blocked;
+    struct vcpu_runstate_info runstate;
+
+    memset(info, 0, sizeof(*info));
+
+    info->domain = d->domain_id;
+    info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
+
+    /*
+     * - domain is marked as blocked only if all its vcpus are blocked
+     * - domain is marked as running if any of its vcpus is running
+     */
+    for_each_vcpu ( d, v )
+    {
+        vcpu_runstate_get(v, &runstate);
+        cpu_time += runstate.time[RUNSTATE_running];
+        info->max_vcpu_id = v->vcpu_id;
+        if ( !(v->pause_flags & VPF_down) )
+        {
+            if ( !(v->pause_flags & VPF_blocked) )
+                flags &= ~XEN_DOMINF_blocked;
+            if ( v->is_running )
+                flags |= XEN_DOMINF_running;
+            info->nr_online_vcpus++;
+        }
+    }
+
+    info->cpu_time = cpu_time;
+
+    info->flags = (info->nr_online_vcpus ? flags : 0) |
+        ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
+        (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
+        (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |
+        (d->debugger_attached           ? XEN_DOMINF_debugged  : 0) |
+        (is_xenstore_domain(d)          ? XEN_DOMINF_xs_domain : 0) |
+        (is_hvm_domain(d)               ? XEN_DOMINF_hvm_guest : 0) |
+        d->shutdown_code << XEN_DOMINF_shutdownshift;
+
+    xsm_security_domaininfo(d, info);
+
+    info->tot_pages         = domain_tot_pages(d);
+    info->max_pages         = d->max_pages;
+    info->outstanding_pages = d->outstanding_pages;
+#ifdef CONFIG_MEM_SHARING
+    info->shr_pages         = atomic_read(&d->shr_pages);
+#endif
+#ifdef CONFIG_MEM_PAGING
+    info->paged_pages       = atomic_read(&d->paged_pages);
+#endif
+    info->shared_info_frame =
+        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
+    BUG_ON(SHARED_M2P(info->shared_info_frame));
+
+    info->cpupool = cpupool_get_id(d);
+
+    memcpy(info->handle, d->handle, sizeof(xen_domain_handle_t));
+
+    arch_get_domain_info(d, info);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf85..99de77380f 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -65,70 +65,6 @@ static inline int is_free_domid(domid_t dom)
     return 0;
 }
 
-void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
-{
-    struct vcpu *v;
-    u64 cpu_time = 0;
-    int flags = XEN_DOMINF_blocked;
-    struct vcpu_runstate_info runstate;
-
-    memset(info, 0, sizeof(*info));
-
-    info->domain = d->domain_id;
-    info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
-
-    /*
-     * - domain is marked as blocked only if all its vcpus are blocked
-     * - domain is marked as running if any of its vcpus is running
-     */
-    for_each_vcpu ( d, v )
-    {
-        vcpu_runstate_get(v, &runstate);
-        cpu_time += runstate.time[RUNSTATE_running];
-        info->max_vcpu_id = v->vcpu_id;
-        if ( !(v->pause_flags & VPF_down) )
-        {
-            if ( !(v->pause_flags & VPF_blocked) )
-                flags &= ~XEN_DOMINF_blocked;
-            if ( v->is_running )
-                flags |= XEN_DOMINF_running;
-            info->nr_online_vcpus++;
-        }
-    }
-
-    info->cpu_time = cpu_time;
-
-    info->flags = (info->nr_online_vcpus ? flags : 0) |
-        ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
-        (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
-        (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |
-        (d->debugger_attached           ? XEN_DOMINF_debugged  : 0) |
-        (is_xenstore_domain(d)          ? XEN_DOMINF_xs_domain : 0) |
-        (is_hvm_domain(d)               ? XEN_DOMINF_hvm_guest : 0) |
-        d->shutdown_code << XEN_DOMINF_shutdownshift;
-
-    xsm_security_domaininfo(d, info);
-
-    info->tot_pages         = domain_tot_pages(d);
-    info->max_pages         = d->max_pages;
-    info->outstanding_pages = d->outstanding_pages;
-#ifdef CONFIG_MEM_SHARING
-    info->shr_pages         = atomic_read(&d->shr_pages);
-#endif
-#ifdef CONFIG_MEM_PAGING
-    info->paged_pages       = atomic_read(&d->paged_pages);
-#endif
-    info->shared_info_frame =
-        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
-    BUG_ON(SHARED_M2P(info->shared_info_frame));
-
-    info->cpupool = cpupool_get_id(d);
-
-    memcpy(info->handle, d->handle, sizeof(xen_domain_handle_t));
-
-    arch_get_domain_info(d, info);
-}
-
 bool domctl_lock_acquire(void)
 {
     /*
-- 
2.34.1


