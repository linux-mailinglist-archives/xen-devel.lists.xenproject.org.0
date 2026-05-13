Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DQBIEpdBGqiHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:15:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D048D532045
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307843.1579412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7YK-0008Io-Lj; Wed, 13 May 2026 11:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307843.1579412; Wed, 13 May 2026 11:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7YK-0008GC-Iz; Wed, 13 May 2026 11:15:00 +0000
Received: by outflank-mailman (input) for mailman id 1307843;
 Wed, 13 May 2026 11:14:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7YI-0008G6-Nu
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:14:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7YH-004Sjl-Up
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:14:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045d1d-5cb7-0a2a0a5109dd-0a2a4507d862-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:14:57 +0200
Received: from [40.107.201.44]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045d2f-229c-0a2a45070019-286bc92cc0d1-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:14:57 +0200
Received: from BY3PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:39b::32)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:14:51 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::64) by BY3PR05CA0057.outlook.office365.com
 (2603:10b6:a03:39b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Wed, 13
 May 2026 11:14:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 11:14:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:14:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:14:49 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 06:14:47 -0500
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
 b=QO4gTSTjCUIQU6BrRFsak6fSQeCq79A3W2uomMWCgi+UB5A/Ja2K33Zx/2hZVkywPxEFpqHO5/YxNln6KowD8HNKKVZ2J8tc3XLWLQIn5gKelwR4X1Q5RhEYQiW1aLYYScJB2920JyiWqyqvcOHqmwFTidwO9GXYCMFI661eaZPgPlN7vG3acjrqb7sjwsI8ffF8U4suvKnN319j6ZsU20qXNQCwzUpK8zniUm1RoEvCmwOExTN7iLotGkBe/a8JoyCPDE3Qv0GUTAKzDEl3asMaQQaOJDYeuNJw/Hl0nC0iIG+CXb9q7Dl1oVUXQCrhjnQ5FkryLZFYQtrqbVdD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/OLRIHqLJektnMGyGVA0cjMD0CGXKpbqesJdkd3mcg=;
 b=OQItAywQfF0YvThZ3b9UcUPTQ6gKF3IjDsM/vZiDSAqoeAB8Y1+uygZPdhmhiLzxCrVPRVHigao4qZY2vf1+LlDC4hMWUo5qxZdt8GTnPP+JVkBTucRk1eq4XamAyUNWDmlrJRpSiizx2eMBO77lb6vQJbi8aHwsXEcR+TAdSS0rCd6pK2pw5QCroUuakOMw/8LhJZut8MpX0IsrlXUgFQ6x96MQ38bx455R29cGcvBNSjV7+Pmh2X9oESbZvziiWPdda4MvbANXqTUKZHwHOBcHDP7UcKu/M6sodl5lZuwuztkB40k8e1tvZt8sX7XqK29D81hIiC5x1lLqhPd+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/OLRIHqLJektnMGyGVA0cjMD0CGXKpbqesJdkd3mcg=;
 b=Ygpg6HYLL8S2Qti+A2Ht77BA4FivyGNgd0WSXuPFzNsADfri3T4eRofCKgby2WFNO6YSl5aX9qu+vvdGIpqP0C3TY2Z5nKnyolknNb3+heAvX/H5qA+pDF/Uut0V2VQUmvJghONMkE9Y/GtJDizmMJghPAMaNmUJjhyG5sIGq5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <46c3f430-77a6-4baf-9597-17873e0782c4@amd.com>
Date: Wed, 13 May 2026 13:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] xen/device-tree: use p2m_gpa_bits in common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <da9139f28ec72a7a2b9be949e67d57693af8b780.1778140240.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <da9139f28ec72a7a2b9be949e67d57693af8b780.1778140240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b1f939-66bd-4999-8b90-08deb0e0d9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aX9/frkfL+Yq2mFj4LA85nBDtid/uHbczwsCCXJvCI++No6T1vE7OSdRveElHPWJJvy3IiKpI+ez4MYuIZsOAP3GyQ2RGUa3IY1H3j0prse2nTL36RsaO98ZQ2JAjSCLdhzyOipMVMAQkpTfoKE0jmguwMOFtKHJZfN9w5P2WapfSmMqrnyVr5vXatgxahWaqLAUxtDbvZhlCIxnyBCevFaYXrG7+p/6Au6ZcCoGXnGbbG2pdCJcGahnBTyGUgn4R5wXyGb+Ci63RZkiCGr4Xjv+2CWO6terVgcjAqFXNpyBthvujNnB8f/kmr90oZQvHAPZfm8RO/rXLeFeYeGVneiBJrMoTfedoyEyxwP8/Po3gzhB3uMxtrXkkSXfEGLTY9goBjz914oGwCrY1mMcktYthcc4ny3YfVmvn6EiDVDtmK2+09Xq5FZ8M1/yzXBYf6o8iSFkXSLEOjsnRdkb0KObEvgIhzV4hPMnewhwlFq2NFG0s5GqcEVEnC1+VPY0Pl4BAJ8If0QW2O1s+KYmHIBr/mP6DYu2y6EISJdwEQE9azpeEu3umOCAXfEARFBFIR7LbDTZB433xwxNW07DIL5PmzLyGf1CAFIm1ZavWJM7ghuvzg5I3kju9DSTKimre/hcLgU12HgTVNV1I2J0lqEOjARdhmsSaizeonLQ4XAX+rBt33+QeffNVWx/6yRXmi6v0mlOtq9xKjVE8i5iw49PO06HzPWkoxdLS+LQKag=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sETQaRTG4/nT/w9NieA+6ZuCNhG9WBzEk/YfMQbD4czIUvvsDpxIwG0NiNYnOoaqmONnG6RSNWWgsUvzTTb6JCwGc4ReuxQ2+jPr0bLPWb0Q+nUHh8+cQqytirMsUc0/qA0KhIndB356YsvCUzXIgJtSxlb9dvK2I9CXegVuz7yku99uZ5nrZ4/HQQdwu3LyLaHUgH3aN7Co9hGfq15gxVrK6nFdPMHy1TOs+KPQpLbnjYNgQzmiqkKVBWmAoGd3y9vfsZi4JERHIi4rYZaDZV4VHfGOelYLxllqtRw5CiiaMhclDjuXGgsorJqI7izsokX7pTca1MYgXgzTyg3jBLJefklNREb2m1uJDJgPUvEVUcgK4GCu3ua1C5xjNWjIxj5gVlBJIRiDnBUzRfBSN4pVc8G7NJu8mNmvdVFRu0YGVeZituGfb9yutjMjjMKy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:14:50.8324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b1f939-66bd-4999-8b90-08deb0e0d9fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
X-purgate-ID: tlsNG-ef75cf/1778670897-21364C48-C00B3392/10/73395122804
X-purgate-type: spam
X-purgate-size: 1560
X-Rspamd-Queue-Id: D048D532045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
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
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,amd.com:mid,amd.com:dkim,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action



On 07-May-26 10:58, Oleksii Kurochko wrote:
> The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
> p2m_gpa_bits to use architecture-neutral naming in
> xen/common/device-tree/ code.
> 
> No functional changes.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v5:
>  - Rephraze commit subject.
>  - Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>.
> ---
> Changes in v4:
>  - Nothing changed only rebase.
> ---
> Changes in v3:
>  - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
>    renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
>    changes clearer and keep using Arm-specific terminolgy inside
>    Arm code.
> ---
> Changes in v2:
>  - New patch.
> ---
> ---
>  xen/arch/arm/include/asm/p2m.h        | 2 ++
>  xen/common/device-tree/domain-build.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 010ce8c9ebbd..7957dbd96e57 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -14,6 +14,8 @@
>  /* Holds the bit size of IPAs in p2m tables.  */
>  extern unsigned int p2m_ipa_bits;
>  
> +#define p2m_gpa_bits p2m_ipa_bits
This deserves the comment e.g.:
/* Common-code alias; ARM keeps the IPA spelling internally */

With that:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


