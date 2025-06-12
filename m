Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87EDAD6C2C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012637.1391126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGI-0008Hc-R6; Thu, 12 Jun 2025 09:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012637.1391126; Thu, 12 Jun 2025 09:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGI-0008G7-N0; Thu, 12 Jun 2025 09:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1012637;
 Thu, 12 Jun 2025 09:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGH-0008FN-65
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:17 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:2408::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8a56ae8-476f-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:30:16 +0200 (CEST)
Received: from MW2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:907:1::22)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Thu, 12 Jun
 2025 09:30:10 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::af) by MW2PR16CA0045.outlook.office365.com
 (2603:10b6:907:1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 12 Jun 2025 09:30:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:02 -0500
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
X-Inumbo-ID: d8a56ae8-476f-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utp2VkDVAqRDWNzBZV+Orml5b+ckQt5yHBXLsr1/aDanGxqvQ5a5Oi2b6Gw0Ke6qlzdqqGjkcBRhutvwwOWQMLAKEwikIbuJ1bpOKFcrrbRrjsZ0ppHJoCnFlfcLFaSDJSNeTbu84OyvVEj/m9HCG/DhYwET0TusRCnS5vrOI17dfStV2Z/NrgUrMZkGEOViUXcblhfKEJIF9RR67MHbOf7Lii34Z2ZpeheOE/YokI4o3AF5sOMNjP7qN+mrhErZ7m7husEpwSUaiop6LoklPUzVZwH1V5Y4FU+8abBdeIzGM4xD9NRLLGbylreDlbH0J4SesfsUrvA2KC9bZ/mcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgDixd54mOE3mQCwb7xqikH2Dl7IXnpGG7hTpXW5Ftk=;
 b=HVWsGPB5stJXIqRdaEHWcED6eUc9g8V5DjPjROR8OJALGAelDvlAKrXrgYovSyiBXvT78UXMsIwRG6TzoNWS69yo9AYodGMY3MFhr2q9RAkc3Hx5vvvcGofY0sPAnU2cVHIFe0N+LuWPoQGsLOdkN2D0098FI/Gqz+sTFbKBeOgeYMZFFkp9j0vovReh31aD+dD8w6csnMAOHu7qgi3maVM+xXX1Q+SPnSphxrTFr3GN/gxPzrdu4QJaMAqGEjlx30R1Aubb9XCh5/gd1/tT9d3ufEtUx1M5qMPDWafkoZ2nTGA5tObWuAB871AyIGofXmWr3F0ZwLpOWowG5xRgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgDixd54mOE3mQCwb7xqikH2Dl7IXnpGG7hTpXW5Ftk=;
 b=TZ9RviRZ59lS7J5xKYoXaIu78Xy+k4wEvwclzG9HviPG8O3hf7Cpnuk+L5r/gsgfZ2yD8lyaeYhsMIvB0eexuaVvfwobJ928UWAKRCRXI57Bo9fngy/Ix/kjzn9Tui8RIdKj32pAEyQ0K3xKnRLIVfG+Feq+MLqE1fBunvTa054=
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
Subject: [PATCH v6 1/8] vpci/header: Emulate extended capability list for dom0
Date: Thu, 12 Jun 2025 17:29:35 +0800
Message-ID: <20250612092942.1450344-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bc03e4-17b6-43be-3355-08dda993b959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVlRazFpSStPdGpCUUFLajEwMWhSR1p6OTdUUFduVkVlNUF6eHhsOE80cHdU?=
 =?utf-8?B?cE5MOGg0VTZVbEVWbkVmekZVdEs2UXNjZ0w2SXZhVWZPUUMxQUFrbG5JbW9S?=
 =?utf-8?B?QTIyaEN2bGlPSUl4bmNjYjRVMzIwQ3EzMHpXalV5SzVCL21sUFRkOG1aSU84?=
 =?utf-8?B?UDMvTUhhZXBYME1pbys0cUZzdWVGN2Nmbkw4SzRSQjZwZkwyQ0ZQcmFJNkJx?=
 =?utf-8?B?UXEzcTVjZDhCWjJxWmFmQnBkcHRlbVVjcFlOZ09KWDhocVVCZHdUcGN1ZC9T?=
 =?utf-8?B?L08vVndSRzBvSVdYQ1RERVJtVmtiRVU1eVVGU1JWbGlTZWpJaTM2U2JLU2Jx?=
 =?utf-8?B?d2F1WjBiSEE4MC8vRDRiOVhHV0VtVEtCRjVYeUVrSUhjOWVvSjFFdUhDTGg3?=
 =?utf-8?B?cityamRyaExFVjVWRzU5VnQ3bEt0cWNQVUR5c2VCcnJ5clNwemJMT0hYUUZ2?=
 =?utf-8?B?NmFaSW5JNi9ONCtqeHdiNVJXYVhwQzgzU1VXdkVQRGVIWkhGTHFXNGo4cm9k?=
 =?utf-8?B?eEZQTmhIWnd6OFJ2bisxWG53M2o3MEVjTitxdU5MWE5qZzJUQkQrMVNtcmZE?=
 =?utf-8?B?a09HLzBoWjVZTzhzeE5QdU5aREJ4UitCN0xVTU85Mnh2VTEyRFkvSnpjemlL?=
 =?utf-8?B?V0xCekpPMWw1SzZBaDI3VjE1R055KyttVEJUY1FzVXYyS2xSdmhSS1hCM2Rw?=
 =?utf-8?B?YXgvYWJLQlJTL0pnRFFlZURRUXpqSXovZzRXV0F5NS9yTE1HeEdMYmhsc1Nz?=
 =?utf-8?B?ajg3QXQ0TTBWSVZENEhGRHhWeHpVSC9jK3kxNUJ3czd3cExiOUd5RjB1ZGwv?=
 =?utf-8?B?VzVUUFYzWnVqZmZnZEhxRkw1MnZrVFJRcUtlbDdmTEFOMnQwdkJ1TnFua0h6?=
 =?utf-8?B?V3BlWW5pVEdhNWpkaUdHSURLaGh4bFBnTlFxZTFsRnVqMnZzRlJRVTZCaFpw?=
 =?utf-8?B?ckdSb2FKNllqOU1NbTdTeUI5R3VCNzlIZFM2U0JQaWZtYWp0N1VuSTNKSnhC?=
 =?utf-8?B?Mys1Tzk0ZUJlU3Njb1BXTmNkdktLd1RKVGw3eEl0OGVvOWplWXd1MExhZGV3?=
 =?utf-8?B?ZmFJRDBoMVBWRWdENTlwZCtxdHgwYzhPL0pSYTF3ODdmNlM2cHdUeGYvQkpS?=
 =?utf-8?B?SVJvMXlQN1hJT2ZkdVJWcEtsUkdCSTk1ajJqVk9GZFlBK0hzTVZEMXJoSXd5?=
 =?utf-8?B?dXYxOUZpVUFqaWZRQjRVZUxJK0lnUkVBakdBVXZVc1REcytKY0tDbHNzYmMw?=
 =?utf-8?B?WTgwWUs4dUpNdXVZb09iRG5OMlM5VFZoQ29hYmZ4bHJUUzBoZ2ZNUUFFQVNJ?=
 =?utf-8?B?aVY0TCs2cHZuOFFvc3VWN0prbTkyUlBEVUErd3VtNytQWkkzV0tBZ1ZGUFVL?=
 =?utf-8?B?Mk1ibTBxS2thR0N1MDJSWHg0Tk9xOGsxTExtNk1hVzYxRS9uNzlHa3ZqSGlk?=
 =?utf-8?B?dm5XUU9wUXZLaHBaYStYRjdBdWdXalRWRUFhMjAzS1RibkJyV1BwZ2hPcEZt?=
 =?utf-8?B?T2w5TGZaRWRjUnZ3cWliNzlIUWs0UEwxcURvMW5ib1JnNWZyUnN6ZUlHQ05i?=
 =?utf-8?B?OEtaODUwRjBaaGNRclhJYTBFQktPOTVWajlLMEZRd0ErMzNtQ0NLcE1YVFNX?=
 =?utf-8?B?WnhVNGlkMlo0ODVjMy82M3JkZlg4NnpFa09aOGdSZ2YxUlNzZ3hNd2svSktS?=
 =?utf-8?B?VmYwN05IZnMzTm1yYmVOZ3RjdEdCRVFKRytOd0hLOXJYQXZjVzg3NmZhOHpj?=
 =?utf-8?B?QTZuaFRZMkNNU3BEOGdiZlpWRFZ6UGVwV2JjYnIzVFhPcGFsbE5UOEMyS2Nr?=
 =?utf-8?B?cG44Z0hKMU1DMEVMRkQ3aFB6cGpxaS8xUU8vRWh5anRQRHZCTTdFWFNYekdv?=
 =?utf-8?B?SjQvSHJRWU5ja0p0M3lBSmJjTlFBTDF6bXk2VnJlbDJUcnVGdzBlcmlwWk5R?=
 =?utf-8?B?WFFuYWFKWmZMN085Wk9yYkpsMDdVRC9WZ2xSSU54WXJrZmk1b3RqQTZ0bmc2?=
 =?utf-8?B?VUlzVnRVMWdyaytOd0hPWk5udTI1Nmlja3F2WmdEUlQ5aFZwR3BkM1lJcUJv?=
 =?utf-8?Q?JAGUVM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:09.0108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bc03e4-17b6-43be-3355-08dda993b959
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide a
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v5->v6 changes:
* Delete unnecessary parameter "ttl" in vpci_init_ext_capability_list()
  since vpci_add_register() can already detect the overlaps.

v4->v5 changes:
* Add check: if capability list of hardware has a overlap, print warning and return 0.

v3->v4 changes:
* Add check "if ( !header )   return 0;" to avoid adding handler for
  device that has no extended capabilities.

v2->v3 changes:
* In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
* In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
* Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 47 ++++++++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c   |  6 +++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d26cbba08ee1..a39bf2b12585 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -836,6 +836,42 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
                                   PCI_STATUS_RSVDZ_MASK);
 }
 
+static int vpci_init_ext_capability_list(struct pci_dev *pdev)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+
+    if ( !is_hardware_domain(pdev->domain) )
+        /* Extended capabilities read as zero, write ignore for guest */
+        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                 pos, 4, (void *)0);
+
+    while ( pos >= PCI_CFG_SPACE_SIZE )
+    {
+        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
+        int rc;
+
+        if ( !header )
+            return 0;
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
+                               pos, 4, (void *)(uintptr_t)header);
+        if ( rc == -EEXIST )
+        {
+            printk(XENLOG_WARNING
+                   "%pd %pp: overlap in extended cap list, offset %#x\n",
+                   pdev->domain, &pdev->sbdf, pos);
+            return 0;
+        }
+
+        if ( rc )
+            return rc;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
+
+    return 0;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -888,14 +924,9 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
-    if ( !is_hwdom )
-    {
-        /* Extended capabilities read as zero, write ignore */
-        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
-                               (void *)0);
-        if ( rc )
-            return rc;
-    }
+    rc = vpci_init_ext_capability_list(pdev);
+    if ( rc )
+        return rc;
 
     if ( pdev->ignore_bars )
         return 0;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c27c..8474c0e3b995 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -267,6 +267,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index fc8d5b470b0b..61d16cc8b897 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,6 +80,8 @@ void cf_check vpci_hw_write8(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.34.1


