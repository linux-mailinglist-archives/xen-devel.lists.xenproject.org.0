Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80444A74A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223711.386618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA3-0003Tk-Ne; Tue, 09 Nov 2021 07:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223711.386618; Tue, 09 Nov 2021 07:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA3-0003Lp-9l; Tue, 09 Nov 2021 07:03:15 +0000
Received: by outflank-mailman (input) for mailman id 223711;
 Tue, 09 Nov 2021 07:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkLA0-00004s-PF
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 190b3351-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:03:11 +0100 (CET)
Received: from SN7PR04CA0171.namprd04.prod.outlook.com (2603:10b6:806:125::26)
 by CY4PR0201MB3619.namprd02.prod.outlook.com (2603:10b6:910:8c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 07:03:06 +0000
Received: from SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::6) by SN7PR04CA0171.outlook.office365.com
 (2603:10b6:806:125::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:05 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0011.mail.protection.outlook.com (10.97.5.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:51 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:46 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9a-000Ga6-5E; Mon, 08 Nov 2021 23:02:46 -0800
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
X-Inumbo-ID: 190b3351-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uw2mqBsT/podGjo0e4HbCsdiW99Hcw1Rt7XMZeEqG8hiSpWp2PK8IWmbj3DFma3PwGORhy5E4fgRITB/e1XvHwzFH/uzxJd7i0ENemAXq20Oblr7gDYPjLpMW4EN3A1m0W6eKlkrf7a0XN2/pxlxN6gXitXdW2j/l+w1xVAYnCWZ9e6ibM8+xIx7cDJq3uEio8EuMKRWThKWTOG7weO6xWLgzPKlwYkL74hnzLdltRIJ4wlC+Tiuykx62S6qhB5FXP1r5wdo8sT9f+XYAEuJlFP0AQnvhQw57Ib4Oe0nYsj4/+5yiHIM8WTe74HsFES9y8yoIhvp5UeLLEZIkxA0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VaOJ+8GZMWgZHrNqEq58Dkcy6TjJZGMbhhxpS2T/S8=;
 b=S/JTK4k0UjCFIQrN5hMZyZDlKfODoOXA828h/j6lDJhQ9+MIkPb5VXNzECkNRB3apLOohJKO0vGfoSVbRkoXVRd/NVGOowDsw9BoAV1GeaCaVEtqQKVRM7DSmWWEQMDUDo9nPNSvoGuNqcbpi/OquGha/NtTcd7T20uCgBwgPT7FUd65lWsol3rZ2lpw+P8YGEFAvp2T/LccMC03zWE8acI4wgyAD1wJ1Agt79wgLXx/WzIyKgOyLvIwVehXAx7ZtWHoSAt4pfWETXXDymSFlx4OfrxzxWhPVcPhlalSOI0fwx8FMY3XAGgVLDv1Ijfo38/NriSGXDLoWMfb4MUvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VaOJ+8GZMWgZHrNqEq58Dkcy6TjJZGMbhhxpS2T/S8=;
 b=se8QdvxRM1TifQvWktH8CQlke+U+gReTn/oD3IJ3h8sEEv+7TNqMWDXLLUtbQTroSxhMcyp3v+74zs+gs9oVmq9ajpimEr6LSGLE2PNchcMxT86w6ICOBaHfMVcixURIXEBE19YtC9vyAx+KdSNhWO8mnLWtfgHSlzfCJTodyJU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v2 02/12] xen: arm: Add CONFIG_OVERLAY_DTB
Date: Mon, 8 Nov 2021 23:02:17 -0800
Message-ID: <1636441347-133850-3-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d47c434a-1be6-4998-83d0-08d9a34efaae
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3619:
X-Microsoft-Antispam-PRVS:
	<CY4PR0201MB36191C99BB3778A8097F2099BC929@CY4PR0201MB3619.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aXnyCKOHAw8E+QF0/lfWdljerbM5thMYCcyCqHzO33D19myJNrXe/Djn+pleYNT9wJ5Qh6OluB96HA8rIeslJMucqRws6koL9t66uE8HQv7ib10v0UEcealb6+jEfg8pxUqWrPZOjjRuVubSuSO2+TSxlWxtebpMB6kY9xw/Kd1akLhbTyqXw3Y1u5weDdyBuduGQE3NUJKk/kj7aB/QrEVB2WgSq9cWgch9YVujn7/agPYmgPObx37oYbX62mO1DYgfsZMd+kCt25567JXJtSQuYue0uARjzVone9qGiAIPx9h0VexyKGdVnJKysWB18NUhvir3Iwa6tte/7AUEahZQ+83IGK1Ke1+nsA2RHobJibgvlo8+C3b7b2oUS8+ShKjCfbZCzjqIaYOgkrB8v9KNggZ7NmUHBJlHsYNPePbBvOY8dTblfDnfj48mLrfmcfzCfdgXLRIOoLMXEXnfSKmgDsgER0GlZhv+23zilFwsikfVCNsu92ddNnavVEVCRto8iY24ZwZJ6o14Cd9bQRj/AVHHCbEsQlabD9Pme19dVFsallXHBo2qwOpknS70s3NtNKmUXvYPx6rzSLDVAJkJWnWx+G7lZMYe25Rs4tGzrWJklwd46n1CEGJY7OeCc9HseWY+NmdFoF/1tAyhC7DQZVE7DCp8UPG/CVdiC9PqhIHmfUyG0GANu2WIM3AYoU9ZBowQT0zia6QCyHJYxdSaViRFtr/+ieiNr04S6x0=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(8676002)(6916009)(186003)(47076005)(26005)(6666004)(356005)(426003)(2906002)(2616005)(70206006)(70586007)(7636003)(336012)(9786002)(4744005)(5660300002)(7696005)(4326008)(8936002)(82310400003)(508600001)(316002)(36860700001)(36906005)(36756003)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:05.7303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d47c434a-1be6-4998-83d0-08d9a34efaae
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3619

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa682..895f0ee 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -46,6 +46,14 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC
 
+config OVERLAY_DTB
+    depends on MPSOC_PLATFORM
+    bool "Enable DTB overlay"
+    default y
+    ---help---
+
+    Allows dynamic addition/removal of Xen device tree nodes using a dtbo.
+
 config HVM
         def_bool y
 
-- 
2.7.4


