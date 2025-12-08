Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB84CAC798
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180068.1503334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWSD-00018k-CB; Mon, 08 Dec 2025 08:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180068.1503334; Mon, 08 Dec 2025 08:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWSD-00016q-7w; Mon, 08 Dec 2025 08:18:45 +0000
Received: by outflank-mailman (input) for mailman id 1180068;
 Mon, 08 Dec 2025 08:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmTq=6O=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1vSWSB-00007V-83
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:18:43 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81408cb2-d40e-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:18:42 +0100 (CET)
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:18:37 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::fc) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 08:18:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 08:18:37 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 02:18:35 -0600
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
X-Inumbo-ID: 81408cb2-d40e-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M08mj3gZ8GhKu7Mwu3cnKSPoGq9x9v7h60j3kdq6iQ5rY+zFguMD1CR1bSJ1u1vncKRB/JxRuojdaAwAdRp0jLhIBg5lxRZ7qLej3qA9a9WO/M6D9OnvgMOyGT7vP1sBRS6Hp/bu1fxd4kmNm9vgcty1DB9G9U5KefaX+k9/dZCUJ5f833E36s8rgFrjLbAFSVXS4vQkwGhFx+szhbK+c2KJFNlPbohrJApGdJFNtIuj1vkLbpzJOh+bWrP/5Jnrnaj38UW4rW9WI1URzTu2cX3TGP8uzSz+k3MaG3FGpVh1fKBBJVbtbmO8ntC04FjWT4FRGQpPy1WwrNg75zUKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h15ZFZ9qJGUjaSdA+3pihgCPa4cgLgZUbxspOGcJr54=;
 b=RU7dGixIcSI+f08hY0JIJO0eoJpMu2YKdxi/tH8ifWnCleFKC2o6SLoxhqBbu+ubrndAIaX1GAydSUKprHUEgeV/iF2cKD09xu/FsRvqLODgHdj2WnSHVVhR6OT1/UYe7zHdhX4TqqPo8K6e8mWNwsu7apjkIdy7veYL0QJmoq5UQDZ6CJktqA8rIdGHsEXmlj6z/YcZJWy6psC2InsAnh5MNkwyUTSjp1RAabN4QiHy3lShtWYP2+4BUTbmJ+rG/fGi5BrsaMrhZPBXWzK2Hkco1/7Rc4yotyE0APgEI9YHgH7Ej78SM5PdsZbTmJXwA5wLC6t8NROSeuua/1dssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h15ZFZ9qJGUjaSdA+3pihgCPa4cgLgZUbxspOGcJr54=;
 b=aLLq9rzGaoEUDg0x80rg0boMYixfWL6KPWiSS+UzgbdayL3toJ/qE8ZRp+tpKpWVkJk3wuiaMhLtmdZcep8Uy0tqcMTZBpD83TrDb/9u58DdQQqHpBRlMSyOcdM63r0/ubWeen0bKmdEcQR5audAl2i+uK34yEul4tqaiPB4tfc=
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
Subject: [RESEND PATCH v12 3/3] vpci/msix: Implement cleanup function for MSI-X
Date: Mon, 8 Dec 2025 16:18:15 +0800
Message-ID: <20251208081815.3105930-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: d98a2231-5ec8-49fa-86e3-08de36326320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGtSQjVaOG9jTU9xQkhZeHBiaWl2Rit1NHV0RDljSldjZTduTmhDNWpLSTFG?=
 =?utf-8?B?Zmd4QWd4RjRITjBPY2JNRUlIcVFZanZEZUp2Uk9tWHpQcmd4SXpFdG4yUzgx?=
 =?utf-8?B?UU5FbDV4ZENOMkk5RXI1MXc4d29jQ2VWcXQvTU1udGFwN3ZjeWF3RjE4QnNm?=
 =?utf-8?B?dnY2T2dmY2lPWW1MWGFkSzBka05kd0hxSW9xb08wUlRZSm9OdUNha1J5eExs?=
 =?utf-8?B?UHZlaDIzN20vdThBSnNCa2ExV282bzd0SDJlWHJiN1pLeTdldmNnUzVjVkd1?=
 =?utf-8?B?QTFtbGFPQXB3akJhK0EzeWJJVExoM1FTSzNpVXVsL1ZJL0RPQjlLVG9tbFg0?=
 =?utf-8?B?Z0lUczJsampsNWVZZDRiYVAwZmZGdURycnhkQmFHWEs0NHhtK2xYa0VnTnla?=
 =?utf-8?B?NjBpaFViQnNEUldxWXdBcjBIUkZ3Wk1xRUxNd2NrRnVTeWFTMG5TWjlLQUdG?=
 =?utf-8?B?b2JIM09ZNXF5M3JIYlFWdmJpdnRJa1N2bEw1V3R2aUNiZFB5Ny8xR0pMaEtR?=
 =?utf-8?B?ekxQQlZXVFF3VzRWZVhDdHlmL0NiMU5nTWdiK2NabG1TR0NrcVc1ajNkYVN0?=
 =?utf-8?B?NGx6N29qMjh4YTZiNDk2UjQ3ODdVZlJsbSsvY1RJTStCMTlPUDR3L1owVWpl?=
 =?utf-8?B?TEM0RVVoczdLMktJenFKV0F2YnNGZzN6VlVTUGlrbnhlazZLWUxzZ0ZpeGdE?=
 =?utf-8?B?Ylh0aXA5WUxLWkZybFhUMkI4N3psdldsOEJ4K2tJQTVtMmR6a2JlSXVZSlN2?=
 =?utf-8?B?dnJPaGJoTEk1VzlhY2Z6WHFsVWlYZUxubVpyQkdmMSt3Q1JaNGJWT05NZlpQ?=
 =?utf-8?B?NkJsemtueHN6VmtWZUhDRkxPQWh1c2Y4aVkyY2FkTTV2VGdzOGtZbUpIRDFw?=
 =?utf-8?B?QkZtWDV2a01lVEZxMExlRmRPRUI2WVJ3VU1YK0FmMjREekkrbzNrWk5ST1Vm?=
 =?utf-8?B?N3p6Ym9hSzRLazVLa0I3eTRoODlFY2ZGN0RPV3VVa04rUW13QTJycVFDdzh3?=
 =?utf-8?B?aVplSUxxc05jWEV0dGZMWmVoLzFHSWtJcUtrL3pZWU5xYzVBWnpWRk1MVFgr?=
 =?utf-8?B?VXIremQzbHNxZTNmc3ZPZUlac3VNLzUwQkdLSU9WdkNuUitHaHdwcjhxc25M?=
 =?utf-8?B?RDBqbE9vcWVwOU9GMWU0b2k0QWkzRXZlOS9TSTJvTm55RmowTEpqd3VMemFx?=
 =?utf-8?B?MFBabCtrbFNUbVdNRjB6WGVwZ3dIbUd4cHY4MWhwT09wUDJCZzdUVXNFUHd5?=
 =?utf-8?B?N21MTVpZdWRuajc5UVJ3emdReWhUaVloNHozMXBpWkdxMHkzdUNjcTRnZTZv?=
 =?utf-8?B?d1NsSGE4ZEJUbHJNNklSeFBQYUk4TytobU5KTk9mN2NrVzgzNHZhdURvUlJN?=
 =?utf-8?B?eEZlR1NZd1pQNTlGMFJ0UDgwK29MTkQ3M0R2OHpYZlJ6WnRlRmprZ3dHdEFO?=
 =?utf-8?B?ZG41TlpyUk9CaEFPbmtVK0d5bGZKOU8yT1NaQ3VEWXBuQXIwOVV3MExRTS95?=
 =?utf-8?B?WDMxSkhnZVRvZFh3a0lhQmN4Mm1HVmljMkg2dnQvbzNHUkYyK256eHRveldP?=
 =?utf-8?B?cFVXeGVBdjNNT2puV1BFcnlHb3JHQ05nQVIrRWxQSlRwQzdIcENDeXhaRmpx?=
 =?utf-8?B?UzlJVVNaT3F5K1FaSDZaMCt4bVFrMlQyWHhqOEtMY3VDVnphdkFKYzdnUnkx?=
 =?utf-8?B?LzVoZEpTRm1NN0ZLVENFQVYxOGpsZWtEMGdWblFSdTd3V0c3bkFsL3hPUytQ?=
 =?utf-8?B?aDNQVjJuQytVMSs1RC9yMlBsNGN3UU5jYldnRlNSdW1ocW1nT29KeWo1MHBP?=
 =?utf-8?B?SmRxQmFSK1piOWF1Mi9UR0dsUUJkSDNsL3hPazkzTUlTblZtVkRzNVVWQ04z?=
 =?utf-8?B?ajhORWNyT2VMc0loZHVoZnd3WjRsVWJncUJGK29RcHp0aEN5cVNRaVBUVTUx?=
 =?utf-8?B?Yi91dFo0NVFNMEVtSHRLYXFwWWFrU2dXeFNCSXhNRHZodDRWd1NRU3BKbG9m?=
 =?utf-8?B?TXNRWkVEUGhsdGU3YWw1Ty9qQkhvQzB5ay8zWDZwbHFFQXllYXNyLy9GTFBp?=
 =?utf-8?B?Y3dWdTY5WERReUhwTENTZnhnRngxa1JJSGZCVzg5UmlBMVJxamZJZ3Bld1Ev?=
 =?utf-8?Q?AaXQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:18:37.1193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98a2231-5ec8-49fa-86e3-08de36326320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859

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
index 032e471bb1c0..8dcf2cf9d598 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -656,6 +656,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
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
@@ -751,7 +793,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
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


