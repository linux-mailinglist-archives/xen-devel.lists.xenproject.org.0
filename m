Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7ADB1ACF3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 05:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069926.1433628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8gF-0001Ur-IX; Tue, 05 Aug 2025 03:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069926.1433628; Tue, 05 Aug 2025 03:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8gF-0001Sq-FU; Tue, 05 Aug 2025 03:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1069926;
 Tue, 05 Aug 2025 03:49:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSY8=2R=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uj8gD-0001CQ-Bo
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 03:49:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32df1ce2-71af-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 05:49:33 +0200 (CEST)
Received: from CH0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:610:77::20)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Tue, 5 Aug 2025 03:49:27 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::87) by CH0PR04CA0045.outlook.office365.com
 (2603:10b6:610:77::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 03:49:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 03:49:27 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 22:49:25 -0500
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
X-Inumbo-ID: 32df1ce2-71af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn9P8DC/Su/wPrQWoExA8mg3dE9GImfXIDRp8kvXaM/txLfy2C05pYCPNBV0nBHmbnraEkVWrQk6CeAjEPyO/vDbzd3ZVaq6XOhzMb3u5jr/w4kYya+0O8KgRWxT/T743RvHt9g8+NoPZJsTgHnT+FbjLQ3xYTsLjDzChwHyrqFluGfx/nXiWP243rkLhxLpfl+BUZQhEAO8NwecuawjjdVg19VUuBOQBw5pbPnLr2STP0jAzZXcwYXNQgOdVCiXs2qaesJEZSzd0JPKtNnfeGeIW/8/UWrWU5n9fXq9lgXC0iYKW73xdXKkH4RhMJL0Se4eM9okYZ2xxEPDM+p8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEirtSDxahjpcMVfzlTj78FWKW2/EKvB4YH6q/kyPkk=;
 b=hn4xc0cPd4HKsYlYGOd1X69Lul21HzNdAZ2IJHAO0kyTBiVmmjgMpg5UO760nDnSRxNfHaaXCAYXPICDP1kO8RluS2aPxrCSMsQQnLZ67AP7lfxT+XOaNbaABHc5qxkKLoh69/rxc9zU4hIQCzJvxetZJ5Z7FP3E4H3jkLnE3orO+abZyUwWoGnme4RF2jiIBr+yE53JuarTya2gD79ayQlxSCTUYGd/+rD3g1iyfeXOYGRi7Fhfi/SyjbV3Is8b1MV1+VQnDoKSpFuqdB4xTs4G8PxJnT8YHbnKbv/dDCsfXPEHOjs2CW7lFXTMYs11EyXnFWylB9JglnMigcBUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEirtSDxahjpcMVfzlTj78FWKW2/EKvB4YH6q/kyPkk=;
 b=mRitk0BEau4Qm8BE5ALP2o2vdOOI4zG8YfZi4iWp92Oyn0QpjDfXZe6NOQXbuQqyIfENyLYhUVNLh6q2iSkdNCOG647m7zuuhu7cTue0P/xNpH5h2YfrEO6zDSH901vB67j6e1m6DV0fk3io6NGrSAIA36qbzKRexB38yuzQ30U=
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
Subject: [PATCH v10 3/4] vpci/msi: Free MSI resources when init_msi() fails
Date: Tue, 5 Aug 2025 11:49:05 +0800
Message-ID: <20250805034906.1014212-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4f2d3b-4709-4791-56f5-08ddd3d3138c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJud2xVNzJOdVV5OEpXcW1WVXExN2VyUnR3U1I3Rm5wblNhVmRjbTZrc3lK?=
 =?utf-8?B?dXYwckhEYWNjZ05OTzMrMFVLSVkySjQ0dmlrSHhSNEhkOEdEZkhsTUFSN0Mx?=
 =?utf-8?B?Ky9zdk9qUkEyTURMcWRxUjNKSFhxSjVFUlNaN2dxSThzbkVkekhGMC84dTMy?=
 =?utf-8?B?Y0pnVWd6UTRRWFljcHA5bWJaQVBLS0RlNUZFMGc4YU5xZ1FOOWtqL0FVbnVJ?=
 =?utf-8?B?dWVTYmFpemdjU1l2L01MRndlT0Q5TmZFMkxyYWt5bjk0TG5TYkpma3RrcjlS?=
 =?utf-8?B?NXpHVGsvWUt2a25mVUNXdmpaYi9yYmJNQU5NTXZSK0JYT20zQkppa1RNUEJF?=
 =?utf-8?B?b1hlZlRCem4zOWkvUGlvVnc1WWZrUWRSMkM2NERWQ0l4RWlDVmlqS3F1bnFX?=
 =?utf-8?B?VmMzYzh6YjBFeHlsUmh5c3Nha1RsRE9nSnVYbTh3a1BIVVhaSy82ZEJLdmVi?=
 =?utf-8?B?VjB4bWZYUmREa0tVY2QrZmNiRDZ0VGtRakdtTS9LVGx0UjRpRlFad0JxTm5z?=
 =?utf-8?B?R2RCK2dRMmd6WTM4TFNKMjJQejhwbVRYcGVPSzY0dUl2eHVBQUV2MVBUbWZk?=
 =?utf-8?B?NWlhei9Pek5BZ2JQei90ekRHS29USGhpa1FRK3Vpa1JzK3IwWXpzQ0V4SVNB?=
 =?utf-8?B?SDdLZkZZUnlmVVo0a01ta3crSnN5alA4b2pEeEhsa2xIU2ZaaHdaMWRTdDBH?=
 =?utf-8?B?WGhqUm52UXFXb2R4bkVrYXhkNGZ6QlBRWGN4RURsd1Z5WkpUN3pQMDNsaVQv?=
 =?utf-8?B?T3UzMWkxam5ld3lobUVucHhjNEhiNEd6cWN6NWN4c0owbFhLQlhTMG1vUlM1?=
 =?utf-8?B?VnJOWkRkSUlJdDVOeHdsakRNS0FIWnRva1ZVTkpKQVdYbHJGRVFhNWV1VzJH?=
 =?utf-8?B?eEtQdkVGWEtzWjJySGNrRFd3OGxLbU1FcjJjU254UlMrTithNSs4bUczcERE?=
 =?utf-8?B?Y3M5d0JlbzVKZ3M3Mkw3cC9uc0JIaTYxWnY0b0VYU3ZjTmFJVDZqVVlYS2sv?=
 =?utf-8?B?am8yKzdxbVk2bjRzZTV4S3kvWHJUS3BQbTI5VXhJSXR0WnlYdFFDWStIeGpl?=
 =?utf-8?B?SmNibEhBRU9LTGFwdmZmb0VROTBnNkc2SnRjeGtLS3oycWpkV3JydFc4U0xl?=
 =?utf-8?B?Q0d4OUVMa083VDl2UThtRm9RZW1nVG5Pa1JJTDV3blYzMXdsWWlVTk5iM3Ir?=
 =?utf-8?B?a1FiTHRMc3VEekorOTZqQldCRjMxam1QendINnkraVJCR0s5eU1sMUJOcS9I?=
 =?utf-8?B?ZkhmL1lwWWxLNW9BWUpSNDRPa2g3N1lHWStqY0o2am4rZjJ1azRJbWUveHlN?=
 =?utf-8?B?UDlMa1duMHorNVJ1QlFVVkVacGhqcDZuU1UvRjNFTVIwSllqNmt0cW9TWE9B?=
 =?utf-8?B?QkNMYlZad21mUGlFRTRqOHR2bDlFN0RuSnlPV3lKdmFIN3pjQ21nQTVHN295?=
 =?utf-8?B?RHlJNzVJL1pPcHMvenFFTVd1TXYzMUw0YlV5NVFFei9lTC9RTHp3VUtxcm5T?=
 =?utf-8?B?c25LVEVkeHhHVWhtSEEwTW5LWW1NWTRHS1IrM3pwSHplWmZYeEttYTE4dFgr?=
 =?utf-8?B?MlphMW9HeUZ5TUtzOVg3WTV4OC8vdnU3a3FveVkxMjFpdzZ2a251NTdub0Fh?=
 =?utf-8?B?b2hJMGNxOFMwYVEzRm0zWG9uTWpGMzhudW56VXF5d3lUVmN6enhUVkcwMHNw?=
 =?utf-8?B?eEg2emdjQ2Jka05vdytjMS82dmdSYXZDVmZ2a2tpSzR6bnlnOWt4Szd5Z1J2?=
 =?utf-8?B?ZkpZVWhpckFFREdON3NkNzBsTm1pZm4rT08wSUVaTzg0Yjh5MzBJSnptUk83?=
 =?utf-8?B?VmdYKzhxajJpR0FXaWRwcTJWbVdyaWQvM3NDK1p4OTB2U2t0NjJDa1diWGsy?=
 =?utf-8?B?WWFSenBUQURYY21hTzY2bU50MVk2VEhqTkoxaEFOVzlMTHJCdjJTMGJDdk50?=
 =?utf-8?B?UHRCRVlPWEV0cDBMSjhWMjB5UXd1aGFmbHhjRCtWNmViUEkwRnlhc1AzT2ZE?=
 =?utf-8?B?VmNaTSs1bVBsUWFaeC9TRG5TeEttVGZ6WWlRWFVkdmZMMUlaTFhoaGtJaUow?=
 =?utf-8?Q?fe+zrT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:49:27.5447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4f2d3b-4709-4791-56f5-08ddd3d3138c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344

When init_msi() fails, current logic return fail and free MSI-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSI capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSI.

To do that, implement cleanup function for MSI.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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
 xen/drivers/vpci/msi.c | 46 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index c3eba4e14870..ad5138c4cb5e 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,50 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(const struct pci_dev *pdev)
+{
+    int rc;
+    unsigned int end;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+    const unsigned int ctrl = msi_control_reg(msi_pos);
+
+    if ( !msi_pos || !vpci->msi )
+        return 0;
+
+    if ( vpci->msi->masking )
+        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
+    else
+        /*
+         * "-2" here is to cut the reserved 2 bytes of Message Data when
+         * there is no masking support.
+         */
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    XFREE(vpci->msi);
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
@@ -270,7 +314,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
-- 
2.34.1


