Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D434CB10036
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055183.1423660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqn-0005lS-Us; Thu, 24 Jul 2025 05:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055183.1423660; Thu, 24 Jul 2025 05:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqn-0005hh-P4; Thu, 24 Jul 2025 05:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1055183;
 Thu, 24 Jul 2025 05:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqm-0005TY-Jd
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061a.outbound.protection.outlook.com
 [2a01:111:f403:240a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f26c337-6852-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 07:50:38 +0200 (CEST)
Received: from SJ0PR03CA0125.namprd03.prod.outlook.com (2603:10b6:a03:33c::10)
 by BN7PPFA42F4F89B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6dd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 05:50:33 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7a) by SJ0PR03CA0125.outlook.office365.com
 (2603:10b6:a03:33c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 05:50:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:32 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:31 -0500
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
X-Inumbo-ID: 1f26c337-6852-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kw3+v54D72KAbxFeG4Rr/nmF00VAGPn8ZsVLkpGMA4JJOhM4X29KiEOK/WsW7quelYu5pKTaLIu/T4lT2ux+LpdcaP7gKuQ2B/LC8YOkOQxEwwBPTGgHmPek7/KIINAke7/KGKfbODG5gP+NHf2TPiSDoCxIWYZlfowFBw4ZqbuVUfWxvALGD9Dj0hVpNusH8oxzPgWuyfROsnEle2zjTsSRUQ+GmczA9ohVyWWsKPgOqjmk16yKclBqXPlfMMt2tKFFBrRJjhJd9f7AtkVTfTSL7llaJTQM3TMiMtjlNFB+0MMRF4cDtzvNDR4zZGrLqQsKTD9UcToNREyuqDcMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHDD2RH6qGFkqClTxz+9n3yFi4yX3htOodv0eou5I2Q=;
 b=ohZqArvy8NCJ9rOsFfwC7ETbXyKhFWUt6ddxIImfP6iNDUXnLveCyRWfO6q2yfNw4fT/hjSukdj7VbqS/Dihy5/U5pf/dJ5eeKCVmSTtJ3Lt9u6D1fu2y1u49P3Mi7nMxJIeVHTOG+To9l/Gj/M/HQ5yXesecOCz4gpmP3oEuKJDMvz0RJsDIjB//bWIlr3RI8cLy28iaGk31JarRikyOfP8UloIa8TJvKb5j+sRT1BUQ1x9AYek8ozQyOusi9izcuUq2DtVjn4vDDD5/QbwBb3/h4bBaXH4PRYmFoen+8ew0038KW2l+eY4WkHRPpNNdhSqrdvBrfgPo/Ga80vR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHDD2RH6qGFkqClTxz+9n3yFi4yX3htOodv0eou5I2Q=;
 b=lVe/LWPEMxatoQW2ocgCb2ash/nIsMujk+HZDOFCIH8ezfS7s/EZ8Zs2d5AlWR8glVpLEh9tXP9LCOxBV8+8whPNIc5EEDWLq0HGxXnOZHCK3QQTwA6Ya9b43gjuyp5Z/r2mG9LxxtnyO4G3XrQZ0vjhYVYQl99opzeRNcEfauM=
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
Subject: [PATCH v8 3/8] vpci: Hide legacy capability when it fails to initialize
Date: Thu, 24 Jul 2025 13:50:01 +0800
Message-ID: <20250724055006.29843-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: a470575d-f6a4-4785-b566-08ddca760100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDVTV3AvaVBuSkFHT0tKUEdERmxwNmtlTnozaENldmNreG0wdGxlOHBTcU85?=
 =?utf-8?B?YkhBNnlCM2h4ZU9hTHJ0SWhXVTMwOFV5K2dLcjl6VUJmSVNwM1pJbzRZOHNE?=
 =?utf-8?B?dkdvMUtrU2IrbnR2WlJsdXJ1MGF3bUYxaTN1NFQyS0ozZFdFYi9PQXpmcUY4?=
 =?utf-8?B?STAvbTdmMFpUSkYwRG9KeFBLakdDeXlVODNJRmlpYS9IZUZ6ckZrYnY0bCtU?=
 =?utf-8?B?bjMrUnFZL2tiSjVWdWRYdmw2bHhoL21uSElwWHVkUjkvanA2ZC9oQ2QrMlYx?=
 =?utf-8?B?RURUU2p6UFU3RWh4MlBWU2dDVlFQTmsvWHNIMjRocEdITXllTTc2b2ZrbVZP?=
 =?utf-8?B?SnBVSTdkQlVnamZzTkx5M0ZGTG5UZEVleVp0dXdrbWhaN3NCa0pqbEhxbmdP?=
 =?utf-8?B?N0ZkcnRDdGdsdmpKWjFCZ2hKRjN0WnVyTjg3cmF1T05FUEFRcHJBN2EwWk51?=
 =?utf-8?B?eVkyeDFMcDdSOG1zYlpwT29MdDZxTTNwV3lLYUcwRlJlRlRDTW9lLzdNV2po?=
 =?utf-8?B?QVZteWhFZ3VzRlZpQS9HSi9vR29lMExCZEFQelFSY3B5YWJ2Nmxqb0dTd1hG?=
 =?utf-8?B?OXRMZTkzKzIvUkR3WWo4TzFZUngxbUpTVitJd3VGTEJqcnNWYWRNcWpRS09m?=
 =?utf-8?B?c3NJeFRYK0Z1S0JWYUZ6MkZ0b1hIVEswZHIzMHRFK0s2ckx4ZDhpckc2ZHBp?=
 =?utf-8?B?cmt3cVd5V0dOUHlhTTFCZnZqQmp0c013ejRzRFFGVGdBa3VYdVhVam9zdmJM?=
 =?utf-8?B?NDdkcUNvalUzTTR1eklaWlc0SzluU040dCtPRUx3SWFaSVJ5VzFWUEZqTWkr?=
 =?utf-8?B?bklkalQ4Mmlubm5zemNMNWRlMlI4R3I0RzBhQ2ovWGhKN2hFSWVXNkFMc1pr?=
 =?utf-8?B?Q3lFQ3lUV1V1akpMUFpEc2hpVFJzbWxScWNVdm40ekV2U3diOUkrY1JBWUZ0?=
 =?utf-8?B?ZnFNR3BzWWFmTjRIYUlsSkh0ZmZrbGo1cTd0QkFCKzJjRU9jNVoxZCtpZTJY?=
 =?utf-8?B?MldndnFtdnl5ZDJuVlRuN3F2Z3FaMzVnbGtuVnA3UHVKK201Vm51ZDZ4Vm85?=
 =?utf-8?B?cU9IMlVleS9NWjJwcTFLVjBXZVlrVjlEZWd3SVNJcEtoL0V0ZWFoZ1RZeTd1?=
 =?utf-8?B?WlRPdjM4anZzYUlmMDBLRHlyL2dKS2x2QkoxamhwVVZNRnRoUFppTEJiVnhG?=
 =?utf-8?B?ekdoWFVuSzVVWjB5eVB1dHJIbUdIYzhaM0lSWmZPZ2RIamVCbW1XK0poNHF3?=
 =?utf-8?B?cmNRMEM0eXpHVThxYlp0VEswZWJ1dlg4aDJlMVA2UStIM2Q0UkhWMUFlMFdB?=
 =?utf-8?B?dTBzQ3MyQ1JOdVdFS1VXZkhLNnRpSVQwNjVPYUZkSTlFelF5amVvZENTRzBR?=
 =?utf-8?B?Z1VZTDl2WnFJN0Zrblc1UzJIcjZtVHJDNlhzcXNHeS9TMjRxbmcwcUJuUktB?=
 =?utf-8?B?MzV2QnZqRGwxbHo0QThFSFlEYytVeXBQcE1YdnErRm5iYVZEOG13Y1NJU1Nt?=
 =?utf-8?B?anF2ekZlZlNxVzA1TXg2WFdFek9reTdlbG5kNGxuUUxpTnBkaDJnTitjak1X?=
 =?utf-8?B?cWFkM1V4enM4NWFTS0FQK0ZNbGU5SCtmRStJbndyQmV4U0Jxb2ZHdnpha2dr?=
 =?utf-8?B?Q1ltUlRkSE9hYk5QQm9GL09tVDgxY0l5Snp1d040VllmV0Z3YjhDUncwcDdv?=
 =?utf-8?B?WU1vNHQ3SGdBdEo3ZnRUakdlOWRuQ2FPcXRWdlZGYUticDN3aDJpaHVLbGNW?=
 =?utf-8?B?NG5UZE9XQVJBbmVxbUNBblRUdFY2ZUJ4cGY4dXY5WS9razhxSW1oVGZ1NXlY?=
 =?utf-8?B?RUtJOWthVHNISzVGZGZqVEplWUJHNDZIK3VqOGFoZExqc1RzQk1mWGhJNUJa?=
 =?utf-8?B?Yk9IT0gyZVRCdEZkMW1HSWJuams2YmpCRzBpQ3l5Y29xMVdpWFduZXNqTkYz?=
 =?utf-8?B?V2tBY01JTHpPQ21tQ2NHdEVEUW9HcHpIZTI5RnMyZ29zQzgxZ0w3T2VHamRU?=
 =?utf-8?B?bGZWc0lvYWNVcHpLd3UzMkdjc0JXV2h4QjR2VEFVSFI2czcwQm9jZGExV0xU?=
 =?utf-8?Q?Vn6/Vc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:32.6895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a470575d-f6a4-4785-b566-08ddca760100
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B

When vpci fails to initialize a legacy capability of device, it just
returns an error and vPCI gets disabled for the whole device.  That
most likely renders the device unusable, plus possibly causing issues
to Xen itself if guest attempts to program the native MSI or MSI-X
capabilities if present.

So, add new function to hide legacy capability when initialization
fails. And remove the failed legacy capability from the vpci emulated
legacy capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v7->v8 changes:
* Change the type of next from uint31_t to unsigned int in vpci_get_previous_cap_register().
* Change to not return error when cleanup fail for dom0.

v6->v7 changes:
* Change the pointer parameter of vpci_get_register(),
  vpci_get_previous_cap_register() and vpci_capability_hide() to be const.

v5->v6 changes:
* Rename parameter rm to r in vpci_get_register().
* Use for loop to compact the code of vpci_get_previous_cap_register().
* Rename prev_next_r to prev_r in vpci_capability_hide(().
* Add printing when cap init, cleanup and hide fail.

v4->v5 changes:
* Modify vpci_get_register() to delete some unnecessary check, so that
  I don't need to move function vpci_register_cmp().
* Rename vpci_capability_mask() to vpci_capability_hide().

v3->v4 changes:
* Modify the commit message.
* In function vpci_get_previous_cap_register(), add an ASSERT_UNREACHABLE() if offset below 0x40.
* Modify vpci_capability_mask() to return error instead of using ASSERT.
* Use vpci_remove_register to remove PCI_CAP_LIST_ID register instead of open code.
* Add check "if ( !offset )" in vpci_capability_mask().

v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize"
* Whole implementation changed because last version is wrong.
  This version adds a new helper function vpci_get_register() and uses it to get
  target handler and previous handler from vpci->handlers, then remove the target.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c | 111 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 7778acee0df6..9960b11cf2c9 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -83,6 +83,88 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static struct vpci_register *vpci_get_register(const struct vpci *vpci,
+                                               unsigned int offset,
+                                               unsigned int size)
+{
+    struct vpci_register *r;
+
+    ASSERT(spin_is_locked(&vpci->lock));
+
+    list_for_each_entry ( r, &vpci->handlers, node )
+    {
+        if ( r->offset == offset && r->size == size )
+            return r;
+
+        if ( offset <= r->offset )
+            break;
+    }
+
+    return NULL;
+}
+
+static struct vpci_register *vpci_get_previous_cap_register(
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int next;
+    struct vpci_register *r;
+
+    if ( offset < 0x40 )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
+          r = next >= 0x40 ? vpci_get_register(vpci,
+                                               next + PCI_CAP_LIST_NEXT, 1)
+                           : NULL )
+    {
+        next = (unsigned int)(uintptr_t)r->private;
+        ASSERT(next == (uintptr_t)r->private);
+        if ( next == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
+    struct vpci_register *prev_r, *next_r;
+    struct vpci *vpci = pdev->vpci;
+
+    if ( !offset )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    prev_r = vpci_get_previous_cap_register(vpci, offset);
+    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
+    if ( !prev_r || !next_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    prev_r->private = next_r->private;
+    /*
+     * Not calling vpci_remove_register() here is to avoid redoing
+     * the register search
+     */
+    list_del(&next_r->node);
+    spin_unlock(&vpci->lock);
+    xfree(next_r);
+
+    if ( !is_hardware_domain(pdev->domain) )
+        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -103,7 +185,34 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
         rc = capability->init(pdev);
         if ( rc )
-            return rc;
+        {
+            const char *type = is_ext ? "extended" : "legacy";
+
+            printk(XENLOG_WARNING
+                   "%pd %pp: init %s cap %u fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf, type, cap, rc);
+
+            if ( capability->cleanup )
+            {
+                rc = capability->cleanup(pdev);
+                if ( rc )
+                {
+                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                           pdev->domain, &pdev->sbdf, type, cap, rc);
+                    if ( !is_hardware_domain(pdev->domain) )
+                        return rc;
+                }
+            }
+
+            if ( !is_ext )
+                rc = vpci_capability_hide(pdev, cap);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
+                       pdev->domain, &pdev->sbdf, type, cap, rc);
+                return rc;
+            }
+        }
     }
 
     return 0;
-- 
2.34.1


