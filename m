Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67279D8BF8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 19:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843072.1258728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFdVo-0006qF-5d; Mon, 25 Nov 2024 18:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843072.1258728; Mon, 25 Nov 2024 18:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFdVo-0006oV-2s; Mon, 25 Nov 2024 18:08:40 +0000
Received: by outflank-mailman (input) for mailman id 843072;
 Mon, 25 Nov 2024 18:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFdVm-0006oP-78
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 18:08:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2413::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46deb260-ab58-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 19:08:31 +0100 (CET)
Received: from BN0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:408:ea::35)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 18:08:23 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::c) by BN0PR04CA0090.outlook.office365.com
 (2603:10b6:408:ea::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 18:08:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 18:08:23 +0000
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
X-Inumbo-ID: 46deb260-ab58-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjFiIiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ2ZGViMjYwLWFiNTgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTU4MTExLjgxNTM0Miwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 921ea573-470e-4719-2fca-08dd0d7c26c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXBBa0FiaG41RzZSOXhjREQrejVUR25HeFArVlJYZFZiK0VKd3FkdXJ3elll?=
 =?utf-8?B?dXZ5TXlvbDZHWUZJQjMyNFJza0FDc0Z5Qm1nY0pMRFRORThYandOR1lqVmNB?=
 =?utf-8?B?TmpDd2pINUFVWUk5ZDliT1g4MVJ3RDdoWmY1NXRMMUJCOUdGNVAxWFNUZWJS?=
 =?utf-8?B?QVMxSVl6aUhEUXhDaE82dzlzNDY3NXhiNmpZTEltK09CaXFNRFUrSnRnVG5i?=
 =?utf-8?B?aXBhWlEyQ0x2SHlJLytWUjR1MTk5RlYzd3h2TkxyT3IrYmlJSUFPeVVtWXRl?=
 =?utf-8?B?NVAyc20vMGVMbmtNL1dYUVBBVzlCaDJSRHdPcU5GZVUzQWRuaDhpUWxKOUpo?=
 =?utf-8?B?YkFDalR3TXJUYUlCd05vMVlyVGdNZ3VtUmVIVlZma1pBWHp0RmFsZllQZTRn?=
 =?utf-8?B?QnBscit5THNVOVlZMTY1MStpcHBUWkVRY2lyR25RM25rNFZONWRBWURpdDRR?=
 =?utf-8?B?U1luRXNBRW9tdXBjbzQwNmVOTGVPSkROcnZ6NVFrbytPSXYvTjRzS091Yzd3?=
 =?utf-8?B?Z1JCVzN1c29kaGN6UGRoRUdyUFBNWlJFTXAzU3VjWU9HcHZmbllLd0RYZkcr?=
 =?utf-8?B?djdJZC9EcFZKTU84R2pwOWQ5elRmUTRmUWtqUzJTT1I1Y1Y1NWI1UCtOb2Ix?=
 =?utf-8?B?YTVOdWRHTmw1bVh3Sm9CaUZZZ3lDM01wb3hacFVHNTk4bFpTancyZFE5eVdJ?=
 =?utf-8?B?TEkrcS9KUEwvZVhnQUhKOFBDYlRTZ3ZvN0VUQ0NPUUhXcVdCaTN2OGt5UERW?=
 =?utf-8?B?ZHZwc0RNM3U2SUhYVlpXL01LblcxM3pNYThXOVhPZGFMeEZTWDlwUThmSTZW?=
 =?utf-8?B?TnZYZXluN3VWRUdpWnJPNXJoMzRMYmd4ZWFBYngvcGEyNG1BU1VIdEZnNU5K?=
 =?utf-8?B?TUdMcTUzMmVxUjRCNzhFSUxqKzg1R2lTcm1wQ3MwNHFmaFRrenlTa2hlbzF5?=
 =?utf-8?B?STFET3NBc1Bxc245USs4VDF6N25INVQzTWJxQUpHZWFHZWRmODZWSVI0M2kw?=
 =?utf-8?B?ZitsbmxZalNXUnlSaSt5aHEzUmxyaFB5bXh3dVdQRWpkMkJ6Y2M2SWUyZGs0?=
 =?utf-8?B?aTZ0MmhZcmhvMnVqbjdVUVgxeHp4dlY2Y0JMTDFpdXFraDY5andVNmJJaGNB?=
 =?utf-8?B?ckFPeW9XelJ3U1ZQQ3MremJSbXNGWUxkWnRVZDVHYXlESEZZK3hCckMvcjJE?=
 =?utf-8?B?RWFLR1RnV2NJYTlJMTcyNlB0Z1Rlem0vUG4ySDZlZzhxQkF5U0Z2Y3hRaUZQ?=
 =?utf-8?B?dnJ1bmtaZ3dDbHdoMlBIbS96N2Vvb0NhMlczcUlnSXBxK1lzQTg3cUZTVTJl?=
 =?utf-8?B?K2YxMUk3c2NnSHYzTEwxY2dVcEIxdzExam9IMytSMlhWb1l1R3phaWh5TmtK?=
 =?utf-8?B?YS9zclJoUWNxMFRsWnlpamQxSmltVEd3bWw4Y0I2Mnp6YU5leWJGL2JKZHUr?=
 =?utf-8?B?aUozK3hpb3lLcGRkTXRPSnQ1amtwNEx1dGRjQkFLM0toRWZmOVhmSmRTem1M?=
 =?utf-8?B?OEkxbktxMzU3RnBuZmJCbFdVYXFCM0kxQ0lSMHJ4SEVOc25oemd0Z1hyeXRn?=
 =?utf-8?B?bi84TzBRdWx5bGE2UGlQQy9ScHhQUUhhV1ZORjhiL0VJOXlCd2h3UlNWeUZM?=
 =?utf-8?B?SWNuWERVa0p6Y01uZjBnd01FNmRram8weVdTQ3ZnVFlETFg5ZW9vR0grSklL?=
 =?utf-8?B?YzlLdHZOTVltSXJ1Q3ZTRXI1ZkVDZ3dPK1lWeFZHOEZ1TjBaUjFzRk1icW05?=
 =?utf-8?B?bkltbmNDQjZMVmZ2d1daaSt6c2IyWWJyUzZvV05xOEIyanFWMk5uR04zTkpI?=
 =?utf-8?B?UFl5Y0NlT1BVaXkzOTBTU0xiVE1XVnZmTmxGYnZMME10V1B2M1JIcllTdWRE?=
 =?utf-8?B?SzlVK2VaNVI2ZkNqdEs0S3E3R1k1WVdFRlJzbzRWVXQvYWRNVldPbXV1UEJt?=
 =?utf-8?Q?tS2dIthMkMBOtCCEtas623gi26lRygN3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:08:23.3678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921ea573-470e-4719-2fca-08dd0d7c26c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475

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


