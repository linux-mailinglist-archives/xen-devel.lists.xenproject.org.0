Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B876A94D5C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961048.1352686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6llg-0004k7-2U; Mon, 21 Apr 2025 07:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961048.1352686; Mon, 21 Apr 2025 07:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6llf-0004hA-VZ; Mon, 21 Apr 2025 07:40:39 +0000
Received: by outflank-mailman (input) for mailman id 961048;
 Mon, 21 Apr 2025 07:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljl-0000OX-IA
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2412::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3a7525f-1e83-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 09:38:39 +0200 (CEST)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by DS7PR12MB6310.namprd12.prod.outlook.com (2603:10b6:8:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Mon, 21 Apr
 2025 07:38:33 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::b) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:28 -0500
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
X-Inumbo-ID: a3a7525f-1e83-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF/FCEYDLtc3Dzm+o2FpMJLNflzBfpmzahAaPCwNFLazWTP7IW5YmJ+aoeR0+jReh4eFKaFvdt22UogzJl6WcGs8Md3+aQYQe+WeRIB7iQiDZio2q3ys4uekY0kFy79H076oPJXxEWMm6A+HqjqOG4B4rMaiR8fDnd/LX8UefaBJQ5K6kuPpwHHQXWd4a547hXdv61qM5edRu1RPpCno+RkppgIaIa9bDJ30aziCb4japaTSKAGI//ai8JaUHNuhHXoWnass+xslEvBzBRDI23X8n71nNGyAO2HC7d8gSnE2/Cu9+kYOkyWTYkiF80QYLEbGGDDxsQzAEaS2b7Bz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWwDXkvXuRz0vOu+dnmem7tV0xovLzB6Mu4anTEiFcU=;
 b=eLP6ynwC0JFdx6CsUMhCytsM/VSOL2BdwGUEyRyIWaZEsQ7gQvhG/t5FZZBmZXG+Gewwkm7ZV0h67VFR0LHx0WBFElibIEvyUEkPbywxzDAr3ZQ3O1HDdWreFGRxhfr23bkrK4BVjHwBu4hTguIvAdQOpz1oIUue1Kt1wo5YI8hXUSzvsgtCwsZ3tH8RKNKQxpxE4GsnW2xZFifBSBpcY+cQ+SwlzO4p/cdGsGqIXardws+jYqAszImO/SomrNaRnZwbbJYbkoNojGuzx27vg6xdozsfV9jvn8Zq74TRlKjdr1VAfLKJIr6C6OqNk7k4u2VwCKNJUosd9e3uZKKFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWwDXkvXuRz0vOu+dnmem7tV0xovLzB6Mu4anTEiFcU=;
 b=ZtUR8JZNpOaOmpeN6YuBRiEC3yZMelwnevD6ZbqOiYNLkW8OkKnPBEDdK4QUsLaAXtOwMudUWgk6R4SqiCNZTZqocj9JpKlB7D8i11a58k3CDbEOyv4/XxfnO8ekyuJTA0NxWm3mBPryuNm54Fi5W17V/2Ig8juBm/tNrBaUI1g=
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
Subject: [PATCH v3 16/20] xen/sysctl: wrap around XEN_SYSCTL_physinfo
Date: Mon, 21 Apr 2025 15:37:19 +0800
Message-ID: <20250421073723.3863060-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2cecbc-3430-4f5f-ab2b-08dd80a784aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0eyjZcfU+yjGVwfbJD/sGtP2x62xqYA80weWLtIx0fJEbXOlP74jwVcVSuQp?=
 =?us-ascii?Q?3GLkQdzReWfAKIrohAVvJ86n3d28p5k8RYA0PK68o8Z8fwgJpeWwoNSnFkQM?=
 =?us-ascii?Q?TzyMBBMJTF37AAphYu0RIEVmtbiPGom/N+hEuKtsoWoz3GNfkOlB+a7aiVFt?=
 =?us-ascii?Q?jO4DpoKVjnui3E2mt7G23P/sN2XKkJJE7fsrOC/lRF9y2XHnLcdK2UAd+/CO?=
 =?us-ascii?Q?uhU79InR34IE2aLCQVxC+kXfxoCcKp/wFsxIHv+9nyWjfHu98j1sXFC0JdDd?=
 =?us-ascii?Q?EngYpZUnqf0uWAOrx7W/5U00UgFjtoNqap9uExYnbgb+gP7wzJsxYxnjV+bM?=
 =?us-ascii?Q?8IQs64180p3AVfKQ80YNlkehME6okn7NSoQgjrjSwhu/3sHjiQgjm8Q6M8gz?=
 =?us-ascii?Q?x6+6v9fX2D2lWTpqvv7q1IjpwdVe5Au2vsOLdNNREzEAWfjrJsW0eB8RqWhE?=
 =?us-ascii?Q?AJ6kh5KjeqG9tyJHidy8mERQzNPKZ59flioiym9puOIJYlHnXX4VBL7yvh1z?=
 =?us-ascii?Q?PlRWPme0SOOZuS9kJAEN04CYa31N22e9LMxbealS3eCsotBowYTOrpCLQ7Gi?=
 =?us-ascii?Q?GuyGo3pUjqkrO3iGz/rXJYsYBH2dANdaEpP2l606NGy44P587Cb+xgDf8hEn?=
 =?us-ascii?Q?UqPCJcIkUDGOKlZU2ZcnwlZT3dLHwWXKyx32eT2u7fC/MMbs24FgGIQBQLo2?=
 =?us-ascii?Q?27uH75G2BqjErUYAPM+e38eXQc2oNwJYq2C51oKgCnZTHTr/spnRogcjbXb4?=
 =?us-ascii?Q?DJL5A6dkpQDzvA6gRP/ATSvreGZU4GxwPK5RBAaqYq9kZjrFsOkpkoDHEyJf?=
 =?us-ascii?Q?0rJqu/4PAtSp7BUJpXJl7KG60XLIvxvP/vlUfLmFlMxunXdpx3ns4bD651d5?=
 =?us-ascii?Q?oDx8rCgZcY3W2R1ei4fQ73ylzzHx+Dt8XnMUDuP9c3o6i9cU1JXA0VaegW0g?=
 =?us-ascii?Q?O+8JHEQRdU5M+RTKzjjH8Tk3pUSmDKYAkIp0EjXgD81+TppoK8fHg0Pfc95o?=
 =?us-ascii?Q?3oaBtgjrPhyGDjY1yOP54Hh4yabY+5LwjqmT6a10QEMh9Evsf9diw8p6Qy5M?=
 =?us-ascii?Q?9fugEqiX9DmwWoYkNIHDyM83HXRF7gDZn9el5ABIX9B//E7dUl4Blm3ojc9q?=
 =?us-ascii?Q?56Zb8Nal4b4CvpaxF9Sk69SYevr+JxwjWcuK2yfp2r265nW6MdY9tbw34u2t?=
 =?us-ascii?Q?ZyrVEPJTjDOsxxJIfNYo3kCHPTZZZ6pg1g3GsI57pzzKmDBdS5vh3+FeNDZ3?=
 =?us-ascii?Q?10nWTSjNHzXhLFGTDQG8wZ3Ln//T3fu6wXgDrWPbaZTWbaJW3EgcGdcIju1P?=
 =?us-ascii?Q?ClAWxBLopc3G8+cY4akMbkhscG+tLhv+HAvswUIBu1GsGhks18N0xy5+z3Kp?=
 =?us-ascii?Q?TWPUG+0O19M0eCQibGJDJR4uScGeJBXahO0E3/8ZzKI8hYRFObeJvwNesZ/x?=
 =?us-ascii?Q?fImxDuXpbknVZ+F87e3SrqaA5ClM8cFqjmry1ukhO0icKG2w/LXfWJpt5GGO?=
 =?us-ascii?Q?pufMrnhL3Ew0Fov1IFj8pMYd6dIHNr2HLBgt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:32.9719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2cecbc-3430-4f5f-ab2b-08dd80a784aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310

The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo
- get_outstanding_claims

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
 xen/arch/arm/sysctl.c   | 2 ++
 xen/arch/riscv/stubs.c  | 2 ++
 xen/arch/x86/sysctl.c   | 2 ++
 xen/common/page_alloc.c | 2 ++
 xen/common/sysctl.c     | 2 +-
 5 files changed, 9 insertions(+), 1 deletion(-)

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
index 83416d3350..295456d0c8 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -321,10 +321,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
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
index 5803a1ef4e..36424a9245 100644
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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 200e0a0488..b4feb07e60 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -260,7 +260,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     case XEN_SYSCTL_scheduler_op:
         ret = sched_adjust_global(&op->u.scheduler_op);
         break;
-#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_physinfo:
     {
@@ -303,6 +302,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             ret = -EFAULT;
     }
     break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_numainfo:
     {
-- 
2.34.1


