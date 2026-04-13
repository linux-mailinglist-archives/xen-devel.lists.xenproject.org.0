Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMV9MHK33Gn2VgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:29:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6633E9D80
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280971.1564045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDb8-0004YR-DX; Mon, 13 Apr 2026 09:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280971.1564045; Mon, 13 Apr 2026 09:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDb8-0004W8-Am; Mon, 13 Apr 2026 09:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1280971;
 Mon, 13 Apr 2026 09:28:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCDb5-0004W2-U7
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 09:28:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCDb5-001hd1-6A
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:28:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69dcb74e-5cb7-0a2a0a5109dd-0a2a4505a474-0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:28:46 +0200
Received: from [40.107.200.42]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69dcb74d-3760-0a2a45050019-286bc82ab93e-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:28:46 +0200
Received: from PH7PR17CA0016.namprd17.prod.outlook.com (2603:10b6:510:324::19)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Mon, 13 Apr
 2026 09:28:40 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::36) by PH7PR17CA0016.outlook.office365.com
 (2603:10b6:510:324::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 09:28:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 09:28:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Apr
 2026 04:28:38 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Apr 2026 04:28:37 -0500
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
 b=o33ikn9K0N++3sd/4gZcJlSG+FgIe+4grtWp3idkhgWNxVSvJVQU8Q9+t7eUf79y3BAYYvoQ74JEopMSK+eTqRj3NkLnNnfki5yGekOfMYxND3gJO4E92T76IywD31ehB8fgTNCT+k7JhY3xRSyWoSkdiGmjsFCXnw8g0RE4UZb5GS05YEUZhezy+gpYhxU44DlJGI9yAP89YK1n0gvx+Yyt7J/gx6YwWJfFT+MWeBmbhUfTlAlmc9Zj128LHSdEVz9KVH3mfs0kadZhzWnFdrqTmkFvNMYsRO2fFB2de/Qn/3zDYupEh4/yTQNXLcxJBAhMcFVWvmb0EPo6Jqzsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDc4jlx/byKWJZIdOHsPmUYlHd6aYeOMBI//7TUKHho=;
 b=Vdgg8neBD6ABxp2u703QMkl7iYDW280ZHxsNAbuXiI5QMkrOXL2rf83xX3CP6S2e2w63cP5bk4VN0Ui42IBpmhPW6asv5fMPI409Gdw+i/K2Qs6pNWr8+Lc8BT+a9fqT8XMYyAOJx9zeDQiISyeFgDYKFFTC/+F81eMHpexF9fzgwHrGoYlkZgpEzXg9CVUGnafO2BjhYsQSe1imTFGIXB/tIkCTgJyceoUC2GZ8v1breCnhxwCGMz5QEqIVLkdf4GRdUXgQD/p1D6kwVZYz/J0S58lnBqwudLEITq8nA2YRt1CAn/AC6oFYX5mqUgku+JIFR3O1Hg1vbIWIjWjHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDc4jlx/byKWJZIdOHsPmUYlHd6aYeOMBI//7TUKHho=;
 b=SappMDnzg3VDOWsirSnEghBMzgCClHp29eV0PqenPVKs/oORDTbbnvX69NZk2yC1iXPkU697ivw9toOk7V+9wvFWolai4cAdktE2PWKaQj+2JrVfFZhKf2k/7QMdhntwYJ+GqdDRcj2N2Mpv1f5mWG/+XoehpHTNTQpKHuhFq14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9cd3e2f1-1b6f-4946-86c2-ff72f34ba138@amd.com>
Date: Mon, 13 Apr 2026 11:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/gicv3: Decode cacheability fields before comparing
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
References: <7c20230fcd388ebe398ce19a21a1cd3c2c73d5fa.1775839987.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7c20230fcd388ebe398ce19a21a1cd3c2c73d5fa.1775839987.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 934dee65-422f-4468-c043-08de993f0c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MdgfiyzxC4g5YbpD6DRIvXmzkORas7Xv0BgLNdKIH7N6E3cKdrOhyCnUwTF3rvYR5it1+h2sp1kt5Qhy6g5VfMPj498y0X9LS9rzPYba5qVlnB4mWVg69P0XGIQq2mIJ3Khb2+dO9KGea4iySU6KstHgv1L7h9AyE9QLdUmfWNVYrtQJamp66hr1Wv40ZyTEhyW0l26Mkh9QxxUs4O+ARLQX7vGO3wYvSJdNYOCDXvddBD1t39MNGOzkC6Cs8RpJrnZUsJ8B2e0nqa0dsQwz/Qh2WvB1UB0L8Dsx2XDKdRXV/HlODEPC/gnRpGNUi1yShdsf4vnL+7dFxh5aQp6XXB/J+wfoJ8kbwbFbApiDZMpwGuVnBQdgPXtglCVOvxVaajjJjR1Z4vWpWSdOV0HfwBHvLpAvVNBEpTTcfydtNmMnG10rwRhMEtlZuimotdcGjiIOo6y0GyqOBS7tuE9SqmMKVQ3El/yxPInaEmiomeL99raZ55AgUTKgYriDFw4ycOkaPOTI2e43M1GIjsxCsUb/eL865QKLeWn6e2RbtdIVll/l5oBmXamEKHuWax5s25f0u2qhj7Eo73bGSJzApCgxW29JjSwSXCYWhrwp5Dtizk3K4q8J3WzhfFQn3KQUAKUQ48suV4WkY/tN3eNVZdd6NmKZBbUD2mqTnrvg/RNL1wgXUFbFX+DL7iSzPilmD5nzLNOLu99M1NEC4qrlH1Svg+pVQZPeiR8lrB+IobccHytfYtbLsHJGYhmEihVG97y4JqVCG8SAStV3tzPIMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cotAGUNJafk1rHFX2e+If0Sejl7Eg7cwoCJT0fgCxSJ9D3byp1Ld290NtKbsoz32IhhN0A9pGMpi1LoKbLJq8UI15rWEVsppZCdRmIW15zDUQNsSDzn91uMDC0PUk1eAXhuu6K5qRRyrQ2VGpk+Goiq4iKM7VYwt7wa/Lvhs5/oQy9lQptzExpMxXAqep3iLpq5h0V+AKQp/8Mb+6XLguBgFlnN/UX28W79RQhBnBFpr2IJPqp6hHtu9BnaE39TWA/DuhUUueC7HN3eZsExEP090QEIN+frKCzH23mDvPNYFex7thU5nKTwLYPFEuoZ4uX3fXSw84ETxFspVCyN/y5g/uFQpoqVjCDYPfMXeFu+fxUmj9dMDLKSBfyY5/puPofpgXhnAiHidSBfMCliTckuuDgtYJJCSi/fLFtGTyi4/4KRxey08Ah1eMC0LWVEw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:28:39.9337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 934dee65-422f-4468-c043-08de993f0c38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
X-purgate-ID: tlsNG-c201ff/1776072526-3093196F-7FF54ED5/0/0
X-purgate-type: clean
X-purgate-size: 3521
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email]
X-Rspamd-Queue-Id: 1F6633E9D80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 10/04/2026 19:34, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> GITS_BASER_INNER_CACHEABILITY_MASK and
> GICR_PROPBASER_INNER_CACHEABILITY_MASK are shifted masks. Comparing the
> masked but unshifted values against GIC_BASER_CACHE_nC, which is an
> unshifted enum value, leads to incorrect detection of non-cacheable
> GITS_CBASER command queue, GITS_BASER tables, and GICR_PROPBASER
> mappings.
> 
> Use MASK_EXTR() to decode these cacheability fields before comparing
> against GIC_BASER_CACHE_nC, so the backing memory is flushed when
> required.
> 
> Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
> Fixes: 05238012b86d ("ARM: GICv3 ITS: allocate device and collection table")
> Fixes: c9b939863c89 ("ARM: GICv3: allocate LPI pending and property table")
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - use MASK_EXTR() instead of open-coding the BASER field shift
> - fix the analogous PROPBASER cacheability comparison in
>   gicv3_lpi_set_proptable()
> - fix the CBASER command queue cacheability check as well
> ---
>  xen/arch/arm/gic-v3-its.c | 6 ++++--
>  xen/arch/arm/gic-v3-lpi.c | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 9ba068c46f..e87465d2ff 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -424,7 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
>       * If the command queue memory is mapped as uncached, we need to flush
>       * it on every access.
>       */
> -    if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
You don't seem to mention this change. This one does not compare to
GIC_BASER_CACHE_nC and checks against 0, which means we are on the safe side. If
you still want to change it, then you should also look few lines above where we
have:
if ( (reg & GITS_BASER_SHAREABILITY_MASK) == 0 )

> +    if ( MASK_EXTR(reg, GITS_BASER_INNER_CACHEABILITY_MASK) <=
> +         GIC_BASER_CACHE_nC )
This is a functional change. Previously we where comparing against 0 and now you
compare against <= 1

~Michal

>      {
>          its->flags |= HOST_ITS_FLUSH_CMD_QUEUE;
>          printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
> @@ -496,7 +497,8 @@ retry:
>          }
>          attr = regc & BASER_ATTR_MASK;
>      }
> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
> +    if ( MASK_EXTR(regc, GITS_BASER_INNER_CACHEABILITY_MASK) <=
> +         GIC_BASER_CACHE_nC )
>          clean_and_invalidate_dcache_va_range(buffer, table_size);
>  
>      /* If the host accepted our page size, we are done. */
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index de5052e5cf..9ee338edc2 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -351,7 +351,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>      }
>  
>      /* Remember that we have to flush the property table if non-cacheable. */
> -    if ( (reg & GICR_PROPBASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
> +    if ( MASK_EXTR(reg, GICR_PROPBASER_INNER_CACHEABILITY_MASK) <=
> +         GIC_BASER_CACHE_nC )
>      {
>          lpi_data.flags |= LPI_PROPTABLE_NEEDS_FLUSHING;
>          /* Update the redistributors knowledge about the attributes. */


