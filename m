Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC04B1002E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055188.1423694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqv-0006iK-FV; Thu, 24 Jul 2025 05:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055188.1423694; Thu, 24 Jul 2025 05:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqv-0006d2-8A; Thu, 24 Jul 2025 05:50:49 +0000
Received: by outflank-mailman (input) for mailman id 1055188;
 Thu, 24 Jul 2025 05:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqt-00055h-Hu
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:47 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2408::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 252aa046-6852-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 07:50:46 +0200 (CEST)
Received: from SJ0PR03CA0149.namprd03.prod.outlook.com (2603:10b6:a03:33c::34)
 by LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 05:50:41 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::78) by SJ0PR03CA0149.outlook.office365.com
 (2603:10b6:a03:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 05:50:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:40 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:38 -0500
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
X-Inumbo-ID: 252aa046-6852-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lG1T3czJ+81+SqnWbW4wH6lI8jiL1misPj9mH84NXNy5aWYEK+iZpKFcfEgCdoDbvgGG0eegyJY1o/87Zf+qGRIeee7HofRiYsXiu7cw9uiBx+Lf0MHzEREm9LPmR4tjdFkuiZaHHr9ZuRoz5wmKPy0vmCX6+PhYxIQyMyiCu7qjxmwS60LcraiRvydzKW6HQhzU933vSYgQboWVsyPTy7RkDkIEKtfru7trzEv8A3p8ptJ62ZvmWwJwA80+ZMEYTuazKlo+rK3fpIlDz6DqS+u4DrrlQFn4H494Wqt0xQSj/x8Gegyt1nJLKYrvcZjhpFFaP974YgegwuYLY6/7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7MzME/bAXHVy0Gc3jqMywTJoNxD8eXiks1xG9iiOZU=;
 b=M/cysl9gyyFf8WKaJy0yyr0KWmyM6G7YT+Bv3lxIvRRJ1jujEq8xzXEx9H9KVie0mcXKa5fxs3q4/LsIHofVPKNsbrhnMR7IssX1sYw6shZA3U0YPz+kKWNFI51mr7+QlzSoxVFAI9N3v+aXrHwF/add1JB8LDvTo9omGWfyMQvInpdIzpCWiSUG/7D0H+M5NPMVdEndEegF9ONb8ctEck4y6M4z9bl0DGpJr+T1e9yBma1cTsY+jDBvUn9t2zLy/koNkLIuSb7JHZpInQQOhqUkKADiZh35OCrtQnW/vb9om7JA0I7H85VvWxFaesxmNSrhp7fgKhLpNEkLqky8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7MzME/bAXHVy0Gc3jqMywTJoNxD8eXiks1xG9iiOZU=;
 b=ScgMylihfBrfOOqrF4XQc2/gX0AglnjWhHZQX9aILIEWbt6QNCey4Rk6+mI/QbO/JaqWOFu6vvlQibj7FR037MSUdbeJGVXOE4gwleW1lH/4T6lH5bfHAWhKN0iGDmkvakj9RmXVvStheBmG8VwR6ohfXs3AgrqGusvzkPpZLjc=
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
Subject: [PATCH v8 7/8] vpci/msi: Free MSI resources when init_msi() fails
Date: Thu, 24 Jul 2025 13:50:05 +0800
Message-ID: <20250724055006.29843-8-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|LV5PR12MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b93298-fdc0-4aa7-df07-08ddca7605d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blM1MGNqb0YvQnd5eGtreit5ZGprTkdWRHN3Y2xnM3prSE9jTGJhRDFZMFBr?=
 =?utf-8?B?V212Zm5vNm82bEZyUnFpcTU2cVk2NDNGaWJabXQ1c1BlL0ZNcDh4czJ4Vy9U?=
 =?utf-8?B?cGlpQytzZnhSNjFXRE1YSTAzNUxrbXF1dVdMQkFJdDNqQUpsYmZhb2VrNUtx?=
 =?utf-8?B?c1drZkdGRzhrL3RTTnN1K0dLT0c3dFRsUlZrYnF5bEFsbGErZFIxRWZJSHBR?=
 =?utf-8?B?M25EY1RzNkJ0QTZ0KzhSR1VuSjV5N0tIV0xOTXlrTTlha0dTNVpvMUZhYVRX?=
 =?utf-8?B?V3N3M1R1QzRkSDVmQnB0S09Md045clNHSnAwRG9sRS9oWWtHaE41cWgwRGJo?=
 =?utf-8?B?OEE0K1RHdVl5eURDcGhoUmVrbEtNc01HQmRZR3dJS1M3bC8wT0toNWZHTzVj?=
 =?utf-8?B?R0JJeGtrcVJKR3hTbUtsTm94Mzlma3orY3JsRitCK09QZjV5aU8zSnF2VDJK?=
 =?utf-8?B?dUMvRXE0UTlOY0ZzK0IrY1Zzd3ZSY1Q2L1VqdGJSWENOYVBDTlZ4R2d0V2xu?=
 =?utf-8?B?dVVlSTBmb2E5Z1oxN1NlWlZtK0VKYk9qU3NtcUJnRE4wdWFNU1VzWXRrMHgy?=
 =?utf-8?B?a3g2S1FFWkloT2tWRmI3Y1N2QzBmajMrMDdoOTg5dG83aU4yaC9ycGNhYjhS?=
 =?utf-8?B?NDRFNzB1ejlkMTltK3NmNHlzTzBhTHllN0NDUGtLRTlOZXlIZlN4SVlKWWlB?=
 =?utf-8?B?TU9QbmVmbHVQOFcrcnYvRUs2dE4vcGxONmh3SmtTQTdNMXlqbkRXLzJIeTFW?=
 =?utf-8?B?SzNldGl2eWFmQmQ1TFp5UTA5bDZXbjQrbXpqY2FTeW1mMWZCektxVHV0WnBz?=
 =?utf-8?B?VzNEV2RKV1EraEtobXh5akJVZXhSRXU2L1htUUdMekMxSVN6ZE9XbUc0UW54?=
 =?utf-8?B?QUhILy9zZ3dZaldUYmRYcTRZYjNxSXBxbW5lNWhBaTczQVo3OWJXbE9CR1Zs?=
 =?utf-8?B?TTdBamIvb0dvMHZMRXlMa0ZmWThzdE1ZcTZXaXcxZ2c3R0dReTd2UWEzLzJ4?=
 =?utf-8?B?WkZkaXVoUmhoYXc3VHdwaWprQmw2SC9OWDBKRHhKQUQ0WlpvZ21nSVEyVW1o?=
 =?utf-8?B?L3hNbDU1aUphOE9qUDlZYmFYTEo0ZFBHWlhNQ2YxOVQ4NEFBeUlSdUhJcW5N?=
 =?utf-8?B?U1JPdkpXajNXQ290THRKc3phb1dvNjBhQ3RlTVg2dmNxekhrRFEyUThqTWsv?=
 =?utf-8?B?ZStYVE44UElZM3NJUTZoNS9TQURINTdWcGRlYkJuK2tMcFdGbTM3cjlZSit5?=
 =?utf-8?B?OGV2UU1EdWwyUXlGbkZaQi9EeDB4alVGZllCOXoyd05RK3g1WHUxcTNLQVJE?=
 =?utf-8?B?SzhuY09UbFBNd2ZGeHpkMW50LzVSUFhiakt6YmlNZlN4SU8wQmlpN0RVZ3k1?=
 =?utf-8?B?eUtOeEM2Y3VMK24xSktqL3lVdW9ESnh1d29UWlBVMTVIRGtrRWxRZnZGdGlz?=
 =?utf-8?B?elJzWmE0YUhxY05VYisxWmF1MHpzK3BCU3lPYnJkckxoQ1dPMUpwNHFocnZ0?=
 =?utf-8?B?OGFoSDFvRlEvTnV4SDZwRlViTEE5OVptMTFVZjhwQWF3K3VOL1pOd1BEOEdr?=
 =?utf-8?B?RjVDQUUrcmk5NlZpajdabHFkeFNheENXZElaNnJSMER2SS9LNVNCOTdCSVpt?=
 =?utf-8?B?d0t4T2p3SGRrbElLek9UQzFQckY2N3RlZmVJSG53aTBDRC9ZNE5RaVJiWUFp?=
 =?utf-8?B?S2V0K2h3MWIwcVd4eXJWcXgvd3ZnL0daUldOUVpGeWtpdzdBdG1SSmhwS0dj?=
 =?utf-8?B?NE9xVUQvMlU3N1ZreHBFdm1YRVpRTjJwYndscUlTcFZSQngxbTZJaE9nWHlG?=
 =?utf-8?B?V3hvN2d2aW5IU3RnQ2ZjdFE3SzBlYmFBbWhkVC94cllyUGlESHNWc3J5NnBY?=
 =?utf-8?B?TmtLdE9kNjFId3RSRGpTd3B6YUtEREc2cFFmUkI2eEU3MTEvbFVKcUJJdzEv?=
 =?utf-8?B?Qk5RK2RuNnk2b0tlUVVENWxHbVNIUHd2ZEIxZGFReE5YNU5pbktYZ3JtTmdZ?=
 =?utf-8?B?UHhDMUI1SGtNaG5INm9KWklDMXVWbnFMTnloTXRaRXhScGVjb20zZ3BHbHZr?=
 =?utf-8?Q?yRTGsW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:40.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b93298-fdc0-4aa7-df07-08ddca7605d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9754

When init_msi() fails, current logic return fail and free MSI-related
resources in vpci_deassign_device(). But the previous new changes will
hide MSI capability and return success, it can't reach
vpci_deassign_device() to remove resources if hiding success, so those
resources must be removed in cleanup function of MSI.

To do that, implement cleanup function for MSI.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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


