Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0191F9AE021
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 11:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825035.1239228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tnv-0002cR-T9; Thu, 24 Oct 2024 09:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825035.1239228; Thu, 24 Oct 2024 09:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tnv-0002aO-QA; Thu, 24 Oct 2024 09:06:51 +0000
Received: by outflank-mailman (input) for mailman id 825035;
 Thu, 24 Oct 2024 09:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spah=RU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1t3tnu-0002aI-Rg
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 09:06:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2009::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cda584d-91e7-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 11:06:49 +0200 (CEST)
Received: from CH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::25)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 09:06:45 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1ee:cafe::49) by CH5P222CA0009.outlook.office365.com
 (2603:10b6:610:1ee::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Thu, 24 Oct 2024 09:06:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.2 via Frontend Transport; Thu, 24 Oct 2024 09:06:44 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 04:06:41 -0500
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
X-Inumbo-ID: 4cda584d-91e7-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgpr/OBiDIe+0KVRf/zqO5HlkDeMtYbtzMaMOa7+Xg1CzY1dGGocCfyw/Yv1PT0b/1dTzTuJODgfU8p260jyGXCHYsKzYmIjes1iT2cV8zUm1wbIOQjTa8j6Pdm8y1D4qw8+0txJnemS3kidDYBKUZeYo88w0cfHH6kQaOVQ4uVeR2nU44A8pK/MKhg8F2kxyVW6XWkZBHJkOlTvowV81ZriVoOB4SjYKNefs73zdR9z5D2K3j3ow1c6iP0qp66DZnXb8+9aWDVd+Qk6l8d+JRpoY6q7w2EkTsJyRxwxI2uVpwM4WkZ0Axlc+M7MvuaXwjHXJRGayVapMgazFw4qNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gbYu2XjGHbSV+SaOmQmDxswd2t/pv2OR5bJk+IJ4Ts=;
 b=F/07GKuAudz6PFhJd+eK4w84JFXnSuDL4DlOVpvtZ77bGZGfuDkuq5oVNTABwCsAVouA8AELv0fNQA67+w/O81aLbWx87LzQJbHgDnf5LpMLWyy5N0+6UWGgA+bnv6cvnGrjVnShkzwgJvC2ZOZYtzOZpUs5hlO7k8fFrRym78h6OXpcrhu5rfGpCZi8GVq9w2UnI02yEmEUwjl1ryIn7Sbit7ihXS3dSbRxEigo+M2VT0j9VbC2oU/8IuBD21oCZqpb1reVMskD85bxxkV2yZiP5vUOS3pZFgmUG4Pkz6q2VypRYMPvapgqOLBHXTXWf1gizkb8lliSoeMV35Kwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gbYu2XjGHbSV+SaOmQmDxswd2t/pv2OR5bJk+IJ4Ts=;
 b=N+m6FWreWMmRMHBTTDC7fl4DYdgtjqAzpBOwzN1qJJ8h/ZGCMCi+P8y3gWj3c6goEWivAL+HF8QdN8CAW/GcFZ/1Itwzs6aZGrmHwPRZ3XdQcV4ZMUrIBgf78VE5NnstvtdiaOQE8KV69ylQ/rf/8cvNME5iszLuMFyI0P+yosI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0 is PVH
Date: Thu, 24 Oct 2024 17:06:29 +0800
Message-ID: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0ab48c-55b2-4176-d515-08dcf40b2f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eTxMlpZhSY8gCKqANwH7iMMv00dbXew0/LUc1wj87edygN1YDa9IwZ8OUHO1?=
 =?us-ascii?Q?pkC16Q3wRlw+3oOPPlQ49eIcsCJPImPTRTQLrsXRNJxxQUIhISpWVkWrGeTr?=
 =?us-ascii?Q?klWXLV7/SHHC+FahLIVwFz3kltebwHMSVvyUGu+GbiacAWUmlSlDNl7MAJTh?=
 =?us-ascii?Q?Ho1tejDUu+RVdYd9WhhC3LTYhVQxIIYI6cotGzcPMhxThUAYNLfZ2UWUFQxX?=
 =?us-ascii?Q?r5otjDZYwsc+QHnErvVkvUufoOX+jDs8duBGiKU372jjgBMwrTsMaJ1mvpSE?=
 =?us-ascii?Q?NIq1vZ8xGclTQTKxda5Crz4Vs3LaR9wTdygRE2JOE6LHl0RH0Gb2rKu+DfgK?=
 =?us-ascii?Q?RGQuVlyG+cQoqB+Ug+LluSk/5DtcXsfQQmgibn8s5HeOqUIVOk2xfu5Z1nJ4?=
 =?us-ascii?Q?uA/q1nqZF+YMiagOEZ0Ri0N8m9P35IVIuMbgn61Ib/FpBLPL1S7SOHjYWve7?=
 =?us-ascii?Q?6QINu2FKdMl/bynj0UGlUJtfdq1eNbBv/wvpLUBYMHddEPuydoxTPAu615RD?=
 =?us-ascii?Q?3EK46bcQGpZedjLPD5u/0PbVe5mn5Ae3EcqulfMjGGZ/VvOvF+vK0SKGvk6U?=
 =?us-ascii?Q?4lJKBeHH9YDDmCsFh9hes10hPgv+SM0K1cj4WUX1rVE5hvODbPaZ5bZT6QT+?=
 =?us-ascii?Q?U8tV9EQ8uZqt/gs4UQkDuuK3YpwCIgx4Ueb4+8vuHd8sBnkPJ90QeodvYjci?=
 =?us-ascii?Q?p23T2E/K0asXoJY8ZJjQoErOPcglrVA/8V6/Jv9BCHP0M4tBO0OMpwg6S7Sq?=
 =?us-ascii?Q?QTw7Y2fLQNQqm1MHBt6ZFzo18h1Lwx1VOW4lcTzACivvg4qNR7SpRXtA2D0c?=
 =?us-ascii?Q?+kovzhtuq//lyQ+9Mu+og7F6Z2pk4nGltZ0UDDZcSnKhqkW4vPhqfRPtgOVM?=
 =?us-ascii?Q?6sxms1lYKCqwIqwAYcgIGRxc+JgnEifpcjPJLNx2FhyG8cOzT3I/+le1srpo?=
 =?us-ascii?Q?7JYOCuMiqmCCsi81Zkl9HVuZB1ZidxNervLvpi9Ld7sCuhg3e1YGxTF2gV7X?=
 =?us-ascii?Q?VMgnYRHyg4Q+xIvXibLsfUzeCiZ4t6r9KfvvIA6d0yQVK5d0OLuJQyaRYQ7+?=
 =?us-ascii?Q?A/95inv6+CZ+gFIEc284hhu6zXmPqrfH5i1MvJomHjgWityIa4VHP9lz2Z+s?=
 =?us-ascii?Q?UKbViw3NBY829HTdCc5KsrCMsEQ9fecwNMJQURzjI6Lu7r7PRGBc3xZjua1K?=
 =?us-ascii?Q?2P0yRZ8QPMohK4rUySdiR7SWURhcvsCOdZ+YsaAFfJJfvDL/r9qLaC0j1a2n?=
 =?us-ascii?Q?kaosCmL9vA9+GSFq6/ZuW5AWS9B7knS4/h4Pj63ZPrXarFLrgPaX8w4z3E/c?=
 =?us-ascii?Q?tSnrEnZBqYcnTcexqYjr6OPfiZwOwmhCcs5BBbeIgNONYdptjTQTqstVUrqj?=
 =?us-ascii?Q?GEWR6F0VDHc1cGTvUBF4s8yq1yEcib6mxxKUOSy+oV+hGluECw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:06:44.9952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0ab48c-55b2-4176-d515-08dcf40b2f0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338

In PVH dom0, when passthrough a device to domU, QEMU code
xen_pt_realize->xc_physdev_map_pirq wants to use gsi, but in current codes
the gsi number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
wrong, because irq is not equal with gsi, they are in different spaces, so
pirq mapping fails.

To solve above problem, use new interface of Xen, xc_pcidev_get_gsi to get
gsi and use xc_physdev_map_pirq_gsi to map pirq when dom0 is PVH.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi All,
This is v9 to support passthrough on Xen when dom0 is PVH.
v8->v9 changes:
* Moved the definition of PCI_SBDF from /hw/xen/xen_pt.c to /include/hw/pci/pci.h.
* Renamed xen_run_qemu_on_hvm to xen_pt_need_gsi.
* Renamed xen_map_pirq_for_gsi to xen_pt_map_pirq_for_gsi.
* Through reading /sys/hypervisor/guest_type to get dom type instead of using xc_domain_getinfo_single.

Best regards,
Jiqian Chen

v7->v8 changes:
* Since xc_physdev_gsi_from_dev was renamed to xc_pcidev_get_gsi, changed it.
* Added xen_run_qemu_on_hvm to check if Qemu run on PV dom0, if not use xc_physdev_map_pirq_gsi to map pirq.
* Used CONFIG_XEN_CTRL_INTERFACE_VERSION to wrap the new part for compatibility.
* Added "#define DOMID_RUN_QEMU 0" to represent the id of domain that Qemu run on.

v6->v7 changes:
* Because the function of obtaining gsi was changed on the kernel and Xen side. Changed to use
  xc_physdev_gsi_from_dev, that requires passing in sbdf instead of irq.

v5->v6 changes:
* Because the function of obtaining gsi was changed on the kernel and Xen side. Changed to use
  xc_physdev_gsi_from_irq, instead of gsi sysfs.
* Since function changed, removed the Review-by of Stefano.

v4->v5 changes:
* Added Review-by Stefano.

v3->v4 changes:
* Added gsi into struct XenHostPCIDevice and used gsi number that read from gsi sysfs
  if it exists, if there is no gsi sysfs, still use irq.

v2->v3 changes:
* Due to changes in the implementation of the second patch on kernel side(that adds
  a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.

v1 and v2:
We can record the relation between gsi and irq, then when userspace(qemu) want
to use gsi, we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall
to get gsi from irq) records all the relations in acpi_register_gsi_xen_pvh() when dom0
initialize pci devices, and provide a syscall for userspace to get the gsi from irq. The
third patch of xen(tools: Add new function to get gsi from irq) add a new function
xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success.

Issues we encountered:
1. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device's gsi to pirq in
function xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq,
but qemu pass irq to it and treat irq as gsi, it is got from file
/sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get(). But actually
the gsi number is not equal with irq. They are in different space.
---
 hw/xen/xen_pt.c      | 53 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  4 ++++
 2 files changed, 57 insertions(+)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 3635d1b39f79..5b10d501d566 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -766,6 +766,50 @@ static void xen_pt_destroy(PCIDevice *d) {
 }
 /* init */
 
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
+static bool xen_pt_need_gsi(void)
+{
+    FILE *fp;
+    int len;
+    char type[10];
+    const char *guest_type = "/sys/hypervisor/guest_type";
+
+    fp = fopen(guest_type, "r");
+    if (fp == NULL) {
+        error_report("Cannot open %s: %s", guest_type, strerror(errno));
+        return false;
+    }
+    fgets(type, sizeof(type), fp);
+    fclose(fp);
+
+    len = strlen(type);
+    if (len) {
+        type[len - 1] = '\0';
+        if (!strcmp(type, "PVH")) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static int xen_pt_map_pirq_for_gsi(PCIDevice *d, int *pirq)
+{
+    int gsi;
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
+
+    gsi = xc_pcidev_get_gsi(xen_xc,
+                            PCI_SBDF(s->real_device.domain,
+                                     s->real_device.bus,
+                                     s->real_device.dev,
+                                     s->real_device.func));
+    if (gsi >= 0) {
+        return xc_physdev_map_pirq_gsi(xen_xc, xen_domid, gsi, pirq);
+    }
+
+    return gsi;
+}
+#endif
+
 static void xen_pt_realize(PCIDevice *d, Error **errp)
 {
     ERRP_GUARD();
@@ -847,7 +891,16 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
         goto out;
     }
 
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
+    if (xen_pt_need_gsi()) {
+        rc = xen_pt_map_pirq_for_gsi(d, &pirq);
+    } else {
+        rc = xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);
+    }
+#else
     rc = xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);
+#endif
+
     if (rc < 0) {
         XEN_PT_ERR(d, "Mapping machine irq %u to pirq %i failed, (err: %d)\n",
                    machine_irq, pirq, errno);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index eb26cac81098..07805aa8a5f3 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -23,6 +23,10 @@ extern bool pci_available;
 #define PCI_SLOT_MAX            32
 #define PCI_FUNC_MAX            8
 
+#define PCI_SBDF(seg, bus, dev, func) \
+            ((((uint32_t)(seg)) << 16) | \
+            (PCI_BUILD_BDF(bus, PCI_DEVFN(dev, func))))
+
 /* Class, Vendor and Device IDs from Linux's pci_ids.h */
 #include "hw/pci/pci_ids.h"
 
-- 
2.34.1


