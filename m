Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEA82BB2A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666638.1037395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAox-0000WU-Es; Fri, 12 Jan 2024 06:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666638.1037395; Fri, 12 Jan 2024 06:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAox-0000Ut-B8; Fri, 12 Jan 2024 06:15:11 +0000
Received: by outflank-mailman (input) for mailman id 666638;
 Fri, 12 Jan 2024 06:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PwP=IW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rOAov-0000At-TU
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:15:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef574fd8-b111-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 07:15:09 +0100 (CET)
Received: from CH0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:b0::9)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 06:15:05 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::40) by CH0PR03CA0004.outlook.office365.com
 (2603:10b6:610:b0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 06:15:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 06:15:04 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 00:14:41 -0600
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
X-Inumbo-ID: ef574fd8-b111-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaV7FnLR7ifVUz5RQO+gDNH1KTtTC/gcKh2mw5+dcx972lUvNKIYbc2d9eOpUh6agA/3UK81pXyf4N3UQqVmevDwP7OjroEBZmweXfAMHbVJuXm8GlVviJyo6WSDCKjoECAUQ6yjuhnwne7VbxL8R3Y38/rFyGZGtAJuHMNHSipSn4NtL/3k2qg0ghqMy6cz5OSge4G77ZEbLJP0RIpEIqu2XVZFMOXx5kOT7ny4zhJrwjF7lRFdLQZB2u4wilbaaxJPfNqqyVS40X7RvtMaQ56yaNb73SarAxVw5nlXfLMzc+SSed482XznuhqpapJnAs79FCuZu/rUPcEqni3FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY1dhgmm/7iGPInQH0m8WagUQ03lrwhilTFth0736UM=;
 b=W1X0g/6qxoMI55E2WBGbi5kQZUKDJxSG55mwm/HfR+5Yw5H19LGQMLvDRQptgOga7hZLsiWrtcQEB2wYVTyhXiUXCDDF7yGL77Xxb0zDpFbdNRz9FCQL+I84YDDSAusqzDDHLNp3VQu7my8a7p5j05947xzivpeQSPa4/NBkzv4icm1VTV7IGd1f4MSdViuh+DoMpnEraTBkjrrqv90/dWBMvCfxk412yDGJpmW/OjweCde7CYvNQIJRBHQiIa70LY5mhaUpEdZ81P7W1l084RL8Yepj5vBY5WV3TOnesF8vg0IfL9i8pen6h8NonN2dNAkvuxqF/NFtfFba9DV1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY1dhgmm/7iGPInQH0m8WagUQ03lrwhilTFth0736UM=;
 b=1z3ejlsSCP7BjUMwzrWQIMpfeuUN2Few1c2PwhGgGX2WP7s3dcTTDVsNrhDAIT2MtUX1trndXSuXpTfJ1+jM3CG9iUKODTsh8Su/+A4ktJ6LO/ek01HY8VVRHySXfdeD/fwtdipH3oF43BHU/rArCuK4mJUDlXEANN46wP158MA=
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
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v5 1/5] xen/vpci: Clear all vpci status of device
Date: Fri, 12 Jan 2024 14:13:13 +0800
Message-ID: <20240112061317.418658-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112061317.418658-1-Jiqian.Chen@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: 979ceaec-63db-4e40-5866-08dc1335d175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Ce10cm9VV5qt2iduExnwW/XdFVKtmB1NVUYdaOZ8V2+D/yAhv3Fkki0eEowzaRR021/MltdgPrHz5rd6212WEoXE1bQlX4So4vYZVbMlXEc2tcBSA2Hv+NE99Ubqx9CTwYXdK8rX8qnzpZmgBLV3e06wVIxPWm1BH0s0KShBSJf5oH4gP3P1inJW6r20vTvJ3JRu0TiNI3OBlQs4Y6e+XI6w6Dn8yv/TL+8r8Lu8Y38YzCnzUkkXJIex57vLLFuILREIpROOyLM8WqK2OOoDt+IFFMX6f+YXnmKHHBVbGFLpnm7ziKA+P+gvsgsw5J3Ogn2ZOKMnbM0I+3kNefHoD0kQ7l0v+WT+x1ydjL2nQaGaMC8SWIH6UcJtzyKdmoRDkirp2WHcgfEfp+KKuO9NeSsWt/Nvx3GyC7jiag6X1ZwyzGM9JrA35ie1h15wuHOmBajGalnA8bSWFNGtBJy3wKFh+yBHcuEZZ+CA13JLHhxR7BLOiBenS9oFvUGr84gONurmjXbII5JNUpeROzrUG4zEDKH103SQ0gKEMLuvVrFfn1ch8YKALE+07U0jwR9W39EwEj+AH77dPkhWow+mCp/uXiPvHuM79Fg+evZrwbZGJspj8jbnHGLCdddDsQ8lUx0dsMhYa4xzvRzT32mqhd+UJARkagSOhAQe+/WuFmsySwLH6+2cF9ZHNWxThjE7V3N0GXZVPHNvq28/YPW+vcMnpUCTZnpjc40Xl/esJELm+4zFrkzpO61LoZ7+cvFSyJGBQFkth58t3O53UdpBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(46966006)(36840700001)(40470700004)(70206006)(70586007)(7696005)(26005)(36756003)(1076003)(336012)(2616005)(426003)(16526019)(6666004)(86362001)(82740400003)(36860700001)(81166007)(356005)(83380400001)(41300700001)(47076005)(478600001)(4326008)(40460700003)(40480700001)(7416002)(2906002)(5660300002)(316002)(54906003)(8936002)(8676002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:15:04.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979ceaec-63db-4e40-5866-08dc1335d175
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156

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
 xen/drivers/pci/physdev.c    | 36 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 ++++++++++
 xen/include/public/physdev.h |  7 +++++++
 xen/include/xen/vpci.h       |  6 ++++++
 5 files changed, 60 insertions(+)

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
index 42db3e6d133c..73dc8f058b0e 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,41 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
+        write_lock(&pdev->domain->pci_lock);
+        ret = vpci_reset_device_state(pdev);
+        write_unlock(&pdev->domain->pci_lock);
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
index 72ef277c4f8e..c6df2c6a9561 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -107,6 +107,16 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_locked());
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
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


