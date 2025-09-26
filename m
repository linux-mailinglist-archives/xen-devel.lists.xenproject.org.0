Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B2BA2DB1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131215.1470408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23EA-0004Yo-If; Fri, 26 Sep 2025 07:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131215.1470408; Fri, 26 Sep 2025 07:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23EA-0004RR-E0; Fri, 26 Sep 2025 07:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1131215;
 Fri, 26 Sep 2025 07:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOXT=4F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v23E9-0004PV-Bt
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:50:49 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82df3347-9aad-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 09:50:47 +0200 (CEST)
Received: from CH2PR05CA0031.namprd05.prod.outlook.com (2603:10b6:610::44) by
 DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Fri, 26 Sep 2025 07:50:42 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::15) by CH2PR05CA0031.outlook.office365.com
 (2603:10b6:610::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.4 via Frontend Transport; Fri,
 26 Sep 2025 07:50:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 07:50:42 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 00:50:40 -0700
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
X-Inumbo-ID: 82df3347-9aad-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxUIvesYJ7WINpQTTE3gdfDsN61h1JpgpMdEwYlMhMUuCOqHhyIwOtiWItYoYtjDcwQ5P5WRSfk8LcaCtIZYmQcpLvOV08KbaQGFlDTuZAyaxKFZNmf68WjA5XFN4WHmETLKANzRFYdQF1npD7l3IaigNwMNdbYLwiRKWZqs2ZjX/DVUXF1f2zuCj8KyHYb4kt8m2SdPwMy7Nsvl6NQ026fAwJp8XGOc4Y/+iQXBDgwI6BCrXF/f7Lw/4CJD/6dkMVjgduGwMMHkWal7SxCM1Gh02tri2IPE/YSnTpuFQUYYC+NKqrTFxf8/+3XfGZ6iOoz9hGCigamCYMI7PYvT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4ll3zGyqnoS22DY6zoekAmF0Bra4jeTbZ+pxTmziEM=;
 b=r0jZ8PXzeO3EOMtOruWZMdbLj4+GVIywbb96zz3I+tvg0qZBpLZbVe54RazYLkWHpz1ghDTZc73N8FkrbJpTmqiEjxW+bEiDQu7OhgT+N617axPMT5zX22tJnLLi5BcQHMHUwHt2Y+sd/nuUNeW0kERnqD4yasnMfGXAhYh42pagol4blr5m4Vn8ASYPujoxnIksWNCLQPgRgFhS+/nkAsYc2l++oivDLrdbUAs/BOnO8jNqbyu1Kw0zfmswbmb6vh0OIVqxqhmmD0thH+XcHPdi1IZJ8dcyXbTMB4fWc0jwPeyGO+y3oMV45n4xLixVIPgXLAIQclg0+8qbob7cag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4ll3zGyqnoS22DY6zoekAmF0Bra4jeTbZ+pxTmziEM=;
 b=xyot2SmJjJUMbpbA5KD2T6K+Vk3eCIFyHu+n8XjviNJn/cU53V7Ry/ffVQ53tH/Syt4L/bX0FQJM2eBnyKJaPIl9E+xPcDxIIYqHfsc63thlrB28WUH+I+MNhpopgnjdTZWVTYbrrEAo4oeZ2QgHn5ZJHc5to/TMgr9aRagNzLE=
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
Subject: [PATCH v12 2/3] vpci/msi: Implement cleanup function for MSI
Date: Fri, 26 Sep 2025 15:50:20 +0800
Message-ID: <20250926075021.27967-3-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2d4d50-4def-4740-018b-08ddfcd164d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXNGZnNpSzloQkwzK2xjcEhjdFNvZy9NY0ZzTzR3U0xPMS9ndmdxOUdlNFd1?=
 =?utf-8?B?YkZweTdjSHFib2FaR2VaNkFkbE55QXFzaXdKV1RFUVNmVE5lVkJoQm9OUGtJ?=
 =?utf-8?B?SnhPbVNxakpweGhESkswZnhBWG5xRkdhbFlrN3c1Q0c4OWV2VHM1N1lHWFFL?=
 =?utf-8?B?MFVLcWY5K21aZENCYVVqc2lVWGJ6MGpicDliV1dabktjTFFJSmt2eUtTQkdN?=
 =?utf-8?B?M2pHTit1K2ZXTE51Q1Q4YVJEOUZQdlhEdHgxdC9lczNzeTNvUEJZdnV4Vm9p?=
 =?utf-8?B?bDY2VWIzbmVuWFd3bmhXUThKL29NZ21jQkRISkhLVWlCdTZ1RFNrQnlTRlpv?=
 =?utf-8?B?TGYycFlUNnUxekVhd0NZdEFrblMzU01XOGFzKzF0Z2k5TVQzaXVuSkk4Rk1i?=
 =?utf-8?B?TS90WktGLzhvY3VQUlUvZW43NHlOV2JseUFqVmt0SUpnYStzbVZpVGk5dXQ5?=
 =?utf-8?B?S0dSSGJtMUgvZ0dscmRRNUk2TU9aWW5BSVdWWWNsL0N2RjlSRUMwcDhsWGhO?=
 =?utf-8?B?aHpHaGJsa2VHVkhHNWVPcFpuVGFCbDJKUGRwRWJ0dXlMVGdtUlRFV1pNbjAw?=
 =?utf-8?B?VDFlQlJBVTVWOEJBc3BQdThRTHFVakh4UmUrYkUwQzZaRmpCMDVsWXcrR1RB?=
 =?utf-8?B?NHhITFUyYTZoa09LajlpaXlVRHFyRDRJWEJwWWpIUG45Wm8wMWliU1JQdFM3?=
 =?utf-8?B?Vmk1WEFZK1ZKTHF1WE1MeWk1eWRGdXRPcVJjNmFrOU40cExsb3d4Rjh5NEVF?=
 =?utf-8?B?WEYxVXFGVUJuWlFpUWRuVW10S20vd2xCN010YmRnVGMzUHhES1AzbU5VaWJZ?=
 =?utf-8?B?Ri85V1YvaEkvUjRwaWZ3dDlDUmFHUmJKZ0lIR2FYbzl3bTRYbzBmbGRqNXVl?=
 =?utf-8?B?Y0pSaGZPbVVVb0szaFl2aEJZQkVsNGFwN1BrODVMSDVUSVBCZTNRSG5iei9R?=
 =?utf-8?B?ZGV3a3pIRGUwRzR6SGNpenFVR1p4RGZLNENVU1VLOVJaejM0Y21EeEFSZUZP?=
 =?utf-8?B?aGJzc0J6dlBEckttQ0RLQWIwNVdycFkvZjVTUFNFZWNKeW5aMWV6K3BVd2FV?=
 =?utf-8?B?Qytaa1FuNklhdFpoTWJOMUhpYzN0QS9HN1ZBU0R3eXNNRHVPcWpwSjRuUWZR?=
 =?utf-8?B?Q0hPa2wrZzFkMXlqQ0dWbVRXbXNmYy9uanA3Zkp0alpzRkRVZmF6cUtvUWhW?=
 =?utf-8?B?akhqZFNERFlWWk5paytndnBlUFJKNlpyWHFTRDZVeVpTZVpsRlVETHJHYXE1?=
 =?utf-8?B?QThtVDhIajdjTjBjT21SSXFLY3NlNHZobWJTdXJaaGdzYVNYZXM1b3pWUkFD?=
 =?utf-8?B?Y3o5NEk1WTBGYTFBRm5iL3NXakpZS0pTT0tGVzdWQ1JyNHdJZDNtTnhLTU9x?=
 =?utf-8?B?MGZHRDM3VU9nT0tJMGlVdjJSZURJSVpXdHBOUzJwVDJrbkIwSWpJaWZHZDd6?=
 =?utf-8?B?VUV1LzVPZ1FxM243RUw0OWxvUDU3YWpQNjAxcXpJZmplaUkxdWVHeDA3RWpR?=
 =?utf-8?B?N3Jia2FYdkQ0VVoxWlBxWXF0K2JUQThVcVhVSklxaVNmR3YyVGhBNTViUExk?=
 =?utf-8?B?aHM3dzU2NGhESm1Pd1ZjTXFWWEU5MXpHcy9pNmpCOEpwQkkyYm1idWZ1VjE3?=
 =?utf-8?B?N2JqNUpIdmd5a1BaYXR2RUlycHpCOUhTMnpxM0lhMnUxVklBK1hOZWtyaXA3?=
 =?utf-8?B?dlU1Vy9YV2Z2THNxT1JNendyWEdUd0F0OTN4TzhTckMwQzVvV2t1dlh5L3pr?=
 =?utf-8?B?OU9NV0p5MitYTFVyd2ZZWDhYVjliSi9LVGRHV3M4TndYeVhnc0U4NENlT05S?=
 =?utf-8?B?eloyam1iUlA5RkRkbjBmdXB4N0wzR2M1QVFlNEhZV1MzbXBIWUFOcWZ6bitC?=
 =?utf-8?B?Q1ZNV20ycTd2MXRpbDRoaUdiRE9iT3pMcGNSWGFiemk5eW54NzFNb0x0UGNB?=
 =?utf-8?B?dDkzRXFQQUFyTHgrdzQ5REcybGNEdFd5TVg5TVFnYXlPckEvcHJhbFh0bGR6?=
 =?utf-8?B?Kzlid283Szl0aGFteDRsajNKMHh2cXQzV21wV1lPRlFsSUxRckIwSitDUDVJ?=
 =?utf-8?B?dFRzN2pBV3ZwSXFTUGIxT3l3azJQYmhLYU91R2RkN1JONXpla1oxc1FJVWlZ?=
 =?utf-8?Q?Y7dw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:50:42.5392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2d4d50-4def-4740-018b-08ddfcd164d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170

When MSI initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement MSI cleanup hook that will be called to
cleanup MSI related handlers and free it's associated data when
initialization fails.

Since cleanup function of MSI is implemented, delete the open-code
in vpci_deassign_device().

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v11->v12 changes:
* In cleanup_msi(), move "if ( !hide )" above vpci_remove_registers()
  since deassign device will do removing registers itself.
* Read address64 and mask info from hardware since they are not reliable
  when init_msi fails.

v10->v11 changes:
* Add hide paratemer to cleanup_msi().
* Check hide, if false return directly instead of letting ctrl RO.
* Delete xfree(pdev->vpci->msi); in vpci_deassign_device().
* Remove Roger's Reviewed-by since patch change.

v9->v10 changes:
No.

v8->v9 changes:
* Add Roger's Reviewed-by.

v7->v8 changes:
* Add a comment to describe why "-2" in cleanup_msi().
* Given the code in vpci_remove_registers() an error in the removal of
  registers would likely imply memory corruption, at which point it's
  best to fully disable the device. So, Rollback the last two modifications of v7.

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
 xen/drivers/vpci/msi.c  | 55 ++++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c |  1 -
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index c3eba4e14870..181ec902dffb 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,59 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    unsigned int end;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+    const unsigned int ctrl = msi_control_reg(msi_pos);
+
+    if ( !hide )
+    {
+        XFREE(vpci->msi);
+        return 0;
+    }
+
+    if ( vpci->msi )
+    {
+        uint16_t control = pci_conf_read16(pdev->sbdf, ctrl);
+        bool address64 = is_64bit_address(control);
+
+        if ( is_mask_bit_support(control) )
+            end = msi_pending_bits_reg(msi_pos, address64);
+        else
+            /*
+            * "-2" here is to cut the reserved 2 bytes of Message Data when
+            * there is no masking support.
+            */
+            end = msi_mask_bits_reg(msi_pos, address64) - 2;
+
+        rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
+                pdev->domain, &pdev->sbdf, rc);
+            ASSERT_UNREACHABLE();
+            return rc;
+        }
+
+        XFREE(vpci->msi);
+    }
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
@@ -270,7 +323,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 07c7071d0a17..7aaf015f63d4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -368,7 +368,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
 
     xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
-- 
2.34.1


