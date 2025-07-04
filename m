Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E819AF88AB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032835.1406277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXN-0005jZ-Ag; Fri, 04 Jul 2025 07:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032835.1406277; Fri, 04 Jul 2025 07:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXN-0005gX-24; Fri, 04 Jul 2025 07:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1032835;
 Fri, 04 Jul 2025 07:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXK-0003s2-MX
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2412::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b69cc27a-58a5-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:08:42 +0200 (CEST)
Received: from MW4PR03CA0099.namprd03.prod.outlook.com (2603:10b6:303:b7::14)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 07:08:38 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::5c) by MW4PR03CA0099.outlook.office365.com
 (2603:10b6:303:b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 07:08:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:37 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:35 -0500
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
X-Inumbo-ID: b69cc27a-58a5-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm1AJuj2is0vz0HlZHyC9N4I9PI5sSHlNFLKBPqVGvHHmA0t3nYZ1xdXoLXu0ya1iCKrtWNPpNweIGNqRiEviTZ3rlaXHuH0S6090bRkchzZ9aK+CMyJAczjcrLycWaci/bf7FT70aCArt/uUvPNjiANYmIl2Ag+NlUAIJCpFHvtwBxMSyWwiIu0xxcQ+eKOaipH1nhwZhGT9hccgE8wKyz5G93Po4RMwUEEfeDIBGjcz/z692dW2ESDol0GjGS7euq7wEBgLfIz/XZWqiE9ovFv1sO3DnpgN50J8v/aPGvwSs479N5T/qvHLd8DJQBj9CPPJAPiL+z4IHeI+zNX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqZvbrMNE+ey5L9G8HaGxdm2GRZNKIeot3QGsepWI1o=;
 b=nGFjofdQsUqt4IHwVSb+lOScPGq0ErCojQ8+I8clUcHUYVURrYTTo8BamPwQpmxyaF3lSNnJ8rgH+eKbHutbTMS4TzFstQeZbImXLJ8jksJy9MzA3bTNDOjmawMJn1R43cCjdwILcK6Uychsn84VjeZnTcbt2aRdyQTuocWlNJtO9KQyE3cW2PLH8YjKWBYX1xAo/nikLa44KU4cf/WaBYiimgZrXwE3Alcqnr/GIaxZgCMgXPt901GyD8QTTP3Z3eeZzL+W67jjSjW2hGpD6gSx+fjlMXN8l+i135IgtDWSuoemMpe2eR/e837GaX/dQspjFNFe9FbR5GbRB7KUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqZvbrMNE+ey5L9G8HaGxdm2GRZNKIeot3QGsepWI1o=;
 b=4u1ZcdX0wWSOgcwjxAWjqtfVlptFCN5c1znXmRp1hUl5gvDEzI493J64gGhxbRQKI+1qTvvj6eANqXoAX3xlGJy6kqQamcOO1zERzfe7g0yd537KGlEH2VutzetGWGGlz9NfFrLl0F8CYK7PgnTPUs1WFpeSKsnjbnazqCfxfv4=
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
Subject: [PATCH v7 8/8] vpci/msix: Free MSIX resources when init_msix() fails
Date: Fri, 4 Jul 2025 15:08:03 +0800
Message-ID: <20250704070803.314366-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704070803.314366-1-Jiqian.Chen@amd.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5410a0-2173-4a19-6235-08ddbac998fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlgyOWJYc1A3T3UyN25rczIwVCtmb3RYZGlLN2NZU0NlTnNGb0FHb0w0YXhF?=
 =?utf-8?B?TUxQK1hYZ3RsK0dIdlJIcnBVcGhWZkVmaUVUV05tZlkwRGt2OFpUUkFSSmZS?=
 =?utf-8?B?WjVzSitYb2Y5OFJySytYQ2FVL2EzQ1psbEhhL2pkcFZuQTBWL3FQdDNyMHFC?=
 =?utf-8?B?YllFV1I0RWZPZUxESDhzWnZKck01MnR4ZVFhRVRJaUY4b3N6T1g3VFJqWHc2?=
 =?utf-8?B?WDA1ZElXaWRWZEJmTXQ1OGhlckxCUWVFNk80OHpRaVY3dGRjZ0JXQWFIMUlo?=
 =?utf-8?B?aHRFblVGL2RvN2dDSjg2Z1RmeTIxc0J5N1p6aDlVa2ljRmhwYnhMa0J3QmRk?=
 =?utf-8?B?QkxKTUEyK2JRWjJUNS9CM2g3eGYvcHBGMlNoUkJPRWJoWXVWME50Q3Q3Tmt4?=
 =?utf-8?B?RGlTdjFzcm1xSVg5emNHWitaVExvdVNndUxHRk5KcGVDSVkxYnRGMTJUZWNG?=
 =?utf-8?B?T2h6N21TMEhHdTl5WlZ4MkUzTFNQWFNoYXRVVEpFTTFoSjY0MVFnamttMUVq?=
 =?utf-8?B?bVJod3JFWWZEMXdsWlpJWjFrUnJDUS9ZaHNiYWN1Yy85bG15SWdtNzVmUmtF?=
 =?utf-8?B?ejZRS3VBVjh6OXpiekxWNDF6NytJMHgreVBxeUFmVnVONUlFK1FCMDNsMnli?=
 =?utf-8?B?RmlmZ0xmSmdTNVhMOTRPakUwcDZHV3ZtWmh5TVplR2ZJSDN1WHlhYnVhN3BY?=
 =?utf-8?B?cmoySmRERDR2RWdKQlBodDJFUE9jSnAzdGRHVWh0d24xbENWakQ3Z2VQRVVW?=
 =?utf-8?B?UndGQ3RocGszQnl0MkRjVVJVYWNFcTJKZDEwbEhIZWRwaEk3SzBLdXdFSFIw?=
 =?utf-8?B?OVU2VkV3aG1OU295M3dwakVZZ1VUTFNRM05EWkhVUWlENXNDTkl1ekRMN2Fi?=
 =?utf-8?B?SkJmc2JuVjlQazNxOU1zcmVCUnVBZnFZTGl1V0p0NWEvYWN0MTBHd2hDc3NR?=
 =?utf-8?B?alg3dHNmRUE3TTY2SXNieVJMOVltL3VMM1NmSWZja0o3aDkxYzRkRU4vNnR2?=
 =?utf-8?B?MHA0UXl2UjN6dWdyTmdHcWRFR1dCRGNQcEVIbVArSEI2ZW9lNU40TWxiMk1C?=
 =?utf-8?B?ZTZVMGttSDJkVWxMMXpjVldoM1FweDJGeVBFNXpIcjFBSy9naTdkNEI3NVpz?=
 =?utf-8?B?eUlWeE5XTm5GcDAwbWY4V3RPMkZMZTliMURqN3Nxb09wTVFwdzBhYkhuWFdl?=
 =?utf-8?B?R2c1SUxVKysrL1pjVit0NkZjTTJSTjdFK2laMHR2YVJES1Bta1l1RmZrbk5M?=
 =?utf-8?B?eEdjU3FxalJiVFhOS1FuN2kvL3p5VXZLbG03VU9scDlJQkVPWlBySWFraDJo?=
 =?utf-8?B?N3dKV1JONGtzanhxZkU3WVpjeXBVUnVMUnV2b1NYZW9SaHFsWWhtY0IwSVp3?=
 =?utf-8?B?ejZ0L0tVbFZ2b1R1aGhKcmE3ZFdyN3pwTWFHd2hheWErSWYxa3RPQ21EYi9V?=
 =?utf-8?B?V3M5VzhTQjRseUNDSUJYdS9yZjlPVVJkUUxqbkQ3NHRyYTFmaTV0ZjhSYTh4?=
 =?utf-8?B?NklnZ2FVMkZLRE02U05VenIybDBxRFF1eDZESUxXUDc0dzhzMEFEbS9Wd2Nn?=
 =?utf-8?B?bkRiMCtzRUpIbnJBL1dpVzlLWW5NMXYyWHZuZFNtMFJZYTFFTHczN0NqWWRu?=
 =?utf-8?B?R2VTUFhVcWxIVlB6VmIwL25VenVJL0g1a3RucEpJSGZIZFBRZXV3aDhaL1pT?=
 =?utf-8?B?NVdOWXNBSmY2VXpqNW0wRVJVZThxRkRDdnc3Q3FicHBBRDZPVmdOYWh5QzFn?=
 =?utf-8?B?M1QwNm9xV0ZjcjVLbmdFY2JvRm9EanJHQmtWU2dDY0NUd2NPT1F5ODdzVDE1?=
 =?utf-8?B?cUV5YkIzN2Z6U3A3REt5cXJwc0J3bGZqMGh5VVJPVmNvTndrcnlBc2xQeDhq?=
 =?utf-8?B?d1VBaTVOVzZibG5BRzdDZjNmNDVQU2RyVXdIdmtJa0lGYUNoS1JrMmYxR3Qx?=
 =?utf-8?B?dk5TQXhraGlmV0NmcXlyYjRQWlc1MVN0UVU4R2ZZSDVvVVVUaytiT2RrVzZP?=
 =?utf-8?B?Z1djb0Q1c05QSjVPVDNUUFlwQ0FKcEVHd2VjTkxtbDcxaXpvK3NXMkZ2aTFi?=
 =?utf-8?Q?M3P9l+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:37.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5410a0-2173-4a19-6235-08ddbac998fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430

When init_msix() fails, current logic return fail and free MSIX-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSIX capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSIX.

To do that, implement cleanup function for MSIX.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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
 xen/drivers/vpci/msix.c | 54 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index a1692b9d9f6a..114280337f3f 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -36,7 +36,11 @@
 static uint32_t cf_check control_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    const struct vpci_msix *msix = data;
+    const struct vpci *vpci = data;
+    const struct vpci_msix *msix = vpci->msix;
+
+    if ( !msix )
+        return pci_conf_read16(pdev->sbdf, reg);
 
     return (msix->max_entries - 1) |
            (msix->enabled ? PCI_MSIX_FLAGS_ENABLE : 0) |
@@ -74,12 +78,16 @@ static void update_entry(struct vpci_msix_entry *entry,
 static void cf_check control_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
-    struct vpci_msix *msix = data;
+    struct vpci *vpci = data;
+    struct vpci_msix *msix = vpci->msix;
     bool new_masked = val & PCI_MSIX_FLAGS_MASKALL;
     bool new_enabled = val & PCI_MSIX_FLAGS_ENABLE;
     unsigned int i;
     int rc;
 
+    if ( !msix )
+        return;
+
     if ( new_masked == msix->masked && new_enabled == msix->enabled )
         return;
 
@@ -656,6 +664,44 @@ static int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static int cf_check cleanup_msix(const struct pci_dev *pdev)
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
+        printk(XENLOG_WARNING "%pd %pp: fail to remove MSIX handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    if ( vpci->msix )
+    {
+        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+            if ( vpci->msix->table[i] )
+                iounmap(vpci->msix->table[i]);
+
+        list_del(&vpci->msix->next);
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
@@ -677,7 +723,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
         return -ENOMEM;
 
     rc = vpci_add_register(pdev->vpci, control_read, control_write,
-                           msix_control_reg(msix_offset), 2, msix);
+                           msix_control_reg(msix_offset), 2, pdev->vpci);
     if ( rc )
     {
         xfree(msix);
@@ -710,7 +756,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     return rc;
 }
-REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
+REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
-- 
2.34.1


