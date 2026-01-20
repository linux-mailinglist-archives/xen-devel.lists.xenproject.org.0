Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803DD3C435
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208565.1520739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8RL-000743-Nu; Tue, 20 Jan 2026 09:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208565.1520739; Tue, 20 Jan 2026 09:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8RL-00071o-Km; Tue, 20 Jan 2026 09:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1208565;
 Tue, 20 Jan 2026 09:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8RJ-0006Yj-J2
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:54:21 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd3d2d7c-f5e5-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:54:20 +0100 (CET)
Received: from PH8PR02CA0037.namprd02.prod.outlook.com (2603:10b6:510:2da::35)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 09:54:13 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:2da:cafe::69) by PH8PR02CA0037.outlook.office365.com
 (2603:10b6:510:2da::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 09:54:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Tue, 20 Jan 2026 09:54:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:54:08 -0600
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
X-Inumbo-ID: fd3d2d7c-f5e5-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyvFWv3+VBwTDB5ly/AP9wyGd+/7w/KDiK488McpzGROGreGOws/ELXAdwJvmh6v03k8QLewq+X/PQglv/rHY8tTmbYgP9D+KM5Ao2/zalvwASpORK2X52ROoECvgA4nGtcY9745Den6XuO3SpKxBnCZgiJANdYgrypiDS28BYGJmD3ZwPE3rOWfks94iUX2ijRJzEtpEX5Dq1LejmvRhxspU48RW66zh0hlBcZ4eV48JQkA7mdYEb/1mcUhRD4QfH9K3yDKAi3ExkCFkM8+BcGRz3ougucWdt5/eJRAUYOIvnqaIHlrHrkLKRfo2wVvQ81ORddDaCyTe4JG8UoxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlelRD0l8IWBcWpAH3Cc0918m2Klv7LDj+1fptSjsws=;
 b=JiIA6TSQ3fm68JLI7oqZLabjgvnVwgvTbEuCaT3i7cQM2XzPShXpBJAm9cdA1Xi2Jhnb0IfQ0QchUVlLVgbUnyQzutqFGCGv+mqbAjCtq+eTiNOiPrEMk7qi813eeVYPtLn5W7oljsA+Pl9SB2l3lKQCd/gXfq4XWVsB6XBTumy7tgUq9bNcB58aN87srxXvpdD5yX6nLl73Ykvf806Ckqaajz+c6grxZJV+WD0CZvRaldkwQkUUvpkdyBRblVzVERzUV6AkMayC1qQDrIcLuE4PTAd3jfCEsPusGhBRKnLPgVJ28EAwkPukeN48sCPxYha265mzxrVq8WIbDIQNWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlelRD0l8IWBcWpAH3Cc0918m2Klv7LDj+1fptSjsws=;
 b=LdIfjEjEmXkhQHzcBU31sfI4YEi/dgN5enPulxU+GnKDVjarBcOeDxk4awEvwv3snMkkZCeidV/oFQUMwZMZ12Egr4LBLRWIVjxuVzFuusl+0wWNZfRqABR0Ydoaua2I/jOsg9GsVcLL3URaNZ+YM8HXfq9J0tuhQvoqzq2VZLw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
Date: Tue, 20 Jan 2026 10:53:50 +0100
Message-ID: <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 8120bafc-1136-43bb-938f-08de5809dd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5mlqNkf/jsJC5sNIfaNBfTddN9Fb1Qjukj0fw85pkvyBGbwRigOftA6grPK3?=
 =?us-ascii?Q?3xuFm+IB8QVUy73eXsVWkQsPci0QLPJlBjfJiQi/x7WgPuybhwdUoDpL/ErS?=
 =?us-ascii?Q?fNQux0cLt1XXomfY+yOKINb1dzZfwjcR14CN8YcQ7GPUlZH4ak4TIJ/SRz6o?=
 =?us-ascii?Q?qjBrs3E3U9JEXOyjREm41ufMb3N/rFcpjmvMADx+GLeuxAwRpaZo7YG//G8v?=
 =?us-ascii?Q?kJ8GtPPEEa5vzWeRr10w3wV/caF8IaVhQgUwCrDx1THPyEGDDNLnsCzHxPQb?=
 =?us-ascii?Q?G60UhX8UMHF3GaTczpPooR8OTSjscwMztVMVlgsUo92Ik1pWbeRrfIbm0+TJ?=
 =?us-ascii?Q?51+MMM5XLLpu2rt4zDklXCpDOUCi7zLkh8cGHI9fqgNUJhJu2hwkOJiPacVf?=
 =?us-ascii?Q?l9etZk9syRabUoLtcwVpidz3IAxXQ1V93DlrpRzxURKG88/+K6kStaZlXHEb?=
 =?us-ascii?Q?uNtktBaD/QgqcDZQalObZd30MTRlKJlwSIAPcZ2UWaL4prTr8x0WbOuMaok1?=
 =?us-ascii?Q?2RQbNxHoIo81ojof6eWgo9SN2mMPt+eR8Htmxs0CRFQDmDfN7W42pGPVBrX+?=
 =?us-ascii?Q?9EKoaKMz/5gtrHuRj77G33FT/JF6BBNDspL4kUMhuTru8JZE7zDUvtVpoDaO?=
 =?us-ascii?Q?q4fhGoOTD8/jw3Wrrwytbs/y3YytXSViZVv1SppWpLxBxDdN/D6CkblY965x?=
 =?us-ascii?Q?cbF6lj5Zt9rqL6leq1a25KfE+MMHkvqZUPlAtD9nfFrtFfzGdf5zIEekxk3p?=
 =?us-ascii?Q?BAUzZUcjE6qb6AklfzMVUiVnuWpba5UH2Xo7yy3cM872lVXziZAZdivDkJyG?=
 =?us-ascii?Q?my9OEQ3i/uGFsU0UkFI+Omk9JmiS7Y9Fkva5wegYdc8SFdcCpduTKLhVmzeW?=
 =?us-ascii?Q?1lyhnyvR7hCcu4KZCsxC37sOHviOPL8/sdLNThyP+sCYsm5r5XIDjMaKkwB3?=
 =?us-ascii?Q?cEpfuE2yBlqOETIyTpnUVEuFQ/VSWGVk9TK92CZmIr+gon6d55n8lT3iUITf?=
 =?us-ascii?Q?Q6d3wWITRLlgy+rMouzUmUH48goJJ/hAP0AfksV4pJnFFPD7+Nr/pP4AxqmO?=
 =?us-ascii?Q?npDvM9h3+BSTOCRlZNZuKPacsge4agKBp/kbyi7i1kBb7RPR/pAqXCjWzhg0?=
 =?us-ascii?Q?KNOT4TWNV/Ah1brO+wgD633hbC+NNZWF/FJ77Jr+WQ0TPjmfww+Wq8LDJW+R?=
 =?us-ascii?Q?Qr0CPibV7mXMUFPp0dijKY636exRDcBrTJuGNMinoMTMKbHn9XbGJmPTWs8r?=
 =?us-ascii?Q?FvDMlICe10ETRTVk4DKX8oi2uwSqalt2QAhF0h/v1XsDKudy6pHJCHJqEeia?=
 =?us-ascii?Q?vf2GXd30S+RrAhDgczwZzXfNVovxCSpa+4yaPRRjmSAZ8UnNR3IeXuCnKi0E?=
 =?us-ascii?Q?U/eIvnWwKINz1V/KOmByLIJHZ5eQlxt819paRB80BMpdZwAEfu5o+Xgc+DEl?=
 =?us-ascii?Q?/GiKrGYe9NysF6BY8eTFo0pQ5D9SM7Z776BTUQ3W4dks+tz++ADQx/LQx6z/?=
 =?us-ascii?Q?ly+j9pQev9BofVx/VfQsYX7RcmRs8mK647Vk+qsgUqu7jhbT7zhVQtQ2wtOM?=
 =?us-ascii?Q?+w63V2kwp6kUK81W3CPT9lTpp1Zb9g8u0Naw5o4PoAPB6cSK2fF1wmGRZFox?=
 =?us-ascii?Q?D2FMBCDVVG6L207hNTw9S1U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:54:12.5677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8120bafc-1136-43bb-938f-08de5809dd7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814

With the threshold initialised to 1 the guest exits at the first
buslock. Initialising as zero is invalid and causes an immediate exit.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/svm/svm.c  | 4 ++++
 xen/arch/x86/hvm/svm/vmcb.c | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 9748df87d8..dbb7f99d5e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3087,6 +3087,10 @@ void asmlinkage svm_vmexit_handler(void)
         hvm_descriptor_access_intercept(0, 0, desc, write);
         break;
     }
+    case VMEXIT_BUSLOCK:
+        perfc_incr(buslock);
+        vmcb->bus_lock_thresh = 1;
+        break;
 
     default:
     unexpected_exit_type:
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index cbee10d046..7a19b1ab61 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
         GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
         GENERAL2_INTERCEPT_RDPRU;
 
+    if ( cpu_has_bus_lock_thresh )
+    {
+        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
+        vmcb->bus_lock_thresh = 1; /* trigger immediately */
+    }
+
     /* Intercept all debug-register writes. */
     vmcb->_dr_intercepts = ~0u;
 
-- 
2.43.0


