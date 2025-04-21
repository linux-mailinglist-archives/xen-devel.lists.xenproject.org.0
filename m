Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253BA94C85
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960838.1352536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVI-0006LR-Pa; Mon, 21 Apr 2025 06:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960838.1352536; Mon, 21 Apr 2025 06:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVI-0006IN-Ln; Mon, 21 Apr 2025 06:19:40 +0000
Received: by outflank-mailman (input) for mailman id 960838;
 Mon, 21 Apr 2025 06:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVH-00057v-Js
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:39 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20629.outbound.protection.outlook.com
 [2a01:111:f403:2405::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99dd7255-1e78-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 08:19:38 +0200 (CEST)
Received: from MW4P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::15)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:19:33 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::92) by MW4P221CA0010.outlook.office365.com
 (2603:10b6:303:8b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 06:19:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:32 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:28 -0500
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
X-Inumbo-ID: 99dd7255-1e78-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7Bq+X1XDaDlL7ne3KgoB+CZghg00QiZPw2iJ0f78QwQsxrI638nU9lBA/a/cu6Pd3Cft0t3setlJR4gScDEdw70uic0ikB5F+fI0ZLWZTMzVj2vFeKBSXoYC5UghRQCRXsmhVxKg5hW++3DZ+OjuVBYls5euYG5kq5Ka73k9Nr/CrxNfSwxdz+JkaY/8MjPGRjOWzbSIF1nbCD8fSaOdO0UQ7HYQymsJ42Au1oYXLaRwgYvJ76utN6669ByEUW1Xb7YaMmJ1sNnaskRBC1xP7nsdDttDuOI0d9bJTXszKYEW1UBUdHl6WnFxvXX1dHLtFZ3Jz79LfCRGYKZYs1Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEvMzpvWqS275td8NdQCPoSkcPjKyBi1OV2Wa89ZesQ=;
 b=t0t5IRnPlT8npXcykmzC5PrPhMPrlCnhPgmlim2507ZaTXLPdGQgZnXVmvq9VqxafxgdEL64qSqUHHYdddTQM7RNGobfch//95kMUZm5judRNloeOFqsRzI4GCOqcOZO8M73pZYdlKQ9VDShx8MlbElz2qtQe4ZioKYTef/YMX4gaAWNDXv1kB17rMwBDlXPwQcVNVPYLSA9bSc9NPLlNEKFWEh33frxTc3c9fEAVg+pOWdjqSTrdaVRkOyEU/f3ZnaJLGjzVUUsdipNTe/4qqIsSNbZ8tR6yPTfuC10WXDwe90CT14+vH7A3rCPbItNvmq8Sm0NasrYSsbg7NW/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEvMzpvWqS275td8NdQCPoSkcPjKyBi1OV2Wa89ZesQ=;
 b=GPc3/Eyh/0SzJvgieEvvDX7YqIMQR9rOB22fRKjIKPSRJt6ZSRRL6y7mtHva0kMSNJ+V1QBtzw/inPeqrnjJTiv197DTWBGUEmks1t+pGkz21+cUAGmZDnBRfPNEcdbfGTVDgecoTAiA0jtGAGdxs1pyErHZyfaJbl/yvPjo2tM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Date: Mon, 21 Apr 2025 14:18:57 +0800
Message-ID: <20250421061903.1542652-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|SJ2PR12MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: fae463d9-a447-4eea-8219-08dd809c7ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnVKQmI0bEtPU0xvaGI4bVkzSlRDclBNRWRxRnBNd09zQm9ONGM2V2RnSFhq?=
 =?utf-8?B?ZEQvclBhK3daYm1jL2ZLWm94NVJQTTZIMDAwc0ROUVV5enJYZEtpaWQySWxG?=
 =?utf-8?B?eTRyQW5FTTFDeUljSjhNdTYwQmdNSDFhcEpFVDkwVDlodXFDWk5WVEtReHZF?=
 =?utf-8?B?T0M0bE83T0NabFdobGdDcFkrZHRzUlpoQ2JkRGtGc00ybDlmZkYrZ0FSdWVo?=
 =?utf-8?B?c3lWMTBXMk5wZmFjU3hNNTR4ZFFWN254MnY0YUJEVjA5czJ1TFlzQlJwZ3E3?=
 =?utf-8?B?TzZtcnkrc2c0SFlsOUIzVExUL3h3Y2NMUVhlN0VjdkZ2Zm5oc1ZVQldPbnpw?=
 =?utf-8?B?cUpCTWNxeUIySnV6c0h0ZVEzOGRRR1dhZy8wcDdaendYckFHTlplSVRsU1Bo?=
 =?utf-8?B?cUFZUFJldCtwcWpOaUlDcnVEZHZycTMzaUVUaC92TWNNaXZuQjc3T0htV3Fs?=
 =?utf-8?B?c1lDKzRMZVVUdVd4dFVTc0VvdnJjN0hSQndlQWYvd3RwZVFRUkpUUjRWRXI3?=
 =?utf-8?B?YUJMN2dLVk9mZFJhK05GK3VzTUtaN2c5OXFEaDlhRzNqY0hWUVVmVCtFMlpW?=
 =?utf-8?B?TTJ3Yk16QytVYkJaZ2czQy82dFU5MEVHOVdLL1hhQkZIeXB2ZzRjUzV5c0tv?=
 =?utf-8?B?MHRkV0xqYThaaFNnZFVzUXpEVVhSNnAyWE15YkxCWE9MU0UvR1V3eWxRaTZw?=
 =?utf-8?B?SGhwYTBRQ2dBbUhYWkRNNDdhRUdCcElIRFlLRnhOSXdVUDhWR0hENy9qZEFs?=
 =?utf-8?B?dkJ1THUrMkh1VWVXR3NVSENNcytZNXVsS0hEeGk2UDdNRjRxUjhVVmJNdXZO?=
 =?utf-8?B?TmhjS0EwZytRbnNuMDZzSWkwdndzR1FpYlJlT3JPc0ZlYjZ0STM1Z3RhM2RO?=
 =?utf-8?B?WmxHM1F4ZEYwK2FMd3pMdjd5NkVuMDZ1NmVGZTBtQ3AzWEJ4cXgvRjZPS2VS?=
 =?utf-8?B?OWREOTNWN3lta0hra3VUQWtjc2kwbW5nZ3M5QUV6Z2xLZXdkY29ER1huN3BB?=
 =?utf-8?B?TjYzQWx2djdBM1dvQy9MZktjZXNsWjN4b3ROQUdMdnlpeXd4N3Y0QzNQbkRS?=
 =?utf-8?B?eXczajAvUzZ2K3Y4VTRNZTk5UWpLZG9wVEUwTDdQYjFCcWpjQ3dkMytqUUhq?=
 =?utf-8?B?UlNNQ0FOcWI4dzBycDZLOTBYT3JNWVFERDFPQlQzaFd6N1RURkpMTnlmbUV4?=
 =?utf-8?B?blRlR3dITTJsa0lyOEdnM2h5eTlMUEZGdG10dzRKZk9FYndmWUhxblRuTzZa?=
 =?utf-8?B?UzB3UlNDYVBlTVA1OWlmNHRFSFZ0Z0E0ZXBwcTQrVGwwME5KY2dUUm9BbWlw?=
 =?utf-8?B?c09YVkgveC9ianV3YitHYk9yMmtOVnc2azdhdWh6Mk9vZXAyc0QwY1pMMU8r?=
 =?utf-8?B?bjlBYnRXdzB4VG1CT3dYNG1qV1g5aXpuVkhGMTJONkQ0YTltMHdiRnpuekpW?=
 =?utf-8?B?bWdKVVI1S1NBZERUR0tmd01hTWtyR1BUbSsvVFQvdW1ZVDNMUGdrc0xNeCt0?=
 =?utf-8?B?RUpndFRYVUU3UVVieXFmT2JwQVNsd1VrbHR5RHQzNWVINXlHdlFBZlNWRExv?=
 =?utf-8?B?UkxKTmdMTk1nUkZhRE5qWGpWRTVxMWxuMDRwOHNZeGJvYngzcE9HdzZENFNh?=
 =?utf-8?B?K29JR1MzSDlwYkw2YWlLVndxQmx1NWtQSndZZXRCMGprZ3RNcTEvbFhha3V2?=
 =?utf-8?B?VEY1NzZYZ1F6TVlRSnJER3BhQkNLbG8waXhQVnJqTFZXOWhBWEVZZEFya0VF?=
 =?utf-8?B?bytKeFhmeGMra21BNkFEcW8rY0ZhR2ZPUFRGL3QvSGxPRDVOeDRudmFFRnJO?=
 =?utf-8?B?UEwzWXdlTXF2bm9KMFpxS0oydnFWSlg5Tkp2RHdWYWxZdWprQnBNOEJJZTZx?=
 =?utf-8?B?WjJTb0ZDakVDMGNsRjZjdUFlSXhyclBIeUJXTk1SSnBpZU5OeUNLbVBCTm5B?=
 =?utf-8?B?dDJPa0tPVGs5cmVMWFcrNXJTWUtsUnNEdmF6UGFXMmpTREQrUWlSSEFiZ0dQ?=
 =?utf-8?B?K29uM2w4M2JNeERjanV5bTc3bjdjZ1pMUWxZb3hOVWQ4TDNtV2N2ZjdmUy9H?=
 =?utf-8?Q?i+3Jj4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:32.0211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae463d9-a447-4eea-8219-08dd809c7ae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832

Refactor REGISTER_VPCI_INIT to contain more capability specific
information, this is benifit for follow-on changes to hide capability
which initialization fails.

What's more, change the definition of init_header() since it is
not a capability and it is needed for all devices' PCI config space.

Note:
Call vpci_make_msix_hole() in the end of init_msix() since the
change of sequence of init_header() and init_msix().
The fini hook will be implemented in follow-on changes.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v2->v3 changes:
* This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
* Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
* Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c |  3 +--
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   |  8 +++++--
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 48 +++++++++++++++++++++++++++++++--------
 xen/include/xen/vpci.h    | 28 ++++++++++++++++-------
 xen/include/xen/xen.lds.h |  2 +-
 7 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ee94ad8e5037..afe4bcdfcb30 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -842,7 +842,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1038,7 +1038,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..ea7dc0c060ea 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 6bd8c55bb48e..0228ffd9fda9 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -751,9 +751,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 
-    return 0;
+    spin_lock(&pdev->vpci->lock);
+    rc = vpci_make_msix_hole(pdev);
+    spin_unlock(&pdev->vpci->lock);
+
+    return rc;
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..026f8f7972d9 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3349b98389b8..5474b66668c1 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,8 +36,8 @@ struct vpci_register {
 };
 
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern vpci_capability_t *const __start_vpci_array[];
+extern vpci_capability_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +83,36 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static int vpci_init_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = __start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        const bool is_ext = capability->is_ext;
+        unsigned int pos;
+        int rc;
+
+        if ( !is_hardware_domain(pdev->domain) && is_ext )
+            continue;
+
+        if ( !is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else
+            pos = pci_find_ext_capability(pdev->sbdf, cap);
+
+        if ( !pos || !capability->init )
+            continue;
+
+        rc = capability->init(pdev);
+
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -128,7 +158,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,14 +188,13 @@ int vpci_assign_device(struct pci_dev *pdev)
         goto out;
 #endif
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        rc = __start_vpci_array[i](pdev);
-        if ( rc )
-            break;
-    }
+    rc = vpci_init_header(pdev);
+    if ( rc )
+        goto out;
+
+    rc = vpci_init_capabilities(pdev);
 
- out: __maybe_unused;
+ out:
     if ( rc )
         vpci_deassign_device(pdev);
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9d47b8c1a50e..8e815b418b7d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
 typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
                           uint32_t val, void *data);
 
-typedef int vpci_register_init_t(struct pci_dev *dev);
-
-#define VPCI_PRIORITY_HIGH      "1"
-#define VPCI_PRIORITY_MIDDLE    "5"
-#define VPCI_PRIORITY_LOW       "9"
+typedef struct {
+    unsigned int id;
+    bool is_ext;
+    int (*init)(struct pci_dev *pdev);
+    void (*fini)(struct pci_dev *pdev);
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +30,20 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAP(cap, x, y, ext) \
+  static vpci_capability_t x##_t = { \
+        .id = (cap), \
+        .init = (x), \
+        .fini = (y), \
+        .is_ext = (ext), \
+  }; \
+  static vpci_capability_t *const x##_entry  \
+               __used_section(".data.vpci.") = &(x##_t)
+
+#define REGISTER_VPCI_LEGACY_CAP(cap, x, y) REGISTER_VPCI_CAP(cap, x, y, false)
+#define REGISTER_VPCI_EXTENDED_CAP(cap, x, y) REGISTER_VPCI_CAP(cap, x, y, true)
+
+int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 16a9b1ba03db..c73222112dd3 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -187,7 +187,7 @@
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
        __start_vpci_array = .;   \
-       *(SORT(.data.vpci.*))     \
+       *(.data.vpci.*)     \
        __end_vpci_array = .;
 #else
 #define VPCI_ARRAY
-- 
2.34.1


