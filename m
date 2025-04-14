Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8769DA88BF1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951206.1347310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4P9c-0001Zh-6s; Mon, 14 Apr 2025 19:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951206.1347310; Mon, 14 Apr 2025 19:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4P9c-0001Wh-3h; Mon, 14 Apr 2025 19:07:36 +0000
Received: by outflank-mailman (input) for mailman id 951206;
 Mon, 14 Apr 2025 19:07:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4P9b-0001Wb-Bj
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:07:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2416::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6e9eeaf-1963-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 21:07:32 +0200 (CEST)
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 19:07:26 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::ed) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 19:07:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 19:07:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 14:07:23 -0500
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
X-Inumbo-ID: b6e9eeaf-1963-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDVTBaYCCEK5ZhlJptVTodBsPTNo3iDIR7pVjbj0MivTIX2hoIbvOnaU9ODhRNMQbLKhY61X9VsR/6zTYLEcXT5ZPqG/SFKIo+x3ew7g58LiP6vRk/2GPIvwZxqXCNTVDARJJFWoICoUq64sDDVR5ma2FcbSup7hfVcnUiM5DAK0M1vJMo4IRieN+hSm+I4DHmayWp1TGDjm7J5X0DmfY9SbOgY0UuZh7m9iwv8Jf6XfOJ7piLw6useR7W6DiIvXzgBo4oJ91XayoW6eEDuL17hPTAb9dm7LRpbGRmLqP9bGR0UINzjf2Ml450G4N0VlZjr/aJFKxMOB5wJj2Zkayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyCsLHQFCpBibuXbJ1peHhzdWTdryealwUTECrri2Wk=;
 b=MX3l7BC11lk9VIWjTRtMg2PmFFIGiWHhp5Oknwk79jRJl6ciXEtdEMBayo0heLHVCn3uT6cLb5eBnCEGZ3uRmP1lqDTmAlE2YdvTPpBdln8Y9eES3I6VHgEz9fZZNPMMidFWDbP5ILjVkqDxh9UnREAADzdbpe9mh2/6BYoSkzpvp+1dwIXP4UJ1UXU1G84qfgfbBA3hKy1cPoZ/i6uh6YaDaeQ3cxWgvKNvY4y097sjFb0+63uigT0Nf8/qLfKl9MlIC+ApjNYk3MT/uJEkNhUF3+XzCe8BaBsZvgPpCT9jjjgJKQopIrQ4i72F/NyNGW9jQ4lanCF1fLvgXnOGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyCsLHQFCpBibuXbJ1peHhzdWTdryealwUTECrri2Wk=;
 b=uW5iJEkXAXeUzbxLpcVSyB83S8nDwjPnZZNfKkpteRKETODGTLjVhObkKj10wk6Zx7VqhE/71eB8hwtkQg5SU8MpuAA9D7SstyV/7za7avE/UGuKRk7s1ehe3kmTv+VM/k28zMbrhFupPIZ15ChBZE7n69jM+85P0NztkomfZ3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 20:07:22 +0100
Message-ID: <D96LIOHGXKWM.3QKLDSITTYZKX@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-16-agarciav@amd.com>
 <TdrpNKrM0AYES6ERgO3fA6Z3f2DZeLdzMe63W1n0cQ7jfW5vTDUSWqENVVDcP6gbncwd3M07DSWjiYeU3mK2JG53eehLldAT9mz5m3bChY8=@proton.me>
In-Reply-To: <TdrpNKrM0AYES6ERgO3fA6Z3f2DZeLdzMe63W1n0cQ7jfW5vTDUSWqENVVDcP6gbncwd3M07DSWjiYeU3mK2JG53eehLldAT9mz5m3bChY8=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: faf8c463-7568-4809-4453-08dd7b879807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjdSQUtoamkzaXg2YmNUekZnQldLQUNYenZRbnI0QjdBRldnaCtORHlJZFlo?=
 =?utf-8?B?aWREbGZWRWdVaGtRUCtHYlhrK3ZLYXVZNklqK0p2bEh0MXZVNkZJczhuQzlu?=
 =?utf-8?B?MmErSWhWRjk0eHpJcWJLK29FeDVqZGlxMmlKWEx0aWZ6QllrdDA0VTRzd2xP?=
 =?utf-8?B?alFjVEZsUWI5eU1ualNqbmxrVlhYVFZseDNWRlFJMVFyRWI4cGJmMFc0WHcy?=
 =?utf-8?B?YWlBMDRDVFZtckNtRXBPdDFQK0c3ZVFwNkdCbWdJdlBtRWJnY1lmc2hvbjFF?=
 =?utf-8?B?UWM4V0RWVDVGdXpmK2FrKzVFVmI5VHF0STA4MDFscXVOTlBnRGNoWHBxZWxv?=
 =?utf-8?B?ZVZhVjNiK1NZQk15NVM2TGJHMkhRTFc0cVlWUlRPcWpXVDczaFR2YldOcG9U?=
 =?utf-8?B?a1A0OTNFd0NTZGw5TE9ZWmwvZ3JSU0ZHNDd4TFZxTWFhM0hrUW1KeWREbWhP?=
 =?utf-8?B?aEtNQ2czKzZGL2xETkE5WjZ4T28wNzRUQVRKMFljL2o3bU93UzNRT2dFODF4?=
 =?utf-8?B?ME9tQllUTzZBVy92QmpLemQ0bjBRQXhtbWc3d3BhdmlhWXoxN01BWElnMlNH?=
 =?utf-8?B?TG93MGFSWFVnQW8rbW5rR1BPT2tidHBKUkdlVEhsaDVzdXNSS1kyZmVCbkFV?=
 =?utf-8?B?K1VpOXFzMzM4V0RaQStGUW4rcnpVZ1ErYlpsTnRYbGtsdkRHWmE3Z0xZdU5k?=
 =?utf-8?B?eHhsVE92U3dBaldlbzhDeHpUQjJIREw0aVhuYk4wK1ZsZURXZXkwZ2VENXVv?=
 =?utf-8?B?VkZlanB0a1ZHTy9GUUdOVEVEWldQTG9pQldzM2NvOWhrbXNZVFYwaEN6RSs2?=
 =?utf-8?B?emliL3RpKy9ZSVM1dVpPb3MvZTA3S1VYMytuamJxakJubk1QS2Q1ZHpINGRn?=
 =?utf-8?B?aVdvMldqR2VVZlp1M2VKd2loZklBa09xaUcyVVIwaUJPSEtMKzU3aTNrYWJv?=
 =?utf-8?B?OVRmTVd6MlhPSjQvR1FLZGdtK3NxL2d0K0U2eGZEK2lxTEpPclFTWEZES3FN?=
 =?utf-8?B?MXNDcjhJeUxVb3ZiQmEycExTUXJwdUMzaU5ET05jbmZmWmVvKzN6UlJDS0hG?=
 =?utf-8?B?TGxlRUxNL3JrY01QTGswTldmbXlsVzdhT0pyVUREY1QrbUltbThMRGx6MjZC?=
 =?utf-8?B?bk9EL3NQSW55b0U3aHllTTN1RUpDTHg5bDQ0S2pMMjBieE4zdE9VUHp2Z1BH?=
 =?utf-8?B?RURSclh6azlLSXh1S2puL2xzRnR6NlU5Y2xiM1JOb09YY0locUxodFc0ZzNj?=
 =?utf-8?B?VGlXdlpOMkJvVzNNSlNGYmxaN3lycUNhRnR4allFSWZDL2g3dmVxM0lJeUhG?=
 =?utf-8?B?SkJVNkFvamV6QmNaUHpvdnJ5UVZEMlJZUEcyQm1DQSt4d251WCtMN3l5VnZ0?=
 =?utf-8?B?OUpuOTE3QUZFNndUNVVaRWY4NURtWXVMTjNyc09mTDdkWWtWMzVrNm1lMDdi?=
 =?utf-8?B?YkFOZkJ6aVVqU0NOb2gvSGVtQ0lReFVzR2xnYmdERUN0aERIMDJKWkdicjFl?=
 =?utf-8?B?NHRSQmJ1enlUc2NXbjN4N0xLWGlrVmp1RnJRUG5BRE9TZ2F4dHkyV2MrOS9F?=
 =?utf-8?B?ZnpoYWU2OVIyQzdQR2s4YXVxQmVxeEZKK0taZHM4L0ljLzRKSTZrUE00WUR3?=
 =?utf-8?B?NjhwbVJKN1FsOE9VWFRvMnplaWxZSGhJMzJGZ1kzMEZDazI0Nm5IUUEzb3li?=
 =?utf-8?B?RFVFWkZad2VNSUxnM0FRalF5ZWdqVGFjNWZ2WW1rKzlZdmd6VHBXMC92Zi90?=
 =?utf-8?B?QmlKa1lxZEVRajdOSDE0NTdCNkVPZ0sxUTRieVUwdGZyZ0lEMi9FczBqUVJD?=
 =?utf-8?B?bHE5WEcxdFh4aFRNWUROazRNOHdwcDExZGdyc2RDYk9NQm1RK2tIQklPbGNQ?=
 =?utf-8?B?TkhpR1EvY1gvU1owZ1BoaFd6d2RTLzZQSEhqVE9pR21KRUhTMlowcFJSOUMw?=
 =?utf-8?B?bU41cEh5RnhJbmc2L1hBcTVicmNaMllBNGRPZXJITHhOZkZvbzBRdWlIYUxt?=
 =?utf-8?B?SXk0Ky9ISk96MW5LR1lnVnArVmRzU1c3VGNzcWtJK3Y3aGhjTEVkYzY1MmZX?=
 =?utf-8?Q?hmdEu1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:07:25.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf8c463-7568-4809-4453-08dd7b879807
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158

On Wed Apr 9, 2025 at 11:33 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Introduce the `cpus` property, named as such for dom0less compatibility,=
 that
>> represents the maximum number of vpcus to allocate for a domain. In the =
device
>> tree, it will be encoded as a u32 value.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> ---
>> xen/arch/x86/dom0_build.c | 3 +++
>> xen/arch/x86/domain-builder/fdt.c | 11 +++++++++++
>> xen/arch/x86/include/asm/boot-domain.h | 2 ++
>> 3 files changed, 16 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index 36fb090643..7b3e31a08f 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -635,6 +635,9 @@ int __init construct_dom0(const struct boot_domain *=
bd)
>> if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>>=20
>> dom0_size.nr_pages =3D bd->max_pages;
>>=20
>>=20
>> + if ( opt_dom0_max_vcpus_max =3D=3D UINT_MAX && bd->max_vcpus )
>>=20
>> + opt_dom0_max_vcpus_max =3D bd->max_vcpus;
>>=20
>> +
>> if ( is_hvm_domain(d) )
>> rc =3D dom0_construct_pvh(bd);
>> else if ( is_pv_domain(d) )
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index 338b4838c2..5fcb767bdd 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -246,6 +246,17 @@ static int __init process_domain_node(
>> bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
>>=20
>> printk(" max memory: %ld kb\n", kb);
>> }
>> + else if ( strncmp(prop_name, "cpus", name_len) =3D=3D 0 )
>> + {
>> + uint32_t val =3D UINT_MAX;
>> + if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
>> + {
>> + printk(" failed processing max_vcpus for domain %s\n", name);
>
> Suggest adding XENLOG_ERR to the error message.

And XENLOG_INFO to the one below.

Ack.

Cheers,
Alejandro

