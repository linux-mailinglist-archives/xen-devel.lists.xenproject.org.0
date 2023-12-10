Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6199680BC34
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 17:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651391.1017062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMrG-0004qu-Cf; Sun, 10 Dec 2023 16:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651391.1017062; Sun, 10 Dec 2023 16:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCMrG-0004ns-9a; Sun, 10 Dec 2023 16:40:46 +0000
Received: by outflank-mailman (input) for mailman id 651391;
 Sun, 10 Dec 2023 16:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAJh=HV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCMrE-0004mZ-8S
 for xen-devel@lists.xenproject.org; Sun, 10 Dec 2023 16:40:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dac4d6ad-977a-11ee-9b0f-b553b5be7939;
 Sun, 10 Dec 2023 17:40:41 +0100 (CET)
Received: from PH8PR07CA0003.namprd07.prod.outlook.com (2603:10b6:510:2cd::17)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29; Sun, 10 Dec
 2023 16:40:37 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::94) by PH8PR07CA0003.outlook.office365.com
 (2603:10b6:510:2cd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Sun, 10 Dec 2023 16:40:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Sun, 10 Dec 2023 16:40:36 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 10 Dec
 2023 10:40:31 -0600
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
X-Inumbo-ID: dac4d6ad-977a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3Rcv3Gx+o5+ABVciEZUNBnCUbx9HGEI7j+S4l1Vbp3He0APGUqgLr02XEUJL/CY+oS1rTY8oU8rxpYc+k/CsmUULYiJOxfdiLmbANV9JHkBw479jzPvGZ8yagXQTO38EAviY2qMK4gr3Iykxb2V07tipeQOm81NuRl3UIookvNOle0FE+J7IN7NMApTibJeZgtXYpFV6cjtFIgQsDhS50/CSAIULaerbPAxerRXI1AR0wrLfjgegVTtvJFvkuCkcQsSgTFvwqQkMqK0rDXb5z4fvR8JTKYTjWMm65K8h1dheEdUVLGE1pugbGXFDbg09NKiHFwSuRdUYCD5vMH78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjpP9b3zdAapc7bFnAf9Yxc26I+r5JBx8/ouifmxHE0=;
 b=KaFy88ybxPq8yiz6n27imhdsHVqE+pZectAkpNy89+65NmnzuJWdDTPWH5zpzVoLCLaRgjLR9fW7AyRHr7lKo3bkjRJ+mdiMRH09xmow6nYiaMuBl3uYRFxZcNyTCFBiMQN+L75lxObkk8jG4yteCIlmR+t/DuSv+8RWaIjVnd+RF3op5h0/nl3LX41m9TlRu+yCM/I6jgVQ19106Vo436Paa19Ew9hCgLkkJDRuMo+hh1d7V6y2tCWHMKVEJS2sgFCLC5/+JUhbqKd6jViRWEroKANTCRH4TYFkvjA7TQQPiG8rBLz1Oz9iP9QR0aKCAWBb3aAokJATDrV1wz7qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjpP9b3zdAapc7bFnAf9Yxc26I+r5JBx8/ouifmxHE0=;
 b=tUo6/jvg4+b8GQNOPcU0uyR6bysLNm/ngznSrU93nLv2YFJuPbDpRYh1sY3dUdpDvvy0u0Qagy5YDFjpV+mQzpLm0mOJzJ071Sl6/rKquxxY5nA8sUNsxbElvKdUIrNcpLMVPDz3+2CqUdHzJk9S04Wou8WWXADrzCx98UEYTTU=
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
Subject: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi for PVH dom0
Date: Mon, 11 Dec 2023 00:40:08 +0800
Message-ID: <20231210164009.1551147-3-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ccbc9d-b50c-4dca-3908-08dbf99ebc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OETyUUkechQu1WlULDuDfcPaYtmaBz8/5yprSVaO515+2y3zobN4O/aQeVg4LPUpl9NxVM8cX9l/5grkhG+AQLzLQFcxGSt1npBXEKzVi24RUV0UOP/IeHm1821GTqQdLV4QHjjQbfLWXNqEoqCFhbAQ0yS8kLgKokcOMkxDipxcdrJscD8rQRbfmfA5hZnIv6wP3dGDUucFT0t7OxVZ19rIL7ldfqsB7d9gNGLQ0+2GtZ5ocmBoDEE9Yu4Z/xck4ZckwWvfqURB4l6xoeCYhwrPDGd5ZB67f9dDYTouNC1et0tpymVPYY465WOokwdDVeR/xhww5Lvoa6MooPeqjw9XG08XFxZtjEIJtwnk6nQv5hZgZNGB5wJF5eRYQVgZy9HrtIsYpUtGSymw7UcmfUE2B1B8boIoO03uRxkeW6t2OSGDxYvdbOW4LibihJQJH1+HKmBfsxCmuHQrQXVpKAQqSg6RA7DfIpNjOOR1EaozEkbXK8SjpV7l3mNjkJ+pKrX4D9cMA86mbgbMTEKyaAkfaMHg/9nPvmKNaFxRL16IxmxzNTwK8rzgFCP7oh6tweVPZ+60B7Ye3gn9G/6OjmZpUNw7MkZ0EkfWn+fzVlgk9s+8xdBJqSvw4mF8TliKT8xUYjEiI8VAg0ThPIuai9DhhKPMBuB2yzfknBpq2sU6vBN1jdZ9TipvE2KCUl3vWh5aZlGbESL5dg1XM7tQ9AFcBj34ynbAr/QVI8UUeFblrntDhGddcb4zrgVre4v9iLgWiJhCYwAQDdHFV/+0bA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(478600001)(7696005)(16526019)(2616005)(6666004)(26005)(70586007)(70206006)(336012)(83380400001)(110136005)(8936002)(4326008)(2906002)(47076005)(8676002)(426003)(316002)(54906003)(36860700001)(5660300002)(86362001)(81166007)(40480700001)(356005)(82740400003)(41300700001)(36756003)(1076003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2023 16:40:36.5952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ccbc9d-b50c-4dca-3908-08dbf99ebc8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see
xen_pt_realize->xc_physdev_map_pirq and
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
So, allow PHYSDEVOP_map_pirq when currd is dom0 no matter if
dom0 has X86_EMU_USE_PIRQ flag and also allow
PHYSDEVOP_unmap_pirq for the failed path to unmap pirq.

What's more, in PVH dom0, the gsis don't get registered, but
the gsi of a passthrough device must be configured for it to
be able to be mapped into a hvm domU.
So, add PHYSDEVOP_setup_gsi for PVH dom0, because PVH dom0
will setup gsi during assigning a device to passthrough.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6ad5b4d5f1..621d789bd3 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
+    case PHYSDEVOP_setup_gsi:
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        if ( is_hardware_domain(currd) )
+            break;
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


