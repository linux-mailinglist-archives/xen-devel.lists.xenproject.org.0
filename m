Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O0uEBiQ12kaPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:40:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4063C9BBC
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277091.1562381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnjn-0000Lq-V8; Thu, 09 Apr 2026 11:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277091.1562381; Thu, 09 Apr 2026 11:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnjn-0000Im-Ok; Thu, 09 Apr 2026 11:39:55 +0000
Received: by outflank-mailman (input) for mailman id 1277091;
 Thu, 09 Apr 2026 11:39:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAnjl-0000Ft-KV
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:39:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnjj-0091Qm-El
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:39:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d78ff4-e002-0a2a0a5209dd-0a2a450a96b4-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:39:52 +0200
Received: from [52.101.61.26]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d79007-ee98-0a2a450a0019-34653d1a837b-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:39:52 +0200
Received: from PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::7)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:39:44 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::aa) by PH5P220CA0006.outlook.office365.com
 (2603:10b6:510:34a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:40:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Thu, 9 Apr 2026 11:39:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 9 Apr
 2026 06:39:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Apr
 2026 06:39:42 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 9 Apr 2026 06:39:41 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZ1LeZMOk93Y3rQa4B4LhPloBl7Dcs4+DHsiVuSiin8RmYghBal60/DpwJb3ISHpDn4rT4g8AIVDLKRLNV56zz5tXmWZDhuKN3Lf5iAA4SNoExvni3LAI1Yrncw8XIdUXbXxLRREnLcSEdqu2WPTqokQtVmW9t1k2mXPZm1u4UJpZ/4aPzy/SXSXqtkyJeuYqG5R6tccvPEJY8bMu0qPchRVib19mWmeMyBqCu6YMfwyROAfv1AUiHetANV/C1GlJU+lYcG+p28owcu8bqPHYLjQrEVzkeLSwsfGNrQgWCM/pY5BKzQUjIpUI9CTVS3LA47wAlCYiXrtWQfrN1oFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sbiLpiolSgNF7o8RKtIPkDTBElPtkFOamtiYxQtoEA=;
 b=xi6kFBIViEf9/JAYl/cWJisyvBvgCT4/3pJYSjJsJxAVsy26Hdj/hx9CPFDU53dC9N7LONtkrhaMHTNLONtRA1AXK1Z2gCMKSLSyLkdwoW80gXVLs4JSKe1kzyl1SOjGFubN1cTuh0BEbNtYJnJIpoYpPcJjfgPyLWzXbRjjP3UFASVndqClez8olt02+9QTFHOfKFfmd5dsCLlND2QukJ6z5xNZGMTRsEjMVVlab5QwpygGTLFlFIqj3kmfq+bzajPO23tXb16pmkrV3zmWOtAOdTQvrhXHQOQSnVP+jSXNptR4Bebo3N3Z4iSS3gLS53SRZErdNz+4XM5qBbrUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sbiLpiolSgNF7o8RKtIPkDTBElPtkFOamtiYxQtoEA=;
 b=KZ3BHmBREJD/AzdyFs+ik3oq+nDYQDvCpMCTmJRIOgaMoZHryCteSt8cWJVUPyET61ZsRH956dgKDY54lrwTnN+pFKZXtP5/HqToXY0a1AGyOtNHtyMCa9XZVZRxnNEG4cPF/etXqvZrvsysHs8ClwZaK5hLifK9wBuHGWQqIKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: gic-v3: Use vsize instead of csize for virtual CPU interface
Date: Thu, 9 Apr 2026 13:39:34 +0200
Message-ID: <20260409113934.197619-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409113934.197619-1-michal.orzel@amd.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4b818d-e5c2-4db3-f187-08de962cb212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	avtAXAK4ccOJ+7RfRIIZEgixOY20gUovA/CgrbzsRsQu6gDJfupLfSw+eH5xIBdFW25e9yFZyiJ8bPfNdasVd6ZzNZiRNYPPQwXzTSdajXcdSO70Gp/z5aWF8HMUuUjw4B6HV/LnOjASva3zoJg/M5fOG2uSZv2KKU5cNhtxcl/Z/PcKYNQVEWFST5ayCG/i+M/7Y1tPwGDJBxAdwgpYk0qn+B0wQaS/5XkZC3tOgzVMKikp2Dp67Uc3RHWJm8Lb5tKM8MQJWc5gfrPQznd1W20ypuRwkAe8ZFxr++WdaG9NINdLyhx4kbRjQCB582uPWypsD1gX+R325fiJZWBssTfnPkLa62PklcQExtCceTgNUIodXqc/SWFDmcaVPbbDxj6YrA16t+knaBuw37qZnX/7+zyu9/6rYtBzxvbMxTYhtu0Qkc0s8uFKV9y4s7VvK05bTI0fe9T2ON4DPfts+6I59LT18bGzhpB7upLDNzrHFRd/w8AzHbcf9uDy994MDM3WXXFfXhnJV8rKPniNvB4d4f34QzB6S+YRneLpmzo9Ye00O2uMRrKstwe8SEr4mPDNda48V8ngLxUY1oxLV4+FUtkmddK/o/4kPfXlJZ0c6YQ9vmFtWiwIDXH87p00KARaFuUKZNePrzMv1yhgQ0ixDt6oGwEXeBrf1olg0MUDZdLGF8bP8hY44qpgFVXZhqYu2KkbcbE9mwkH6hkcVB/QpuRK6EKXYY9DeZXW0BZWygxLMB8SWwY6F/oHC/8VBMlXqOw4jUaPO4PY/XZFVw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JEkyIN2Ik+czf9icSAkIKZ+lWHg6fbBYt1t2Ftf+ZfHbl2HKuGDcLmQJCRBDWppSx+ekhp7pf4JkXzQmNh2kcZD1g09LzKkUj+lIXsGTGfhf9JiyOO6cfE7Hhs4VJF8QUilBvloqPorWiVQ9l9vsryObfSqY33IKphFdDOTp2hwPEASmrmqZ0v+RPEhzIYwIUp5CGzuaWBZU2XwgSiTPn1MTSN+SMl3b4W1TFW+jsgf3MG/A6l/qk7T+69IO8ccCTJ2w5x3wp0XP5kW6rh/NDxV/IB683CNL34ECCoVEfnUvHKQhECbQ0oZEWC/56xVQEiyfQGvHHZ8mUqTUymVd9Vzp4nJvJwiFF/eqriftMoiPUi/fjo93W8/UU/7jSx8vl06qqupnbln6gDXSRObG006pDIj8rCA6vy9XaRmCQPLaoIHYwkJsV6XH4xKNpG4B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:39:44.2175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4b818d-e5c2-4db3-f187-08de962cb212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882
X-purgate-ID: tlsNG-4011c0/1775734792-C50180B1-4F21F8EC/0/0
X-purgate-type: clean
X-purgate-size: 907
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: AD4063C9BBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gicv3_iomem_deny_access() incorrectly uses csize (physical CPU
interface size) instead of vsize (virtual CPU interface size) when
calculating the number of pages to deny for the virtual CPU interface
region at vbase.

Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GIC regions")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index b3e104ea4ad0..5641ee870f23 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1631,7 +1631,7 @@ static int gicv3_iomem_deny_access(struct domain *d)
     if ( vbase != INVALID_PADDR )
     {
         mfn = vbase >> PAGE_SHIFT;
-        nr = PFN_UP(csize);
+        nr = PFN_UP(vsize);
         return iomem_deny_access(d, mfn, mfn + nr - 1);
     }
 
-- 
2.43.0


