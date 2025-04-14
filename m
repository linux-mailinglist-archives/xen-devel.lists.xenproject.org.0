Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425DA88BB6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 20:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951178.1347290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Osa-000430-H6; Mon, 14 Apr 2025 18:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951178.1347290; Mon, 14 Apr 2025 18:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Osa-00040d-Dg; Mon, 14 Apr 2025 18:50:00 +0000
Received: by outflank-mailman (input) for mailman id 951178;
 Mon, 14 Apr 2025 18:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4OsY-00040X-A0
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:49:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2412::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fd97788-1961-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 20:49:53 +0200 (CEST)
Received: from MW4P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::18)
 by CY3PR12MB9580.namprd12.prod.outlook.com (2603:10b6:930:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 18:49:47 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::1e) by MW4P222CA0013.outlook.office365.com
 (2603:10b6:303:114::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Mon,
 14 Apr 2025 18:49:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:49:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:49:45 -0500
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
X-Inumbo-ID: 3fd97788-1961-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItHcRcSiEdV7rFxXk0VlsGAGWiIV3JAsN9aXpCOalgy6Nm3lwqX0bu+aYfV4AqujxAGy57CZ3mXtEa+BGAc0N91Lf7RQKOj2LP477nM12SC59Ns5D8m667yOWhEBh8I8L2SrShJhGTRqa46fUQC6hjlQxojo9YEMDhWU0PL9l86O3tE1V6QvvxOTLt+oDUSdspnt9I7m61+ExiXl2SuXfZQDIOh0QQXqljA39EDgQ9UMHW3iBuxNJgo9ZiKwvrUIcGA46Go6uDqVqVNGC80ly2HnIaGOJlW/OFVaY3XwXTdPp5otYZIJrEwTqzg9Z/WqxUIDSztCw2/x80ftJ6TQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0fCgidODmrtr/KHRxx3HA7jcd3zgRrqJ+P4GihRsZk=;
 b=JGLzEhsGUS3be0cQqHj5IeKmUUMb6+s+79CjsUOk63MVFGS3jKzdFNxpkwfe4G2pcs/v4vd29SVSN0LBCQAyDEPMcDPHR06MXCaAtkXlu4vNBpPfUQP0c/00lJ5pmxao5oj3zX74vyN+tPerlerobnPViI8Wk+slduJAJsnwStywejhOFAlOplqpnEdLcAaRk6yZ/Mt8haaK2evKTjLyrFKhsKEmOChkQXt6SW5Ru/LDuZdghTziqJrjk8wouhAtPlnVX2ub+hO31eHA+Sf3hlwwNdjO+le//hSTIC96opYRdiZgM7GEmiv70nqPuX5NEFdR8itC96aaCMwkeS/ToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0fCgidODmrtr/KHRxx3HA7jcd3zgRrqJ+P4GihRsZk=;
 b=sla2nOcCAdt4rMmdKX8ojfwr7fq8c75UdYHkKqGsVGJ3w5ufs8MklCeVHkNipOP70G4NEj2gbA7lHoI7hOvmEjoi7Sf/5K3UUTLNKlezlUxfLcXIyq6Fkb5i2SJCQOHOuVra4x5wKvLX97/LtrTFsA/r+CeqvBWOYgPtXDsYi+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 19:49:44 +0100
Message-ID: <D96L565G0EQ8.3UCWWVYASK6PO@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain
 config
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-15-agarciav@amd.com>
 <TxTotB0Qk4oGMxQq7xnU0hcsO0Xa-v6515dblFbD6DVV7X4ZzKsjjNfi7t0jk0Uibpwq11d7rblyA09C47qJ_r7a0t698E4kNouT-iNwOqU=@proton.me>
In-Reply-To: <TxTotB0Qk4oGMxQq7xnU0hcsO0Xa-v6515dblFbD6DVV7X4ZzKsjjNfi7t0jk0Uibpwq11d7rblyA09C47qJ_r7a0t698E4kNouT-iNwOqU=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CY3PR12MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d35bf9-d810-4e86-b6dd-08dd7b852139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzNYM0ROYk5rWFRyWmxWT1lHUWFHeG9LbWlRWkF6Vi93ZkpqSVU2ZmpEQWdM?=
 =?utf-8?B?R1ZRVlhNSFR2YUJBMW1CblVtdXJRL3owRk8wOG5Iakk0REFsRkVySmU3WGhj?=
 =?utf-8?B?eCtwMFRsRWJCWXBHZmYxSHBhMzB4QWJCUGZSWVNPUythNm1LWWtZMllIMjRF?=
 =?utf-8?B?UFJ4MjNhVVNtdCttS011akJCSkVocXhsQzAraytnNDhaR21qSmVFbGxDNmpz?=
 =?utf-8?B?clpYeFFxallIWEZRdE4zak1wNG80M21BeHRTYjFzdTZRcTdwM2pYYlNYQXQv?=
 =?utf-8?B?NGpaUnEwQ2dUeUF4QWZPTjJBK1hzN0JDZ1cwTFNpQTVzZGVUdm9UVTlpTDkv?=
 =?utf-8?B?bThIblcxSWlHb1FyUXNTZkcrSE1FbzRtU3hFTWF2eldmcXh2SEFjK3JWd2pl?=
 =?utf-8?B?a0pIYTJyMGMyQnlTME43MFUyVzA4MVZYUytKSVFSWjJSRnFzVGNyU0RhYVNj?=
 =?utf-8?B?NFRPdkxHdHQzYWY2QUQ5N1ZJek9GV1FodlNrbkxxcE5tcnpmMFFjajZkdExq?=
 =?utf-8?B?dE1RYUwwQ0VDNkZFWjdsa3BQWmFEdXJwdVdkdWwyWHhyVS9qN0NtZ2EwTWJL?=
 =?utf-8?B?eHNoSVQyaFZzSGNUVXhvditMVXFPQzh4M2VuM2U3NUxST2JKZDhVTzFYbUc1?=
 =?utf-8?B?Mm85MURNSmtReU5SRHhqMDBtMTM4L3Vkc3V1WjBTbEplYkJrUVZBZS9jVjVQ?=
 =?utf-8?B?czE2UUx5VnVwbFkybEh2UkpXcFNyNTUxRzFiR2JMcVN2cHJOY0p6cWhaM254?=
 =?utf-8?B?UVFiQ0w2WXBkbkRmb0dJWUFBOVFKNE13NE1mNDZHcnk0cGlSNnRTN0t2YlN5?=
 =?utf-8?B?ZHpPa1Z4ZmRnS3VLZzRsMnd5WmN3RDVIN0srK1NOdEJheTdsZjU4YVN5Q21L?=
 =?utf-8?B?TGt6NzdKc3pCWmFMMlJvVGx1M2c4RmEyN3YwWlBvcjJ5dVZ3ck9jTGh4Qk1L?=
 =?utf-8?B?NjMrZm1GMEZmRWdFeWlyNmxzbHdySi9qNDFTQThVdmNDMHV5Y21mUUFSVEZR?=
 =?utf-8?B?dkhzb2lVcDBGMnpKWWE4TnJ5OTZWQ2REcjlJQlR3MmxkK0YzR2s4aXpZeHI5?=
 =?utf-8?B?R3FFa3VaTXJKNHhXQjFQaEgrdWdCRHRTTlMrZEdRTlZiUDBOVjR2eWFidFZM?=
 =?utf-8?B?Mlp1eWUxZmlqdzFidXJIem9rTko0VEZPRHUvQ2ttQUo5dEMzclMvUXZrS0h5?=
 =?utf-8?B?akFheDA3ZTRhOTArajU3SlljSThFYWNHQ2ZFODRmblYvOSs5ZG9OS2haVkNH?=
 =?utf-8?B?VkdIeUsvUWtFbXAyYWlJMjlCcjFyeWFrUjBGd3RIRTNBSjk0VU9tbkFpUnBL?=
 =?utf-8?B?VlpzT1ovKy8yc3lldWtxOWQyLytibnV6UVhWU2RWT0x3WHZ0ZWlJSmJ0ZVQw?=
 =?utf-8?B?Mm9PMEZrNlY1dTU5bWtKMTd3NGlnR0VkaHlWdU81d01kM2pyUklkYzF2cFlN?=
 =?utf-8?B?SjNzSXJKMmZ5eHdpZXk0NG5nNEpzU1VQU2tlZGQyYUtycEt5QnV4c05ib0sr?=
 =?utf-8?B?a3hjd2xhVmlocXhCelBrR0pMTHI0c05ZR0Q4RzIxcC9CemFPWmNPanlIMk51?=
 =?utf-8?B?WlFuVzh5RlduaDU1NWxQRXpYYjBSUjdaaDc1QzdWaWZZdDNYczFhby8xZWxG?=
 =?utf-8?B?dDBSNHY3WkZxaFJaSXVKNlpORUFDOEI4NEFvRE1VUnVFa2hIYUxGT0MvWFR1?=
 =?utf-8?B?NUNSc0N5YW1zMHV2Q3lqNHJNQnIvNGR1Z0l1aS9tNHlJYjErWnErZkJuQms5?=
 =?utf-8?B?bUtxSnBncDQ2SnMxdnRPK3gzRjlSb1RtS3FHRmRDem1vQTBkbElZUDlCVFZi?=
 =?utf-8?B?L0xFanNEZGtrc0pnVGNkd1BXeVExZnFuZ2QxYWo3NHpzcEpHTkZTaXYwMlVC?=
 =?utf-8?B?MHN3RjRDYUZYVjdYcEVVM0RBYVk0TDMwcUI0UDdvYU5uZFJMSVVQZG9vemRa?=
 =?utf-8?B?WWp0TWYvTldaT3V0WTRFVzBzMkYyTTJCb1o0VGlwdUJtT3lGY0dJSzdXTDdB?=
 =?utf-8?B?S1FkWWMrQXFsWmRHKzVJS29rMXJpU0NzU1pTNGtIQU5VRVJRRWoxSTM3ZnQr?=
 =?utf-8?Q?7zlFyD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:49:47.2900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d35bf9-d810-4e86-b6dd-08dd7b852139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9580

On Wed Apr 9, 2025 at 11:29 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Add three properties, memory, mem-min, and mem-max, to the domain node d=
evice
>> tree parsing to define the memory allocation for a domain. All three fie=
lds are
>> expressed in kb and written as a u64 in the device tree entries.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> ---
>> xen/arch/x86/dom0_build.c | 8 ++++++
>> xen/arch/x86/domain-builder/fdt.c | 34 ++++++++++++++++++++++++++
>> xen/arch/x86/include/asm/boot-domain.h | 4 +++
>> xen/include/xen/libfdt/libfdt-xen.h | 10 ++++++++
>> 4 files changed, 56 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index 0b467fd4a4..36fb090643 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -627,6 +627,14 @@ int __init construct_dom0(const struct boot_domain =
bd)
>>=20
>> process_pending_softirqs();
>>=20
>> + / If param dom0_size was not set and HL config provided memory size */
>> + if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
>>=20
>> + dom0_size.nr_pages =3D bd->mem_pages;
>>=20
>> + if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
>>=20
>> + dom0_size.nr_pages =3D bd->min_pages;
>>=20
>> + if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>>=20
>> + dom0_size.nr_pages =3D bd->max_pages;
>>=20
>> +
>> if ( is_hvm_domain(d) )
>> rc =3D dom0_construct_pvh(bd);
>> else if ( is_pv_domain(d) )
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index da65f6a5a0..338b4838c2 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -6,6 +6,7 @@
>> #include <xen/init.h>
>>=20
>> #include <xen/lib.h>
>>=20
>> #include <xen/libfdt/libfdt.h>
>>=20
>> +#include <xen/sizes.h>
>>=20
>>=20
>> #include <asm/bootinfo.h>
>>=20
>> #include <asm/guest.h>
>>=20
>> @@ -212,6 +213,39 @@ static int __init process_domain_node(
>> else
>> printk("PV\n");
>> }
>> + else if ( strncmp(prop_name, "memory", name_len) =3D=3D 0 )
>> + {
>> + uint64_t kb;
>> + if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
>> + {
>> + printk(" failed processing memory for domain %s\n", name);
>> + return -EINVAL;
>> + }
>> + bd->mem_pages =3D PFN_DOWN(kb * SZ_1K);
>
> Perhaps use shorter form of KB(kb) (KB() from include/xen/config.h)?
>
> What do you think?

Sure.

Cheers,
Alejandro

