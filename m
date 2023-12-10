Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC280BC32
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 17:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651392.1017073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMrH-00057m-MI; Sun, 10 Dec 2023 16:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651392.1017073; Sun, 10 Dec 2023 16:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMrH-00054m-J8; Sun, 10 Dec 2023 16:40:47 +0000
Received: by outflank-mailman (input) for mailman id 651392;
 Sun, 10 Dec 2023 16:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAJh=HV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCMrG-0004mZ-8A
 for xen-devel@lists.xenproject.org; Sun, 10 Dec 2023 16:40:46 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc8a7e9a-977a-11ee-9b0f-b553b5be7939;
 Sun, 10 Dec 2023 17:40:44 +0100 (CET)
Received: from SA0PR11CA0085.namprd11.prod.outlook.com (2603:10b6:806:d2::30)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Sun, 10 Dec
 2023 16:40:41 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:d2:cafe::70) by SA0PR11CA0085.outlook.office365.com
 (2603:10b6:806:d2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Sun, 10 Dec 2023 16:40:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Sun, 10 Dec 2023 16:40:41 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 10 Dec
 2023 10:40:36 -0600
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
X-Inumbo-ID: dc8a7e9a-977a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/eR3SBaxHDNvF/KQoywjcPbxFRHxlhtRmf6v3+n+qx1hYPBmv9XafdA31vS1vkh9tJnD1Wyc+BXwmMIwi/UWbjDsYlPQcJ9eiyk6JgH7IPg4pkhNpHHtK3m2pYOpzFiYEBN9rWHOZnAjofz3C2ApVKsRg8Uk0+sWGlUUQTgdpr0Q3AW4qUJP/n5cptzc87Suo+lYcS2oP7gocZC+nXzsPeuySHzdX9zN7ggmQiSyTpJOtYzINRHEdIV/+xCK8VaiBUj6eh4/YDd2aLPml1l5Y4hvzoJOdT9nRlRjrfO1NwuqKU2dX1O8CCZku2hIILU6/ICtJIC8s1kuuQoSKyqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UpkM/2hZ/hyd7VzUuA87GzjsofrR7iewcvgg+VyOL8=;
 b=LZkLlqR6S6olkzyfAhQsF+qmfvKaHtkVrAHBt/WjeEHr+IFeKf2WiYg3NBwFYhJ+IRPRMIG5FoH7uWBcMeSP0t1nH46hFx2bKX0BHsyeLg0bo2VkXwvRlrEMfy79RvuxzmSXAJLeS1zlAcb/nH1GdemofyP+6DaITykw7dlQKzPWp4NGr6+mYLDuSvmuuzhcxbA16msV+IH5Lm0cAMrHxJVvBOy940z9xxG/iBortA9d+cL8N+JV2LqX+8Ifbk9R6DhMT418vgQOP/JCD7XUPuYD2uK/OegwasWwUBt2RC2ERovadhCSdEzOGHOk4J+DB0X36iymjJRx21iXgySLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UpkM/2hZ/hyd7VzUuA87GzjsofrR7iewcvgg+VyOL8=;
 b=LgF0saVfah85f972ZH4p7VhTJYDQEdCBjbG77RXHstXHg0KSKTh3lwiZoqClntYulcGIkxfsFl/ndqytwiQG5JBVdBkMSPciuwgBYozuymWtayM1XvF2HdukOup8qBbEg9vrYNM5B3K2ME3WUqEqdLyUq1JYxFJl16ewp6udFJA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH v3 3/3] libxl: Use gsi instead of irq for mapping pirq
Date: Mon, 11 Dec 2023 00:40:09 +0800
Message-ID: <20231210164009.1551147-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|SA0PR12MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 66335a6c-1a3c-429b-e1a3-08dbf99ebf35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XpLKbnMU7A+9gF59s8pIU3rykYXY5HbnsrnO8wouj6x0aXlPR3tOv9edy+Y0HgmteIvrREAAWSu96gfKudaWoo9Ck/URdEdoGOIPIE2jXJghYIUyp1IAyVmhJ60VxsRg0MseOjVXhSzWefqlXlZ3b+PIeY7nuyRuvidfl/RPUQMo4F8u/6OkLivxbxxkbxgtfKKS8ThSj1irR1GAkloqD6r2sRM6Z9yjW925gJZdFkaMrIrr7VVWBdpg7UlKvPFT9fZDKn2IrAHnMFdkePPHPwLJ6gQTkug0xOcQu4MEle0eP0UaeAXlNMrjnVF4rpHywlROEtvNGjngih6+PnkocT4dty3UHOQUgwfmaJdzB8VVHH3EgkG/wCH+oqw9NF2CuesR8XMcpLfJn18ZwN2nwsv5aicm7eFZfiljUClWjGwC+eQA6gmEzoAKKO+UJIvfkeHJmBeKXsAKklA/51IOZHXUkcMBNP1Pya6KmY+ZQQCbU2nliiSST8TXf9h7Cl4v5xIPBOoVMTY6uWWZSLWoh38iwFXh6dwdnbJZl5WVraN4lrr2tccPmKBE3IHsk0BRfPzJyfBrICpY/lb2lfaGirCHFSalyGA0J2+lNhgJeYQnYKexaw3L6w5Cutvyc7Eu1gVJ239yDia/wE4cb/b+3wpHnhdOiqFVCcqMopDkzyARriq+gCucqR53/CD7YuB7GIpPTF5tSC9WdXb8BLXHW7LgtrVyt7YoAd+gqsbTrcZHcXorWSaVjvFqxtPPjWJLSae07VjxnEVPdsaqpf3Bhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(46966006)(40470700004)(36840700001)(40460700003)(36860700001)(5660300002)(1076003)(47076005)(336012)(26005)(2616005)(16526019)(36756003)(426003)(70586007)(70206006)(54906003)(40480700001)(2906002)(83380400001)(82740400003)(81166007)(41300700001)(356005)(478600001)(7696005)(86362001)(8676002)(8936002)(4326008)(110136005)(316002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2023 16:40:41.0560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66335a6c-1a3c-429b-e1a3-08dbf99ebf35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559

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
---
 tools/libs/light/libxl_pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da079..9e75f0c263 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1416,7 +1416,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     char *sysfs_path;
     FILE *f;
     unsigned long long start, end, flags, size;
-    int irq, i;
+    int gsi, i;
     int r;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
@@ -1439,7 +1439,7 @@ static void pci_add_dm_done(libxl__egc *egc,
                            pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
     start = end = flags = size = 0;
-    irq = 0;
+    gsi = 0;
 
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -1478,26 +1478,26 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
                                 pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
         goto out_no_irq;
     }
-    if ((fscanf(f, "%u", &irq) == 1) && irq) {
-        r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
+    if ((fscanf(f, "%u", &gsi) == 1) && gsi) {
+        r = xc_physdev_map_pirq(ctx->xch, domid, gsi, &gsi);
         if (r < 0) {
-            LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
-                  irq, r);
+            LOGED(ERROR, domainid, "xc_physdev_map_pirq gsi=%d (error=%d)",
+                  gsi, r);
             fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+        r = xc_domain_irq_permission(ctx->xch, domid, gsi, 1);
         if (r < 0) {
             LOGED(ERROR, domainid,
-                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
+                  "xc_domain_irq_permission gsi=%d (error=%d)", gsi, r);
             fclose(f);
             rc = ERROR_FAIL;
             goto out;
-- 
2.34.1


