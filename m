Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8DA81D69
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943384.1342173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCY-0004pr-1U; Wed, 09 Apr 2025 06:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943384.1342173; Wed, 09 Apr 2025 06:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCX-0004oH-TS; Wed, 09 Apr 2025 06:46:21 +0000
Received: by outflank-mailman (input) for mailman id 943384;
 Wed, 09 Apr 2025 06:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCW-0004jx-L7
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:20 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2407::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 577e340c-150e-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:46:19 +0200 (CEST)
Received: from BN9P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::29)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 06:46:15 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::a6) by BN9P220CA0024.outlook.office365.com
 (2603:10b6:408:13e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Wed,
 9 Apr 2025 06:46:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:15 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:10 -0500
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
X-Inumbo-ID: 577e340c-150e-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txhPBfNYIBbe13GDpw7zgBwecUN8YKIrCbv0ewT1GJ74d8xnWnnJDWeg1ABO+AjIl4Kw4kBs+nePcnoFuhJYUxF+jarHAgQ+QC+jvCTzLY9WP8jtL9yz3GNEeng07ngEGTgl8/AHzEkez/rqJ4cj9T97b66DphY1rjzaPNnt738TPVAn7amcvYvL276+RE/eclcc+1L7LBfos9cILGT9YInpZ0m1goJGpvB0QEOb6bkgluc46ENsw0GWoF9LvS5vhLklGMHFXhGYNcoSdkxF7OYzYJR8Uy8SsO2HzjaoxHxBDfBBerENKf+ZxVIcvBI3JGGkJCAuw4W4R7a8QEL+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K+lOO8/HCLmhhfH2l4Onp6abTn+2M6qeZACn+U2biw=;
 b=NRjohrHf6r3+WROaYI/sLlYekaDd2+KRbCsZctWATkTjUOz8uwv/28AK3kMiye0g85YcmLu7c4944mErf2q5vZAnYkvgDG3Xfkmyv3gp+l7CC1kDGxpktlbMICzOkhTbTEKzCfTJI7o6UrJ3jNAcmf3tvrEJOYcXJWNoFvBiXCDG9kWBvP+ipaFFvzUeTyUa70MtRZfSwOOupO0dacaoorWh6DA4b4EPPqdRH81l+gfWeMdZFePPtLDGWYijcMmL1WyIBmabL0PUHLaptse/RUGhgqWe7qU5etK5/uYtvPhKpfoe9k53J4OGklp3/RKx6OAtMGcsaDs3Mn/A319exg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K+lOO8/HCLmhhfH2l4Onp6abTn+2M6qeZACn+U2biw=;
 b=m67U1eWhgB/+mrxKLLHxOCR9i808TUBlbLHbH02vnY4mHnEUw2n/flBlbx+qeI16BYBGNcJAt1NzTuHBynIpXcno6u+yCSXp24FaIZPBN1uaEL87QG+ZflCgjyBdcvDcs/4T0AswMK7Fs0lAjTsybq0ip2KaL7x+RtLHLg6N2js=
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
Subject: [PATCH v2 4/8] vpci: Hide capability when it fails to initialize
Date: Wed, 9 Apr 2025 14:45:24 +0800
Message-ID: <20250409064528.405573-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409064528.405573-1-Jiqian.Chen@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e69c30c-7b73-42ca-8d8a-08dd773239a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjlGdVlGMjlpR3BGcmZDbXRsUUoxRjdXV2hYZ0FZQUZOSEhvSlp1WTNmZzdt?=
 =?utf-8?B?cUJZRXNWMG4rdzRqNUlNaURVbWlXeXVOZldRR0tLUy83UzB5SHRuT1FPc2pL?=
 =?utf-8?B?WnJRcjhBT2hrYnFqWVBYb0pMZ28zQVZyTm1vdzV2RjhTQzhGSWtxQmJGQjZK?=
 =?utf-8?B?NXY0Z3F6Q3hJTmZVWlFiT09xVWZHbDRyL0tBT3d1UnUvU2NpT2MvOWVad3gv?=
 =?utf-8?B?Q2V3OGJNNGkxeGVkMlR1a2ZRK2N4ZHBIYzUwOVJ0S29ldXAyOVVlaFRtcjk5?=
 =?utf-8?B?MWhHUUxaa2lhTXdnV3V4cUZVejFMNHB4Uk9EUHdtd2pYSXNXcVoxNTZBS29h?=
 =?utf-8?B?d0lPUnBuczRkYk9WMXhvNVJtR3YzUjdMU3hvZERKeFAzajRwT1VLcnhKbm9z?=
 =?utf-8?B?cWJEZHVhMEU5dUJnb0x6cm9TSnlnU0lDYlJ1Q0ZjaFBWK3VNSFUwVFFtbDBF?=
 =?utf-8?B?T3MvSVZIK3o5b1kwMnA3dzlOQzFqeDFjVVo4NlVsRDhOYWxGQU8wcDBZRkJv?=
 =?utf-8?B?eGNxOG1DMlZBRHh4cExFK1lTbzFhZW4rNTI1VmZXd3FDU3lSN1BFZjFveE8x?=
 =?utf-8?B?Nm1WZmE0MFdlZWpodkd1TlBFZmNSOGxReHFTcW1xbWY0L0lXRlRkbjk3R01a?=
 =?utf-8?B?M05RZ0xzWFhjT1R1TnNyRlBPN3JXMkViM1QxZEdQckpRYXhyQ1VmRjBvR2hC?=
 =?utf-8?B?bFVBR2NKaktQYTFhejJVUENCTlU0OVFIOFptMFlLT1JXU1BPSWtRbU1BZnJw?=
 =?utf-8?B?K0k0NVVacDdFN3NuMVl4aDdIWjBOdWJOWXBTcE1KQnlHdUNmYWhCenpMNHhS?=
 =?utf-8?B?V2U5TFdUcU42bVJ6TWxCV1V0OTE3bmplbFVrQWxiVHJUb3F3ZCtjVE9rajJQ?=
 =?utf-8?B?MTNENkFzZFJnZzN3Zkllbmt1cUZrSFREOUtQbHZsUDhGaEpFeHJPOVpOKzZG?=
 =?utf-8?B?U0ZIZVBTUnpka2k2WUNJYks3SHNsTURWUjM4blBncUEwemE0MnlLN1FILzZK?=
 =?utf-8?B?ZzM5QVZkUjdpamhDR2h3elJXTDR5WTFteVNMcHJUWmV1dDRjL1FYcFJDRCtu?=
 =?utf-8?B?cmc1RzlMa3FkVEJuVUVNc1BXbGdwQ2xFK0g5ZG9ZMWRlT3RiaWkwWmdDdXBr?=
 =?utf-8?B?V042RkVaOUxLdEU0YytHbC9UZGkxd3I2ZUI1UUl5WTA2SUNjVjRkcnNjMmJ0?=
 =?utf-8?B?MkpjQ0ZGSEx4MkdPc0piS2xaOVoxMXN5M2Q5Rk1NQXpDODNRb0xacDdZdXpS?=
 =?utf-8?B?N2xIT3plZFkyNUYvSitvdWxJTHpIVmxiQlU2RkRoVFlPMmNLOUpBUkVzQjhJ?=
 =?utf-8?B?dFJqR3F6US9sZzg4M1N1S1VJVmc0YmhWelltR2pHZTYxMDJWc1Byb20vbnV6?=
 =?utf-8?B?Z3o3bnVtUGFQYzJXSmVHVlpEeEhoV0xLYXluUEErcUZrY0I2Tit6NUxMSHdi?=
 =?utf-8?B?bTNXQUxiQVhURVdwdWw3ZGRLZk14T1hkZG1aWHF1aVdKOGRPZzJsWE40cEYv?=
 =?utf-8?B?eXlWS095Z0JueFdGK2QvNmZCZEk2UHVrYzhLWklaMTI2enVwNmJxeldLTnZz?=
 =?utf-8?B?VXZMZVRHU25adGRGSTU1aUhhcnk0elBIWjJoTXh1bXNhRitOZWZ2dEl4MFBW?=
 =?utf-8?B?aEprVWFBRk5SdSs4ZDJFbUNvdFBUaUNEaEVmbmVIY3FpZTZRM00xcjhNSzFZ?=
 =?utf-8?B?NXdieGZWRHVwbXptZi9UUFpJQnNwMWRoV0VFQm90ZXhDeUhSY29YNG0zczBW?=
 =?utf-8?B?Z0FCZUlRK1dsQlJwVGVkbTBMK25GZS94bkhzbU41QmdreDlkQjRJWTVCZTBN?=
 =?utf-8?B?all4L3lFYkZSU3pwRVlJL2lwaHROL2NvTGNFR3d4K2IreS9FWTRneEYvMmNV?=
 =?utf-8?B?RDhMblV3a05veGJqcHBkSlE5QXJaaG1KUHFidGozWmk1N3c5S3NyaWJQYUVM?=
 =?utf-8?B?a2FuWXZwbWlFclk1bkZGUHBJZWpnczUzNVpGVjdiNzdwQUl0R1R1REVvS2hQ?=
 =?utf-8?Q?ajXinbHdx2xMQNCoIwcShULTWASljM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:15.4903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e69c30c-7b73-42ca-8d8a-08dd773239a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434

When vpci fails to initialize a capability of a device, it just
return error instead of catching and processing exception. That
makes the entire device unusable.

So, refactor REGISTER_VPCI_INIT to contain more capability specific
information, and use new functions to hide capability when
initialization fails in vpci_assign_device().

Those new functions remove the failed legacy/extended capability
from the emulated legacy/extended capability list.

What's more, change the definition of init_header() since it is
not a capability and it is needed for all devices' PCI config space.

Note: call vpci_make_msix_hole() in the end of init_msix() since the
change of sequence of init_header() and init_msix().

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
v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c  |   3 +-
 xen/drivers/vpci/msi.c     |   2 +-
 xen/drivers/vpci/msix.c    |   8 +-
 xen/drivers/vpci/rebar.c   |   2 +-
 xen/drivers/vpci/vpci.c    | 175 +++++++++++++++++++++++++++++++------
 xen/include/xen/pci_regs.h |   1 +
 xen/include/xen/vpci.h     |  26 ++++--
 xen/include/xen/xen.lds.h  |   2 +-
 8 files changed, 179 insertions(+), 40 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 6833d456566b..51a67d76ad8a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -848,7 +848,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
     return 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1044,7 +1044,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..ca89ae9b9c22 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 6bd8c55bb48e..6537374c79a0 100644
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
+    return rc
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..79858e5dc92f 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..f1f125bfdab1 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,9 +35,25 @@ struct vpci_register {
     uint32_t rsvdz_mask;
 };
 
+static int vpci_register_cmp(const struct vpci_register *r1,
+                             const struct vpci_register *r2)
+{
+    /* Return 0 if registers overlap. */
+    if ( r1->offset < r2->offset + r2->size &&
+         r2->offset < r1->offset + r1->size )
+        return 0;
+    if ( r1->offset < r2->offset )
+        return -1;
+    if ( r1->offset > r2->offset )
+        return 1;
+
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern vpci_capability_t *const __start_vpci_array[];
+extern vpci_capability_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +99,133 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static void vpci_capability_mask(struct pci_dev *pdev,
+                                 const unsigned int cap)
+{
+    const unsigned int size = 1;
+    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
+    const struct vpci_register r = { .offset = offset, .size = size };
+    struct vpci_register *rm;
+    struct vpci *vpci = pdev->vpci;
+
+    spin_lock(&vpci->lock);
+    list_for_each_entry ( rm, &vpci->handlers, node )
+    {
+        int cmp = vpci_register_cmp(&r, rm);
+
+        if ( !cmp && rm->offset == offset && rm->size == size )
+        {
+            struct vpci_register *pre = list_entry(rm->node.prev,
+                                                   struct vpci_register,
+                                                   node);
+            struct vpci_register *next = list_entry(rm->node.next,
+                                                    struct vpci_register,
+                                                    node);
+
+            pre->private = next->private;
+
+            /* PCI_CAP_LIST_ID register of current capability */
+            list_del(&rm->node);
+            /* PCI_CAP_LIST_NEXT register of current capability */
+            list_del(&next->node);
+            spin_unlock(&vpci->lock);
+
+            xfree(rm);
+            xfree(next);
+            return;
+        }
+        if ( cmp <= 0 )
+            break;
+    }
+    spin_unlock(&vpci->lock);
+}
+
+static void vpci_ext_capability_mask(struct pci_dev *pdev,
+                                     const unsigned int cap)
+{
+    const unsigned int size = 4;
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    const struct vpci_register r = { .offset = offset, .size = size };
+    struct vpci_register *rm;
+    struct vpci *vpci = pdev->vpci;
+
+    spin_lock(&vpci->lock);
+    list_for_each_entry ( rm, &vpci->handlers, node )
+    {
+        int cmp = vpci_register_cmp(&r, rm);
+
+        if ( !cmp && rm->offset == offset && rm->size == size )
+        {
+            struct vpci_register *pre;
+            u32 pre_header, header = (u32)(uintptr_t)rm->private;
+
+            if ( offset == 0x100U && PCI_EXT_CAP_NEXT(header) == 0 )
+            {
+                rm->private = (void *)(uintptr_t)0;
+                spin_unlock(&vpci->lock);
+                return;
+            }
+            else if ( offset == 0x100U )
+            {
+                pre = rm;
+                rm = list_entry(rm->node.next, struct vpci_register, node);
+                pre->private = rm->private;
+            }
+            else
+            {
+                pre = list_entry(rm->node.prev, struct vpci_register, node);
+                pre_header = (u32)(uintptr_t)pre->private;
+                pre->private =
+                    (void *)(uintptr_t)((pre_header & !PCI_EXT_CAP_NEXT_MASK) |
+                                        (header & PCI_EXT_CAP_NEXT_MASK));
+            }
+            list_del(&rm->node);
+            spin_unlock(&vpci->lock);
+            xfree(rm);
+            return;
+        }
+        if ( cmp <= 0 )
+            break;
+    }
+    spin_unlock(&vpci->lock);
+}
+
+static void vpci_init_capabilities(struct pci_dev *pdev)
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
+        if ( is_ext )
+            pos = pci_find_ext_capability(pdev->sbdf, cap);
+        else
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+
+        if ( !pos )
+            continue;
+
+        rc = capability->init(pdev);
+
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%pd %pp: %s cap %u init fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf,
+                   is_ext ? "extended" : "legacy", cap, rc);
+            if ( is_ext )
+                vpci_ext_capability_mask(pdev, cap);
+            else
+                vpci_capability_mask(pdev, cap);
+        }
+    }
+}
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -128,7 +271,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,12 +301,11 @@ int vpci_assign_device(struct pci_dev *pdev)
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
+    vpci_init_capabilities(pdev);
 
  out: __maybe_unused;
     if ( rc )
@@ -174,22 +315,6 @@ int vpci_assign_device(struct pci_dev *pdev)
 }
 #endif /* __XEN__ */
 
-static int vpci_register_cmp(const struct vpci_register *r1,
-                             const struct vpci_register *r2)
-{
-    /* Return 0 if registers overlap. */
-    if ( r1->offset < r2->offset + r2->size &&
-         r2->offset < r1->offset + r1->size )
-        return 0;
-    if ( r1->offset < r2->offset )
-        return -1;
-    if ( r1->offset > r2->offset )
-        return 1;
-
-    ASSERT_UNREACHABLE();
-    return 0;
-}
-
 /* Dummy hooks, writes are ignored, reads return 1's */
 static uint32_t cf_check vpci_ignored_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 27b4f44eedf3..5fe6653fded4 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -449,6 +449,7 @@
 #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
 #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
 #define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
+#define PCI_EXT_CAP_NEXT_MASK		0xFFC00000U
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 807401b2eaa2..5016ded64d89 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -13,11 +13,11 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
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
+} vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
@@ -29,9 +29,19 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAP(cap, x, ext) \
+  static vpci_capability_t x##_t = { \
+        .id = (cap), \
+        .init = (x), \
+        .is_ext = (ext), \
+  }; \
+  static vpci_capability_t *const x##_entry  \
+               __used_section(".data.vpci.") = &(x##_t)
+
+#define REGISTER_VPCI_LEGACY_CAP(cap, x) REGISTER_VPCI_CAP(cap, x, false)
+#define REGISTER_VPCI_EXTEND_CAP(cap, x) REGISTER_VPCI_CAP(cap, x, true)
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


