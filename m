Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1197B50FE1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117692.1463818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX0-0006QC-Ut; Wed, 10 Sep 2025 07:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117692.1463818; Wed, 10 Sep 2025 07:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX0-0006M2-Qc; Wed, 10 Sep 2025 07:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1117692;
 Wed, 10 Sep 2025 07:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQn-0005yt-6H
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2412::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c19d12-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:46 +0200 (CEST)
Received: from BYAPR02CA0061.namprd02.prod.outlook.com (2603:10b6:a03:54::38)
 by BN7PPF2E18BD747.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6ca) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:42 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::52) by BYAPR02CA0061.outlook.office365.com
 (2603:10b6:a03:54::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:37 -0700
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
X-Inumbo-ID: 51c19d12-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOufc3I+ge8YE0yMAEgUAtDJhVgbXJ7Wl+eeSoCptceKysyK6JZ9MOkPY6Z2O0qyOgFKRcQosp6XLXtIQiAFzBnjATAYrWCcZXOACuXEm+7wsNvwsykvpwWszvRhi0CXK/HN9mJv2NV9MQtE7IXXlNl4X2Veh4GumdeXTev5ZChjKlxSwucm517rZOpAB9XEiJXfZeTHvpBTwMWuwmJByG2pJWeSs6252MT1kOEY5OHt6FdDfy4XKQca+ul+y5lHoROR1GwycVx5y1jOLHGpUnNk3tJCwEZzkSh+Mhqi18xRQyXIXJbRKk0tAlXK5geLcqA1g+HkVX8jSGo749sx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52WwT+owHzY3V8/0eDU9osPAmiimtxakR45Na4sC7po=;
 b=LqX0uyRXuXzVkD+HYVgFqIUDEyUexJ4QV5SAmWydovMr5ROwjJP/58L0EJcKymM/KiuSY1AIx0aCfSujVzQl+NUfg8ljR8xU5LworeEJdhb8xkkNgePqsVYf8qV/qmnpdagEwim/z/27Y+Ax61f/494/IMPz/HNfWltP7+gfyRd0bNiegoiH/8jb/MbVD1lR/4MdVaRve9uUYmXRHK7NNk077q9RRFLrnFtX8/IDqquUxl2P5OTe/ZVkgxJZN8naq3Yg+4y6EWcP1RjdL3kKS9JHsM9ZvPYZga03xKGyQXu8GQbgCasogfdJwiWHXExH+H8fryojKGsalyQKrjBy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52WwT+owHzY3V8/0eDU9osPAmiimtxakR45Na4sC7po=;
 b=5bcaKGHbxp48+EWA6cDLmuUlYuaCZqaypLRvHj9hsMSXlz+XHeIvPf3B1oEt4y7cVcQPZzstuhnDIQbKtlxjfGB6bvVGk4GOmnZTosCXLIHqidDEzvZXjKK/2YACAYubIpKHFMmLOnrtbq/7yvdzjtQgLqfFVagJ5b+5t0+p8nA=
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
	<roger.pau@citrix.com>
Subject: [PATCH v2 14/26] xen/domctl: wrap arch-specific arch_get_info_guest() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:15 +0800
Message-ID: <20250910073827.3622177-15-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|BN7PPF2E18BD747:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c55dff-468f-4e98-4999-08ddf03d3423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u90JWf8H+Mnc+oxN3tEN5jmsWwVESsTuU6bo9qIiz4dgmpjaLLHNHnfvUdiD?=
 =?us-ascii?Q?TdyxbaCkeXVc0+a4oLHtmohc4bquXiaPHUXl4pr32i/xWKxsg8zAWDoZhi1j?=
 =?us-ascii?Q?5t+wcuWBXI8q/JMVkdDsN/2hVGMuOYImyZ/L4awOg4I3Q1BhiGYTvQfGqz9D?=
 =?us-ascii?Q?ZXZAlMDiZP3tkvi4EQKGcLman1/pxf3yKsvbiWdsGoqUCTf8OMt9YpLHFjRN?=
 =?us-ascii?Q?FHd4XKQFR2XzNyMl944bCzx3+Z5+5VrWvDsINdiciDWFyUB976iphmkGnNWE?=
 =?us-ascii?Q?DE7YTRVk8ozWXCp2sLnkBuF/YzHjqj6piVgLc+VSJ8WymQDdlRIgT1Wz+Ks/?=
 =?us-ascii?Q?kfgV3EiTmFFJr98tcaEKLTvn310ytSmgKvqvoA+NbCmZeYzNPvekLca6LfGr?=
 =?us-ascii?Q?Q5ZxZe+i61eyQKxrvrGLXJeN/eYyn9COpVBoNCtWu+aMJPiPLBCF0VMJ78FW?=
 =?us-ascii?Q?TXXBTtsSRS1a7GUlP3WuMwaT/+Dl6+J0EIBh3X0UjWhUTjZ2xI+Nf8V2Jmri?=
 =?us-ascii?Q?mzrcLHm1syJQ2Bfqu8sZ4Pq7DeBYzfh/x17w/ww7zFj4z4cfDODtNVF8k15E?=
 =?us-ascii?Q?h/IPF/iMJqmZ6VDDmdTNOUmv3NAMimH6H4LC6QUqyCCewt6DhvCsYyECCFVB?=
 =?us-ascii?Q?3StDyzZDsZEgkMVNhmFknmK69R+Fgd+r3/IH/VmDw61t+9kS1LPfGdXWcfxi?=
 =?us-ascii?Q?6DlTinEXLCb4lhGwvUjn1UdunwgIZiv/7/i3IjM/3aFN27WrwuixBmSs9/s2?=
 =?us-ascii?Q?5NKot9D572UXPAMbeRWsgfj3i4DYAkM+0DQYMIVq+WT3M7AinVVQpdJ+YldL?=
 =?us-ascii?Q?oprhDONZ7pSF9s3C0qEjxMXldXxD8aZOqpyjl+FYyzGKlaHSkWdCHo8A2OYv?=
 =?us-ascii?Q?kRtK4UrqO3tAWayzqABm+7ilm2Sy0XX9//tQZqloJjE03uPa47Vef7BSnYzn?=
 =?us-ascii?Q?t2nH0osz8iVHLWZQhU9l9iQs5uKJ0i1lrLG1ApMJEOxnXfV9PPMLtrYxaiSw?=
 =?us-ascii?Q?BKkj0Sz/So348orFfN1xZjyENIFK33N5Wy9iXRuy8AirM0UMaHFDF5yX2ECr?=
 =?us-ascii?Q?A2BJE135wFbABq2D9yzdmX5SeY82JviXafOMoQPEl6pFKtDXuXNAS8DrLVaf?=
 =?us-ascii?Q?u9T/JHbbGmR2mGPbGwnMuHfufw/E5ZJi2cpE77MT3QsEzS/4zuzakAODUWMX?=
 =?us-ascii?Q?QGsySMwiWZZlbRS29zZMljcYUkmmvtjMqmIL5E6qNxPhHPjuTLGgRGc+bYFU?=
 =?us-ascii?Q?N4h7KhVXT8y4wPuJe64b+ukwPz1JCTWCS9X4XVIkjgWqxeJ33ftri9BtjqPs?=
 =?us-ascii?Q?Diz9nhY6QEYSjQyf1BBGamttyYcq83abGbR4q80TjM5JoQZRD6wxo7FDvkAT?=
 =?us-ascii?Q?jIYrlatsvWweJ39dfU4msEwehIrx3lgXMrJYOVB7RkTwGl2Fy2czqT3cRExI?=
 =?us-ascii?Q?myUn+hHUw/0FWYrIOa6qVSfRRTRiVr874oTp9pvsHwxJuXRIRkCSBg//e1+q?=
 =?us-ascii?Q?ndwlJvP5KB9hkxowKSEfca0cWM1tf1kIJoG2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:41.4143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c55dff-468f-4e98-4999-08ddf03d3423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF2E18BD747

Arch-specific function arch_get_info_guest() is responsible for
XEN_DOMCTL_getvcpucontext domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS
Wrap XEN_DOMCTL_getvcpucontext-case transiently with CONFIG_MGMT_HYPERCALLS,
and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_getvcpucontext-case transiently
---
 xen/arch/arm/domctl.c | 2 ++
 xen/arch/x86/domctl.c | 2 ++
 xen/common/domctl.c   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..d3263e4d03 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -184,6 +184,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
     }
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     struct vcpu_guest_context *ctxt = c.nat;
@@ -199,6 +200,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     if ( !test_bit(_VPF_down, &v->pause_flags) )
         ctxt->flags |= VGCF_online;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 6153e3c07e..ea5f5b20cf 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1370,6 +1370,7 @@ long arch_do_domctl(
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
@@ -1562,6 +1563,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     c(vm_assist = d->vm_assist);
 #undef c
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 6660f13e9e..6048a87826 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -538,6 +538,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         copyback = 1;
         break;
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_getvcpucontext:
     {
         vcpu_guest_context_u c = { .nat = NULL };
@@ -586,6 +587,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         xfree(c.nat);
         break;
     }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_getvcpuinfo:
     {
-- 
2.34.1


