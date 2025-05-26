Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FABBAC3D32
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997350.1378308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPo-0005r6-Pu; Mon, 26 May 2025 09:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997350.1378308; Mon, 26 May 2025 09:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPo-0005ms-Ke; Mon, 26 May 2025 09:46:40 +0000
Received: by outflank-mailman (input) for mailman id 997350;
 Mon, 26 May 2025 09:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPm-0003hH-48
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:38 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2407::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5074f9b2-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:37 +0200 (CEST)
Received: from MN2PR13CA0028.namprd13.prod.outlook.com (2603:10b6:208:160::41)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Mon, 26 May
 2025 09:46:32 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:160:cafe::c) by MN2PR13CA0028.outlook.office365.com
 (2603:10b6:208:160::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Mon,
 26 May 2025 09:46:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:31 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:30 -0500
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
X-Inumbo-ID: 5074f9b2-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ikcbm6HD4qH2L/2d2H/bs2mbVHQHqBqSomNiMa0xrMUwtQ9Fpwrd1O5HBvxJpK/e4B9k207vuiMHdMsAhisqqCqw34gKEj48igtx9ZgnhfBoJCNCejYJhlRqtuVNHrhuLOLK7IUCfosVf6Md++PwgsGwJiE01By/3NN7uL9EhC67qZ6+oOGLZEXshxraHBR+btZbLd4WOUrxW6fAog3fBjbb41v1Ykq6ipZtoQMsIAQhJTcv3r9BKdR6LHqk8qz6Bd8Ozmc2q8ONpMS7cTt+kmw5pYqnsmNTwLRQW2msGG+8zLrHlvxVX7haqvUWXiTOJXPNqSeeZ2JFRfua6C84oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd0GbwbRrEi2YvKEmsoXyPAhLSxsOxC7xEEZ+gZkL0U=;
 b=F4pwAjSxYDA0Vz/kwj/WR+cvsAHb/isYncvU/cVz546pkb6udP1btDSyUmnYP/xM1Gxo7Uhklv/4nOlSWwfVS5o/5bx8CAigdkzobbard50CaEFcF9a1iIeBYi5PjJkyVMqU6+Z+X12TjcRdaXpAiTwqc38p8ELCR/JCvMdEaA8AArMNibdmeFdJkA1z9L+vjWgh+dhuMRgee4YybQkcPd3bbJlXuD0hQoqUlOpfaZJsJDFBYE4yLKxf5GVhgrpw9ALXiGNo7OiiJXYDviZZq0jYw/sMCsV4OXOVe3ejc3rCL1MJpWaOI45SVbjACscNprlm4XrC5JZiINLsThMyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd0GbwbRrEi2YvKEmsoXyPAhLSxsOxC7xEEZ+gZkL0U=;
 b=RwCt7JSIapsW4Kdmhj4iZAEAPD+vuIAD5PHcEGEdR0iP071zx7YtpwPKO4hz4ssKWRHOP3NoaEMAQSERRK9jmAfblgJMslu31/KG8zfnggVeeNUns3xl+N3vAFZqHak6WID6rLbKhKm40X1JJ2TN/lz8lsR3aLF1QV0Y5tRleT4=
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
Subject: [PATCH v5 08/10] vpci/rebar: Free Rebar resources when init_rebar() fails
Date: Mon, 26 May 2025 17:45:57 +0800
Message-ID: <20250526094559.140423-9-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 1362b4e4-b37d-4666-54e6-08dd9c3a321f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFV5aU5HcEtiWjFEQ0RSM2VrU29iSjM4U055VjM4SWpCU0JMbFVCRU9RL3lv?=
 =?utf-8?B?eGVsOVVJVDdmU3VRb1IwMkh6cGM0TSt6dGFaQU5FZ1F2UVVYZ3VlOFlNNDZT?=
 =?utf-8?B?OEZnRUZtZm44Z3JWY1h3cWgyVHJiL3hyN2xOTFByN0FtUi9Hb045WS9EQUl2?=
 =?utf-8?B?ZFdyUVZSMzBoUnBrekQwSjNmQnVGdGkvdjNhR0F2UXIrMHowZ05jQWh1VlhQ?=
 =?utf-8?B?N0tTWTljZHd4UjR2RHpabUdGVmcxRHZ0TXZXdFhzMnNuUGprVm5kOXBMR2M4?=
 =?utf-8?B?NWxac1hDaVFjVUlCUWNPa3A0WG9xRTFTNEhTWHJNeHRWSzh4TW5wVnBDTUtZ?=
 =?utf-8?B?OEY3UDF1NTRHZzZPV290RTR5Nk5pVGhiWnZWd2ZhRjc3NUNsd2owcU84SGE3?=
 =?utf-8?B?a1prZk1ISjlXRkFFOVJiYXNobVNxcUR3U0VjcVlVbkVpQ0x1UHVNNlRscmN0?=
 =?utf-8?B?TTk4UE1YWDN5QmZoNWZhTnQ4bitZSXJZU0p0bUpyb3VzS0w1Q2J3OS9MUnFG?=
 =?utf-8?B?RkpOdmdCQUo3alAxaGwwWTh6ZHhLOVI5TmpHMG9LR1ErcWxIT0VJaWdSZUF1?=
 =?utf-8?B?NGRxTEpQakgzWW8wS2VQeTdXOGRuNHVKOEJkL1R1NUpOdVJYNGFOWFBHOXBC?=
 =?utf-8?B?cysvd1Z5cFJqOFVmUzFUWUhld0k3SHNyb1BldWVIOWdjVkdCN25WazllMzdH?=
 =?utf-8?B?M2hDOFFOYXBqNUlWQnZadTFjN2FVNHI2V1JSWmFBRUl6VTVzb0RFa01na2lB?=
 =?utf-8?B?YTVGSGt0ZHhyN0lpUW8zdllKRWFXL2tKQ2hZdUJOa0lzOXNwN2dmRG9mUHJR?=
 =?utf-8?B?aCtMRFUxampNNDBTVmdpb05ob2JzcUU0aWVWanZYbVhhN3JSWkowUHoweVZk?=
 =?utf-8?B?b3JEbml0bjNpNjZCb2dPSVN5YzFsdmhuOUhKREQzR0x6TEplNXlkNEZKczdW?=
 =?utf-8?B?ZWFpeTBCTWtKaEFjeDZVSVVXZ0UzZVd3eEZYN1JmNTZJbHZyeDNYMENwbHk2?=
 =?utf-8?B?NDhXQ000akpjTjZ2Mjg0RVFnQ3VhbUxrNDhxelNRNk5zOThzc1hxWmpBQk1P?=
 =?utf-8?B?NXRwOTE0UlFTVmhHKzI3ekhLaEUveDRRQ0ZMVVNNbTIzZWtRQjd5UTNWbDZV?=
 =?utf-8?B?M09xNkdzenJEak9VV1VHVTRjT0h3RDhsanJURDlKMUpXNTMzK1I1V0IyUzlE?=
 =?utf-8?B?RmM5ZTVBNjJaSWpnMVZaVWJoUmQxdDdMeEtTZUVQbGgyOGI5eHZnSGQvbE5l?=
 =?utf-8?B?cDROSWV0czZXMmtLa0g5YTdCd2U3RVFRR0Jod0hJb3l5STZNeVpvTGtCRmta?=
 =?utf-8?B?QitLTGllSEM0WmhNMFhtYlhsK3BOZ2ptTmxMMjc2eDU5bUlDOCtjMytKeGNo?=
 =?utf-8?B?SENQN2tFa0dNanFtWlg1dWllMU1zcmZxSWtNVW56NlNXQWsyR3BGOFN3Umdq?=
 =?utf-8?B?WUdoWDd0dzBhWDA0TkRmNWUvTktDQy9XeHRuTGxrMmhXMDVLMlo3N3VuWGZv?=
 =?utf-8?B?NnNSK24wSHN6dDZsRGFLT3lVL3NhbFhPb0I2SHdncjkyZjhVZGRvYXhKdEcz?=
 =?utf-8?B?ZEZUOTNKSkJtRTU5WCtWNEVKM212M2MvTzkwb2JldkszM0Y2cW1nLzBJaENM?=
 =?utf-8?B?U21BRno5Zmpxazd4Ylg1em96UzdyUWtzUURVKzgwWHg1aG5hY0dEaEp2VEJv?=
 =?utf-8?B?dDdlamhsS1lRakYram1BZlJWWkw0VzJwMjZNUU5QTU5DZ2NwdjV4Q2dqQURB?=
 =?utf-8?B?Ui85Y2ZUSzJKSEE3Zk1DYzNxT2hkcjhVNUxvUFRGbWwyMUVwS084M2RDV2Iz?=
 =?utf-8?B?dGptV2VWb0JyYjFoQUd1azZGRU9PdjR4bjVQUEJnczRPOFVkNkt3NmVXbDNS?=
 =?utf-8?B?MkxNUDY3aXUzcnZrV0dpQ3dVaXA1QWdtem8yUnlrR1BDL1dDbEMweER3NWQ3?=
 =?utf-8?B?bGZJdHpvcFR1NnZWWk5VVWhSY0JYVEdZdVFiMW9uOVdnaVpnZm54bEFWVElz?=
 =?utf-8?B?SUI2dHk5QkJ6WjU5VENRd01LcjBEN1RlQW9uSnZIeUN5b1VSdnV3cjV1RmpX?=
 =?utf-8?Q?yqM9Vr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:31.8988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1362b4e4-b37d-4666-54e6-08dd9c3a321f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427

When init_rebar() fails, current logic return fail and free Rebar-related
resources in vpci_deassign_device(). But the previous new changes will
hide Rebar capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of Rebar.

To do that, implement cleanup function for Rebar.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v4->v5 changes:
* Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar" since cleanup hook is changed to be int.

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
index 9cafd80ca2c9..4b1892fab3d6 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static int cf_check cleanup_rebar(struct pci_dev *pdev)
+{
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
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    return vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                                 PCI_REBAR_CTRL(nbars - 1));
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
-REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


