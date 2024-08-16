Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA730954779
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778495.1188575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupM-0003IU-HL; Fri, 16 Aug 2024 11:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778495.1188575; Fri, 16 Aug 2024 11:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupM-0003Dn-9J; Fri, 16 Aug 2024 11:09:04 +0000
Received: by outflank-mailman (input) for mailman id 778495;
 Fri, 16 Aug 2024 11:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uc/1=PP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1seupK-0001Oc-FU
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:09:02 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:2408::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f05456ec-5bbf-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:09:00 +0200 (CEST)
Received: from BN9P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::19)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 11:08:55 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::e0) by BN9P221CA0014.outlook.office365.com
 (2603:10b6:408:10a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 11:08:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 11:08:54 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 06:08:51 -0500
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
X-Inumbo-ID: f05456ec-5bbf-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf6NK+uDqciD4+FVL0kooHFRBOgOFCPHsTQ0w4glt1Rod0fPPtw30fh5wCGFRUDCnSBr01jTAsSXZMPCoPzZYBHW5Jt1Q4sgUrL7UfnQ9v5DQKv776Tl6HKB3+ZO3tSbF837IuJhO755GE2A7RCqn9iwWAEbaPxW7YnuCB9sWFC+teYXy3RPT1tau6hKnV+69fK0vVEBvxvqsWIWKTKKMOAWCUNClkKT6mPDpPvZoLAAeau2dqc20NPvnCkd/UTMjKjVAYIOQCxzzgtqdhEpcWQQZ3VGmoAg+4cc8wi2KWpl3aBMBx2kVtjklDWyBxe19kmUK+weDq36ncI8ai74ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q0e1DukKo3wUcVPM7NjkIVTk+D+YR5G+Cd5OTV+f3Y=;
 b=DvrtlV4Gu+u2T/hbw9Og+iDtlSf4wby+YX6uu3zFTnsocCBCKpdzLsrUAzPHPacgzvseBVgOxOkAgiilvw6jfQ/lxrfUtucU5AkhgMdJAhBI3PQq1cqnNdqp+x1kx2wTNC+2jvPismISXLnptJaBhYbmPGQ26JOIvQyIH5gVB7UcDEf6HXVKft7qLwYiB4pMkz+d/p8jYEmKI7Sa/63R/LMCTHquL7kvwZ6oFZysMXXsWefxcADxvbPcNWT+viVVkG5WqvqRGSjWNZUQMUHYEiQs9TPJdG37E625KD1gr9HlByfjh9TVewMZjm8Nam5TznAfsdhj/rmw+wfUrKOAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q0e1DukKo3wUcVPM7NjkIVTk+D+YR5G+Cd5OTV+f3Y=;
 b=VYxp4SReaBBWfUBmr2CqDnHDpvAGRrRbbuP+i4lvXoHBh65BRzp+HBzJXRP1sQRnh/TWl6lWQQPRJF7p9JTS4fwsjrW/Ad4Y9vufRZbRshxwyek849XPTOsrKrJKnUaECuuBQ4viFhvOVh0qLLbxEn2EFMiYw+ecqRCmwnQ7tUo=
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
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v13 5/6] tools: Add new function to get gsi from dev
Date: Fri, 16 Aug 2024 19:08:19 +0800
Message-ID: <20240816110820.75672-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816110820.75672-1-Jiqian.Chen@amd.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 71663f5a-01f0-4762-bd44-08dcbde3d18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/+9tS5bJ6J0aMXjrRgww9AFJDeV8hexjKotOPXiKNnzRwMlHuZWtRE7g3ADF?=
 =?us-ascii?Q?cfvA4mmmOw/oAt7Q2CAQ99Vrv7O+r/DXrINHxQyjT9Yuoq0jO4PdVorsrnWD?=
 =?us-ascii?Q?7e6yVBp35xQEh9TOKxF0Ci0JmWwHDCtQF7XwN4mt01IMt+X649IL1eHiTDtx?=
 =?us-ascii?Q?eFa2NWNh8jzWBCEpgq9gf6GQDGVXfXhrfV8jFgNOua9voTSZ147g/qzmbjHy?=
 =?us-ascii?Q?MtekZOy2V52ohhUY3ElJzke0tmfWD/ndFcgItBpG0iWCfoikajY+v92x4TTU?=
 =?us-ascii?Q?aksFSsr/sZGZ02gvc1YeN2MW9lUP1DMXqfaCblXQWBaU+Y9eD5gQAO4zZf68?=
 =?us-ascii?Q?5X/H8KlwjaPv8ZBxvJIHjb605yaADtSC3uYsnO5DcNC+NvdnACUXERZH8OFW?=
 =?us-ascii?Q?jUFLV52VO8Ca9C7vq1lnRIpqv1emDAJbJehjCHXyDRwvv7hiPqgK5N+JXUvL?=
 =?us-ascii?Q?t9S42p1dcoUVYTxu4ctI23mYdR7N8ID2MgaRzQ0by6QF2IzHGjzjuso28Uat?=
 =?us-ascii?Q?ksDIvjjIEObsCELweF2zzLKwjLg88Ve+WWNVlJSDJbGPRAK3r3eljAuyqerE?=
 =?us-ascii?Q?zyFvPMNcH6HNnrritg8N/gpltzCmhnm+aK2GZmY5GNq7RcMb/Ulgv4pNMfrJ?=
 =?us-ascii?Q?YoLX9isUcSGYFY1E5lxEMotpBm/gy989UNd3PIJX8jtRz3I401gEcOwVtAjK?=
 =?us-ascii?Q?slhUmeYuPxKS4wEoU3ulo8/MuKYktx6WS8wjmYxRBZK7TSfenC2Ymu8IzBF+?=
 =?us-ascii?Q?Ct2aildqiN0SCJg4kpQNb1wQVVJkdCsBAnWds3sri+daN3DGoiLuNHEnLE2+?=
 =?us-ascii?Q?n4iaoG7SzEMsxeXTdrY4hJMNpIQnr5Cu26+n4BpDX0IsE/4tiL1FKgjj/e6p?=
 =?us-ascii?Q?926DG/Nyf8eSn71DY78BEmFnH8P6DLOu447QLY/2qO455gZsevDvjO011pCv?=
 =?us-ascii?Q?340AgNG3kiz+sJm0IjzXfEhhMjqYwJi/v6hbQ4qBxUuySx3U7aUdJrp1hiKE?=
 =?us-ascii?Q?h0vymmv/liyxEU7ZKywSnnI/mK90XVGJvwoR+At2BhTO4BullNlk4sQZ147X?=
 =?us-ascii?Q?Gqzdvm/KidH7HzxUZPHNqmxUfFHdv7EUavwe8pW0d0J29ZYcJDykpV2C0R0X?=
 =?us-ascii?Q?IR7BHkg6HNg7x3apHmrX3Qxk5O6Q0166kgZQxZBWoGXjkVDXtlkHa3yltM7b?=
 =?us-ascii?Q?xXhgOfiLmlRRG7aZeOYb0EhaZ28qw+CyLYxj6sXbHcZbxFJhuf9oC0y7Bssi?=
 =?us-ascii?Q?vwi6Nu6t9phroJLR/MkMXzqo8CrNrxZZGC8KcPLZNyaJFK+DFuNMdtnqbS9V?=
 =?us-ascii?Q?9L5mOMKnkkY1HRYr9wbGqMoAZHXzx1T2xiePwaOF8wugl5AMAZZSKWvNL9lI?=
 =?us-ascii?Q?OExF4s4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 11:08:54.9964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71663f5a-01f0-4762-bd44-08dcbde3d18b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822

When passthrough a device to domU, QEMU and xl tools use its gsi
number to do pirq mapping, see QEMU code
xen_pt_realize->xc_physdev_map_pirq, and xl code
pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is got
from file /sys/bus/pci/devices/<sbdf>/irq, that is wrong, because
irq is not equal with gsi, they are in different spaces, so pirq
mapping fails.

And in current codes, there is no method to get gsi for userspace.
For above purpose, add new function to get gsi, and the
corresponding ioctl is implemented on linux kernel side.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
---
v12->v13 changes:
Rename the function xc_physdev_gsi_from_pcidev to xc_pcidev_get_gsi to avoid confusion with physdev namesapce.
Move the implementation of xc_pcidev_get_gsi into xc_linux.c.
Directly use xencall_fd(xch->xcall) in the function xc_pcidev_get_gsi instead of opening "privcmd".

v11->v12 changes:
Nothing.

v10->v11 changes:
Patch#4 of v10, directly open "/dev/xen/privcmd" in the function xc_physdev_gsi_from_dev instead of adding unnecessary functions to libxencall.
Change the type of gsi in the structure privcmd_gsi_from_dev from int to u32.

v9->v10 changes:
Extract the implementation of xc_physdev_gsi_from_dev to be a new patch.
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/ctrl/xc_freebsd.c          |  6 ++++++
 tools/libs/ctrl/xc_linux.c            | 20 ++++++++++++++++++++
 tools/libs/ctrl/xc_minios.c           |  6 ++++++
 tools/libs/ctrl/xc_netbsd.c           |  6 ++++++
 tools/libs/ctrl/xc_solaris.c          |  6 ++++++
 7 files changed, 53 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55eb..607dfa2287bc 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_pcidev_get_gsi {
+	__u32 sbdf;
+	__u32 gsi;
+} privcmd_pcidev_get_gsi_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9ceca0cffc2f..82de6748f7a7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/ctrl/xc_freebsd.c b/tools/libs/ctrl/xc_freebsd.c
index 9dd48a3a08bb..9019fc663361 100644
--- a/tools/libs/ctrl/xc_freebsd.c
+++ b/tools/libs/ctrl/xc_freebsd.c
@@ -60,6 +60,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index c67c71c08be3..92591e49a1c8 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -66,6 +66,26 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    int ret;
+    privcmd_pcidev_get_gsi_t dev_gsi = {
+        .sbdf = sbdf,
+        .gsi = 0,
+    };
+
+    ret = ioctl(xencall_fd(xch->xcall),
+                IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
+
+    if (ret < 0) {
+        PERROR("Failed to get gsi from dev");
+    } else {
+        ret = dev_gsi.gsi;
+    }
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
index 3dea7a78a576..462af827b33c 100644
--- a/tools/libs/ctrl/xc_minios.c
+++ b/tools/libs/ctrl/xc_minios.c
@@ -47,6 +47,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
index 31979937621e..1318d4d90608 100644
--- a/tools/libs/ctrl/xc_netbsd.c
+++ b/tools/libs/ctrl/xc_netbsd.c
@@ -63,6 +63,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return valloc(size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_solaris.c b/tools/libs/ctrl/xc_solaris.c
index 5128f3f0f490..049e28d55ccd 100644
--- a/tools/libs/ctrl/xc_solaris.c
+++ b/tools/libs/ctrl/xc_solaris.c
@@ -32,6 +32,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


