Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHsLI35w6GmvKQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:53:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD34429FB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289905.1569582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFRSs-0000GR-6N; Wed, 22 Apr 2026 06:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289905.1569582; Wed, 22 Apr 2026 06:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFRSs-0000Dp-3L; Wed, 22 Apr 2026 06:53:38 +0000
Received: by outflank-mailman (input) for mailman id 1289905;
 Wed, 22 Apr 2026 06:53:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFRSq-0000Dj-2R
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 06:53:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFRSp-001yLh-FI
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:53:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8704e-e002-0a2a0a5209dd-0a2a45059d0c-46
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:53:35 +0200
Received: from [52.101.85.16]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8706d-aaa8-0a2a45050019-34655510a518-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:53:34 +0200
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 06:53:28 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::d7) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 06:53:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 06:53:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 01:53:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 01:53:27 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 01:53:26 -0500
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
 b=JKBqO6jEAD0GNV7B98jmRHr0JFY2BFJw3WzTyyozOhz5GMWqe6vuHtWlY1LJYYHKNYcwGwnEOsSR+HJkRza+2Q8HLJqMD9VDwi+m39h47kjsdWeJ4t1dguOTbrfjo+wxuDdSpW3MFoBoJpStNqjrzxw0/uxr7RehOwXwXlhUXFg+NTyrqKfZELoj9GWRjhznw14YoZZKe9G928rbaDEofzKJn8cgEu+yGsUhQuNA88abKas44xuIcpTT0XI6pc0swjvnTui/JTgsQeqsoz1XAAuO7nEtinmABmWYXZSTxSV7w4n8lJVfSHFdDb7zJCNo4ng3hC6dmL7NDXKfDFB+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2poxzXF0QQW3drCBiF/ropyfqrjlnZAVpDc9od2pzNQ=;
 b=O7NRwG2xfhRNODhfgj2nxp53kOToa22uWeNheLv4MVz1oNNOLI9mAowO/JRDwgUF+R/ID8AZBxax++mUuV2+QbdYVKMp0WlqGwZmWSYlOiUWI55cHG0SafWSzHht59AQwHbkNVNxnHRiDMYx9kWjxSGfXBtWtoqSx7FbXxNH/Z6q3Zz9ghrr1HQNI5gcQciZcYu7rTYR/HE8mG6JA2fZ7pyiWe2KGVJCzW4oFZXoxN/9vsCxF7JeBAMs+IbMlLTq5iXPnZUIi965pimgFBFoknBJBw8aBf8rL3BWn5ZLt/bmhQs/ZhprATgoQWOC4Oxd0/yCXS8rq1yknyKRTvLcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2poxzXF0QQW3drCBiF/ropyfqrjlnZAVpDc9od2pzNQ=;
 b=DrBot6auItuk3tCLymxbb56wftj/7u1f0W+W+aX14PsgYkcUOod6jDEBS6v9KTN77kmoqtSsKLRObDprJEl4RDqCCsr7I4WyuffDl2EWVsEC02Cl5qgFWgHOLkFHsECzOD7yxfudPisFu5fv5hnOf+HB9VeGQ5dYH0Sf76JbBj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c43db15c-8cef-4079-8604-80e295e738e5@amd.com>
Date: Wed, 22 Apr 2026 08:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: flushtlb: Optimize
 ARM64_WORKAROUND_REPEAT_TLBI
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<Mark.Rutland@arm.com>
References: <20260414081124.48741-1-michal.orzel@amd.com>
 <b249c55a-6982-4b9f-a0fa-2a6bac3da25e@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b249c55a-6982-4b9f-a0fa-2a6bac3da25e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d4768b-f41b-4e0e-6294-08dea03bdb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	33+EEMpdU6409SxkMJwsEUgxykJOGp9ENqIRNocmYfkehlshg236DwAbN5zm4RbYS+Vpsvo5ndgpuEwrtvGVHN0ku7me4BP6SWgg8Jci6gnU2YApk7fMgL9Hc0whHCZRvoAPE+PNJYIU2r9FTw9dDWwg968pY0yYQ/VbtAWRAOHzP75Snm5jiq1wv1y4T5N495+qYSviy2Yb0PIpVzY9tBsN6QpVXG9cw0RxEyQAFRt0fQLU4jY0mAFRjtbPLy/iT5somSEeB6FoelR4ucV5UhkaNkO6reuShVHRhpo5nAX9F24uCEkoBqTuhNtKnEYNZYHeuhOmzqTqw3mLwjFSrliI2yLMjazLZctsUeTbtZAp3NkznZ3lxizKJGOkhtL22W93qcp+o6dIvmmaI2pap4ZVykvi32suBPHxDiRJbfc8ZjGdLTykiNG+F95VkJuNWyu0Cv3nYg4VXN7UkIiqCKbpIpHKhl3viB1T+9Roz4rvkuRLAidhXAIlJqhUvh05bPtcclaP75ugX4ZIlP4h+bAtpUSQ83M+CoEl00t4RouaA9ooshJ9aFE2xjtOAHYKnn7GZWYVpoC/uEQINV8myUJYyB+vdLdYGbKFylwenmSD7pZsXYSCmsmNPRjmz/XpU5JN2hcZj5Ei6I0m0O2A9CmqDaGyH95/xH253BxaON3YjCraV3wNNara3VgUDmIAQXPybkp4ssaFH8n7Qk9iVju44s4N3IdgHeGh8SZX5rhVhAcfhgZF+8gCURAyF0vFKNqRXYQdXvIY1kmGxyFS6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CjVP4BwPelvTPXQUh4eopOF6Gj2RS+nhPNuxYHISgqGAw35GmsHp/mqDHZ5HeaCF+uF2lNh+Kf33H7gRuwXfAJX5aOMkcDBh6JYbpvBZfrcyM+vqTvT2iuNZm5A1kJeLNFm/P3ISQvo6/jUJ2S6FfH/RO2pEAc3U/yNiIo68nSwZG7nCfg3uk2InGvhf2HLeBXX7oBPpUbDrQcHD0PuAJ9i0/etatGeznen38Klqb9rfnUZYbwW3eSZR2+5OU+LCNagzF1CkEFn+1F3GmnaCFHDv4uRt9T9QaTVdUt6YZA8d9nQB5O+Qy25+T0ZoJzlPO5TfnGdDU0fqsZtnDlzus/yz7TtjsPij0R6NeQqV2H9gZiOpiPl5UyKE3wbZy10xKo9sz6Fi58hkwKl4rDFZFGikiUvgYaAtJ1adWIK+ulMT+eqA9kgktVMuQ2dZlVto
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:53:28.0348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d4768b-f41b-4e0e-6294-08dea03bdb94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575
X-purgate-ID: tlsNG-c201ff/1776840815-E01A9443-91EEF6B0/0/0
X-purgate-type: clean
X-purgate-size: 1201
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Mark.Rutland@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 00DD34429FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/04/2026 10:59, Julien Grall wrote:
> Hi Michal,
> 
> On 14/04/2026 09:11, Michal Orzel wrote:
>> Rework the workaround logic as follows:
>>   - add TLB_HELPER_LOCAL() to be used for local TLB ops without a
>>     workaround,
>>   - modify TLB_HELPER() workaround to use tlbi vale2is, xzr as a second
>>     TLB,
>>   - drop TLB_HELPER_VA(). It's used only by __flush_xen_tlb_one_local
>>     which is local and does not need workaround and by
>>     __flush_xen_tlb_one. In the latter case, since it's used in a loop,
>>     we don't need a workaround in the middle. Add __tlb_repeat_sync with
>>     a workaround to be used at the end after DSB and before final ISB,
>>   - TLBI VALE2IS passing XZR is used as an additional TLBI. While there is
>>     an identity mapping there, it's used very rarely. The performance
>>     impact is therefore negligible. If things change in the future, we
>>     can revisit the decision.
> 
> Can you document the use of 0 in arch/arm/include/asm/mmu/layout.h as well?
Ok, will do on commit.

> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Thanks.

~Michal


