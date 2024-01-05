Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D9824EFF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661984.1031870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLE-00022a-5k; Fri, 05 Jan 2024 07:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661984.1031870; Fri, 05 Jan 2024 07:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLE-0001yP-1A; Fri, 05 Jan 2024 07:10:04 +0000
Received: by outflank-mailman (input) for mailman id 661984;
 Fri, 05 Jan 2024 07:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeLB-0000zx-ND
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:10:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe59fe5-ab99-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 08:09:59 +0100 (CET)
Received: from PA7P264CA0365.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::18)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 07:09:56 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10a6:102:37c:cafe::d5) by PA7P264CA0365.outlook.office365.com
 (2603:10a6:102:37c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 07:09:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:09:54 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:09:50 -0600
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
X-Inumbo-ID: 6fe59fe5-ab99-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWNNWv8hN34QhIJMkKPtzV0FPc7MvzmLSMCmy9gPv+Nxjj/xFJKoVIkdm1HOp+TQpHp1srsmu7wUZPQK0vgbAG/hjEnjt8xnWjyPe0xema9kAtjRyjtOtCZqZXNn4Ro076uZnlJMZxUVZ5mzl+NDNKb0YEKpwOsONjjc60fEPrh/K79hvyUcLZZS1Ud813WuHdqy+sCpSrriXhwi49l4IxfHDc21DeseuraMYJwbMUXjWw3bNmqjUXam7mxNGZHYa//QFri4nnnHs2SK1bvrL4lhJr3LLMZ90DywXbtncgvPfju40mcS+ZzuCqEE1b7dv9qlG06bCPJLu+ZA92Ul+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmRlmS0ceKu4lnk3o9j1hrAbxc9dIx9eF+B0pjAKXWo=;
 b=VYnTDX+t8pHDViXX3/gxOpVYMMaCULWa8vfADn3jhZ+jnihCg9xasSU/ftjq8B8pYnJKt+DYfPQn632f+gpx4hWx5NK0hqJ/oR59rDkJbQMXSkwqT715KHMY67WH37gTW3H0VcVgvA6eJsym+vMqtYDYm0f30v5iK9ALwE0ULokdieLPHvYqs3+7XJSTBUIQTDRSZYyiCd9s2oTibnDZsN/73RQ1KFxroNb1qPqGtpYkd0DviGVTvqAcSSEeT97ILRVJcemYSFnVj+7ztXwjIEQtRwUpUlia7ZkiQsZYdxfGeyeQ5oO3dqO4gilGtgIXapHyFGe9k9SmqfpTgyUk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmRlmS0ceKu4lnk3o9j1hrAbxc9dIx9eF+B0pjAKXWo=;
 b=V+4voI1EvakpvS8FjJwV/9Q7Y7svzjNG15EpjTFDpuSCsJcKyQLjcWg++yKPIDb2hIn0hRd15K1s/cGdrdKaOvLxuRtTBLNWmoYK9CZ79WXpKS8V7GUOChBWCMruuXIKrAJcnJfhnujS4JJETQJgUo5pwVbwsbfx3OxCjBUMZrE=
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
	"Juergen Gross" <jgross@suse.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v4 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Fri, 5 Jan 2024 15:09:18 +0800
Message-ID: <20240105070920.350113-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070920.350113-1-Jiqian.Chen@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e9be3b-8632-454d-3bc8-08dc0dbd519f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kRj9lZv7kay1ZNy7vv1QeyUVVO66pwZagvLjbuXKh8uIfXj4ZKGCBRRCoq+ndZ/lm0KQu6gZbV4/X8vP1z/JOK1lh7oXES4OzVjYQM8qifFqC0mT0cuHlSerf4UAV9OCs46lpiYcpJP7GnkwoferMD+h28y9vj3fIk477nRzCRayOg+GL3upJvu3bfVTdVbX1HWX4lG7+ucP6+mXvmlBaG8sSbVUBRSlAhHpAQoMkO3ArmC7PsObGz/YfUV9YRiZpWe1wgxj35ojOfIfmeMgREoML40yT9zVfR8NWanDJmmXA54LTXcbiyu9435DgEdFl4l3/1OZQ4GX0VgDZtIp9PiYi9EtXXSqt6UzWAJnEzV9aybZr0V2BXONkV0TkQSn27KT1EMt5Cy/d740dym7FWDsdEd17g/p+rR7Ub6mF4mnqUf4N3g0XajQN1OjcmObmEFch+qbK9u8Rrr5rhRqShg8XEstFoHOMnZWYKRKFso5VE0O6iL3ZCWF3imLuBEqoso5HpEb34u1oewy9z14ROBTyU8vtqQiQxBsN4IbBmnM+Ypq3Nc9XkNnFDHkXI7u/VRp3+FRRYzC3SdRoaxqeY9F3rRUBth9vtpVspCCAnmDax9mWUH8JdfHgb8nH7iO42GuHPjGHls7AR9p3Dql/N2TMYPklsGEwnJZQ3WKqDPz6oRL9oveQ/PKB//DU1vSpq3e7kuireGyVuS/X+Ceke26bTGdYyjRG4Lr76/GkSSVFwPutW2oiE5CWqQAOZPszwIUfsDcFdpK+9v0+Y6srw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(46966006)(40470700004)(36840700001)(82740400003)(478600001)(7696005)(6666004)(356005)(8936002)(36860700001)(26005)(336012)(426003)(16526019)(8676002)(1076003)(47076005)(316002)(4326008)(6916009)(81166007)(86362001)(70586007)(70206006)(54906003)(40480700001)(2906002)(40460700003)(4744005)(7416002)(5660300002)(36756003)(41300700001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:09:54.7419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e9be3b-8632-454d-3bc8-08dc0dbd519f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272

On PVH dom0, the gsis don't get registered, but
the gsi of a passthrough device must be configured for it to
be able to be mapped into a hvm domU.
On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
passthrough devices to register gsi when dom0 is PVH.
So, add PHYSDEVOP_setup_gsi for above purpose.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 632a68be3cc4..e27d3ca15185 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -97,6 +97,12 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_setup_gsi:
+        if ( is_hardware_domain(currd) && !has_pirq(currd) )
+            break;
+        else
+            return -ENOSYS;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


