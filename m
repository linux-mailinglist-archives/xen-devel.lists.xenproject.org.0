Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C310182BB2C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666644.1037426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAp8-0001Uz-EF; Fri, 12 Jan 2024 06:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666644.1037426; Fri, 12 Jan 2024 06:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAp8-0001TO-A3; Fri, 12 Jan 2024 06:15:22 +0000
Received: by outflank-mailman (input) for mailman id 666644;
 Fri, 12 Jan 2024 06:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PwP=IW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rOAp6-0000At-Qz
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:15:20 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5df63f5-b111-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 07:15:20 +0100 (CET)
Received: from CH0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:610:77::31)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 06:15:16 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::23) by CH0PR04CA0056.outlook.office365.com
 (2603:10b6:610:77::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Fri, 12 Jan 2024 06:15:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 06:15:16 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 00:15:12 -0600
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
X-Inumbo-ID: f5df63f5-b111-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVjEO65u3PvvoYn6+tVPooJsGlJE7tzEm/y3AaMU+yCzTKQR6AHNLSBRZWTT0mNdKtqJYp8tDgBfUwXclzMYCajJCYJ/3EJx8LKmdjhWPTLm5/NiwidI1D3Q+KVxjWW0tF0TM+gVKuaW48gEytNz1r+jUhrBUxT8FGM/mJqIP33yw4ce2hhX+3dJ9Qi3LnxrXar/bHr0/dTtJXfc8VBYTbmFgCXVkMjclTJEP1sCHnlCRdBouQsQkYnA3ujYxKlPvtyxZbadMBa6JvVoBTugubiRME9pSwdhMhJ1gF5AVyxLIJHBqlQhbJ3/D+kFbGhgQ5tMuNahD0LKD5nQ2Qpulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XjwE0ZYBirR+9vRd4V2Cvbo4ZpC70gMeKjuI4Ig4FA=;
 b=bwK+3Z3+aFx9YsoFfKFnOefPtHmE4SDP4p6VUTcY1aCMx/dcI0D+7n4AIUTYKcAW4KNCbGA+3t4OWPAF22DwmfqoEOcQWnKjyXwo64WvW6ogh483syz9h+ckjeV4/vkbDn/lswz0wlLaEfVO5bFZWiBmOpbYkt/7TCEU+SIJ7Iq/o557bJ0ytD2wMfs3Dfexfffb9hypdfBE24pZc36MwHxfsB3/Hk1gqOCyDsyYVrSaBvmKcQgxLhAhFwNrd7uF1s7cRkMspBaxEAPo3C3MZURVkWKa3p64zETRh4e0Qjhtf/MN+je8zafZFTvLKlIDNaKRJmqxfevkwgnWnuuURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XjwE0ZYBirR+9vRd4V2Cvbo4ZpC70gMeKjuI4Ig4FA=;
 b=TuM0NasNi9aK6h4S5TWv3F9uo/pH9IE5H4l9wwRR0x4TrCojulT27HJox5zhnx6lEX5Ox69ht4+BgRI3U/B4++Z+iPpeKQ89ydm7Hh/XZaR5pNLL3lD/YI8bcotRlHo5gD6FmvB9Uljfn6DQw1UziDBrcvSxrIevKcf+twTkxgY=
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
Subject: [RFC XEN PATCH v5 4/5] libxl: Use gsi instead of irq for mapping pirq
Date: Fri, 12 Jan 2024 14:13:16 +0800
Message-ID: <20240112061317.418658-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112061317.418658-1-Jiqian.Chen@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf71274-9745-4c66-d1d3-08dc1335d865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQsL2RBNwlftdQ30v5qNAOIulStzYOm5ZiA+YeQlmoUG2+v/+yp8ty97ASsBpsbsiMLCdKEqPSU/3/zug/VNGK25YlmlIqWrPPnQ5yl+lZQqWTqFnFsTg7E3m2zQ/mjN/3Vx20O7kTGCu6lBGrwi4N8yq0XRCOF3Mb3etSh86nkEf9H0leANbrwTl02J2q9P/eafw3v5x5o4YnJDLZggr70DnV1wzHwL1jgF+Y92onn/MseWTHtlx2cwmw/h6/583qJbSIHZcV2r/9uU8KUfKyd5JjlFxuuVG5UUhKsQPpHgvl2YvOHIV8pfKlUfPPkIIwder4FNov7lZAXAoBGZrgSKK97B59cclb256JLnpJlznnxrrXIhedv09ft/CWC53TV2BMO9Z9mfbOdcNcF+660kTwO+ZRKm3ezT3Rs776AmTN8jMZ2K0b5rlaak9OvBisdf4+gctFz7OBUvX3aD7TDnUmuAcgYnFySmeZ7K/znhzQRehWd0utOkVlk5YQT8HZ8DAFTtIvx6TNe/Z+AqFUF18ANTyaYzqVefdGAzBXMXas/TMI2xQTcPVNeyTQoY9u4/b9+FDX2K11ZgBZxN8E4mCLga19h890YIPvJTjMnCrz2/vYAsV84dEmK/j86W2k84woj/ITPcKQ8QjUDYyfycJtOPQ7eoxW1mAcLPeaLxYkWqUxChuKIl79o7bHUG/F38X/63jfT3FQo2Mf5C1yszCPHquUUDjMIMg2WeLfDs5Cuy4tt/u0DbKIFaBji1V2jSx2YubVZYh8zgqnpx2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(70206006)(70586007)(36756003)(6916009)(316002)(54906003)(7696005)(478600001)(41300700001)(8936002)(8676002)(4326008)(7416002)(2906002)(82740400003)(5660300002)(83380400001)(81166007)(356005)(47076005)(426003)(40460700003)(40480700001)(36860700001)(1076003)(26005)(86362001)(336012)(2616005)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:15:16.3576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf71274-9745-4c66-d1d3-08dc1335d865
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

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

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/libs/light/libxl_pci.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..a1c6e82631e9 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1478,8 +1478,19 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                                 pci->bus, pci->dev, pci->func);
+
+    if ( access(sysfs_path, F_OK) != 0 ) {
+        if ( errno == ENOENT )
+            sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                                pci->bus, pci->dev, pci->func);
+        else {
+            LOGED(ERROR, domainid, "Can't access %s", sysfs_path);
+            goto out_no_irq;
+        }
+    }
+
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -2229,9 +2240,19 @@ skip_bar:
     if (!pci_supp_legacy_irq())
         goto skip_legacy_irq;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                            pci->bus, pci->dev, pci->func);
 
+    if ( access(sysfs_path, F_OK) != 0 ) {
+        if ( errno == ENOENT )
+            sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                                pci->bus, pci->dev, pci->func);
+        else {
+            LOGED(ERROR, domid, "Can't access %s", sysfs_path);
+            goto skip_legacy_irq;
+        }
+    }
+
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
-- 
2.34.1


