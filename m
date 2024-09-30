Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F498998D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 05:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806960.1218116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv7KJ-0004rW-6g; Mon, 30 Sep 2024 03:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806960.1218116; Mon, 30 Sep 2024 03:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv7KJ-0004p9-2s; Mon, 30 Sep 2024 03:43:59 +0000
Received: by outflank-mailman (input) for mailman id 806960;
 Mon, 30 Sep 2024 03:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYXA=Q4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sv7KI-0004MV-09
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 03:43:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36096aeb-7ede-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 05:43:53 +0200 (CEST)
Received: from BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15)
 by PH7PR12MB7872.namprd12.prod.outlook.com (2603:10b6:510:27c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Mon, 30 Sep
 2024 03:43:48 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::36) by BL0PR05CA0005.outlook.office365.com
 (2603:10b6:208:91::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13 via Frontend
 Transport; Mon, 30 Sep 2024 03:43:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024 03:43:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 29 Sep
 2024 22:43:45 -0500
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
X-Inumbo-ID: 36096aeb-7ede-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTTsR7Bw2tDis3VwPh3/BIgmUtuv0w3ra3Ls7w4GxF6SiMmCsCN7PwWGhCon5+cJZVYaQoDuD3KcU7Ln3dsd4ksTUzBV3FZD+t9Z8rAzAj+L8amIoM+plbsVxzeF9doHSKRoGu3GfinVNb0strx4d9DTO3BZMn+IcBy8u5JsGleFpBVBT9XceRl2DNOTQpsecVperV7FrAH/bNyN1soh9MqrS4ngLhgPUhYlkxX/OBRIcpHxfdQ3HHc9HQfBYYQgwJmwwPss5L5iDM9ELoiZvlVlQYZ71GCdeHN9EGFVv82rUR78Hdnr8MAOqtIhkeWvQnzi51kHBdOvO9bzJN2Exw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RuohG9icSgVUYVW6MN1en3ZCkZNi5BlBBb8+3ZcRWY=;
 b=Slbx+r/Vk3rKFz22Daa59lDxezJ7yR9btgTkGm6SPy9cMH+ddoyzqVThxOwhggWkXNfkAW7KBz5/N2S3lJg4jlfQyC3v5bqaryvyscptEzsP0gkm0XXdLmzx3lKl4MNsKUCm+ln0DEEFIBaiA23NUVqGYfTqud9Ay7IRc4Y6wsar6BlSEM+gOAEz5dSOLQSszHZmmCxWcxa5qjvdCwWor1ND3K/g3rTna39xjIz9QbX6sC9Y3AlR+z+4PVljxOYMrii1t8pSUXFj2eMx97FLZJ2rQPgdcrOePKfPrpKgy7D1Y8RFL97tyWAccJiSksRHS0qJK7IE5DF1LYN0G1SCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RuohG9icSgVUYVW6MN1en3ZCkZNi5BlBBb8+3ZcRWY=;
 b=cagrb3oefKVPgNHX0plY99+EwUBLvdlJBUf8K/At/1kWlYbIBVUi6/+n1JSvktbnpFX/I027z4Nk6EW5gSP9iLaVWUeCVzG/F1608OkxqzJGDU39DWFqN5YJ3CdzQbO/wwn+NxACCHnfKVNk/xM+nQ9wkgaBLW97/ohZjrCsCTQ=
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
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>
Subject: [XEN PATCH v16 2/3] tools: Add new function to get gsi from dev
Date: Mon, 30 Sep 2024 11:42:49 +0800
Message-ID: <20240930034250.2682265-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930034250.2682265-1-Jiqian.Chen@amd.com>
References: <20240930034250.2682265-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|PH7PR12MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5ad7fb-4e47-419c-33d3-08dce10217ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/mjMnCRR9NRiDvV/iu6zZuQfE+MUm1AJKd9KmUmKC5JW2R18+Tb+1AGVNpzW?=
 =?us-ascii?Q?nby0ugL9B0mah1U68AVeKREXWnWDmTcpV7w7NW8pVvQ3BEc3GstasDD8s4kc?=
 =?us-ascii?Q?AdvzkakS7MTh1GaS/fwaM86U4FTwfnTlO+5BicknaS0ZYKUxFH+xm3K7HIyW?=
 =?us-ascii?Q?d34dRV1Pd/OPZuEAEZrHns2sk9Zn+6ZEj3T+yV9wIy/u7G3WP0HYd7RQQbs4?=
 =?us-ascii?Q?LeCZ4pTei4uqmefqnybheTe1xP411uphRi0WlJrT24ySbZqoKBSVQWSMmg63?=
 =?us-ascii?Q?8YWVmDG0FAnw4SGJl6t/KOwkYFf94UgCiNmlhVAVwHvQ/TMb2dMEkp8/rGV2?=
 =?us-ascii?Q?VXqSbl+TCGuX6jS8P5F+UgHQXwO1dC7JeSalbp06vio2N5quCsVU2v52H6eG?=
 =?us-ascii?Q?xpGe62f5bpdYxRFPtmi1ar1+jZEkamUfdJL66QSD3j8GzPSLtVgvQ5v3jgzN?=
 =?us-ascii?Q?iEovnTZHzEodDiXLa6qCv/MtA9DkLr5zl3pgcj2w+gafd/tebPfPZUY3Jp5a?=
 =?us-ascii?Q?U8yJNhUT03da0YFXNZWfmBwQvCNxdH77wQaECeM49RkFpptULecVgoihdcIY?=
 =?us-ascii?Q?manR5Wtps9qBpjnCtsJZUOUcLYVAGQnZDRM2OJTLpm1lYSLyPQTHy94s+i/z?=
 =?us-ascii?Q?BaBzHDzudY10gMjZLYdku4ZGxglhQul2GlbnNnb/6wHWy4ZR9lWGzeH8NVU4?=
 =?us-ascii?Q?RFMDcZeISEJFO5A0LYSyXG7LKsew+zSp0W44g4WUUwBMCKvyDOk7r3x5dUvg?=
 =?us-ascii?Q?rIZoXcLmw5CHpzN9nwk6j6w+40nmwGfzaQORpSZMX6kAd5jNDpvZsHVOlrIN?=
 =?us-ascii?Q?Ls1f4WctJdMBGiJrUKjP9LuPpmYDbRHaI6pGA+S2hHIo9XuSp01gFUR0WaCh?=
 =?us-ascii?Q?KJoc9YRxs61CEPCrbtbB63pevqX69JfxIhy+S7Km0lMWGavZThZIeeI64q09?=
 =?us-ascii?Q?riKhGVKAL6gIUsC1ErrUX47rNcP09XSGzZ6mC427RfbFLfkTCXUfyMyffeJm?=
 =?us-ascii?Q?rK5a7n7nVH8n+MCN6Os2YIdp2Lm5EZ4Fx0L8/+04vM6Ccl4PcS4t5Majrgs/?=
 =?us-ascii?Q?jQVcLuQzYTcX1epKF5G1R1rMbVtMsikBnKsfHYqER2BxI5183nuHk8SX7lIz?=
 =?us-ascii?Q?Yu51IxcdhmOcuc6nIzvIbWtCPFp7/m3mSCbGhzZEkRDDSJT0ssGFgyOaafTJ?=
 =?us-ascii?Q?ptutdXFPGmBZ87SrMpwsvHgvftrLtpGZUK2kfTGaarbFaw9bSyq0ZAs4YckP?=
 =?us-ascii?Q?ZzYsV9XCe9h/ZIq/UTzBNeY7M+0alGDw8Ul8kXyrgjHPYJZ0Y3OhOxHe8HXL?=
 =?us-ascii?Q?FGfPIXDT95vjxrhyMPUI6cg0lDbbHnIRUYav+6GNJuNuksub1CvvwkT60rj+?=
 =?us-ascii?Q?CKadWZw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 03:43:48.6748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5ad7fb-4e47-419c-33d3-08dce10217ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7872

On PVH dom0, when passthrough a device to domU, QEMU and xl tools
want to use gsi number to do pirq mapping, see QEMU code
xen_pt_realize->xc_physdev_map_pirq, and xl code
pci_add_dm_done->xc_physdev_map_pirq, but in current codes, the gsi
number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
wrong, because irq is not equal with gsi, they are in different
spaces, so pirq mapping fails.

And in current codes, there is no method to get gsi for userspace.
For above purpose, add new function to get gsi, and the
corresponding ioctl is implemented on linux kernel side.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v15->v16 changes:
No.
And the dependent patches on kernel side were merged, so removed the RFC tag of this patch.

v13->v15 changes:
Add "Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>"

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
index 2c4608c09ab0..924f9a35f790 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1642,6 +1642,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
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


