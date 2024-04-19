Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9384D8AA781
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708683.1107745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKg-0002dE-VL; Fri, 19 Apr 2024 03:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708683.1107745; Fri, 19 Apr 2024 03:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKg-0002b0-RZ; Fri, 19 Apr 2024 03:54:38 +0000
Received: by outflank-mailman (input) for mailman id 708683;
 Fri, 19 Apr 2024 03:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfKe-0001xW-R4
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:54:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c1043a-fe00-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 05:54:36 +0200 (CEST)
Received: from CH5P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::14)
 by SA0PR12MB4479.namprd12.prod.outlook.com (2603:10b6:806:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 03:54:32 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::3) by CH5P223CA0024.outlook.office365.com
 (2603:10b6:610:1f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.29 via Frontend
 Transport; Fri, 19 Apr 2024 03:54:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:54:31 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:54:28 -0500
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
X-Inumbo-ID: 88c1043a-fe00-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ncl4CsZ+fl/HWOKsSp7YSU9XocqxKQeoOYdugeZrnJgRqHXv6/v8ApNIbCCuRE5kDS+Zj2ZRpPUDA8lqeaxWBiQMa6/BnAWsPzwGAuXtO2CFGR8A+tWEdLAnb0okeRWVRscaTzCON9k2lor8x5SP6TdOSJlng0xztbMpKyxGq5/1TnqbleXQvPzyDYhtPMxAJkccwXMG+KvswFSCFM1jQHZ3h44ovmQFID7XyOlzgB9D+AUuzy2SusGPFCnw5Z1Nwo/TfS451DLv9YHn+W4eY7ANAWJawtKALmhiFh4mh+3DqFS1/sM2iPGUzFD0mFJ4uZ7Bw6rmfQA3niS0LyIYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cppfuA3qPefeFbRlxjFzL7F92H5/rzEberk3T4m9jZg=;
 b=fpFEUKq8FBX2rq/0BUyjXDTyt7IYl2a6+4fzGhCNG17Yew2jkyZLIX3xyYQXYM1b4ct41t4tYW4ykkY8jsfk/py74T2LdwhZmHnD5ZB+gbBS1uHjMG1lEmfwn6nCdTdrsQ7YJPhSf3JM1vA6AwqHjvCtPE7/AdYAWUly3pibviazhNCLcNzt5fMDrM0rqserR1L0elVZUT/WQ9rrMldcnVWz2NtsJSeVZNVfvfwmQdPl3suemY8pmsfE080YEVlnpDxB2aMz/s4Zh8NAdPw5ielLu64Xmd5/Rh9i9fv0GQKHSUbZkzbfbjPMD3bVh/m6qTwW45WKeZh01qnSWIy28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cppfuA3qPefeFbRlxjFzL7F92H5/rzEberk3T4m9jZg=;
 b=eTAnLn7PmpnD1SrXaQ+WPiELOWffjGuqJgykMBTX5DdseW6FktWpv2pxeBT+xxLFAaSmWfQYrhpjHChbRizBHGNYSrS7uyseDUb5x2Z0OV2pIyywqF+R01+2ILdVHHBBIw7eHDRIKLTn9UWaF7u0sKUN6RvXTsRF+003rkgY91w=
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
Subject: [RFC XEN PATCH v7 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Fri, 19 Apr 2024 11:53:38 +0800
Message-ID: <20240419035340.608833-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419035340.608833-1-Jiqian.Chen@amd.com>
References: <20240419035340.608833-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SA0PR12MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8c7bec-8562-4b10-d303-08dc60246b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EoMBLbmlBGSW/IulxGkFxgv0C6DxTW/Dcpm+ROqQ5xie0deFe9MdEDKyi9BH40iHH2/sobbx5g2h/Dk0x6FzRMtPtg8p3enJgykxjyiAdiLmHbkkhf79pJzB8EpsHZVup+8WiEvRArRZRU43seo1WND7Zz078UFa6dex6SNfsBMaP2KEDCXknSGzMR1swN6FxbHtVCL6guSE5fK/YXv5Mvma0dHmM0pk7MSh0v9Oap+uHjtoDxTDygBpT+1FqD0rN0bRpMTJeYI0VizXvZML1w7JoQmRcoeN/Z+po4jIWeeiKdq8FjLvor0VgDXusEdyeCH3dD2SeNbEse8YjNvv0aZKLfk+01nbgK7op7wCjlicHpT50OxiU2gkEsx+zelgH0rGBZSwdAOBNFiDURwpaOYfCO3sadcCovTb0bTU6gbeD+IG1lje6wXB6NIoXi8XBUSfPzFmv2XgKZMZE5Q3Zli26Wf9/Mw+OKf8qfaKhGmp1ziUSeFQ76f3E5gDl+wu6q/b2Q3Wk7wZTg2/RWhCGC4CgxHqwKpgshlD2ZirHsww4WVqEBWG1qZFKGnQJBzAwaMwJasHmb2XfB1PKvSZxw8cn4t8IujqI9cY5SZVqbbQX5hjg9I4ibRUUqq7Rbl98HQqLk41hlTkJz7NQSIoJUy7fdydsQbCCAYZXnEJk1yflEb6gbIPsLWPwvALYq1cy+j+wy62+gfEXqcGZtyNrpdRQNxjPhzRZSOPFnG6pYdO41hyMuiVWzOpJY5Jg+Br
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:54:31.8623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8c7bec-8562-4b10-d303-08dc60246b8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4479

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
index d49fb8b548a3..98e3c6b176ff 100644
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


