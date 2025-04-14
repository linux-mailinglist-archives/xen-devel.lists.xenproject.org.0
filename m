Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14378A885DC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950548.1346830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LCl-0002Lq-Ka; Mon, 14 Apr 2025 14:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950548.1346830; Mon, 14 Apr 2025 14:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LCl-0002Jj-HK; Mon, 14 Apr 2025 14:54:35 +0000
Received: by outflank-mailman (input) for mailman id 950548;
 Mon, 14 Apr 2025 14:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4LCj-0002Jd-Gy
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:54:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:200a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f796f2-1940-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 16:54:17 +0200 (CEST)
Received: from CH5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:1f4::9)
 by IA1PR12MB7710.namprd12.prod.outlook.com (2603:10b6:208:422::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 14:54:07 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::6f) by CH5PR04CA0024.outlook.office365.com
 (2603:10b6:610:1f4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 14:54:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 14:54:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 09:54:05 -0500
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
X-Inumbo-ID: 55f796f2-1940-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT6NmHq7zxT1/7EEgrgOx3EMF8eB3R7VkwW1QmUFOSycQRqqf8yzwjrh3KtsbEHcU/FxvZuT1s+G3fAId4qTAU/Mftgmgx/4ZCoeLJmgOnbXh+OVEg3RjrmncBtFWwNKiRC4Q+LZ3J8oB2fU1ATRhQweiXit6FXVd0PLjXcYGVIQXMLrZF86KNtA30eKDZD2Ta0eQQ+6RNj3mvhh4De3s6pQx7a3WaXUAbXyBERSSf9htF5HBS8L8VvhpDxrd8QoynD/jNsBQb51C5YhHihRlpp2e7cAVb2Vnb5D3mFvGNLsaEZhsNQSXgtXahzNZpakGoeCfrwy3PtqkUxCPjyfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb/hnyHFNdmRYRtM5XdCo8TvkhaFEljRLZwprbWEQSc=;
 b=Vb4KikXrxOxh+mnXME9ySCh5JnhrbNwVzvspinIRO8q3jCF0RltfRyK2ul0HgIoIDPFCnxMFeRTN+25X3E0J1rXaQH7qVZPTsfvkH9PK3V48I0lw8bE2eEwZQi4YEJP8xt2FTBBblXXyzcm+qVcariZmG7O0evuEgQ29mbQ0/YmKoCpZTRir7j1u4/pfzQSnlr5aZFH/VFw8kTdl/1hFwLzoZET542tCoIIDm72gEC5S/dMxggArqGIGWhxs2hKCqbs+5Bfnqjmrf/zDl/Bqq+TZWUB6Tiz4zriMs2UATECvDojQCOz+GOZMi6BjPqSFVMeJSTq2lPH5EWrnd3DWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb/hnyHFNdmRYRtM5XdCo8TvkhaFEljRLZwprbWEQSc=;
 b=4RtlAUEkzB1KiIVx1falGLGaGZNOSjRWPvifeVbqOcJOvIUVJtS3BZfg+VvIpfRs6G/X4yED8GRq/UKlc/mOKLVJR9LI4B9lOUit2vh3dewwZsmkRouU19HPswYSR0h5PEwBnXhMExMTek2sekYtkij9woqMVp+7wu5PNqXXRfI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 15:54:04 +0100
Message-ID: <D96G4QICTBWX.193DL39JIUJ9K@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 10/16] x86/hyperlaunch: obtain cmdline from device
 tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-11-agarciav@amd.com>
 <AOApTL7inEgfBXUrdPTzjM3e6XyK-nDlfQz5j7gpcrOIHEJfLC9sXSTgbSthCSkzDqjRK8vAY-_5yDSXiKSEnEkoBvDIvCU9Rw-ZbsIZRh4=@proton.me>
In-Reply-To: <AOApTL7inEgfBXUrdPTzjM3e6XyK-nDlfQz5j7gpcrOIHEJfLC9sXSTgbSthCSkzDqjRK8vAY-_5yDSXiKSEnEkoBvDIvCU9Rw-ZbsIZRh4=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|IA1PR12MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb620fb-b3fc-44ce-5732-08dd7b64353d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDVtUXVjTEh5d2tYYTJqaVRzMTdaNnd3dHBYQUFGVXd5VTZVZjZMZ3JiM1BH?=
 =?utf-8?B?WWpuTTdwdVdZR3k0cndrKzZoWmtsODF0RUVzT1k5SWxWQUQrVGcrM2FvRGpx?=
 =?utf-8?B?WFNqZEZ3OVNMYUpiVXIxU0xZMEtOdEt2djNXcldsT3J1NWVzVDcxaW9oVnpy?=
 =?utf-8?B?VkVrQkNkVXRjdTFrYjdQZjRCZzZSWi92M3VnUkovdkMyZUFNcFhCQlpiQWg5?=
 =?utf-8?B?NHQ4STFmeVQvTDM4cHFVQU1Fb0sxT2xPam9wVjhUcFZzOU5jTnp0RkNrbnNn?=
 =?utf-8?B?Q05UWDBneTFUQWlVSjEyQmRuaUxLcHVhTGdBeURPeTcyRFVDTEE3dUsySmdO?=
 =?utf-8?B?NE1mOW8raUVpSUhwQlorQnJvNGlBbjd1ZXRHeTVpVVZZQjZYc0g4UGwzY0My?=
 =?utf-8?B?Z29tVUI1aXhnMEY0dGVQMkpsd0k3dzVab1N0Z05tQTBqVmNSOWh3OG9nYXAw?=
 =?utf-8?B?QUJCV1Q4dmhSdnN5RU5UdktrdGxsTTBJS01ZeVFvN09BaG9FNWVsRFhUNERh?=
 =?utf-8?B?QTAwMmk2eFV6N1A1SzgzNXJSMjZ2SDh1ek8rdmRFREZYazA1RW5KanAzeTVi?=
 =?utf-8?B?ZmJ4NjMxT3kwcS8xdGZlZVN5SVNlZU4zdldOcldvUlhIKy94dEdEdjVpYlVy?=
 =?utf-8?B?a3NBOHpWU0RGd1IyUjY3YVZRQWdsSWNaaU5oZEpteVBiQy9zajhPdUtXZWsz?=
 =?utf-8?B?T21NNFNEQi9FR2ZkMkN6MG1QSkZCVWFNcFhzTHdpL0x2TmRGc2tqdHdHMUlY?=
 =?utf-8?B?eEFKUEpoNEd0L0ViUVJmc2NyM3VDWEZhODVWSElCcjR5bituYnpLbHNvRktH?=
 =?utf-8?B?UlIvOE1ER0ZpVXhncy9UMUtWM1lQaW9POUhhLzV0bUY3T3hPeWNsK0oxNjk4?=
 =?utf-8?B?Uitxei9GWFV0SDBlVzJZcm1jRDk5akFIdXBNQmlDTEJyMkNIRzJndllHY2hv?=
 =?utf-8?B?WWQ0eTUzeEU5cjRudjkvbEJnYjBiai8vM0pvMU1sVkoyWDQ5bHlhTjdxS0x6?=
 =?utf-8?B?NkNJK3VCK1kycUdYMi9wK05OcHBzZ2lpcWRNL1RlVWhVNVp1YWpJTWdCZytY?=
 =?utf-8?B?NWh4UzM2ZUI0T2c5bkZzVXNzS1RXMnBtRDQxRzhxaE4xSUc5Rlh2OStqTVNJ?=
 =?utf-8?B?SEE4b2ZlRGhHWkl2K1krQlRIZFhlaWQrUXdiTmMrWXYwUjR6TDQyRnNGcVJu?=
 =?utf-8?B?M1ZLRnF3SC9NdlNMcHR1bGlTekQ5ZHdwdUNNWjIwbU1kdkUzbzNBV25BbkhQ?=
 =?utf-8?B?L3dIM1luOU5wbWZ5OGduTUgzaVNLcUpzUmIvZTBTekp5L21QdDVtdTBTUmZQ?=
 =?utf-8?B?MFVHK1RudDlxbnNPcnJkTmNMT1d0d2VBUE9JclQzcjlwQlNlK293UVI5S2My?=
 =?utf-8?B?SCtxMGc5VUx4UzcxTDVKMFRQeVRyNzdEZk4zL01mTEx6UzZPSldPQndNWHU0?=
 =?utf-8?B?azNOWkladXZCTUszRFdFbVMxRjBNam9aY1FUVkd6Wm91ZllIQWpCdjY5a0RK?=
 =?utf-8?B?SCtCTXBYdjZLT2Z1ZlBkWGxMbnVSOVQ2UWJQUDRPM1NTdTJjOE9GUUFKN29J?=
 =?utf-8?B?Mi9iTGRGRXVvUTJYWXQzZ1FZd3poZXFKOGJaSHN2M0xwZUx3RFRrVmdLcEZw?=
 =?utf-8?B?L2FIdVZBY2cvTlhDenZyWFRjSVc5OVg0bFUwVzRyUHUvN0xUOFNWYkpDMnB0?=
 =?utf-8?B?dlhmbXFrZ0JuU2xZc3F1S2lsRm9xMitaL1dLV0JPTENtVWs5M3NFYkhxNkVh?=
 =?utf-8?B?TFovM0ZXQUh0TUpXR3RBWHdET1QwV2Y5OW9aTmo5SGEwZXd5ZVA0Sk5PdE1V?=
 =?utf-8?B?NnY2T3BOL3VyR243dDl0ektzUDBFYXdpMnphdXRMYnJNQ2hWM3NVSTZtZ3I0?=
 =?utf-8?B?YmZzYU9KZ0swSTErWlBvM2E0a0V1ZDRXU1JhSmRvTmx2cFNXS05VR1M5Q2Rs?=
 =?utf-8?B?azgrREVwaEIwdzd3ejVKUkh6OVNCS2xmbmphbzRkVlR5QktlSXBYMW44WU9Q?=
 =?utf-8?B?WUk5ckJGSTZqeC9oSVRITklWR05tMnJieTd6bGRqN2s3ZWhWeHZSNENwUk01?=
 =?utf-8?Q?tn1tTr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:54:07.6011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb620fb-b3fc-44ce-5732-08dd7b64353d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7710

On Wed Apr 9, 2025 at 11:04 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Add support to read the command line from the hyperlauunch device tree.
>> The device tree command line is located in the "bootargs" property of th=
e
>> "multiboot,kernel" node.
>>=20
>> A boot loader command line, e.g. a grub module string field, takes
>> precendence ove the device tree one since it is easier to modify.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> ---
>> v3:
>> * Rename to fdt_get_prop_offset()
>> * Remove size_t cast from builder_get_cmdline_size()
>> * fdt_get_prop_offset() use strcmp()
>> * fdt_get_prop_offset() return bool
>> ---
>> xen/arch/x86/domain-builder/core.c | 28 +++++++++++++++++++++++
>> xen/arch/x86/domain-builder/fdt.c | 6 +++++
>> xen/arch/x86/domain-builder/fdt.h | 25 ++++++++++++++++++++
>> xen/arch/x86/include/asm/bootinfo.h | 6 +++--
>> xen/arch/x86/include/asm/domain-builder.h | 4 ++++
>> xen/arch/x86/setup.c | 12 +++++++---
>> xen/include/xen/libfdt/libfdt-xen.h | 23 +++++++++++++++++++
>> 7 files changed, 99 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bu=
ilder/core.c
>> index eda7fa7a8f..510a74a675 100644
>> --- a/xen/arch/x86/domain-builder/core.c
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -8,9 +8,37 @@
>> #include <xen/lib.h>
>>=20
>>=20
>> #include <asm/bootinfo.h>
>>=20
>> +#include <asm/setup.h>
>>=20
>>=20
>> #include "fdt.h"
>>=20
>> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset=
)
>> +{
>> +#ifdef CONFIG_DOMAIN_BUILDER
>> + const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]=
);
>>=20
>> + int size =3D fdt_cmdline_prop_size(fdt, offset);
>> +
>> + bootstrap_unmap();
>> + return size < 0 ? 0 : size;
>> +#else
>> + return 0;
>> +#endif
>> +}
>> +
>> +int __init builder_get_cmdline(
>> + struct boot_info *bi, int offset, char *cmdline, size_t size)
>> +{
>> +#ifdef CONFIG_DOMAIN_BUILDER
>> + const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]=
);
>>=20
>> + int ret =3D fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
>> +
>> + bootstrap_unmap();
>> + return ret;
>> +#else
>> + return 0;
>> +#endif
>> +}
>> +
>> void __init builder_init(struct boot_info *bi)
>> {
>> if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index a037c8b6cb..bc9903a9de 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -189,6 +189,12 @@ static int __init process_domain_node(
>> printk(" kernel: boot module %d\n", idx);
>> bi->mods[idx].type =3D BOOTMOD_KERNEL;
>>=20
>> bd->kernel =3D &bi->mods[idx];
>>=20
>> +
>> + /* If bootloader didn't set cmdline, see if FDT provides one. */
>> + if ( bd->kernel->cmdline_pa &&
>>=20
>> + !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>=20
>> + bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>>=20
>> + fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>>=20
>> }
>> }
>>=20
>> diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-bui=
lder/fdt.h
>> index e8769dc51c..91f665c8fd 100644
>> --- a/xen/arch/x86/domain-builder/fdt.h
>> +++ b/xen/arch/x86/domain-builder/fdt.h
>> @@ -12,6 +12,31 @@ struct boot_info;
>> #define HYPERLAUNCH_MODULE_IDX 0
>>=20
>> #ifdef CONFIG_DOMAIN_BUILDER
>> +
>> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int off=
set)
>> +{
>> + int ret;
>> +
>> + fdt_get_property_by_offset(fdt, offset, &ret);
>> +
>> + return ret;
>> +}
>> +
>> +static inline int __init fdt_cmdline_prop_copy(
>> + const void *fdt, int offset, char *cmdline, size_t size)
>> +{
>> + int ret;
>> + const struct fdt_property *prop =3D
>> + fdt_get_property_by_offset(fdt, offset, &ret);
>> +
>> + if ( ret < 0 )
>> + return ret;
>> +
>> + ASSERT(size > ret);
>>=20
>> +
>> + return strlcpy(cmdline, prop->data, ret);
>>=20
>> +}
>> +
>> int has_hyperlaunch_fdt(const struct boot_info *bi);
>> int walk_hyperlaunch_fdt(struct boot_info bi);
>> #else
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/=
asm/bootinfo.h
>> index 1e3d582e45..5b2c93b1ef 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -35,11 +35,13 @@ struct boot_module {
>>=20
>> /
>> * Module State Flags:
>> - * relocated: indicates module has been relocated in memory.
>> - * released: indicates module's pages have been freed.
>> + * relocated: indicates module has been relocated in memory.
>> + * released: indicates module's pages have been freed.
>> + * fdt_cmdline: indicates module's cmdline is in the FDT.
>> /
>> bool relocated:1;
>> bool released:1;
>> + bool fdt_cmdline:1;
>>=20
>> /
>> * A boot module may need decompressing by Xen. Headroom is an estimate o=
f
>> diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/in=
clude/asm/domain-builder.h
>> index b6d9ba94de..7518b6ddf3 100644
>> --- a/xen/arch/x86/include/asm/domain-builder.h
>> +++ b/xen/arch/x86/include/asm/domain-builder.h
>> @@ -3,6 +3,10 @@
>>=20
>> struct boot_info;
>>=20
>> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset=
);
>> +int __init builder_get_cmdline(
>> + struct boot_info *bi, int offset, char *cmdline, size_t size);
>> +
>> void builder_init(struct boot_info *bi);
>>=20
>> #endif
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 00e8c8a2a3..ca4415d020 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(
>> {
>> size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>>=20
>>=20
>> - s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) :=
 0;
>>=20
>> + if ( bd->kernel->fdt_cmdline )
>>=20
>> + s +=3D builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
>>=20
>> + else
>> + s +=3D strlen(__va(bd->kernel->cmdline_pa));
>>=20
>>=20
>> if ( s =3D=3D 0 )
>> return s;
>> @@ -1047,9 +1050,12 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>> if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
>> panic("Error allocating cmdline buffer for %pd\n", d);
>>=20
>> - if ( bd->kernel->cmdline_pa )
>>=20
>> + if ( bd->kernel->fdt_cmdline )
>>=20
>> + builder_get_cmdline(
>> + bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
>>=20
>> + else
>> strlcpy(cmdline,
>> - cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
>>=20
>> + cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
>
> Add extra space before bi->loader?

Yes, was a spurious diff.

>
>>=20
>> cmdline_size);
>>=20
>> if ( bi->kextra )
>>=20
>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfd=
t/libfdt-xen.h
>> index 2259c09a6a..e473fbaf0c 100644
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -23,6 +23,29 @@ static inline uint64_t __init fdt_cell_as_u64(const f=
dt32_t *cell)
>> return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
>> }
>>=20
>> +static inline bool __init fdt_get_prop_offset(
>> + const void *fdt, int node, const char *name, unsigned long *offset)
>> +{
>> + int ret, poffset;
>> + const char *pname;
>> +
>> + fdt_for_each_property_offset(poffset, fdt, node)
>> + {
>> + fdt_getprop_by_offset(fdt, poffset, &pname, &ret);
>
> Return value is not checked.

The pointer itself is ignored, but the error code is placed in "ret"
(when there is an error). Hence the ret < 0 that follows this.

>
>> +
>> + if ( ret < 0 )
>> + continue;
>> +
>> + if ( strcmp(pname, name) =3D=3D 0 )
>
> I got an impression that the preferred form is=20
>    if ( !strcmp(pname, name) )

It varies per file. Doesn't matter much, but sure. Will change.

>
>> + {
>> + offset =3D poffset;
>> + return true;
>> + }
>> + }
>> +
>> + return false;
>> +}
>> +
>> /
>> * Property: reg
>> *
>> --
>> 2.43.0

Cheers,
Alejandro

