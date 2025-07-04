Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCFAF88AD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032836.1406284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXN-0005nv-MM; Fri, 04 Jul 2025 07:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032836.1406284; Fri, 04 Jul 2025 07:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXN-0005jM-DF; Fri, 04 Jul 2025 07:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1032836;
 Fri, 04 Jul 2025 07:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXL-00045b-3D
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2418::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b64fe729-58a5-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:08:41 +0200 (CEST)
Received: from BYAPR08CA0049.namprd08.prod.outlook.com (2603:10b6:a03:117::26)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:08:36 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::1a) by BYAPR08CA0049.outlook.office365.com
 (2603:10b6:a03:117::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 07:08:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 07:08:36 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:33 -0500
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
X-Inumbo-ID: b64fe729-58a5-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCeM7vHfpAx4guCV0NlhnsMR/u4TTebMDuvF/oQTY5XG0EP+xGigwUDU489diLonuHjSNmkW2pRumw3XFnyBFdq97z2mNvUCptMbimo9jtSHDn5YAe8e5iL2CSWIFo6FLmbUqrDlmGWYtZn6EUG2z3euUOAwSq/4ZsEAF0HN83oJJKBFQHqAzoNuxUdgWPvuK/YJRRzsHdyyMArkVKhYALkcFbxMb0ze+LgieQQpTs+ZK6k1zjQ3993lgVVNeXT4IP0i1eJjjfQ4mYaAsnXMpAs7gBzKUsdNOamK2prdlwEOPQvwmN57FkleZASlFKJ1xsOeNN5lw2OnlK6aCLpO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W//wou6ekVwjc5mikSWHmjdULaHLRzIQwfIddeL5DjI=;
 b=vODXk061/PPtp3fkQhwb2B09V/k7e71v/pSl4OWWz4+8SyT2qt42OwXloY6HmjdB/yftkVml73E5h0wOwNJcz/1zVGc/NRkOB/oEZPLZQJkuhNrGk0nY8qIHDKHJbs5ckwzV88MAATYxMYcz6rcKEJGGE7KuDI+EAIuAKh7OkpxnlPdQkm97QWDvmasON4pSRZgz6al72Na3adR+f/tdrptqMpwx4cr7189vDEBUHVEkflXL8teSuqFDhs+IwWn7MlmvW5eUFqvy1mjdv0hrA/4cIgwSv2c9cLLV5o2rLS/Eid0nXHyvWGRYnZgT9VzeY8kmImapCvcCviqfWxS61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W//wou6ekVwjc5mikSWHmjdULaHLRzIQwfIddeL5DjI=;
 b=tx3Pfo8BD4mq6AqUIIbqt4wAEfjtnhuiMrj0c2RqTZ/93N+Z1k2vEH5S5OOVYg0pOosmcf+bJY25RxFRMM4aMPcb8U7nNeB1bgRDFgT7mIuZ/0iRQHv0psUvEJ9dxQPFaKhvSUUdO++lX+GPxm+yCVXhAfUqCYzBCcJbg+iV0tk=
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
Subject: [PATCH v7 7/8] vpci/msi: Free MSI resources when init_msi() fails
Date: Fri, 4 Jul 2025 15:08:02 +0800
Message-ID: <20250704070803.314366-8-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9dd3b0-79e6-4f5a-b00b-08ddbac99840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVp6cFFjRll1NG5jT1ZCQXVEa1RBQ2NKQitYUlhhZk9rT0EvQ1JDa29ZQzlz?=
 =?utf-8?B?bkp0L3Uyc2JndXJSc2hnemJpaHFST2V2bXNNZTRQUzFTUktmM2tLMGo0d1c2?=
 =?utf-8?B?UHJZNExLOGUzQ1NRWXFkYk5GbWlVZnBKVm5yajI5bi9nL1dmN0p5aGZ1OVAx?=
 =?utf-8?B?UkZwYTkxVncrTjhVcXVBOWVjSWhOV0JBaVA0bGdiVlYwK3NOdWNVd0k5bnhV?=
 =?utf-8?B?R1BzK0pNaEdzWEpNeE84UnZDY3dPTGw5WlJZcXk3NkZiRWJzdnBSNGo4ZEdm?=
 =?utf-8?B?TUlWSzNDeDUvYzRmc2pBTWUwNDh1WXM2dWc0VjBJNHA5ZkxuRTh3V0FGMFBW?=
 =?utf-8?B?bWd6czZDTFJNcG8xR1ZLZW1iN1FseUtpZUhiTG5wSGRvem9aMFI0OXVWQW1Y?=
 =?utf-8?B?dEZ4cFFQdWRUV0Q5RmcwdytFWmQ5SkZiWDM0Ty9nejJPY2V1cCsrVUFLMHRS?=
 =?utf-8?B?R0trcER6TWtsMHp4S0ZKZjBuaHBCY2tLUHl4VW9nRkxFSElwTEFPUUtRY0h3?=
 =?utf-8?B?VXU3aWpXTGNPeXJBcCt5RWU0OEQxYktlS2VvMjArVkNVKzZFVm00eVJvZzJZ?=
 =?utf-8?B?bEFvMlRhWi9WaE1GNGk2Z1Zub09uVTNyclRXRm92aitZcVJrZzl1SGE2d2dH?=
 =?utf-8?B?ZHVrdGY5Wk5Xend4TytlcFhYUUJmb2hnN3FxZEs5cUF6TWMwYWlpKzQybHNv?=
 =?utf-8?B?Q05pQmNTdElNSTF5ZWZLZlpvK3lLWk01SnlGTGY3b29yR3ZmN3NOdGxVbEYx?=
 =?utf-8?B?ak02UW9IQS9SSDlERmZhQS9MbVBGb3VwMHNDaC9kRmZYdHk5Rkphb1M0N2Yw?=
 =?utf-8?B?WHY1c1E5YjZvK0lWQkN0SlpsQXdYWk84cjZmZStTRXJqcE9PQzRURzJuQjV2?=
 =?utf-8?B?UnJGYXM4UEh3K1hLK255UkhwTnk0WXZueXJ0b0NSbHU2K1NzbW85eG9iQTFp?=
 =?utf-8?B?ZlpXNkFWaDhjUFg4djYwVlEwd1RhV0RDOEZBSDBYVW43Rm00NnlXN2hjY2VK?=
 =?utf-8?B?QzJiMFYvMitZb3hGUy95aWZxdnBDcUpOem9yMkxacWpSUUNuY0pJVjQ0bTlo?=
 =?utf-8?B?aFk2cWJ4NVJROTJvd01qc1NxTzB3bFV1WUdQNlgrdDRvcUtzZzlWemg2YkF2?=
 =?utf-8?B?bzRuK0xHbWRkMnZhbnl3SThtNmJObWp4a01TbndOd0d5RGl2YnBlVDEyNnBR?=
 =?utf-8?B?amZPUGhkSlo5RHJXTGxCWWgzZkQ2bkJNdmNhTmJBYUY5WG8wQ1hIL3VWbUNl?=
 =?utf-8?B?Q0craWtFN1RSK1NJai9xSmEwTlV2MzM3QmpveWlVOURZZDhGZFZ4NWd1YlU0?=
 =?utf-8?B?TlR4U1FtYVlkaFVrOGdiTFlxSVpsMW0zaUcwMnhtMWIrN1Y4aHNPbEZVNVk3?=
 =?utf-8?B?cmxkR1ViN3R6TjBrVytUVXpTbHRjbEhMTThMYnZkdlRuYjhZazRwU3FEeFVK?=
 =?utf-8?B?QVVDQVRaWVBiaVNCYWJFY0I1NTdHQ1AvejJ4T1lVU3pvUjQrVHkyc0hPclRa?=
 =?utf-8?B?ZnBZM0NLYXk2SUE3cjVFQUpQM3BhRkl5NW5jWEprdXNDSENvaFhPY0JEYm03?=
 =?utf-8?B?a1lpNDlaRmhOTk9hdFB0YTVOZ01OZXgxbDVPdVI3TGdydE5PUGhGTXZPek8x?=
 =?utf-8?B?bERTMFhDV3UyeXJGME43d0ZoUURQZjJZZnc1a08rRkVTbGZTS285c0NuL2FF?=
 =?utf-8?B?RzBVRGprcjhDTUdGK05MZHEzT3hPT2E5ZjZ4V3pnZC9sdlVmK3dyWUtDU0VC?=
 =?utf-8?B?VVd0cjlQYnA5MUZQMHFQVmUrNW9BM0pST0IxVEowMlRicWIrN2hOVG1zb09M?=
 =?utf-8?B?MjRDTFZmakJtL3FKcjE2ODRTcW55QTJJZGNzSmFhWm9zN0g2S2FXZi9ScEJ3?=
 =?utf-8?B?WlMvZklJYjMyTlFLMEtUckFqNEhNcWE2R1ZyQVdIejVxSGFmVzhOdzJ2eXND?=
 =?utf-8?B?UWpkQ3BWZTZRWnJlZlA2ZndlczRaTEIzUU1kZTIzSm9RaHhYb3dONm5ramtm?=
 =?utf-8?B?eUZ6SVZEUXQyWTgxbkcvek5CZmRZMythZklWZUI4aTk5ZHdzME1QTUNjWXNh?=
 =?utf-8?Q?dmcgVn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:36.0705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9dd3b0-79e6-4f5a-b00b-08ddbac99840
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584

When init_msi() fails, current logic return fail and free MSI-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSI capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSI.

To do that, implement cleanup function for MSI.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v6->v7 changes:
* Change the pointer parameter of cleanup_msi() to be const.
* When vpci_remove_registers() in cleanup_msi() fails, not to return
  directly, instead try to free msi and re-add ctrl handler.
* Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
  init_msi() since we need that every handler realize that msi is NULL
  when msi is free but handlers are still in there.

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
  since cleanup hook is changed to be int.
* Add a read-only register for MSI Control Register in the end of cleanup_msi.

v3->v4 changes:
* Change function name from fini_msi() to cleanup_msi().
* Remove unnecessary comment.
* Change to use XFREE to free vpci->msi.

v2->v3 changes:
* Remove all fail path, and use fini_msi() hook instead.
* Change the method to calculating the size of msi registers.

v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array
  to record registered registers.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msi.c | 111 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 94 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index c3eba4e14870..09b91a685df5 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -25,7 +25,11 @@
 static uint32_t cf_check control_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    const struct vpci_msi *msi = data;
+    const struct vpci *vpci = data;
+    const struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return pci_conf_read16(pdev->sbdf, reg);
 
     return MASK_INSR(fls(pdev->msi_maxvec) - 1, PCI_MSI_FLAGS_QMASK) |
            MASK_INSR(fls(msi->vectors) - 1, PCI_MSI_FLAGS_QSIZE) |
@@ -37,12 +41,16 @@ static uint32_t cf_check control_read(
 static void cf_check control_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
-    struct vpci_msi *msi = data;
+    struct vpci *vpci = data;
+    struct vpci_msi *msi = vpci->msi;
     unsigned int vectors = min_t(uint8_t,
                                  1u << MASK_EXTR(val, PCI_MSI_FLAGS_QSIZE),
                                  pdev->msi_maxvec);
     bool new_enabled = val & PCI_MSI_FLAGS_ENABLE;
 
+    if ( !msi )
+        return;
+
     /*
      * No change if the enable field and the number of vectors is
      * the same or the device is not enabled, in which case the
@@ -101,7 +109,11 @@ static void update_msi(const struct pci_dev *pdev, struct vpci_msi *msi)
 static uint32_t cf_check address_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    const struct vpci_msi *msi = data;
+    const struct vpci *vpci = data;
+    const struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return ~(uint32_t)0;
 
     return msi->address;
 }
@@ -109,7 +121,11 @@ static uint32_t cf_check address_read(
 static void cf_check address_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
-    struct vpci_msi *msi = data;
+    struct vpci *vpci = data;
+    struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return;
 
     /* Clear low part. */
     msi->address &= ~0xffffffffULL;
@@ -122,7 +138,11 @@ static void cf_check address_write(
 static uint32_t cf_check address_hi_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    const struct vpci_msi *msi = data;
+    const struct vpci *vpci = data;
+    const struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return ~(uint32_t)0;
 
     return msi->address >> 32;
 }
@@ -130,7 +150,11 @@ static uint32_t cf_check address_hi_read(
 static void cf_check address_hi_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
-    struct vpci_msi *msi = data;
+    struct vpci *vpci = data;
+    struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return;
 
     /* Clear and update high part. */
     msi->address  = (uint32_t)msi->address;
@@ -143,7 +167,11 @@ static void cf_check address_hi_write(
 static uint32_t cf_check data_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    const struct vpci_msi *msi = data;
+    const struct vpci *vpci = data;
+    const struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return ~(uint32_t)0;
 
     return msi->data;
 }
@@ -151,7 +179,11 @@ static uint32_t cf_check data_read(
 static void cf_check data_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
-    struct vpci_msi *msi = data;
+    struct vpci *vpci = data;
+    struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return;
 
     msi->data = val;
 
@@ -162,7 +194,11 @@ static void cf_check data_write(
 static uint32_t cf_check mask_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    const struct vpci_msi *msi = data;
+    const struct vpci *vpci = data;
+    const struct vpci_msi *msi = vpci->msi;
+
+    if ( !msi )
+        return ~(uint32_t)0;
 
     return msi->mask;
 }
@@ -170,9 +206,14 @@ static uint32_t cf_check mask_read(
 static void cf_check mask_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
-    struct vpci_msi *msi = data;
-    uint32_t dmask = msi->mask ^ val;
+    struct vpci *vpci = data;
+    struct vpci_msi *msi = vpci->msi;
+    uint32_t dmask;
+
+    if ( !msi )
+        return;
 
+    dmask = msi->mask ^ val;
     if ( !dmask )
         return;
 
@@ -193,6 +234,42 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(const struct pci_dev *pdev)
+{
+    int rc;
+    unsigned int end;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+    const unsigned int ctrl = msi_control_reg(msi_pos);
+
+    if ( !msi_pos || !vpci->msi )
+        return 0;
+
+    if ( vpci->msi->masking )
+        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
+    else
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
+    if ( rc )
+        printk(XENLOG_WARNING "%pd %pp: fail to remove MSI handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    XFREE(vpci->msi);
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports MSI by default. So here let the control register of MSI
+     * be Read-Only is to ensure MSI disabled.
+     */
+    rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to add MSI ctrl handler rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -207,7 +284,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
         return -ENOMEM;
 
     ret = vpci_add_register(pdev->vpci, control_read, control_write,
-                            msi_control_reg(pos), 2, pdev->vpci->msi);
+                            msi_control_reg(pos), 2, pdev->vpci);
     if ( ret )
         /*
          * NB: there's no need to free the msi struct or remove the register
@@ -235,20 +312,20 @@ static int cf_check init_msi(struct pci_dev *pdev)
     pdev->vpci->msi->masking = is_mask_bit_support(control);
 
     ret = vpci_add_register(pdev->vpci, address_read, address_write,
-                            msi_lower_address_reg(pos), 4, pdev->vpci->msi);
+                            msi_lower_address_reg(pos), 4, pdev->vpci);
     if ( ret )
         return ret;
 
     ret = vpci_add_register(pdev->vpci, data_read, data_write,
                             msi_data_reg(pos, pdev->vpci->msi->address64), 2,
-                            pdev->vpci->msi);
+                            pdev->vpci);
     if ( ret )
         return ret;
 
     if ( pdev->vpci->msi->address64 )
     {
         ret = vpci_add_register(pdev->vpci, address_hi_read, address_hi_write,
-                                msi_upper_address_reg(pos), 4, pdev->vpci->msi);
+                                msi_upper_address_reg(pos), 4, pdev->vpci);
         if ( ret )
             return ret;
     }
@@ -258,7 +335,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
         ret = vpci_add_register(pdev->vpci, mask_read, mask_write,
                                 msi_mask_bits_reg(pos,
                                                   pdev->vpci->msi->address64),
-                                4, pdev->vpci->msi);
+                                4, pdev->vpci);
         if ( ret )
             return ret;
         /*
@@ -270,7 +347,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
-- 
2.34.1


