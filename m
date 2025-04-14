Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE5A88955
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950954.1347120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NGF-0003ej-Hz; Mon, 14 Apr 2025 17:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950954.1347120; Mon, 14 Apr 2025 17:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NGF-0003c5-EZ; Mon, 14 Apr 2025 17:06:19 +0000
Received: by outflank-mailman (input) for mailman id 950954;
 Mon, 14 Apr 2025 17:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4NGD-0003bw-Q3
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:06:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2413::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c57dfe7f-1952-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 19:06:15 +0200 (CEST)
Received: from MW4PR04CA0323.namprd04.prod.outlook.com (2603:10b6:303:82::28)
 by DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Mon, 14 Apr 2025 17:06:09 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:303:82:cafe::ed) by MW4PR04CA0323.outlook.office365.com
 (2603:10b6:303:82::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 17:06:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 17:06:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 12:06:03 -0500
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
X-Inumbo-ID: c57dfe7f-1952-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqZAGD6I+QdJMogp9Pbo7aw9s9VOy2TfzdB6OqYu/atMy/izXAreRKaFw9QGmPt7i6Zxs/OLMeFQqSyWBKU+VPvjXbuEPFn8OkoeWzXFMhomy8e1NB3MKMAWBJL1dwYjxwZQ4uS1W0AaEH5XKkS8FJH7LuQ/vH2krF/D48X64YBDBhzAC9xHqiN6UUBEh6/eCttnN/u/CwZ4sjSZWRcGaDxUxSw/oghHvLOf6jLpyxL6JLfc0UWaokm5GLjEMOqa3+OIGkbIUyFkuRm6Usk56GJs0BhupHUgDlAslqwKOPkta2aMC3cC+3yn5GTqTSJu0jLcB9V+acLHjGvWTecMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0+MIl3LtTlQ3iANrOXLb54UQZ8lH+NafCNh5Dkkvn8=;
 b=gAx04wMVl/36iv4oYbsl6F3Nurxo/xsndh2iwu7LyVrLtj9so7QbnOYFmY3gGclucM8EwNzGuDt9FJKY9XrBB3kgGQAdrnVxMwX15ULWTjtCx1gkafsIrVClOvoK7swhd3T/0gLQKd94l26qvti4GFFOziaQsxQcWJ0B0929IL+ZxBVobbO34+LPvBwU4LKZpiBmeaQ8RWz4eedaE/MpA7MgiBFeE9vlgAACzzXiaRmsyp/k44WlCBQu/Y4/2Cd3mDcWg23V649aCJaFxM1HOHlr27uPvaS8naIHN7p/m5CE63Ol9ITERmQVVmF0A8eoC72BGaHg3K0nQWEM2AFjOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0+MIl3LtTlQ3iANrOXLb54UQZ8lH+NafCNh5Dkkvn8=;
 b=yX2nuey8MHIx1Apz2yKD9BoN2Q3zm8wCq+0DSmng0qqgBIS3yoS16f3KZ0obKe5vqF7yOeMTQ9tdIwYVE3aHfa2fBAUy6mnHii68STB08KXc9BrFTnJ1K5HU67qioHnbwnMRLuLrf9GSDST9KVBH74l3d7cU3T1V/2nInU5sJYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 18:06:02 +0100
Message-ID: <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
In-Reply-To: <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|DM4PR12MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: c861fb08-d26d-44fd-dbab-08dd7b76a6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmhickNZRm5vaWNYbEcxNHh6VTYvczFQemdSSWE0QzBxZlFpbWxzTm9UaEVQ?=
 =?utf-8?B?MGhsd2M1WDJkczcvUjJlMW9PN2xVSDJqTXNhN1hNdFNBM3pVK242RWZWeDhG?=
 =?utf-8?B?TnF6ZTV5VkxHaHM3em82MmZiMXNDQmFYb3p0MVVZNzFUVllGaW9NeHRIZUVp?=
 =?utf-8?B?L1VXbFgyMHF1U2R2cyszUTM1WGtwU0VDcFhPY3BkQlVEbVVYUi96Vm9xZUtP?=
 =?utf-8?B?SElOWjdxa2VBM2VRbTBCSzhwQmVaRklFZ25UbG5qb1JvSjZZSTFQTUFDQ3p1?=
 =?utf-8?B?Z0RvblJCbmVLYlhkNEJwODlZWHVtdTE5UExVZ2UwaGV0dlJQbEM3dDBFOEtD?=
 =?utf-8?B?VWhjbmRCZnZwaFNSalRDZ24rdmhCQ0IwdWpLOVFwL1NRbHpadWUwUk9MZ0Y0?=
 =?utf-8?B?aWovQklvUFJjY1VIR2lmOXpVUFUxeFRtRWZMV1VnMDJtR1cxRWhnRmNFUUdI?=
 =?utf-8?B?QlIzZEw3TXVWRU1iWjVvOUExU3NmUXV4UmpmMDVzZFR4TkZFMzJXZG55WG5T?=
 =?utf-8?B?enREcWE5d1pldVhMcFRlQndielJTOUZJN0NuVmpneStXN0JEeW9tWXNMekJk?=
 =?utf-8?B?Sk85dE5CcWltSFlmMnl0Z21YOUpycnAwTUkrZHNiRUltcEdLRWVBdXhYU1lM?=
 =?utf-8?B?SE5CSnhvS0JyUnJNeWFpVHpIb0pMb0JoR1d1eXl2dm5GNGQ3cnkwbzVHNHFn?=
 =?utf-8?B?Q0R1QTBhUVBURkxXMW04N1VTeVBWZ3JlM3VWV3dheXVBdnEwYWdEeHpIbFVI?=
 =?utf-8?B?Z0hKT1F2c3UzcXdqVWhFbDBFbWppQ2pzaVo5LzZaYWZSY05LK0hMMDdxQnk3?=
 =?utf-8?B?OS9UVVB5WjJnWiszRUM5aEhiUWUranZrRHFwTjlvRGNmbU1Ib0NhQjA4eUNG?=
 =?utf-8?B?eW5wYXZaQmdNY1V5NjFlWmRqK1V1OUN6WU9sZEtObDV2TFhic1lvdllPMzl0?=
 =?utf-8?B?Vm83RXRiUS92K215ek1CWm84LzNRWUd3R1RqRHlheXNSUHY1dStCZ0hBTG44?=
 =?utf-8?B?WElOTjg3UmNsdnRrZjYxSFJpeGJzUXU4dDI3Qmc0Y1l5dE51QnA2WnVEbDFK?=
 =?utf-8?B?blZ2TDJ3aHVPYTFnaENIYXRIWW5FcFoxQ2cyaW56ZlJOZ081NEIwcnJaMkJM?=
 =?utf-8?B?U2xMWUhxcHFRd2VjMmtWMHBTV2tXNFVWcmJ6RUsxRmJFbkJ5SWhGa1BTZ2NM?=
 =?utf-8?B?Q3k2SXpBcTlwNmgwT3VIdkxBOXRTemt3SDFyMUR6bERoNDJYMDlOdVg0cGs1?=
 =?utf-8?B?NkFtM2h4SEwxdWZmUVdBNUViTHFic2dkV3o4bzZLS1U2SW1pNVgxNndhWloy?=
 =?utf-8?B?ZGV4UjlHaDk1SjR6SFBENXU1S0pRVXpBdTRFcVMyaEkwSWhYU3B0aU9SMVBK?=
 =?utf-8?B?NXZQOFpwSGR3NDhCWTdSYjhJSlQ0SERta3lvbVo3ZEpzK1dKc3oxbDZEM3U0?=
 =?utf-8?B?N1FBN00yY1hFcU1jVWhCN1pZNTI3bjFVcldaK0RaTTAxSG5OczlxakhwVkoy?=
 =?utf-8?B?MU9pdS94Njc0Qm1zN1BBOFVVSzFlaVpLT2hkNDYwbWlySUdYV2FKZWNBZDU2?=
 =?utf-8?B?TkZvUUhtRERmeGhrOWhneU1IU3ZwMzM2K3pkVElCbUtLUjNKR29tQXdLeDI5?=
 =?utf-8?B?ZFZrQlBEOW1QL1Q5MXN6UGtraHRYNEN3VFNhdjFsc1BiVGhxQ1NUWGh0ZXVj?=
 =?utf-8?B?L240Y05YWDlkMGNKM2ZIOHB6U3FIOFRyTHpjTnVNZTRiajdpT1B6cGY2d2Rw?=
 =?utf-8?B?M3RCTFRnOWR1eEFha0NhZ3NZNlRhNlNxeEluWDNYZU02dXR1YkR6VEhaQ0hj?=
 =?utf-8?B?dGZIMXZpenlTeE53VzNnMGxudUd6ajcxRy85djBGcGxQNGRvd29iWkVGV2Fo?=
 =?utf-8?B?N1crVWt1V05xclllK01pQ2Z0SGZnRU5OZTV5MFBSRnljQmZQcGtSMDJsR3Fw?=
 =?utf-8?B?UmZKSzh5RUxIL3UwdnNQczYzZ21VWldiVUd3VHF1ZFhPdE5YWGZSVWdncWYv?=
 =?utf-8?B?TzRsdUwzTEg1MnpORlV3WlJRQWppbFdoZnlOY0Q3bkdNb0NMMGxYUE1BR05i?=
 =?utf-8?Q?y//RP/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:06:09.0658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c861fb08-d26d-44fd-dbab-08dd7b76a6d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400

On Thu Apr 10, 2025 at 12:34 PM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -195,6 +195,35 @@ static int __init process_domain_node(
>>                   !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>                  bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>>                      fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>> +
>> +            continue;
>
> With this ...
>
>> +        }
>> +        else if ( fdt_node_check_compatible(fdt, node,
>
> ... no need for "else" here?

Sure

>
>> +                                            "multiboot,ramdisk") =3D=3D=
 0 )
>> +        {
>> +            int idx;
>> +
>> +            if ( bd->module )
>> +            {
>> +                printk(XENLOG_ERR "Duplicate ramdisk module for domain =
%s)\n",
>
> Stray ')' in the string literal.

Ack.

>
>> +                       name);
>> +                continue;
>> +            }
>> +
>> +            idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
>> +                                            size_cells,bi);
>> +            if ( idx < 0 )
>> +            {
>> +                printk("  failed processing ramdisk module for domain %=
s\n",
>> +                       name);
>> +                return -EINVAL;
>> +            }
>
> Along the lines of what Denis has said - please be consistent about log
> messages: XENLOG_* or not, preferably no capital at the start, initial
> blank padding. May apply elsewhere in the series as well.

I don't mind dropping that and making everything flat (uppercase + no
padding), but there is some consistency. Albeit, it is true the
rationale is somewhat obscure.

ATM the consistency is: "padding spaces + lowercase" when giving extra
information on hyperlaunch. It ends up creating a hyperlaunch block in
`dmesg` with a "Hyperlaunch detected" line on top so it's easier to
know what lines are hyperlaunch related and which ones aren't.

Do you have a preference for a specific reporting style?

>
>> +            printk("  ramdisk: boot module %d\n", idx);
>> +            bi->mods[idx].type =3D BOOTMOD_RAMDISK;
>> +            bd->module =3D &bi->mods[idx];
>
> The field's named "module" now, but that now ends up inconsistent with
> naming used elsewhere, as is pretty noticeable here.

Well, yes. It is confusing. Also, the DTB is called multiboot,ramdisk,
because multiboot,module is already used to detect what nodes are
expressed as multiboot,modules. I'm considering going back and calling
them ramdisk again. If anything, to avoid the ambiguity between
domain modules and multiboot modules. e.g: a kernel is a multiboot
module, but not a domain module.

>
>> +            continue;
>
> This isn't strictly needed, is it, ...
>
>>          }
>>      }
>
> ... considering we're at the bottom of the loop?

Indeed

>
> Jan

Cheers,
Alejandro

