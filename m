Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJoQF8a2n2mKdQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 03:58:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A41A0401
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 03:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241197.1542349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvRZc-0006m8-Eg; Thu, 26 Feb 2026 02:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241197.1542349; Thu, 26 Feb 2026 02:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvRZc-0006kL-Ar; Thu, 26 Feb 2026 02:57:56 +0000
Received: by outflank-mailman (input) for mailman id 1241197;
 Thu, 26 Feb 2026 02:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUpi=A6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vvRZa-0006kE-Hb
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 02:57:54 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee659aa7-12be-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 03:57:48 +0100 (CET)
Received: from CY8PR19CA0029.namprd19.prod.outlook.com (2603:10b6:930:6::18)
 by SJ0PR12MB6807.namprd12.prod.outlook.com (2603:10b6:a03:479::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Thu, 26 Feb
 2026 02:57:39 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:6:cafe::7b) by CY8PR19CA0029.outlook.office365.com
 (2603:10b6:930:6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 02:57:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 02:57:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 20:57:37 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 18:57:37 -0800
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Wed, 25
 Feb 2026 20:57:36 -0600
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
X-Inumbo-ID: ee659aa7-12be-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yjln/RijEd4YIvXQ72VAkSM3Wr4wJAXF/OzU9ca/Q66UTwONc1fJ6SfTRf7IfHFXE+G/R/21uBkkWhrr2ilAgP3FfnEipe3NJcIlziVJyNLadtmXVzY0uK91rBcrSf6G+n4gOgo3MJ8gw8qhe3CII6f4VoGZr11JydTlEqibAOuSQjROxSFpn50qpvpYMIhlN7iCzAxTtq6+l9gf9NDJKE5xEMG4c8KYfT9gGGtCekkjVcUxBHeVWdL+PmyYktRS/mR0IkeI+bJFaikN+X0tFx/gTuwo3PKxIaOtznw3sKa2IFUJReBR4oJ5Vm5nvmMB+6I3gz++dwiZpZd5RpkEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiPiVuucsC2EucsEGZmF0h4UPzI1DcajQirOunOPvWo=;
 b=Slr5My37ipjx9fIGUxCuge7164A0Ki5bY5e7O8i6TrxNGMVK5/RW4CpLuM1h2FjOy2CBhwQegLkV/0L7JsmtpxHlsjMaVpbJLlEMCWBVwxi1naaaJc0EAWrSFy4s5NMqBkvFsaoRED/R2WNDqHeGu1RLfZGppdiJ6BKouDmnK075JDmWccLyXP0ucEbxjF6qa2ykiL4cXEfdic0g8cATliVDFL35f3YbvR6NA9JU9gOXDZaAhVw5PMh9gRxSSyoLB4LHSyctd7Vsa4Pd7gw8hw8/aVegsPM5/40rVPpUkpxyP+taRXbevObYoMfi5vEmFDlFwJGe1B/pt5yBLtOPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiPiVuucsC2EucsEGZmF0h4UPzI1DcajQirOunOPvWo=;
 b=mcX0hQjXfROGyhwZv7dsuYOc7fK3oq8bDMaK4TOVo936wzI8wy+9HY7APK7EtwUJr8wt3U745mrmM59cPhXHXBYwEtLxNwBcNIQtitO0yLQKYs4T2Ha2B+0vPKB1aBgzHxQz5c1aAKpncKf/gRZ63E29RFPbpy76xPlzdkdpB8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3] vpci/msix: check for BARs enabled in vpci_make_msix_hole
Date: Wed, 25 Feb 2026 21:57:38 -0500
Message-ID: <20260226025740.71673-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|SJ0PR12MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b398470-74df-4dc7-47b6-08de74e2ccde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	E39tkFF1wwqJxkB2gbFJ7xPXClLNm9nhQWnfXIiwQUjHIioVxjJDatYkqDhD61N2XJShT7QlHoPiI+IsJlJwfUYLQMyEhvNySlophveLvAKXXxav0PyGUcwSRWrTojZGA7rW5d54zTC2ITr4bx6sqKoCQEhuM+IU17yG/74Fil63QGjQ6WbW0EN+4qMxZfcqU449ekpdCDDQOEdemGtlEPoJSML+OrfIiT17reAtks88SKMRGRxuV9hqPb2ZFIveQ5oYs+JIwfWRibF6iAeyfT1lSajIv6+pvt62LYOFni+1Kg0+jM+/oFoxYSolA9sbg84YZpeDElcfi/n0p3f9eTpdPUF1ff4s7MUx6JupZrmO2DkHeeO6Z9MfNqryunODejgza5vjKgU3+XwZ7zCYgJOdgfthJ5yte1xFv+852BY0y7JQJWmuI+b3hJtQoQ9wNtXjL/g+1HWmxdjLhtFoc9WEdl243foYZVfYPfzbQt7qpqDyJD1iaG1qYPivjoRmq6ORb5MQwLFU0tU0UtTzxEjVjnWElAUSmSKpyfISA5kW6vZ6uxGm6EMkHohBDjqe4/sSpLZ7PxjZYWDMz6hE7BRh7l4Sj7kmFnXpndOfPL6KYOmJvoIXgV7NheTL0uKO7HtcfhHHpTvkAeJr4PzpzDely6qPblI4n69y9/X7dt3Yp3D+GPkN+ZP8X8JqtGZocQfh+oOadr8He/KvO78bshP2ecjjROPeUmkmz87RgLBHaePCoWP6uzstL9a3juEhMi1l7ClVQxWPZQ0v6AJEG/yEtzZhcsx+HN3q/xC6vjYCIZKz0no1xJ/JxyX8q1WR/47bD3fpwjXXa2djyQ08u07LM/B9sS8bELHam3UYlnE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sefC1Wdu/HdLKPMOFgV5NdugyLgc2elapyYU4NPmIlNNFXRG9TXuEjXz1Tm9n4XZUCZao6U/1S0jOfKueh658aMbXDjR9SofQkLFnFfDPL6UshOXf7kij6csbVnIqqp6ej+mnBEOyXPYPlTXjloKCsMVYCStLhtycKIIzFKE8uqgkw2KvL74Rij4C/qw97WbOjOpUj5dXTh07ORUKwuiBeai4qBUKgfriG1Kix4/KaNqfEhSmGe5PkxCzJc/9KJbVWk+MOH3Rc+oI9t4wKMaIu2q+Y4TntuRWWOwx9MrbSQwA9t+8mtORPZch54Z8pvWSaffMdDflhrlrZzUzegSTNzeMwlxre7maJYEYk+KdjIJuRO7A1CdkF2abduTB4g3mI6nHvOZOX1D5RF2Lp4YFtD8o9b+ShqX/GXk/27yVrVJVvsDUp7llNSeDz3JRmio
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 02:57:38.0887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b398470-74df-4dc7-47b6-08de74e2ccde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6807
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: C16A41A0401
X-Rspamd-Action: no action

A hotplugged PCI device may be added uninitialized. In particular,
memory decoding might be disabled and the BARs might be zeroed. In this
case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
unconditionally attempts to punch holes in p2m, leading to init_msix()
failing:

(XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
(XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it

vpci_make_msix_hole() should only attempt to punch holes if the BARs
containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
for checking if a BAR is enabled, and add a check for the situation
inside vpci_make_msix_hole().

As a result of the newly introduced checks in vpci_make_msix_hole(),
move the call to vpci_make_msix_hole() within modify_decoding() to after
setting ->enabled.

Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2347521688

v2->v3:
* move check inside loop
* slightly reword commit message

v2: https://lore.kernel.org/xen-devel/20260224025626.26909-1-stewart.hildebrand@amd.com/T/#t

v1->v2:
* new title, was ("vpci/msix: conditionally invoke vpci_make_msix_hole")
* move BAR enabled check to inside vpci_make_msix_hole()
* introduce vmsix_table_bar_valid() helper
* move vpci_make_msix_hole() call within modify_decoding() to after
  setting ->enabled
* split typo fixup to separate patch

v1: https://lore.kernel.org/xen-devel/20250812151744.460953-1-stewart.hildebrand@amd.com/T/#t
---
 xen/drivers/vpci/header.c | 26 +++++++++++++-------------
 xen/drivers/vpci/msix.c   |  3 +++
 xen/include/xen/vpci.h    |  6 ++++++
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 739a5f610e91..6a28e07a625b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     bool map = cmd & PCI_COMMAND_MEMORY;
     unsigned int i;
 
-    /*
-     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
-     * can be trapped (and emulated) by Xen when the memory decoding bit is
-     * enabled.
-     *
-     * FIXME: punching holes after the p2m has been set up might be racy for
-     * DomU usage, needs to be revisited.
-     */
-#ifdef CONFIG_HAS_PCI_MSI
-    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
-        return;
-#endif
-
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
@@ -164,6 +151,19 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
             bar->enabled = map;
     }
 
+    /*
+     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
+     * can be trapped (and emulated) by Xen when the memory decoding bit is
+     * enabled.
+     *
+     * FIXME: punching holes after the p2m has been set up might be racy for
+     * DomU usage, needs to be revisited.
+     */
+#ifdef CONFIG_HAS_PCI_MSI
+    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
+        return;
+#endif
+
     if ( !rom_only )
     {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index eaf8fae970f8..3efdd520e4bd 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -605,6 +605,9 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
+        if ( !vmsix_table_bar_valid(pdev->vpci, i) )
+            continue;
+
         for ( ; start <= end; start++ )
         {
             p2m_type_t t;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d6310104ea17..8ce730791080 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -267,6 +267,12 @@ static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
            (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
 }
 
+static inline bool vmsix_table_bar_valid(const struct vpci *vpci,
+                                         unsigned int nr)
+{
+    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].enabled;
+}
+
 /*
  * Note regarding the size calculation of the PBA: the spec mentions "The last
  * QWORD will not necessarily be fully populated", so it implies that the PBA

base-commit: 70c47ec5d65fa985ef7becd74b2d7b6d744b4c97
-- 
2.53.0


