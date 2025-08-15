Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A20B27E3C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083227.1442859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrf9-00070z-5w; Fri, 15 Aug 2025 10:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083227.1442859; Fri, 15 Aug 2025 10:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrf9-0006zY-3B; Fri, 15 Aug 2025 10:27:55 +0000
Received: by outflank-mailman (input) for mailman id 1083227;
 Fri, 15 Aug 2025 10:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6Ka=23=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1umrf7-0006z4-Iy
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:27:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2415::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f87e2e9-79c2-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 12:27:52 +0200 (CEST)
Received: from BN0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:408:ea::35)
 by BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 10:27:47 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com (2603:10b6:408:ea::4)
 by BN0PR04CA0090.outlook.office365.com (2603:10b6:408:ea::35) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19
 via Frontend Transport; Fri, 15 Aug 2025 10:27:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 10:27:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Aug 2025 05:27:44 -0500
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
X-Inumbo-ID: 7f87e2e9-79c2-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC9BKhdr7Ke/Z04kwEYLdOmvSNGpBJJrgzeqzocdZ/RehMR1F2mzm8L1Uh1JOvU0UsMWinP/0G8thvD765mNu3e5hTopEYs61h+OHBvyd/aJ/tlJQnhuelECpOhxaMmqsX7fS90Al3z0iCqbJOnsPMNuBxr3XnCu/z1IGPYi6wiL81WjfGh6GgpgPm7t/YxYflIPPHS37A8YSHDWrP9h0sg8nSciZlArzZmB++Bhw8BtyZFxMwYcXsFTm5m6D+sLQQWLfbOipOwvLpxyDqP8jYjZKjxIfkcCvYpXYDknFhbd4JWsaHrKX3suJE/J661LpUsbvzstYxmEUUs0kkrqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBvKK82tbyQNuu5z2qYEs6P3sS12pzw+UX3TGVc+xUQ=;
 b=nv7S69PLiXmWfmma+TMgkAB03TnkktMLYpcuP8+9/gVAE4KwAgmUrN/Ka1lkTuK7B8JKZ3eySLp9aXa52kAMKyv9Jnpbs0Ehv+riANhhXNxnLFg9ygxb3cZIrV8F8d2lbpP0+upAPB+H9btW/XrTiMObpmgdojrb2141w0I59OQRXKSV8qUguPEhXZvMDuNr62uVLOZYPXttTi5DZsVYV4VkqpWuIvrpovPPDHNpMoSoALfGTtUMtzbizGjYWmn9hGtzFstnzV51TMrdns3+JLyhvS8BQl1xbVcJVkGjZfQ6Qb6g+QMnfR3Kqa0YWnwJkYxdgB0/9nWq1y22/TU48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBvKK82tbyQNuu5z2qYEs6P3sS12pzw+UX3TGVc+xUQ=;
 b=c1v3heYdQEgoXDRM+3/04u+KjMHsI3kkLeFVGw1XDzGC5wECqdNaAGFY0dnyMvHidhSA+9zcs8z976RRBhAUVkN9xNpnw9NxVaq2waO62SNu2YPiflXppaQ1mENu0b1V1YxDM99uf113YnjfRJehLFh3+SxorFXiOu+KTx5nRc4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Date: Fri, 15 Aug 2025 18:27:28 +0800
Message-ID: <20250815102728.1340505-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 36de5d72-94f1-405d-d7d6-08dddbe660fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gc4gXHqmSwv6ko9NCFsnqogy7RkpNFAh2HCAXoVIPZfQsvt5EuzJKeARKpbj?=
 =?us-ascii?Q?5xBlHA/p0kRlNEbJmJMK7k8sT0X0wNd+kI90DJ2KZMOPD99vPKHfyqzH8ygU?=
 =?us-ascii?Q?nTi7kV592TcWzCctaJ4WjWb3XCMlkeLCliC8AfGs65CBRlOsgL8d405PVRts?=
 =?us-ascii?Q?e32ho1t937ZyckPZ+iVDgk3p1OnYCG3iphLlBRtMpmoA9ixqgTmg0ueyamDZ?=
 =?us-ascii?Q?rlIkogK00AKjaRsZnfegwdqY1tNmNzUb5AseGxg+woAyYbQQV7xjTPAr6wDU?=
 =?us-ascii?Q?Jatd9QtrOwsMOUDwbb92wiJcaR0oaFbo40CRLUaskpmRFtQBKMxsX7tmh4Zx?=
 =?us-ascii?Q?jyaO8AHhHBYsgh7w/9RfepBKjStD2z75GdXiZtPr/5HHBlLlkHn73b1J/g1m?=
 =?us-ascii?Q?3xu5Wbl6sugKV9u+DXYSogUSk/ekkd/Brj7zP8Vt+mOSPNzmRci+8AD0KHLu?=
 =?us-ascii?Q?isREylSqLj7mmPT55MtzWMQ1lVJtEAQxRWHjj+3nAKqOcFDLyvh0wpzbiiiA?=
 =?us-ascii?Q?/Ur/YplGnXhpaWmnXNTnuUCDAhABsC9YlZrcd6u3Jdch3IN21DNgDw3S38nU?=
 =?us-ascii?Q?2xTOM1x84ism8yj6oEKh44zaE7hy499uX2S9zz/k8P7rYcWHjbmr1dRmoHLv?=
 =?us-ascii?Q?2DAdtEX7cNzCljT6Volhhqbi5ZkmBIV0rpYRN8/dorvkXmeV6Pyw7WvN3ol+?=
 =?us-ascii?Q?P28D0f1WlCAnsJnJKpKaBB9lRcQP1vTmVr76nsbqPWQPqYnboRvmj0LQZoS6?=
 =?us-ascii?Q?tZyKSwuxPZI72nIh+YpkI9JHZO0BWDlkKjXseAZQfoF50Amu1B4TbvoeJ3D+?=
 =?us-ascii?Q?eas4QjuuMjonsONTJ0jrLYiFRtrJ/3JuTs8K+/qYJFOCDlQlS5ry12fyBSue?=
 =?us-ascii?Q?x1okX9rtGzDF8ePb6WyMaOe0w/Y+LKZdZuUwBKcjByTx0lOGhDSeYT8b/UqF?=
 =?us-ascii?Q?dU7G7SkkvTnPa6n4KjmXsWU2eUQ6W3qYxYJCQGjMbrarnihuLzaTiym96u/h?=
 =?us-ascii?Q?n4GjCIxVL3s+xtnDjoEtb0NooOufV6l59Ct9Uj21edFR7E0O2lVvZ3NkEa5r?=
 =?us-ascii?Q?tvssoU2xBlCZewXm1LCKqkrBLVoFOMqcblmfXq5PoghrnCBFDwFNN5DFPyiv?=
 =?us-ascii?Q?neU8gWDoUwKoIhZUol1B3gHOhqW2shAQoK7BsFN8tBCPKXqLa/9UZFqOHA11?=
 =?us-ascii?Q?7uhYRiiXLgXgSyKXwTEjwWbGPTQKlR5RueHmlU73E23ZgEAFU974qKe+yQ30?=
 =?us-ascii?Q?nk0nAV5Ah1QxKtC1NnJXWCPV1G7err6SPIUDBWC+NlC68DfUEHHji+MNvTbW?=
 =?us-ascii?Q?b0UUsYA78E4+XbaAGSKGCzZ4X0d/rUylAXvx4gc5y5VX/z2j5VN8TGrHawvR?=
 =?us-ascii?Q?bb0Y4wkxNb2k3pSmx7YVIZbxMmH0kh3RS/4C1Y5y0/0kc+Rv0f1KZo+/VTpR?=
 =?us-ascii?Q?Ut6eUkhJ1ibxLuIbxK+r+SGgxr7Wh041arRZwAHQvHVSVAc2QKltQjVVC1Ad?=
 =?us-ascii?Q?Rc3ZMdZY0iApWEK86jdLwHlU9wFf+lpwEQDi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 10:27:47.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36de5d72-94f1-405d-d7d6-08dddbe660fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510

In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
a few functions, like domctl_lock_acquire/release() undefined, causing linking
to fail.
To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
/hypercall-defs section, with this adjustment, we also need to release
redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
to not break compilation
Above change will leave dead code in the shim binary temporarily and will be
fixed with the introduction of domctl-op wrapping.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove paging_domctl hypercall-defs
---
v2 -> v3:
- remove paging_domctl change
---
 xen/arch/x86/Makefile        | 2 +-
 xen/common/Makefile          | 5 +----
 xen/include/hypercall-defs.c | 4 +---
 xen/include/xen/domain.h     | 4 ----
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5aab30a0c4..7676d7cdd8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,6 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
@@ -79,7 +80,6 @@ obj-y += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/common/Makefile b/xen/common/Makefile
index c316957fcb..756ddf52c3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
@@ -69,10 +70,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
-endif
-
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 8370b4b289..221dc25f6f 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -200,8 +200,8 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -280,9 +280,7 @@ hvm_op                             do       do       do       do       do
 #ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
-#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..33dd90357c 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -182,11 +182,7 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 void vnuma_destroy(struct vnuma_info *vnuma);
-#else
-static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
-#endif
 
 extern bool vmtrace_available;
 
-- 
2.34.1


