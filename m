Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP2FDcj6D2qCSAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:42:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F155AF9D3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316341.1585735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJa3-0005fZ-9P; Fri, 22 May 2026 06:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316341.1585735; Fri, 22 May 2026 06:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJa3-0005cs-5p; Fri, 22 May 2026 06:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1316341;
 Fri, 22 May 2026 06:41:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wQJa1-0005ck-71
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:41:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJZz-005owH-Dg
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:41:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0ffaa9-5cb7-0a2a0a5109dd-0a2a4503a63e-12
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:41:54 +0200
Received: from [52.101.56.22]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0ffab1-672d-0a2a45030019-346538167bd9-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:41:54 +0200
Received: from CH0PR03CA0099.namprd03.prod.outlook.com (2603:10b6:610:cd::14)
 by SA1PR12MB9546.namprd12.prod.outlook.com (2603:10b6:806:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 06:41:47 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::55) by CH0PR03CA0099.outlook.office365.com
 (2603:10b6:610:cd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 06:41:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 06:41:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 22 May
 2026 01:41:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 22 May
 2026 01:41:32 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 22 May 2026 01:41:31 -0500
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
 b=lMW4nRaRYiY5BU4tBdlLDnjZ+YRw5Rdo7gjWtBxYgYULMzDDXMOMi0Hms/rmK/M1s+azmKmHOn81C6IFq3ehgRDWZkh9BTPPmKcqE5IQfERIwfGFW28P9xUJUA4BZfFeZ933op9shPgnKY+nyL0bMP/EZQsJkPvaj9kUKeVnUKm6pnRV+lTjuovmzf1vaDHchN1HdkiSVgfiAbzm8GkSQK70SckdSgoOI3oB+4+tjkqwYQw4ADig2kY6oTeGe2g+7/3+PhVQLLCKgKg62+DiKsVz7IceGEfdbjPLjZ9HUeF8u9QUgnZpi1yZVGS7xUK7Qkff/feg7CvL8qIGmkj0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8+m850O2sFqNFDo2tE189VoTdEgwVkGBndWEojfCLc=;
 b=jUdtb25DWI2LsiXDC0AEKQU7pR6u4y503NHa4IUX3MbKWf9iKBkFXpeoY0gA4QBw6riof4cQURWy3YrAzPm2oCN4vct8+CaLLDyrhJx4DsRvs1MSPbM0ahf7MqkT3kH5pL5r0COZCqyqRWkxJqHj+DR+mDsQdBO/h4F5s7KyzauXpaiNBdlOJTWDz7wj7qR8pAxnQxTTn92CEIrTtdHXwlgTx1f4NqZ2kAmTPT9y++z6uJ1BPEIXCRvp7rOWRygvE08oHrtT3N9TWZGNufuaBo2IKlD54luPHiKDdAwDtg92CQC6UkM559rAkHbyiRcQaKsNTv+eKWfvZo2LI+VLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8+m850O2sFqNFDo2tE189VoTdEgwVkGBndWEojfCLc=;
 b=a/TJQTOedgecpLqSFFbDOdr1bjq/+eLm93vPtF2M7ERwqkqcg4U5Z//U6q3Gvp2/0Pyee0OnAiwi5yctiMVFN55rb5o3iHptlu4Smg7YwdA/WjEsRXH4up9Pc66NsyjEuaTXzYtpj5GkNZZrM/dMEIdUshsCZRjBLKO40Wx4mww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6ebccf8b-c90f-4dca-acf3-ea9cc0dd97f9@amd.com>
Date: Fri, 22 May 2026 08:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: scan CLIDR Ctype fields upwards when probing LLC
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SA1PR12MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e5f470-7625-490e-d8ed-08deb7cd31e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|18002099003|56012099003|13003099007|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	CDinYuX1VoUxdBGSBxSTVcWjR8kVRnH0hHUzZxktickX/BJUe+BzNU72RF3wlMLwMimMtpQx7jw1reo65395JJfWTMuqOhJfTFZq4FcV+Dpkau1RlFyOXzg5CD5J3guzZHx+NT6FR5BntnQEou3Ft9zwddE6GmmS+3Gh015UjG9ZzIdjOvQ9qNlNRDl5b0RQWGHtaQZZrb7W0Wp6BDjvaXaHWNwlEXptIbloYf7pCTBix/2Yxs2Kru1jaY/aTvL7kbG7fcEx5Xohy3jXhapSH8VbXZeSbtjjYE7/0YrYxloUuLLsHzt06Ux0VbmHDe7opo8wKRm9lvLLv2zR7g55xJC1Yi75dpCs+oeY+7vlGg9fD3hQN+Fgc3B3BsDuwbyLIQro+JQwp9S1cZ6Gjpa/HtMngrKSQJWiGBt71MTDzapzDmmnMAQv5AKAU47wm1nJC1iVkonNEAJpCfQ6bu/W961H//vdmafr8Aw7/R/bqNoS6rzd7rcGHAvWbBhu53ecui7T2JvNPjiaS5UbbETip17w5llTBvvpBSffQT1nkDAoH+T6OF2OAAVOezL+bkDLP1DFvCmeXkT8fvFgH/qADwuVfuavijzYvZeRs4ops3RgHeC681sXlFiqWQ5CSxsBcCKjS5dQ32MTgjQkpfiVKorS7lapP9SpiduPeYihvnAAK5OAY6EE41HqrtK7IZEmSvEHqnLtyIV1UBJvawdVKTUAFSrtO3w+vbF0N8JBHss=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003)(13003099007)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PG6ZooHySsiRm2CPBtL08ZGMrQZNLlG2DpKFmRq/TBmZfaobz3yPbRFjXUcNkNWtpA23BwRxGCDrMVYqALzU89IrmSTtsbjuoskWHElq44X7/oJZFH2e34hNycyVDOX6cDyrVAOkuZVkOuqqNETUTYpK8rxbnDQX84FCWp240zrAaPe/tPEnB0xtZAMylhRvEwQUvWkJAyIyIwtAKiEd7oBGSsrRZhjr1vMztyfylWl5m8ICxTUl4a/w1NgN12kZOgYHO8d3hhcWY9BrHeqSrCXzWwgGnW0lIZwO4+V9qncu+xqi1CNWq/bymBusuJBV+MihcV2w3tMvJSB9qO6rQwGQzwE9+PYubDxgNHWCrljq0pNLpKY0FujcKKNRNnmJd7tvEUMPW2Ly8Pb7xUJkvelC8Xk08HQyKs6f9/2QFuM21r3gDkSSthSJ42hybbhG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 06:41:46.6319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e5f470-7625-490e-d8ed-08deb7cd31e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9546
X-purgate-ID: tlsNG-33051d/1779432114-3774E938-7AC61543/0/0
X-purgate-type: clean
X-purgate-size: 3702
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,xenproject.org:url]
X-Rspamd-Queue-Id: 97F155AF9D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 04-May-26 11:19, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> get_llc_way_size() currently scans CLIDR_EL1 Ctype fields from the
> highest level downwards and stops at the first unified cache it finds.
> 
> However, CLIDR_EL1 describes the cache hierarchy from Ctype1 upwards.
> Arm ARM DDI 0487J.a, D19.2.27 says that once software has seen a
> Ctype value of 0b000 while reading from Ctype1 upwards, no caches
> manageable by the architected set/way maintenance instructions exist at
> further-out levels, and the higher Ctype fields must be ignored.
> 
> The current reverse scan can therefore select a unified cache level from
> a Ctype field above the first no-cache level. Such a field is not part of
> the architecturally described CLIDR/CCSIDR cache hierarchy and should not
> be used for selecting the CCSIDR level.
> 
> Scan Ctype fields from L1 upwards, stop at the first no-cache level, and
> keep the outermost unified cache observed before that point.
> 
> This preserves the result for regular cache hierarchies, while avoiding
> selection of an architecturally ignored Ctype field.
> 
> Fixes: f4985fce6f0b ("xen/arm: add initial support for LLC coloring on arm64")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> This patch follows the xen-devel discussion:
> https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00345.html
> 
> In that thread, Michal noted that the reverse scan was a simplification
> rather than an intentional requirement, and that changing the
> implementation would be fine.
> 
> Testing performed:
> - standalone synthetic CLIDR tests covered both regular and pathological
>   Ctype sequences and showed that the forward scan ignores unified cache
>   levels above the first Ctype == 0b000 while the reverse scan can pick
>   them
> - Renesas H3ULCB booted with llc-coloring=on
> ---
>  xen/arch/arm/llc-coloring.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 6f78817c57..3783f4c824 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -22,21 +22,33 @@ unsigned int __init get_llc_way_size(void)
>      register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
>      uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
>      uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
> -    unsigned int n, line_size, num_sets;
> -
> -    for ( n = CLIDR_CTYPEn_LEVELS; n != 0; n-- )
> +    unsigned int n, line_size, num_sets, llc_level = 0;
> +
> +    /*
> +     * CLIDR_EL1 Ctype fields are interpreted from Ctype1 upwards. Once a
> +     * no-cache level is seen, higher Ctype fields are architecturally ignored
> +     * for the CLIDR/CCSIDR set/way manageable cache hierarchy.
> +     *
> +     * Keep the outermost unified cache before that point.
> +     */
> +    for ( n = 1; n <= CLIDR_CTYPEn_LEVELS; n++ )
>      {
>          uint8_t ctype_n = (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
>                             CLIDR_CTYPEn_MASK;
>  
> +        if ( ctype_n == 0b000 )
> +            break;
> +
>          /* Unified cache (see Arm ARM DDI 0487J.a D19.2.27) */
>          if ( ctype_n == 0b100 )
> -            break;
> +            llc_level = n;
>      }
>  
> -    if ( n == 0 )
> +    if ( !llc_level )
>          return 0;
>  
> +    n = llc_level;
After a loop, n does not carry any meaning, so I find this assignment a bit odd
and confusing to read. Just use llc_level below. With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


