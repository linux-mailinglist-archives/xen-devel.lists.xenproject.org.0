Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2491D1A2
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751111.1158979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtky-0007ST-V5; Sun, 30 Jun 2024 12:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751111.1158979; Sun, 30 Jun 2024 12:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtky-0007QK-Qa; Sun, 30 Jun 2024 12:34:12 +0000
Received: by outflank-mailman (input) for mailman id 751111;
 Sun, 30 Jun 2024 12:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtkx-0007C1-3o
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:11 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2407::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c17170b-36dd-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:34:09 +0200 (CEST)
Received: from CH0PR07CA0021.namprd07.prod.outlook.com (2603:10b6:610:32::26)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.27; Sun, 30 Jun
 2024 12:34:05 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::b5) by CH0PR07CA0021.outlook.office365.com
 (2603:10b6:610:32::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:05 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:01 -0500
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
X-Inumbo-ID: 0c17170b-36dd-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWVHVMAYRZFwMX/cbUgd79F85UUWYwkyuwoNvVd+5WkZfkDsk7gSMTQFWnWp9J5uyLe5QSxcuZqAYLwVJnPlmwMWZsXn3zCn00TDWY8TMWcy9QzUDxV4kYONJ0IC7+SWzraf24R34aFB2HuBKw/oeR4JH32A/AdmUA23MNyu8o9HUOzenbuqPNMLKFSb0ad3hWFCis3PCQEs9Cg37KgoGeGadmXSr7qCygVRRceji1XPSFkCq3siEvUVzgcTkIp+Z/K3z+zyYE3fUKZdpBrfGPRdz5OrvfIRtNmnwd1WxWLsLAWyYnqAZHgt8yl0nF0CDChA2ytiR3xqY8/MDyMeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wz0e9PQpwPFuK0UwCxCr1bNL2PvzI97HXd1rk4IQ/w=;
 b=fGbJQAdL58DqqPon9s84Sz6BEUjxsDuzj4qu8uE9Hp7L09lBgicCJgdq1NW02NzBXmnWsqu9qTgJJx0xAwfEo7yYNnZMzeGYl+LF+rCG4kyXay+ik/NQo0QBYocmB8nNe1Y/6UwhpvNyNifdzc9G81+k6iwbtaUF+jZIkdKs2Z8mh0NiS7Xiqhwn2zRr1e3339fQzxHEshI/6dykMWV+6ABDDHblhulqkdoK6bPQBom6OzGgsKYmlCvpiOHnXNgghwvNZH26MnctaAjR4M4x+2bqKo8s38OqT5FzBntTOO6D8XT6nR7A0QDu4dfLEXiv1TkOeg+8qX1fnX257I/f7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wz0e9PQpwPFuK0UwCxCr1bNL2PvzI97HXd1rk4IQ/w=;
 b=EoMrVRin1WJPNZdq+5HduZ1AaKwBn4LM8WA/w7lLKqe+WTQqHwnGAi/nply6KN7vPWwrtShP7CbXY1INzXQIrCVWkkg4ncKZmIxrjbmvfXoR16dZEJZfH4GM1NO45HrHnFF33I4DKaZxBC46KveJrrqEHy673MK2GoT5iSmI54c=
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
Subject: [XEN PATCH v11 1/8] xen/vpci: Clear all vpci status of device
Date: Sun, 30 Jun 2024 20:33:37 +0800
Message-ID: <20240630123344.20623-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 60814893-cb62-4f85-1bc3-08dc9900ee47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PcHMmdunss852bZCKghFp/HaR1iogeASHqJqJGZ4dSV6D7HlvIV2jaP13Gs3?=
 =?us-ascii?Q?qsy0zEpQJJwxELHfgxjD8sz46Qycjz28uyvajRvjUrEFvL1tNmULFx5PnNsX?=
 =?us-ascii?Q?NeBMWioWCX0qmJRxcr5/Zp48scybJO/9TeDhfcAIQgBAG1sjdCJrXKmwwGJe?=
 =?us-ascii?Q?sMKjC656Pm+OMnWlVdCQPF6HI73IiejxOCGK5rqO2KGaUnsnFEIuQ1yYReDb?=
 =?us-ascii?Q?LctNQw5uQNrhZPb4leRV1Qhe5f2CXrcbplo2TjfxGjGKBzojXJvGkudyEx/x?=
 =?us-ascii?Q?XqxvF0e+5Uvi6fWCx5Wwu6Pcs5ptlL/jU+2a5bPfpp55xC/sqZTICro9CjTi?=
 =?us-ascii?Q?NNodMb5nJoiVWcCyJmDnkRfOiKRvi+Nnr7+YIR1aL4soZShbXwNsF88Yvg3A?=
 =?us-ascii?Q?yTcZwU//5aeCjdpUqgXAZdjlD4cHYm+tGN9f5WWX/FwpRuW4KEArzbUxmX1G?=
 =?us-ascii?Q?+um301Vzyg+KaFSCmR3eSDSsqA4hwVwfAVHwr9JSX2rA+ryGhRVOWknNX5Z5?=
 =?us-ascii?Q?B0P1F1ZiCNQripFpoIjW+MLMHDBrDg+/rTpqmJpc9aAf0QF/9fIN/gDSaRrX?=
 =?us-ascii?Q?J995qvZYYh68+9E9SQZI1iR6qeMbshly/ttYLXeigZe5f/I8A1w/EfwKlcbu?=
 =?us-ascii?Q?CyyWsrdyk9QZt+CZjsDRrNglKs7DkeP4zZea3ITPc84bbNWrV3hFjnkq9q3t?=
 =?us-ascii?Q?wDngsDcRJmWvIHyoYdnSsayJY7RYw0FnLmixf1slOzn7Ccf25Q13JmeU0wab?=
 =?us-ascii?Q?sXoRmw1X13o3a4lrb+Cbasqq2hbHWfvJmrdxlHJx4tIw13dZy1PYY0BIcsxo?=
 =?us-ascii?Q?Dz8ZtLOCjDwYVrnURTQ+iNtdf6pqhw0vDXMhgozLvecPv/AjDhD/+1pX7Rqy?=
 =?us-ascii?Q?1Mu1oK50S03br5E1BtGeX2t2/sU2JGAjtXj6z1tU97cYCt1Wg5mLpzQEGbf8?=
 =?us-ascii?Q?v/UCrcdJKm/ukK+ImWOxzyJcwW4oLPQVMNeE/07MpnNruaO27pmBzdVZAPOm?=
 =?us-ascii?Q?SiO2eHtJPAL1GpDOMJnMD9CaA4e5BA+k83GHjzbwNGiI3ZeJIR+3+ZbpnkIl?=
 =?us-ascii?Q?ois0FEeBBWtZ+eA2w5aGvwyqgBzWSsShU+YjIldXLO5iJwHOSgOMtZGcdrJX?=
 =?us-ascii?Q?z+TQbCD2YXt4tPp3Ivt/mDU4oeUZLSAnxIOoAQr8TPEgJRD+2Uk2vceFZDHR?=
 =?us-ascii?Q?UsCncGEx44SrFgrFHeXXX32Wv7Gkm+si1FHhovGgxjlximYYTSoMGUcyMFsj?=
 =?us-ascii?Q?ufKhiqxZRx0jjZXAAonrLk2009veTb5S5g1EyfMJ1WDY8V9syjl1bWOGALd+?=
 =?us-ascii?Q?toafR9deBlpRCDzUIRixBYsLPd6C+K7wBNVxuMEvBHNARTYK26B/s+1Fq69E?=
 =?us-ascii?Q?CmKKohENK3Htf1rPjC/geGhZ69KdbgsSgOtmZz+B4SxsOgQykwQQYDm9bkYh?=
 =?us-ascii?Q?YoN3ZXDV3J8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:05.5517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60814893-cb62-4f85-1bc3-08dc9900ee47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, add a new hypercall to clear all vpci
device state. When the state of device is reset on dom0 side,
dom0 can call this hypercall to notify vpci.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 58 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 +++++++
 xen/include/public/physdev.h | 20 +++++++++++++
 xen/include/xen/vpci.h       |  8 +++++
 5 files changed, 97 insertions(+)

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
index 42db3e6d133c..19a755d1c127 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,63 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset:
+    {
+        struct pci_device_state_reset dev_reset;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        ret = -EOPNOTSUPP;
+        if ( !is_pci_passthrough_enabled() )
+            break;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
+            break;
+
+        sbdf = PCI_SBDF(dev_reset.dev.seg,
+                        dev_reset.dev.bus,
+                        dev_reset.dev.devfn);
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
+        /* Implement FLR, other reset types may be implemented in future */
+        switch ( dev_reset.reset_type )
+        {
+        case PCI_DEVICE_STATE_RESET_COLD:
+        case PCI_DEVICE_STATE_RESET_WARM:
+        case PCI_DEVICE_STATE_RESET_HOT:
+        case PCI_DEVICE_STATE_RESET_FLR:
+        {
+            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
+            if ( ret )
+                dprintk(XENLOG_ERR,
+                        "%pp: failed to reset vPCI device state\n", &sbdf);
+            break;
+        }
+
+        default:
+            ret = -EOPNOTSUPP;
+            break;
+        }
+        write_unlock(&pdev->domain->pci_lock);
+
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..7e914d1eff9f 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev,
+                            uint32_t reset_type)
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
index f0c0d4727c0b..ddbcdfb05248 100644
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
@@ -305,6 +312,19 @@ struct physdev_pci_device {
 typedef struct physdev_pci_device physdev_pci_device_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
 
+struct pci_device_state_reset {
+    physdev_pci_device_t dev;
+#define _PCI_DEVICE_STATE_RESET_COLD 0
+#define PCI_DEVICE_STATE_RESET_COLD  (1U<<_PCI_DEVICE_STATE_RESET_COLD)
+#define _PCI_DEVICE_STATE_RESET_WARM 1
+#define PCI_DEVICE_STATE_RESET_WARM  (1U<<_PCI_DEVICE_STATE_RESET_WARM)
+#define _PCI_DEVICE_STATE_RESET_HOT  2
+#define PCI_DEVICE_STATE_RESET_HOT   (1U<<_PCI_DEVICE_STATE_RESET_HOT)
+#define _PCI_DEVICE_STATE_RESET_FLR  3
+#define PCI_DEVICE_STATE_RESET_FLR   (1U<<_PCI_DEVICE_STATE_RESET_FLR)
+    uint32_t reset_type;
+};
+
 #define PHYSDEVOP_DBGP_RESET_PREPARE    1
 #define PHYSDEVOP_DBGP_RESET_DONE       2
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index da8d0f41e6f4..6be812dbc04a 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -38,6 +38,8 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev,
+                                         uint32_t reset_type);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -282,6 +284,12 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
 static inline void vpci_deassign_device(struct pci_dev *pdev) { }
 
+static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev,
+                                                       uint32_t reset_type)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1


