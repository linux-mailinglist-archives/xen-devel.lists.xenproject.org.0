Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B978C742B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722960.1127391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XnQ-0007tH-IH; Thu, 16 May 2024 09:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722960.1127391; Thu, 16 May 2024 09:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XnQ-0007qL-Ev; Thu, 16 May 2024 09:53:08 +0000
Received: by outflank-mailman (input) for mailman id 722960;
 Thu, 16 May 2024 09:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7T=MT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7XnP-0007bz-5C
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:53:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 177c4865-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:53:05 +0200 (CEST)
Received: from PA7P264CA0360.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::15)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 09:53:02 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10a6:102:37c:cafe::f5) by PA7P264CA0360.outlook.office365.com
 (2603:10a6:102:37c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 09:53:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 09:52:59 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 04:52:53 -0500
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
X-Inumbo-ID: 177c4865-136a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrA0excvJ2pqALielsNgWFp/2jOmQkCzIiCYFjKpwkjcgqP5H1h1JrBXBA9BOa4rOYq7NvhKmE5r539Z2bg/ByK7TntGg7/WjB5j6pcvFsj0No2LCaz2RPbO0H98VtNwziITbGIMdOPNYka1vRzdJ+iN90uN3rUq/zg53INJYV0oI3c3FQ4KoRQq4tk4j0Kk3PIpRk1mMZHA7tnUGOBfWyqQvH1Zwh8y0Dp3NuMhBtFdkAkDjyju3LIwStXfI2jV37Q6SCA7nAIPoLH5ITH7R7LWckUZlUj5noa8JVskPD/lkw7FWOGeZQN/vDC7tCUsE/bnW/rdRwLvVdJ7NSmmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeE3uZCJJMp49WYoeMdmwPSgIvA5T34m4ty5QgqPjT4=;
 b=FVLssQnpJpUCsNWsnLavxEBjiJy+/eduVP4dEYeBEkvvSjzU16az8gi1TYdWrzQ9o70is0CAOrz1i/uTb5nLl1y3GUlahIiTk4EPP1nHn2+H4wfCk+YwviBSL5RS1yobYfF98wzmiTRm+eSUcRJe2aLPnF0KI4Q/ef+IAtIcaBZ5DvjCsUNS78l0w1daux3ocdPhV0FH2ROdSXyEb17UrDC5vm7W+6WFi2PEbGiWKvpw0uAaPxJwKULGUgGouFQEXdraz87h6SFr0rXQS9OCo0KqVK7zMfWkwKLGButGMQSnLZMiP7W+iKcBsR2YndLHZugqrgVw9VyGfrCHikq/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeE3uZCJJMp49WYoeMdmwPSgIvA5T34m4ty5QgqPjT4=;
 b=vZFOWLw95jpRblQDWifxdc/V3tJiK/RKNa9bOKLPOC3xSynMXH1oUL8sOhwA3p/MWAuJP708RFqSoFVNicyDtKKB7HXKU95CopsnD+iPCjPwtJY5+zeaHpacP1MT6ydastwh+WwXvuuW0wCUNbcQcgdKc+WeIBGguyAcnPKPHoE=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Anthony
 PERARD" <anthony.perard@cloud.com>, Juergen Gross <jgross@suse.com>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Date: Thu, 16 May 2024 17:52:31 +0800
Message-ID: <20240516095235.64128-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516095235.64128-1-Jiqian.Chen@amd.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: d2294fa0-b2b6-40cb-ba57-08dc758df88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|7416005|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aweMeH+AuoZeRE7AOJeeE25yBGx4nXT8hHQ8PX9jO5DnTSSD5zboUnRvJSiW?=
 =?us-ascii?Q?TMoR88kh69AIHAiWFZRDmqg6D9mwNKB6XReFimdRUqsnx0JQm/JMMTwh5OhG?=
 =?us-ascii?Q?W+SXkdos39POZvNrA8F0eBAl7j9Eh8FA3TnEUkTKOtwQ9o1n2lWhx0KhyN+S?=
 =?us-ascii?Q?T7al16IjVOF08aLOR7YaENY7OCn6G/dOEEZrup/gcwWqTX6txETGcKE5YeZk?=
 =?us-ascii?Q?5zaRP95VjcJVmNYFgNwFGNIjenOFjDg5u+ZoH0d7OPm5KsRjf30SK8At5Nfu?=
 =?us-ascii?Q?+F2zhOtSfKaPGiDMXwGGhZFOHlIQ5CYdgGXB4K4MdOh6Q6dRba6fUG2et6ev?=
 =?us-ascii?Q?E47lbOuG0Z8n2mpWZl0degbInepfEVrqn+R68o15AyjGYXnKdE6LgtdB1lJ/?=
 =?us-ascii?Q?xA3dqGQDitJRuxgVlImc09w5qehKXHdPw2iCX57gLoaIvgIRYEL0HwZHKt7r?=
 =?us-ascii?Q?+Ofz9fo01K9DX1XbLRh7wg1hbUdTFW8MveVnCe6RGd8vFtEw4VWtmhCpng9d?=
 =?us-ascii?Q?Kn5eknYbtAZZDYo8+bszIGVW02qRCXshCMvtaZZlepFNN/J55O+MEduIrTdS?=
 =?us-ascii?Q?XuKiSioii7DPSVMJ+o2k0RMfiGRe3KFuOiU352pblvh519ueRQAFTCnXLRUB?=
 =?us-ascii?Q?DKRWx/0DRiiR/r5eg109SHziOZ6OCRj7atAXZJjENw8YkLZBKIKxcpqupnZE?=
 =?us-ascii?Q?tekxcXOhobwiRgkqa+cEYfmSyVq5PqpHduI2ioTPwMcKBFs5xTY1V13k0/ig?=
 =?us-ascii?Q?FZxK6bOVttohp52UHqRPYe13RrZGwS6MpTvaS1tcmQHylMvSb1eJF6Ry5YIp?=
 =?us-ascii?Q?6BtgHSy71qfdFZFQwWEaq52adUTmYfyh1P9LqmWQJ8oJuo7UqFo3FyvMIijl?=
 =?us-ascii?Q?4sSsUafztb/vXoXs8I6RdDtDE1G78yM1J/x4ZAhIvAxr+2hi5sagNp3bGivg?=
 =?us-ascii?Q?WxgBamTfuPwejI2dsEIUMnsWLCFgiENB6tqI0ZruIbbp6PPqfG0SLAcUnzDd?=
 =?us-ascii?Q?lC+jg/BLWDfLeKaHaVF9zLGj7Ym2zB8TLvu4DUhsERYjsFYB/trnx708laGD?=
 =?us-ascii?Q?c80c1IhEFcIhf1WyHDtY/oLYmSuUrc1/zlmXiyeu22reqnRiLFNGXsb7tiR6?=
 =?us-ascii?Q?3uC1/piueFTul3ZARgr1NjK7ODemj25b/tlr6BhVytKziOEa6+J7zPem5ljx?=
 =?us-ascii?Q?QCee847rcsg6Kv4F4s8B2m7mtKzWbHB6/Mbz1WCRMsJhc6Xmb9rQ7j8D00HQ?=
 =?us-ascii?Q?UM3J/FjwwDWQ2xDL/VNBwvO3tM++l4ogYNo9hpViCzcynKqtA1BEqRPzkXn8?=
 =?us-ascii?Q?GBJ8ma8wIKnC6E6+A3lrjCyWLVT8Y9g/vNq5GPJj78jYEcL8s5eMq4xJcKTW?=
 =?us-ascii?Q?pW5WDAw2RtxSeFgEz155U/5puagN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(7416005)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:52:59.9928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2294fa0-b2b6-40cb-ba57-08dc758df88e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882

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
 xen/drivers/pci/physdev.c    | 36 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 ++++++++++
 xen/include/public/physdev.h |  7 +++++++
 xen/include/xen/vpci.h       |  6 ++++++
 5 files changed, 60 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 14679dd82971..56fbb69ab201 100644
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
index 97e115dc5798..424aec2d5c46 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -115,6 +115,16 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_locked());
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
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
index 6e4c972f35ed..93b1c1d72c05 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -266,6 +267,11 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
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


