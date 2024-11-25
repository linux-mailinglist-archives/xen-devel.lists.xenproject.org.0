Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AA9D8BAF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843049.1258708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFdGq-0004Da-IS; Mon, 25 Nov 2024 17:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843049.1258708; Mon, 25 Nov 2024 17:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFdGq-0004C7-Fb; Mon, 25 Nov 2024 17:53:12 +0000
Received: by outflank-mailman (input) for mailman id 843049;
 Mon, 25 Nov 2024 17:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFdGp-0004C1-8u
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:53:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:200a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d74bd29-ab56-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 18:53:04 +0100 (CET)
Received: from CH0PR03CA0218.namprd03.prod.outlook.com (2603:10b6:610:e7::13)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 17:52:57 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::1f) by CH0PR03CA0218.outlook.office365.com
 (2603:10b6:610:e7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 17:52:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 17:52:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 11:52:53 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 11:52:52 -0600
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
X-Inumbo-ID: 1d74bd29-ab56-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjFlIiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFkNzRiZDI5LWFiNTYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTU3MTg0LjU1NjI0NSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bdg6X2sqDOGHQAdcEnXrFCQKxJBu8SELlXk8yh9EpLKfpjN0kIKh4p2g2waaKgmnkHonHuqWGAMdWix6gOMtnSAUJBQ7FoH33t3nT2LMM0qcKXTQROE1/WBz8wyZyG0gYWYECFHnWYbHeXF9p0I1SlNQrUudSmKi6B1A/kG9Sqe40hs19sOLN8OF9g2Xmi19xRLAWLeS6Mn47zGuNXTo4gEUDoATubyuksLb3IrYA8095BbmhJoJn6dMfculPXYKKsAEY5ljpYXAzCYGOAc2Ul2cFrg8dA5WQzZ7j7/kS0EM8HYR4r4LpGeBFqjz+LKc7qRiRAyseiPG9FXkXqBS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrgUs7lPAGpzni9S9U9C04OF3xn6sf7zYxtAAzgPhYw=;
 b=avZxKUOJvI95BZmrXUXX6O62teShn8HjszFuA1+sDF9pRWvWlIakLi7rY8+iKFpAFIFqKaux1rnZ3SMMJzDphCAc6iU+75eZ8kRMcw4KIfAQSomLnLScHNg64lMHIjC2pQ3JTBvxURyB2zJSg8TemH8y3rcAcRnYFI9W3yy0SV56OyaCbz/lAwB08Hm+ILC6sJkWddo+APB6qVn8IOAmJAmgZE3W4YsopCNU4/kaDcRt23IEfFrAfj5f7gKuWN4x7GQrYUsXutiV94QbD9Cn/qssL+6rh5GWXo6NS8lWF2bhcEFfY5EeKwOSLmS4HBlOkO8jf6zmoQZOKbaTr6fIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrgUs7lPAGpzni9S9U9C04OF3xn6sf7zYxtAAzgPhYw=;
 b=TFEIheEL8m/0z5xuXsfaOqlyJTy+LteSca3NB4zMhHjwQ8j3P119/n9z5gET6FDu8CF/+VQKWHR6HJsM5H0McMLE0DDVCVQgluumq+GWsgvUwFhxEC9zr9a1CPSkSOm2N+qTP/v/dj+R5yVlPbW4yxvUshq0zPSVVNY2Dzwfcrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
Date: Mon, 25 Nov 2024 12:52:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e5f222-8ad4-498f-2380-08dd0d79fcfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUxjVFFPWXk3cFdtb0VNelJwTmwvVy9mVStxVjV3TmxrNUo3OE4xNFdLTS9O?=
 =?utf-8?B?ZTJ4NjdRNUh2WlB0bHFKZ1VEbjV6QUV6K09lUjkreVQyMUZZU05yR2NwMVlD?=
 =?utf-8?B?VnZsRllLYXVZTnF6Y1BhdUpSQmZ3MEg4WnZZeGRyUS9PWnd5REhpREkzVVNJ?=
 =?utf-8?B?enJ0YUdjSklRdTZQVU1XZHQ3ck13K3dYMjdBSjJIa2lBMzZybk5pOWcwVzBM?=
 =?utf-8?B?R0gyQzRmRW9BK1p1MTlpYnk0eEZrMGxJZWtBTVdKU1NuTituZ1NTU3BLZDlw?=
 =?utf-8?B?Qm44UXVoSThjSEIyMFFqZnZITWxOU2xLcTRZVmpEdld4dzVZd0VrTVlQbkxa?=
 =?utf-8?B?VEk1SW9haUErU0VDQXBmQTJvUjV5V2xsNE8vbVdQMGhBZzA2dlQyZk9uOEVy?=
 =?utf-8?B?bzhidER0bVFxbDhNeWcvR1F3UHRxSzRrNFBPQ0F4UGlZcEEvN3pwYUluRFEy?=
 =?utf-8?B?ZCtKU1hIcnFWOXJOa1hmZ2lDcjJKNHNBdVRJUXV4L3RuRk9UaWtCT3F3cHFi?=
 =?utf-8?B?TDZOVnNOc3BMRE05U05YVHNrckFobVZWamtJcGQrOXBZN1J1V2E0ZHdjazJC?=
 =?utf-8?B?SkJOWU1HbXVQSXJzS0pXb3dUL1d4Nkd4SzJuMzdIWXRJcitYMFZFcTVvY1dF?=
 =?utf-8?B?Tkd1dzZDZWQzWFVxMlFaYkxiS2tpK1E5L0N6R0QrWGNDMUwrT3p3YmVOelZF?=
 =?utf-8?B?MDBydVlFeVNPT3c2ZTRycXBVaU1DSCtJcU1ueUpiaDNQNTdCZDd1SFg1QlJy?=
 =?utf-8?B?TDZwejFhR1A5VXhyN2xTbllMYkgvSi96T2hVTk5LZWNwQzkvclcxWlpRSit4?=
 =?utf-8?B?Z0ZjdksyQk1vNFhIekFjb1lXaUtlK1hrSFdmakQyenpTcDJWOTNFTllkSTZu?=
 =?utf-8?B?OWRlOWN0U1NRK1BWdkZmUVM5bkc1b3RyS3hRMzhvVTQrbWkzUFIzMXdjblk4?=
 =?utf-8?B?U3ByVGtXNE5aUkZYVjVhMVE0R3RMY2p1aU5uWmtpRnZ0U2xqSHhkeGdhY2Ex?=
 =?utf-8?B?cVJwTElLRjRVeHJjRE8rUFZWNWhpTTExQlZ3eGNSMlRkYnlWdExoWmRKME9w?=
 =?utf-8?B?RUFndzhHTFV0SG9ibGVqRm11K0dxRmhLOFkyZnUzTlgyYWZERDFSTGFGN3gx?=
 =?utf-8?B?TzJ3T05DYmhWYXNiRUhGRXlRWHJrRVZHZ3BEUjZBaDRxQzQrWVU0dGE4YXpp?=
 =?utf-8?B?bTUwb3Q1TVM5Y21ZU3RxVFRmQm5vQW9TcUwyTmc4aUhZQnJQYnNncmo2Y0Iw?=
 =?utf-8?B?ODBMQjVYZU9HQ2hoUVlocmg1Zzd0V2ZZQWdNTDUvMUJUemp2M2FBdXlBTEJv?=
 =?utf-8?B?MmIvYWpQZ3h2WjBrL1lEV1E5ZUs1NHZqekpNVHJEVWRETldMNTlhYmF6Sk5K?=
 =?utf-8?B?NURteGMvTnBMbG4rN0ZRaEJyMS9tRG1uaS9TSmJtcnZVYldGSU15L0RRT21m?=
 =?utf-8?B?SDA0bDZRc0x5eUVNOE5aM1pRTWp4cnhrSjVvbHllM3JSRWpoV3Z6RzlzUTYx?=
 =?utf-8?B?Y0NUZGJFdzJNS1Budml5aGtPRXF4YU0rQkFJWGYyaXJKU0xvbEtqYkY2Nll3?=
 =?utf-8?B?bi9mOWFBa0ptWnFwWUhORE9neCtHTEl3Y0tDVzlNSWlJVHZPMzg4bVNnVC9x?=
 =?utf-8?B?RnNLVUJXTWRLOHljM3ljeS9pSm96UXlXSVZNL2xRbzdBVVdwZFBUZzdUZE1V?=
 =?utf-8?B?Rlo0KzFFYmlGcG1UcHh0WEQ2UDFtSkFyM1lnZmp4L2RLWmtUUEFGeDFJeVpN?=
 =?utf-8?B?M2FHMFZwM0lST3Nrb2RQczBjekFpbU5kVkRUWSsvQk84dFJuakZzaUpHOW1D?=
 =?utf-8?B?bm1tMXIzb0JqZVg1bWpOQ0dGYVJlSnc4SW5kOFdkQnpMcjI0SmFyeVBHUlky?=
 =?utf-8?B?dGcxa1M3Z2lNek9GeTdFbTVJUW0rUHZOTGlGWFdQbVFSTzZVaGhrNS9iaUF0?=
 =?utf-8?Q?w0G8XhHmWYXsmr54j3MZXKlXEpAkUkeK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:52:54.2258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e5f222-8ad4-498f-2380-08dd0d79fcfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Introduce the domain builder which is capable of consuming a device tree as the
> first boot module. If it finds a device tree as the first boot module, it will
> set its type to BOOTMOD_FDT. This change only detects the boot module and
> continues to boot with slight change to the boot convention that the dom0
> kernel is no longer first boot module but is the second.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index b35fd5196ce2..45e4c963edcd 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -81,6 +81,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>   obj-y += sysctl.o
>   endif
>   
> +obj-y += domain_builder/

I kinda expected:
obj-$(CONFIG_DOMAIN_BUILDER) += domain_builder/

then ...

> +
>   extra-y += asm-macros.i
>   extra-y += xen.lds
>   

> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
> new file mode 100644
> index 000000000000..211359895d84
> --- /dev/null
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/kconfig.h>
> +#include <xen/lib.h>
> +
> +#include <asm/bootinfo.h>
> +
> +#include "fdt.h"
> +
> +void __init builder_init(struct boot_info *bi)
> +{
> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )

... then this extra level of indent isn't necessary (with an empty 
static inline builder_init()).

I guess this way, this small part is compiled even when 
CONFIG_DOMAIN_BUILDER is disabled.  But it's only a piece, so I'm not 
sure if it's worth it.

> +    {
> +        int ret;
> +
> +        switch ( ret = has_hyperlaunch_fdt(bi) )
> +        {
> +        case 0:
> +            printk("Hyperlaunch device tree detected\n");
> +            bi->hyperlaunch_enabled = true;
> +            bi->mods[0].type = BOOTMOD_FDT;
> +            break;
> +        case -EINVAL:
> +            printk("Hyperlaunch device tree was not detected\n");
> +            bi->hyperlaunch_enabled = false;
> +            break;
> +        case -ENOENT:
> +            fallthrough;
> +        case -ENODATA:
> +            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
> +            bi->hyperlaunch_enabled = false;
> +            bi->mods[0].type = BOOTMOD_FDT;
> +            break;
> +        default:
> +            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
> +                   ret);
> +            bi->hyperlaunch_enabled = false;
> +        }
> +

Stray blank line

> +    }
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
> new file mode 100644
> index 000000000000..3f9dda8c34c3
> --- /dev/null
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/rangeset.h> /* required for asm/setup.h */

Should asm/setup.h just be changed?

> +
> +#include <asm/bootinfo.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index e6580382d247..8041aeb3dcfd 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> @@ -1591,7 +1596,8 @@ void asmlinkage __init noreturn __start_xen(void)
>   #endif
>       }
>   
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( bi->mods[i].headroom && !bi->mods[0].relocated )

Switch .relocated index to i?

Regards,
Jason

>           panic("Not enough memory to relocate the dom0 kernel image\n");
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {


