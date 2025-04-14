Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA5A88AB4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 20:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951135.1347260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ODH-0000nD-Or; Mon, 14 Apr 2025 18:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951135.1347260; Mon, 14 Apr 2025 18:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ODH-0000kq-M5; Mon, 14 Apr 2025 18:07:19 +0000
Received: by outflank-mailman (input) for mailman id 951135;
 Mon, 14 Apr 2025 18:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4ODG-0000kk-HA
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:07:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b433e9f-195b-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 20:07:16 +0200 (CEST)
Received: from SA9PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:6e::33)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 18:07:12 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::19) by SA9PR11CA0028.outlook.office365.com
 (2603:10b6:806:6e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 18:07:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:07:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:07:10 -0500
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
X-Inumbo-ID: 4b433e9f-195b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbnHBa5bVI2wN6Fa9qBrgkTK/0EIQyvIWwBrg2z3WW80opyVNd7FP1ZsDp4ocRi2NtgxAN6GQKZHcn+TEV5WzHKi/BRmwo8/kbPZ67r8hpZHYWBdAe31FHA/8mkzBNcIi2HPQvkwF1NBvXHhmZNnvp3mZKE8+PEC+QvxSkfZ2g95EGzJbwxTubeHiEP/w/S87T3wH0X6G7kpnpIjaOBlW/xPpG4SLESPzaFVFusyYgcEi5Nsx5KkHDKEeEla8iKh2XM7TbWHot3Q/VYQAE+BmHZrvO2ibDlSH4ZK5H2LN+jILCRx84UVJjh3cgymUPbqGisb65V4Hm3M1WoGfAJUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf09YEopIvj7NIqtHntTQdWrSXyNFqTOf64vLvzhdjc=;
 b=opGiWmJXIgtoWS/RV53O9xRnvsetqXnmJEhB2o25vE7ZnSTmWeLym6WjHqovYgTE17YSHb/MbVFlHt3KZdM2GCDvSFqAFh8xNX7wpqA89MpkEq7yEnvJkklj69G8kUS+1fjy3fLl9tIwR43xFsvJdzHxirU83zrb9npqeBuDEMpFX46YU0hZSWOjivBd+KoCqkU7//KayOA60apcndrUIV9HPKOYxiOfuZahOKd7xGz/nymwHyV7XYluhoy3o1ThQSSjYIgtVbIr6VxnzJoho4zwhzqmwJdWLGTn0vdZyIdGxjIuIV+E+erwUT8TqBBI+EMoisiZOdr9UeY9Jl7rrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf09YEopIvj7NIqtHntTQdWrSXyNFqTOf64vLvzhdjc=;
 b=KHqujrn/Jnc04v9ofV9VDHfyJ0HP4ge+xqXl6lXiP/YyOV5IxAVxLYAlnVW2kX+JszYubPeypolw1VB4oYZmv4SFkE2fi3SQeyzKMHVERpx62IGaX4/tUDaesSFYU8UFeJiXvuPL2yDlI7rlwZgZi8AmoxK4q8jJekVvbZ5Nzuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 19:07:09 +0100
Message-ID: <D96K8KED132J.3C79EPWZM813D@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to
 domain config
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me>
In-Reply-To: <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a8eede-79c7-4411-6ee1-08dd7b7f2e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDZPSHdpWTdFcjBjU2RtNWJ0dUJBL2FyYXBaa1FCTW82YUdMazJBZ2hEODNJ?=
 =?utf-8?B?S2g2RExuOUk1MjRLdy9PTkFSdFJBeEJocW9qSkNmT3RkMWFYTTU0bzZMcDV5?=
 =?utf-8?B?bGNDZGNPK2JqS1R4c09oUmN3N2hmMFdEKytmZWUzQzFzc3c4S29jcWxKVGJp?=
 =?utf-8?B?Yzl2VEpFT0hiVWJreWZHc2R4SmlPODVQRFpTYjVQQno4T1ZGTTNVd0dYOUg3?=
 =?utf-8?B?UllHMTNYbEJGQitHVEw3Rk9adFQzUVBpdFJDdzRMVFVwWU94ZmlIbE9FQXZO?=
 =?utf-8?B?QllrK0lxTlc0czVVNXNZMlYzNUtkMU9zdDhVelZJYWZzUVo0eXVBSWF3ZkFS?=
 =?utf-8?B?TkZDQTBBK2NMQjdRaW5IOEZHemQrVHp1OFRaY2IxcXdLK0RkT3dpakU5NlZV?=
 =?utf-8?B?NzJ5RUZCUkFCR0F5RlIxaXNEaGZybXJ1S3BydWhkdExVMUpyYXNERXA4MHFP?=
 =?utf-8?B?WmxuMlAzeVdZMnU4RThsRDJKSFFHeEc3VlF5bHlaNGwvMjc3ckV6TmhhZUR2?=
 =?utf-8?B?U25tcjZFWlVOQmFBbkVtaFlmRjNqUGZPWHFSVW4zZ0VKeDVKRGc0NGo3TU1q?=
 =?utf-8?B?S1doeFplK1VHNytSenRRVFZudVVwblNzMm5RVjVQYkg0WFIrenNFam43U3R4?=
 =?utf-8?B?L3JPMGdhSExMVlgxMUVmeU5BZ25TZWpteDJ5TFgrdnM5b0R1YTZhSk9GYUVj?=
 =?utf-8?B?eCtUbmFTTFNES3h3UUg0K1VBd3ZBVDltNW12UlNaVHorbVRITEY3QVZGNm8v?=
 =?utf-8?B?dGEwS25HOVg4dUtFM0U2RXdnZ1piZXFRTzJrT1cxQ2JqK0ZlWFJjNEFVU09O?=
 =?utf-8?B?dkRvcW40VFRjK2lpQTBTWElNV3pDTUJrSlJsWkRBUG0wRk1BbkVlbWJvbFpU?=
 =?utf-8?B?OGszNzVzd2F5WHJpeFl3UER1OFdEblA5UXFVL01YYU0xRjdtbzdKQ0VCWE5U?=
 =?utf-8?B?eVJRL1VzbGRpSlE1aTNwamVZU29XblArUXhIWVhMTHRXVUZJR2JlYVdwZ0t0?=
 =?utf-8?B?ZmtaNTFyakd6VE40dWpBZUd0ZUM0OVBzT29XbHo2VXQrc1pHYmtmSFpUSHlT?=
 =?utf-8?B?YVpFTUxCeVdZenJ2YUR1Y2tQdnI0SUNqQXZ1WnhZeGJteG9kZGVRWE9NVW1a?=
 =?utf-8?B?TDRPU2RVTTIyMmtmNG8rYlNZN3d3TkxsVXpDWXFrc2xuMmljamwwWW5KRUdB?=
 =?utf-8?B?WlhHNmhWK09CRFBXMU5YZGt6cTIrc2YySFhyNTdFQnNSS0ZUSC9SdXVxVXc3?=
 =?utf-8?B?c1JDRSsxeTRndms0RlNsb0J5eWdIT2F5V3BLcTRxN0UrcjMxSUYrMUlBMWlu?=
 =?utf-8?B?b3FRK0tydXg4N29EWWtpZmxSRmFoMGtUeHU1dkNjVFptMzVkSjRCU254bkJU?=
 =?utf-8?B?OGhnR1pGT2txTXFRRjZQaWllRHZSREdMYTFzWk9LWkUxRzlUOFduRno5Nlha?=
 =?utf-8?B?SU1pRnJGMWhnN2M0K3dUSjVJT3JPS3pHNGpXZXliRkdLZ05LajBwWnErRmRG?=
 =?utf-8?B?RUlTVVpRcyttVS9XVVY4MXRhZTlUa251SzR5aE91WUU4Ulk4blRkWkNiUHhS?=
 =?utf-8?B?YmEzRDI2TU9qMHNGMU5EOVJoMHNoN3VldEs2bW9rVHpSbGhFejhtQXVvQzVw?=
 =?utf-8?B?T2NwTURNRmI4d05uY1JWVXhnaHY4ODRMZkRiU2xjZFV6YVVPWGw4WnptdjR1?=
 =?utf-8?B?Yjd3MkVhZWw4SzNVL1hhYXdEcWNvcXJmQzJWSnVUeE5kVDNjOWRtT0FGRWxj?=
 =?utf-8?B?dHByNVExenY1VTZzT053ZTBNUUJXeWZCTTV0ZU1nSTF4VGw5T2JvSDlWZndj?=
 =?utf-8?B?RmNMQUx3RmlvUTFkMGIzSTlOZk5ZSkFiZ2ZwM1I4ZDA1SFF5ZkFFcW0wcGh6?=
 =?utf-8?B?M3R1bUl1SkhKeDFvMzBoRUZhYW1ObSs0eVJMRGpqdFQwUVBESWF4NE5PbEVM?=
 =?utf-8?B?NE02aXkzNlhPMGo2bXE3VmJPcnI1N1p3NWN0YlNTMFYwSFdjTU9oL1VtT1hX?=
 =?utf-8?B?clJVaGF4REZaV29rNTdFS3hGaXBaQjhNRnRndDNuS3BUbUVzdEl0K3N5R2ZI?=
 =?utf-8?Q?e/EsYm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:07:11.9195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a8eede-79c7-4411-6ee1-08dd7b7f2e0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712

On Wed Apr 9, 2025 at 11:15 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Introduce the ability to specify the desired domain id for the domain
>> definition. The domain id will be populated in the domid property of the
>> domain
>> node in the device tree configuration.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> ---
>> v3:
>> * Remove ramdisk parsing
>> * Add missing xen/errno.h include
>> ---
>> xen/arch/x86/domain-builder/fdt.c | 39 ++++++++++++++++++++++++++++-
>> xen/arch/x86/setup.c | 5 ++--
>> xen/include/xen/libfdt/libfdt-xen.h | 11 ++++++++
>> 3 files changed, 52 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index 0f5fd01557..4c6aafe195 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -8,6 +8,7 @@
>> #include <xen/libfdt/libfdt.h>
>>=20
>>=20
>> #include <asm/bootinfo.h>
>>=20
>> +#include <asm/guest.h>
>>=20
>> #include <asm/page.h>
>>=20
>> #include <asm/setup.h>
>>=20
>>=20
>> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *f=
dt, int node,
>> static int __init process_domain_node(
>> struct boot_info *bi, const void *fdt, int dom_node)
>> {
>> - int node;
>> + int node, property;
>> struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>>=20
>> const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>> int address_cells =3D fdt_address_cells(fdt, dom_node);
>> int size_cells =3D fdt_size_cells(fdt, dom_node);
>>=20
>> + fdt_for_each_property_offset(property, fdt, dom_node)
>> + {
>> + const struct fdt_property *prop;
>> + const char prop_name;
>> + int name_len;
>> +
>> + prop =3D fdt_get_property_by_offset(fdt, property, NULL);
>> + if ( !prop )
>> + continue; / silently skip */
>> +
>> + prop_name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_l=
en);
>>=20
>> +
>> + if ( strncmp(prop_name, "domid", name_len) =3D=3D 0 )
>> + {
>> + uint32_t val =3D DOMID_INVALID;
>> + if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
>> + {
>> + printk(" failed processing domain id for domain %s\n", name);
>
> Add XENLOG_ERR ?

Yes, and...

>
>> + return -EINVAL;
>> + }
>> + if ( val >=3D DOMID_FIRST_RESERVED )
>>=20
>> + {
>> + printk(" invalid domain id for domain %s\n", name);
>
> Add XENLOG_ERR ?

... yes.

>
>> + return -EINVAL;
>> + }
>> + bd->domid =3D (domid_t)val;
>>=20
>> + printk(" domid: %d\n", bd->domid);
>>=20
>> + }
>> + }
>> +
>> fdt_for_each_subnode(node, fdt, dom_node)
>> {
>> if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") =3D=3D 0 )
>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>> return -ENODATA;
>> }
>>=20
>> + if ( bd->domid =3D=3D DOMID_INVALID )
>>=20
>> + bd->domid =3D get_initial_domain_id();
>>=20
>> + else if ( bd->domid !=3D get_initial_domain_id() )
>>=20
>> + printk(XENLOG_WARNING
>> + "WARN: Booting without initial domid not supported.\n");
>
> Drop WARN since the log message is XENLOG_WARNING level already?

As mentioned elsewhere, the point of those prefixes are to be readable.

Though I'm starting to get urges to rewrite many of this error handlers
as asserts, on the basis that "why do we think it's ok to boot with
malformed DTBs"? A safe system that doesn't boot is more helpful than an
unsafe one that boots everything except a critical component for you to
find later on.

Cheers,
Alejandro

