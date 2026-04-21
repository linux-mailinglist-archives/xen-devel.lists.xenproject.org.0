Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBrAD7tl52nx7gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:55:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDE43A584
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288927.1569157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF9hR-00011H-Em; Tue, 21 Apr 2026 11:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288927.1569157; Tue, 21 Apr 2026 11:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF9hR-0000zp-Bj; Tue, 21 Apr 2026 11:55:29 +0000
Received: by outflank-mailman (input) for mailman id 1288927;
 Tue, 21 Apr 2026 11:55:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wF9hQ-0000zj-5O
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:55:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF9hP-00EPbx-II
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:55:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e765aa-bab6-0a2a0a5309dd-0a2a4502e1ec-48
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:55:27 +0200
Received: from [52.101.201.44]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e765ad-af86-0a2a45020019-3465c92c819a-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:55:26 +0200
Received: from SJ0PR13CA0113.namprd13.prod.outlook.com (2603:10b6:a03:2c5::28)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 11:55:21 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::3) by SJ0PR13CA0113.outlook.office365.com
 (2603:10b6:a03:2c5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Tue,
 21 Apr 2026 11:55:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 11:55:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 06:55:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 06:55:20 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 06:55:18 -0500
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
 b=b8HPzld+JtV6cPym+11U/veem2ccdaMt7ffVtekV7xFTxQXzFzwsYABjj3hmKgNwtyyWGDO6FXk+Gm6OJsm2FbACQEBQOu4F9Mdezuk7m4SBjsBsmdvcbRYRDfvNNbJZp3w8TfQg98hIUUSvT5oy/mhHiPsZIqoUFo0hX2twS9u04IF7RWwFuKohbl7V39zWfrG14zcBLXL5YObk8DbSIP4ACNTIUH8S95W0qf74sdyD9zEQbwCH16eWJVaITJQIb+KC33AXChSIR9Xo3AhedCz4QGr3CQGM64D+aysyNejFMV85LXquPGn9eHGZqDNIK7UCx0b+HmZRsUqqQo//pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tps6sBPh3bcNJWiwP/HKZ78/QClVFItbNQVw+grFdbo=;
 b=sYAehtareVuPV5dxgrg6riazFel3pORhcsn0nAw9Uile3D0zdcu6p5WADP7abF8aunP4uwnTyZAbkEJYV2TtAoBTXW5+fGh7RJtMamL95XrHBJrtInOTho9U9yELxQ5O1BbobfyJ/+H3rGQ8nNht/kt/775K4Mn8KADBi5DDkQq+TthXDqC/BpW1jduAPqCd/1BrvckpenzAvHcm1TXK45dWyurWSsM9SsWPdxpX9PxaA5/aa+QwXaufvpdq4fLbHEC2Yl7kWvREBuyy6hthcf1S7BLiX6ZyWbx06+W3eTUJUBJOjrwPUOvZifLwx9r+bmWOtBWpI2MstvM7tR5Wcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tps6sBPh3bcNJWiwP/HKZ78/QClVFItbNQVw+grFdbo=;
 b=fK1UrLSrlTaNoFAj0vix9JOkIg6ybdQc0EeVoWpxWuQStCJfkH97b3foJeYEhsDeWdYA2kKnvzpty3cioaXPhx917zmgQh5PzgqRbr7eTNGQ1XUW+GMbbFGrSjrQmMxs/7Vddl4kOtxRFsdqsQB/iNWhgAlVk0rUhJiS51wdyNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1eeb93a1-bb57-4ac8-a280-2b78b045fc2f@amd.com>
Date: Tue, 21 Apr 2026 13:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
 <c5003b0c-04e1-4081-b931-bfcb9ab1b739@amd.com>
 <aa51f23b-0e2f-4666-93ee-038430f661ab@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aa51f23b-0e2f-4666-93ee-038430f661ab@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|CH2PR12MB4136:EE_
X-MS-Office365-Filtering-Correlation-Id: ae48f8c6-946d-42c2-8aad-08de9f9cdd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	06vQnzg3Yqk3fZjbrg6r9wm0M69lhX32QP5i3HlgNsI+g0XT6duaVvHrsfgBdNQb9yaC4LISO0j6wQFECzS9HbTf8DUlMCFyi5NOlbWJiw7Zg4q/eAnPxCs5yKTg08Gd0VtLo6OctHlbZmWd6AAZJlq4aagxaN1G42fzSDb7gYv/0KqdtfmoiPiCjElRZhOWzTGloNjoYVrY7vABJjI+SGjO+ST0SdX7Y51xn4ag1dk1TlSenLOpw2kXH/rlt8nfLCNZwCbsS0FhTWzOykI7EXw86ID+UFVxnPmw1QDmP0Qh/7aRM/1Fuyppry0MVM8inoXb6KzrUlN68j0e5JwueAjht+Qfcah0Qj8rTOMo1GIgBqjhFHc6hp+67om98Ih7CBz1y4ZyFqtojacRRPTv5veEayEE8LrI2SLaaEdzZc9YPb2KG9KGMM/uDn8DZixKwcFN+VecuYxwSPVb4gkwb0zUTlqP2ZDy8R+mBWQc1xa1YYBbrAyh/0DGjVDrgdx065aTftSlb3pJrGbSvGfVxmXvsN4vfjLRpFYCo2V/jsSZxntXy/3lL9LrlV+tDPILlM9kK8NaY9JHYQXKZszfUjMDhlnnE+thkToZ/QWdUdOEgVOsPIlzNU1uuSLZB2Q7pC/DHeiBaZNffQD47exubOzkHfQplY0hHa2qta8+WIPFNki4VhTAPukG16/C9oG6fMRfb4npC1Y9rLcRfuKKb/KO+jEHrmwDf5tB0aYrwFB6heGOcbc9gojjyB6r6ureCZJhbTO9RysBqkVRYrAtBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4uOe6sSZld2TuaaPpQhniUFETrGQ/7LyxQsreInOrEc6ODXGWFMyT41ZhVdNZkeYzVKCe0Wr1fmkEiSLZKwRVTnmV/KABT1n1FSp1Eb2N2wPnugoQXb8/e3i57A4/zTXT8H18C6kROclhZOn4HwsjqnNPSB4Wv7HuWxUboKMlloBMt9L3saRV/FcCtgbFbRRci/ns3v1/UQw4n4CoDYi1MBlp4YmxhP/qE5gqccYzPfQDXCcop4Tl68svmwHQQlc2Eu47VdlYPSRdXaJfVlhTVRWdLSymbE69F3Uvmanj8NjB9HYNIxmjfGSeohPKQbVxBAkOg32f7l9poT6xtstEsvpgJp+1Qin3YDu+sX3WdiHfMEtuqD8108sv8b+YJtmDzRjnPI38w/RLAPwoVyf1xJudMruL+/H/ZKrJqSNGkFhylPe+LyYUkPsoFCXgx/9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 11:55:21.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae48f8c6-946d-42c2-8aad-08de9f9cdd89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
X-purgate-ID: tlsNG-720697/1776772527-80979161-50E45FB4/0/0
X-purgate-type: clean
X-purgate-size: 973
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 90EDE43A584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/04/2026 13:06, Oleksii Kurochko wrote:
> 
> 
> On 4/20/26 10:03 AM, Orzel, Michal wrote:
>>
>>
>> On 16/04/2026 16:21, Oleksii Kurochko wrote:
>>> As domain type is part of common code now there is no any reason
>>> to have architecture-specific set_domain_type() functions so
>>> it is dropped.
>>>
>>> The CONFIG_ARM_64 guard in xen/arch/arm/domain_build.c is intentionally
>>> left unchanged: it is ARM-specific code, and ARM_64 selects
>>> HAS_DOMAIN_TYPE, so the semantics are identical.
>>>
>>> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
>>> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. For x86_32
>>> it is fine to follow generic is_{32,64}_bit_domain() implementations.
>> I thought x86_32 Xen no longer builds. This means the fallback is only for arm32.
> 
> Will you be okay with
>    Since x86_32 Xen no longer builds, the fallback is currently only 
> relevant for arm32.
Yes. I would.

~Michal


