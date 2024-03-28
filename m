Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAB88F7F5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698789.1090937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLT-0005u2-Nk; Thu, 28 Mar 2024 06:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698789.1090937; Thu, 28 Mar 2024 06:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLT-0005rU-JC; Thu, 28 Mar 2024 06:34:39 +0000
Received: by outflank-mailman (input) for mailman id 698789;
 Thu, 28 Mar 2024 06:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpjLR-0005pJ-S1
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:34:37 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e28000b-eccd-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 07:34:36 +0100 (CET)
Received: from CH2PR04CA0011.namprd04.prod.outlook.com (2603:10b6:610:52::21)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.38; Thu, 28 Mar
 2024 06:34:32 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::ef) by CH2PR04CA0011.outlook.office365.com
 (2603:10b6:610:52::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 06:34:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 06:34:32 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:34:28 -0500
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
X-Inumbo-ID: 3e28000b-eccd-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRD5/CNo8tEudCDKDsIuQIcWFFaQUnVDVi/iXBdPM+NWzo65vVR57KqiFEzk9Cn+b+vSXOuoWjp0H/xw7BdWuRC1OMKeikZ8ffYTsl99a/iTCvJ/87vDIDF+E0gxSfhUfoeCjwWIyU27Vd1M9URAsJKf6JdXVP2yUd2yc5vP9ykJmbNS81mzSpw7IpbD+iyxY/M6CFsrE4YU9ZyaqXTeOMzaedAHDsrEPHXNIHC5zDz4UQZoExkfXYgRUJ1qOsP4R0XTMHx7r12FnCAEQakgp8zomuGE1uCUy/l7m+lhrxrSSeT2eKAJxskW9ehglO1Sg1KYnckKPWjDByG2aEDlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Be2hEGsTRGFzCRd5+cpODeHi2HnqaMir4kjvUmtAU34=;
 b=Ja3LQ4mG6J+ADzJ1/dZ3KQ3pmOxNBM5OjCVLdsRh83oKv5y6r6UmggAK+92a4rTu/PUD3jHWsdwTfaiZQBDAE7bHfD+nCr7hNgF9iz6bBsSQE6xUioaTYjNr1aLF5SS6mcn+K3G8GBilv6dF9D2SMXrkko1lJ0s5uQb8i3539fsAcrCEfBflvRrEo65dXZH7UkSwzyxy8Cj9R10BYANcverfoo1NdICAh+P+lvnmLN5HChhJxzGRkkXjKPWi4ZKux2lXp1CKv3X1hxJt1g4sTzRkZrQVEitWZ7e7LHnMbhhga5RLGX53l9ZopkS/5S3TtQ4I1gFIL3aJsv5IMrImNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Be2hEGsTRGFzCRd5+cpODeHi2HnqaMir4kjvUmtAU34=;
 b=C7KuzfIimxpNZgkJQp5NVOZvd5NeHzt6JGIJ5rpRRoO85cew8XMo4GR4ouXUiFLoSZefYMXu4rxCY1wnGJHzfBmNQ5Un7dfsDj4zpVJ9l1vMYevHorqRCXXtfNq3M+LENAt7yRR2KsRJ6qTn8MTuqQu5urweEpTHqgvAkSOdtwk=
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
Subject: [RFC XEN PATCH v6 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Thu, 28 Mar 2024 14:34:00 +0800
Message-ID: <20240328063402.354496-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|DM6PR12MB4107:EE_
X-MS-Office365-Filtering-Correlation-Id: 10bad40a-388b-4725-e293-08dc4ef120e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e9AShgNFlrKvWWSwwtR+kmyhcjxD0+DxjV/YFBbvoiPMzCqTxxbbj77mVG1SFirgVB6ioJ0DYHtc9DBESATxWVpep8hCMna5onDYXH7cZ3KHjyXJ5DUKVpZscJUgPhb+DrOzDVQbh8V9Ay8ywwNDzm+WgORs0cbcudC7FmPnvJ/uBbS6FGh7cDXTTPIJ0Jt0BN9R3ILBXlgcfvLDcy3ywQdbL+myoo2LugJYd8kNGHi9BU6lCjE1gA4mszX95JnnguMHD8N4dtQIJK4Y5o/WtHNrerUknBYxvxNsJKWZa6lN6y1ybuR5w+krRaJB5myO7kWlDX5Bk80JDMLmy4sJTNSWRwrb+e6OCxl7GKTdDBPast9eR1+KsXd/PNviH0VXCxrSxX3xyd44geutveCkNbPNOqdiV/dz1+oWAlbyZ72kHPAKeCrG+ZxjrBrvrhoHyiROr0Xo+tO+v8gltxe12QomQ259BUVI/1uvJaBVyovzizMMssUdbr2Ww1/jiJvCIIDhCH1j5AugxkTFgtmT23mtIl4yVr5pfQ//ztwmhOpoZns7P3VxE999WZRbQNx87jLls3gin9uijdymkQttqiSYgEun43ppHfQRXtOLStzwER2XDzFqbl86krkGTAkGCj+3zfDWalnIy7JGbr1weH8ySn2gU5wgKyFyRMl958Ri+tVpK2fxAcEtmY8i0289q8Uwc5gC9Z98N77y2IZ9cqHY6JIhrSOuJGUluEGNoxFJyNGZB1+u6tJYu0nOQW4D
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:34:32.4902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bad40a-388b-4725-e293-08dc4ef120e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107

On PVH dom0, the gsis don't get registered, but
the gsi of a passthrough device must be configured for it to
be able to be mapped into a hvm domU.
On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
passthrough devices to register gsi when dom0 is PVH.
So, add PHYSDEVOP_setup_gsi for above purpose.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 493998b42ec5..7d4e41f66885 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -76,6 +76,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_unmap_pirq:
         break;
 
+    case PHYSDEVOP_setup_gsi:
+        if ( !is_hardware_domain(currd) )
+            return -EOPNOTSUPP;
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


