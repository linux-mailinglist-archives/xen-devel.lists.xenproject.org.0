Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60422A72A9C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928502.1331193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhjq-0000IV-OI; Thu, 27 Mar 2025 07:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928502.1331193; Thu, 27 Mar 2025 07:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhjq-0000G0-KD; Thu, 27 Mar 2025 07:33:18 +0000
Received: by outflank-mailman (input) for mailman id 928502;
 Thu, 27 Mar 2025 07:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP17=WO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1txhjo-0000Fj-Qw
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:33:17 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:240a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd78713c-0add-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 08:33:14 +0100 (CET)
Received: from MN2PR01CA0020.prod.exchangelabs.com (2603:10b6:208:10c::33) by
 CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 07:33:09 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:10c:cafe::df) by MN2PR01CA0020.outlook.office365.com
 (2603:10b6:208:10c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 07:33:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 07:33:08 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 02:33:04 -0500
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
X-Inumbo-ID: bd78713c-0add-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2PEKj2lpDEHuTndZb1FHa1amHhQHUKImcUDm/kk/FMEVzHQxiwtkzv6E2kfNevJEAGQVfxECnNPMP3/nrbGPRReLQrrwiIT8a6OAhQnqQP5CRiTz3khLG8Je4J6gmdoOGzOJPDr7u4MXsRffZ//vGJsdjae0GDwW3tg8cyeNWFfkmnEc3H9nm7eL0ic5zIFuOWS87HGgnPgFbsGu4PI+VPNEPMmBAw8wnVhl/tJpQfUCBy+RPbgDnWhHBDNePV20JkSKrr94b7cgpkiGuzKR7/Ftl7v9u2Vo3juIXKuxzMGFSZRQ2k8fLvaJNXJIneJrIap9jgxboA5cv7MCetdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvGoBMY2xy3NjVmNzAzV65gEYVV1UA77iVxXw6BtpGk=;
 b=shdByt1KlxJA58EjNBPg0yToVMYHqKrpXnbBAw0TJVfy0/EWJollJbqSMQE2nIpCuBvlNFDWzGViYvvJDU8X8hrrFDwqaJqzN9Ywhx+OhlRQfnDUkjZqc+KxsZxzNOzKYwTihtAbCIKOKRV8Jxg2lW+LL7NYxpnolRSakBpDIt/cFIOl6F52h5uF8l6xCtE+v0snqm4vcusXHDpwn3hOJyhAelYoDA/GZwFK0+JdJqjQgN6hXOYS9cZdFu5mPjMhNKzX8I5L9laoaSl7MPZJEBCggCtE4FD9lm5iwnYd/UO3ujbYZ2r2ybI6Zjsz1omFa/YoGlJRKCjRKTH0B9zwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvGoBMY2xy3NjVmNzAzV65gEYVV1UA77iVxXw6BtpGk=;
 b=UMRq5d2BEB2+ACbbTlGeSlu5Hke4CaSjgZW1+HR89zP+TypKZvDxjjNqSRmujJmTLfe05nm2aGzaVq4L+jpdzstGHXjsG5sCWAmCx1LfMXLpg5ZdrWge/yQOxub7ZZx0wI8UGH/PPERJ176h5Na8CMMceluXxf3QxKbMkbo0boY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Date: Thu, 27 Mar 2025 15:32:12 +0800
Message-ID: <20250327073214.158210-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e143114-78c6-490d-4388-08dd6d019eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SvXo+AozBnyqAKquSG0WuetLhHBcIViSdW5eZa2kb8ZZTz+c1BdXBgC5d/5S?=
 =?us-ascii?Q?9G3mtvF0OB9tybHyox6VNv9yIZaJkAZVYCtYDEJpBYZjjOXKGS+uSAghyujN?=
 =?us-ascii?Q?YIFA9fGhtkzM2t/8DEbz2Q0kQUpY8x5ut/+SEKTMYg2b9fnfbrhEvMwiMzzD?=
 =?us-ascii?Q?gMgqlaUzLVHe/thS0+ZAaLDv/vAampUh+pDP6+l5GaKg/xxIPxzwt1bARSEa?=
 =?us-ascii?Q?0x+uVsKm5vSOkcQAczrr+Ufa542BSzAY4BESiC/ZncVfFNTqTYF1N5jFxc4z?=
 =?us-ascii?Q?VsSrUdwa59PCmQJkdf1eJqWJUABllPyQ6kamF/n54iqSsL2qGf5jis1OQcpW?=
 =?us-ascii?Q?xLAN2PnRzWg4q/wcpUKFzKNB80lvDUgI81/XJ9oXVF8F4HLrRC8SZrKwsf5c?=
 =?us-ascii?Q?VclKtXcRMzUNAH71qZIMzG0gKvQ3y5i/dKZtOjb7j2v8yCAF5NDjrCwj8z7Z?=
 =?us-ascii?Q?IhvMIngkyqyie0UJTWJVAMVWCpFkdoGsKKRzMsM1uQkyi8+aE3XZyHyJ9xgQ?=
 =?us-ascii?Q?MdUVmbrl29GxxeKzz2A8aIDloN5bxcpaoBAu0Si3CktwbNARj38HULzW7BiA?=
 =?us-ascii?Q?Fj9AKvjMEjCQW3k9CsfeDAUORw+9KfLcjV6GelP47Vqvo0AHo0/LrRTY3kTV?=
 =?us-ascii?Q?nlkuPnDVChBu6pwmzlZlArLyLAITf4HmEeXHiUlGj9jWvXx0rOTR+38BRe1I?=
 =?us-ascii?Q?yt1tSiIajKtZkfa39hmXQgREE/y8Fx5K2Yje7pQ6t5paD2tLnxEjQfI3ONw4?=
 =?us-ascii?Q?ao/OnU7RwaDAxTMbWYlpjOxNdFXjMN1MJVG9Kspgm4R8TpGR8JdP7dvpMvMz?=
 =?us-ascii?Q?b2RAcyCkzHfHXQ1Dk+3o38dEXLt+MPmJu5TzKezG6VKUceWA347aRAyc7B7+?=
 =?us-ascii?Q?36JNOX3Sxm7Hli99H0ydahkOZB/6x3GlL2oJAF+Lcyj4zNt/GpWoZlq8YUA4?=
 =?us-ascii?Q?WluTE7qO+nMNtg1YjoN02kEi+hNgCzjM9GHY11enr51OIYRYe/SZ5chbynvN?=
 =?us-ascii?Q?rojnOzTIT7EGnpq0CnncG8eAivSjiUe8LePOl/vxAfWA4a99/cmGYfI8WYbd?=
 =?us-ascii?Q?IJdllE8a3EY9TKW7XmKbpA41IPuNaz5ni8s2io38BTvwvxqx3fHMkx22z4wv?=
 =?us-ascii?Q?j5ZUL4nugCqmVr3lCbsZHSZ1vOMwcaqU2duzYRph1sX+eaNb2SVPDXStO9RV?=
 =?us-ascii?Q?TwJRsO6PTZvBT3aykkxMiqMcwWbPYu2k1jotm0yv+XvSp3oarFVP1E+jmRCl?=
 =?us-ascii?Q?AWn2rrUhT+/C/57CZVpIAo47EcXJEf04jlUU8XMa8AnrDxzkDhPtUONGc/v8?=
 =?us-ascii?Q?Y9wHJiBJz69P93T0qK61hTXNHcck83k0boxeJUfl/+YjP3alHdI4XPxpILrm?=
 =?us-ascii?Q?oPPEh7JU7jfNdyFWZOl5nXm8S7JaC8RnrcIdMR8eGngc3meeE3ZVISrLp/14?=
 =?us-ascii?Q?0tnh68PwLc2AOSKi/DUcnP69Z2mYSFXV7QJl85QSxnIzN53TIqPktwG7PCc9?=
 =?us-ascii?Q?pL/stLa/h5Sdkag=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 07:33:08.1139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e143114-78c6-490d-4388-08dd6d019eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216

When vpci fails to initialize a capability of a device, it just
return error instead of catching and processing exception. That
makes the entire device unusable.

So, refactor REGISTER_VPCI_INIT to contain more capability specific
information, and try to hide capability when initialization fails
in vpci_assign_device().

What's more, change the definition of init_header() since it is
not a capability and it is needed for all devices' PCI config space.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,

This patch aims to hide a capability when its initialization fails.
That causes we can't rely on vpci_deassign_device() to clean up assigned
resources, so, following two patches clean up resources in the failure
path of init function.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c |  3 +-
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   |  2 +-
 xen/drivers/vpci/rebar.c  |  2 +-
 xen/drivers/vpci/vpci.c   | 65 +++++++++++++++++++++++++++++++++------
 xen/include/xen/vpci.h    | 27 ++++++++++++----
 6 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..8c8e4ac5698a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -745,7 +745,7 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
     return !bar->mem ? -ENOMEM : 0;
 }
 
-static int cf_check init_header(struct pci_dev *pdev)
+int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -1007,7 +1007,6 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 66e5a8a116be..9d7a9fd8dba1 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, VPCI_PRIORITY_LOW);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 6bd8c55bb48e..50e5f38c1e09 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -753,7 +753,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, VPCI_PRIORITY_HIGH);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 793937449af7..7c53ee031887 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, VPCI_PRIORITY_LOW);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..a8362e46e097 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,8 +36,8 @@ struct vpci_register {
 };
 
 #ifdef __XEN__
-extern vpci_register_init_t *const __start_vpci_array[];
-extern vpci_register_init_t *const __end_vpci_array[];
+extern vpci_capability_t *const __start_vpci_array[];
+extern vpci_capability_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
@@ -83,6 +83,47 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static int vpci_init_cap_with_priority(struct pci_dev *pdev,
+                                       const char *priority)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = __start_vpci_array[i];
+        const unsigned int cap_id = capability->id;
+        unsigned int pos;
+        int rc;
+
+        if ( *(capability->priority) != *priority )
+            continue;
+
+        if ( !capability->is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap_id);
+        else
+            pos = pci_find_ext_capability(pdev->sbdf, cap_id);
+
+        if ( !pos )
+            continue;
+
+        rc = capability->init(pdev);
+
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%pd %pp: cap init fail rc=%d, try to hide\n",
+                   pdev->domain, &pdev->sbdf, rc);
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   pos, capability->is_ext ? 4 : 1, NULL);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "%pd %pp: fail to hide cap rc=%d\n",
+                       pdev->domain, &pdev->sbdf, rc);
+                return rc;
+            }
+        }
+    }
+
+    return 0;
+}
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -128,7 +169,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
 
 int vpci_assign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
     const unsigned long *ro_map;
     int rc = 0;
 
@@ -159,12 +199,19 @@ int vpci_assign_device(struct pci_dev *pdev)
         goto out;
 #endif
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        rc = __start_vpci_array[i](pdev);
-        if ( rc )
-            break;
-    }
+    /*
+     * Capabilities with high priority like MSI-X need to
+     * be initialized before header
+     */
+    rc = vpci_init_cap_with_priority(pdev, VPCI_PRIORITY_HIGH);
+    if ( rc )
+        goto out;
+
+    rc = vpci_init_header(pdev);
+    if ( rc )
+        goto out;
+
+    rc = vpci_init_cap_with_priority(pdev, VPCI_PRIORITY_LOW);
 
  out: __maybe_unused;
     if ( rc )
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 807401b2eaa2..fa13397ae409 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -13,12 +13,16 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
 typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
                           uint32_t val, void *data);
 
-typedef int vpci_register_init_t(struct pci_dev *dev);
-
 #define VPCI_PRIORITY_HIGH      "1"
-#define VPCI_PRIORITY_MIDDLE    "5"
 #define VPCI_PRIORITY_LOW       "9"
 
+typedef struct {
+    unsigned int id;
+    const char *priority;
+    bool is_ext;
+    int (*init)(struct pci_dev *pdev);
+} vpci_capability_t;
+
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
 /*
@@ -29,9 +33,20 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-#define REGISTER_VPCI_INIT(x, p)                \
-  static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = (x)
+#define REGISTER_VPCI_CAP(cap, x, p, ext) \
+  static vpci_capability_t x##_t = { \
+        .id = (cap), \
+        .init = (x), \
+        .priority = (p), \
+        .is_ext = (ext), \
+  }; \
+  static vpci_capability_t *const x##_entry  \
+               __used_section(".data.vpci." p) = &(x##_t)
+
+#define REGISTER_VPCI_LEGACY_CAP(cap, x, p) REGISTER_VPCI_CAP(cap, x, p, false)
+#define REGISTER_VPCI_EXTEND_CAP(cap, x, p) REGISTER_VPCI_CAP(cap, x, p, true)
+
+int __must_check vpci_init_header(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
-- 
2.34.1


