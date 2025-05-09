Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D511AB0E32
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979884.1366426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgS-000650-26; Fri, 09 May 2025 09:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979884.1366426; Fri, 09 May 2025 09:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgR-00062l-Tp; Fri, 09 May 2025 09:06:19 +0000
Received: by outflank-mailman (input) for mailman id 979884;
 Fri, 09 May 2025 09:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgR-0005aH-3Q
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd1782aa-2cb4-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 11:06:17 +0200 (CEST)
Received: from BYAPR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:c0::19)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 09:06:13 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::92) by BYAPR05CA0006.outlook.office365.com
 (2603:10b6:a03:c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Fri,
 9 May 2025 09:06:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:13 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:11 -0500
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
X-Inumbo-ID: dd1782aa-2cb4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2Www8yJ4WMsXQUU/jASbhYGgn7DgoaUVlpm+PYn0S/xtKJr1Z4Qt1fOXg068ZAhgSuEdGHaYEq/Jm2bF/Ckdn5dipHlreHI2Mp9f5KxTKzVr77oc+Y8Z4QWnOE7TfFoEUoV6Ih33nDNIOtC5BmcApgViisiN3jf+cmTCSSmZGZ1UxNZbk/mK9jhV6XElBjexkSXiMNbWbXNZC4VA+SrY00DXmeihdhKyFbWGECCFS8mpZEs8QTW1a1RcRkj7wiyWpMKz5XcmwlAS8p1wa6chzYR84nhrbkqvUg7dbGobPT1aQ1JMd/sC429pLkk5rXQZLayxD3OgZAkXRzoakkbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw2cLNMP7nhnjjRXLpH9cMEC0XjcDzuavgW2fNomNPA=;
 b=jx9Pjxr3OJUOKECmg6dgFnHBtjq4Mq5qGgjQFsx8BmzTk6Cu6uroLAbKS/BVKDr8PXw8eGV90hZBsq46UQsD8DiLAAI9AWw6u0vG5+xA2DLXnzYq3lx4vRuNM1N0KvY/iinVw41vpIPGsXlZ1iShpAeCPjT6By+0hD24aESODykmvSq+jvTQK9lnunLc0PjrQMzGyR3gGhUa/Pp/9gnL53oMFAhDRG857j6aXLzeNnWqzqmOe4zrGTv1KlMXyoR16rH0E3HVCid5vIGQrT31xXqZlqC6VqctBUG2iwQz753U5H0OW9aV3oFQYZO18GrsJYURuG6AH5kbidaEpqaRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw2cLNMP7nhnjjRXLpH9cMEC0XjcDzuavgW2fNomNPA=;
 b=Fp6rq3MO7vjLUlR/eCqzDNvRV6E+hCwMTQ42g/Pr5tiX33iJ6gKEym7CYUDA3rfjX+av2fW/fiY6vWYhnQiYi9OFk2U/1gTno3Mj0T/nMaaL38seQDj+Gem/2BvKHvsjMC0z+iyIdcXbewAZODs8Cli0CyMQ2sSW96Nb09ctSDk=
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
Subject: [PATCH v4 08/10] vpci/rebar: Remove registers when init_rebar() fails
Date: Fri, 9 May 2025 17:05:40 +0800
Message-ID: <20250509090542.2199676-9-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CYYPR12MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c988534-49de-418e-a206-08dd8ed8bf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE0xaVhGWUlDZnZUVXM1Z1lReHhTM29VMFFzdU1ZTTQ4M1psMFN1S1dRdnNK?=
 =?utf-8?B?OFcrMVJ1dGJ0UTdDdGJxOThVSU5ZWG1ZTVUyVHJtZmVKeHdQdzVQZzd6aFN0?=
 =?utf-8?B?VHBiMTVML08wMVZXVTMrWWdkZ1VZeDFaNG9Nai9lQU83dkFxd2RKNXdaOFFF?=
 =?utf-8?B?WWNSOGZzRmtVL1NNWUNJR1RQc3FhUDlIcFkwanJHY2h4enZNeS9XSDlaWE55?=
 =?utf-8?B?dFZyQ0MvaGwxU1NUK0tNb0xMYnlOcW9BVVZzRVlheUJuYy9EWkgzaE9YMmtL?=
 =?utf-8?B?bTNkTG1peFdTL3JyK2tXTkhMbWtoQ2NzWXZjUDd0US80YTdmakV3aVpqTjM3?=
 =?utf-8?B?OENVTFR4UHdBY0ZiRnBDaUtjcEFCK1kzLzBJY2tHOGgvZ0s5UmJzZTVtb2dr?=
 =?utf-8?B?YzJJZHkwbVZTbVNXb3A3WW84OUFSOXdxYlhWbmNXeWJNdnovL1U0S1VCY2Ey?=
 =?utf-8?B?eThCMWJjUFNITi83TzFuVFRGb0pGNU9nZ3BiOXR0aWpqQTdIQUVydEFZdU9O?=
 =?utf-8?B?ZXZ1MkxWM3BkZG5YTnZjOUVNeThxTDhOSjkyMzJNZEl6Vzk0eEhiYzJyLy8z?=
 =?utf-8?B?d25nbWcxTHJpYm54T25CY1BVRkQwdXQrdFhtRTIvTmUvRlZKWHhFeVlqajIx?=
 =?utf-8?B?YU5yNlpOYWhHWE5ZdklCUkVWY3ZhM1RqWVVtUTNoZ3Y4ZXIwbzYxV0hXS2ZM?=
 =?utf-8?B?SjJJcWd4NVI2YUM3cEk2dVphWjgxVVRkN3lEdWRrMk5ScFlWa0h2Uy85RFhx?=
 =?utf-8?B?Qk0zcWlFQVhVeUpIWHRHa1RtMS9MOFhlbDVBL2c5RVpqK1ZaTjBvSy9NNjNP?=
 =?utf-8?B?YUZzdzIzSkE4dHN2dWxHQ2pkeE1VM0JVWXZWbnNmcCszZjB6TFR2Ui94clNy?=
 =?utf-8?B?UnFWKzZ4QWFWQ056VHE2NVlqREIydkIyUDV1dkhNcmxrSkpMNXNQa3d4SjBl?=
 =?utf-8?B?VVNHZUFVdkJrQ1RiOW9yOHYwczBORjdETlUzM3N4T0xSSkM5WEVnMWFrNm5U?=
 =?utf-8?B?NEZleFc4cnd0TXBIcnNDd1BoK1NLOHRMdVlpSDlrS1I0bjFRUzcySVlHNDZh?=
 =?utf-8?B?Z3phTXl5QTkrQ24wSVNnblovYUNZaEpCdE1lTUpZbnFOb1ZwNDQ1ZEZlZkQv?=
 =?utf-8?B?WkFvWUdxaW4rS1pncHlRV2tYOVk1Q2s0K1ZCT1cyNFJJRUFMRXh1L041OEVC?=
 =?utf-8?B?bXlYeW5sRWp2a3JKaFlHckM3cUdTKytsckJteEluM1J2NXl2RWxnR1lSUnNT?=
 =?utf-8?B?YXIzMGUvL001a1BkK3FaMnJ3NmVVUFdwWTNDY2ljTm9GTlRYOEZhZGZUVXN4?=
 =?utf-8?B?VURYZm5ZU01iSHpNK0tPSHRaU0l3TTNLK3RlaFQ4UW83MlBkaFFDUHJNNUhL?=
 =?utf-8?B?aEhURE5nUVNXbUlYa1FQVDRvMXhRV2NPc3J1d2tpanFLVkU4Zlp2bE9HMEFu?=
 =?utf-8?B?R2dYYnRDb1FSUHBYMjdKai94MHFleVIvajh6RHVXYS84S2MwOGkyZVpEZzNo?=
 =?utf-8?B?U2NLQk1TVkdtK3phZlVwblUrMk0xRThkU0UvRVh2TDErYVdocGNneGJFVXIy?=
 =?utf-8?B?VDQxTVpFbUtqV1hvTVhHY2FqZnBKSjNOOWd0NE5oMnFVUDZscHA3T29ZbWpm?=
 =?utf-8?B?UTJUWmc1c09QWFZHRXUxM3RYbnZneEduMEJPbHJ0d3RWTUhFYS9SZXZmM1pF?=
 =?utf-8?B?eFBXajZld2h4SVFpN0Zjd0dPdnhyQlFmajVjVFVIclVFOFBJUkJZQzhFK1Z4?=
 =?utf-8?B?dHZEZUtlSDNuVXBQdW9pbzlRT3BjbHVZQThNWUlLazFsV0Q5V0dHNkNCUnZh?=
 =?utf-8?B?RDRyMUVNaWcyeTZHTStFaFNXbEl3TlBReXZvbU4xSnBMYk5hdVI5OXQ4NTNo?=
 =?utf-8?B?T01JNG1pU2VSU2owNVRiMjZaM0x5NGxKL1F2czdzUHN3M0MyK3RUejFLSW1X?=
 =?utf-8?B?VU5RMVc3cjZsTnIxczkrWjdQRVBndmhsRlljcWVLQjZYYnIyQ1VQbE45Nktl?=
 =?utf-8?B?NXhnek5xUzNON01hVmFhN1VFSmM2ekduRXBVM2IwY3VkcGthajNIUC95eHA2?=
 =?utf-8?Q?bgQ61C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:13.3104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c988534-49de-418e-a206-08dd8ed8bf90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870

When init_rebar() fails, the previous new changes will hide Rebar
capability, it can't rely on vpci_deassign_device() to remove all
Rebar related registers anymore, those registers must be removed
in cleanup function of Rebar.

To do that, call vpci_remove_registers() to remove all possible
registered registers.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v3->v4 changes:
* Change function name from fini_rebar() to cleanup_rebar().
* Change the error number to be E2BIG and ENXIO in init_rebar().

v2->v3 changes:
* Use fini_rebar() to remove all register instead of in the failure path of init_rebar();

v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/rebar.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 026f8f7972d9..d2d8a8915afb 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static void cleanup_rebar(struct pci_dev *pdev)
+{
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                          PCI_REBAR_CTRL(nbars - 1));
+}
+
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
     uint32_t ctrl;
@@ -80,7 +100,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -E2BIG;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,7 +108,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -ENXIO;
         }
 
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
@@ -97,14 +117,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
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
@@ -118,7 +131,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


