Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFE+LkSY2GkgfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:27:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A43D2C23
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278339.1563206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5KK-0001x8-5l; Fri, 10 Apr 2026 06:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278339.1563206; Fri, 10 Apr 2026 06:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5KK-0001uW-1Z; Fri, 10 Apr 2026 06:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1278339;
 Fri, 10 Apr 2026 06:26:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wB5KI-0001uQ-3M
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 06:26:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5KH-007dXg-FO
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:26:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8980f-2eae-0a2a0a5409dd-0a2a4504d182-28
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:26:45 +0200
Received: from [52.101.62.26]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d89823-bb33-0a2a45040019-34653e1a53e1-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:26:44 +0200
Received: from MN0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:52f::13)
 by CH1PPF8423FDA82.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::617) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Fri, 10 Apr
 2026 06:26:35 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::9e) by MN0PR03CA0011.outlook.office365.com
 (2603:10b6:208:52f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 06:26:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 06:26:35 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 01:26:35 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 10 Apr 2026 01:26:33 -0500
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
 b=JMzuPl8/BMbwwcPERX2C9gDETdgS1DcCqMBAdZEhs82Ktl2RLHHpEhjKAQoi65TiYVedXoAl8/eqi0BQShb6UhGxqkVvgpgylN+Ap+HOZpCEfsdJ6phBbznbBwY6unmKHxk8GRpcKkH2QT5R1fwIfW3HeNg1NzjxEAIJqyvvAhy5xMay81rmXJQcUi221NOeAjZ6Y4LmvXKbZZ8r9yeOiLmbc04tnQx+SrzPheVPFHDNAqwi0JtSdaWAraLwp6lX1R9wAiFavYgGtJyc85lDz6TUZ77333AXBqJ5Z0sHA0TJGZiJMbxP4jo+i4Xq5H9/HCQogL+hChCg73eUjGaOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfOmYGha/Ue2m5vrnZa2Nu+QmhZgfzGz0efzYiWJaGU=;
 b=EkDtN+d5KXorG2gWWBCjtKSlKaZdkAIdHBbagzJYWWjUR9fVqdm4TAhiuaHn72LzJSvP9wprvk55Z0rtNWpNcm2/cFA3K+9YETLZedlpmSE68cSnomMB6lppwvSVKANcoL8gRFLEiIJUXV73ZuO54bESZ6Q//GZTgsqhUx2Isi5nlOPkZcTahAV1pd+BjdZ7naHWES3fD7izdYDEJEDZtdh2QUdvhA5BsV1jLj05kawfpMbhJBeNz9UFtuJwxZlN2Aj7z8hzE7rDl+k8d1WZlxyM3+yQ2pq/UmwTs0S0QfWrZV0l2O7PYXSV6Sb7a3VLvS1IgDeoh0Txhnq2oBIDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfOmYGha/Ue2m5vrnZa2Nu+QmhZgfzGz0efzYiWJaGU=;
 b=vJFAiLuHYSVKttnBTEuV+8vxNG4QtvPkFGMa0VP6slX5sg7lkpI1A5fP+4N0dhBG6vVDMTAtMHtfP9ZHYLZxJPmMaeTwoqLVZse2MzoCipPMwlN3vvFNLI3/hG6xwKw2fR0spQL1VkG1/FRwhYPGvf48YoSnvbt45GWrBUWQoyE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <fe59c3a4-e518-4d63-8905-ab2ee04b0c97@amd.com>
Date: Fri, 10 Apr 2026 08:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm: Fix off-by-one in iomem_deny_access() calls
To: "Halder, Ayan Kumar" <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-2-michal.orzel@amd.com>
 <a63da4a7-9e0a-494f-a29d-72192e3a8e55@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a63da4a7-9e0a-494f-a29d-72192e3a8e55@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|CH1PPF8423FDA82:EE_
X-MS-Office365-Filtering-Correlation-Id: 378c02db-793d-4ebc-bb5c-08de96ca1d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9RBVnWID82aaeECeMQUUSNG16A1RJGSPNNU2Y2W9YS2aJm+xg1/cBHzjl4hP9ZM8abLFzU+cscygqdNShZSBHNY70JrqIu+nGmb+ge1OMfSpK1Gz/GEHHtxLTq5aWdf1GYZFpc0PREP9ieo7HalNK5I12J/8pN7TEeAfHsT4XZl7ZKjlGRKy364L6tdyubqXuuNMJbcCouFn9XJnvK3OplTFYJBBIajr97DjTqHIFVcqMgI0yTMgoMyoOtRpcE00J1Lv5SXDgTZD8YGwVRfGsfYxt2y/VlKqlzJBjTN1rS9efuvwlt8Xq1JSZ8WER5TXUBklJMykQemkOyhnucZjC8ZBXzZCD5pau2Y0tDBLMCTsfwTcsy3Pw4SA6CFDmk/dxo6OXZzTVFcqr+K9shrBTWw/foiepdooBFSZ7ge6n6LCJwxlnCZEeod4Kexu5jfX9mjbR2nZk6N13z1y6On8Q3SZzhIMJAydk3yE96tq/wEwMP+akews/CG5N3muOppnn8Dlr076yk3XH0AgVC82IGgFKsCeFAlyOxcnNXtQ3B+Y+ptDWqwq8RfaKjw7Jp39wkkrDWn18cJhkH70mtCVCx3kLnW4RwiHmY5ZMIwfuJR920wAdD7kFVBzfuXsk/U181br/u3AVTeiKiVS3Ho4LvqM7gE0Q/LEoko2HbXZU9lxO05VcQUtKM7zTf1cumVw8JdZnNwH3S14q+cHvDHMIIzky0f7O3YXU7hcSsBgoNwA9d2HDwxh+hxX3CG5aJ/MK1EI+NH0+GRkarR6hIm8Kw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fTd3Ab5xTCOYzNFPoXDvAiDwviSTVDeM9nh54w4op08vw9LnmYJiGhgFI5WXxo4jQvuzRyAiTu1SY8lLrh4OYrnbOIvlTcX+JtZI96kvz7gtEznjK0eyChpGBtcciawclzrp6Zq+3yXIrg/IoIsdgLvhG3nn6Mj835CGL+PMwpugyrDvCm50A+ZYP9ZzvB5geXXa3MHPlGAdGXLxHyeZf5j7+ebaAq4FNrW1KApQL/QWT4UmMAZaw3OeEzzz5kD303AAQ19kGP0y9+3Sl4yQqffRu4lxnjV9afVmiWwS99SIN9uPH5YSjx8+FbSR7nLy+ocTqNRZ4Vr7buy3MrDzFZ2pTGF74Gxmk+qFT6l3sWhtokLo+ceDZsNsHzaDYsEz+1WaKvTGZ60Z4vsoaP/evxuYludCygOdnVTtyOkFz9gOU/4oXnBBemf0PaQ8DVQN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 06:26:35.4370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 378c02db-793d-4ebc-bb5c-08de96ca1d72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF8423FDA82
X-purgate-ID: tlsNG-ebf023/1775802404-B192151B-7B259140/0/0
X-purgate-type: clean
X-purgate-size: 1579
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 2C0A43D2C23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 09/04/2026 13:49, Halder, Ayan Kumar wrote:
> Hi Michal,
> 
> Apologies if my review is weird, I have been looking into too much of 
> safety stuff.
Yes, I know :)

> 
> On 09/04/2026 12:39, Michal Orzel wrote:
>> iomem_deny_access() wraps rangeset_remove_range() which takes inclusive
>> endpoints.  All call sites in the GIC and ACPI code pass 'mfn + nr' (or
>> 'mfn + 1' for single-page regions) as the end parameter, which causes
>> one extra page beyond each region to be denied.
>>
>> For single-page regions, use 'mfn' as the end (denying exactly one page).
>> For all multi-page regions, use 'mfn + nr - 1'.
> 
> Just reading this and the change below, it seems that the issue was 
> caught while doing some boundary value analysis. In this specific case, 
> it seems the boundary values were set incorrectly.
> 
> Can you explain a bit more (the boundary/edge cases) in the commit 
> message and give some reference to test (can be even a different repo or 
> something) on how you caught this and verified it to be correct ?
> 
> We can keep this test somewhere (and tag it to the commit) even if such 
> tests does not make sense to be upstreamed.
As much as it looks like an issue found during BVA, the truth is I found it by
accident when debugging some issue where rangesets were involved. As always,
whenever I see a function with parameters {start, end}, I need to dive deeper to
verify whether end is inclusive or not. I also check the call-sites to validate
my observations and that's how I found these bugs.

~Michal


