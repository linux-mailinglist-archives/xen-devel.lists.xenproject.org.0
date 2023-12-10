Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC1C80BC33
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 17:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651390.1017053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMr9-0004Xh-4I; Sun, 10 Dec 2023 16:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651390.1017053; Sun, 10 Dec 2023 16:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMr9-0004Ue-0p; Sun, 10 Dec 2023 16:40:39 +0000
Received: by outflank-mailman (input) for mailman id 651390;
 Sun, 10 Dec 2023 16:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAJh=HV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCMr7-0004FH-NQ
 for xen-devel@lists.xenproject.org; Sun, 10 Dec 2023 16:40:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d81235e2-977a-11ee-98e8-6d05b1d4d9a1;
 Sun, 10 Dec 2023 17:40:37 +0100 (CET)
Received: from PH0PR07CA0033.namprd07.prod.outlook.com (2603:10b6:510:e::8) by
 BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Sun, 10 Dec
 2023 16:40:32 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::fb) by PH0PR07CA0033.outlook.office365.com
 (2603:10b6:510:e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Sun, 10 Dec 2023 16:40:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Sun, 10 Dec 2023 16:40:32 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 10 Dec
 2023 10:40:27 -0600
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
X-Inumbo-ID: d81235e2-977a-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evQpB40kssKCgzrquE32CfJijlNGOf2RbhVCBWyU0ZzJaoW0zwfWFZ9cOvBXTsmdvQvzpHN+iRw6LiXfaOHvO2/VtiwjtGPJiBXI0grjTpUTXdVbCqQFkpkHEmLAVxQWfkCvPLRCJl3a734MZ5IDpRMZD2sS2zj/X63s/W2qcg6SzLdy9ez2VE5GKvDV6EduIHY0ZFGT4DqlHQb5oGj7ZPoIFOIbF2jDp5w03MeywDuuIOD4xXZyv2V3HseQgYSxwaW5FxhLDYPYIjJjZzRGqjtSSnM18qcrtgo9XitH1ErQIgZjm/9KiJKzGTLvtG3vE1Fz91MREzRDXpkH/PwuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc3EWjHx3Sz2v0LIz/ArvgoRts9u/Cd05lxvAz4CijU=;
 b=KECKJ+BPtoMP/J/JwjXXwqIfeg+me6pRs7O+4djWmqnSDlJqdW+yVSZqQNSR+TnVhxHVxQeBEdHLJ1/E/DSvbu+lMRG8kY4y0F6MWhEggRdUCeJMST6MOoraOh9sL94rboNwDQG3f71KqE4aravM72F0oH+rdHE6+GNkZWGCjsLjcpD588tUBehG2zXeJQJPSr+3BOjTwEwcksbTQjKJuzJrZpxaD93aXhmJtzE0MkhGvDP/933WtIKNIMTjkJnNlE8Szb9pnwPkMvLqbgPsVeJeWZ8oowu9SbZhKi+pcsXKkgPQ7qbEFWhCVjXv9DSqmdGjRloP1+NSmhfFubM+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uc3EWjHx3Sz2v0LIz/ArvgoRts9u/Cd05lxvAz4CijU=;
 b=v6O4cOgteZ9JnoeQw0e348K/JSvHeprwjCirIRrR3nd1WCIV+94fQwHNQIAOY6QWUzZrJlana7gNt8KyE5PG0b6/Wq5SBI5MzRRrG5HnHAL90aiawUmBOzeHPFaDsBZfTgiAdkHHol+YWD7/4e+OX2dQEue2fM4i0kdndcfseJA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH v3 1/3] xen/vpci: Clear all vpci status of device
Date: Mon, 11 Dec 2023 00:40:07 +0800
Message-ID: <20231210164009.1551147-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: daa03549-08d2-4b98-3d6c-08dbf99eb9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pzblmn7jTtL52swqfnHLNCvuw3XpUIDQ6EqG/AAJffymjkStyjY/Vfnvh0oJAJ3fHhOquzkkSjSMGUUjXQxzK4am+cLWrDn5lYYARWXSTEu3zAl/dDWNRinRUiPFtnh8hdLxL+F+5e48srhSaoGtomLvQEfYb/1xu8wQorZBEbaFi8bKPW1sWZVp7RYTWP93AiNum4eoc9sDKWIlfRWd8wEuMTVlDPsvDZLruHxT6DOml4f/0XKWTgJi7gB06lpn3Gru5Zv2LPZytVWgJaoJeJHguY1CBm6ZI6Bek8dX4exHljOX8e9v0DvNeHwL5EMjv6ZmCRDEP2r9mA/cBe82CdhwTzKM3xu0YIpvCjn4VPqU3PZey2Uq34uf+Gy/tkt5O7hu2yODqchVqqdIbSYC+LV3pdlhzQo+GayFxCeBx96uMf20GKHV5W8DegmBLrd5cY7Ml7J0TbhpB048gg/+QiSjMvrSeDnWiZisa61SYAbYsPkBmzmVdkZx0PEXO5VkOxVS5wOgkBiF3sEibXTEm3BhRynmkrs/EsSacAfLvyVBg0yO/wFKg39tTwYJgOW83bqoRyNUc9230ZuMWjBj6YmYkomM1dOvdw4MUrwKbRpup8i69/4quwXCxJDWTLYl7eTOKCA4rDerDyLoeQtkm6BrHI6g3bS5PUNDWcIDVPXqCqVUIzVhLyxL/PabM+wAmM+yqUNBpz50nYaqgQFumf1hp3d1p3luAo9gd9PD1hn5CZSEWHuTKYwhuQh0sKaEmN/oLqkoi+m1cUGtTfJbxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799012)(40470700004)(36840700001)(46966006)(2616005)(1076003)(36756003)(7696005)(6666004)(478600001)(70206006)(110136005)(316002)(54906003)(70586007)(8676002)(40460700003)(86362001)(4326008)(356005)(81166007)(82740400003)(36860700001)(47076005)(8936002)(40480700001)(26005)(336012)(426003)(83380400001)(16526019)(5660300002)(41300700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2023 16:40:32.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa03549-08d2-4b98-3d6c-08dbf99eb9e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239

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
 xen/drivers/pci/physdev.c    | 35 +++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      |  9 +++++++++
 xen/include/public/physdev.h |  8 ++++++++
 xen/include/xen/vpci.h       |  6 ++++++
 5 files changed, 59 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index eeb73e1aa5..6ad5b4d5f1 100644
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
index 42db3e6d13..6ee2edb86a 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,40 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct physdev_pci_device dev;
+        struct pci_dev *pdev;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev, arg, 1) != 0 )
+            break;
+
+        ret = xsm_resource_setup_pci(XSM_PRIV,
+                                     (dev.seg << 16) | (dev.bus << 8) |
+                                     dev.devfn);
+        if ( ret )
+            break;
+
+        pcidevs_lock();
+        pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
+        if ( !pdev )
+        {
+            ret = -ENODEV;
+            pcidevs_unlock();
+            break;
+        }
+
+        ret = vpci_reset_device_state(pdev);
+        if ( ret )
+            printk(XENLOG_ERR "PCI reset device %pp state failed\n",
+                   &pdev->sbdf);
+        pcidevs_unlock();
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 72ef277c4f..3c64cb10cc 100644
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
index f0c0d4727c..92c2f28bca 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -296,6 +296,14 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
  */
 #define PHYSDEVOP_prepare_msix          30
 #define PHYSDEVOP_release_msix          31
+/*
+ * On PVH dom0, when device is reset, the vpci on Xen side
+ * won't get notification, so that the cached state in vpci is
+ * all out of date with the real device state. Use this to reset
+ * the vpci state of device.
+ */
+#define PHYSDEVOP_pci_device_state_reset     32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d20c301a3d..d6377424f0 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,7 @@ int __must_check vpci_add_handlers(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+int vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -262,6 +263,11 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
 
 static inline void vpci_remove_device(struct pci_dev *pdev) { }
 
+static inline int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1


