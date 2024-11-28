Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9379DB70E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 13:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845418.1260839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGdCC-0002b6-BD; Thu, 28 Nov 2024 12:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845418.1260839; Thu, 28 Nov 2024 12:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGdCC-0002ZK-8U; Thu, 28 Nov 2024 12:00:32 +0000
Received: by outflank-mailman (input) for mailman id 845418;
 Thu, 28 Nov 2024 12:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t80U=SX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGdCA-0002Wa-GO
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 12:00:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:200a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59838cb8-ad80-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 13:00:25 +0100 (CET)
Received: from SJ0PR03CA0136.namprd03.prod.outlook.com (2603:10b6:a03:33c::21)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 12:00:19 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::12) by SJ0PR03CA0136.outlook.office365.com
 (2603:10b6:a03:33c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 12:00:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 12:00:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 06:00:17 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Nov 2024 06:00:16 -0600
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
X-Inumbo-ID: 59838cb8-ad80-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjBhIiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU5ODM4Y2I4LWFkODAtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzk1MjI1LjY2OTMzNiwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKKKsnNRY8gC7GHXsyEH0GLTTAkYIktu5jf04Bj0/agpzCATmMoQukg/tqcoAIJ7ChGU7P+dfs2f962EAYW5qviiC6N0+WoSv3b5Ya9hW/WijpGT56VtQHxcp8OmyHZfHMiQwQ3xqKZfbLoMaCxdNWZpjPW6ehhqTdcAsz+d+MWWtS2rdhOK5Edft/2tYLq//VeLP/Nl/Lo61XDeQh8w4WQIKQpFGB/p7S8nlEfldosQiLdxpl58mKo1za5RXD6qN4RNXZ6mnHKgeD8tQjL91FFRFUePWWoWe2PrhDveMk4/rT22IrOUXW+zVPIPmd06NGhxhW5GomrxK3tvkcuXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eB7Yb5HGZxjWzyl3RpwCdAeA90lJ2umlKPswSFSyfiQ=;
 b=NAF+ewOoALou3/hB+oT9NPlCnbiaMWxppwm8c6R/88Yo2s27rdAP45k0x35RVo+WoH13bJpCPE1EVAk1zJxjvhPn6/4xhzCnlf+DCyKNzFr0Kez9bZaZvcJoLzsTdNPWeUsYZcvpz4euohgWAnBOOLIebkZD65xYeDOQH8E1uteCuPbehVFHLNIIjvcEhMJlfJAN4vYHInpvkyKeElVcbB9gYfbQACXIhgjIbOHYJGtVPow1W3mmQ56LlWRzmk6OE0JacYH7QY0qbhs7QenCXZ7AodH7L9T8SZBLVPiZWf7zhU2Q4PbOn1hFUYfrGD3BOseHHf+mSbkhMn3N1GhYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eB7Yb5HGZxjWzyl3RpwCdAeA90lJ2umlKPswSFSyfiQ=;
 b=xJ7t+UnEpdJL41U2po9VGveFDc8QZqBfIPS2h71nbNSEf1M427jmxwVR6ydc3L7qCbk2CizUZHSccnfoSusPMDjueFeiF6+6qymqGh7FnWf0vnv/gaTfyWcWQBA99DUMV2LmA0tzTlENcQ0gQbVK/+cl+oL88d2hNW+rtpoXeFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <355f9c8d-abc8-418a-b78b-6b6d7c0c3466@amd.com>
Date: Thu, 28 Nov 2024 13:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/12] xen/arm: add support for cache coloring
 configuration via device-tree
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-8-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241119141329.44221-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CY5PR12MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 92693ced-2ac3-4de3-cef8-08dd0fa43a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y21yM2MxQUVVUklsUjRtMUpLcUwwTHovWERmaUhvL3g4Y2lVM0tJcVcrZndC?=
 =?utf-8?B?MmRKR05NZnc1SXlnS0dPZHBGRkI5Q0hyZ2lvelNmTTczNGhjWElpc2Fyazg2?=
 =?utf-8?B?cHZ5Q1pBQ0thdmZtcTJGVndoY1pDTGNVNG5kUy9sL2tnSHZjTm5PSGNJTmxU?=
 =?utf-8?B?ZG90WCtuZUFUa0toMWlEL0tFNXkzRUlMNkhDV214ZnpPR0N5TzVvN2NvMlFD?=
 =?utf-8?B?am9xMnVsKzFMYzZqazNBWDAzNjIxQ0tnVzZhY203MXp5cUx0cFBuWFBEVnFk?=
 =?utf-8?B?NXRxK0UxQnh0akNKcUF6M3ZXbXlqR1QvWWcvMTBPdjN5MEQwR3VhMlJuT2JT?=
 =?utf-8?B?eFFHdFRLbGFGRWVJTnpudWJ2dFVONzJvQXpNNWIwMS9aR1MvaStXdE9SeVhy?=
 =?utf-8?B?dnlkTE5IMUR5a0NMU0lVcnUxNm5rWGZOMUM2RjVjWEY4M2RVc04vWEtFd2RV?=
 =?utf-8?B?R0JTaGozbFhVaHhRdkpZM2Mxb0NRVCsybFpoZ2VNN1o4OGcwTjZaZE0zNmtE?=
 =?utf-8?B?SllLL1ZuZ2FXeU1Hb1kySHB2eVB4eW9QWlQyakdTU2lBT2docmlLNWFqOUJU?=
 =?utf-8?B?SS85N0JUSkVoa1d4d3FEakpIdHd4YjQ1dW5nYmVINDU4czdDSmVKV25od3NY?=
 =?utf-8?B?WTFHbzcrMDdZSmdZc2Vxd2o5dk1QbWMzVUJ4MkZhMjRTRXh2QUtnQmpSa3d2?=
 =?utf-8?B?aVRTQ1d2em85WDZQYTlNTzJhZFkzV2dOdlhnL0J3RHNjcCtoYU9Zb1J3dkJQ?=
 =?utf-8?B?UU95YmRyaTlnSmFoVUVqVjk5djhDT0orT0tMeWlsbW03eEFJWUdLTEo4S3c1?=
 =?utf-8?B?VFY0ajcrd2sxVFhiS2JlTVh2cG5VWm5HaGJoajFGWENvbEZncXFyZTRXeWph?=
 =?utf-8?B?N0hFOHJBU0I5Z3pnVzdRejZ3akx2bUlCc3pFQlNmeGpBOVpTRVM5cW8vSHJs?=
 =?utf-8?B?cTB6WFA4ZXJwVmxxdTUzdFA1NTZoZjNmMW5VcFYvdWVUajF4UXFDenRMSEJX?=
 =?utf-8?B?Q21EODdJWXo0QnNicm9WS1RhekUrWGVoSjRzYW9KelFCL2lRUE9jZWwrVi9Z?=
 =?utf-8?B?dTN6dHhhVmdpOFlJY2xNOUh0VWdlM3RoWjJvc3Q1WkhkSVU2Yy9aY1lRL0kx?=
 =?utf-8?B?T1JFVWRONXhJUWdrcmQ2RTN1Q2VwbndWOGFVZG0rRUhtdUhodjdmbUFHY09O?=
 =?utf-8?B?MHd6dTN3WmlxN2tqNUdrV0dtZS84U1U1M0wxalpnMEZQWGdVQnBwNnZzU3hz?=
 =?utf-8?B?WUVWSGN0VjhLa1VPbkxyaUc1ajc3b3lmZUE4dW9HTy9wRkFHNEl3V2VON0Nn?=
 =?utf-8?B?elluNXp6K05XcTBHblIrZWx6bEp0aXRsbGdTdjYveUZvcGdxb2pzQk9UK3BQ?=
 =?utf-8?B?akl6OEZQZUFvZFRQRldpMERqVlNxRkFtdWpibUlMNTY2ZThoKyszSzY2Q0F1?=
 =?utf-8?B?WTBIRkhJdzJBYTFMMEt4M0dSczJLaWZOSHNkWlN2WGNDbVIxdnlXVjVxT0do?=
 =?utf-8?B?Z2hHSG9qQWhMNFp3dGR0d0dyNWMzMVAzSk1hSTM2bXFGZWcyS0tDRWs3OUZw?=
 =?utf-8?B?aUU1a3JXb29PSUJPSk5la01JWlBLcjBkbFFiL2xqclh2Yjc1MzRTb0xJaUQy?=
 =?utf-8?B?MnE4a3hJSWk2NGRwNEpwQ1V3ZHROTWxGQ1Q5dWcwcHkydnBtU1paVXpoU2lr?=
 =?utf-8?B?VERucVNwT0hVVUhFSWJSVlhQOFZsdS9PeGFDRTVzMnByQVlNMms1anBrajI1?=
 =?utf-8?B?am52Vzg0NGdsSDJHUmxmcXh6ajFVQUNacEVkTHBtblIzWDdaa0dXZjduZlJH?=
 =?utf-8?B?UXJ3c3JiQWMrdWNvSW91QmVSVFd6R2dJK3dKZUJxN3ZqVkptbEFKOGNBMm9D?=
 =?utf-8?B?SGIrYXIwTG1CRzJFaXpvWDNQNXZKL0s3bHd2VS9KemxEK2x0WmdqekxQaGEz?=
 =?utf-8?Q?CIniv+QvHPkUQgP3N7l+zdfWRTAsRXau?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 12:00:18.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92693ced-2ac3-4de3-cef8-08dd0fa43a95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323



On 19/11/2024 15:13, Carlo Nonato wrote:
> 
> 
> Add the "llc-colors" Device Tree attribute to express DomUs and Dom0less
NIT: s/attribute/property/

> color configurations.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-Arm
> ---
> v10:
> - no changes
> v9:
> - use best-effort allocation in domain_set_llc_colors_from_str()
> v8:
> - fixed memory leak on error path of domain_set_llc_colors_from_str()
> - realloc colors array after parsing from string to reduce memory usage
> v7:
> - removed alloc_colors() helper usage from domain_set_llc_colors_from_str()
> v6:
> - rewrote domain_set_llc_colors_from_str() to be more explicit
> v5:
> - static-mem check has been moved in a previous patch
> - added domain_set_llc_colors_from_str() to set colors after domain creation
> ---
>  docs/misc/arm/device-tree/booting.txt |  4 +++
>  docs/misc/cache-coloring.rst          | 48 +++++++++++++++++++++++++++
>  xen/arch/arm/dom0less-build.c         | 10 ++++++
>  xen/common/llc-coloring.c             | 41 +++++++++++++++++++++++
>  xen/include/xen/llc-coloring.h        |  1 +
>  xen/include/xen/xmalloc.h             | 12 +++++++
>  6 files changed, 116 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 3a04f5c57f..9085645433 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -162,6 +162,10 @@ with the following properties:
> 
>      An integer specifying the number of vcpus to allocate to the guest.
> 
> +- llc-colors
> +    A string specifying the LLC color configuration for the guest.
> +    Refer to docs/misc/cache_coloring.rst for syntax.
Shouldn't we make it clear that this property is Arm64 only?

> +
>  - vpl011
> 
>      An empty property to enable/disable a virtual pl011 for the guest to
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> index c5fb33996c..c14b6ee2f4 100644
> --- a/docs/misc/cache-coloring.rst
> +++ b/docs/misc/cache-coloring.rst
> @@ -12,6 +12,7 @@ If needed, change the maximum number of colors with
>  ``CONFIG_LLC_COLORS_ORDER=<n>``.
> 
>  Runtime configuration is done via `Command line parameters`_.
> +For DomUs follow `DomUs configuration`_.
> 
>  Background
>  **********
> @@ -147,6 +148,53 @@ LLC specs can be manually set via the above command line parameters. This
>  bypasses any auto-probing and it's used to overcome failing situations, such as
>  flawed probing logic, or for debugging/testing purposes.
> 
> +DomUs configuration
> +*******************
> +
> +DomUs colors can be set either in the ``xl`` configuration file (documentation
> +at `docs/man/xl.cfg.pod.5.in`) or via Device Tree, also for Dom0less
> +configurations (documentation at `docs/misc/arm/device-tree/booting.txt`) using
NIT: I think you can remove the part "also for Dom0less configurations" if you already
mentioned "or via Device Tree".

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



