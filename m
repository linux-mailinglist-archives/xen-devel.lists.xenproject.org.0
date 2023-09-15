Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D087A1613
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 08:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602885.939685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2Hv-0005r2-Te; Fri, 15 Sep 2023 06:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602885.939685; Fri, 15 Sep 2023 06:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2Hv-0005jq-Q3; Fri, 15 Sep 2023 06:26:47 +0000
Received: by outflank-mailman (input) for mailman id 602885;
 Fri, 15 Sep 2023 06:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pea=E7=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1qh2Hu-0005g4-LV
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 06:26:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d66b872f-5390-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 08:26:43 +0200 (CEST)
Received: from DU2P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::23)
 by AS2PR08MB8832.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Fri, 15 Sep
 2023 06:26:39 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::6b) by DU2P250CA0018.outlook.office365.com
 (2603:10a6:10:231::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 06:26:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21 via Frontend Transport; Fri, 15 Sep 2023 06:26:38 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Fri, 15 Sep 2023 06:26:38 +0000
Received: from 347987f905f7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53FEDB52-BA9B-4093-BD2E-22C28645FD83.1; 
 Fri, 15 Sep 2023 05:16:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 347987f905f7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Sep 2023 05:16:00 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DBBPR08MB6043.eurprd08.prod.outlook.com (2603:10a6:10:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 05:15:58 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::af58:df20:64e1:4bf2]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::af58:df20:64e1:4bf2%7]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 05:15:58 +0000
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
X-Inumbo-ID: d66b872f-5390-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWSRnxr9yiJ6t4B82SJa1M0RPZ8q+bZWz0u+ddI1i6w=;
 b=FYTF7+XRT1iQWBxivs8GmhxH2vFtUsb1dvEOydrqxPSTwYT61nibNxuDkTLv48NsFf/WarU8YnTkIwji4z3VUlZnIjSq3oNlL6fDWSz4Hdt1L/mDY6z1UsE/kwthD33s8IWFhi7Ng3vdZmM8dfAeneHq6pCBwz9EZykAAYDFQgo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10e96dd523e2f3d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rzojwleyb9GB5ZsnLfK7ZeySuenCBw6SI2dZTmP7fq8OGT1OaB9pZWfj2a23QkV8wKvXRDMH6xTTJQvS38URFf8Uo72OaVW9XAwIqW6CzosW30F/LbQlWIKbFEmL+MZxEvHah8BVrkcAadR62ECI8XQFP1NEtE9DtS7/tDJAXbDMKupnIGk0OvZty1zIuS6dqAguKbuMtguaE/Tsqhe0SQUOoTuGnexJkXKRISR0R3i6s/NCDs0NBYuubZqx/zhzfav+fAgowFlJT6fNOQUoSaQpLIr/6QvJk9PNB68ys3edGLDayZzRHx1vJctQtB/QxIq4tDS+TlBfEQMjWx9E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWSRnxr9yiJ6t4B82SJa1M0RPZ8q+bZWz0u+ddI1i6w=;
 b=IhySR+Dwek7VtKKZ5Mk01a9VEQHhQkhEhCPje+Gm6dNmbStGjPxxp9+8SBo2YEREZp2ksMk2kpn2TI9yAgGViR9HYs2kOCfzW4DnHSZO+hv2ZFO1tTd5yZmUey0X8Rr4bw1dCu6MShZMz4THoa9JcPvD8YB/0uwjX8AwwCRJE7MR5CVKFseKKaE9ip11ynPfx1bJo+/uVzKz3EetOf3GZwG99/RKd4KE5csPO/KcllyZSVT0HCT8+R4ZU1N2wxO4aBFwSjxkGoSRkToVY0iOBgLKaitfNXT4km3y/jPcg7OJL9SN6kD4lcRyXpRz1nlOW/T7Jqlz0qmzS8goMKX+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWSRnxr9yiJ6t4B82SJa1M0RPZ8q+bZWz0u+ddI1i6w=;
 b=FYTF7+XRT1iQWBxivs8GmhxH2vFtUsb1dvEOydrqxPSTwYT61nibNxuDkTLv48NsFf/WarU8YnTkIwji4z3VUlZnIjSq3oNlL6fDWSz4Hdt1L/mDY6z1UsE/kwthD33s8IWFhi7Ng3vdZmM8dfAeneHq6pCBwz9EZykAAYDFQgo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <db6ea8cc-f9d9-d8cf-39ca-89b1aa364117@arm.com>
Date: Fri, 15 Sep 2023 13:15:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v1 16/29] xen/asm-generic: introduce stub header
 flushtlb.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jiamei.xie@arm.com
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <8f5e2ac850eced2153d68effcb36aca1ed065aee.1694702259.git.oleksii.kurochko@gmail.com>
From: Jiamei Xie <jiamei.xie@arm.com>
In-Reply-To: <8f5e2ac850eced2153d68effcb36aca1ed065aee.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0195.apcprd04.prod.outlook.com
 (2603:1096:4:14::33) To AS8PR08MB7696.eurprd08.prod.outlook.com
 (2603:10a6:20b:523::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7696:EE_|DBBPR08MB6043:EE_|DBAEUR03FT003:EE_|AS2PR08MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e9e05a-5d9f-404b-3332-08dbb5b4b7ca
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FzzybJZSHFuxuyivaHYMskDtGzvK6OFLtgNUBt/dNOTju0ydsRbS7eqi9Y9DUKjbJhFAgPwTUqLhNs2YWmMkHHyWHf2LFam94+iJdxGXfDlsVDoyLsSVPSWlw71OUYI+0Tw/pVkffZV5X+9pCLr7oYkBf7a0nLUtgRhVNuKw6e99iVPnvVowILbIaGzMpOGBjqyWldxVGPTR0n9TEX6gNvIJp65PtaSGJj7QxB0oXq5k2/UlTArX7dNHxUfCMsKEuxC0SYidojCRo/jTJE6MCwX8DMRjMeJduP3G7ZIKvd4yN53Lku8w0uU/DAlY7ob9bH6+YxknRyE0VmkiwL2LrXIKcBjMFJUpbgDi88dHmmLRt7cGOmbEBOgY5JtJDXctq48P7LqRcHSiBnU+eV2ZpxF2BKRwH1HbaJeQK5F6fwo50ik9uVns+TefVX9TcSdDPSog4eGre6Fu79edIli64tPvGtHzUhwBnpBBMOcjxn3j3fV54mnsw0BooJ1u/a91SBHDFPKpiTV+wPF3cDTkkGNE449PXx/XcBzcn/S8ZM892wwHUz+kditrrUUBapSLNzHLCqKhoeV0m6QmWrBOFDsZDjcawfLomN1w7/ZsjKu4vSjk7A9rVlwCN5XeGa8sLpEq04rsXei72wpzI9f4y/Jhuz7h24PzlLyGilc3IP6N9cPgY/kLNDVS+xoPrapCNMLiuRPZQQNgzR8KwmgRPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(1800799009)(451199024)(186009)(31686004)(36756003)(2616005)(66946007)(66476007)(66556008)(6512007)(316002)(2906002)(86362001)(31696002)(38100700002)(44832011)(8676002)(4326008)(8936002)(478600001)(26005)(41300700001)(6666004)(5660300002)(6506007)(6486002)(53546011)(41533002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6043
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	853ebd88-bb53-4d5f-e909-08dbb5aad830
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LM/hUlN30G7Sk3IQO3+wjE/58gBeNjMKOXmdKyc5hsRtHIv0OTpzSiy20o1q5W2wY0dKFsjfFcc3tuTQj4ngec4mnpjDaomUFvsmvraRA44qPtBdlN7BgTLXDj4+mQoI71TJNCIAW0j2L2o2GTDwRV0qCKEZAcR0/zhXR7SV8wrtFmAnkWQxICXqy6/7rQKNW83Oqvx2sABVZt8YCOj8TaI5BxXQApYlMRoXAmQRpNPfFs6LqIxkSifd/+Td1ub34T9LjK+Cx4CnIndlgcguHYizYf7mt3slBTa8VL81seVFMBakXI6ud0Sv62QLHPUDVyqyJ4YMHS1ZOVa03sIXRXpEE9swzsKSWvGv8CbJYB6N4s7d9uUiVZIM7I9wzyyGYsoOCelibiFEd3q88HZUbX5oYY/hG5MIoSkIFJtYc2xCf/cLzgcgi2njUFqg71H4Eyn5sMts6HFThbwMWzqg3nCHUb/zEBQ5rOlcrj4zMbTXD5EUijAolkst+IbnAMxJxvs2Pg7Un9uPneTYJKT1UmTVSQWzVaGq4lcT9ckScirRPekjau/6oqzHAblktb0nbEEBjPyJxdGHJOwxt9eIorUVsIbHozkeqzdU3rpBHmZd0DnZ8mtkfLULV6Rf7nIGzS9EaSHRLfy9nLbhxpKeuNoqt1XbBK44g59NicqGVN26m8UN5yVTidcQtBSb6Jy10ovHNZ5il1T3D2YqHduK0mFhqmEC7hcRbtmhZbuRl9NZx4HFrVOeiDVmNsZy4Vzp1UDIQ6UzGFTathB/0ivFdKby5kvjnBwKHEgAcs4N9BVSZ2GfsYYarpzP0azXNTI5A8HpzQWWr1SsRr5azIk4vg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(1800799009)(451199024)(186009)(82310400011)(40470700004)(36840700001)(46966006)(478600001)(31686004)(8676002)(336012)(2906002)(40460700003)(86362001)(36756003)(44832011)(31696002)(356005)(41300700001)(36860700001)(81166007)(82740400003)(5660300002)(53546011)(4326008)(47076005)(8936002)(70206006)(6512007)(6666004)(26005)(6506007)(6486002)(316002)(70586007)(2616005)(40480700001)(41533002)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 06:26:38.5123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e9e05a-5d9f-404b-3332-08dbb5b4b7ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8832

Hi Oleksii

On 2023/9/14 22:56, Oleksii Kurochko wrote:
> The patch introduces header stub necessry for full Xen build.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/include/asm-generic/flushtlb.h | 42 ++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 xen/include/asm-generic/flushtlb.h
>
> diff --git a/xen/include/asm-generic/flushtlb.h b/xen/include/asm-generic/flushtlb.h
> new file mode 100644
> index 0000000000..79e4773179
> --- /dev/null
> +++ b/xen/include/asm-generic/flushtlb.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_FLUSHTLB_H__
> +#define __ASM_GENERIC_FLUSHTLB_H__
> +
> +#include <xen/cpumask.h>
> +
> +/*
> + * Filter the given set of CPUs, removing those that definitely flushed their
> + * TLB since @page_timestamp.
> + */
> +/* XXX lazy implementation just doesn't clear anything.... */
> +static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
> +
> +#define tlbflush_current_time() (0)
> +
> +static inline void page_set_tlbflush_timestamp(struct page_info *page)
> +{
> +    BUG();
> +}
> +
> +/* Flush specified CPUs' TLBs */
> +void arch_flush_tlb_mask(const cpumask_t *mask);
> +
> +#endif /* __ASM_GENERIC_FLUSHTLB_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +
> +
It's duplicated.
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: BSD
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

