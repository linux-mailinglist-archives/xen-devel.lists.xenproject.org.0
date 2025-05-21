Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DAABFC38
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 19:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992383.1376143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHnBU-00066Q-6l; Wed, 21 May 2025 17:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992383.1376143; Wed, 21 May 2025 17:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHnBU-00064K-3L; Wed, 21 May 2025 17:24:52 +0000
Received: by outflank-mailman (input) for mailman id 992383;
 Wed, 21 May 2025 17:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cemI=YF=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uHnBS-00064A-H4
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 17:24:50 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:200a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ddc706c-3668-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 19:24:48 +0200 (CEST)
Received: from SJ0PR05CA0063.namprd05.prod.outlook.com (2603:10b6:a03:332::8)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 17:24:40 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::3f) by SJ0PR05CA0063.outlook.office365.com
 (2603:10b6:a03:332::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Wed,
 21 May 2025 17:24:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 17:24:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 12:24:37 -0500
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
X-Inumbo-ID: 7ddc706c-3668-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+wq2OEfR0PhO2beDgDmFO6SJgDKX3khHO5enPO1PG47v0Tee31zO41Lm8fJn3nFWbXIC64OI7bJDTVtjTlJodny6sGUJpSCY0TquUkQanx/c/TTt8B4aLiReCyLcstiJe1RSNZSX72qHyRR9sOvqmpiC1LQKlpvzFf4Z2MRtwFC1UyQO1CVnVSG9UqfclZE10QoTNxlNMstqaOMoSNN6q+cIOykd83a0wTMWvBVq8wSRKSAAv0tHey8yYl9p19FCDngsXK3XCTE67Wi+QENbLyEFwGa9KWm4vLTilxi5Sf6jZ17twrxZniUvVn2tsxHshPF/PMXKC5wHQi/+e1KRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f3c3t6rUgnHBAAzqlNlPYUG+dEoJIOJHb5GRm7vK8k=;
 b=q6tFpWFklN/kvcRFI5uFpmidlsKTbk57y6ZoJbjcu+4ZmzEBLPAawz22mMSYD9aPbop2GX3S+Ikt675fREz/p9ypXQhz86c7CLnHPtG07u/zgX1Mvh9IZ9HyG/ZuVcYS7XXsvO4+YpmbLUzfbRAx3i1b4QzHbpemn5ztdERL9EhNdvA4U07LHKBK8lIFARZcYkDuGl7jeiTq8LdJgEbLUShUIgm6XztFxjuOlQiYa5DN/iSH2a60ECi3A+Jw/9sEHuRc/Vc4aoUorEwsljlSTz3X8yMNLDr+Po+Fte6/sap6nAKfUnq2MDbDH1xZHIDgo52HNmmNk3gq3Re2gjyYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f3c3t6rUgnHBAAzqlNlPYUG+dEoJIOJHb5GRm7vK8k=;
 b=GCAux34K5CpcB2Ns0Um/R64TUtEI+lUvbYDi1OzSQDBJ0JprOA3cU5C8VXF4dG3BiTMrhl/ZFbgb07YbJPZjBz9hIDewMJh8Xwj+A9cVyzudZv0h5jDYxLVcDqznrujuxpQ3gd5txMHGNdIOWwcdrYy08Ii3NS4IIJEG/7bTcNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 May 2025 19:24:36 +0200
Message-ID: <DA20I56ZKPJ4.36GD5TP5BRZM6@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>,
	Denis Mukhin <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/12] x86/hyperlaunch: initial support for
 hyperlaunch device tree
X-Mailer: aerc 0.20.1
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-4-agarciav@amd.com>
 <6f821e28-b182-4d27-b2db-e3be80910c12@suse.com>
In-Reply-To: <6f821e28-b182-4d27-b2db-e3be80910c12@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fd08aa-9522-4069-50eb-08dd988c5e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWdaeDlhTnRUd0p6TS8vTnU5U1FiUFJDZjJPNkNyeThyVlpZa3JUMHJBQUVm?=
 =?utf-8?B?U0tyVW5CUWFWbzE0SytkZ1owSk1haU5YcmpSZzBiTEJsWmxtQmRGb1g0QWJO?=
 =?utf-8?B?N0lHM0NHMTBXU29waExSbmJFUnc3YXhJSm5pZXE1WmN3cnVNcHhvUVRGTUJt?=
 =?utf-8?B?R2lZK29BUG1nZDNqUVdYVnhQRzFhaEdScmpqMzlJRnYrclgzdEo3c2JrZWRx?=
 =?utf-8?B?NXN5ZTh0M2U4aVNXVlQ1cDMrelJzY243azlaa3M5aWU2WW4yNVVDL0NvZnA3?=
 =?utf-8?B?cEpLYnJQbTRaRGR0NmVMaE9KcFQ1dkhmcE9GeVhMLzRhT3ozNk8vaEVEVitF?=
 =?utf-8?B?WlNJWUhCeC9XbHp0bUhOODZUK2RZL1JmNlNEdDV6ZUtCcDFEYlJkeEd5OUE1?=
 =?utf-8?B?ek1ONTNTK2xONUVpbEZBSDRsODhRRzZoN3g3NjBVVmNFYVY2QVZXc0JaZllY?=
 =?utf-8?B?aDJhVnZSbjRReHpxMmRoN0gyUjFXQXVJN0IvbVVWeUpTSzBGQVplTThwenlP?=
 =?utf-8?B?RG8veEhDQnpjZGIxcHp3dkxCdUREb0kwK0t5YmI3Q0tZb1dJYmJ1Y2Q4K2Fa?=
 =?utf-8?B?YkxEWk5aNm1hb2tmUkxRQjZuM0p2aDdNV3VOeXgyTzh2VmErRVNQNnoxdEd3?=
 =?utf-8?B?NXp3Kys3RDcvbUU0VkJBNndDQk1GVFpvUWdua3F2Nk82SDZHRGVVajR6YnZm?=
 =?utf-8?B?ZUF5YkZrejhBYWxMU1JUV3NmTVdNc0RSbmlIRjgvYWx5djVjNmZlUlFueU5W?=
 =?utf-8?B?QjdvbUtJWHIyNWtwajNrOVFpZmJhNzRtYVpObkZGWFBKYlhncENzRTNudy9q?=
 =?utf-8?B?MTlaM1ptUTNkT1oxZkNocG94cUJNMVNieTNCZm5pVmFneFRGaEJ4Y2M5c0lN?=
 =?utf-8?B?dkxHMzBJN1h5UHpucjJ1Ykx5Q3JVS1pzbGZJRXovUkhsUUVMQTdmUTZGU1RM?=
 =?utf-8?B?aHlwVExsOVhLZG5VYW1pQXE4N1JvUyttSUsxbE02OTJrc1h5blZhb2lXV3pL?=
 =?utf-8?B?Qnl4N2hsekRwcUZJUHlKOGlWdjEza2hmd2ZwQklHWk80aWhjQzZLRFJqcW1Y?=
 =?utf-8?B?K1MxNG4zZmlqeE54c0ZuV2ZYcGRLdjZuTWpLbVRucFVvNjFiQkkyS24zbGEr?=
 =?utf-8?B?dldSUnlaZ2hUOWk2QTFSbzB5OVpMSXhmOFFoZ2M0cXpNQ0hlTEVMbGEwU24x?=
 =?utf-8?B?cWhqNGFQQjR0WE9MSENpQVFnZm02Um1qUzJ4WTVwR1dVMldoenBmUHJDcFYr?=
 =?utf-8?B?djZ0aGR5U3ZGMjB0Y2NxYVphcERSTm8wK1ltSFRtb3M2NkNrS0FrN1MwdHBq?=
 =?utf-8?B?SVM4ek0ra2pPbE44Y0IzZlpnTlY3NVRJVE05eFltUGhadytTZ1M5UG5hTlhn?=
 =?utf-8?B?aTB1NTIyTlhkLzlGM3NHM3pqVy80eElaOW1RSTVCSDg5d3MvUzNGQXNNU3BR?=
 =?utf-8?B?eEtLaFY5L1dtMytIT2Fyc2JQR0szcklPMzR4QWNpbHBMRU0yR0RlUjZidi9r?=
 =?utf-8?B?MVpNdkJaalJxdlFTMXRUb2FvdkFtTHlTcXNmT0RIWCtkcG1mcFc3SitPankw?=
 =?utf-8?B?YWNqUHROTk9kQzFIWGNZMjJldkV1SGFpRVVrVnFiUHpqM1lHYnRQSnZCT3VT?=
 =?utf-8?B?blVOTDU5bDRtczdLN09Ec2VHbFZtb3daQU9Gd0U1L3F0YXVlakxYVis2ZHRa?=
 =?utf-8?B?SFFmZytjNnk3SnlYbzdtNzBsUW9FeFBBQVVKUjNTMGRkRjRYZHVtVHVTZUI2?=
 =?utf-8?B?Nm1hK3VUWGh2cTFNOUxhZjdxUWE3TEJvLy9kWlNOcE5nOVNZM2hUMVY4aGxD?=
 =?utf-8?B?WVpuR0hrODBoRC9mandQeEdrSU9BOGJHdjVzRE8ySDR1QWdKaUZuZU9iaXNk?=
 =?utf-8?B?bTN4WjgvM2xWSTJiSFR3dGxUbGVyTDB5dkh1TGFKdnRwTVJTMlJkTTdJdXVa?=
 =?utf-8?B?ZUlpTG50dUc1dllJb0xXeXlMMURPZDd1dXVrbFNUM3lZSmpDeWhFYXVYb1py?=
 =?utf-8?B?RkcrRkZpbDF6dFRHTnhOTFFXK3pRR1hnMjlNOGU4VTVKa0QvMjBqWG5uRlBa?=
 =?utf-8?Q?parBue?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:24:39.9919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fd08aa-9522-4069-50eb-08dd988c5e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820

On Wed May 21, 2025 at 5:00 PM CEST, Jan Beulich wrote:
> On 29.04.2025 14:36, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add the ability to detect both a formal hyperlaunch device tree or a dom=
0less
>> device tree. If the hyperlaunch device tree is found, then count the num=
ber of
>> domain entries, reporting an error if more than one is found.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>
> First: With your code re-use proposal sent earlier today I wonder how
> meaningful it is to further review this series. Much of it would change
> if that proposal was followed, I expect?

Should I follow through with that proposal, that would indeed have large
knock-on effects here. Sorry, I took longer than I thought I would
evaluating.

I'll go over your reviews and answer them in case they stay relevant
afterwards. Thanks for that.

>
> Then: When you say "hyperlaunch or dom0less" - is it entirely benign
> which of the two is found, as to further parsing? I ask because I can't
> spot anywhere that you would record which of the two (if any) was found.

Under dom0less everything is /chosen, mixed with other nodes.
Hyperlaunch mandates the initial system configuration to reside in
/chosen/hypervisor, which is meant to be "xen,hypervisor"-compatible.

The function is effectively finding a suitable root for the tree that
contains the initial system config.

>
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -13,6 +13,36 @@
>> =20
>>  #include "fdt.h"
>> =20
>> +static int __init find_hyperlaunch_node(const void *fdt)
>> +{
>> +    int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
>> +
>> +    if ( hv_node >=3D 0 )
>> +    {
>> +        /* Anything other than zero indicates no match */
>> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") =
)
>> +            return -ENODATA;
>> +
>> +        return hv_node;
>> +    }
>> +    else
>
> Please can such unnecessary (and potentially misleading) "else" be omitte=
d?

Not sure how it could be misleading, but...

> As ...
>
>> +    {
>> +        /* Look for dom0less config */
>> +        int node, chosen_node =3D fdt_path_offset(fdt, "/chosen");
>
> ... these will need to move to function scope then, one of the two may wa=
nt
> folding with "hv_node" above.

... there is indeed a more compact form the function could take. Noted.

Cheers,
Alejandro

