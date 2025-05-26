Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D704AC3D30
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997342.1378236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPb-0003qg-Dh; Mon, 26 May 2025 09:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997342.1378236; Mon, 26 May 2025 09:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPb-0003nm-9n; Mon, 26 May 2025 09:46:27 +0000
Received: by outflank-mailman (input) for mailman id 997342;
 Mon, 26 May 2025 09:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPa-0003hN-Kj
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4869a737-3a16-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 11:46:24 +0200 (CEST)
Received: from MN2PR13CA0008.namprd13.prod.outlook.com (2603:10b6:208:160::21)
 by PH7PR12MB9101.namprd12.prod.outlook.com (2603:10b6:510:2f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 09:46:19 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:160:cafe::17) by MN2PR13CA0008.outlook.office365.com
 (2603:10b6:208:160::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Mon,
 26 May 2025 09:46:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:18 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:16 -0500
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
X-Inumbo-ID: 4869a737-3a16-11f0-b893-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwnjWgcs0IiU43Xwx6GaXKIyJcm42vMmljHS0dQXhOqykzWMTsBPLdfhrt/B3MMKudZbp2gRDR8UQ0Zj8H+rs+GWTXcJcOKYTGuRE/+/fTcNT7ayb7bG2S95yktbkLvSL0xA6lw8Ngdve8A2xxsKE58D1qBHmEFtfO6WGIksLQTM5+5PvqQ61Sa0WGvLkQux9r8c5K9BfSALCioj0uZQDpPASA1nO7ORs2raGC10rlPCAsV5rmc+k9gDhcXTrUx9/ycGeyAE1hfhgU9bpWTHvUr2P12mUgEn5FtNhgh3dc02wBadI4nqS2fFR/Sz+BjqELEu+BOx6s1dFMTWtbTQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2/1tROtTobp55suc1IUtXBV9vnatZqXAC4xP78p8Uo=;
 b=a7BPAM7QuG3ZNkBbSFqJjS4rT+ehjwhgDSrEEMjI+5IhTxWDkSwKg7U2UYT7e/xHoX6elWJ/gqiq6we5oI2FxAkqyMloBuiEUQPjXBLGoTDtff7VOs588cd0GxJ6tPGLY8bLJkW6Mtk4b//zXVvpxXdcKuHanrSqCtB8rcJWmIUM2wE0m0iBcarIo5zlBJ4F2rOka8TyOWmNB+HIEMc6b9xd95eVxIFBhVslAX1MYG/LzGsYflw7lJJP1n2BouJ9nOLN8Rx1BXtyE8OY+vk4WbNEJ32Qv2lBJA/cP2tUmB83q0ub9Z20bIQf1n1nvemXDo8KNzn3LPa6ngVFTK0yqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2/1tROtTobp55suc1IUtXBV9vnatZqXAC4xP78p8Uo=;
 b=1iGbNVhx9tlc9SJX9MNunw5XGeRXZpSn2PNOnbLjEI4bMTrrh26ssYQTDNmFSzMZjQFEtNfb2lWJzlNsKSji6FFnco9uQSvhHdSuNQ9lwpdv1BY6f4Jtj3wLaGwxZqrmhbd4kmbVJUbUdg8w3CKM0HSjwojC7hA83XQmb/JHbig=
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
Subject: [PATCH v5 01/10] vpci/header: Move emulating cap list logic into new function
Date: Mon, 26 May 2025 17:45:50 +0800
Message-ID: <20250526094559.140423-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|PH7PR12MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: d653b429-c45c-4ab6-d0df-08dd9c3a29f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTRtUS9BYmorTDZzbVdkcGlHMFFWbHZyOEUwSEZTVVJJRUpiME5BMDBNWkdU?=
 =?utf-8?B?dDBUQ1IvQWdlYjMrbHZZQk9jSUFFUS9ROXpHWWFUM0dmUDhGTjQ4c1gyeFd1?=
 =?utf-8?B?TjhIZXpGZlVlcHltcjhHbUtRUlF3RFZ4c1Nic0NwTTF6K3RwT1IvbjlkaDky?=
 =?utf-8?B?S1hTNG1tdWY4L2lZSWs4QUxJTmVSb3Vkam9EbHpLblplMW16MVR1S3F2SnhC?=
 =?utf-8?B?SXVSU0pwQUJZMXJsZ1l6WkdXS09NemMrMEJZQkVzb0U4OGpzeHk4d3BzRUFH?=
 =?utf-8?B?M3NTQ3pZdzR3NWMxdVpEN24yQjFWakdxNnkrZmIvUmdaMEY3T3BObWNneUJa?=
 =?utf-8?B?NkVxcm1xRmxEVnlnMnRvcTI3ZlZTTVJvT2o4WE81MERjajhTVGtqb1VPZ01F?=
 =?utf-8?B?Umh0czRvMFhQelVTbjZMZG5Ha25IL29WbVRnd0tHUWdtVGUzME85ejZZUlZY?=
 =?utf-8?B?cHRaSGRUZmlMb0NDQm1UNzF6cDg1MnQwNmVzK25WM09zZzdLRng2TFlCRXls?=
 =?utf-8?B?QTdBZk0xS1Q0dktLSlU0VnVvSW8zdDIrWitCVEI5TXFkMnMrY2l6VzFvM2Rl?=
 =?utf-8?B?Z1JYM1RnWjJZT092YjFWcjNkYmhoMHp1ZEdTRnRPaUlxbU0wTHpkN0Rhb2JJ?=
 =?utf-8?B?UTZIS1N6SUtiZHF3Y2ovWVdtNC8zb3ZnZDN1RWE1aVJxSjdCbU5xVUx3UUdX?=
 =?utf-8?B?OUhBdnlFOHZQR2FhcE9QVWhQRTE5aWVJaW1DV0VHeVpic3dLWmxOTEpXTUVu?=
 =?utf-8?B?bFFXY2NMU1pwQXVPWU94TWFrVlgxTnR6aGkvTVhnaFJHSy9RUzJTMzRSWGJk?=
 =?utf-8?B?bklXQnNOaHNRdEdjVmJ6QjJ4WGJMYWxlNlE0S2E3anRSMEF4UmpOTnV6UjV6?=
 =?utf-8?B?SUtmWlBCR3lrSXQycDNpT3JXUGxqblVDUlFGUUNRRlBDV3VqZE9xTGFROFVm?=
 =?utf-8?B?NlZLZDhEc1RZcTRwcHd2UlQxTjczNnVZUEFGUzA2b2xiblhXQnNxU0QwbEk3?=
 =?utf-8?B?RUt6WGtROEtsYmpDSVhvNlh1SGdBcTRpNmMxSFdMbk5QSVo5RjVrSUVGeHBN?=
 =?utf-8?B?ZVFSblBJSWhNWWoxdUxkZGdOUklYcjM5b3lEdnRGclJXOXJUWTB4K2FGamFT?=
 =?utf-8?B?U2h4VXlnQU4yOFJWbnluYU9FM0lpUWcwcHI4ck5qZUVRZFZ3ZDFHWjREaXlX?=
 =?utf-8?B?ZCtLYXJwUDBpWDV5OUNVOFlLQWhSc2VXejE4WlJPbG1rUVBrUmo0YnpMMGx4?=
 =?utf-8?B?eFp3RXF3ZStIMStjWnp2WC9uNkVmbFRFS1hmQ1N4SWUxeTBHSm1OSkg3NDhU?=
 =?utf-8?B?M3lvNDYvR2tybGNuWVlvWXZEb1d1eExyK0laZlZGZTJzQ3p1cHVCaTRQMWJL?=
 =?utf-8?B?Q20yRU9vYWhqeHpsRVZ3L29mTmFmUjNPY215ZVJVaXBjcU1oeWE4TlI5OCs4?=
 =?utf-8?B?VHZLNEZHZnlBc1F4RmVNUVBqQVVBSTZ1QXBlZk1pYW9hNFpMN0xUd04rdTFm?=
 =?utf-8?B?RHJSMVE1ejliWlFSaTFIWmxQbDE0aGlVMFdKaVlNS1JXR3hhU0FMVVNuNGhT?=
 =?utf-8?B?UUhVT2kxK3NwUlYrWjJ3SzN6L25yL2RSbjBtNFVmMEtXZE1udFYvemxIeC9Z?=
 =?utf-8?B?c0IxK1kyWnFQbTFUVTJRQ1F6QmlkQ2lIV24yamV3WjNJUnhvK0pHalN1bkQ3?=
 =?utf-8?B?QUlmMU1XRUMxcjBMR0dvVGxHbi9Hc1I4dTZKcjdrT3RXaU93N1NjZjdPR0FN?=
 =?utf-8?B?U05QaVRGV2RvYy9YcnlKd0xYblpRUjZwMUF2VSttUHgyQTh3aHdIV1BFaEhk?=
 =?utf-8?B?WWROUzg1QmlpaE5KaWxRSmFTNStIYWRQakFIczVzVkQ4SVFybmF6SXNKMWkw?=
 =?utf-8?B?RW42TUF4dFYvVU5udmlwUnUzczFQbGZJQmkyaVA5UWFJVU8zNGNCeWV3Ym90?=
 =?utf-8?B?MGN2am5zN1pNbVpodUl2Rlhub2VuYXoxWnRFZVJzNzlTQ3FWSDVGYWMxNU1R?=
 =?utf-8?B?bEora2xSSE43R3NxYTNIMEkyM21tY1JzR0RJdEtHZVpldThYU0xYeFhMenlx?=
 =?utf-8?Q?CGjnDg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:18.1910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d653b429-c45c-4ab6-d0df-08dd9c3a29f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9101

No functional changes.
Follow-on changes will benifit from this.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v4->v5 changes:
No.

v3->v4 changes:
* Add Acked-by of Roger.

v2->v3 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 138 ++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 65 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1f48f2aac64e..0fb3cfa6a376 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -754,6 +754,75 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
     return !bar->mem ? -ENOMEM : 0;
 }
 
+static int vpci_init_capability_list(struct pci_dev *pdev)
+{
+    int rc;
+    bool mask_cap_list = false;
+
+    if ( !is_hardware_domain(pdev->domain) &&
+         pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+    {
+        /* Only expose capabilities to the guest that vPCI can handle. */
+        unsigned int next, ttl = 48;
+        static const unsigned int supported_caps[] = {
+            PCI_CAP_ID_MSI,
+            PCI_CAP_ID_MSIX,
+        };
+
+        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                     supported_caps,
+                                     ARRAY_SIZE(supported_caps), &ttl);
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               PCI_CAPABILITY_LIST, 1,
+                               (void *)(uintptr_t)next);
+        if ( rc )
+            return rc;
+
+        next &= ~3;
+
+        if ( !next )
+            /*
+             * If we don't have any supported capabilities to expose to the
+             * guest, mask the PCI_STATUS_CAP_LIST bit in the status
+             * register.
+             */
+            mask_cap_list = true;
+
+        while ( next && ttl )
+        {
+            unsigned int pos = next;
+
+            next = pci_find_next_cap_ttl(pdev->sbdf,
+                                         pos + PCI_CAP_LIST_NEXT,
+                                         supported_caps,
+                                         ARRAY_SIZE(supported_caps), &ttl);
+
+            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
+                                   pos + PCI_CAP_LIST_ID, 1, NULL);
+            if ( rc )
+                return rc;
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   pos + PCI_CAP_LIST_NEXT, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            next &= ~3;
+        }
+    }
+
+    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
+    return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                  PCI_STATUS, 2, NULL,
+                                  PCI_STATUS_RO_MASK &
+                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                  PCI_STATUS_RW1C_MASK,
+                                  mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
+                                  PCI_STATUS_RSVDZ_MASK);
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -762,7 +831,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
-    bool mask_cap_list = false;
     bool is_hwdom = is_hardware_domain(pdev->domain);
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
@@ -803,61 +871,12 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    rc = vpci_init_capability_list(pdev);
+    if ( rc )
+        return rc;
+
     if ( !is_hwdom )
     {
-        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
-        {
-            /* Only expose capabilities to the guest that vPCI can handle. */
-            unsigned int next, ttl = 48;
-            static const unsigned int supported_caps[] = {
-                PCI_CAP_ID_MSI,
-                PCI_CAP_ID_MSIX,
-            };
-
-            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
-                                         supported_caps,
-                                         ARRAY_SIZE(supported_caps), &ttl);
-
-            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
-                                   PCI_CAPABILITY_LIST, 1,
-                                   (void *)(uintptr_t)next);
-            if ( rc )
-                return rc;
-
-            next &= ~3;
-
-            if ( !next )
-                /*
-                 * If we don't have any supported capabilities to expose to the
-                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
-                 * register.
-                 */
-                mask_cap_list = true;
-
-            while ( next && ttl )
-            {
-                unsigned int pos = next;
-
-                next = pci_find_next_cap_ttl(pdev->sbdf,
-                                             pos + PCI_CAP_LIST_NEXT,
-                                             supported_caps,
-                                             ARRAY_SIZE(supported_caps), &ttl);
-
-                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
-                                       pos + PCI_CAP_LIST_ID, 1, NULL);
-                if ( rc )
-                    return rc;
-
-                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
-                                       pos + PCI_CAP_LIST_NEXT, 1,
-                                       (void *)(uintptr_t)next);
-                if ( rc )
-                    return rc;
-
-                next &= ~3;
-            }
-        }
-
         /* Extended capabilities read as zero, write ignore */
         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
                                (void *)0);
@@ -865,17 +884,6 @@ static int cf_check init_header(struct pci_dev *pdev)
             return rc;
     }
 
-    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
-    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
-                                PCI_STATUS, 2, NULL,
-                                PCI_STATUS_RO_MASK &
-                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
-                                PCI_STATUS_RW1C_MASK,
-                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
-                                PCI_STATUS_RSVDZ_MASK);
-    if ( rc )
-        return rc;
-
     if ( pdev->ignore_bars )
         return 0;
 
-- 
2.34.1


