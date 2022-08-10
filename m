Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A858EAD4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 12:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383537.618720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLjQl-0007PL-8X; Wed, 10 Aug 2022 10:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383537.618720; Wed, 10 Aug 2022 10:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLjQl-0007Mj-5d; Wed, 10 Aug 2022 10:59:19 +0000
Received: by outflank-mailman (input) for mailman id 383537;
 Wed, 10 Aug 2022 10:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0+s=YO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oLjQj-0007Md-3G
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 10:59:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 791230dc-189b-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 12:59:15 +0200 (CEST)
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Wed, 10 Aug
 2022 10:59:12 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::2c) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Wed, 10 Aug 2022 10:59:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 10:59:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 10 Aug
 2022 05:59:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 10 Aug
 2022 05:58:31 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 10 Aug 2022 05:58:30 -0500
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
X-Inumbo-ID: 791230dc-189b-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQKhm4i0AMca9aBYYr4+37laaBZdfflxqJExrV3K1xCjI8CQtmLVKQmIwvb/Ng4XRphL0mMyE3uhFgV5V/Oftxk6vA20I05MHftHMXaNcIk39PZDeIA0lGllkmSFmDQq1p8JyVlr1o6/MIqkGwwf4Pr9GR3/oBy7vtwEVIs6lRIu0QwDuEv2oeML6A0MjY+eskTZbnC2LVVNxZO2VfOOFRhI1UqJ03b22MbHlg2dM3hxZiUOnx3fxcBnWzAtGMssSmEzZq1VcBiyDbQL5BsM4pMgESAQ+kG+DQAlmlSN1bbGhQ1NlRcvopcLG46k/QawnOufm8AJmr4pfqEa+1TVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGpVah3n59CPxVuVNYgeIaw/1zZRjH3TajyXnIc0KM8=;
 b=KKi/blT4LDijAz3NAKalpfomNMpnbiTdkmBDqWVfoH7wNCjOiSY515FQSNhFojKd8l9jAQjIHNr3inPco8rq2fNvyS7z2tTGgmpI6IJc+J8RxrzoBAzcbVNj0+OeUUPAeG76DTbkOcIK11k63ivHPp4vzZeN+jos65ncCPq7zPhyE6MxaKmD2D/4c2KSphtZqCX1oK3dbmNYu3eOSk1rFexngg1Y5vNqPg63y37KjLs8+d7TTJQ8gTuWAR0cQyMrEeCZcBd7KWsXUhtI+Yyo8zwHm3HrjYtqDtWb1laQF3f/FPf1L6mwGJhkvqC+LCIH1jLq3RYVju5d3sJuj1afDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGpVah3n59CPxVuVNYgeIaw/1zZRjH3TajyXnIc0KM8=;
 b=i/zuPEVmi61XceRYJFKAhQ5U+42DTRm6YYnH7pPaJ8BNsQI67BixF0c1zecPixrWCxXlC3hxl4noC0LAO8YQ0Ph8xSgaZAYMBYSHjQ02s7jgofg4DqVlaZXJ1eBwCSZDuu48Y2ij2PAxX7ZUR2nWewod1RLum7GanGBEE9+Woxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Date: Wed, 10 Aug 2022 11:58:22 +0100
Message-ID: <20220810105822.18404-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 797479bd-9b20-423d-36a3-08da7abf5b94
X-MS-TrafficTypeDiagnostic: DS7PR12MB5983:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NI75xUz/RZhwfSbBc3dZemBp8VLcwKq4dg2zlKxoZXPvj7tR+m2VcZrPebY8KHg9Zsp3eA7rL+lemKAqxaCT6sE8qIF9lgJXXQV9+Q7rOvjBxoB0MV5qEruaodq2hWvIvskXm//CgqJ3qaTYZ4arESmZMjcFzGYxtwwmCmlDKJFZXm1IElBvsTyLXCFGesqrPmquY+uDvTE/BnP7SvMG9j9NJYp+Rf28lD9XhaApsubSMNVc0f/QhQhwbCi3LiM6Kf4Is2qz5qXNM99NWpUQ+83L9d87FrUhAqKlBF+YY5jRgE1JRU78SxI7JuZMUlQAXIEWDIam0/9qLRzhAR9Tm3BqpLspdFkk4shFFNqM8ZwDqaJxtxATAsw9StQFplkvejEF1/i+m9lEp+jQlbZnpcZ1x9khheIlbLKfDxe3Z5Fp66Do5Y+XQPV3jO5elVPke2Gi770fAYVzF2JqarmMZ34ShBplfXfRipx2MIFeUe5+Pdx1JDjjVICVTENPTzKhAESyvlE92MfUDN0nI3pIHizdwrNKrOBoy8HgbA7h9tcfCVTXIU4lSc6DhfSQlSuaRPfOXrBWJ5HrHceQBGCo7maCkox9GIcslHA3QBKuj6VNQSQdS/H2QgCDJ/o9p07A3semXt9M7Lgg2UZE5iijNSqzrv0eX9UFKstKE+xNuYVdABHaIoXYq2EYr7ZMFBNtWZOnfiTc2+c9gl4lfFKQ+uoL1jpuykzVtwIWEpRgGiZxZcflCU7CrngANbKU97cyBvpBaVjhik7C8Y+RWrTLdLeP89w0rMki8UYZWUSCSVoCNcn6OMEZ5Jieke/oIHKTDzLAnCY+dEmZ2weKC1dnPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(40470700004)(336012)(186003)(36860700001)(41300700001)(40480700001)(8936002)(47076005)(426003)(83380400001)(5660300002)(1076003)(2616005)(36756003)(54906003)(70206006)(2906002)(82740400003)(356005)(478600001)(70586007)(26005)(6916009)(81166007)(316002)(82310400005)(8676002)(40460700003)(4326008)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 10:59:11.7941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 797479bd-9b20-423d-36a3-08da7abf5b94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983

Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
CNTHP_CTL :- "When the value of the ENABLE bit is 1, ISTATUS indicates
whether the timer condition is met."

Also similar description applies to CNTP_CTL as well.

One should always check that the timer is enabled and status is set, to
determine if the timer interrupt has been generated.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/time.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index dec53b5f7d..f220586c52 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -222,8 +222,13 @@ int reprogram_timer(s_time_t timeout)
 /* Handle the firing timer */
 static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
 {
-    if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
-         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
+    uint8_t timer_en_mask = (CNTx_CTL_PENDING | CNTx_CTL_ENABLE);
+    bool timer_cond_el2 = (READ_SYSREG(CNTHP_CTL_EL2) & timer_en_mask) ==
+        timer_en_mask ? true : false;
+    bool timer_cond_el0 = (READ_SYSREG(CNTP_CTL_EL0) & timer_en_mask) ==
+        timer_en_mask ? true : false;
+
+    if ( irq == (timer_irq[TIMER_HYP_PPI]) && timer_cond_el2 )
     {
         perfc_incr(hyp_timer_irqs);
         /* Signal the generic timer code to do its work */
@@ -232,8 +237,7 @@ static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
         WRITE_SYSREG(0, CNTHP_CTL_EL2);
     }
 
-    if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
-         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
+    if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) && timer_cond_el0 )
     {
         perfc_incr(phys_timer_irqs);
         /* Signal the generic timer code to do its work */
-- 
2.17.1


