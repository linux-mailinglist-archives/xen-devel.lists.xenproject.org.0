Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D5A576D88
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 13:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368705.600093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCg4U-0007ax-Vh; Sat, 16 Jul 2022 11:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368705.600093; Sat, 16 Jul 2022 11:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCg4U-0007XX-Sq; Sat, 16 Jul 2022 11:34:54 +0000
Received: by outflank-mailman (input) for mailman id 368705;
 Sat, 16 Jul 2022 11:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOji=XV=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oCg4T-0007XR-CM
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 11:34:53 +0000
Received: from sonic308-33.consmr.mail.gq1.yahoo.com
 (sonic308-33.consmr.mail.gq1.yahoo.com [98.137.68.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38223925-04fb-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 13:34:16 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Sat, 16 Jul 2022 11:34:48 +0000
Received: by hermes--production-ne1-7864dcfd54-hwfdm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 624a151775341492620246c559b32b79; 
 Sat, 16 Jul 2022 11:32:46 +0000 (UTC)
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
X-Inumbo-ID: 38223925-04fb-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1657971288; bh=LEI6S1S45c0ysUsshBMGHEIFmmv3MJEhsY6+MP0Z5zs=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Aj3lS59QpKn7iZ0gu1MOr37rgo48nRFJsUSPgOf5ll1wdJegWI54r58e6bjdfzeGzt0m/e7Lcd0zi979wv7CyjMku0ttz6bSDS4tA33g7SF0t6ENkgNJ+rtIr81NNBSpJlnIQkeeiulUlgWLV//1+UlzcPdEw7YwDxzeffC8fxjTRgb0+L+5lDzUv+F9kasQA/pazxPZQTqzdpJqN31keotHeqnQlOMHeH/trlmfpMkrSQJmQlHS84l+cDH9PocyG+6dgZvLfQNESObZNT9FFRjDsaeeXSNIRxlYZrlt7/B3ViIMYvzPntiM/RNOgvXkHklrL+97pNvWQaJoZuyv/g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1657971288; bh=P+xRlcqAf7oAGWwcEzcEHvfoMpdDoaZHpquMHbj+jBb=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=pxa7gcl/n4iqc/++FiDk5cpDKdfp451G2HdLmOZINMA9OAVzDWQKEwc2Js924ahR8kyRfIg456poTplfiqC96N6cjOxOJKABHhGVoytu1NKK4DOZjuh36X/DekITU+dMfKXRJOqHk3r7Rkh68cVSUFj+YxM1Jt6KBYmfeQI5ISSNWUvLGAqhW1y2oEVkj34QX819MB3ks2nOFm2IqeS+OepWxaVQUt4Wx5WxNVqF6BVY5Gs3vtB4VLq9aSjt4NPQrPLQBPKu0LDaX61qJBw4GTwD1/yUzsd8xknW5/2BVowLJq/mWOZLoNpeqq6/Z7sAI5tL4H3qoapRDi21AukPHw==
X-YMail-OSG: 5v5_HrEVM1lgnRTJCZlWRbByKxEcIclSxi2uREnsMN7EUy9Ha3Mry9KtjmJWRfk
 umPMoBMmcW5SmJ9Wwde2GtauvclJVmOvWDLgfAfPEg7rAp_lI5ne7qPBVNFtkbwYvRYm79cfE_wM
 Riu0Z1dD6_gYLZUp.ResqetLyc_ke2K43RG3k5FX5clO1FG1_JT1gzLeT7mGqDkcT8X.IPmUD1Yf
 zUFtSel3fDPH8PvEU_j3Fuv1aGjPRgyks7PVeJGX5Oa1rZdB5aagu_OemEbrCgdSO0G7Af.jDG.j
 GvPOYNmVtVpiW5d4WkWdLhFFI950bdpoE2Ixvr_vlVaNnWCgsgi1AW2qzpk6nwuinYn4jvqHFJ0C
 LwPek_NwTQacopX3FPL6oqa0w3ilLt9tE09mXWUm9RPDj.bejGOpEhaIHvAX5h63iItRQZ.LU7cJ
 hY60lVxNP5vo3x9QjFgvEUzY4jeCpFZTu9ZpH7AyRENh3XJAtxnuooR4LOghi226S02VrBSyNS9p
 m8t0Xxvj_5_tprFmz244KkATOWr4BZwLKd5STBiMOhfwSPdRMQ7jgZAHB5807ziYggRnmK8tnZRj
 SvafG4jvYRZy3OD0rrGbe3oqMUdHlUf.FV1cIYq1xlzzpb2o_r7yLgoYTfgGpEHr8DYaAocAcYwP
 eoNqO3qNrQC.xIaSLJJJMtQmbLTZFOi.R8KPxxS3FCjbeNM9AQ2La8aHtiDf_90LjeEiNAJf0EKu
 iPVyA3Rk8WOuBJK2cDZBF_YXNUmfF26og8cQtFcfI4z8t4u8AfxY5Kq0zFfbihbBOVEVKuaorjhs
 ZAosoBYqyByYeMIJz4JT0kivrYkeb7U5IxokclSY82d33bCk94uL2elwmaVNnDfrCVJiHPv0Bfr4
 Awg1NIMgY10PUCztzFTdh_w3VFhXsTRNR5m0foUDEG2RssG3lLtqiwN5zxjDiDkQa9a65ovZo9ge
 4zuizc4Cy0nbkgzY__VEPAMFpmo8SCOnh6OurwA1ii7iuErG2ZtXvzF0vXGf2kcsaUfjiO0xeZe.
 560Mc7iXQt3cMr4LFMte8bKQ.LwYqPU2vfWiiAcvsvglvnqc4Kb6F3CVZTXf74WVbapnC1vVOqYg
 FqImS8nBRG60WWa2jW.kx2yurax.IUKxlRW7xbqxrNLKORZM5ETiQdssCOWEPKca37Z5xLzLC.6P
 NHibWL8JvoqxMIWEdLTg1zMUHSiA00qeAzYMbd9Ke6x3qQ7naDNg1QfOtiIxmRsaA9A3tPdTjgwX
 2LUMnvbLcK3Dd.iApERlr6rN12RBVhMqO0jFuv16EpbttWjCZTWQ0sZ87NTmUllsic2ki1cdAoOY
 e1ntJ0PRHH9bddEqfzRhx3SW_As4Ysva.hEQBqFBwAG.1u8OWzoUJt71fFfIcYZBgmtlJew0gGWu
 422b5LvwTKL7vczaU2oMiOzV4geeQDA7_m18x6hdh.4VQw4KtcoAhq5XjMThz3eiBQABmG1ajChR
 08CbIQaKUEYM58Iom3vBiNeJecvlvfVNaZVWq5aWMryrf9QXKSMTSTiiRMzDFefS72lNlMmYXQKJ
 UN6TBLyHDQsaF9huOo7HPV9hrK1BzPw.JOjfQxLa7q4MeCpHI0F3CYzGolvJ_usRRA0tnXF8x6TP
 vZaWyKIP9OjUJG3_GlQDa0FovYZqDrPn1VFxr.HnQuFi2vSz1htyR9JH5lJQknu2GVNzzzThPZUn
 7w9NxfVniLsE.xJS1g5yp9nWFFPnDP.TnBqJ1RTNmvwFMoKNC.NtPqbqhSdijesr4yB9ZMZd_3SM
 VCn8NGOSZ3VegcgWrHyDrHaEz8vJYd2TyfzP1Q7yaodSxmesZ2QwXfIJUY6XSYd3OvMxdI6Sjz8L
 lxaCyFU34djb7wp_o07dwUYNN7qqiyGW42roPwiKupRH9QcMSiCUM4CpMVtulsqBAUV0UOidXEot
 ofAHzUbplstQbd7x5qnKF7XHQNx7q0USrliecmrIoVk01dXSa3UKaEpKgPaNi15J9HPPWTB4LclV
 YxqSlKTgDzddz2sD1IXx8WQTagXmwC2XH55r6gmm6TyfDjBBSiYM4DOsNd7Aw.rYKy952e5trj4m
 dL64NJZ_mV8ICZZ9oU9hEiA2Pdf1SWTxAv7sKqX8ye2gUGMclPCBKOj4VQpi0o6Ri0l1FLgOE84c
 sYJJrWmrDLakLc6CnJGmcSyRSeJGW7s4Ftw9L23Kqa25wy0OoYbwUJSnz9jUntYIhtx.AwVJHChO
 ybFblTUzWbzGxnXObLfaX7yBlkG9qZA--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <7bf307c7-0b05-781b-a2a3-19b47589eb8a@netscape.net>
Date: Sat, 16 Jul 2022 07:32:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: jbeulich@suse.com, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "# 5 . 17" <stable@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20220715142549.25223-1-jgross@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <20220715142549.25223-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20407 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 7/15/2022 10:25 AM, Juergen Gross wrote:
> Today PAT can't be used without MTRR being available, unless MTRR is at
> least configured via CONFIG_MTRR and the system is running as Xen PV
> guest. In this case PAT is automatically available via the hypervisor,
> but the PAT MSR can't be modified by the kernel and MTRR is disabled.
>
> As an additional complexity the availability of PAT can't be queried
> via pat_enabled() in the Xen PV case, as the lack of MTRR will set PAT
> to be disabled. This leads to some drivers believing that not all cache
> modes are available, resulting in failures or degraded functionality.
>
> The same applies to a kernel built with no MTRR support: it won't
> allow to use the PAT MSR, even if there is no technical reason for
> that, other than setting up PAT on all cpus the same way (which is a
> requirement of the processor's cache management) is relying on some
> MTRR specific code.
>
> Fix all of that by:
>
> - moving the function needed by PAT from MTRR specific code one level
>   up
> - adding a PAT indirection layer supporting the 3 cases "no or disabled
>   PAT", "PAT under kernel control", and "PAT under Xen control"
> - removing the dependency of PAT on MTRR
>
> Juergen Gross (3):
>   x86: move some code out of arch/x86/kernel/cpu/mtrr
>   x86: add wrapper functions for mtrr functions handling also pat
>   x86: decouple pat and mtrr handling
>
>  arch/x86/include/asm/memtype.h     |  13 ++-
>  arch/x86/include/asm/mtrr.h        |  27 ++++--
>  arch/x86/include/asm/processor.h   |  10 +++
>  arch/x86/kernel/cpu/common.c       | 123 +++++++++++++++++++++++++++-
>  arch/x86/kernel/cpu/mtrr/generic.c |  90 ++------------------
>  arch/x86/kernel/cpu/mtrr/mtrr.c    |  58 ++++---------
>  arch/x86/kernel/cpu/mtrr/mtrr.h    |   1 -
>  arch/x86/kernel/setup.c            |  12 +--
>  arch/x86/kernel/smpboot.c          |   8 +-
>  arch/x86/mm/pat/memtype.c          | 127 +++++++++++++++++++++--------
>  arch/x86/power/cpu.c               |   2 +-
>  arch/x86/xen/enlighten_pv.c        |   4 +
>  12 files changed, 289 insertions(+), 186 deletions(-)
>

This patch series seems related to the regression reported
here on May 5, 2022:

https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/

I am experiencing that regression and could test this patch
on my system.

Can you confirm that with this patch series you are trying
to fix that regression?

Chuck

