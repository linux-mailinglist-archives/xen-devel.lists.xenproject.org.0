Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6BA71052
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927149.1329979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpr-00020v-GO; Wed, 26 Mar 2025 06:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927149.1329979; Wed, 26 Mar 2025 06:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpr-0001xY-CT; Wed, 26 Mar 2025 06:01:55 +0000
Received: by outflank-mailman (input) for mailman id 927149;
 Wed, 26 Mar 2025 06:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiR-00083W-F9
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:15 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2413::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1a35c5-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:54:10 +0100 (CET)
Received: from SJ0PR05CA0210.namprd05.prod.outlook.com (2603:10b6:a03:330::35)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:54:06 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::3b) by SJ0PR05CA0210.outlook.office365.com
 (2603:10b6:a03:330::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:54:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:54:05 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:54:00 -0500
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
X-Inumbo-ID: bc1a35c5-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtYgkYL7W/kLZx/ih1EH1MRM6G3DO5Aczj8mRdseFfGEHiqI+SytSMB11qBe7h1DjAxrmojrSkymkOoQCzie+IB8BNsYTP/jbF/pS4DKH7wKCS9lIQPARdnSXSlhLYtWdYPRl1giUblxtNyRxmd7bqAmHLEeGOuEkujdUrg/O6MGdk7NZvHBF/6O1B25WGBvg1ecSz897ArwcspfU134C98+yKjg7Mz80kE3r/+nsthPZy8slYMj5OUKwP84HcFvryc0QtW603toYIIWQMEcPGsA4YWHzLX1h0UAXyCklSRED53QiIqvUiNJfkfLlARv1vkAILYumY6akBYpV9mRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pExX0EhEq6NQuAUy7n8i+0cd/M0autycU9Pj7ACyk0=;
 b=cUxNTGBd27TrGH3JKu8gbKzVsu9jRBCfkRppTLxHI2HWgn+dodN4GOBrk2yCxzdCxhq4uZze+3jE0uaox5+mbqPrMaacemh6lsaSFxM91ED93g/z8YgtiqkzZhAub+TTH5RcEwyRiVeaqDwHEpR9vLCwvbX4KETa4rhUm3S6Hi2/HXVnuIPNzoPSIHNOXFn8vypjT/E0Ma5FizT1IkqxfrxFXlQ9Lxm2C8f3ve+LJ1/pDKoYP24GE+cn3xmqcUc2SXTTr+YbrHAkH/AjTU9dPLHin7Z/jRMdXUzkMn+osk7mpsBTfntTZBrwdSFG8TFvjsDrF3ur4mDYYvjnDk28xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pExX0EhEq6NQuAUy7n8i+0cd/M0autycU9Pj7ACyk0=;
 b=dYppyjr/IvYUglq3K3BtcLg5IYzbHWP29lmCSuplHYbRHeHpzkGzFL4xi+g1pMUtRfQzMerZn2HWN+rjgntdzL2gQ5l75n0yt5LtPmOmSs9NuSzWpqo7SdFrLnH9iPYsnltLtLa42O5eNH9nEnIjtVLlxrC2xwhW5LyiAxieBJU=
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
Subject: [PATCH v2 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
Date: Wed, 26 Mar 2025 13:50:49 +0800
Message-ID: <20250326055053.3313146-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b83f926-ac12-4bca-e438-08dd6c2a9e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ykkR//rwaVojzJ+zOHS4wBIfrcFBtXXosqk0ytCe1OKTHCBMf9gAMOWv6fKx?=
 =?us-ascii?Q?S5Wf9aki+ylaMkylVYoxng/B/kJCGspUYl3iFFsNLIzgRXek8GS+hzIzRz4j?=
 =?us-ascii?Q?nIQC88xEZzvNzREuUf52sErqM8HDw005rreCyo0csMTJKlWkCE6js08X9/2U?=
 =?us-ascii?Q?7PAxjR4hj1WLDYA4THpGq0D9pDrL9vxDAACoAiPfdUqe3/lVElWj21TdVEcB?=
 =?us-ascii?Q?eku8ZY5OLz19w5ER2to51bxtnEV9+zDozdc/doKW1THtVME+LTZbieNlrwwu?=
 =?us-ascii?Q?tPIjQCZktkO98j+1vRrDCsscKriUdVr8swDN4aoIUDfSbDUaMCtADfxBYksQ?=
 =?us-ascii?Q?98PlGompA1z0HT0B085WVDQOo7MqFTKL/XK6CAOCcrGiKdHqGhaOFjwMd4jG?=
 =?us-ascii?Q?hu13SLkM4vmtE4ThhC+Qbw84xjO4Mh19JuxMMuKnacBQJRyWX9iPZxICVtJ6?=
 =?us-ascii?Q?d6Bp30Sbj79nd2aG5mSkihAZOd+tS8lk/UM2oPbCGW8HEEW3Y3ZTAq2MJFR8?=
 =?us-ascii?Q?RgsLtVzzwwHBNPQsXCf+AVu6/H0/moIYXPz+1we/1oiwetJZipvnKe44ONlY?=
 =?us-ascii?Q?tptpBF2Vq0XA9f8qLignOJXKkKeth1/7+e6b3uN/NaGOBOfOla4qUAHco17R?=
 =?us-ascii?Q?l+fuOpMvcZTw0Ayp4UM0p50OsCvAt1yyjRwvYdxTjNi7Yj7Ok652XVVOF+V4?=
 =?us-ascii?Q?F94bbVg/+XNVWU7qiBrSQo2YylW/LoONcCWm9xCe7LgzNM4KxfuOgfno8DYR?=
 =?us-ascii?Q?vvDC4dmHk2WJj4ePTgJEhAZq1QyH7W2yhE7yqRfZzG5TJVl+orc2uv97cpfE?=
 =?us-ascii?Q?3pouXnxqgDlXKAQGfSuMj5sbFvuPShCjAy2hIjH+3dmWJVUPPKdQxmbAHmpY?=
 =?us-ascii?Q?Tj36tPXsM7APfr925Av+caR/9kQjlItnlphi8svpDytN9qqf8FzW8ZC38mUa?=
 =?us-ascii?Q?rXdStg5T0aB30YZKlheEgJu4udJ8sn/cEmyTqUxRpXczGp/6BLZ8xfgAqRFE?=
 =?us-ascii?Q?DKbimpjCfpuFqNIA2IiDV0F+1zsPUTYsEocFZuof+OQ33Cz9gYRxMgqP1IU1?=
 =?us-ascii?Q?rTHfhkNO8ffTw2cqdCJeiioH8xdyL3dXxqw8Z+DKvZB/mcty0AeI63aEWr6O?=
 =?us-ascii?Q?cRnjeBHIaRE1h7Di44jQNmNBM7p8G55pnfKyxq1APy6WJt5T8J8SD7DKUfJg?=
 =?us-ascii?Q?xxb/+t63PuaYi0EJvUO2fST7c+E0IcycNj9RHf3f9+8Xzf/Q7Atd/pJiCIEN?=
 =?us-ascii?Q?n3PJQnexfNkQyhKCQlGQ1hfT/+FEtqw26L6Co6j74wPsIqaWKo/ptl/jD5Cb?=
 =?us-ascii?Q?5ZQ3+ic4DzTPY1s9a6dmbC4YxiDBVl6Jw9gznDI0O4zs38qctq80aRxpW6qZ?=
 =?us-ascii?Q?bVZ1r/GSV1QZThQL50+T0/ysh8MCrgHGapw36hNFIj6jXSOMs26ETYpP3CJ7?=
 =?us-ascii?Q?MCRnsnnHQALYFBlGh9si87JH7Pt3jzRTjbuxR38YZYW0YEkl4IbNhyTbmMEp?=
 =?us-ascii?Q?M8pj+RYPyQXcYBE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:05.6714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b83f926-ac12-4bca-e438-08dd6c2a9e61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359

The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo
- get_outstanding_claims

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
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
index 5951b0ce91..7b3f748886 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
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
index 1b04947516..d7da476379 100644
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
+#endif
 
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
index ccce7fe963..76622503e2 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -258,7 +258,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = sched_adjust_global(&op->u.scheduler_op);
         break;
 
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_physinfo:
     {
         struct xen_sysctl_physinfo *pi = &op->u.physinfo;
@@ -301,6 +300,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     }
     break;
 
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_numainfo:
     {
         unsigned int i, j, num_nodes;
-- 
2.34.1


