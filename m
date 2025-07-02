Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE48AF5C4F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031352.1405163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWz5X-00013p-1U; Wed, 02 Jul 2025 15:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031352.1405163; Wed, 02 Jul 2025 15:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWz5W-00011i-Ub; Wed, 02 Jul 2025 15:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1031352;
 Wed, 02 Jul 2025 15:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWS=ZP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWz5W-00011c-0P
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:09:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2009::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8907b6f9-5756-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:09:23 +0200 (CEST)
Received: from DS7PR03CA0351.namprd03.prod.outlook.com (2603:10b6:8:55::16) by
 PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 15:09:19 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::12) by DS7PR03CA0351.outlook.office365.com
 (2603:10b6:8:55::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:09:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 15:09:19 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:09:16 -0500
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
X-Inumbo-ID: 8907b6f9-5756-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KW4dBOCGgvw27U7uNuKxdQ5Y1UWLW/SP6PIdK7wZ9l0RJL0ElP62CBRdJHEiAMUICsOLL5SMLOwb+LFBfnsI0v3+61cZooTKsR2ZQ9gy+XmhkgoSYmWg7IT826dzbowleTIXFwFgjgpHJvhJQvAfkn6vsDrYQCSF5lFiKxB+FrbkaHCSf050GjFJKaBqlmgnJ4iw2Jq1j3xJHPlzlvgp9T85xMMQqBprQdkn/tmAFjxT9sDkBfeArVGmSmln7izEYNMD7My6jXMawj7rD4lcbRIAnbLD0whNNyX5CtnJ2LAfvnleeh9DkT4oK9r0btntiZhl9EtSRM45HbH4ZHIeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeBTMrEK3aTP+oGwoX/h0j9uIi2Xm5BPiC+m9qBqLUE=;
 b=KYj7J6gvQ3Q3Ke0RDs4IQdw/cZQ/KdskXrDDWHk1XN/z/WxUbt0xJdW51VN5zixY3StVnPYptfczgN35KoqoVJ6PGlgI11nr4JJY6wwayYGppQhgcUmxPphwvmPFOz1EK3QSEQ9cDh3MClp7sxlK1a/nGkIJzotJq9X6I1emuzVJyyujmLCZ+g4Go8bIqDlf8bkRwDn5GGDj11eMaEKTGf2ehRsDQshe5hdBn1ggrwrJkBIZ7lYDdz3VuUzNwTXbjWnuKJ2tOjm2/g7NF65bjV0uReXVXpWszgOlu7C16rR+WzzVI7TSQ9xrU/Ebz0dG3NRnMy1SkbjJzfUo9qzXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeBTMrEK3aTP+oGwoX/h0j9uIi2Xm5BPiC+m9qBqLUE=;
 b=usp5/32GSjKQr98dlQe9d/G43ii8NEduDliNN212vHLiXHKLWZjcP4IZ5FZb/njS9Zjn8WUM1Xd+yLpyuNL22I+998D4UsQBjVt/D0laYYgjwildp63kkV+Rcu35AhnIiGTw5olQ44FA6q4tx88Qb0ERhDbBV8hb2nUf9HiaF9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 2 Jul 2025 17:09:14 +0200
Message-ID: <DB1NXDYYSE3Y.1OWV3AS1TYRLA@amd.com>
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with
 the common one
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
 <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
In-Reply-To: <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a263d8a-582e-4641-f1d7-08ddb97a6b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zmp4NklHbHdrVGg2dGh1Vks0OHV6UE82d1RSMGpORUJJU2hCdGxhdVA1VTlX?=
 =?utf-8?B?T3llTENVY0NjK05lL2dGK05SVFJBWFNZMVNreXJXQkNIdXY4QjRUN2daUnJO?=
 =?utf-8?B?aXE1MU1OL2I2QWhjRnZyemlvak1CMnE3RVJZalNlZmZVMi9NaE4yVE1BU1V5?=
 =?utf-8?B?WGk4Z0lIa0RrbjVJZ0tPSlk5enBrRmt1MEoyUVhtbm4zMEhLQlQwL094dytB?=
 =?utf-8?B?eHhIM3hkOXlNbjVMdlQ2bEFrNEs4NUR0TWpmd1N5SkY5QTVkSkR4RktoU0lD?=
 =?utf-8?B?U0wzbFh6UHlGVFQ4SjFkL3NQZUcwNmtQdUd1cmtFVVdOcDA1MHNxT3JWclBy?=
 =?utf-8?B?Y3p6NGFrc282cEpQRFl4NVFtYm5BanpzOWFpK1ltaGd1dTZNVWsyV01PMzdx?=
 =?utf-8?B?VzBzRm43ZXk2bGw2V0R1ak5KcnFpRkgzUWtWSzhYWHczdGg2SzNYV25CdnFp?=
 =?utf-8?B?S21uM3R1NjhCMklsMXVzcGFNTmE2eVYydENiNEpDSDJIUEk1TmpwUUF6Wk1R?=
 =?utf-8?B?TUNyTHMwczJKeGhaZk9hOUNVaVIyUEVkVzlaWC9scEROZjgwMi9LbDQ4NTNR?=
 =?utf-8?B?TUc4dmJVOGhqOFhpUm54Wkx3N0F2b3ZnRXZGVFRPZWlKZk5hUzV6YVQxN1Nl?=
 =?utf-8?B?WGxISzljQlp6TDlLRlVrZGp3MkFsU1orcERZdHF4cFdUODNPVGE0L2NUSkh6?=
 =?utf-8?B?QmFLMXVaa21QazFxa0owU0Y5UU9tTVpNc3ZnQzJkYmdZb0R3ZXVQRSs5dTBK?=
 =?utf-8?B?UDk0MVppbE5sZmluampMM21nUE1rU3dQU3lubFozQ0pQdlpUVnFOTERmSFJ1?=
 =?utf-8?B?T0JOMDc4QjhVcEpRVGlKbVJrR1h2WFhvcVFmYms3TDdFdkNNZWNGTk52WE8w?=
 =?utf-8?B?d3J6RE1ZakdjSVNTN21TYTFFRXV3dlVjOHRVblhTcWJMZUxPV1NTUHcwMnd1?=
 =?utf-8?B?Z1dCS3Z0Y1M0bXpaOHgwRXp0Y3JaZlRCaHU1Vmkwbi9xbFVMek4zcHBRQWRI?=
 =?utf-8?B?T1pFOHdxSDBtU25uWnpxOUdwYXNPRnp3d3FjL2dlS3FtMVhiVFlpaTA1Ni9J?=
 =?utf-8?B?MUF1djlWSVVOV3NuT1NJZFFCbTRyeHdaajZsVEtocEQ0UG42R2ZxVVFMd0Y0?=
 =?utf-8?B?WVJpUXI5b0tNdDkwZ0c0TDRJR2ZUK1ZiTkhtZWFBaGZpNzVZK3didXdES1c5?=
 =?utf-8?B?OTQxZkZIYUpkMUhEcHlSVzNPNk13R2VLbzNLR0RJeXBVME1JSXQ5Qis1ZXZu?=
 =?utf-8?B?NGN5TE94aUtBZCt0S2FVY0pxSGRHL2szRG9JaGRia2JEeWVIcE41MjF5N3ho?=
 =?utf-8?B?amw4bmN0Sjd0OTEwZzBnbXVQNHNUbEM2TCtzZFRRallheGVEY3NEUzVNdnBG?=
 =?utf-8?B?VTFPdUpocU1YWGxmaTkwV0luRnVaT2NUd25OengzQTl0cHRvdDVoNFUzKzIy?=
 =?utf-8?B?UFZ1TGx1ekw3VXZiaXJsTS9HVUZlcWd5dnlWN0ZKZjBKTWVETDM5V25BRmw4?=
 =?utf-8?B?bGJpb1BTTy9zOEQ1MkgvMU5LZytnbTlwa29PYTlmSTlrUWljbUZteVNnL2xl?=
 =?utf-8?B?eFQ0SjhOT3NPQ01Wa0h2MG5nWlNldFJDZ0NNNnFBT2F0SDRZZ0Z5NEV5eDdo?=
 =?utf-8?B?SzhLRU9XUEhZSlh6Vml6K1JCTTJ0aVd6VU5YaThqS01WRjZSRUtGemxiZEFY?=
 =?utf-8?B?dlM2bjNHS3NKUllLMDdNNnYvTGVmbEdYZVZaTlNQRDdaWS9hbmxKWDlrdWIx?=
 =?utf-8?B?eHl1TjE5R2dwdVhTcWNEZzZZT0c4Sjg3MVJQYzBwQjVRWlcrNm5uZlEwaEJw?=
 =?utf-8?B?WDh3c1VLTGtRV0xlYXUxWDhFSlJzYWJBN3ZCdVFUdDBCTmhtWEczQmFZbnRh?=
 =?utf-8?B?emk0SGpLVHlsWHhjWHNaKzhRKzcxSHI3WjJJcE5zWWg4WEs1MDBQZTJsb3U1?=
 =?utf-8?B?Ym90WnVhWlBoZUl5Wm44OXpCaDRpNGU1WVZIbXJYWFpJNFlpTmZaanQxSlpM?=
 =?utf-8?B?ZlVZV2hwQWZxTjF6QUVNdDRCS1dXRjJhaS95RUhCcFczSHdmMk9Qd3ZXaWoz?=
 =?utf-8?Q?4idOid?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:09:19.0936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a263d8a-582e-4641-f1d7-08ddb97a6b2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

On Wed Jul 2, 2025 at 3:15 PM CEST, Jan Beulich wrote:
> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/include/asm/bootfdt.h
>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>> @@ -3,6 +3,12 @@
>>  #define X86_BOOTFDT_H
>> =20
>>  #include <xen/types.h>
>> +#include <public/xen.h>
>> +
>> +struct arch_boot_domain
>> +{
>> +    domid_t domid;
>> +};
>> =20
>>  struct arch_boot_module
>>  {
>>[...]
>> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> =20
>>      /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid =3D get_initial_domain_id();
>> -    d =3D domain_create(bd->domid, &dom0_cfg,
>> +    bd->arch.domid =3D get_initial_domain_id();
>> +    d =3D domain_create(bd->arch.domid, &dom0_cfg,
>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>      if ( IS_ERR(d) )
>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
>
> This being the only place where the (now) arch-specific field is used, wh=
y
> does it exist? A local variable would do? And if it's needed for
> (supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
> arch-specific? Daniel, Jason?
>
> Jan

As for the arch-agnostic side of things, arm needs some extra work to be
able to do it safely. dom0less currently constructs domains immediately aft=
er
parsing them, which is problematic for cases where some domains have the pr=
op
and others don't. The domid allocation strategy may preclude further otherw=
ise
good domains from being created just because their domid was stolen by a do=
main
that didn't actually care about which domid it got.

It'll eventually want to leave the arch-specific area, but I don't want to =
do
that work now.

Cheers,
Alejandro

