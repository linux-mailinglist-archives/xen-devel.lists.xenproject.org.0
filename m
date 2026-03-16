Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLxQGyt4uGn5dgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 22:37:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73BF2A10AD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 22:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255812.1550627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2Fcf-0006jS-Vv; Mon, 16 Mar 2026 21:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255812.1550627; Mon, 16 Mar 2026 21:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2Fcf-0006hH-TD; Mon, 16 Mar 2026 21:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1255812;
 Mon, 16 Mar 2026 21:37:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wxl=BQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w2Fce-0006hB-5q
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 21:37:12 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4852c03e-2180-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 22:37:09 +0100 (CET)
Received: from CH0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:610:e6::7)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Mon, 16 Mar
 2026 21:36:53 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::73) by CH0PR03CA0272.outlook.office365.com
 (2603:10b6:610:e6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 21:36:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 21:36:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 16:36:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 16:36:52 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 16:36:51 -0500
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
X-Inumbo-ID: 4852c03e-2180-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOs9YQRlo3lVyBz1vSj4b83aujd64gH3kce+l2iwo4cZ50SnRYkxjKXiYg+DF+yl1O98tEuvYNj7vpxLp19Q4M0F6noEQ0rrdlz2sjkNAg+VBaswftTPmTEVfp+ZG8uiSg+FThzOi76+XsBE7OcEles5m/EEJk1qIYXsCmtVSn88+qJ5VSOCBsYcaTRJNF9qdsdjs4pfDnsg7e+kgkcxsOKKFRvXEhBSICqw22o55tOoma8ej22yxxQ0QK6fZVgIEMwQkfHBVYRhb/PDrrwmUvqe/r+r9Z7Dp1FP4xhjb7aT4t9ko1IcQWh/s2efTs0coZCLRsrkkPI7ItI7z9gHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PMWSnaDhlLMDhDpWY6r+RsR0wkz8VRoSVDbqagQo1E=;
 b=Q/XdZZpHH5tW7NP4CkBOx2kaK3BaMYif8ZydOfCYIe4u8qwHuPdbUiriiVhtn+4wzZzbR33IjxB1mq0ubpZYiI16APyXIC5hIFxmJoOPRv0J4bxnywMNBlnLCrcHu/PTfzIqMXFgrPBIweNL9FL8ZfYay7Wzm7CZQWb10y2qnhoEM4+Khd/NtJiBml/+9iT6G7hwa0Izg1r3la3PGErnRFsnc3YgStWLSpda5gHZJg+y7hnSr435xI112tLjTwf2VH3leJiVX/2Wk3n1ULZKiHK1Negx2xDFr6JccBcsGnXCoqrgdfrDJLv1kTiMg7Ke6iGT5eSgYIfUyr+BdynStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PMWSnaDhlLMDhDpWY6r+RsR0wkz8VRoSVDbqagQo1E=;
 b=KuraBnMn5zuUnHscRgu2kZxWmjm8eZsHboaCXUNlvw+FJWfq+QnCBus2VpQvT1ZujgWLrv2ppG5aGcV9VH7L2kvwADPegefUTDXpchEKZmZ3GpWZUSOVTtb7ZaULySZ4DRLLZs8bw/7mF0ci8rOwiMBwoYHP+9gzu/L888WBkZ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9e3c18ce-814d-420e-81af-7ef8691a6efa@amd.com>
Date: Mon, 16 Mar 2026 17:36:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] vpci: Use pervcpu ranges for BAR mapping
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 5834e19d-e62b-4c00-f40d-08de83a423d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/XV6H/X3W6X0mTpJuJrVG7OpQ0WoKl5QzV6adySWKqLWJuL3jqrKTNmqhdWxfuQOvhJRKofWjm6aJouJviDltQ2bakqEI0mn5xmoEag/bfY/xEtHFNJZKsjJWRlb1CZiw+bJJ7gDR9BbBQCwMEaU8rOs5I5MYoFAQPQWqmEmDP9jHTHgmlJULrP7QjpunPJN/UPt0Z0B1x4yIlO2A+1AJ6NEMq/EJOD8IUPVZyAV7kkZoG29TP1iEeJUSZlArL6h08I9sduTNcfcy1iXmCMf0E09b/gxz4ndUUoEgKOs6oJeAmxVMpYDSavp9n2KqEwlgalVnYtQFhKqoUP6SAtiCj3xZnjcKF0nHK0WPkzwOZpBe30uzc2xNkNNQd8Ukzmyv0atPk/WNDqE4w6c4EwbHYaWAF/rNURGJ734K7PzULwPO1UDf6zZjBxOIwFneX2PYSBymkwS3evYhh2EjXPvHv4mAgKGkRc6Ct7SWdBaih3QtCu5WbW7v1VUzrRsu9rug3Lzoj84cobWxk2Sbpf1M5/thiy0yirfq8SZI0S1Qz0JIy18l89x2sDf0Jebk/znhOQMOKrTcd1OdrWTXtyuJKV1ZEg3XwYrKAgtGUr72dB2pSTV/ukrL4DP4sJS6JLB4HLWfMqHB9Dn4EULalBZf6/gHego/kkNiw6fptCbOyHvfDfCmBaGQA02BBW1/xQrPuwo7zMbOvNmuMLp2T6Uk2dNrSKTC7QlHuWlzC+JtGYZahMUqKKyPCiayji4ZRNzgRmISH8WfXxOB7ea6PQxifMNChZu+TeXDG0Vlz28ao8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CdjTvrWx9l1oqiTiFpxjRkqaDBkRbe3LW1zx5AcrkjSpBtSM8VfwuAs9euZv28DrtVt0iSJw3pjADCH+qZRPbvrfnUz7smTPyhy9Ds1YokA2x+jKJVW5M9LT22Od2kVEICniixgHQww/Ia+y/tpAUE2JOvAxH9/z5jatsmISqiIl+JltjwHj42qNPgMQXr6PaopQjFB06x+dj53VCi5SEdNE7vbcdltWs7nIwHuw7MROIFbjKa8jkWSTSYZV7pKwbglQ3uW55+0vevn8kl9nCDv110c7JJ481XG4it8OQ6x2JRPiYJK8YXkd8x2euoCrwheX9PFQcuodv8bhYSVtjxBgZo16jAXX5Yxq5fWk06nnF/egTe6Uh7fGadpo0rOob2zYlOK61nXp/CUO3gFxI+1tsVoVK2AhGRTk1DKEwG2my4b8kyPzNi6/SmfLpAvp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 21:36:53.1690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5834e19d-e62b-4c00-f40d-08de83a423d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Queue-Id: A73BF2A10AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 07:08, Mykyta Poturai wrote:
> There is no need to store ranges for each PCI device, as they are only
> used during the mapping/unmapping process and can be reused for each
> device. This also allows to avoid the need to allocate and destroy
> rangesets for each device.
> 

Thank you for this.

Consider adding this tag:
Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")

> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * new patch
> ---
>  xen/common/domain.c       | 24 ++++++++++++++
>  xen/drivers/vpci/header.c | 66 ++++++++++++++-------------------------
>  xen/drivers/vpci/vpci.c   |  3 --
>  xen/include/xen/vpci.h    |  4 ++-
>  4 files changed, 51 insertions(+), 46 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e06174fca7..76b0163616 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -454,6 +454,14 @@ static int vcpu_teardown(struct vcpu *v)
>   */
>  static void vcpu_destroy(struct vcpu *v)
>  {
> +#ifdef CONFIG_HAS_VPCI
> +    int i;
> +
> +    for ( i = 0; i < ARRAY_SIZE(v->vpci.bar_mem); i++ )
> +        if ( v->vpci.bar_mem[i] )
> +            rangeset_destroy(v->vpci.bar_mem[i]);

Paraphrasing some previous feedback from [1], you might additionally want:

    v->vpci.bar_mem[i] = NULL;

or introduce a RANGESET_DESTROY() similar to XFREE().

[1] https://lore.kernel.org/xen-devel/20250723163744.13095-1-stewart.hildebrand@amd.com/T/#t

> +
> +#endif
>      free_vcpu_struct(v);
>  }
>  
> @@ -511,6 +519,22 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      if ( arch_vcpu_create(v) != 0 )
>          goto fail_sched;
>  
> +#ifdef CONFIG_HAS_VPCI

Would it make sense to introduce a vpci_* function instead of #ifdef? Same for
the deallocation above.

> +    {

I'm not sure it's necessary to start a new block here.

> +        int i;
> +
> +        for ( i = 0; i < ARRAY_SIZE(v->vpci.bar_mem); i++ )
> +        {
> +            char str[32];
> +
> +            snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
> +            v->vpci.bar_mem[i] = rangeset_new(d, str, RANGESETF_no_print);

This seems to be performing an allocation for vPCI even for domains that don't
have vPCI.

> +            if ( !v->vpci.bar_mem[i] )
> +                goto fail_sched;
> +        }
> +    }
> +#endif
> +
>      d->vcpu[vcpu_id] = v;
>      if ( vcpu_id != 0 )
>      {
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 07ec991a12..cb64d9b9fc 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -195,6 +195,7 @@ bool vpci_process_pending(struct vcpu *v)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = v->vpci.bar_mem[i];
>          struct map_data data = {
>              .d = v->domain,
>              .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> @@ -202,10 +203,10 @@ bool vpci_process_pending(struct vcpu *v)
>          };
>          int rc;
>  
> -        if ( rangeset_is_empty(bar->mem) )
> +        if ( rangeset_is_empty(mem) )
>              continue;
>  
> -        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> +        rc = rangeset_consume_ranges(mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
>          {
> @@ -223,8 +224,8 @@ bool vpci_process_pending(struct vcpu *v)
>  
>              /* Clean all the rangesets */
>              for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(header->bars[i].mem) )
> -                     rangeset_purge(header->bars[i].mem);
> +                if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
> +                     rangeset_purge(v->vpci.bar_mem[i]);
>  
>              v->vpci.pdev = NULL;
>  
> @@ -259,13 +260,14 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = current->vpci.bar_mem[i];
>          struct map_data data = { .d = d, .map = true, .bar = bar };
>  
> -        if ( rangeset_is_empty(bar->mem) )
> +        if ( rangeset_is_empty(mem) )
>              continue;
>  
> -        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> -                                              &data)) == -ERESTART )
> +        while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) ==
> +                -ERESTART )
>          {
>              /*
>               * It's safe to drop and reacquire the lock in this context
> @@ -330,12 +332,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = current->vpci.bar_mem[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>          unsigned long start_guest = PFN_DOWN(bar->guest_addr);
>          unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>  
> -        if ( !bar->mem )
> +        if ( !mem )
>              continue;
>  
>          if ( !MAPPABLE_BAR(bar) ||
> @@ -353,7 +356,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        ASSERT(rangeset_is_empty(bar->mem));
> +        ASSERT(rangeset_is_empty(mem));
>  
>          /*
>           * Make sure that the guest set address has the same page offset
> @@ -368,7 +371,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              return -EINVAL;
>          }
>  
> -        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
> +        rc = rangeset_add_range(mem, start_guest, end_guest);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
> @@ -379,12 +382,12 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          /* Check for overlap with the already setup BAR ranges. */
>          for ( j = 0; j < i; j++ )
>          {
> -            struct vpci_bar *prev_bar = &header->bars[j];
> +            struct rangeset *prev_mem = current->vpci.bar_mem[j];
>  
> -            if ( rangeset_is_empty(prev_bar->mem) )
> +            if ( rangeset_is_empty(prev_mem) )
>                  continue;
>  
> -            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
> +            rc = rangeset_remove_range(prev_mem, start_guest, end_guest);
>              if ( rc )
>              {
>                  gprintk(XENLOG_WARNING,
> @@ -394,7 +397,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              }
>          }
>  
> -        rc = pci_sanitize_bar_memory(bar->mem);
> +        rc = pci_sanitize_bar_memory(mem);
>          if ( rc )
>          {
>              gprintk(XENLOG_WARNING,
> @@ -411,14 +414,14 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
> +        for ( j = 0; j < ARRAY_SIZE(current->vpci.bar_mem); j++ )
>          {
> -            const struct vpci_bar *bar = &header->bars[j];
> +            struct rangeset *mem = current->vpci.bar_mem[j];
>  
> -            if ( rangeset_is_empty(bar->mem) )
> +            if ( rangeset_is_empty(mem) )
>                  continue;
>  
> -            rc = rangeset_remove_range(bar->mem, start, end);
> +            rc = rangeset_remove_range(mem, start, end);
>              if ( rc )
>              {
>                  gprintk(XENLOG_WARNING,
> @@ -468,8 +471,9 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
>                      const struct vpci_bar *bar = &header->bars[j];
> +                    struct rangeset *mem = current->vpci.bar_mem[j];
>  
> -                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
> +                    if ( !rangeset_overlaps_range(mem, start, end) ||
>                           /*
>                            * If only the ROM enable bit is toggled check against
>                            * other BARs in the same device for overlaps, but not
> @@ -480,7 +484,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                            bar->type == VPCI_BAR_ROM) )
>                          continue;
>  
> -                    rc = rangeset_remove_range(bar->mem, start, end);
> +                    rc = rangeset_remove_range(mem, start, end);
>                      if ( rc )
>                      {
>                          gprintk(XENLOG_WARNING,
> @@ -733,18 +737,6 @@ static void cf_check rom_write(
>      }
>  }
>  
> -static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> -                            unsigned int i)
> -{
> -    char str[32];
> -
> -    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> -
> -    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> -
> -    return !bar->mem ? -ENOMEM : 0;
> -}
> -
>  static int vpci_init_capability_list(struct pci_dev *pdev)
>  {
>      int rc;
> @@ -989,10 +981,6 @@ int vpci_init_header(struct pci_dev *pdev)
>          else
>              bars[i].type = VPCI_BAR_MEM32;
>  
> -        rc = bar_add_rangeset(pdev, &bars[i], i);
> -        if ( rc )
> -            goto fail;
> -
>          rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i == num_bars - 1) ? PCI_BAR_LAST : 0);
>          if ( rc < 0 )
> @@ -1046,12 +1034,6 @@ int vpci_init_header(struct pci_dev *pdev)
>                                 4, rom);
>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;
> -        else
> -        {
> -            rc = bar_add_rangeset(pdev, rom, num_bars);
> -            if ( rc )
> -                goto fail;
> -        }
>      }
>      else if ( !is_hwdom )
>      {
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index f66f50c8ba..af61b521b0 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -357,9 +357,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>      }
>      spin_unlock(&pdev->vpci->lock);
>  
> -    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
> -        rangeset_destroy(pdev->vpci->header.bars[i].mem);
> -
>      xfree(pdev->vpci);
>      pdev->vpci = NULL;
>  }
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index dd233b8b03..fa654545e5 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -118,7 +118,6 @@ struct vpci {
>              uint64_t guest_addr;
>              uint64_t size;
>              uint64_t resizable_sizes;
> -            struct rangeset *mem;
>              enum {
>                  VPCI_BAR_EMPTY,
>                  VPCI_BAR_IO,
> @@ -212,6 +211,9 @@ struct vpci {
>  struct vpci_vcpu {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
>      const struct pci_dev *pdev;
> +#ifdef __XEN__

Why not enclose the whole vpci_vcpu struct inside __XEN__?

> +    struct rangeset *bar_mem[PCI_HEADER_NORMAL_NR_BARS + 1];

Maybe add a brief comment explaining the + 1 ?

> +#endif
>      uint16_t cmd;
>      bool rom_only : 1;
>  };


