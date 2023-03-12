Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0016B63C1
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508862.783737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYJ-0002v3-8v; Sun, 12 Mar 2023 07:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508862.783737; Sun, 12 Mar 2023 07:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYJ-0002sU-6H; Sun, 12 Mar 2023 07:55:35 +0000
Received: by outflank-mailman (input) for mailman id 508862;
 Sun, 12 Mar 2023 07:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYH-0002sM-Hr
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4133acfb-c0ab-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 08:55:30 +0100 (CET)
Received: from MW4PR03CA0232.namprd03.prod.outlook.com (2603:10b6:303:b9::27)
 by SA1PR12MB6728.namprd12.prod.outlook.com (2603:10b6:806:257::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sun, 12 Mar
 2023 07:55:25 +0000
Received: from CO1NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::31) by MW4PR03CA0232.outlook.office365.com
 (2603:10b6:303:b9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT109.mail.protection.outlook.com (10.13.174.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 07:55:24 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:20 -0600
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
X-Inumbo-ID: 4133acfb-c0ab-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnTiAh9jBQdy7czobCYYxeBGgHkk/Z5HaHYAFY//KB/Qd9pU0QM3iPjp0aP3p0CkXRSpR0Bsujksu6zU/KbWoVOmOGAYjo2d3nZ8LL1F6o+cu1v7CwboRg4wgZifRZzxYaZWKy7tgZwJr2RawHwu6FLfWu7o/8i4yWmM631EvDshV3kPQQqIr3r8vgJNZFDoNjiFNtg09R50iIra6Tf0t9gc62RD7LJtpTqsvCzhdI9VJKVogyd3r7itSVkDSoedG/EMYUWSOC1dPx+RPmcpvY9iaeakOVZqLEdAOBJ7etImD1t1/KiTpzLxNAiL7SzVDIlUr7KOifDGD8neq7j/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv/NbIlD0mz3/K9+OrFPp+jmJock5likMKhmyvEq/34=;
 b=ZAuGSceR13d6L1oSjj+NAmdsl998uLfHj5u97B3JZ5zWhVu9NWtGr6hrb/cWN96D2YTPNUHTZvzJno/MBDb92ozk/6jT2mH3RroYBzIj7C82SkkMOLBoateNjMWc3WoeDbfIVBvocseCKTn3oBO7FRvAUxRJ+bHoxVcbPFRf8xcm+WS0s4oicm1ogsfEw2cgp05dV7mkYO4keqW3+yMWaBa3GHNZvNrbHNydu95FgR7ptVJuL15l/x3m6vhIv44gR1wInzWEQ7U4c7wBaGFPdzmWykr6bdOyN4cRDSxpFYTzhmEQzxhDFBMBLTsYBxROqRIckuweWP5m7qIBlu2vnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv/NbIlD0mz3/K9+OrFPp+jmJock5likMKhmyvEq/34=;
 b=K7G8cBSEXFYMwa5m4TUR0NKoyZhmPQ17VIKWJVg8/gnd8bf+cgU5+EOonLQicahsfHIHoEeeQP3E/7kBMbkcus9922kk9r6Yn/SainQ1Q3ot/zj1HV2V2/+qOhwB+dciaY0s4TZfMC3sgW8BJCGiVrLtlA/HkAmymDaaDxiwJRM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH 0/6] Introduce VirtIO GPU and Passthrough GPU support on Xen PVH dom0
Date: Sun, 12 Mar 2023 15:54:49 +0800
Message-ID: <20230312075455.450187-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT109:EE_|SA1PR12MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 37780bed-cd91-4f8e-bfff-08db22cf22e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5KtCpYA2Pqf8vDD0OMI1xnNxTJLixImkxMSI4pLbbF7AYwIf/ejzfcXeYcBTfl9argQeGHbpJ6AITcobFqwkUH0bqQvD+Auf7HcqTqnMS6Epx9kxpRA8RrmOru0LgLantcAgamfYUvW/2YtXqezwlsdshT4pjttXecR9I9oYAV+TP6PxFD0Zw0VC29gyjsWe9Q4l3x56Q1f8c1trO2LN6GCjiYR4hj29L/4KNnkqax9JMZM36tRBsyYuszmccpLJYJ9sZFsbH6aTK3w7A/j0+m8V9VnnOBvIrSRH9MufiAy6fdCG+lbfZn9k4xz80gW+Pyzx2Av3DMGeMjPHFbh+qLfY+sZBA3D5OxxtY0PnngxLSg2mXJpu/gUS14boQr+9vLSXduXyVhrj9DjZkOoCBKwGctd75/7kXRS+USfMyDmDDU//TNKYlNBz1syWygTfp6GUL4RpdnVPdB7wSXmFxlxzL2kHaFWeNICSl7gtEC9FdetX45PuXH7O4Cx2dpnnoGH+ss+/HcqTZoGE5YYO451BvXSrOKKjti35xA7BW+k2NEkMtsETfjge3Dg1BZLhVuqgcMm3r+F/hL+fcFxn5vIxouu473kmPe6vTL7erCvJHglp9DkNeRFQL6rhJA0jGUpTvn6eyuqemkwQX85uZpErOoQIonqsNMsCBNV61Fy20VyVgorUuhQy7erElxqVnu0G4YaR4akb9FgNa2BHyemu3hU9LE0JfqWMVSl3N85qWfffvhoCOogKxJTlCOJrDRr3w/yw5H0tPxH+M/gzqtPMAgvRPfLyKvd+KW/RM/E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(5930299012)(110136005)(2906002)(5660300002)(26005)(1076003)(8676002)(36756003)(70206006)(8936002)(356005)(4326008)(40460700003)(86362001)(316002)(54906003)(40480700001)(7696005)(478600001)(966005)(81166007)(426003)(6666004)(47076005)(82740400003)(36860700001)(41300700001)(336012)(16526019)(186003)(2616005)(82310400005)(83380400001)(66574015)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:24.0380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37780bed-cd91-4f8e-bfff-08db22cf22e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6728

Hi all,

In graphic world, the 3D applications/games are runing based on open
graphic libraries such as OpenGL and Vulkan. Mesa is the Linux
implemenatation of OpenGL and Vulkan for multiple hardware platforms.
Because the graphic libraries would like to have the GPU hardware
acceleration. In virtualization world, virtio-gpu and passthrough-gpu are
two of gpu virtualization technologies.

Current Xen only supports OpenGL (virgl:
https://docs.mesa3d.org/drivers/virgl.html) for virtio-gpu and passthrough
gpu based on PV dom0 for x86 platform. Today, we would like to introduce
Vulkan (venus: https://docs.mesa3d.org/drivers/venus.html) and another
OpenGL on Vulkan (zink: https://docs.mesa3d.org/drivers/zink.html) support
for VirtIO GPU on Xen. These functions are supported on KVM at this moment,
but so far, they are not supported on Xen. And we also introduce the PCIe
passthrough (GPU) function based on PVH dom0 for AMD x86 platform.

These supports required multiple repositories changes on kernel, xen, qemu,
mesa, and virglrenderer. Please check below branches:

Kernel: https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/log/?h=upstream-fox-xen
Xen: https://gitlab.com/huangrui123/xen/-/commits/upstream-for-xen
QEMU: https://gitlab.com/huangrui123/qemu/-/commits/upstream-for-xen
Mesa: https://gitlab.freedesktop.org/rui/mesa/-/commits/upstream-for-xen
Virglrenderer: https://gitlab.freedesktop.org/rui/virglrenderer/-/commits/upstream-for-xen

In xen part, we mainly add the PCIe passthrough support on PVH dom0. It's
using the QEMU to passthrough the GPU device into guest HVM domU. And
mainly work is to transfer the interrupt by using gsi, vector, and pirq.

Below are the screenshot of these functions, please take a look.

Venus:
https://drive.google.com/file/d/1_lPq6DMwHu1JQv7LUUVRx31dBj0HJYcL/view?usp=share_link

Zink:
https://drive.google.com/file/d/1FxLmKu6X7uJOxx1ZzwOm1yA6IL5WMGzd/view?usp=share_link

Passthrough GPU:
https://drive.google.com/file/d/17onr5gvDK8KM_LniHTSQEI2hGJZlI09L/view?usp=share_link

We are working to write the documentation that describe how to verify these
functions in the xen wiki page. And will update it in the future version.

Thanks,
Ray

Chen Jiqian (5):
  vpci: accept BAR writes if dom0 is PVH
  x86/pvh: shouldn't check pirq flag when map pirq in PVH
  x86/pvh: PVH dom0 also need PHYSDEVOP_setup_gsi call
  tools/libs/call: add linux os call to get gsi from irq
  tools/libs/light: pci: translate irq to gsi

Roger Pau Monne (1):
  x86/pvh: report ACPI VFCT table to dom0 if present

 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xencall.h               |  2 ++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/call/core.c                |  5 +++++
 tools/libs/call/libxencall.map        |  2 ++
 tools/libs/call/linux.c               | 14 ++++++++++++++
 tools/libs/call/private.h             |  9 +++++++++
 tools/libs/ctrl/xc_physdev.c          |  4 ++++
 tools/libs/light/libxl_pci.c          |  1 +
 xen/arch/x86/hvm/dom0_build.c         |  1 +
 xen/arch/x86/hvm/hypercall.c          |  3 +--
 xen/drivers/vpci/header.c             |  2 +-
 xen/include/acpi/actbl3.h             |  1 +
 13 files changed, 50 insertions(+), 3 deletions(-)

-- 
2.25.1


