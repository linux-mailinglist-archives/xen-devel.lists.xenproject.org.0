Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5CBA2DB7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131214.1470403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23EA-0004RT-9k; Fri, 26 Sep 2025 07:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131214.1470403; Fri, 26 Sep 2025 07:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23EA-0004Pt-2x; Fri, 26 Sep 2025 07:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1131214;
 Fri, 26 Sep 2025 07:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOXT=4F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v23E8-00049y-Gz
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:50:48 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ef4daa-9aad-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 09:50:46 +0200 (CEST)
Received: from CH2PR05CA0030.namprd05.prod.outlook.com (2603:10b6:610::43) by
 MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 07:50:42 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::13) by CH2PR05CA0030.outlook.office365.com
 (2603:10b6:610::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.5 via Frontend Transport; Fri,
 26 Sep 2025 07:50:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 07:50:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 00:50:39 -0700
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
X-Inumbo-ID: 82ef4daa-9aad-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGpJf5pvpCncbXnoNtXZGHFR9xn0pC4ViyjwUojvZ5R2PZuqMIQpmiaM3ryVKNwYcllh2C4IKn/0ahUryEltqsOV536E0OP63RSfn4MUGbfJOQf3ncmFtZ/DhY2ValX54EWs72k3BsKadlYUFQyp8NyPoaEQS7CG4J51Nlmrba7YoUOsudGdl38TtMpv7Y5QOSVHtnZIHLAVP7k4/w9d0Nh69npTX5g5tAr73isZXWeOFExd/Zlf7wce2KusrScuwc55FS3RN7X9KiSzTesEKlDMPumBhbiifDwB8cYBFacmTNib6pJJwqgFuLcaIKgL2R3ie6OGb52dt9teR4QnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ludIB4tomAkFHdVYMp26SsnX4Cy76mwEPAwccNGqB8k=;
 b=RhoaHPKkTdsrt/oL46qlRI0qYj6YlmaXlHnspeWLOVJpt8pOh/hORWs2hpb601+cqruvfBGCR4YrSlLZ2zx46JLwN200lmkr3wdAXYIZmbzS2ALQQWnWET5Ez/U43wLAdVqSP4GW1U4U/JTTCntxyxSsUwteCVP5Ahkc3pMEuT0SY6AbayOdk/l36mh9eaT6wXRdCxU+/AmWNQhN/XB8GXMDegBfolVNb111GIfSFviVeiCaXyW9cjnK/gL509QMK8rlvyG5q31QnZB2GzAvXPtMfutrextHgd7Lu2HjmofT0fCNNQxC6taDGlSTJjs3FpwzJpWXh3Dld1mcIfPx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ludIB4tomAkFHdVYMp26SsnX4Cy76mwEPAwccNGqB8k=;
 b=rmW4kcRPA/jUKemZ4LQjudr9/+rEwCRnzV667C77Jm3Fx7ODLs4u6z6wQYGa1uM6yhe5Eu1MkTnx/AExJoOdCgGJtUPQGkJoiD+5B380EDmp7RXbrgGsfMuUunVy5F4C5ktnZxzdI2L6tgEIGMKFUYNh0Einms8eQEUK4WZIZdI=
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
Subject: [PATCH v12 1/3] vpci/rebar: Implement cleanup function for Rebar
Date: Fri, 26 Sep 2025 15:50:19 +0800
Message-ID: <20250926075021.27967-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a13f36e-261b-4e89-ffdb-08ddfcd163f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnlOQklycEZDd2E4Ujh2ejlodmNWMHFTU0VyeGFjSytzUWZJMnpKUGhqU25J?=
 =?utf-8?B?WkI1WnUzRHBxbTQ0NzFONEEydklLQkVXd3BqbkFTV3F0RGh6Qi9QdlVITHY4?=
 =?utf-8?B?SmxzTDdZeUloQnJuck1PSGo0ZCtNUkNtUGlTWWkzNVg0OERBaXZuUlczUlR3?=
 =?utf-8?B?SVpNMDg2TUtTWGVsVDgxNm5vZHRHYk1uSm0yY0h0TCtmTk9JRWdvV1l5OEY1?=
 =?utf-8?B?T2lJaDFoYzJEd1dzUHBPQ0ZwTVVnNXFKT2I2bmVlQkJjcFcyaWRpQjlzS29E?=
 =?utf-8?B?S2dMcnZsOVJrOERJNTY5WWFHcVlqcGdZMkxoOEJ4ODZ3Q1B5U1pVdGxYTlpv?=
 =?utf-8?B?NitYZEN4YTFzRmRmaG8vazhnelRDTlpOVlJMenNKczZDSG5RWXFuY2l2RWxB?=
 =?utf-8?B?VndSK3JYUnpBL1R6bTlISlFmV3hORVJjZ2tBV1FoRVJZMnRoRnppenI4aDhE?=
 =?utf-8?B?Mko0bFAxZHRnbXVob1RwR045RHcvV0p5TWNSK0V4WjVNYjEvVG82dlBVWG95?=
 =?utf-8?B?bjIwM0JoZythYVNSb1RVN2JtU3F4bDNqZU1tMlRGS0tOZExuSG8yQm5lTzRC?=
 =?utf-8?B?UWZCTzlNdWNrRDJyM0J0OFkzU0V0RDgwdW1jcUNKVzVhaXBKb1VTNVo1aDNW?=
 =?utf-8?B?ZmxsMlE3cXIwdEEzalYzejlsWlhlS2pGK0RBNWc2WE9jTW9hMmxuMjk2YTE2?=
 =?utf-8?B?d2ZWTGp6bXlZa21BTVhUUzBtQnVZenZyZCtGakxHa1lxTnRvMXlVVXhWcWlI?=
 =?utf-8?B?Yi9WcnNFV3VhSC9vTjFKZUNGQk1JV2dxSUU0WTZmNXk0Rm9WUXhlOWMwTTRu?=
 =?utf-8?B?NUJ4WWs4K0d3Wmx2SklzNFY1cncrWEFVRVVTeThFRXIxbVpmSklEUWsyc1Jj?=
 =?utf-8?B?TE9SLyt6RDNWd2gzMWp3Z2FrUHM2M0tYdDQxdjdVcUVPbkVZdjdoQVN1RXpL?=
 =?utf-8?B?bUdsTUc3OS9jei9vZVBjOTV6cEZuL25yaFJFczljdEtpTWE2Wm9DckVMYTBI?=
 =?utf-8?B?K2FNUEdXS0R1YWE0ZFB6ejQzTVRXRkkrdllySSsvWUZEZkh1Q2crQnI1anNv?=
 =?utf-8?B?dWFoc2dqYWtZQjk0akxmbHlZK1U2czQzbFZ2N01vbldkT1kxWURQSjJ3MW5u?=
 =?utf-8?B?TDUzejljN1lVcjZKQndEMjJDNFQ5NVR5KytrZzFVd3Z4YnlPaTlsNktMZnpY?=
 =?utf-8?B?V3ZWaldKZG9rTWdnaGFiVEc2dnJGT1Ixd1FuNXhTS1NZTjFzREtVWU9OcUVi?=
 =?utf-8?B?U0NJY2JOK2xkWjdNM2dyaW1ERUUzVGI3Y29JakU2ZVBwbHFRUGJTb0V1a3pl?=
 =?utf-8?B?SFVIai8wNzZqKzdrNGZieldmWDVZSURJMEduNk9GZ2Fucklhb1JzVWpsRmlG?=
 =?utf-8?B?N0U4eUhQZkhqd1I2WGFsWTFoLy9tbEUvQlk1bkxGOHlWdXV3STg2aTN1ZUph?=
 =?utf-8?B?SkV0NnM2RjFyeDkwLzJFRnNHaVZQTmJFL1hXSkQwMnZYSnNEWXVtTnk4ZHd2?=
 =?utf-8?B?VkJBakNwdWMrc1kvazAxMGI0THRrb2p3dGN1VWlWek1xVzM4MnNsaTJjU3o5?=
 =?utf-8?B?RkNBWllTcUVFUS9EdWI5YzBhdXNEYXZmaDdHMStLalhrZlhuanI1SGJQcEtQ?=
 =?utf-8?B?clRCUkFRM2tjWjlDVXZqM0xwb1VZdlA0Z0JsbHpKTGVibmhnak1qNE51YUk3?=
 =?utf-8?B?N2tkNWFhdGhaMktyMGZ2alBieXBDUEpoMWNLOVJuSmFrZlBsOTNXTFhJQUdF?=
 =?utf-8?B?ZmpJZzR5QkZBbTJwc3U2dE9rR0RkckF1aWV2Zmk4VWpoR3pNZGh4aTFZVWMv?=
 =?utf-8?B?UHN6MVZ4RURFd1JRbGQ4eHBHb1dFS00rVjAra05sUHBPSndvbHJvZVZLN0NI?=
 =?utf-8?B?a3VvTnpEb21SMGRZaUJxK013TUx6L3hLNlVCZ2JoQlpob3llc1JMNTJxdXVB?=
 =?utf-8?B?ZmpaMUlhZzhQNjNuY2NNYmtSS3lsRW5EbU1nWW11bHRVZjlmaThlVlFSd3Z2?=
 =?utf-8?B?NTAzRVd0aGtocmMxRlZEV2hwUjlMdzVma2xHcXVqM2ZFVlA4RVBGekJIc3A3?=
 =?utf-8?B?OHpNNksyN2IwZ3VIYmhaZ3BXZmdhU3Y3WW1Ydz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:50:41.1241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a13f36e-261b-4e89-ffdb-08ddfcd163f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731

When Rebar initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement Rebar cleanup hook that will be called to
cleanup Rebar related handlers and free it's associated data when
initialization fails.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v11->v12 changes:
* In cleanup_rebar(), move the check "if ( !hide )" above the vpci_remove_registers().
* In init_rebar(), change return rc to continue when "if ( index >= PCI_HEADER_NORMAL_NR_BARS )" and
  "if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )"

v10->v11 changes:
* Add ASSERT_UNREACHABLE() when vpci_remove_registers() fails
* When hide == true, add handlers to let Rebar ctrl be RO.
* Remove Roger's Reviewed-by since patch change.

v9->v10 changes:
v8->v9 changes:
No.

v7->v8 changes:
* Add Roger's Reviewed-by.

v6->v7 changes:
* Change the pointer parameter of cleanup_rebar() to be const.
* Print error when vpci_remove_registers() fail in cleanup_rebar().

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar"
  since cleanup hook is changed to be int.

v3->v4 changes:
* Change function name from fini_rebar() to cleanup_rebar().
* Change the error number to be E2BIG and ENXIO in init_rebar().

v2->v3 changes:
* Use fini_rebar() to remove all register instead of in the failure path of init_rebar();

v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of
  using a array to record all registered register.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/rebar.c | 62 ++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 3c18792d9bcd..3651e9613b4c 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,57 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static int cf_check cleanup_rebar(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    if ( !hide )
+        return 0;
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                               PCI_REBAR_CTRL(nbars - 1));
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports Rebar by default. So here let the control register of Rebar
+     * be Read-Only is to ensure Rebar disabled.
+     */
+    for ( unsigned int i = 0; i < nbars; i++ )
+    {
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, NULL,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, NULL);
+        if ( rc )
+        {
+            printk(XENLOG_ERR
+                   "%pd %pp: fail to add Rebar ctrl handler rc=%d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
     uint32_t ctrl;
@@ -97,14 +148,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
                    pdev->domain, &pdev->sbdf, index, rc);
-            /*
-             * Ideally we would hide the ReBar capability on error, but code
-             * for doing so still needs to be written. Use continue instead
-             * to keep any already setup register hooks, as returning an
-             * error will cause the hardware domain to get unmediated access
-             * to all device registers.
-             */
-            continue;
+            return rc;
         }
 
         bar->resizable_sizes =
@@ -118,7 +162,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTCAP(REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


