Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5D6B63BE
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508864.783758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYS-0003Tv-VE; Sun, 12 Mar 2023 07:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508864.783758; Sun, 12 Mar 2023 07:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYS-0003QS-Rx; Sun, 12 Mar 2023 07:55:44 +0000
Received: by outflank-mailman (input) for mailman id 508864;
 Sun, 12 Mar 2023 07:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYS-0003Pk-2L
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:44 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47bc34a4-c0ab-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 08:55:41 +0100 (CET)
Received: from MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::13)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 07:55:35 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::74) by MW4P222CA0008.outlook.office365.com
 (2603:10b6:303:114::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 07:55:34 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:30 -0600
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
X-Inumbo-ID: 47bc34a4-c0ab-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nafOpKlcIRTyg23HgmNgeQkBMxcgPqyA+mEVMtwaTireY2ua1u8PC6QLPlmlBuMGi6VmhQ7RehMi+u2Qe43Pip41ifwt0J5Zojp/glznLBpxoahxYRm0vXyWgKi44gD1H2Tn0FqFN34r0C4qZl1F85kTp2b8eJvmp2y0j1KYWGm6bY69otz2NMFUQo6RggA4kchCeqRA7+GUQ/uMJmP8GvLpM9N4NMXUdz02akiZPA+bLePk/oxVvWiLAt6NGih4d3nQqeUc1KmqPtmDAy1HUaEiyk5/+QKYOZ7Xc3ECDe9xrGTN07kfqN5PH62qIDrEQLDT+QJ+IpiLd/iLQaoaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqKEnNbvS9HCCnWGJMjgGluFe8YkMoLVY+wYZUwY7qc=;
 b=bddKS3TL/Uh7aL49Om9fHR4SkJWUdHk+zXq2qqcdp2fdKjt3ME3JGjg/XIAqEgkWllKbbMyAFetD1ZoArZAuGlPzdGOnvyzSINvW9CfEwz3e1aS3xx0n36AwdJ2H4gxwVsAZzzt08C1eggLr8K7CkG6WM8CA5oIDBY5l2hkRayuECBUJye6WHakHnanvy2O+yGhgsaSSsMlj2kMMquPIxvOM9RX/ZT+RudVsfF+uYQPXaPxfaXl5P7vLPod0bNIBXdcgh2fd9AyrExLsOUJ64n3wzfnmHtzLDv9YaIQGMGGZN/Yq9d9qy26fso/vQbriOAxDrtntQ0Mv+w5PF2lX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqKEnNbvS9HCCnWGJMjgGluFe8YkMoLVY+wYZUwY7qc=;
 b=Vtk+ryNxIrEPUE5C8tMAbcx+eSA81qs/72RbEWiV/pwEhncKMPWmuCTzcI/L1xR+lI753l2WqSSOtWnU5bdc3kUmDdSk+OBv60Pt+RIptSPi90P2DG8gNf1nl7vtJYdfw1RiYheNrXxSBYOH9/JhQacWmNExxtLnZLC/vnGC14Y=
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
Subject: [RFC XEN PATCH 3/6] x86/pvh: shouldn't check pirq flag when map pirq in PVH
Date: Sun, 12 Mar 2023 15:54:52 +0800
Message-ID: <20230312075455.450187-4-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312075455.450187-1-ray.huang@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3fbf4c-a82e-40a3-ce66-08db22cf293b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wOTDAhecHy1DdJft9GB+NcrF+9kAPYVZKaFxJds2eNv09Tmzv2MN/7TnNNSj5KCOH40fr/xauOptYwrZKqODcYf7j8kpaITM82Ao5wlpwUbbOfS3hYYSwTjePgEMsgBGkpwDU067dBohJN76gqaTd3swqY0b5PWTzP+EJzaACtfpQQje8bucMNa60n0YO3lTE3Ou+I6VhltxK1JMEimGUKWJi7JkJQAjn+ufNhvsQYaSWd0iEXj3qK6LVRZ/9h46BlT4pTLmwL79eIVDcz5vRrAeTNUm2sWXD8sQsYbDyK4ez6tT8ZdC/EJxklXXu/JO2Q3rm/c/lgq7Dm0fXqw4Unuo5tN+z3507dw81sCV6X+wzCdDSCWWG2zMSqt4PAgLTZBoxFoVZBUeVA6yNpVABY5uaeDXSA7Nm+4+rYs6fqj9XLbKCZx6UhIUcsnB3YlyOk8UdSG11PuJJjBL+lcb/V2UrlEVTyuwpNxUWo4PInEOpUJsMCc8Frr/O38+jkMbN/RNmeeZUBJd3WPcM8StXlgcJ8I2SDxGPLOTNWo3cmk8wOHIiwVXBMovVtWG9jJymKTuBuDzIdTj2muXPJ4gQWK8Wtd/vScJgEi5UuWVyoCJH5oFX23a1XG/yJX00apn5cxdkRhrR3TZ03+l0cpFhPdngG0hl6gjZ57sP4gwufZJDpG288Il8l026L6uBRLUEMZHtm2CCG6I4F4Q0OAkBYNn9ZjxfLcxkvnQ9vRRDzo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199018)(36840700001)(46966006)(40470700004)(83380400001)(70206006)(70586007)(4326008)(36860700001)(82740400003)(426003)(82310400005)(336012)(47076005)(41300700001)(81166007)(2616005)(316002)(16526019)(26005)(110136005)(54906003)(1076003)(356005)(186003)(8676002)(40460700003)(4744005)(36756003)(8936002)(5660300002)(40480700001)(478600001)(2906002)(6666004)(7696005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:34.6854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3fbf4c-a82e-40a3-ce66-08db22cf293b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884

From: Chen Jiqian <Jiqian.Chen@amd.com>

PVH is also hvm type domain, but PVH hasn't X86_EMU_USE_PIRQ
flag. So, when dom0 is PVH and call PHYSDEVOP_map_pirq, it
will fail at check has_pirq();

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 405d0a95af..16a2f5c0b3 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -89,8 +89,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-        if ( !has_pirq(currd) )
-            return -ENOSYS;
         break;
 
     case PHYSDEVOP_pci_mmcfg_reserved:
-- 
2.25.1


