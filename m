Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2A8FFDDE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736379.1142450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhf-0001Ws-Dm; Fri, 07 Jun 2024 08:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736379.1142450; Fri, 07 Jun 2024 08:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhf-0001Ub-AA; Fri, 07 Jun 2024 08:12:03 +0000
Received: by outflank-mailman (input) for mailman id 736379;
 Fri, 07 Jun 2024 08:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avvd=NJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sFUhe-0001Hx-BA
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:12:02 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9df7b388-24a5-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 10:12:01 +0200 (CEST)
Received: from MW4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:303:8f::20)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 08:11:56 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::50) by MW4PR03CA0015.outlook.office365.com
 (2603:10b6:303:8f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Fri, 7 Jun 2024 08:11:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Fri, 7 Jun 2024 08:11:56 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 03:11:51 -0500
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
X-Inumbo-ID: 9df7b388-24a5-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtXWo/YhoncSCRsiQgsMZWsj/zRZmJJYFCNiSNYWly/h2y0N6W8Vw5zqlpKeSbbAk/Nq70Cm2tKRfw6L6PkwDXznWewUQwGodHD3Io43/6nfpEQTPXOfcGCCWkSRpRX/lLKK+NoE3u5O8IqAlZ9uCemmshR6h6cBJndCQxL79DC+bV/saiwWyN14s05TEh9BrgVUp8Nr68keVnuu1mkkwukSLX3ohIaQxrHHSNXy/P+UDxaNAan/0l3gWxX2kmzkyhBIsS44Om7vaE5C5oJK1JIdqND9wUuChxzSlEu2k07Ko/gUrNrZWUNhi39Wtw5UjYNFUYuUASlkl12l7qQptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSoTXYGPxu2fXUgCiTtfeb3ST/hmymGeL62Y34ZHHYQ=;
 b=kAjcxGBQEAeBHfPDzIareAv/DoHkSX+RFri4IbCDJ5X+63RwnNHPJFCeinePN2aC03Cav+4FiKD4eaTA+r2z5dRE6TBQWZWe113oFYfNQ+Z7uKaWoVq2zTE58y4mvDJqrtLmk/1pS3RF+Azwq6WzTCg3E/+KxRpe7hif9ELWWSllcbthRxX5FIqGqG8DJcggcYoShzYqNBqFIoFv7b7KsPxLucqyup6U/LsF0dPorrhQ3o3QW2ZEHluCUFUuWQfIxwJtVYdvtAO7aUrSWv17fnVrL8F7z/DX0HH0TPEilwMEKGiCUX/LF3RJTq5Ma/37ccdr3FEEHX/1szKz6TzKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSoTXYGPxu2fXUgCiTtfeb3ST/hmymGeL62Y34ZHHYQ=;
 b=zCtGm6XQowhcNZyi33HeMJMrDchWdQoaKF4E8+8k4xz+uXBEavbcOIj7SpCTLKoH0v4BGH7bH9Q0cIzmzGCvJ8nPfozz2rKtBzEnKHLR4jyMPsCg3//2qkEFZFPmdfKlB8izh6f+DlEeI54vej3BI5wG01RWBYBNFUzNMA60PYA=
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
	<ray.huang@amd.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [XEN PATCH v9 1/5] xen/vpci: Clear all vpci status of device
Date: Fri, 7 Jun 2024 16:11:23 +0800
Message-ID: <20240607081127.126593-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607081127.126593-1-Jiqian.Chen@amd.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SA0PR12MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6b74c1-20d2-4b0c-7e29-08dc86c97f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|7416005|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l+WuoomI7aw8xVoFDmdZPh2LUXFIIKa+njQmG1YQIGmdSAgntO2dbi2rubyw?=
 =?us-ascii?Q?iFJNV9jRZQPZs9H5zxpl5cB6Y2sPMZTN8w4sDCRqx9+MOaKaBelPk7SmOY3o?=
 =?us-ascii?Q?a8STSzofc7nJzm5iqeKfbeZC2WpCCTrhRM7BgD7/AqHU3u7G70n0I0MMegm1?=
 =?us-ascii?Q?b4iM2cjaMpte/f8XIzGSmWRWw4m16KI9YH6ApT47xodKOA3iARRNbruP+g6r?=
 =?us-ascii?Q?1ZeODxBv/NJ4Ox39GVyEYzFMjiylKmPIxTqI1I1dJeuf8I+w67dIhBPFOWZH?=
 =?us-ascii?Q?wu1Aq6SHIuhSVdIsimSQ2ZKJikFSQSa+Dava8ZCcKM+8KoQYo2Gg+BUe0sh9?=
 =?us-ascii?Q?erFobe9ij/sgrC+ZhU/eevCEM29JEc0n85XqHdeSSbA8WasFQgIloU/Pypti?=
 =?us-ascii?Q?Dlr1aoYo0rmRCFiDFNxhVcCGQQQh1ZA38mn8kT3cHAH07LrE9CImAyB3LpyH?=
 =?us-ascii?Q?HlkyfuXwwxw3FBVr/epcBZkhrifFO4HGy8GCLafLQN5G7Es2ELnpO44VDt8D?=
 =?us-ascii?Q?Son6sr0AOQMxGvOqg/07aB8xhnKtImmZYr/khuhJZyQGIvnEdMXgFJmw4itP?=
 =?us-ascii?Q?UfNt7tMvXCYBV9WpBwKhrlE/hybrJYrUI7scFtStg/Hg2KM4ovM0ggDkereC?=
 =?us-ascii?Q?J1oqzWOZlev9pUlslbj7y/pwmWfq6pkkqpfcb1tVvMIKKELxUWIlpc9FOD5y?=
 =?us-ascii?Q?dR4drT5UnzHxCYo5ETbsBS3cJcmDDoWre1V4o5vg/5pFASsc7zv1QZzTVHAQ?=
 =?us-ascii?Q?4kJ7xM7dkukmr+BSuFBt4KvuK91oB41+uwl/TSzi3GOM7U+YlSRbXFI9y6Rm?=
 =?us-ascii?Q?OKmWrJOLM1c1ik4fM7p6/SsXyGmhO2NwoYQ9qJsdAK0mRXC6o+NG4XDLNH+s?=
 =?us-ascii?Q?tDiTUr7bhno4Yuf02aaAcyeXEYaK6awY47ZFdP2pgZQcXLJ8qwLY2sbwpFmY?=
 =?us-ascii?Q?eatMEZbkqAp5UIysxHHCjJJm5+Ld6vyGsAAkKRmmDk42jgkw7AAa7tGyK7LM?=
 =?us-ascii?Q?U8axvHXxrD/1/RRQQMOBNqrX+RJcefr9eMlLnmBIJqgk5CFJktTObIl9/JT4?=
 =?us-ascii?Q?6gzsPY9xELa3U8CZGbqfn7nFfy9cmiMG2441cjLB5ZD1e7GF2UWeQ23KRfOo?=
 =?us-ascii?Q?oM0L5BF9nEQgJnfMReyOYnzzDNicPFCealucMP9RJsg9TaqGfhD7gxV1Eaie?=
 =?us-ascii?Q?TP6NiWmt2Z+1YTRrUJVUEvxOKLW/CS8pcSUgJfYAnfLJBacC6ZeyfdbnLyYd?=
 =?us-ascii?Q?zgQvNxFpz0TyMBOCv1izvMA8bgEh5rpJMqD24PfjcjM1cpMwANmYvDzsqZR0?=
 =?us-ascii?Q?fVOXoNr+pHQwmlQH53TXNSCeuaJvXSM8BfNn4GBr/H92iSTOX/QE8wdIhFfA?=
 =?us-ascii?Q?9mFd7RSOJ2j15cNFZCKNTM6RdxSCptqM11c90B+MzUSnAC2Grw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:11:56.1063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6b74c1-20d2-4b0c-7e29-08dc86c97f55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, add a new hypercall to clear all vpci
device state. When the state of device is reset on dom0 side,
dom0 can call this hypercall to notify vpci.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 43 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      |  9 ++++++++
 xen/include/public/physdev.h |  7 ++++++
 xen/include/xen/pci.h        | 16 ++++++++++++++
 xen/include/xen/vpci.h       |  6 +++++
 6 files changed, 82 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 7fb3136f0c7c..0fab670a4871 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_state_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..1cce508a73b1 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,11 +2,17 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
 #endif
 
+static const struct pci_device_state_reset_method
+                    pci_device_state_reset_methods[] = {
+    [ DEVICE_RESET_FLR ].reset_fn = vpci_reset_device_state,
+};
+
 ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     ret_t ret;
@@ -67,6 +73,43 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct pci_device_state_reset dev_reset;
+        struct physdev_pci_device *dev;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
+            break;
+        dev = &dev_reset.dev;
+        sbdf = PCI_SBDF(dev->seg, dev->bus, dev->devfn);
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
+        pcidevs_unlock();
+        ret = pci_device_state_reset_methods[dev_reset.reset_type].reset_fn(pdev);
+        write_unlock(&pdev->domain->pci_lock);
+        if ( ret )
+            printk(XENLOG_ERR "%pp: failed to reset vPCI device state\n", &sbdf);
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..ff67c2550ccb 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -172,6 +172,15 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..a71da5892e5f 100644
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
+#define PHYSDEVOP_pci_device_state_reset 32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117e9..376981f9da98 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -156,6 +156,22 @@ struct pci_dev {
     struct vpci *vpci;
 };
 
+struct pci_device_state_reset_method {
+    int (*reset_fn)(struct pci_dev *pdev);
+};
+
+enum pci_device_state_reset_type {
+    DEVICE_RESET_FLR,
+    DEVICE_RESET_COLD,
+    DEVICE_RESET_WARM,
+    DEVICE_RESET_HOT,
+};
+
+struct pci_device_state_reset {
+    struct physdev_pci_device dev;
+    enum pci_device_state_reset_type reset_type;
+};
+
 #define for_each_pdev(domain, pdev) \
     list_for_each_entry(pdev, &(domain)->pdev_list, domain_list)
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index da8d0f41e6f4..b230fd374de5 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -38,6 +38,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -282,6 +283,11 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
 static inline void vpci_deassign_device(struct pci_dev *pdev) { }
 
+static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1


