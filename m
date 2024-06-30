Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5691D1A0
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751118.1159039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlK-0000yW-RE; Sun, 30 Jun 2024 12:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751118.1159039; Sun, 30 Jun 2024 12:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlK-0000vR-Me; Sun, 30 Jun 2024 12:34:34 +0000
Received: by outflank-mailman (input) for mailman id 751118;
 Sun, 30 Jun 2024 12:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtlJ-0007C1-0B
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19c09400-36dd-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:34:32 +0200 (CEST)
Received: from CH2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:59::33)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Sun, 30 Jun
 2024 12:34:27 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::76) by CH2PR03CA0023.outlook.office365.com
 (2603:10b6:610:59::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Sun, 30 Jun 2024 12:34:27 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:23 -0500
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
X-Inumbo-ID: 19c09400-36dd-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3zHZGnV7mTWzDrN1HNBFclinj/tQ6f7o/+mXmQdELpkn3wVD5cpUsdgohcZD096dKbpfsVprLmGTonudpNlNgquQmZ4QoFI/eFCeHz5VE/4BiqQLbHi+YfOklY3FKYyhWgWuVyUNs7wL0TQ1I5QNbgZH9T6I1i6j71CqzA6UAh1E7RgD9UDmqawmhiY0XbrIqHoV12ROT4/QbHs+HqT+eP38BL1wzLtXzsJiR2vZAdNqNSNULfsvTurJLf9LlfTyj08g2fh7Nk7diV1vbzwQUVP8tLF8lVPq/+w/K4canv3Iws8xb3xhzW3nVdC8Ldiwe5GABljV3BpYwbkVt/9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIAxLkWzUDGgwfyYyLpTh1BgohmKm21ZOwTpKfup/7Y=;
 b=XxScAcqkyZif2w6nWwvdQkUHoUQ2KuPlxKCLOBc3fQN7D4OJw0K5bx6/2CpEu8dxj7bzX9NwH5g4HWpaUTHI0zejMl4JxRJ1tq3FRgziWH+A89rweO6qnqhZjveziVRN+IrL90KakvqEDlcEsZBBWi5jbVp1cc5OLhlGJCajBZZxukFaVIE3F+TiKels+sDJjzKMBZGY5Z0oCFKPkyx+ynuKMWisHsQsn226XHlrVCoMW737S+ifVeo4jySyT3CRmtjyUwgkM1s/ZL0C3O2FNE1xhXaaTZBlmQgIdnxFwvF5EOARF8Q9n5fUiTmDGm6Skhte90HvDw9JzlEXVErt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIAxLkWzUDGgwfyYyLpTh1BgohmKm21ZOwTpKfup/7Y=;
 b=FVmR+MXuyjslQBtzi9CVXw+uGnjvcjfjbJHcdNL4atPv5Wl9Vg6i5Xv41Zz3LXEBK5hNpwFvpR2qCy8+sTnmF8/Y53QFswZmR3b5/xfk239RF/BS1d7A9ipHsBi7tDMjxlZ15i27I/m70t1xjG67unysz5wfqhAKqZ7Subxn5cs=
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
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH v11 7/8] tools: Add new function to get gsi from dev
Date: Sun, 30 Jun 2024 20:33:43 +0800
Message-ID: <20240630123344.20623-8-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630123344.20623-1-Jiqian.Chen@amd.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 48011aa0-bc64-4c6f-a810-08dc9900fb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RuEtczyWJEJdY4TXgHYXmk/IUvt3l4xEwgoIH7zzKnmbDq9TXeURxFnUQbbm?=
 =?us-ascii?Q?AwrVuYOj2tFyfB4tvX7nFLdix3i/0gGHZHMpKj80eevTK7c0ABpIqCkW9B9e?=
 =?us-ascii?Q?U7MbcwGLvFshy2udbseeZerCUGChidDMUDUqiggOc9xF5j2Sm0BzG5m76Gdg?=
 =?us-ascii?Q?euqg3XZe5KTNnGki1mxR339YscWzQXmFDwQen8LtpRMhlcApybE2ePvwM6Pa?=
 =?us-ascii?Q?iim6N57LN5dwzhjO7ibahQqwa9ZK93NgSc5Hiqy0RiYzj9ZbX6wZZ7wDBfbr?=
 =?us-ascii?Q?zHY55dwSNfJFZSpBsssCpe63zYvsVyyQJrI2KQo+sZx8xgIOLP2Tqxo2/QQO?=
 =?us-ascii?Q?VzOS47f9RG0vkK/KX9kNeH9OmI1L9wDdhfN+BYaQjHKkhuS/rmrUrr3M5KOo?=
 =?us-ascii?Q?iVJxtLVQaXNVIgdKhVHPucu0yU4QHPMLkNFv7F44vsOfFCz2CRgZfRjgEIfv?=
 =?us-ascii?Q?EriQoq/LqQN40wPp4316xKG21c/4Ka+IWZNFfYq3hwaolg+RfjMCi60BxEMq?=
 =?us-ascii?Q?zv67tQY7JmmcJTQSoKSE1VVjM3xE2pbymZVunnxRC1JM63tMmZ1WLRTiGath?=
 =?us-ascii?Q?suZiTLjNKIjKwjVzrb3nU+CeUI3p+jQDcYrxD+eUREH1LGHEH6GBY9p2Pn1y?=
 =?us-ascii?Q?9T94J63qOw+jHzsFLOY5mz59FLpYtmHjcYc72KEfL/BYQQvsAZxE0vECFpZe?=
 =?us-ascii?Q?q7i1oMS99RUIsSr+3tE8H17idyDBPPzCZ0mq7KrLD16IrIYm+LugoqKI0rh5?=
 =?us-ascii?Q?uzH4lFIvoQCzzCDlqpl178U1JXgQ/i4a3SFeLGCdi09bQhKzUHgBT+b+Kz8+?=
 =?us-ascii?Q?tgxgf1vBTW7RjVzReoZLu5JTq93z0WCud0Jmq/9fxhmkF0KdPA2UHM3RVLzl?=
 =?us-ascii?Q?GU0v6eEIrI4drsMjYvugyWkaGeLg42UbmuE1RssDp+zyGNTRVKRE8XI1TeK2?=
 =?us-ascii?Q?f+Hk0OK+X8/s298aWFr0kSDzW7fpc/5/Q44VO/8kbOMh0EGefy65Scan4L3H?=
 =?us-ascii?Q?e4ArltwAZ4KNeMnqwfKNPxKABvHnjbo5tpQP6YUxZfq84T5/NQKR+bmtTs6d?=
 =?us-ascii?Q?B+/R/pvS38HB73WFOVndPTl2t9EmqsQNDZJJGAWdns1ok19WkojmwlWYpkh6?=
 =?us-ascii?Q?V9I1rXIDRZT595WsvwjgjTqbs1E4tBKdBQ2DbMROLZwDNHhN/KHDu/9ZjwsW?=
 =?us-ascii?Q?IJI+/uYRy/FZRjZAnz1TwJIbLlS3zMiehASZIGSbeL9zKXMWTaAG3OOX32X4?=
 =?us-ascii?Q?D8C3oCw1oQ4g0YinERa8IJdh6BMq7TPU/AlwOIlcs3HiMWHG7ZT9v+YxVjOM?=
 =?us-ascii?Q?BzVr8vLAvl1a3LHGS4uwOE1YUHHUXU33HJ4h9uz3ge9O9rpyCco2xnEaqDqs?=
 =?us-ascii?Q?0b9x/r0u3Immj/g95BElDdmt8mJB0CzQTrxeMMeA+xqFyCqBJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:27.4337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48011aa0-bc64-4c6f-a810-08dc9900fb4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575

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
This patch must be merged after the patch on linux kernel side
---
 tools/include/xen-sys/Linux/privcmd.h |  7 ++++++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/ctrl/xc_physdev.c          | 35 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55eb..4cf719102116 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_gsi_from_pcidev {
+	__u32 sbdf;
+	__u32 gsi;
+} privcmd_gsi_from_pcidev_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_GSI_FROM_PCIDEV				\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_gsi_from_pcidev_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9ceca0cffc2f..3720e22b399a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index e9fcd755fa62..54edb0f3c0dc 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -111,3 +111,38 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf)
+{
+    int rc = -1;
+
+#if defined(__linux__)
+    int fd;
+    privcmd_gsi_from_pcidev_t dev_gsi = {
+        .sbdf = sbdf,
+        .gsi = 0,
+    };
+
+    fd = open("/dev/xen/privcmd", O_RDWR);
+
+    if (fd < 0 && (errno == ENOENT || errno == ENXIO || errno == ENODEV)) {
+        /* Fallback to /proc/xen/privcmd */
+        fd = open("/proc/xen/privcmd", O_RDWR);
+    }
+
+    if (fd < 0) {
+        PERROR("Could not obtain handle on privileged command interface");
+        return rc;
+    }
+
+    rc = ioctl(fd, IOCTL_PRIVCMD_GSI_FROM_PCIDEV, &dev_gsi);
+    close(fd);
+
+    if (rc) {
+        PERROR("Failed to get gsi from dev");
+    } else {
+        rc = dev_gsi.gsi;
+    }
+#endif
+
+    return rc;
+}
-- 
2.34.1


