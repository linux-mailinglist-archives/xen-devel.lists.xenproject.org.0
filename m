Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E7B50FB1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117607.1463748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQj-00018e-6M; Wed, 10 Sep 2025 07:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117607.1463748; Wed, 10 Sep 2025 07:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQj-00015B-0r; Wed, 10 Sep 2025 07:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1117607;
 Wed, 10 Sep 2025 07:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQh-0005yt-4V
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2413::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5131ef70-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:44 +0200 (CEST)
Received: from BYAPR11CA0058.namprd11.prod.outlook.com (2603:10b6:a03:80::35)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:37 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::7e) by BYAPR11CA0058.outlook.office365.com
 (2603:10b6:a03:80::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:24 -0700
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
X-Inumbo-ID: 5131ef70-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC4uUqyltw5vGItxPZ/zqEYWGhRZHIW8EK7/YP+IrMIHIiT3ftUzhy5em5ZawxvEyp7Z4SIfAbDx30DGK2sl1dyD46hPg6LF9OpS1OrFSwRBHKppMjuqYzpk7YR98eX1JW2o/ZgGLVEpPhAzxT2o+tk/VmQ54AeFv1PGdOlzJOSDGo8r0qZTRq9rBTD2ps59f7EDuq6rDORjoiRZzze/dnCGBA2lnoXl7gceUH3q8MZ4zqaf/+bQzQ5KEfnglMcOa8L0qd6a0boTJudUeNDu1rN3SfGsVW3/Cxozd7r9yumvru83s9twKQcyCoyQhr3TaN6y+bC6AxuU0nvHQN3Tpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq+CA+zLJhXvuE0ShxLvIZ5qcSI/7xz/3Fi/Dd8+moA=;
 b=qZec2R9DBjkcd4vezsazPqBZgbF2liD9S35kgCa6ycTNzlbwFh0GGazQvUPLB5QwlxvqlLXaBlYSL4MzTq+3RWdNN74O9LDtn9YCvxEer1KhzJv6sXXAZ/gx4Cw+q1GCG28vWoEJccRPEVc//9rIlTmmeYUjRG31RqCli6s/k6YcH5RnKocgEwQ0VKf1jY9CBq8F9nQs0KKauKgGUpNnWivhoVT3zli8mUYGwUN19liDTw3JH7n7EMIoo0Wwvh4WmIhbuFtHSu8XO5o4f/rD6aSTk6cRch8NvxPRnAYP5BrNamQO7jM4xz5+HyvexToUG+O5+uwQNoGOd4H6fZNODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq+CA+zLJhXvuE0ShxLvIZ5qcSI/7xz/3Fi/Dd8+moA=;
 b=ty/x+WBkoeJ15Ip2ZTSDEHU3e5nChCBt7wbRXCDoBWb6HiXOvjmD2Cch0NT/PbMrjFy7iFg8/Ru3IO43J8se2kxMfwdTI7Xhyg8RMAFAiddxjt529gTsfm1bMHowylw1c1nW7xb46y6SZTONwpHUWHSDpCUzGWndAd4AMRvc9fU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v2 10/26] xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:11 +0800
Message-ID: <20250910073827.3622177-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 2316dd43-d060-4201-2487-08ddf03d3149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fObpvZwNLj+LjZmgBHhLmcdAi2r1N+RFqoUcqT9V5kyPt7V9b5gmM9hGlcNx?=
 =?us-ascii?Q?pN/QCF/qD+mPETgUOJhFBDxahRnyx/KXqowKNQIPnJ34U2Co7XPMxRbI7sCR?=
 =?us-ascii?Q?ctiLlcJagsrNNmFS4EUcL+7EU5LFRfxPdoPwlBROsolA8BkOvbWsGq6IdpQZ?=
 =?us-ascii?Q?Zq12/hPKoX/klFUZDH6v3bx2G6sWp1jMdR6hBXsKK21ktnIXJ3KD4dW9HXZ6?=
 =?us-ascii?Q?5ZO0Vdh0ss53BAfO5miythUV95Ll0FAV08iL4CLmGkYXNIvFA3hNEuNbpBlh?=
 =?us-ascii?Q?wQrGuYcGGQKEjphDGipN8h3h+x/rwSS0x4jnv6yexXlxVIvuSuawpd60+5RZ?=
 =?us-ascii?Q?TRx3YGbSsAT0hC+V1lsBPeEo54vUO7Ihtu3dVeM14tP5hnSlJJb61kpMh3Wt?=
 =?us-ascii?Q?nyMC6cbkEYLAmuw9o8dcpxBBVN8lGaa4TNXuGlDmdNtgOfgmfggJMra+eRiQ?=
 =?us-ascii?Q?dzKmVLVNVJ9N0hwdD/t7Bpsa+PMcx1w7sQG7FmP5tzqw3xZKSe1/ssJdhNvT?=
 =?us-ascii?Q?ifcgIAor04qMs6lEoDoRwoGIjsQ8uAbdu8BME5KXHET1cnLwSNN6j+1MEjUb?=
 =?us-ascii?Q?MVFvYJTUXrwePqCQZnwORU/RWxcTV/DK5e5gtHmiZYWLdwNDxtTgGqi8PAyJ?=
 =?us-ascii?Q?bYuk+dqHbFqycIrxvEmmQKbxVdP+hb56hnzdSHYj0VDHOXCc2BcQXl03DNcx?=
 =?us-ascii?Q?u+6UhxxZm1lEc1SBw68guk3PUVnbeKabNL1JtkOnxUV3jL88iwV3quFnQdtp?=
 =?us-ascii?Q?IyyYnN/D+MWpxP+V2c88hxE4OQOgRZ1l0+QbU+MNu5SZTd16WLqJ6ErP4+VO?=
 =?us-ascii?Q?3A6+rDfJnKm7mtJEwlVxpBBq+gFwPD678yOB//y1kM0HP0nvs3ktf7FeOnKU?=
 =?us-ascii?Q?l5WjpIfeXmnd6e3g643/6KIsxoCv8BoKdu5pYbST7tRUt3K7KYfeieDaubwf?=
 =?us-ascii?Q?JTgidCY3HW5vdohFcOpMVzIHAB9zhb4e4GkidtsZowkO2d+zI1PuPBUHEd7y?=
 =?us-ascii?Q?Y8Csa3Hga3uu7qShfVINXdzuEWdLmYacLRi85BEIyEInci+5Bcjuoqk6Nwit?=
 =?us-ascii?Q?hOI59Er06sZpzGge69LhJG7L6PL9jlRehrPhSbMHwbN9lGWnjHfnTOANv3/q?=
 =?us-ascii?Q?mDDUecP1ywQGUgGwiIVItF01FsOQatD97nt1EH5J7X6vd3SOnWUB2tgYAdwm?=
 =?us-ascii?Q?SF2pYwRxWDO1GcNIvzWbEbvu2O19D9jRGWNVQrG7ki9WysI38tjTJRPjZsTl?=
 =?us-ascii?Q?vpUyD/KZ/ADwH/etXmNOsgXeDHK45K8Iv9t57BH2j8lFKyR8NysMgExtNKpf?=
 =?us-ascii?Q?C95QFQpCMWr0IJ6bZ9Z/YIUbbJNkwEisd74QshNqj1MdYzfP/CiOJL+A4HQ4?=
 =?us-ascii?Q?TFXX4BkpZXxd8fH18IRdLW72md3WXPka86i+JrHtPtCDzYco7yPWaWw5ejxH?=
 =?us-ascii?Q?ACZUgn3l8X0tIIrk4Vi98m8ERiHPehvjSoJGFMJemBLW5DjHdaq7G6gyKMu4?=
 =?us-ascii?Q?dZkBLRjFI29OjqQgmyuaT5R5gTJPlcDczKLw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:36.6289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2316dd43-d060-4201-2487-08ddf03d3149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269

Function domain_kill() is responsible for killing domain and relinquish
domain-held resources. and it is only invoked under
XEN_DOMCTL_destroydomain-case. So it shall be wrapped with
CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following functions could also be wrapped with
CONFIG_MGMT_HYPERCALLS:
- domain_relinquish_resource
  - pci_release_device
  - relinquish_shared_pages
  - paging_teardown
    - p2m_pod_empty_cache
  - relinquish_memory
  - pit_deinit
  - iommu_release_dt_devices
  - tee_relinquish_resources
    - ffa_relinquish_resources/optee_relinquish_resources
  - relinquish_p2m_mapping
  - p2m_clear_root_pages
Wrap XEN_DOMCTL_destroydomain-case transiently with CONFIG_MGMT_HYPERCALLS,
and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_destroydomain-case transiently
---
 xen/arch/arm/domain.c                 | 3 +++
 xen/arch/arm/include/asm/tee/tee.h    | 2 ++
 xen/arch/arm/mmu/p2m.c                | 4 ++++
 xen/arch/arm/mpu/p2m.c                | 2 ++
 xen/arch/arm/tee/ffa.c                | 4 ++++
 xen/arch/arm/tee/optee.c              | 4 ++++
 xen/arch/arm/tee/tee.c                | 2 ++
 xen/arch/x86/domain.c                 | 2 ++
 xen/arch/x86/emul-i8254.c             | 2 ++
 xen/arch/x86/mm/mem_sharing.c         | 2 ++
 xen/arch/x86/mm/p2m-pod.c             | 2 ++
 xen/arch/x86/mm/p2m.c                 | 2 ++
 xen/arch/x86/mm/paging.c              | 2 ++
 xen/common/domain.c                   | 2 ++
 xen/common/domctl.c                   | 2 +-
 xen/drivers/passthrough/device_tree.c | 2 ++
 xen/drivers/passthrough/pci.c         | 2 ++
 17 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 30ff9dac46..3e7f40ab01 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -995,6 +995,7 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(struct domain *d, struct page_list_head *list)
 {
     struct page_info *page, *tmp;
@@ -1145,6 +1146,8 @@ int domain_relinquish_resources(struct domain *d)
 
 #undef PROGRESS
 
+#endif /* CONFIG_MGMT_HYPERCALLS */
+
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index 15d664e28d..f4187c5dc3 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -40,12 +40,14 @@ struct tee_mediator_ops {
     int (*domain_teardown)(struct domain *d);
     void (*free_domain_ctx)(struct domain *d);
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     /*
      * Called during domain destruction to relinquish resources used
      * by mediator itself. This function can return -ERESTART to indicate
      * that it does not finished work and should be called again.
      */
     int (*relinquish_resources)(struct domain *d);
+#endif
 
     /* Handle SMCCC call for current domain. */
     bool (*handle_call)(struct cpu_user_regs *regs);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..30d6071e91 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1243,6 +1243,7 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
     p2m->need_flush = true;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * The domain will not be scheduled anymore, so in theory we should
  * not need to flush the TLBs. Do it for safety purpose.
@@ -1262,6 +1263,7 @@ void p2m_clear_root_pages(struct p2m_domain *p2m)
 
     p2m_write_unlock(p2m);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Invalidate all entries in the root page-tables. This is
@@ -1556,6 +1558,7 @@ int p2m_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * The function will go through the p2m and remove page reference when it
  * is required. The mapping will be removed from the p2m.
@@ -1626,6 +1629,7 @@ int relinquish_p2m_mapping(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Clean & invalidate RAM associated to the guest vCPU.
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f7fb58ab6a..c44297a9e3 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -57,10 +57,12 @@ bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
 
 void p2m_flush_vm(struct vcpu *v) {}
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int relinquish_p2m_mapping(struct domain *d)
 {
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void p2m_domain_creation_finished(struct domain *d) {}
 
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1d0239cf69..f9ba9b60bf 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -469,10 +469,12 @@ static void ffa_free_domain_ctx(struct domain *d)
     XFREE(d->arch.tee);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int ffa_relinquish_resources(struct domain *d)
 {
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void ffa_init_secondary(void)
 {
@@ -623,7 +625,9 @@ static const struct tee_mediator_ops ffa_ops =
     .domain_init = ffa_domain_init,
     .domain_teardown = ffa_domain_teardown,
     .free_domain_ctx = ffa_free_domain_ctx,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .relinquish_resources = ffa_relinquish_resources,
+#endif
     .handle_call = ffa_handle_call,
 };
 
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 5151bd90ed..1ed0fd231d 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -632,6 +632,7 @@ static void free_optee_shm_buf_pg_list(struct optee_domain *ctx,
                  cookie);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int optee_relinquish_resources(struct domain *d)
 {
     struct arm_smccc_res resp;
@@ -693,6 +694,7 @@ static int optee_relinquish_resources(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #define PAGELIST_ENTRIES_PER_PAGE                       \
     ((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
@@ -1727,7 +1729,9 @@ static const struct tee_mediator_ops optee_ops =
     .probe = optee_probe,
     .domain_init = optee_domain_init,
     .domain_teardown = optee_domain_teardown,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .relinquish_resources = optee_relinquish_resources,
+#endif
     .handle_call = optee_handle_call,
 };
 
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..a8e160700f 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -65,6 +65,7 @@ int tee_domain_teardown(struct domain *d)
     return cur_mediator->ops->domain_teardown(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int tee_relinquish_resources(struct domain *d)
 {
     if ( !cur_mediator )
@@ -72,6 +73,7 @@ int tee_relinquish_resources(struct domain *d)
 
     return cur_mediator->ops->relinquish_resources(d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 uint16_t tee_get_type(void)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5b3c5e8caf..314de75d8e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2298,6 +2298,7 @@ void sync_vcpu_execstate(struct vcpu *v)
            read_atomic(&v->dirty_cpu) != dirty_cpu);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(
     struct domain *d, struct page_list_head *list, unsigned long type)
 {
@@ -2622,6 +2623,7 @@ int domain_relinquish_resources(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_dump_domain_info(struct domain *d)
 {
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 144aa168a3..f106ab794c 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -651,6 +651,7 @@ void pit_init(struct domain *d)
     pit_reset(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void pit_deinit(struct domain *d)
 {
     PITState *pit = domain_vpit(d);
@@ -664,6 +665,7 @@ void pit_deinit(struct domain *d)
         destroy_periodic_time(&pit->pt0);
     }
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4787b27964..d7cbf2047b 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1393,6 +1393,7 @@ int __mem_sharing_unshare_page(struct domain *d,
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int relinquish_shared_pages(struct domain *d)
 {
     int rc = 0;
@@ -1449,6 +1450,7 @@ int relinquish_shared_pages(struct domain *d)
     p2m_unlock(p2m);
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int range_share(struct domain *d, struct domain *cd,
                        struct mem_sharing_op_range *range)
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 05633fe2ac..4e915808f4 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -366,6 +366,7 @@ void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
     pod_unlock(p2m);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int p2m_pod_empty_cache(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -409,6 +410,7 @@ int p2m_pod_empty_cache(struct domain *d)
     unlock_page_alloc(p2m);
     return p2m->pod.count ? -ERESTART : 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int
 p2m_pod_offline_or_broken_hit(struct page_info *p)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e2a00a0efd..c1a87cde27 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2097,6 +2097,7 @@ int xenmem_add_to_physmap_one(
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * Remove foreign mappings from the p2m, as that drops the page reference taken
  * when mapped.
@@ -2160,6 +2161,7 @@ int relinquish_p2m_mapping(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
                          unsigned long nr, uint8_t *dirty_bitmap)
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 65455a6867..116389d4e9 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -768,6 +768,7 @@ void paging_vcpu_teardown(struct vcpu *v)
         shadow_vcpu_teardown(v);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* Call when destroying a domain */
 int paging_teardown(struct domain *d)
 {
@@ -794,6 +795,7 @@ int paging_teardown(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* Call once all of the references to the domain have gone away */
 void paging_final_teardown(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 34e2e501dc..5d81ab3045 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1230,6 +1230,7 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_kill(struct domain *d)
 {
     int rc = 0;
@@ -1280,6 +1281,7 @@ int domain_kill(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 
 void __domain_crash(struct domain *d)
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 278a00b141..0f20e8941b 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -488,7 +488,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                 ret = -EFAULT;
         }
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_destroydomain:
         ret = domain_kill(d);
@@ -496,6 +495,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_setnodeaffinity:
     {
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index f5850a2607..015ffa15d4 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -108,6 +108,7 @@ int iommu_dt_domain_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_release_dt_devices(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -136,6 +137,7 @@ int iommu_release_dt_devices(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int iommu_dt_xlate(struct device *dev,
                           const struct dt_phandle_args *iommu_spec,
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..cd855108c2 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -945,6 +945,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1003,6 +1004,7 @@ int pci_release_devices(struct domain *d)
 
     return combined_ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #define PCI_CLASS_BRIDGE_HOST    0x0600
 #define PCI_CLASS_BRIDGE_PCI     0x0604
-- 
2.34.1


