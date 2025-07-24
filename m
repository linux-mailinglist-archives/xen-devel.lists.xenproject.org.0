Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F864B10035
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055189.1423705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqw-0006tP-9Y; Thu, 24 Jul 2025 05:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055189.1423705; Thu, 24 Jul 2025 05:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqv-0006hZ-Sb; Thu, 24 Jul 2025 05:50:49 +0000
Received: by outflank-mailman (input) for mailman id 1055189;
 Thu, 24 Jul 2025 05:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqu-00055h-2w
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24bb4927-6852-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 07:50:47 +0200 (CEST)
Received: from SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 24 Jul
 2025 05:50:42 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::13) by SJ0PR03CA0122.outlook.office365.com
 (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 05:50:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:42 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:40 -0500
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
X-Inumbo-ID: 24bb4927-6852-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OV8PTyL8ZtRgt2jSvVEwSdFcxG0wGHHpNVV2f5ZRU1wx36qFEQW8jzthi0xCBpywd6UFI5maYtx9cmGtCdlbz/jH8X+XCZZpd/cCt2QZ8dA4ntLpir5CaydVocFdjwCW9e71jru4kku6sOOLo5tiITfcUq/2qLU0tyJB6B7rEIsuu2VlRSb7/dm1AG28JDdyeONP+e4B2WfbllMwSOczCD5opoZ0OK+U88lW1cHWWCCFAHa7plLF5IGTY6QwgmFHWoY6XFhKYKQDQzTnDslQJmN5r+XxcCQsbAHxY+v4fBjhjizQ51sjLJybzV/nO6yEksJn4RCLVJcMKL+7rM7oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNzCO6nh803dsQunmyw/ciUbc3WSgxKZjA9ysBYi4qk=;
 b=zC1vFuHchjMreTRQZoIoV2QhPTjHTqi9lrdEqHVlQX/enIgqUpNGgTUmz+FHE0L4qhlsOAafSVKCbwqkLdlOJ3ACWOpVX8RQemvjTpSuTdEaVSoOdCudySEYcO00mckn42yp6IGEA6+13133AGfBUfQxssjx6g0+smnV892O+LugR7Qjv4Sqgrl67ZU8p3+xpWhs4rpW89CLdxM4OqAzxJE5lqJTmT3Z9qvfO5SPH32FM+f3IFv/U1o9PUixe3+zIJHqEW0IgKl6QRuZJm98hubcOQTlQZdDj+UyD4T+CVvGvYq8rMqyaTn7F8TvR4KHLcsC87qEBTAW1AuHohLPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNzCO6nh803dsQunmyw/ciUbc3WSgxKZjA9ysBYi4qk=;
 b=rLWDeHK4O4W3pPBAkltXo+NvXnSw7y3aHW6lfMxtKQ3A8Ah4yNPCXi8mCwff8iI3NAk0lhWJCA5A/w7KcslmgHNgm9a/yuq4xzLwrG3tB0lodnymGlnAzHNYyHm07G6Ysa6MN8sx6i/erNsqjavKzxQr1e+PAjO4R78Twg1at9U=
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
Subject: [PATCH v8 8/8] vpci/msix: Free MSIX resources when init_msix() fails
Date: Thu, 24 Jul 2025 13:50:06 +0800
Message-ID: <20250724055006.29843-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724055006.29843-1-Jiqian.Chen@amd.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c3e247-96d4-4a3d-76b0-08ddca7606e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1pycTNVTUZ0QndpMzdUL0k5QU5BNzVKcFAyN0lHRGdTbFowbyt0OVl0ZmFv?=
 =?utf-8?B?U3Q5UzdreFZZUmc5Y1lQZWFhZUZpS0JEVW5XWHFDcXo2WGNDYUl1Q0VCVlMv?=
 =?utf-8?B?cGNSdXZ3Y1dkQVVZSnRwS0xMRGVLSG5yRFpFeDhtRG5ZYkhhdHJtNjF0ZFlt?=
 =?utf-8?B?eEFDZkt5am5oSVNEQ3o0YmV6S01ScXRMVXVqbk9yK0pybktJMUYyeUU3L2Zj?=
 =?utf-8?B?dHZPTTJjQ2d6MktrTUlERU5wdXRTd1NmT2NDSzRPQjRiNHg4ZVZwNnFQaDM1?=
 =?utf-8?B?dW5BVTBDWUlmdFJ2ZGhwOWZyZjRha3l5R3RoU05QdTA5T3owazVCajhOUjBq?=
 =?utf-8?B?K0swUHZoNDYzcVlFZVhnRHgzZ3lVZ0lObWU0bjdFYXZBbEN4RVNpS0pWSzFW?=
 =?utf-8?B?Uk1RWWw2OVVHUDBFTUlPQXR0eGhoV2ZmYU44dWE1NzBxNmptd29WOHdLUFdS?=
 =?utf-8?B?Z3J2Q01TcjN0UUtzTGlXckRna2tLZVdDQ29aNTJQTEo0WU4zdzF1MUx1eTRw?=
 =?utf-8?B?QW1CY3dVdWtRenZ6YTJrNjNHRnpoMXdWV3VoemRtUDJodS9FeFJmb01wQkh5?=
 =?utf-8?B?OHNCTWZ0eXJPL1JxSEdXbEVHbTZoemg5TmZrSEdPdGs3TW9mc2IybHNDYTB4?=
 =?utf-8?B?azJrbnh0ZzlTL1BkV3BKLytyUnVaRHFXcnEyS2hEeWpZRVVnMjNmMUl0VVZa?=
 =?utf-8?B?eXBSWGVmSmU4WnVpRUZlVDhwYkU3MlRpekZ4YXNXZmdkanFnd3JLcjdtemJQ?=
 =?utf-8?B?aXFWQ005SHh2OVN3Yk9ZR3QxS0thcnZlSVgzN0VsRDVIRFNGRFZWbGc0ZFJB?=
 =?utf-8?B?R2VlQVV1dVhwRmZmU0hKVHpKL0w2UUFGNWowTVFIczYrVkx1c21mdFg2YW9D?=
 =?utf-8?B?VlMzQjNnNWx3QVA5UEFvMml0T2JjbE1QSkpReXZOQmoyQlQ5T2ZEMzVQRWw0?=
 =?utf-8?B?MEI1U0RVN0hOdGlscTVZc0kxb01TamRJa01JZG5NMFArSkJHRnRkUG1neXRh?=
 =?utf-8?B?bGNXWlROQ240ZGRnam9MN1B2V2QyTFk1MFpBdzN3ajdCRHdPSWtkb2srSmI2?=
 =?utf-8?B?ZXFkM3Q0MUJhbDNwTWdtTkJGbXE1VGN4OXJRWW9UVGJUbjdVOGNmR2ZTVHRq?=
 =?utf-8?B?a2RqN1NZaGlpUWFTK0c3T0wxWTduZm5mMlJuVGZTdEJxb3B5MzFBNDNuVVRz?=
 =?utf-8?B?R2ZramRnbmpvTVYyeXhaSUZUdndBano1Z1ZMZGpHNEJSTFFEUTJkMnFBZGhu?=
 =?utf-8?B?R3BOOUs5SnNBM2FzRUtqbGFiRzF0ZjRXb1JYRUdLY1dLMk1YYmRvVlpHaUdL?=
 =?utf-8?B?RThKWkFKMFU4di8veVlPRUVCcXc0TFJDTG1SWjl5UEdqT2JaUTkrdjRidzhD?=
 =?utf-8?B?SEVpWmgyNVBDSTNmRC8wbXVsTzRIc0tLRDZyVG9vbzBnU3RjYzc5a3RKeW4x?=
 =?utf-8?B?ODYvK1NFWnhhNUlaUHF4eURldjlpSE5OeGkycmtoY25jczM1Sm43OWV2VTJp?=
 =?utf-8?B?RmdQV3FONFA5OGs0d3RqL1kyczJ4RWMvZElUdlJtL2lxdXgrckU1QkVGYjhX?=
 =?utf-8?B?USt0YzFCS3pBQ01LanpIUHlLMnlLSjllSmxBdEdLcEFoa2U5cGJ1SDhZc3J1?=
 =?utf-8?B?Q3FKRnljZlQyZDFTb2lRMEhDUkMvZTZZei9CQmFKZlRIcVUvVHJFSWhwNHFE?=
 =?utf-8?B?VS8vRng3MVMxdWk5aVBaVEgrekJpQ2FOajZiNTZOWkdYaHE3YXFQZC83a0Q0?=
 =?utf-8?B?QVBEQ1VLdlByWEZXYUxnQkNpVlVmQ1ZvcWFLb2ZLU05pamRzbHZ4V1hEelJN?=
 =?utf-8?B?bFVKV1UxeE1IRU9ac1dKL2dCODgxNjJ5WXc4WU04NWxSQmgwUklJdGlGMFdY?=
 =?utf-8?B?cEt2bklkVlM0R1pURFFpdkdwcXRUc3Y4SUNNbHZZU0ZJKzVtSHlIOW9tSTdi?=
 =?utf-8?B?OE4zSEtKZkhucm02Q2ZpaXVGM3U1TEkrOWExVUJpRFZuQ1JORmF2YkhqWE1O?=
 =?utf-8?B?WGtOb3NCTHo2VUdROGhuTCtCZ1NSS21BdlczMTRPM2NYTTRTdythbmNqUzBX?=
 =?utf-8?Q?44f/n/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:42.5598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c3e247-96d4-4a3d-76b0-08ddca7606e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141

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
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index eb3e7dcd1068..8ab159969da6 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
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
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
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
@@ -714,7 +756,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     return rc;
 }
-REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
+REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
-- 
2.34.1


