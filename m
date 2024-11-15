Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057C09CF11C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837778.1253682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBysy-0002Cn-Gd; Fri, 15 Nov 2024 16:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837778.1253682; Fri, 15 Nov 2024 16:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBysy-0002AA-DH; Fri, 15 Nov 2024 16:09:28 +0000
Received: by outflank-mailman (input) for mailman id 837778;
 Fri, 15 Nov 2024 16:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHts=SK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tBysw-0001uH-N2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:09:26 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2009::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9d25211-a36b-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 17:09:23 +0100 (CET)
Received: from PH7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:33d::13)
 by SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 16:09:15 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::6c) by PH7PR02CA0007.outlook.office365.com
 (2603:10b6:510:33d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 16:09:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 16:09:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:09:14 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 10:09:13 -0600
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
X-Inumbo-ID: f9d25211-a36b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjBhIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImY5ZDI1MjExLWEzNmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjg2OTYzLjEzNjQ4OCwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBCNrG6U1b+v3/QO+kl5cqvJx/qJP4V2pyB2DJljkXrnnfx0tRHKmDYNxATU2tOnZadwvRgGAOpApOeQr89sLTMjhWQWcjbLGAtpDd1xt72aStMROmev1HTMtxeIVvmza3uyvA3Etwy5t9fDDyfWeXJJWkB73Wzqmw/oQmsgjtTyAVQuO5xDNk+9cy5r5wX3AGLdjyWscyJ3W5aUYJexzP6NMZz1cvjEdH5Js6A99tBlgLKZjIAVLa0p5VIUJ2UN9koFsXgWnVaHMa4/CANKzTaYuI1jVzwLkMLPuqAImZN3c9nQ+wpbM1qjeW1v5DF3Sy4DIcB1xxc8LFwpV/TQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dgSRDSguain7FanHlOnJmwBRlTv1DEkQEKN/zq4jkg=;
 b=sbU5XtrJdb4LENwGLuuWVhPAhYT/BeLZz+wawz9FmzwOeaH4tigOR9desar0B9badCewz75FaqQqr2B7eeac3htgnJI0/NL9BYJyoIn3rorfGXCX+9i0VA5APu4mNiJ+yBsnyoR2d7/JiqLsvf4gLFcaD8hHN0XR/Qy/hoc4BqnIC3R6MZqtwhCW/8RZKTWUZ6SJA6LuZEJJwwnA2UK0R9btml1PmImZrF6S2INjVonPhxgAtp3tju6XtUOcAQi3iuXO1xrcojxAYFB9o3S8qV8SALcYVqMWG8VE3+ANvrxyj7D47LbYbJm19if+Dvc1Xkru5jQJc4eO4bFwyLdrMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dgSRDSguain7FanHlOnJmwBRlTv1DEkQEKN/zq4jkg=;
 b=o1MXuTh+W/0lZ8yfBv9+KlXGjdAPH9ARcaLsBvQKmFYrY3bLBvVgUpK+EO9W93av5rPA1xkgJgczMaZcutVhuk53EOXOLYlLAZdezOy7ugEzFE2IAEzL9xrL/dV0i7OdXl6VW4jUNClHywZyQMDfKbA1im8/W3dkJvLnGu7apnU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 1/3] xen/pci: introduce PF<->VF links
Date: Fri, 15 Nov 2024 11:09:02 -0500
Message-ID: <20241115160905.551224-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115160905.551224-1-stewart.hildebrand@amd.com>
References: <20241115160905.551224-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: a654b0a1-3dcd-48f0-bfc2-08dd058fd9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bM5+wxRFzWXXJGfox39smoWvak3z9q/ckpo4SZf9EDdzYdB6XtI5tMfEh7oJ?=
 =?us-ascii?Q?AuVkFULuPLGKZOMOiOvtvMOYki66i5GhA09bXnpCqTQZvViiVXi1AjeYZugR?=
 =?us-ascii?Q?KolFzcC2i8vh7BQ3T+lOBsBL6JnVWEoy3OfgM2gPd0VkM+zVYPRXaZldemn3?=
 =?us-ascii?Q?4QJT9J2w9Z9CUcIlXvuRcXGifRSHc8iJmf8Vs6UEVh8CnE8ANsvx0mfesesA?=
 =?us-ascii?Q?kWeeRxj0jurN7hRVefUWw3UZKPj7fg/wTslYB9yNWeUCwuljk8hkbMj6cXAf?=
 =?us-ascii?Q?d+/yrL4VWD1E1Gm6avzc8L17sujYdDkZzKFJhuOIIuJYRTrlBBAPI9hWxPvZ?=
 =?us-ascii?Q?O7WlBkl+Q4EkXpQH+1p6o1AUw9SRvwLirlpYUvmBUxO6FcW9yqUUQiMKVynx?=
 =?us-ascii?Q?EgIMlWtM3n6uaXglCLRf1pLQk3Kdj0eegMW/2zSvihYYHzCwikJtu0giHtCV?=
 =?us-ascii?Q?3xzo40UpsDoAVUB6zPANAeRRgYrs14qeElkUNRJ9U8VRuvMFN8dpvb+Ps20e?=
 =?us-ascii?Q?vOTKMEaiF5qThFBpXn3EPkqPA3+sDvwF5AH6a8a9aqXoW9eUFA2pC5KCvXN9?=
 =?us-ascii?Q?GqQOsuibCogrtVxfd/kJNJu/d9PYoFjoeqihPj9fhM+WGVgM0gsRxa4ODl5U?=
 =?us-ascii?Q?1Ya7x7exhNOU+0hgnVdvXXmizUIZ2KwGDzPDUWFGtQpzCGt3VVPh1LDKehYA?=
 =?us-ascii?Q?fw5SQmD2+1cPnFkIv3djOPUyi/8G4Vy+VhQ5ijljEe07OfGL/5Eh2wbKryNz?=
 =?us-ascii?Q?jQ+gq5pcJT0vZKEyhRuuqEMaToQ2ycOVRV8u3gHi+8RphqRoY0Mj1Xuv9j2T?=
 =?us-ascii?Q?Tbjv+Ora1pCPfjYqIGURsu+54xIy19fhrog3LxkL50kk3gUB6/cZ5JmuYI8z?=
 =?us-ascii?Q?HJz0HwvhdtzgNpUUJwGftUn+Sy7SNTuWPPoJHJx1VVnZcja3ya1K0/iCCxGm?=
 =?us-ascii?Q?iyA5ejWbqAtuule50A8reKc58Z54YoUYJBcF0sEXVy2KpCpRYI5YM6cGbIHH?=
 =?us-ascii?Q?SYHIl+uIXFa0jX8PArJaDaiQN/EgwsbSyJT1Ipe9k3YzIGkgz/GDLD/1NWTv?=
 =?us-ascii?Q?WFGOUsoWveavMgKPqhBzCcCZ2WsSqyI6nbXZzxbd+sxi02YKd29JEwqXpVh0?=
 =?us-ascii?Q?EcWB0JJ1qyAG0VLP/+BXlSbv92OkBK1ri0B5cR8YeIejNSensZgz4RnwaClF?=
 =?us-ascii?Q?mNxFWi29trEXv3y2NWoTedj45kMMFgOjA4w4hJxwPsdOO96gxTavx2kIbki0?=
 =?us-ascii?Q?bBdGatU+YkbBRVBBuF0NIFt4S5HIJnqlCAWB5hQ8Gz417f4+3mG4ciYRJKHv?=
 =?us-ascii?Q?22ZypdoFwML2J/f4e4fNJlY4bxZnMdkW+qL7TvyRXTx1RpLwzcznnpTfHoC7?=
 =?us-ascii?Q?8Nn5HfKLSl9qjLex4fC+CL8sWIraHB9BdB0SngT2aPXR5QvkKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 16:09:15.1223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a654b0a1-3dcd-48f0-bfc2-08dd058fd9fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113

Add links between a VF's struct pci_dev and its associated PF struct
pci_dev.

The hardware domain is expected to remove the associated VFs before
removing the PF. If removal happens out of order, print a warning and
return an error. This means that VFs can only exist with an associated
PF.

Additionally, if the hardware domain attempts to remove a PF with VFs
still present, mark the PF and VFs broken, because Linux Dom0 has been
observed to not respect the error returned.

Move the calls to pci_get_pdev() and pci_add_device() down to avoid
dropping and re-acquiring the pcidevs_lock().

Check !pdev->pf_pdev before adding the VF to the list to guard against
adding it multiple times.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19 (the next patch depends on this one)

v7->v8:
* re-add logic catering to adding VFs without PF for backporting (split
  removal to separate patch)
* move & reword comment about is_extfn
* check pdev->pf_pdev to guard against multiple list addition
* re-indent pf_pdev initialization

v6->v7:
* cope with multiple invocations of pci_add_device for VFs
* get rid of enclosing struct for single member
* during PF removal attempt with VFs still present:
    * keep PF
    * mark broken
    * don't unlink
    * return error
* during VF add:
    * initialize pf_pdev in declaration
    * remove logic catering to adding VFs without PF

v5->v6:
* move printk() before ASSERT_UNREACHABLE()
* warn about PF removal with VFs still present
* clarify commit message

v4->v5:
* new patch, split from ("x86/msi: fix locking for SR-IOV devices")
* move INIT_LIST_HEAD(&pdev->vf_list); earlier
* collapse struct list_head instances
* retain error code from pci_add_device()
* unlink (and mark broken) VFs instead of removing them
* const-ify VF->PF link
---
 xen/drivers/passthrough/pci.c | 87 +++++++++++++++++++++++++++--------
 xen/include/xen/pci.h         |  8 ++++
 2 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 74d3895e1ef6..3fe2e7884f45 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -333,6 +333,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
 
+    INIT_LIST_HEAD(&pdev->vf_list);
+
     arch_pci_init_pdev(pdev);
 
     rc = pdev_msi_init(pdev);
@@ -449,6 +451,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
 
     list_del(&pdev->alldevs_list);
     pdev_msi_deinit(pdev);
+
+    if ( pdev->info.is_virtfn )
+        list_del(&pdev->vf_list);
+
     xfree(pdev);
 }
 
@@ -656,24 +662,11 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
     const char *type;
     int ret;
-    bool pf_is_extfn = false;
 
     if ( !info )
         type = "device";
     else if ( info->is_virtfn )
-    {
-        pcidevs_lock();
-        pdev = pci_get_pdev(NULL,
-                            PCI_SBDF(seg, info->physfn.bus,
-                                     info->physfn.devfn));
-        if ( pdev )
-            pf_is_extfn = pdev->info.is_extfn;
-        pcidevs_unlock();
-        if ( !pdev )
-            pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
-                           NULL, node);
         type = "virtual function";
-    }
     else if ( info->is_extfn )
         type = "extended function";
     else
@@ -698,12 +691,48 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     if ( info )
     {
         pdev->info = *info;
-        /*
-         * VF's 'is_extfn' field is used to indicate whether its PF is an
-         * extended function.
-         */
         if ( pdev->info.is_virtfn )
-            pdev->info.is_extfn = pf_is_extfn;
+        {
+            struct pci_dev *pf_pdev =
+                pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
+                                            info->physfn.devfn));
+
+            if ( !pf_pdev )
+            {
+                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
+                                     NULL, node);
+                if ( ret )
+                {
+                    printk(XENLOG_WARNING
+                           "Failed to add SR-IOV device PF %pp for VF %pp\n",
+                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
+                           &pdev->sbdf);
+                    free_pdev(pseg, pdev);
+                    goto out;
+                }
+                pf_pdev = pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
+                                                      info->physfn.devfn));
+                if ( !pf_pdev )
+                {
+                    printk(XENLOG_ERR
+                           "Inconsistent PCI state: failed to find newly added PF %pp for VF %pp\n",
+                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
+                           &pdev->sbdf);
+                    ASSERT_UNREACHABLE();
+                    free_pdev(pseg, pdev);
+                    ret = -EILSEQ;
+                    goto out;
+                }
+            }
+
+            if ( !pdev->pf_pdev )
+            {
+                /* VF inherits its 'is_extfn' from PF */
+                pdev->info.is_extfn = pf_pdev->info.is_extfn;
+                list_add(&pdev->vf_list, &pf_pdev->vf_list);
+                pdev->pf_pdev = pf_pdev;
+            }
+        }
     }
 
     if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
@@ -821,6 +850,28 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
+            {
+                struct pci_dev *vf_pdev;
+
+                /*
+                 * Linux Dom0 has been observed to not respect an error code
+                 * returned from PHYSDEVOP_pci_device_remove. Mark VFs and PF
+                 * broken.
+                 */
+                list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
+                    vf_pdev->broken = true;
+
+                pdev->broken = true;
+
+                printk(XENLOG_WARNING
+                       "Attempted to remove PCI SR-IOV PF %pp with VFs still present\n",
+                       &pdev->sbdf);
+
+                ret = -EBUSY;
+                break;
+            }
+
             if ( pdev->domain )
             {
                 write_lock(&pdev->domain->pci_lock);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 1e4fe68c60fb..977c0d08f78a 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -153,7 +153,15 @@ struct pci_dev {
         unsigned int count;
 #define PT_FAULT_THRESHOLD 10
     } fault;
+
+    /*
+     * List head if PF.
+     * List entry if VF.
+     */
+    struct list_head vf_list;
     u64 vf_rlen[6];
+    /* Link from VF to PF. Only populated for VFs. */
+    const struct pci_dev *pf_pdev;
 
     /* Data for vPCI. */
     struct vpci *vpci;
-- 
2.47.0


