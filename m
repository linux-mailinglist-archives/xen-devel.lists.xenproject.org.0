Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E963AB0E36
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979882.1366405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgP-0005Vj-Bm; Fri, 09 May 2025 09:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979882.1366405; Fri, 09 May 2025 09:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgP-0005Qu-66; Fri, 09 May 2025 09:06:17 +0000
Received: by outflank-mailman (input) for mailman id 979882;
 Fri, 09 May 2025 09:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgO-0004kr-1E
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db7844b9-2cb4-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:06:14 +0200 (CEST)
Received: from BYAPR02CA0006.namprd02.prod.outlook.com (2603:10b6:a02:ee::19)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 09:06:09 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com (2603:10b6:a02:ee::4)
 by BYAPR02CA0006.outlook.office365.com (2603:10b6:a02:ee::19) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20
 via Frontend Transport; Fri, 9 May 2025 09:06:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:07 -0500
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
X-Inumbo-ID: db7844b9-2cb4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEpoZ/dSZji/WW+SrbqHy3SyTh+LnAI+Y9eUX2JmMRhLOxtrM/+uwa84bD4hqsktHJRwzpLM/vTFdwSw6flQyQ++h4UmDP498GqdT9Scbqk1p1dBbRNt8Iid2BQ8/22HmOZXb53Nl6VJNfv5Jqcnskug+eMWP4Keed5NRLHTg2BKWFYgf/EzHCMvpG3rc2/bPfcirSyvQo2+blDo1v8cSMdweR8qL6LcroK3NzciuuLOCvQNBmiQ5oXnL1o9GLbrRukkRfzeZ+Rc2+EVIy8Gj3wqD1TQqf/nc22QBAFY+ORToQmloLpUCe4vv6ZL/qr2VXZwzL9lSK98ZrYtZwBO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfFOB0Mnzec6rTpJsTgNXsMjGaiorSO7uuWfsMiLw/o=;
 b=VYbLT4guAcGya/GK25qmZ/S8+EoLcBN9sROJ0PSa0rWgltdGP+3zrdcYoty8hC1eT5b/5oJB2+tko3Qs4Y1isyvFYimuCP/AM13VK6bNIAq66jJ2LoGOawe+B6uu43330n9Ont8TgV6mOLsNh7CKzzoyDDrUh59TwabrmCxgsvgWl5YaSV0z8CiWBItRt2blfp7OBPMpJQLNkMGtki1gBNWjQzLXTTGQLCoDNUC10LUlodD4Zyk0cNmIrywQstAQ+bCeA9vJbxcxWiNKCaChIAVrkD566/L58To/LiuX9GEmI256D34koAeDTFOGwl4sQvSaasKyrDzAxKYAK6XiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfFOB0Mnzec6rTpJsTgNXsMjGaiorSO7uuWfsMiLw/o=;
 b=g9JEw3nBEmotFoR44sR7ToOHoUs5rbKaFe95T0TFPvum+3+J5IUyv5wC/b4yoz8R1ltBOQxDNLUBwg/pyFsAwqH0R6KeajdbHuEl+qID5UIkytt5Jma4E8voPMshYMcqEBIB4Xqf559/FNrKeUE+Xo3HCkIw/wFWfibG84XnR+A=
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
Subject: [PATCH v4 06/10] vpci: Hide extended capability when it fails to initialize
Date: Fri, 9 May 2025 17:05:38 +0800
Message-ID: <20250509090542.2199676-7-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5928e1-0bfd-4a64-60ae-08dd8ed8bd3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlpaTHRqZ1JPQlZzbEpJSXBhSHJFeHdKTVB1SlRuS1RpcUNxVENYMmF0bjVN?=
 =?utf-8?B?SmNvSnVHMVc5WWRLYlZTc3M4MlNuaG8zVjdIT1ZmRlhiWU9oL0QzVHA1dkRa?=
 =?utf-8?B?NENoMjJxS3NHRi8xMGZxcmlCbXVqV0RTam1kbUlaUGxCVEJCSEJJUU1EQ2VS?=
 =?utf-8?B?WE9qZi91RjFxWU9mc3hRUWhWenh2clo5dmd2WHRvVElKcjhyY2JCRmxyNU5O?=
 =?utf-8?B?NFB0SFBLZWhtSHhXNUZXRFV1dXg0WnJlV0hBK2NUaVZGZmxlMnREdG1mYnRk?=
 =?utf-8?B?SW90YUh6MUVvRmI3cVhlUDNBOGFjTTRQUzZjbVc2WFJ2YXJtWDhVM1Frdm9t?=
 =?utf-8?B?dnpCRjdBTk1KZVNmcDliZmRPdzgzRDM2ZzF5L0xUUUpOaVJqUHZNWUovYnNO?=
 =?utf-8?B?ZytDRnZwMVdqU2lwUFJ1VS9FbUJOaTIwUEs1d1FSc3dMOUhDeHZqekRTNFdZ?=
 =?utf-8?B?MmtTZTZMSlQwWkFBTnFzSXNtYkxXSkFwK0M2OXFhUW90UXEwRC83bUZyc3hw?=
 =?utf-8?B?NVZNTXgyaXA4SHd6ZGNiZUxLaTE5a1dRRjVIZmgvZjhLVmpDaTVjbnpCbGdh?=
 =?utf-8?B?K3dnU3hFMDVsVm10V0hUZS9pUXRmemp6ZDdYVzlCdm1tN2xkeHNmd0lmQkx6?=
 =?utf-8?B?Y0xLUm4xMFZDTVIyZ3ZmZE85UUpaQW9OMDFTb3dHQlRqanFWS2poaXFZcDgv?=
 =?utf-8?B?bS8wZmEvTzF6S09ZT3IvV2NIanpZVnA3QVpRRHd1RTdkV2hBQzlBeVpBdzZZ?=
 =?utf-8?B?ZU9ZK09OT2ZxY0Q1ZHlObUpCc1NQTS9WcVcvbE1oM0NEMTVtT0Z2cXNDdURT?=
 =?utf-8?B?ZlQ4N01aTXBPZDJFaVpWeDJnaUhUSlp5Q3Y0c0JMOE5pWDRkeUc3YUVrdGhR?=
 =?utf-8?B?N1VrZjdMZTRDNGtkTUVYaElSdzhHOStKK0ZUQ2RLdWJockRUQmVwQW1ib0Va?=
 =?utf-8?B?L1J4Y1c5dWc1R0ppODJXYjc0OGZ2VVNDaXl3eitMQTdZVzlTRytGT0k4QTdY?=
 =?utf-8?B?YzdpTVZwVkh6M2lvNU1pMDdkUDRSczljdUplbElNM3REei9qc1YxV2pxVStm?=
 =?utf-8?B?Z3Brby9qejBaanlsMnFjQTBMMHZEcW5MZlZ4cE4rOHRxSkdWYWYwRXQwOTlU?=
 =?utf-8?B?aEJXdTBBTkFEeHhSSjNoM1JtN0xHQmptTmFBcjVTSXdRV3YxaWtHTks5anNx?=
 =?utf-8?B?eDZaK1hZYXV0TGlMNXowSy94cTlhUmhiR0UrS0RSYXBUUVU2RzQ5M1BpLzND?=
 =?utf-8?B?TWt0MFp0RWczRWpLRmxvZGwyaE8vU2F5L1U0RlhuNzlZNmxweEQzTTF6cmVa?=
 =?utf-8?B?WncvSmFYUEpwSTA3WGYwNFl1bDJVYTJzWnUwdzRnbDdHamFtcHhOdXBmRlhF?=
 =?utf-8?B?N0d6YTR2WnlCVUxEMTRRNHhtVzZ0ZDE3NVFCL2pKcXJWbEMxbHA4dE5UOGx6?=
 =?utf-8?B?RE1OU0xOOHV2T1JieXIzdHJGQVRrdEY4eFBYRWJTMU5haDd6OFJhSTdCbHd0?=
 =?utf-8?B?cDQxUDJPYUhxTjhxaEphaUFnY1lHT1pEMENiMlpSMXZySENCU245aUVTOTNy?=
 =?utf-8?B?eVZNelVQdW1zN1FoNGdiZXdyOFo4OStocE5weXpTNm1xVG9URFdGQUt5dEdU?=
 =?utf-8?B?aVptNzJkd1phNHFHSUVFQklucVNVOUVuUUhnV2d1djZFc1JYQ2g3S25wUFBk?=
 =?utf-8?B?cEZ4RTkzVHVtM3NhYytPd3dvam9zYjFkWDNZM3ZLc3g5UHNadk42SGxKSkJx?=
 =?utf-8?B?U0s3QmZScXBUeHlrZ28vRDF3SlI3ejBkaWliNzdaRGo1WGlwbzZ0RXBzNjZv?=
 =?utf-8?B?ZFhPL1RJbUFSU0pERmU0SllJN21KYzhvKzhCWlNmYnVFaXYrVEF5ZFZ6c1A5?=
 =?utf-8?B?NUozK05RK29pa3BUdkp3clMvTmZsdm1rVW52SWk4UkFldkVJcFI1Rjl5SG5a?=
 =?utf-8?B?VEdpM29Ob0gvVkRMNVk4NWJsUEl5TTRONkhsWitHYUNjN2NUN213Z3Qxck1Z?=
 =?utf-8?B?bFdWbjhXUXplUi9RQmhXMUhjMmd0UG8zZ2d6WlhiQ2xmdlZweVhkZXVQU1pZ?=
 =?utf-8?Q?FYdLcA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:09.3959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5928e1-0bfd-4a64-60ae-08dd8ed8bd3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194

When vpci fails to initialize a extended capability of device, it
just returns an error and vPCI gets disabled for the whole device.

So, add function to hide extended capability when initialization
fails. And remove the failed extended capability handler from vpci
extended capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v3->v4 changes:
* Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header) (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
* Modify the commit message.
* Change vpci_ext_capability_mask() to return error instead of using ASSERT.
* Set the capability ID part to be zero when we need to hide the capability of position 0x100U.
* Add check "if ( !offset )" in vpci_ext_capability_mask().

v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize".
* Whole implementation changed because last version is wrong.
  This version gets target handler and previous handler from vpci->handlers, then remove the target.
* Note: a case in function vpci_ext_capability_mask() needs to be discussed,
  because it may change the offset of next capability when the offset of target
  capability is 0x100U(the first extended capability), my implementation is just to
  ignore and let hardware to handle the target capability.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c    | 100 +++++++++++++++++++++++++++++++++++--
 xen/include/xen/pci_regs.h |   5 +-
 2 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index e1d4e9aa9b88..76d663753e7b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -193,6 +193,98 @@ static int vpci_capability_mask(struct pci_dev *pdev, unsigned int cap)
     return 0;
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    struct vpci *vpci, unsigned int offset)
+{
+    uint32_t header;
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    r = vpci_get_register(vpci, pos, 4);
+    if ( !r )
+        return NULL;
+
+    header = (uint32_t)(uintptr_t)r->private;
+    pos = PCI_EXT_CAP_NEXT(header);
+    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
+    {
+        r = vpci_get_register(vpci, pos, 4);
+        if ( !r )
+            return NULL;
+        header = (uint32_t)(uintptr_t)r->private;
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
+
+    if ( pos <= PCI_CFG_SPACE_SIZE )
+        return NULL;
+
+    return r;
+}
+
+static int vpci_ext_capability_mask(struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    struct vpci_register *rm, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    if ( !offset )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    rm = vpci_get_register(vpci, offset, 4);
+    if ( !rm )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    header = (uint32_t)(uintptr_t)rm->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            rm->private = (void *)(uintptr_t)0;
+        else
+            /*
+             * If this case removes target capability of position 0x100U, then
+             * it needs to move the next capability to be in position 0x100U,
+             * that would cause the offset of next capability in vpci different
+             * from the hardware, then cause error accesses, so here chooses to
+             * set the capability ID part to be zero.
+             */
+            rm->private = (void *)(uintptr_t)(header &
+                                              ~PCI_EXT_CAP_ID(header));
+
+        spin_unlock(&vpci->lock);
+        return 0;
+    }
+
+    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
+    if ( !prev_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    pre_header = (uint32_t)(uintptr_t)prev_r->private;
+    prev_r->private = (void *)(uintptr_t)((pre_header &
+                                           ~PCI_EXT_CAP_NEXT_MASK) |
+                                          (header & PCI_EXT_CAP_NEXT_MASK));
+    list_del(&rm->node);
+    spin_unlock(&vpci->lock);
+    xfree(rm);
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -225,11 +317,11 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
                    pdev->domain, &pdev->sbdf,
                    is_ext ? "extended" : "legacy", cap, rc);
             if ( !is_ext )
-            {
                 rc = vpci_capability_mask(pdev, cap);
-                if ( rc )
-                    return rc;
-            }
+            else
+                rc = vpci_ext_capability_mask(pdev, cap);
+            if ( rc )
+                return rc;
         }
     }
 
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 27b4f44eedf3..e62bf72ab3d3 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -448,7 +448,10 @@
 /* Extended Capabilities (PCI-X 2.0 and Express) */
 #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
 #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
-#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
+#define PCI_EXT_CAP_NEXT_MASK		0xFFF00000U
+/* Bottom two bits of next capability position are reserved. */
+#define PCI_EXT_CAP_NEXT(header) \
+    (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
-- 
2.34.1


