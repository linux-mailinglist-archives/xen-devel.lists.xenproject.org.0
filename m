Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9184BA2DB8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131216.1470420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23EC-0004we-Se; Fri, 26 Sep 2025 07:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131216.1470420; Fri, 26 Sep 2025 07:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23EC-0004u1-PL; Fri, 26 Sep 2025 07:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1131216;
 Fri, 26 Sep 2025 07:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOXT=4F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v23EA-0004PV-IS
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:50:50 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 842b5f11-9aad-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 09:50:49 +0200 (CEST)
Received: from CH2PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610::17) by
 LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 07:50:44 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::ea) by CH2PR05CA0004.outlook.office365.com
 (2603:10b6:610::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.4 via Frontend Transport; Fri,
 26 Sep 2025 07:50:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 07:50:44 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 00:50:42 -0700
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
X-Inumbo-ID: 842b5f11-9aad-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr21t+ej57ajwAedNluHt0xaBz6MH4WAIwDAo5ckvOEdEwUXkfoiAs3N2tRpLcc8RGxIeoVjFyT/VtTj4iydiCHrPl0GdpBw2E28a8gTWkHl56X/KP8E7MJe4CBtxIDlWkRxEQTecjsmO86Fjs6QaMGheuiU3rK5RXGH4kiLAQJszsl/ExTFGJwR/6+AhSGXrDUjUUvScxW+YXF3P+ImzgNhBbsag14+Y8xbOMqLnayFgTg7DpweXjJ7Dx67h1Sm4MoY2pka7zXAf4hZc+wdc2iN6k7ApgnxU9qUBE69Cjxby5AKeR3aNuGg38G8PicS9v2RXqUvxd2m0BLTdXqQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaLJ7+pe1aPBvQLtTo9+A9wNYi42Nr55akKCwiM69gw=;
 b=kU+T8MNkYUOHUcjmIKkp65H2yE1dk+1aTTctSSNvF4yTIOezAMHOHXBUP3XpPrP0qt9vlN1bh8BWrkBEl3YfbOAT59icdPKFxRQhfaGM0mh23eJSTJ1EncTICFyBFMAke3avYEVW77DAdJH2mtV0w0jMf2arWqPB0Dj5X1oMHI+GnRmC9OGnZjg9e1ovt8xr8q54+pL3QLP2q1H++yD02UzzbHpXq9ZfT14D7w3ZBjjaeyvbZHJkGXUbEiqNuMg/6u8TvKnBKtqiHeIhBV24Reb/JmJWx4Z1D2dLCe/m5PRoGloIdQ38R8VlyVJaQLaMC/uPQFUXX5u6jAY9ESbKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaLJ7+pe1aPBvQLtTo9+A9wNYi42Nr55akKCwiM69gw=;
 b=amhUsKrADTz3gJKQHLszK5Ba6/Bdi+eEb+iWNKaZDrVfMTAkfPFP8/Gvs+5iCsWWbbouoJX6hdT3F5AAYw+MX2zWBYgu+yhfFIKA0JfjQ7HWESq+CQwKmCnOHuRLi7Fo/5Gyn5tSEvLUJ9WkkumhykEHW5/4OY+ibYHq9/BeTts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v12 3/3] vpci/msix: Implement cleanup function for MSI-X
Date: Fri, 26 Sep 2025 15:50:21 +0800
Message-ID: <20250926075021.27967-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926075021.27967-1-Jiqian.Chen@amd.com>
References: <20250926075021.27967-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|LV3PR12MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e354947-da3b-4df5-df94-08ddfcd165b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXdGTThpSGpYNG1oR0g1NUdJMzgzZlUrMXZML2dsbkhoSVc1aG5DMjhBWVlG?=
 =?utf-8?B?T25rNWdUVkN3dTBuQUU4bytJWmx0czZITHNkQTBGNEROaUdpbDZ0NXhJNTNZ?=
 =?utf-8?B?NWFwb0RpS053ZWN4S1h2SXRxNzJVNmpicnhaSnV4MGRsNjUwbVZReDlTOFlr?=
 =?utf-8?B?U2NYaUtoNExHbGJrZ24rTnM1Z2tPbEVPeDZ2Mjd0czNEeVBPbGxSR3AwM1RB?=
 =?utf-8?B?N2FxUDBaRGl1NVBOQVpSVE04NDlXcUtyZS9maFF4Z2plejRiSytaaWE5MG5w?=
 =?utf-8?B?WTNldnhDQkk1SDRsWXVmaUpybDEzU1VkcW9QZWRFd29UeWhyUDg4dGZEL0Ur?=
 =?utf-8?B?TjNKL1NqcFRHeXVJVmV1cTlIaXVhOTc5QzNIK20xbUJuWmNoQ3dDb05qZFhR?=
 =?utf-8?B?SWpycE42eVRKZk1nTGRGSGxlMzgvd2JWMnoxYnZML0pPZlJHY3VPcjM1ZzNI?=
 =?utf-8?B?aVRrTFAzVUVyWmRBRkZwd2tyZFNDRWFqQXA5Y2NNQ1ZZb1QwNzJaWVVHQWlQ?=
 =?utf-8?B?UFN6Qjl6b1krYklXSG5EY0N5VTJmWlZkYTVNVXVwSGJyZERXeGQzQ2ZrNWhZ?=
 =?utf-8?B?dExjY3RKdkIwYmhldnNXYVFHcDA1WndkamVhcDlTWXFUUHJrRVptRG5kQk1G?=
 =?utf-8?B?c2RFSy9RbEovMU9oaGxBV3BNY2htZGVuc000Ly96aFQ3U3JPMDR2dFFlRG52?=
 =?utf-8?B?YU05NmRRdEVKTEZ4VVQzc0doTkRKekhYTnBwWW5jOENaaFNxeHcwc05UUCtT?=
 =?utf-8?B?K2FBanlhRThWaGpkUVJRSGNGMlJFWEZmQTNIQ1VhWWlNQit3MzAwbzdGSDRF?=
 =?utf-8?B?R3poakNVQmFoNkp5MEJad3duc2Q2NGRtcWJtZDJzaFN6OEZrTzFpamkraHBi?=
 =?utf-8?B?MmRHV3dIbFY1TzRyaDhnVGZqYnlVcTNuNmRzYmN1TmpSbDdHNVhXd1Q0T1Fa?=
 =?utf-8?B?ck9SY0JkcENaV2ZTT2dZTzNNd0RpVmFEM0V5T2dDZ2VHQXJkL3JPY1l6TjQv?=
 =?utf-8?B?NG9pYlkzVThNSXJPd1BqMVFiV0xBSlBzOGJRVnlncVQ5am9USWFCaGRPeGx4?=
 =?utf-8?B?WEt1OVV6c1YvWkltV1J3d2FNRWVlcDhaVTdjaC9qcS9jbnlERlBESkpzMkFj?=
 =?utf-8?B?Y2ltN01PVVJJNlR2KzAveUJlcGh3a3hmdzRkeVFuL2ZIb3NGaDd5VEdUUklx?=
 =?utf-8?B?Y01pQ1M2eUdSckwwa0EzRWdGU3FyT3J5bEIrUWZsR0szRVZlMU90alhqWWZN?=
 =?utf-8?B?V3JCdG4yZWF1YmtadHNpT3BuNkxOQTJ2eTFpNkNGV3NpVkVtSnZ3T1hRQW1y?=
 =?utf-8?B?T0N6aGx1aTZtNHhWNGxQVVBZYW16QStZOURzbjlZdGxTalUzYzFMWHlXU05j?=
 =?utf-8?B?K0xURDZrVTEzTDF1MkR3aDVJNGlsNXlQMzNZd0luMkNaUTZ0NnJvUnJuVkVC?=
 =?utf-8?B?YWlZOHcva1ZFOURNTWRpeE9jZXc2QkEwNXJ2K09EYXRWd0oyWW9NQ2VOa25s?=
 =?utf-8?B?aHZTZG90bkN3aTM5Q1NWODUzUzhsYnZ1Zm1mWVZGU1lOOWdZUFZwVjVpY0c0?=
 =?utf-8?B?WjY3dCtQRUJGckVpcWJWMkdldFZWZHk3TXpTTGc5MzdWQWhIVS9nWEtTMkpq?=
 =?utf-8?B?bkYzMFBwUmxreTVlMXFzbndtWnRldFd3dWVTbWlMckg4U0tVMDZVdWpTNXJ1?=
 =?utf-8?B?WHkwTFFOVW42NHdkZkdVcUVzdUdVTXdxaXEvY1B6TCt6dHFsRVZTWXRoeWQ2?=
 =?utf-8?B?OXprYUF4d21QU0JIaDRaR05UcUpzajNGcUJqYkNzUG00MCtNV0xETGd2Um5l?=
 =?utf-8?B?dDdveXJHYmxLWlFBdTZ2L0Nia3E3N2VPRy9nNkpFaWhESTZHVVZJVm05RzhU?=
 =?utf-8?B?NnZKbENHaTJLTmN6cjFMOHFjdXRLeloxWVZsd3FuYUNINTBRN1pWdHlHUDNr?=
 =?utf-8?B?bWg1aldsVm1NMUVibXd6STNWNzYzVFVMQldtcmVCYWFPaTNibnA2eUlza3lB?=
 =?utf-8?B?RHZCZmFhL0NZV1hzdEwrbnJpUnVNUGJRRFpmSUNIb01mWlVnMHBhRnVhU0tU?=
 =?utf-8?Q?2VrcqD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:50:44.0458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e354947-da3b-4df5-df94-08ddfcd165b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403

When MSI-X initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement MSI-X cleanup hook that will be called
to cleanup MSI-X related handlers and free it's associated data when
initialization fails.

Since cleanup function of MSI-X is implemented, delete the open-code
in vpci_deassign_device().

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v11->v12 changes:
* In cleanup_msix(), move check "if ( !hide )" above vpci_remove_registers().
* Remove the check "!pdev->msix_pos" since current callers already do that.

v10->v11 changes:
* Move calling all cleanup hook in vpci_deassign_device() out of this patch.
* Add hide parameter to cleanup_msix().
* Check hide, if it is false, return directly instead of letting ctrl RO.

v9->v10 changes:
* Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().

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
 xen/drivers/vpci/vpci.c |  8 --------
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..38a14c0ded05 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static int cf_check cleanup_msix(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msix_pos = pdev->msix_pos;
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
+    if ( !hide )
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
index 7aaf015f63d4..3c9bebcbe977 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -356,18 +356,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
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
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
-- 
2.34.1


