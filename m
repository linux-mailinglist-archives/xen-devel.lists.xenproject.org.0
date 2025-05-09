Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18105AB0E34
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979878.1366372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgK-0004mS-2z; Fri, 09 May 2025 09:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979878.1366372; Fri, 09 May 2025 09:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgJ-0004l2-VD; Fri, 09 May 2025 09:06:11 +0000
Received: by outflank-mailman (input) for mailman id 979878;
 Fri, 09 May 2025 09:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgI-0004kr-4M
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:200a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d63cf922-2cb4-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:06:06 +0200 (CEST)
Received: from BYAPR02CA0022.namprd02.prod.outlook.com (2603:10b6:a02:ee::35)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 09:06:00 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::e4) by BYAPR02CA0022.outlook.office365.com
 (2603:10b6:a02:ee::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 09:06:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:00 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:05:58 -0500
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
X-Inumbo-ID: d63cf922-2cb4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpjgCUah6SJz9CDNT6s/5v0R70ticXW+RRUvBaJMKUVsx0EJpAWZbabZyqyf7qtuyGEK1uKYFixL3NFAoR9zdwAGbSxfYp75pDgo5nE5+nD30FFtrRY1e/aMNk6L3JQNWRdJekip58J36MSuw2B2vglaxrtz84yFe5HcQVDRKVBQwPrHAAPi0kudZxV6CEabS2ihmggbbg5ZVaEjjASZnrDaclYWUI8OMqcLxpsB/pyhr9dHf+0u/DnyCkZAZzcBdYURI+NKGG3JHjrZW/HXl83SwzTJKKKvHDAaGMz1tsShH5ELZHhSdl2JfRuX+fJ6QH6bNqWVUGrwxxdvSyXyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDlCKerLbhNJ+aVeqVuglnHIG3S+ds+aZHU7MpSbFRw=;
 b=o3FhzyN/pIQ6kS4IBqYItVB6K9h/oTYA2UmLFlOgO6YWPXZz5QQhGMey03NuS6VBn1xR/sB0el2bUSZy4wOFQeC8HBxfogpolk2mvLPT1VZ5cz9w0KR2KjquwVEyculBMVP7dwkPJCG5i8k6V5ZeHJamimTQ+xzupvi0VwbGqlDwWcfpLIXEM6hMnpX1Nca3eNaEzm1kmp0vCaQ3Eq3H/gVUcseriZ3LWeYiLvh79/cF+HRHY0T3v314d6tsNbctn+bp26vjulCAzpmRDTYCt/vEvXXfj7ZAQ7neBtKd2nvLTyi9FqAKNwkPT9NGKsvK+UaI4NR5EOuieBvXaBA+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDlCKerLbhNJ+aVeqVuglnHIG3S+ds+aZHU7MpSbFRw=;
 b=DKTvk9X3hIaEl10lu1AQQhIwmslNVeSNB3sZ6ArWOp73YX0YAGhgx6ZUmEM9wQE4BjpzBsP0v3d5o3LcMnSz+QNLeB0yAePhRJSUvQwipKS6VyrWaxxiV0sgPh5D2hbylhNjtQC6rKUtah83CLKY+iICOx50z8WKeUtKAw5blT4=
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
Subject: [PATCH v4 01/10] vpci/header: Move emulating cap list logic into new function
Date: Fri, 9 May 2025 17:05:33 +0800
Message-ID: <20250509090542.2199676-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: e66e7973-69f5-4385-d4f9-08dd8ed8b7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STIyVU9xMGZnSWhWU3pqZlJHOTQyUjVvazhpU09JUHNRVnU5RzZkcVB2NGxw?=
 =?utf-8?B?SkU0WVUyc0F2RThXby9PU1NWdVplRGhMaFVnOVo5M3owOWFXOGdvbzRQdUtD?=
 =?utf-8?B?NGt6MDIyRm91MWRwUXdFb0VoeDA1anBhS0lPYktRMzhJSUp1eTk0cmpwajVN?=
 =?utf-8?B?Q09uYkU0S3d3RSt6S3IwdHpLeG9JT0lpYlNFeTM4Mk9TckFudU8wRXZjbnhm?=
 =?utf-8?B?Q2lJSGlCVDVjSEd4dWF0YU44U2lSQnlWQ2NJNjl4S09pQzNTQnJDYldyKys3?=
 =?utf-8?B?Y094SGxJYysyTDRvNG1OTWxSQzM0akl0UGdpU0xmUHRPOUFWNHRER01ubGp0?=
 =?utf-8?B?c2I0UW1zMEtubFg2NmZyd0VBYUlMYnFFazd1WTdmWXFlejFkSUVCSnVrdFBW?=
 =?utf-8?B?QklLYUpiMVpJWll1T01GdGo5cm5rZll3SGY5N1VCUVdNaEtqUFdTMklUdkEy?=
 =?utf-8?B?N3RRK1pSVWF0blN4MmhQcjZjd0pHVUlOK3AyenNxVXJFeGNHWm5ZTXFvcVAy?=
 =?utf-8?B?K0FZcytwaTFQcUZoV1BrVmNtSG56KzBIVFZsVW5HVHpYNkVMKzFEZ2hnRlVi?=
 =?utf-8?B?V0NlY1pxcVRsQi9DVHZVWk84ai9RWXhFdStoTDRuNndDcUt6WkdJaWVXV21N?=
 =?utf-8?B?eHgyUG9CdDJ6Mmg4OXhFZVFzNjRxMGZINk54SERXUVh5MFRFalMwZVBWbDN2?=
 =?utf-8?B?OE1QRzh5R3NYZXhYWkdKdXNDb3o4eUI2M2J5ZllndGhTY1IxaTNaakFhbGVv?=
 =?utf-8?B?cmlqYm5CU3VmZ0E2WWpkL25oOTRlTFNoZUxhY2RpRVJzNkFIb3d6VTJOVXJB?=
 =?utf-8?B?RVVBcGJmZHNlQm10UjBqNjdJQkJUNWc5a0xxa0wyYlBPZFArRHRaT1orTXJG?=
 =?utf-8?B?SGpUYXhLMFB0cDZkWGtsV21rc1V0MUlEdWE0RVNNK3BScXArZmdHTlBCeDJi?=
 =?utf-8?B?T050aWVQYUFrT3VHK3AvSkRhUkYwVlFKbU5vUTRWSndsczNXN2xyN1pqTVRn?=
 =?utf-8?B?SU91VVhxNGtUWDVFR3hkZ2NVbjluUDNvTFlZbWtqQ09DR09nUUpFa3hPOENS?=
 =?utf-8?B?M1R6b2doS2ZTV3haZ0xSSkV3TEdvaVNzMmtUZ0tEdnRsY3ZGdFJ5ZlZveFpZ?=
 =?utf-8?B?QVlleW1acWRZNzRDZDhkY2VVRWlNbHBaUUlMYXhlSWtsU0VEWUZ4MWJueUgz?=
 =?utf-8?B?RGFrbEhrc2gyekJvOEg3SUxqeWwxUUEyN3pxYlRQSDV2bC9aR21SeFlOaHF2?=
 =?utf-8?B?NE1peGhuSWVSWG5mMlUzU2k2R21xSUJEY1RMdDYvOEVIVHN6NThYOHloZ004?=
 =?utf-8?B?Z2I3SWhseDZCbnVEeG5hNWFTWUVWS3VLQURHM3Z1ZVpxbENpU0VQZXRERmNx?=
 =?utf-8?B?d3I5MmNqNHQ0RGhDQks1OVlCK2pvenJ6OFVmdUgyd1VFVW9RKy82SjFlblBq?=
 =?utf-8?B?SEZxWHZUZmFubEpwbFcydmpmTkxqZXFFb1IwcW8wVUhpTTQyNCtaVXJmT2l1?=
 =?utf-8?B?SXIzMjRGRlF1QWtvRUp5dWNDWng2MXZNNUZNOGcwNTJvZzR3dnA3VTRjaVB1?=
 =?utf-8?B?cXY4UE96eUVWdUVLQzFWK2NDcWNMeFN6andHRFdrK3FxUGtKNXB6Zy9ReDlQ?=
 =?utf-8?B?SGxRcVl4TE9jbEFESHoyQkR2TW5ZZFluZDlmUUJsaGhWT24wTjBaSjYvVy9G?=
 =?utf-8?B?bkJiVVZpdTJrZlNhMUMwaklhWEFjUGEvZTVKKzVhZUpIOUtaeDlKRHBsbnBY?=
 =?utf-8?B?WU9lb2VTc3FKd214WUxOdEsrRU92eWIrNk5kdGcwOTZOSGVITjFIUk1WTzVK?=
 =?utf-8?B?b2ZQSm03U0RXaWp1M29iL1lnN2xEbVBHTC9MbjAyYUJhSHU4bDdhLzNJTkNP?=
 =?utf-8?B?c1FLd1NSMkhJdkdFWjJyRjgzVVRVQW9KS08wNWhNMWM3V09TVkgzMTNVck9z?=
 =?utf-8?B?L3V0MzVFK1F1V3pKV2ZnbFhPVEZNdDFaalJRZlZ6dFR2KzNWRWwvb0hJVkhC?=
 =?utf-8?B?bGNML0VaWFdFNVdTY1ZQYTlCZG5ORjNTVEM5SVd2S2hjLzJ5Z0lQVnVxQ3RC?=
 =?utf-8?Q?PFSInW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:00.5523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66e7973-69f5-4385-d4f9-08dd8ed8b7f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755

No functional changes.
Follow-on changes will benifit from this.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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
index ef6c965c081c..3e9b44454b43 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -745,6 +745,75 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
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
@@ -753,7 +822,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
-    bool mask_cap_list = false;
     bool is_hwdom = is_hardware_domain(pdev->domain);
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
@@ -794,61 +862,12 @@ static int cf_check init_header(struct pci_dev *pdev)
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
@@ -856,17 +875,6 @@ static int cf_check init_header(struct pci_dev *pdev)
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


