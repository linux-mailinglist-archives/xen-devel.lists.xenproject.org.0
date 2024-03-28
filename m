Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06C88F7F6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698790.1090947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLV-0006DX-Vy; Thu, 28 Mar 2024 06:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698790.1090947; Thu, 28 Mar 2024 06:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLV-0006Ac-Rr; Thu, 28 Mar 2024 06:34:41 +0000
Received: by outflank-mailman (input) for mailman id 698790;
 Thu, 28 Mar 2024 06:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpjLT-00050u-MS
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:34:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ffe7145-eccd-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 07:34:39 +0100 (CET)
Received: from CH0P221CA0038.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::24)
 by PH7PR12MB7164.namprd12.prod.outlook.com (2603:10b6:510:203::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 06:34:36 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::cf) by CH0P221CA0038.outlook.office365.com
 (2603:10b6:610:11d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 06:34:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 06:34:36 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:34:32 -0500
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
X-Inumbo-ID: 3ffe7145-eccd-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaVqPSsWHdUtxjhkqgN0WT+cqpQbtvozgcZ3W5daCUv5GeOyJBGT5+AF8paYADyKuxAvF7+QTIpjXF69tH5zahoM3NpQYFrm5jtzfV1v/VbP7Ngt3UAvDmHmj/eclpfNQQpPRXoMP29mqSVhr6rdwVbfn+eBHXIvb40O1aVzetg/da9VG37s2KENTL1brOWJpaQTeTA88vceMd/teqpFWYBNvC8BGu8ibI2uwMM5XlfN+65O0zr3FwuGRLkZwtHz8a8xQYc8cNLNb2e2B6+RfTx+ylGwAse7rK1FZLRRHFswfnlfGR867vCEaxKBc4UZIn+M+lckOkGEaXLqwAj3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZL0xK3Pv/stc/fF301pIcUEWskFlD6vojcmINMIZc4=;
 b=FGKnYxp7PH1rOHJdgYPYt9Ua+vTMfVreIKvrWsRfXNZjjM5zuLZLd+lI6mMAJoys6uCB0b8lXepGmZt2ifaz7ySk/rYhFVoRagOXWU35ofjR6F0ttqBoQ5hZHfIu8Xdo1lSrlAqjabtj2IxR1Oro+Ehag+igLwdShWaJ0zBsTzMP5ZmnNOT6K1vGhY8cNle16AuZIBhRD1TZ3pTzT9QcCN7OfWCSph2vDKRGgUMCEiKiMy042bv0Db6Z7BZH8iOAC+1+BWsPPaktDPCxZzsJhvmnpMHe0ALI9ldGrBUPKTJjfUBWge9QYHJhh9JSWmQx49D5RxeIfgOpOpqtg1skPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZL0xK3Pv/stc/fF301pIcUEWskFlD6vojcmINMIZc4=;
 b=1QiEkZKnWr61YZ/sQ/EZ8mq1Kp2Hlj3yczVg5wEzkNAFDtzhGZ9FqwfszNI3KE48Ou7aIsXQRaxIEui58LiaN42QNMj+PWLAeMCccg9AKhNwZSY4ueUMnd+WKrF2kjkYeY9Vy3MkN/MSjLexd2hlfBdfKnmBN9ulegbx7aooK3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v6 4/5] libxl: Use gsi instead of irq for mapping pirq
Date: Thu, 28 Mar 2024 14:34:01 +0800
Message-ID: <20240328063402.354496-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328063402.354496-1-Jiqian.Chen@amd.com>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|PH7PR12MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 8504107b-0e85-4fa5-d7e6-08dc4ef122fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wTj2gMa6OPXvnTocvYNN8u+jeyJ6TJnFca7Y/DJfyHg3gBhLJ6HtqLoXX638ekSx4EmghOEElE8yJl8WNtMseWuZTr4dy/KqmAnVk5NkVzZdgZlNrp+KZPmd8fBo5mZHs3hWQp5pUcy57insiet0cuJbpH+ee8c8eT/P2hzt2lllhRv7eTYx/6HJftasRSRJ0OzWmKkejrCCXNoP545jr6zTyx1YsGq5KRXgwfRUOMvJ+2PVei8yrWknhO+khQj++hMmq5RGvHJ4YawNHEuI7jOEJNAUbZkLeJvUwW40RmGMlRK/VQjUwDFc9QSaNC0TF/UMqt+g8Ch9LBtSeHtXbJmbAg/tM3f0QSwH79f3ccnIwhsU0d2qZxY2xJ4mpkQX5FmWk9EZ0IBzsY68IkG1eg5KaDCzXzjG598fFXreObHfjY/8FRim4MY73KdmTvqFI3KSXS9wAXZpUOziBZHUIBZakAnsqE5H8ysqxWciIhzKE6/snyLz4yU6TacXeXDCZoF8UmSo/T+0UDO/pkhSvr8naaGd/OoaZo5q9cwMUWRb9iMk4NQUTGkS2fNMhJyvl6INQLWO5So9v1lisGJfAeJ404SYqbnl3yadvASL2KVTYlTHpLa9wbJkQSkC/+lDVZ6CbaxN657DvQNVNlJzsukeT2TtfXdX9VVPo5WrUYevPsBbPrgl/w/nDcyMXLWOGWderTulT+9pLZOyN+GTjcL/lR5OtpdkkIi7YDrXYlLtxAZ/rpiJeg52IV4sDlkl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(7416005)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:34:36.0092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8504107b-0e85-4fa5-d7e6-08dc4ef122fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7164

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
the irq number is alloced from small to large, but the
applying gsi number is not, may gsi 38 comes before gsi
28, that causes the irq number is not equal with the gsi
number. And when passthrough a device, xl wants to use
gsi to map pirq, see pci_add_dm_done->xc_physdev_map_pirq,
but the gsi number is got from file
/sys/bus/pci/devices/<sbdf>/irq in current code, so it
will fail when mapping.

So, use real gsi number read from gsi sysfs.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
RFC: discussions ongoing on the Linux side where/how to expose the gsi

---
 tools/libs/light/libxl_pci.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..2cec83e0b734 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1478,8 +1478,14 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                                 pci->bus, pci->dev, pci->func);
+    r = access(sysfs_path, F_OK);
+    if (r && errno == ENOENT) {
+        /* To compitable with old version of kernel, still need to use irq */
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                               pci->bus, pci->dev, pci->func);
+    }
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -2229,9 +2235,15 @@ skip_bar:
     if (!pci_supp_legacy_irq())
         goto skip_legacy_irq;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                            pci->bus, pci->dev, pci->func);
 
+    rc = access(sysfs_path, F_OK);
+    if (rc && errno == ENOENT) {
+        /* To compitable with old version of kernel, still need to use irq */
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                               pci->bus, pci->dev, pci->func);
+    }
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
-- 
2.34.1


