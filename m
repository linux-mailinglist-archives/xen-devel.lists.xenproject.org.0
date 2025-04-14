Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3696A884A3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950490.1346800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Kip-0000Li-OO; Mon, 14 Apr 2025 14:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950490.1346800; Mon, 14 Apr 2025 14:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Kip-0000J5-Jv; Mon, 14 Apr 2025 14:23:39 +0000
Received: by outflank-mailman (input) for mailman id 950490;
 Mon, 14 Apr 2025 14:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4Kin-0008UW-Vs
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:23:38 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ca43d90-193c-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 16:23:36 +0200 (CEST)
Received: from SJ0PR03CA0338.namprd03.prod.outlook.com (2603:10b6:a03:39c::13)
 by IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 14:23:29 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:39c:cafe::17) by SJ0PR03CA0338.outlook.office365.com
 (2603:10b6:a03:39c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 14:23:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 14 Apr 2025 14:23:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 09:23:26 -0500
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
X-Inumbo-ID: 0ca43d90-193c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDi9yO2iI5QXGXwlxFWQB/lQlskYgJ2sUOAFgcvsrcLNTnQTOpCSknQ30fqNfcogsSwslUuKOscTRU2D2wb1xU5YJf7pq3604TA5kSWZ1o5psxVJzplbr4u9Qq1lyXK7yBKRTTb1XWSUZ5ZwaZETJuHggHbM7koeptlSMTic4SJeLaraXf6S7LpULxNntLQTkaHZSkQfSgs94cdxu4u4JIk++YpcYHqWzXwreqb/huXE7fHut6SjJ8g3WnmZFJ8vRVfwEJKMkVSnLXs3+mZSy9hsRoe7rhWo+1U3apZPKnQiXq2+mtufz69SPvZVwIiKURNRFpuU+cE98X/nsfTIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pp9xxz8ykLGzTW+jm5pxYvxvYog1N8ZMeDHRKQyyLHM=;
 b=X6rD1mtmkS6LguWvSO2dV1HDs1avans1F36O+gnOFR5GGU8hv9Y345fPHkbO+EdqOUYUnLm3ZcHtRnQLfeus9O3oLnjMicbYLFLaFy0rMQHP2//ZlgBYYDeQ0DlNtTZcr+w4RUIRqhEyftsnLveU578G20Yw9CqX8sUpTm/6fqMisHK7vEU/tr61Q94J2hWglWcMo19d/EHemW3KmBZv9RB1zzVLlM7BtdAxnz/32J4HE5azVVgyfAkGqQ6ERMR8Ujs90NZHHyndY4HJmlIk0OYC+R64owiyTkHxes+FAB8aRyxofnwrsnuDGxyx/zLMN061gYtfgcwOuEzF1lQQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pp9xxz8ykLGzTW+jm5pxYvxvYog1N8ZMeDHRKQyyLHM=;
 b=rQRLIV5+o4EE+ug0rLsUuTUYL5zsaRjnHWgBt3nbSH5Mbv1IuhFd8cDXvbrb44FDL5/zSfC1OIJ0viy73qCyPeZoFxhBylcwETgm5DVL5Y9DN4QobqwzzqTvgYqeBcQ69ffuJXnwvhy6RhKQs247AqIxZtLtpnTq+FXRvxgnVZg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 15:23:25 +0100
Message-ID: <D96FH9LMHYXJ.2BDEIEANJSYVD@amd.com>
Subject: Re: [PATCH v3 10/16] x86/hyperlaunch: obtain cmdline from device
 tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-11-agarciav@amd.com>
 <dccb3dd3-eac8-40b4-8ffb-a0ccb688ac0e@suse.com>
In-Reply-To: <dccb3dd3-eac8-40b4-8ffb-a0ccb688ac0e@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 708cd3e4-156c-49d4-72a8-08dd7b5fed2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3ZaS09lcTJ1TnVXKzdvV0pPZ2JQVjA3YVpidGE4dWZHeTBqM0RxUjRuczVS?=
 =?utf-8?B?NExRWkVDQXp0UHcrc3FZNW5nN3ZZcmVhL0RuVlhjK2dtY2dFK05xdG9hN1V4?=
 =?utf-8?B?MEZ6eGFORDNIZGx0Vk5xZzV1VTlPa0FNV01OampWYlBNcTkrMUk5TmxZY0RW?=
 =?utf-8?B?Rm9iOVM4aUJ1ZVdTNUd5TEpNSWZaQ0w3SjdKdDFEWFQ2d2J5NExBdVF6eHBk?=
 =?utf-8?B?WE9Cc2creGhZYjF6TXMxOG5OTWdrbFdheUsyWGJmUGNtS0hhUmQrOU5hNSt2?=
 =?utf-8?B?MmFCa2hxUzZURDVGYVRwRlpWNWRnc2FxVkZSRzRNNVZkZHJlNlV0NVhqRkN4?=
 =?utf-8?B?RDhYRWlHMWlHd1llUFhFT0J4bEtUUFRvcDhRVXNCN2JIbS8rcDBkUGFBdmxU?=
 =?utf-8?B?TVVuV0kvUE9aTCtzOXZqeGM3blFHRWdZdW0xek9VM09xc0Fab2tqdG9tUjZK?=
 =?utf-8?B?VG4zRXVnQlo3c1dQbmlWWjB3emswK2xBQk5idytvQXZITktRYjhJNnUwLzF4?=
 =?utf-8?B?RFR1ZVJDYTdKVFVtT3p3MWFwNzVITm42d09PbmJrcEpvb2w3MTRIK3FBZ3Q4?=
 =?utf-8?B?L3lNYUg5Nm5kVnFGYVowbnRFcE0rS1NXbzVuaGJUQ1daaWlYZDFURkNScDBB?=
 =?utf-8?B?cnc3Zzdidmdqa0tlNWZ3Mys0T3YwcUJEamVUbFZBQThXSFBqb3kvUU9Zak85?=
 =?utf-8?B?NUNVRmFsaW5VU1RmM04vOFVHcHBnT3NUaHVjejdhY003b3lPTldVamZFRElL?=
 =?utf-8?B?MmtGQkVUL1FYTFNvbDhNNmNPVHRKOXBrT0ZvZmVtcXR0UjBCenUvMHcwelVU?=
 =?utf-8?B?NjlEaFBpZVNEdVdEYVVrSGlKWElKSUtLdmZaUjNhOGgvZEVvdGpCRHU5dWRD?=
 =?utf-8?B?bFRRdFFlVHU3TzhZcVVqSkRaTnNQQ29qOTdsbDlFQkRXcUhpdXU3aEQ3TnVL?=
 =?utf-8?B?WVNobHUrVS9ya3Y1dTMyTWljS2RueGRwRzQwaUU0aWpqREx0dzNKVWhid2Y5?=
 =?utf-8?B?MnUvclpqRGlrckgxMXBlUWQ4N1VRTzdPRjdsc0xuTEU5dkxXVWQwZE5VdjlR?=
 =?utf-8?B?YXAzZEw0RzRCWDV4T01GSGJzeEZ0MkFMZEM1VXNZV2RXWjh5MkI3ZmN3WWJr?=
 =?utf-8?B?dVEwWTRyMDdPQlJYQ3BIS1Z3QWFXZGJXQzBVeWhxc2RZQitNQWo1N0hscXlj?=
 =?utf-8?B?Y0NhTWkvT1hIcVRUUFg3dm4zRTRKUkZhdmVYTDZ2VHl3THRFY2UzR1M0Ujhm?=
 =?utf-8?B?NDFnaGI4S1N3N2NPbDVRYkhhL2lEOCtQa0JGZWZGUTFvbG5wZjFKRDVwYit4?=
 =?utf-8?B?VThmcmNUOXZvQjlrUjh1NnpHbVRyeWQxeFN5V1VVUGpTZkVQZ0oyWjJyNWxo?=
 =?utf-8?B?ZERPa3RYakoyWFRzWTBlMTJWSXovTk42VjlmZEpxL1pQUzlmQ1Z4VTBCZnY0?=
 =?utf-8?B?SVlSZ0h2blhjVHcyT01xaWQzVnFWdUlVUHRsUFQ5TjR2L1dwWEtET0pBbXpI?=
 =?utf-8?B?NnY4OExpa0ZBSURLMmdjV1prS2RPS0N4VnZTRzdEKzArVUhUWmFtcFB1c3Jk?=
 =?utf-8?B?dWJXUUd3cTZ6RXJYSlF4RkFwRkdUYTVucGgzL3FxdGJMNWhBc2VKbE1FaGg0?=
 =?utf-8?B?WGxka21Od2c4Y1ZZNUQxdHJlbG9uckRDY01qSS9xRG96c2lTUUVvbHNKeU9P?=
 =?utf-8?B?eFVQbkQrK214WGZkZ0FGb1dWSjFOakdJdmZyeUxtczB1akwxYXdQTWRIRzds?=
 =?utf-8?B?VGtna0FHSXo4UTZTK3ByNVdPZG9HcWpKOVY0ejJ4ZEJGbDlWdkxoRDdEWFlh?=
 =?utf-8?B?a2RsNzZ5UUdOYXBhVHhBalhETFVna0Vrbkxtb1lrSHRQM3QrZVNTY2lMR2Z0?=
 =?utf-8?B?M0JHaVErVzM2ZXJQQmRFei8xaExjVm4xVnorRkxyeGZDUTZ6VkpWZnNrWlZt?=
 =?utf-8?B?UFJMZWxCYmpVMGpZR0FOQXZPS2hCOW5GcnNWNDZvem0vQ0p1YW94SkxsUjc0?=
 =?utf-8?B?WHZ1S0FpMndINHpMQThmVEZ3bk9kK0FQYUtubm11UjU5bVJhS2ttTFlaeUNB?=
 =?utf-8?Q?fYT6jA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:23:28.6286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 708cd3e4-156c-49d4-72a8-08dd7b5fed2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353

On Thu Apr 10, 2025 at 12:12 PM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain-builder/core.c
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -8,9 +8,37 @@
>>  #include <xen/lib.h>
>> =20
>>  #include <asm/bootinfo.h>
>> +#include <asm/setup.h>
>> =20
>>  #include "fdt.h"
>> =20
>> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset=
)
>> +{
>> +#ifdef CONFIG_DOMAIN_BUILDER
>> +    const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_I=
DX]);
>> +    int size =3D fdt_cmdline_prop_size(fdt, offset);
>> +
>> +    bootstrap_unmap();
>> +    return size < 0 ? 0 : size;
>
> Use max() instead of open-coding it?

Sure. On an unrelated matter, I've also removed the ifdef and relied on
DCE for v4 for this and the next helper.

>
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -189,6 +189,12 @@ static int __init process_domain_node(
>>              printk("  kernel: boot module %d\n", idx);
>>              bi->mods[idx].type =3D BOOTMOD_KERNEL;
>>              bd->kernel =3D &bi->mods[idx];
>> +
>> +            /* If bootloader didn't set cmdline, see if FDT provides on=
e. */
>> +            if ( bd->kernel->cmdline_pa &&
>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>> +                bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>
> Somewhat orthogonal question: Should there perhaps be a way for the boot =
loader
> provided cmdline to go at the tail of the DT provided one?

That would preclude the bootloader fully overriding what's on the DT.
One can always just copy the cmdline in the DT to the bootloader and
adjust whatever is necessary there for testing. Adding append behaviour
sounds more like a hindrance rather than helpful. To me at least.

>
>> --- a/xen/arch/x86/domain-builder/fdt.h
>> +++ b/xen/arch/x86/domain-builder/fdt.h
>> @@ -12,6 +12,31 @@ struct boot_info;
>>  #define HYPERLAUNCH_MODULE_IDX 0
>> =20
>>  #ifdef CONFIG_DOMAIN_BUILDER
>> +
>> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int off=
set)
>> +{
>> +    int ret;
>> +
>> +    fdt_get_property_by_offset(fdt, offset, &ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static inline int __init fdt_cmdline_prop_copy(
>> +    const void *fdt, int offset, char *cmdline, size_t size)
>> +{
>> +    int ret;
>> +    const struct fdt_property *prop =3D
>> +        fdt_get_property_by_offset(fdt, offset, &ret);
>> +
>> +    if ( ret < 0 )
>> +        return ret;
>> +
>> +    ASSERT(size > ret);
>> +
>> +    return strlcpy(cmdline, prop->data, ret);
>> +}
>
> What's the rationale for these to be separate functions, rather then the =
code
> being integrated into their sole callers? Especially for the former the e=
xtra
> layer feels excessive.

I've moved them onto domain-builder/fdt.c (where I believe they were
originally?) for v4.

>
>> --- a/xen/arch/x86/include/asm/domain-builder.h
>> +++ b/xen/arch/x86/include/asm/domain-builder.h
>> @@ -3,6 +3,10 @@
>> =20
>>  struct boot_info;
>> =20
>> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset=
);
>> +int __init builder_get_cmdline(
>> +    struct boot_info *bi, int offset, char *cmdline, size_t size);
>
> No __init on declarations please.

Ack.

>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(
>>  {
>>      size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>> =20
>> -    s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)=
) : 0;
>> +    if ( bd->kernel->fdt_cmdline )
>> +        s +=3D builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
>> +    else
>> +        s +=3D strlen(__va(bd->kernel->cmdline_pa));
>
> Why's the check lost for bd->kernel->cmdline_pa being non-zero?

Shouldn't have been, indeed.
>
>> @@ -1047,9 +1050,12 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>>          if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
>>              panic("Error allocating cmdline buffer for %pd\n", d);
>> =20
>> -        if ( bd->kernel->cmdline_pa )
>> +        if ( bd->kernel->fdt_cmdline )
>> +            builder_get_cmdline(
>> +                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
>> +        else
>
> Same here.

Ack.

>
>>              strlcpy(cmdline,
>> -                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->load=
er),
>> +                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loade=
r),
>
> The change to this line is bogus altogether.

Ugh, yes.

>
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -23,6 +23,29 @@ static inline uint64_t  __init fdt_cell_as_u64(const =
fdt32_t *cell)
>>      return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[=
1]);
>>  }
>> =20
>> +static inline bool __init fdt_get_prop_offset(
>> +    const void *fdt, int node, const char *name, unsigned long *offset)
>> +{
>> +    int ret, poffset;
>> +    const char *pname;
>> +
>> +    fdt_for_each_property_offset(poffset, fdt, node)
>> +    {
>> +        fdt_getprop_by_offset(fdt, poffset, &pname, &ret);
>> +
>> +        if ( ret < 0 )
>> +            continue;
>> +
>> +        if ( strcmp(pname, name) =3D=3D 0 )
>> +        {
>> +            *offset =3D poffset;
>
> Variable naming looks backwards here.
>
> Jan

I think the leading p stands for "property" (for the sake of giving it a
name). But I see how that might be confusing when interpreted with a
Hungarian notation lens.

I'll invert it. It doesn't matter which is which, after all.

Cheers,
Alejandro

