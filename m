Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96D7F71CD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640461.998746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TdV-0004Qd-TP; Fri, 24 Nov 2023 10:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640461.998746; Fri, 24 Nov 2023 10:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TdV-0004NO-PV; Fri, 24 Nov 2023 10:42:13 +0000
Received: by outflank-mailman (input) for mailman id 640461;
 Fri, 24 Nov 2023 10:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibx+=HF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r6TdU-00044J-Nx
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:42:12 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2ff031-8ab6-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:42:12 +0100 (CET)
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.22; Fri, 24 Nov
 2023 10:42:07 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:74:cafe::3d) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Fri, 24 Nov 2023 10:42:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Fri, 24 Nov 2023 10:42:07 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:42:00 -0600
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
X-Inumbo-ID: 1f2ff031-8ab6-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsocfJreJb8/9aIvuBFnd0/DEaFNj3nJ9MMR9O2Chlk5WiwLEkEDe3CIR5NFlz1hkUJuO/RH5px+icwXBjLJFw3T2AKmQh+OE7TEdj0Bbs+d1nX0vM+ZioKEyaezJDkSNr5yXqY0TjihZjc8WstffTuSse2IlmBzjfiGo8NxCUBbRyUfwF9DGi5B9lUqYMqaE0/DUdlAsy8e1FEn7wxDYW9lUtYJpBXrQcvvkRTVrtoPDsOU3GoIzuiNGv1GYr45wsNL4rjhVsotVvBEF2Jo5E+Dn1G+2uhq5pV+ot63YxbJk1hqXmQn/G0espToH6tkk9iaGDh2yVg+JytoMPgbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhtwSm2oYJ6b4otDJUCImvCv/KA43CPhTpF6V9Sflpc=;
 b=UY28OZoRPbHbsmqZ/QFpVvEmf7lOhBoDpfDdaz0m+toceZQWRN97L8s+gG2EzktoqqsYDjv7wxw75t0SOAGJ08czeFG5qg9A3v/cS3BRV1kmvCvh7MffmTuA+MMDfEW+L8YnIxMSYNJC6zUVFC/siRVi7PFCZp8ufqnpldAH9V53UcT/QzSxybVEDbQJK6pNClBePMEW1GK2uLhOXNJAIFwJ2t7azZWdJhW7Cd3RVG9T4zC1fegbtkPHznqE0bWlYrjbuG62m2odaXbwrTkzYaUdHlfPvGpYl9VX+88snEzqSVBTFUW/IaNCvx1JdNv311g8mb7PB9KJlqcfGRusfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhtwSm2oYJ6b4otDJUCImvCv/KA43CPhTpF6V9Sflpc=;
 b=CN13uWox9qX8B8vTAqjKH2Sp4aZdeUTboCFN8Wc0VWZQSVXd6d5Ofby8G3YAbAmlg/Dv4liWD+Spy56r1z/YtCoe7V5klhr+IV0CEQOs6qRO2PBB/2swXXJHrSfHixBlMnDeayyVAThubIKiDiqayMfAVLkTrE1AvB4bYyUcm20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Date: Fri, 24 Nov 2023 18:41:34 +0800
Message-ID: <20231124104136.3263722-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a329ae5-16cc-4c5d-69b5-08dbecda0143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZX2ssXVxzVCtAp2pOHz1nqLUfud6sEbBXOit6RZ2y4yC0cJiq6hn6ygxt9+hrezbUa0ZEo4yrjR/Q/vNCK/4l9O0eDRKN5pwRargNsKs8bzI1BTIJgRagzG5ly8czKYAmyTZJL49QM1vKYoKStFXyHXvu8004LyADN1E/bXvSuhNLLTm/CFHDN6TDbaooOEQt0WW3bynMFY320lJ/jfgO/dzVDHifvAd6bVMzgF1P9SILd0RTFSdrm4B+k7oMQni68UNgkVZzOO2R/ZXVoBrfPmFf99nUMePPYm0gcPsz92I4f1BfUvuNUCysyKK4krPPN5KDnMkl47ODPEFa4K4TD+dDrDukA7qwdUTTtHmVf4k3z1jXt0dTk4Vexp9hLwZRlZpqhwfEiNz7JLdHkMxn7VRIdTmU/HXEI7dlrWKxCQOezEVmPQZLbT9PUkEBfCA7ixgcG/Eab9fv9eCIU9lz4BuFGxoq5KpIgK9E+H+VOm2P/VwOLIPexZa2ccc7hAslEIBwc0eZjdV+fcdv6jz0sIc9hce8w21dx2kzPFq2ujcAJZ5hSzAqooF793i9WTmXeEPykL1hpdp2GoEkNR+NxgAwQPAX7rqs9p5bqmvZQGXzRcCngwCQbkafMh1S6MY33/PJLsxBeALkcmVtqqZJBdtE20JdDTjXJBXW5TM5bYZ8xmfRojkH8OtnPJDZM4jBBhjlNfWLsmXT2soQugVOEFtaOQnSQwxg9qh4BvhvS5q5yhM6KjiJWWlraW8FIiGAfXA9igibahGdMBqfUOOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(82310400011)(1800799012)(186009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(40480700001)(40460700003)(36860700001)(6666004)(36756003)(478600001)(86362001)(4326008)(8676002)(8936002)(41300700001)(356005)(81166007)(82740400003)(336012)(426003)(47076005)(2616005)(83380400001)(7696005)(316002)(54906003)(70586007)(110136005)(70206006)(1076003)(26005)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:42:07.0184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a329ae5-16cc-4c5d-69b5-08dbecda0143
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, this patch add new hypercall to clear
all vpci device state. And when reset device happens on dom0
side, dom0 can call this hypercall to notify vpci.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 xen/arch/x86/hvm/hypercall.c  |  1 +
 xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
 xen/drivers/pci/physdev.c     | 14 ++++++++++++++
 xen/drivers/vpci/vpci.c       |  9 +++++++++
 xen/include/public/physdev.h  |  2 ++
 xen/include/xen/pci.h         |  1 +
 xen/include/xen/vpci.h        |  6 ++++++
 7 files changed, 54 insertions(+)

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
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 04d00c7c37..f871715585 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -824,6 +824,27 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
+int pci_reset_device_state(u16 seg, u8 bus, u8 devfn)
+{
+    struct pci_dev *pdev;
+    int ret = -ENODEV;
+
+    pcidevs_lock();
+
+    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
+    if ( !pdev )
+        goto error;
+
+    ret = vpci_reset_device_state(pdev);
+    if (ret)
+        printk(XENLOG_ERR "PCI reset device %pp state failed\n", &pdev->sbdf);
+
+error:
+    pcidevs_unlock();
+
+    return ret;
+}
+
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d13..cfdb545654 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -67,6 +67,20 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct physdev_pci_device dev;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev, arg, 1) != 0 )
+            break;
+
+        ret = pci_reset_device_state(dev.seg, dev.bus, dev.devfn);
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3bec9a4153..e9c3eb1cd6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -103,6 +103,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
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
index f0c0d4727c..4156948903 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -305,6 +305,8 @@ struct physdev_pci_device {
 typedef struct physdev_pci_device physdev_pci_device_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
 
+#define PHYSDEVOP_pci_device_state_reset      32
+
 #define PHYSDEVOP_DBGP_RESET_PREPARE    1
 #define PHYSDEVOP_DBGP_RESET_DONE       2
 
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 50d7dfb2a2..a0c28c5e6c 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -186,6 +186,7 @@ const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+int pci_reset_device_state(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d743d96a10..e2d6cd5fa3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,7 @@ int __must_check vpci_add_handlers(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+int vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register(struct vpci *vpci,
@@ -242,6 +243,11 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
 
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


