Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CEA88636
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950576.1346849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LLp-0005CP-QE; Mon, 14 Apr 2025 15:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950576.1346849; Mon, 14 Apr 2025 15:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LLp-0005AT-Nc; Mon, 14 Apr 2025 15:03:57 +0000
Received: by outflank-mailman (input) for mailman id 950576;
 Mon, 14 Apr 2025 15:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4LLo-0005AN-Rd
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:03:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2417::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeb72fb3-1941-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:03:55 +0200 (CEST)
Received: from SJ0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:a03:333::9)
 by DS2PR12MB9638.namprd12.prod.outlook.com (2603:10b6:8:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 15:03:52 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::ce) by SJ0PR03CA0094.outlook.office365.com
 (2603:10b6:a03:333::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 15:03:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 15:03:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 10:03:50 -0500
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
X-Inumbo-ID: aeb72fb3-1941-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrdEEVmi8laaT+4rG8NPq1UkeR9FkIdcI5R+QEiowVx4lzHlPVutw63NHDF2Kpv2cBEFbdS19hWVMHl/0wJJ6VwA3cFR4afcx7Sr03MUXsA2c73wg1TUAZq+VaBWbQ5B5ZHkqZl4IMHFThMJ/Z7RzDibvzgoehWu8jJATpT7MAhx8qEspBFfKU948FZqmOVMZv2GZn583TTN+z7dsNxVJfgzpuH+IZq/hOv8GHKWoo/I1Ab0YWCjrCsoPzunRpvbdVB8XMa4AkfQwhy/shmzKIQ5oN8EBgTbuUUB3V8P++CEuEtR3jGuLQ0KscPs1uKYKepzZRrCxJci3Sf1nrkozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTDo9S43f3q/LJBo+YY+ewFAiai3I1RtUbULLsKPaGk=;
 b=S+B04SssKDziUfewm5P/2nV2RbBOKz8f4DAy4Tj35s+4GBveoapyGLo+01KSFJbIv9Bwgzc5PcfXgF6vjKyZmpo4YO2KXVTZ8ns6cpcI58IWbeF14gBGEqrLh2nvYAwzYcl4TjUpGim8lqCZgcWY5tzwlXDrvif7ezFFl5tGeiL2ui6kw0wqDaQ1tbNoOG6+mfDzQhmrCKyO9WGWCr7rGt2pzhsz2uFsVFnPxHkL/Sq5/QRG+d8hYm45HQbwsvT7kBVkTNX3OHbCJi3ldt2qEJRViqB360ZRKZFHSa5nmWeGiPclL4gU3nVZbrRUWcfxt8HgN6RovUctzjCPqkHhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTDo9S43f3q/LJBo+YY+ewFAiai3I1RtUbULLsKPaGk=;
 b=sFUhyWIyGEtZdQSt1yc3c4gErB21ilWb+TBJ7nQRZLaSAD/Jxl3pVBhJ8PfqmLUFEIkq+XgtzLy37GvZPTGmUUSgSYOQ9QUgjkYX8o35mMOxVDewGsRIyqUNMb4zeH+42C+b6aMTzeYYzjFQ+CaTtHgQvccJURiKGMnMiYUujxk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 16:03:49 +0100
Message-ID: <D96GC75DZ896.Z4BJTB49L330@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <7yfsIOlu7485oxHgd2L0b32KqzOfx7cJg8-ZwVb41T2NljBamLliFUysp7IM4fSh-DvmZD1H-9Gh2pjpSdIrXkUbbo3pxRV3h3P2TglHJlA=@proton.me>
In-Reply-To: <7yfsIOlu7485oxHgd2L0b32KqzOfx7cJg8-ZwVb41T2NljBamLliFUysp7IM4fSh-DvmZD1H-9Gh2pjpSdIrXkUbbo3pxRV3h3P2TglHJlA=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|DS2PR12MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: 494471e0-443b-46c8-db93-08dd7b6591d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTdDOUg4QjRVUFV4aUtEemNiMnBNSzVzd2cyUVRFQkt5V3gzWEMwby9Xb3Iz?=
 =?utf-8?B?bFpvM29qRUw2czFtTVk2ZHhiOXk2RDM1eDRtMHhKSVRQbUR2V0ViMnZjVkxQ?=
 =?utf-8?B?T1Y2Z212VWxBTnBOSDJlQTNFNCt3Tlh1ZGRDQkRsNGRWZ0JiNENCejVYOFp1?=
 =?utf-8?B?TUdTOURHaWhxRm5QRkNxMkZuT2RtU0RGUTFOdEtDb1FHMnFrUkdGQW5jZVo3?=
 =?utf-8?B?TXJXL0tob21RTkxzL1NFOGJaZzVkam5HVUo2Q0lHdzZJRnhRNjdSMHlGOFhn?=
 =?utf-8?B?emJUTU92dXUxb2lZTDQvWkdXd2lvbGZBVVFPZmV5L1RpU2g1RysveDRDQlNp?=
 =?utf-8?B?dlBoUi9NZDMzc25BcjNTK0htSFowWXVKS3hZbVFPNlRWY3JyU0NPSzdWWm1o?=
 =?utf-8?B?dWcvSTMvd2dLV0hTbWt3WEhLVDgzRkM1WHNqV2xEMHUvd3U0NlAwRTFWZ0xx?=
 =?utf-8?B?SG9SdExaM25iVGxMTEtjOUttUlRDQmpIRmg2Y0tpWGFOOUZCYUQ5cHdZaGIz?=
 =?utf-8?B?UHNQREgrSUhiYlFyNzNZVENqYjM5V3QxbmQrZm9ZS1oyZHJ6TTRVZ2ptRjZh?=
 =?utf-8?B?dm1yS0Z5cW9Ec2gwL3RmdU1EQURCYVl1NFJVUnFLUnA4TVJIdzAyRzVwNVB1?=
 =?utf-8?B?U0V1WE9LdWN1ZVBKcTZQUWlCNVF5MmM4SG8rZlpSS0I4UGJrU0FWcWlxaEJI?=
 =?utf-8?B?R050QWtxWWNyTURPbjErVTdLbnFOVjFKR3RlYVQrTCtsTmF3RU9UT3dNdFg4?=
 =?utf-8?B?eWQ4M0Mza0ZKbFJ2bE9DWWFzQXB3UXdYV25iT1Y0SkEyQkg4YkpydGdKaUMr?=
 =?utf-8?B?MGlOYi9lWWhVSTZtVUhvSGhhZk1SdzlLWGtRSzFhbnFSQkQzR0dGaWZ3TjFI?=
 =?utf-8?B?VkNLVXFKTXdpTkUyK2d4dFFWTTY5Vi91SnF0SkFLOE5mcVBZWktwVUxhYmNN?=
 =?utf-8?B?czdxV01Qbm1JUWFTTjRVRGRyek15TURmMEJUb0M2TGJBNzBIQm9nLzVEbS9h?=
 =?utf-8?B?QlZ3WHBzNVVXMkVlclZTbktRNjBicE1aLzRXZmZEaHF3MitwakJ3UmNJcWVO?=
 =?utf-8?B?bDBoWEtCV1lhVE1vcDlUMVVpRGNUclpINE9xQnJkQ1hHVUlXUnRJVDdKcmpF?=
 =?utf-8?B?U1F2cnhLZEY1N0JrQ01NRFViZkFvcHlXdnY3bUIySnpzVzM0SnlKR29JUEhC?=
 =?utf-8?B?b0lwSDhDaFlNRU5QeWtmcG5rQmJ6T2xSMVkxZWNOeE1zYlFQY3QzbktRZFFF?=
 =?utf-8?B?eDJKQmdwTzM3eTBqZktJb2I0Ukh0eXgwZ0dGaTFiVTAxRnplMUxUUnJuaHUr?=
 =?utf-8?B?QnQ5aVY3LzNVY2pwVW93NlNud3BxYWRaazlpR2E1MFlqU3o5ajgvY1Z3RWVp?=
 =?utf-8?B?aWxodHpKSWJaQXpEaWwvZTdrTkZLaXc1KzJVcmlMd2tibzJ6eGprL2xCYVgy?=
 =?utf-8?B?dEV5ajY0WVZDamJDejdBbkUxTFRueUcvQy9hK0hha3Y1TVFpVnVMK3JuTzBi?=
 =?utf-8?B?VWZ6WkRHRkVzMFV0bDQwbVp4alB0bE14dlplaG1XMkVFNDdoazlNSkoyTVJL?=
 =?utf-8?B?T3l5RndBUFBCQVdKV2Z2WEQ3d3hjZnJ3YXlZdHdveU81bG1SREU2U25nZTZV?=
 =?utf-8?B?OGRFaEJtVHFDSjZZc0dxdE53SmVUSjR5SFI2RHpKZ21uMUdBVXlnVzI1OUpx?=
 =?utf-8?B?UkxDNTB1ZVR0UGZ3QW1FNTM0enpLL3oyNFhLMHNCa0o3eUFHdS9hV28vQ0dv?=
 =?utf-8?B?cFc5SHFDYTBFSlROSGQ0YVM1dEZpRDRRWW5rZVFYSDE2UElRa1h4OHZXRnhM?=
 =?utf-8?B?ZXJ1N0ZhR0tBTWZKNXlBanFHbWJuQWxLRkxBaTdya1ltQzV3dXlha3EzeGhF?=
 =?utf-8?B?SjRRSWQzcU1xZkliaitqT3JHSm9mbTlHUGMydzdOa1Y4U2hEK09LUFMyNGhD?=
 =?utf-8?B?bzRNeXpyMVo4cGVzUTU5SHA1WklydERrNWE0cCtnQTBXcDIxMjRxTEdUakZ2?=
 =?utf-8?B?TEgzem1sWWQrWjNwbEN3RmpLOE8rZkhYZjdLeEpMbHMwWEdpZisvVjQ1eXRD?=
 =?utf-8?Q?Xwc6Jf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:03:52.3631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 494471e0-443b-46c8-db93-08dd7b6591d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9638

On Wed Apr 9, 2025 at 11:07 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Look for a subnode of type `multiboot,ramdisk` within a domain node and
>> parse via the fdt_read_multiboot_module() helper. After a successful
>> helper call, the module index is returned and the module is guaranteed
>> to be in the module list.
>>=20
>> Fix unused typo in adjacent comment.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> Signed-off-by: Alejandro Vallejo agarciav@amd.com
>>=20
>> ---
>> v3:
>> * Reworded commit message to state the helper postconditions.
>> * Wrapped long line
>> * Fix ramdisk -> module rename
>>=20
>> * Move ramdisk parsing from later patch
>> * Remove initrdidx indent
>> ---
>> xen/arch/x86/domain-builder/fdt.c | 29 +++++++++++++++++++++++++++++
>> xen/arch/x86/setup.c | 4 ++--
>> 2 files changed, 31 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index bc9903a9de..0f5fd01557 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -195,6 +195,35 @@ static int __init process_domain_node(
>> !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>=20
>> bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>>=20
>> fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>>=20
>> +
>> + continue;
>> + }
>> + else if ( fdt_node_check_compatible(fdt, node,
>> + "multiboot,ramdisk") =3D=3D 0 )
>> + {
>> + int idx;
>> +
>> + if ( bd->module )
>>=20
>> + {
>> + printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",
>
> I would start the message with lower case so it is consistent with the ot=
her one.

As mentioned before, this is due to how it's meant to be rendered. This
is a standalone message, hence the uppercase (consistent with the
duplicate kernel).

Will change the XENLOG_ERR into XENLOG_WARNING though.

>
>> + name);
>> + continue;
>> + }
>> +
>> + idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
>> + size_cells,bi);
>> + if ( idx < 0 )
>> + {
>> + printk(" failed processing ramdisk module for domain %s\n",
>> + name);
>
> Prepend the log message with XENLOG_ERR ?

Indeed.

>
>> + return -EINVAL;
>> + }
>> +
>> + printk(" ramdisk: boot module %d\n", idx);
>> + bi->mods[idx].type =3D BOOTMOD_RAMDISK;
>>=20
>> + bd->module =3D &bi->mods[idx];
>>=20
>> +
>> + continue;
>> }
>> }
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index ca4415d020..3dfa81b48c 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2149,11 +2149,11 @@ void asmlinkage __init noreturn __start_xen(void=
)
>> * At this point all capabilities that consume boot modules should have
>> * claimed their boot modules. Find the first unclaimed boot module and
>> * claim it as the initrd ramdisk. Do a second search to see if there are
>> - * any remaining unclaimed boot modules, and report them as unusued ini=
trd
>> + * any remaining unclaimed boot modules, and report them as unused init=
rd
>> * candidates.
>> */
>> initrdidx =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> - if ( initrdidx < MAX_NR_BOOTMODS )
>> + if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
>>=20
>> {
>> bi->mods[initrdidx].type =3D BOOTMOD_RAMDISK;
>>=20
>> bi->domains[0].module =3D &bi->mods[initrdidx];
>>=20
>> --
>> 2.43.0

Cheers,
Alejandro

