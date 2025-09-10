Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D22B50FE4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117707.1463833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX5-00074M-VK; Wed, 10 Sep 2025 07:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117707.1463833; Wed, 10 Sep 2025 07:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX5-0006zU-Je; Wed, 10 Sep 2025 07:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1117707;
 Wed, 10 Sep 2025 07:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFRL-0005yt-Gn
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 682d0fc8-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:40:22 +0200 (CEST)
Received: from SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::25)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:40:17 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::50) by SJ0P220CA0009.outlook.office365.com
 (2603:10b6:a03:41b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:40:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:40:16 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:40:06 -0700
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
X-Inumbo-ID: 682d0fc8-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CN5x0eLqcfcJtcgcSKCJM+A/mDez7z6VkJD62ExDpUYYfDQhNHWDvyQ4StqlFRnl+QaVU1idBr+PGMthl5uD3Txep6t22fOBThQcVptdBROuTsH796347V4qCxtWvRBPo6gw77m+43/Su36W3mdIBINSRCzjMw17hDZh3eCBMSCQ85E25+BUEKulP5of88TxWH1Ui4HQzqwMee4fA2jS5Ba2a49YVS0BWXuwcEsrdptW9RtC+30fX7NHB/HDDAEpwhumEjckEGqyQ9u4cUpxYP7f/C9wK/3uvO7DSMlARCwwS+d2taunvOYxoCq9wj6HjnqAC2UmzIW+tO7Xtkn7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXHAK3uL+WqLVQS8Xa7MII98ao1zO0m4LzYxceHy8E4=;
 b=gI6FecQg6rj9IlimLMGIKe93kBRhdYydvitEUAgqPjSmlwNkJGOzlJrvF8uBFxGffQQfghM0clvjVHO3Q4henJwv6GfPX3UtR08IJ6awNFwO9avw1uUkKzXUi6ktgliRbBNJ7IuwlIalloD+HequprTdHWR4EOpuJHfxQmJ0PokW8uR7ZXtU5/sMV/WO0cHQ94/VyghCLlEHGRvlTrvglIQRF+YPPdMGEZSg/NLNCYWf6HSI5SmaN5xbENZN+7c5udt42Vn6cwetX/PI2bsakunYn2t7kczj7iDi0ztujUmQykwbwrIiaUvJ9EhyEHdjzwXRU4P8d0rYZCGVvt2niQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXHAK3uL+WqLVQS8Xa7MII98ao1zO0m4LzYxceHy8E4=;
 b=ETAjYkMXebEVLMtDf1O3oWUASrosYTkwGifcp1GQqQNWGmNJvhCCjFB6+lFkgCBqhcIlK9c1+DYLqG8Natn65P0C7OovAXUq3neJ+x5V7o9Op6UO7ylMSXCvkKkrO/S6OWf/6eWL9u+zxrnOvKv2JS9jRJETt61StWisO7mZF8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 26/26] xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:27 +0800
Message-ID: <20250910073827.3622177-27-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f821b7-7250-4afc-60cb-08ddf03d4954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aDvpUA0jZDkY7g5o1Tp0+n6GRyTTZ9l6pY889AwuPDpvIa0PgWXabPltKnIh?=
 =?us-ascii?Q?j/b7JEGZw8BEUhFROzTA9ewBfURM0d7B5x8v9kCt9U7vnhzB3vASMbTx+AlV?=
 =?us-ascii?Q?FH6ZC7v7PM0LLZB/K7KKYg2IuqYPla3EEEXvHFaC7afxzkc5/syP0AoyvUcg?=
 =?us-ascii?Q?XTncD0AYxN5KVy0Xv+XVGw0BwUXuKHFrAVLO276q/wvkMvOmezaAu2fUunJO?=
 =?us-ascii?Q?DFYCIMQ10BmyHd35+ppGiXUhNLDVqbDDHneKn05igiB8nymda5S5NO4gOzMa?=
 =?us-ascii?Q?t3IZpg9PvJP3mq9DxcpJbwlVjoLNoyd8NTHYKLhAvRba+uQta6x3WL6Ha2RV?=
 =?us-ascii?Q?lkJiVnZ/vWePigQ3jTU8b+vBOr44TCgkHKw8ovEA3vP6+b3W4VlvvdIbzxXe?=
 =?us-ascii?Q?u/DXfVBCuLNirrermheyYQC9wlNpQzwx5L41LKPWLHFKAabZUbZ9LKONtb4r?=
 =?us-ascii?Q?7wWVAvj0Nph/zpexJ7/7cooLJCmQ5J+YdinutcfFe5xh30BLvRuM41mVYXUX?=
 =?us-ascii?Q?uZISNroU4klqfEGcjFqa8ScGeR3YO3EL/npjzv58s/1C7aFqqvlxSVajA/Lr?=
 =?us-ascii?Q?2e/CqMqfWZouWhNe3qhgKD03zzgaFoXJA9rS7PmA4Cj9x1JIPUb8PY/RP4bg?=
 =?us-ascii?Q?ETeNWtVvFKSZZYFB7tJT0P8L1UQXrGUnefeH7vLREEsh3vKDRlmhcXhQItpb?=
 =?us-ascii?Q?oE4PNy+r4surKBl1l7lq5SUEMVQjW+dObPiRNQFEVOH/jVb/uBZFnSwxYbVi?=
 =?us-ascii?Q?pQFoGOgSS3mwl8IdG+CvXu/A51nhnEgVEoLVuKYGMBqIWWMSzAyaEedrLdDt?=
 =?us-ascii?Q?vyPxJN8sot6wDUdXBIgwFe8P5sqQOVQHezJVQEoOnvAbyhrVRdXclwmK7lvk?=
 =?us-ascii?Q?+q+VnE7l48P8pdnyv47P1xGMfDvKenQoFitb4Zj+1+WCFOYQDDk/Q7L0wnFQ?=
 =?us-ascii?Q?wYZ/lMQMneXUBwBhXMFH9gF5YAI9DBAenZM9175dYdSkqz0TcWirRalJkWIu?=
 =?us-ascii?Q?CgQa5ytZJU2PNbWeq61/8peygLdQ2c3LB2NwRIdB8Qn5ZkkPsT0nUyNxm8L2?=
 =?us-ascii?Q?4tHGLgqjroBY9vniWLuo8HY16RG4O7+4oNgmsvaNKG68ELh06AIVbG2QfrH3?=
 =?us-ascii?Q?QnWIJqgENEf1aCRJhb/q/fLC9UXdVEeoIGJoruQZQ7voL9Dl3jv9w2xj4rY9?=
 =?us-ascii?Q?f58RGrZml1g5zPSIXsK5YBgnus/fN2d2EJt7y/1+t4GYgEuXouXdzOQGOYTa?=
 =?us-ascii?Q?vBzEjlMhw/WOTuMKTiW1z9vjPud9XTe4xmUHn7N7n7ywF6g1bZU7JD99s3nU?=
 =?us-ascii?Q?g7EzqE0niaBQ+smNVu3+5JpCmvCBUgRQuCvEMyxm2LWXFDpDTkYpMJuPuX90?=
 =?us-ascii?Q?Z5GgqXXrpp4ckauXnsVsQeLAYw6xIUdFJwyw0klDxQ8bPJuq2sC78pPPUmah?=
 =?us-ascii?Q?hn0eP9h5lPOoEx5XRX7V6zshN3jHSTbxUVpGMv/ToiuAK+iEjqs6uZL1ibCK?=
 =?us-ascii?Q?qAZOJkrJvIP/DQcnW7lAaulqHbklDD6M2Lvp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:40:16.9751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f821b7-7250-4afc-60cb-08ddf03d4954
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739

Wrap domctl hypercall def and domctl.o with CONFIG_MGMT_HYPERCALLS,
and remove all #ifdef CONFIG_MGMT_HYPERCALLS wrappings in common/domctl.c
With MGMT_HYPERCALLS=n, we need to provide stub for
domctl_lock_{acquire,release}(), as it may be invoked by hvm_set_param().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove stub in common/domctl.c
- combine the original commit of "xen/domctl: provide stub for
 domctl_lock_{acquire,release}"
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/common/Kconfig           |  2 +-
 xen/common/Makefile          |  2 +-
 xen/common/domctl.c          | 24 ------------------------
 xen/include/hypercall-defs.c |  4 +++-
 xen/include/xen/domain.h     |  9 +++++++++
 5 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 1aedd00b12..da207a7183 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -654,7 +654,7 @@ config MGMT_HYPERCALLS
 	help
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint via managing unnessary
-	  hypercalls, like sysctl, etc.
+	  hypercalls, like sysctl, domctl, etc.
 
 config PM_OP
 	bool "Enable Performance Management Operation"
diff --git a/xen/common/Makefile b/xen/common/Makefile
index fdf826f218..45c0bda000 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,7 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domid.o
 obj-y += event_2l.o
 obj-y += event_channel.o
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 5657b95089..71e712c1f3 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -44,14 +44,12 @@ static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap,
                                    MAX_NUMNODES);
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
                                      const struct xenctl_bitmap *xenctl_nodemap)
 {
     return xenctl_bitmap_to_bitmap(nodemask_bits(nodemask), xenctl_nodemap,
                                    MAX_NUMNODES);
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
@@ -114,9 +112,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 
     memcpy(info->handle, d->handle, sizeof(xen_domain_handle_t));
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     arch_get_domain_info(d, info);
-#endif
 }
 
 bool domctl_lock_acquire(void)
@@ -394,26 +390,22 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_pausedomain:
         ret = -EINVAL;
         if ( d != current->domain )
             ret = domain_pause_by_systemcontroller(d);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_unpausedomain:
         ret = domain_unpause_by_systemcontroller(d);
         break;
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_resumedomain:
         if ( d == current->domain ) /* no domain_pause() */
             ret = -EINVAL;
         else
             domain_resume(d);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_createdomain:
     {
@@ -473,7 +465,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_soft_reset:
     case XEN_DOMCTL_soft_reset_cont:
         if ( d == current->domain ) /* no domain_pause() */
@@ -510,14 +501,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = domain_set_node_affinity(d, &new_affinity);
         break;
     }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_getnodeaffinity:
         ret = nodemask_to_xenctl_bitmap(&op->u.nodeaffinity.nodemap,
                                         &d->node_affinity);
         break;
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_setvcpuaffinity:
     case XEN_DOMCTL_getvcpuaffinity:
         ret = vcpu_affinity_domctl(d, op->cmd, &op->u.vcpuaffinity);
@@ -527,7 +516,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = sched_adjust(d, &op->u.scheduler_op);
         copyback = 1;
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_getdomaininfo:
         ret = xsm_getdomaininfo(XSM_XS_PRIV, d);
@@ -540,7 +528,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         copyback = 1;
         break;
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_getvcpucontext:
     {
         vcpu_guest_context_u c = { .nat = NULL };
@@ -589,7 +576,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         xfree(c.nat);
         break;
     }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_getvcpuinfo:
     {
@@ -750,11 +736,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_settimeoffset:
         domain_set_time_offset(d, op->u.settimeoffset.time_offset_seconds);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_set_target:
     {
@@ -810,11 +794,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 #endif
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_set_virq_handler:
         ret = set_global_virq_handler(d, op->u.set_virq_handler.virq);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_setvnumainfo:
     {
@@ -842,7 +824,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = 1;
         break;
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_assign_device:
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_deassign_device:
@@ -863,7 +844,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_set_llc_colors:
         if ( op->u.set_llc_colors.pad )
@@ -884,11 +864,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     default:
-#ifdef CONFIG_MGMT_HYPERCALLS
         ret = arch_do_domctl(op, d, u_domctl);
-#else
-        ret = -EOPNOTSUPP;
-#endif /* CONFIG_MGMT_HYPERCALLS */
         break;
     }
 
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 02d7b93e80..cbd547f724 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -200,7 +200,9 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
+#ifdef CONFIG_MGMT_HYPERCALLS
 domctl(xen_domctl_t *u_domctl)
+#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
@@ -279,8 +281,8 @@ hvm_op                             do       do       do       do       do
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
-#endif
 domctl                             do       do       do       do       do
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 11d2505420..19dd85150a 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -151,8 +151,17 @@ void arch_dump_domain_info(struct domain *d);
 
 int arch_vcpu_reset(struct vcpu *v);
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 bool domctl_lock_acquire(void);
 void domctl_lock_release(void);
+#else
+static inline bool domctl_lock_acquire(void)
+{
+    return false;
+}
+
+static inline void domctl_lock_release(void) {}
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Continue the current hypercall via func(data) on specified cpu.
-- 
2.34.1


