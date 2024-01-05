Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42C824EFC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661981.1031846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeL9-00012p-60; Fri, 05 Jan 2024 07:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661981.1031846; Fri, 05 Jan 2024 07:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeL8-000104-WB; Fri, 05 Jan 2024 07:09:58 +0000
Received: by outflank-mailman (input) for mailman id 661981;
 Fri, 05 Jan 2024 07:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeL7-0000zs-H5
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:09:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd838f0-ab99-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 08:09:55 +0100 (CET)
Received: from PH7PR17CA0030.namprd17.prod.outlook.com (2603:10b6:510:323::25)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 07:09:49 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::dd) by PH7PR17CA0030.outlook.office365.com
 (2603:10b6:510:323::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 07:09:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:09:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:09:43 -0600
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
X-Inumbo-ID: 6dd838f0-ab99-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0iEb1x4ldfMMxtR2mgjY2jz+/Pi8NNpStXYYxUPJpGtX/lI2sdkrlKNJmS3YpI62Pdi6ZBIdZgfyPUtB3qdCUVADrtK+0Dqf+n4ozO8UGsUUguhQhdunG18yXcwPX0KnzRISWJ5enqWQrCZM4pIO7A6xIj2fJkyQzK5Ebrkgg92yjSeWqqPNcovT+Ibd5koisQeezZdnnbh/IwWSOfGbTpOL3UIqqiuM3RvI518wz2cGIOOPpgWJg6sIoJt0qSFdhoGpclKN4fXfXTdbOBBKisWvREL3T97fDaEwTfdSJ8DULp3RESsQCrw1W9LwIw8qw4Bp9f67L3DGhYM9oFrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2J87t3smH/+PmMBxkixHyu6GZJYqDWtA3ECUIAzmcM=;
 b=gbCdnQZJJbxtUzXfv5LmkodRj6d1Y/JhT83/1LVcxYIB/E79eezj1xmzZ9hBMQZPyJTo+dU05cEW+VPTTHeyIwoNEFuiF1Ym7fzg97w6wilRt+LuRyTgK5RzhcxQFIqdGaurIWt9fR3/fpK9WbsJUYopd0UKzXh7V2/8w5xAiDcCvV8oO+kN0iSmO+e0FMPjmOHwgNEgT2qUX9vPGBANhGcTAhsp1aeoP2WBPU1G3dHtBeqSSplPrSZEqILKhpt2kfT66LhI34vwASdSG75gC38XHq+NxxeV6PJ17UgbJqZ7VOswgz741LEqb1/8npmM41otMpnZJBcjwcH9f7lY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2J87t3smH/+PmMBxkixHyu6GZJYqDWtA3ECUIAzmcM=;
 b=kPMqy7Ev23UulccbYQhsi4fYDrOvenrLZLhme7SELsSVS7TMtMdENpKwJcBNuqIob5LC5I84EHqfBsxe+aAbv5a7Pf8flD01NOoeIthnhcZZV1UsqtxPIDFqF3hHA+TBQ3gFe1RUFbrdm0slPa18S9WA/bbeupCoO1AxBKfiAhs=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Date: Fri, 5 Jan 2024 15:09:16 +0800
Message-ID: <20240105070920.350113-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070920.350113-1-Jiqian.Chen@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 52780fa8-e3d5-457d-c054-08dc0dbd4ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+uhmnsT5KZfNHTl4eT286/zcPLQ/AuUgISn900gKbopJzdEOOXb6TsGsUi0ptxWeJy/BU7b5qY9Cr1orgqKQP5Q2J6t5pbcb0dN+teOrwfZiHo2HZsUPgQeWgLFcDMUW+3SIeWmli58wUooJ81vq9Zne1YheNoOHK1rGb907v2H2n5EQrY9DGy3cGudynyN1d/zWYZJV/LJP8bTXu4XWbh5iaLNyDA16WYecpqNAvZz53OX+HNvyE7QXzJc47MW/azM/VVSbhSV2kE8pCbQ4u34DAEC2N4EFPYAs47MHzVBJmPTLu7NtloRK113nK2O7PfRp79pQao6tFBlx7WzCEd+WOA/u9JP5y1MaNz+l7aPvgXQuxmjD4ZkKV8FN2ZDZHMDw3JHsFlinafgHw9do6USxQmsid1C9KTqU1rWNPAI7DfreG0UYyC9BeNIGM3aP1AF7I+4RiDLXK13Dfj19wOIaK2EbFjzXlr++3lhy+7D2tjG90+Gk4+nxo+5i/8vwntXB7804bk9bMmYBUwlgY5DS54wZ1ovOwUIpkDvJcDhbIVSId49EbX34JeHsgGUzyl1Lbs/Jp0LR+V3Jap+I5v3vei+9iA8CPuj4QhBfvPvZ8o/USFTFIOOYt5ZaysB7vjaZJ/Mq5d2yjprOTVoeBUoEtm02GfCvz0w8DeMawpAB3q8QitIbeQqtMo5yLQeXUMWjjYkV2NpvRkVsUCQs2uBX0dlS7fwktzrmSDCaVFOB4kEiPbjKCmKFudtCbTCLq++9FVAtS7hkdT4I7dHwJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(2906002)(478600001)(5660300002)(7416002)(6666004)(81166007)(356005)(4326008)(41300700001)(316002)(54906003)(70586007)(6916009)(36756003)(70206006)(7696005)(8676002)(8936002)(86362001)(2616005)(426003)(336012)(26005)(1076003)(83380400001)(82740400003)(16526019)(47076005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:09:48.6393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52780fa8-e3d5-457d-c054-08dc0dbd4ded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, add a new hypercall to clear all vpci
device state. When the state of device is reset on dom0 side,
dom0 can call this hypercall to notify vpci.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 34 ++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      |  9 +++++++++
 xen/include/public/physdev.h |  7 +++++++
 xen/include/xen/vpci.h       |  6 ++++++
 5 files changed, 57 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index eeb73e1aa5d0..6ad5b4d5f11f 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_state_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..552ccbf747cb 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,39 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct physdev_pci_device dev;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev, arg, 1) != 0 )
+            break;
+        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
+
+        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
+        if ( ret )
+            break;
+
+        pcidevs_lock();
+        pdev = pci_get_pdev(NULL, sbdf);
+        if ( !pdev )
+        {
+            pcidevs_unlock();
+            ret = -ENODEV;
+            break;
+        }
+
+        ret = vpci_reset_device_state(pdev);
+        pcidevs_unlock();
+        if ( ret )
+            printk(XENLOG_ERR "%pp: failed to reset PCI device state\n", &sbdf);
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 72ef277c4f8e..3c64cb10ccbb 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -107,6 +107,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_locked());
+
+    vpci_remove_device(pdev);
+    return vpci_add_handlers(pdev);
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..f5bab1f29779 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
  */
 #define PHYSDEVOP_prepare_msix          30
 #define PHYSDEVOP_release_msix          31
+/*
+ * Notify the hypervisor that a PCI device has been reset, so that any
+ * internally cached state is regenerated.  Should be called after any
+ * device reset performed by the hardware domain.
+ */
+#define PHYSDEVOP_pci_device_state_reset     32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d20c301a3db3..6ec83ce9ae13 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,7 @@ int __must_check vpci_add_handlers(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -262,6 +263,11 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
 
 static inline void vpci_remove_device(struct pci_dev *pdev) { }
 
+static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1


