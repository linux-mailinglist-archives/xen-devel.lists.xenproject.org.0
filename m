Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D57B01272
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 07:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039809.1411869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5r0-0003Ge-P3; Fri, 11 Jul 2025 04:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039809.1411869; Fri, 11 Jul 2025 04:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5r0-0003El-MS; Fri, 11 Jul 2025 04:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1039809;
 Thu, 10 Jul 2025 19:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bbf=ZX=icloud.com=alex.x.zero@srs-se1.protection.inumbo.net>)
 id 1uZwvD-0003XD-UP
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 19:27:07 +0000
Received: from outbound.st.icloud.com
 (p-east2-cluster5-host9-snip4-4.eps.apple.com [57.103.79.107])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd85071-5dc3-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 21:27:04 +0200 (CEST)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
 by outbound.st.icloud.com (Postfix) with ESMTPS id C78D71800513;
 Thu, 10 Jul 2025 19:27:00 +0000 (UTC)
Received: from [10.137.0.26] (st-asmtp-me-k8s.p00.prod.me.com [17.42.251.67])
 by outbound.st.icloud.com (Postfix) with ESMTPSA id BE4B018001B7;
 Thu, 10 Jul 2025 19:26:59 +0000 (UTC)
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
X-Inumbo-ID: dbd85071-5dc3-11f0-b894-0df219b8e170
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=QQ9aJIX8Qa1535HMOqS+IAUK2BJ699BMZLjId4jOmCI=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=dhTbJyFJ7HHT/gnYGYb/SZMOHVdLJvRx2IYPenv6ZB5vCEJkPog0cU95zdFxzXaMKBul4ruCnVZJqKjDna3CpI06qiABsRLwlswNZ6kYV7w8wgFV0vqhM9qsm+Js8LV+wNQp7uQFxjDwP42W1eBwOfH19o1tFkqiyUj+BX+1xb0UuSseBjQRYqoLv0eoKUXmrT6LFr2JnZsaVMziDI5b98tFshINj3YhQdfMkE/sM3aX0COJio7AiUtdiRXmB+9xXA1l2Qj2+YUa88jGqbSj7Tl+zhsftMFx+IKv1DUGVeflt+Z6rIZzGD87Ji4PmiJuZT7lYztdOB9Hr96HVH79oQ==
Message-ID: <b18ca2e8-148f-49df-9138-64ff9a5ac723@icloud.com>
Date: Thu, 10 Jul 2025 20:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] x86/mwait-idle: Add Meteorlake support
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
 <26e175e7-7aaa-408e-8e3e-c29a4db1591a@suse.com>
Content-Language: en-US
From: Alex Zero <alex.x.zero@icloud.com>
In-Reply-To: <26e175e7-7aaa-408e-8e3e-c29a4db1591a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE2NSBTYWx0ZWRfX3ep1vULAckTt
 YCF5OonidK9G56I2LWWHbqK5cpA3UabzKdUZPIvXJ+GcYc5JzFUdZGlt/tQwNWzBNfMDxuVtnP4
 LnCETo/rc19DJebCgU6Ef2CWZxv6HqLvNuUeTcoPz55vG98/JLwzTRfEzAXt7+ZCXly6GwgDnos
 608A0yzVE4C8UAGT3uy7xm8Q87d2pDfDt9VQ1FKWnJpkfcKDXfGavCTkxzqIhd60sW7/SNDYJTA
 1sAuHvm2vVXdARbFBY1XNWaRkbWBq1y64gr/2YC4Wsh5nUMUcxXPNG/AfHFHikxrE74oG3W2A=
X-Proofpoint-GUID: bi2Vzy3HnEiyLK9u0uiEL_EYp2SRO3HX
X-Proofpoint-ORIG-GUID: bi2Vzy3HnEiyLK9u0uiEL_EYp2SRO3HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 mlxlogscore=849 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507100165

Reviewed-by: Alex XZ Cypher Zero <me@alex0.net>

> Add intel_idle support for MeteorLake.
>
> C1 and C1E states on Meteorlake are mutually exclusive, like Alderlake
> and Raptorlake, but they have little latency difference with measureable
> power difference, so always enable "C1E promotion" bit and expose C1E
> only.
>
> Expose C6 because it has less power compared with C1E, and smaller
> latency compared with C8/C10.
>
> Ignore C8 and expose C10, because C8 does not show latency advantage
> compared with C10.
>
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git eeae55ed9c0a
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -678,6 +678,28 @@ static struct cpuidle_state __ro_after_i
>   	{}
>   };
>   
> +static const struct cpuidle_state mtl_l_cstates[] = {
> +	{
> +		.name = "C1E",
> +		.flags = MWAIT2flg(0x01),
> +		.exit_latency = 1,
> +		.target_residency = 1,
> +	},
> +	{
> +		.name = "C6",
> +		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.exit_latency = 140,
> +		.target_residency = 420,
> +	},
> +	{
> +		.name = "C10",
> +		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.exit_latency = 310,
> +		.target_residency = 930,
> +	},
> +	{}
> +};
> +
>   static const struct cpuidle_state gmt_cstates[] = {
>   	{
>   		.name = "C1",
> @@ -1117,6 +1139,10 @@ static struct idle_cpu __ro_after_init i
>   	.state_table = adl_l_cstates,
>   };
>   
> +static const struct idle_cpu idle_cpu_mtl_l = {
> +	.state_table = mtl_l_cstates,
> +};
> +
>   static const struct idle_cpu idle_cpu_gmt = {
>   	.state_table = gmt_cstates,
>   };
> @@ -1186,6 +1212,7 @@ static const struct x86_cpu_id intel_idl
>   	ICPU(ICELAKE_D,			icx),
>   	ICPU(ALDERLAKE,			adl),
>   	ICPU(ALDERLAKE_L,		adl_l),
> +	ICPU(METEORLAKE_L,		mtl_l),
>   	ICPU(ATOM_GRACEMONT,		gmt),
>   	ICPU(SAPPHIRERAPIDS_X,		spr),
>   	ICPU(EMERALDRAPIDS_X,		spr),
>

