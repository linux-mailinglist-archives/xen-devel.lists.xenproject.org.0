Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BAB133ED
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060941.1426534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2b-0005qm-Hh; Mon, 28 Jul 2025 05:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060941.1426534; Mon, 28 Jul 2025 05:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2b-0005lw-AP; Mon, 28 Jul 2025 05:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1060941;
 Mon, 28 Jul 2025 05:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2Z-0003wp-Ih
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61aab587-6b70-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 07:04:46 +0200 (CEST)
Received: from MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::19)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 28 Jul
 2025 05:04:41 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::58) by MW4P223CA0014.outlook.office365.com
 (2603:10b6:303:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:40 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:38 -0500
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
X-Inumbo-ID: 61aab587-6b70-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQlYxc/MUXVnM9hyekTDL/nRjwdN8+biFQS+h2kE9yjpCRgwroEdi9xUlP8KjDHmovdj20z0JMgHDpUeaUBrHwnGuKSrPi6YmdbmrzqtYMIcDq0iEOJHFcPZaTXXrZon+aPYn0a3UlwhQSmi6Sj4e1vnx6XRT9ZSeEm2qBXnnqcieZFhATthpga0UiBQLrowLT9sp0pbY9vjxP5VjBg7qanPkwCfKOpSP97hUJuTyBVdht+N7ncqGMN0cdxxNYNMmR02Yu+d+APRB+1yj3GbYZTTcXU6UM3Ib4dsdF1oHUMLzdw9IHQkq1YLO46+pWREQzIKE9DXIyd5eze0FEAtzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzrG6xJejzDk2WVDHKawcisKyh3uGIcbNCFr48TUTow=;
 b=Y+dZ3ZuyR9rmWLnAtmfpblviWMdwWUbZMfq3E/1DUj6zaPxSOJxY5Y1nGimYDQ33OITyEjXJIpDV8aPBHaNz9zyNHw/eRcBVlaIiAmL4M/UN8Td85ejL1rIE1kbkC3thtWIuVRLsJQZ/LdGGRvk8wsl9BAi3ZE/W/ACbqGsdhrqCp40itmLskZSUk+/N07GJWC7/Gl5R/JDQ4I9sXlQUTJgVtcFPfDry0mHxML0MV5kT4hbnSFckdSOen8Xdif7UwUUlkyLB4MwlzUGNMK0PN7yb5eIrcowa5Zhc7ituhQ6Kt0/PyRAtpvWTe3U6KYMPeLb0HfIbVI+hbt1RVahs/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzrG6xJejzDk2WVDHKawcisKyh3uGIcbNCFr48TUTow=;
 b=lqEDCLlAyFk8c5tTfbNRBNQF+cY4y9WFEz5jhykV8Zc1LBj+LTLjZH+fM5VZDJyM9uE1TAdI8xhmnCwP7JiYfkO99cr2QanbbSWWJqm6BbVHRYL3E9DGsbHpyxjrSnwNHdtzAu3xi6qJP9waWgVUye6qqGQiYpLtu7bkTYGLaIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 8/8] vpci/msix: Free MSIX resources when init_msix() fails
Date: Mon, 28 Jul 2025 13:04:01 +0800
Message-ID: <20250728050401.329510-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728050401.329510-1-Jiqian.Chen@amd.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 152b6474-2782-4ef6-7d82-08ddcd944277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFJReGNpV3l4UlZBOGZDV3RiRkhyb0NOTDR0U1dTOXlncEhuZFZSbkpIQXhX?=
 =?utf-8?B?WTJ2a1pMbHVMUFlRcCszZG9WTWxLUXcwVmlGeGVwTURSVXNDK2xWQjFibm1t?=
 =?utf-8?B?RXNIN0VXdlJGOWswdWwyV0tNODREVml2NjJqRE5tVERJcDV0bVlWeXdqZjVk?=
 =?utf-8?B?ZW9zWGUvWXQ2d1VBNis2NlpBV3ljTzJWODVZMFNhYUtiVWxvKzFLbTFRT3Qw?=
 =?utf-8?B?bmFXdnJIREZVWDV3SXpOVm9XZXlvaEd3NXhyU3c1bHI3K1RBa21QQzNsNXVr?=
 =?utf-8?B?aFVXOHA1OTRxeUpnZjJjd0IyNW5KL3ZtWUYrV3lDQjdZa215eTZYQTVwTXJl?=
 =?utf-8?B?ZmhRZVlINW5VN29aYjVKWUd6NEYxa1YzYkwyU0pCWG1zTmwzbnJMQ1lDMnlt?=
 =?utf-8?B?ZzhFcG5GaDlRZHdLU2VSZlJoZXM0anZ0d3M3dXVQZHpUWHR3cDN3dUx2ejhU?=
 =?utf-8?B?bzlYUWUzb2FxZWZ1My9Ic3RzM2MwV254WG1qakNHWlBuZ05PUVFPdjIrTmJj?=
 =?utf-8?B?Q3Z2NFFwUGswRHpwYm56MTVqNUl5VEcxR0JMRDk5MnVoOEVOU1ZpWnRJVUZh?=
 =?utf-8?B?NXFyNW8rYzVyS2lFN2xITlpWanFiK01aKzNkRWN2eHdKc0NMTHFuRjgvS251?=
 =?utf-8?B?VS9mTDJpYmUvZmkxVGNEMEoxWkJNWDhKQVNrVEpKWSs2RE1nWVlKUExFSjcz?=
 =?utf-8?B?RE90NUE3UHdlNUlwb2RRRFQxZ2ROQytUSUpmTy81YURLU3FNcG1ZRnNLTHpX?=
 =?utf-8?B?VGRtUlVQazN5TmVBZGZpNktOZk1yU0FzK2Y2d0VVaEh5RWpMYkdmUVY1OTFo?=
 =?utf-8?B?M0NGNytQZm85UVpRVlFMTVNzaDN5aHNKU29oSm9CZGV2eHFuTGhQTU9wRE0w?=
 =?utf-8?B?MFFWN2VDTUEyc3JhRUhSTC9NYmdUTGVuVTBFQnFDcGMvM3JQeDVSdzAvZDQv?=
 =?utf-8?B?bkx3M3o0MkgvVWhYTDlqQnZ4V1QwSDJvK2NoWmFGOEE3aEJTRGFIVnR5ek1h?=
 =?utf-8?B?dm41K0JuY2dPM09kL28wdk12OUdMNW82OTFTNnBVR3RHQWhCSStMSExUNDl5?=
 =?utf-8?B?RTlpNzJqVW5odVhEaDF5anJuN0NxS2puNnJtR3NDblg3aDY1VkZTYzkra3R1?=
 =?utf-8?B?VVFPNnFFUjcvT2R6QlovWjg1NkllTytVSWFlVkE1NWN3WXgrdnFsWjRCTStw?=
 =?utf-8?B?clNMeGJDd0wzUFhBcXdGYXNiekN0eGhSaldNTmJVYldNT3ZKaUNIY3JLN1ZO?=
 =?utf-8?B?Unp0bWlWcjhGbFk2TDc1bklMeThhVkdIKzFRU3Z1SXpKR2F1YS95S1JJYnc0?=
 =?utf-8?B?RDdwN1N5eXZVUWpwN2ZLU251YkVGN3V2eEFuaVVRUVhEem9id3p4VUNEVlZ5?=
 =?utf-8?B?cGhBdVUzSU9JclgrY01TQVkxZkRhUGo5THNNN0V4NHQ5b1ZET1pVQnRWQk9q?=
 =?utf-8?B?aDFRNU5MNHdranF6QUgzcjBFR0xWMmtEQTI5UGlML1I0Tis2cUJNNEpZa3Jr?=
 =?utf-8?B?NmtaNDJ0ei9xZFhEU2NMNE56bGNvUnd2R3NhN3d2OHllc05hNEx5VjRkTE0z?=
 =?utf-8?B?bktPUm9LU1ZlaGtBWG1SMDNST0tMVFlJN25DTEFGUlFjUnIvN1hCUFpmOHVi?=
 =?utf-8?B?aXE4WlNlaHA2Q3M1SVJQcjZid3hNQmtoMS90Y1dyMExTcnNEYmdaeDdRTlRu?=
 =?utf-8?B?SUZ3S1p3N1dHaHQwMDcxSnJXNlBPRGNaQmQvUUhWNG1jZk9MU3ZZQnNZUGgw?=
 =?utf-8?B?b09FS055V1M4VG11SFYwbVdhdUxOT3JYZytxOFJraVBmUTJvbGlIS3M0cEwr?=
 =?utf-8?B?cVo5SldLMVRSQ3p3cVJZNGxDa1I0NDluNVdwa1QrMGFFL0RVZjNJRVZhaHdi?=
 =?utf-8?B?UWdMWStLTWVaUzBUNnZKd0QrVmtFV2hSaGNjNThWZm90dXBHZFJaQnFUblhV?=
 =?utf-8?B?VWlzYmVCbGpJbXlHd0xkRnNWaVNyS2VNcm96b0lFaGJTR1dvRzgrTEo1SmdB?=
 =?utf-8?B?cm81NUJYbmNqeGRiemVMYk9MSGJvMFh2V0N4NVphK3J5UDdtRUs3eEl4SWJS?=
 =?utf-8?Q?YIH9bq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:40.9116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152b6474-2782-4ef6-7d82-08ddcd944277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947

When MSI-X initialization fails vPCI will hide the capability, but
remove of handlers and data won't be performed until the device is
deassigned.  Introduce a MSI-X cleanup hook that will be called when
initialization fails to cleanup MSI-X related hooks and free it's
associated data.

As all supported capabilities have been switched to use the cleanup
hooks call those from vpci_deassign_device() instead of open-code the
capability specific cleanup in there.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v8->v9 changes:
* Modify commit message.
* Call cleanup_msix() in vpci_deassign_device() to remove the open-code to cleanup msix datas.
* In cleanup_msix(), move "list_del(&vpci->msix->next);" above for loop of iounmap msix tables.

v7->v8 changes:
* Given the code in vpci_remove_registers() an error in the removal of
  registers would likely imply memory corruption, at which point it's
  best to fully disable the device. So, Rollback the last two modifications of v7.

v6->v7 changes:
* Change the pointer parameter of cleanup_msix() to be const.
* When vpci_remove_registers() in cleanup_msix() fails, not to return
  directly, instead try to free msix and re-add ctrl handler.
* Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
  init_msix() since we need that every handler realize that msix is NULL
  when msix is freed but handlers are still in there.

v5->v6 changes:
* Change the logic to add dummy handler when !vpci->msix in cleanup_msix().

v4->v5 changes:
* Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
  since cleanup hook is changed to be int.
* Add a read-only register for MSIX Control Register in the end of cleanup_msix().

v3->v4 changes:
* Change function name from fini_msix() to cleanup_msix().
* Change to use XFREE to free vpci->msix.
* In cleanup function, change the sequence of check and remove action according to
  init_msix().

v2->v3 changes:
* Remove unnecessary clean operations in fini_msix().

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msix.c | 44 ++++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c | 16 +++++++--------
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..8ee315eb928c 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+int cleanup_msix(const struct pci_dev *pdev)
+{
+    int rc;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msix_pos = pdev->msix_pos;
+
+    if ( !msix_pos )
+        return 0;
+
+    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    if ( vpci->msix )
+    {
+        list_del(&vpci->msix->next);
+        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+            if ( vpci->msix->table[i] )
+                iounmap(vpci->msix->table[i]);
+
+        XFREE(vpci->msix);
+    }
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports MSIX by default. So here let the control register of MSIX
+     * be Read-Only is to ensure MSIX disabled.
+     */
+    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
+                           msix_control_reg(msix_pos), 2, NULL);
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -710,7 +752,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
      */
     return vpci_make_msix_hole(pdev);
 }
-REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
+REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 4b8e6b28bd07..258356019535 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -321,6 +321,14 @@ void vpci_deassign_device(struct pci_dev *pdev)
                     &pdev->domain->vpci_dev_assigned_map);
 #endif
 
+    if ( pdev->vpci->msix )
+    {
+        int rc = cleanup_msix(pdev);
+        if ( rc )
+            printk(XENLOG_ERR "%pd %pp: fail to cleanup MSIX datas rc=%d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+    }
+
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
@@ -332,18 +340,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
-    if ( pdev->vpci->msix )
-    {
-        list_del(&pdev->vpci->msix->next);
-        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
-            if ( pdev->vpci->msix->table[i] )
-                iounmap(pdev->vpci->msix->table[i]);
-    }
 
     for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
 
-    xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 514a0ce39133..6f9c7b6fb38f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -220,6 +220,8 @@ void vpci_dump_msi(void);
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
 int vpci_make_msix_hole(const struct pci_dev *pdev);
 
+int __must_check cleanup_msix(const struct pci_dev *pdev);
+
 /* Arch-specific vPCI MSI helpers. */
 void vpci_msi_arch_mask(struct vpci_msi *msi, const struct pci_dev *pdev,
                         unsigned int entry, bool mask);
-- 
2.34.1


