Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIRbMMCkDWqh0wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:10:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234458D5AB
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313894.1583921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfkh-00011x-TD; Wed, 20 May 2026 12:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313894.1583921; Wed, 20 May 2026 12:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfkh-00010G-QP; Wed, 20 May 2026 12:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1313894;
 Wed, 20 May 2026 12:10:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wPfkf-00010A-TO
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:10:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPfkf-003uYJ-9I
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:10:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0da4a7-e002-0a2a0a5209dd-0a2a4503c090-8
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:10:17 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0da4a8-672d-0a2a45030019-a237832f98d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:10:17 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id CA5FA4EE3D8A;
 Wed, 20 May 2026 14:10:16 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779279016;
	b=PLrzmc2lj7NVUmyrrcg9kaBeqW0wQ+mFeIRwOMCvSWzPF+OqwnoXGGx8+0SD5D7WzJ/Y
	 S860M7E/ux9DN5oOZzkRjutspA0TPqdTwVIY05HaGN6gBfrNsNbR5uj1sxUOxcN+300Xe
	 wwEiLvxJkeRMfip5NW+kH4lNwgLuEQVGxJAT7aIK4A7mEpReqUGYfmaolt3cDRWcc+RWN
	 VSviPKY2GkN5CEnkSsjjmXuMs14nMw8Fxk9HT9LWSQxVtRGG3Xdi6ufMav/skXmilLNVQ
	 ALhs5ucNVBqx4w9+CNjtVhw0YLK6tQOfTAaWap0MtbDH2GXBrz4LDI4kGLxXB9laH24pd
	 kaAzPbDfVCG+ow5PO5rWhGuJ6YQhLBZ94WzIFYuLAXeBbr7/jKLCNzaMaWwAbwNjS5tlO
	 oXygfFAeJXZnQgG1esAtnCEkKDnV4q9mp1jkU1HlALyBCIOw1/yEyr2wg1QjP3yav7e1a
	 0GoxlLVxDXgoEwvegbTmHEco6qjctgZHE0mLUoofvlWAA9WswwxKvkmY/eY1no0QynuZj
	 zuBcVjCSzpBLkXRkIDhaQE1dBuCc8U/yPAlUM6LC1thzIg4IJ3TR9/9f4kRcMVxjA0HiT
	 LHsJLR7R1tRUKR0EQHco9qlsPPQduQl1nsgAu88iVXbGfDMzqC3/+wGURapLoho=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779279016;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=g90j5HQfthglz82uSMzTSHjm3mEZ1dFfuSF71ADKbvs=;
	b=jCvbd7nrV83Tep8exxO+36AvQDH6X8DVXQ9FfSuFZB/yIYhRYnUt6I6ZF1akQq9X8Jxx
	 3LBW0fhKuJiPTiyacSb6ff2urwrtB5jnDqQR6l+9c4FCasfKcB2eMcRBQfR+lMnNBwjUb
	 5bv5rDjRQ5uUPQSGoHkKR8SPOYTXxbT6hDP8/OfPKhlodxwzqxy7n8yl9x/TZdSH0PU4E
	 Ns/8urZihsPrMtwIhNm/p7FA4yISkz6K/VDU15a/H79vwAH/nh/y4x40zSeijklpnQxQN
	 xv3fxAYEhGks+ej5QtAPiqfW/KOwICYFuV0LxBDbs/nWz7TnP3ASwj/wsUW9GNRmhWCnb
	 R40d7D3XNWwm8EyM5aE1cAHKQAyN14cvuNO5zitHPRb17jqOb9q8sTSfOqxu9oUludMNk
	 ofYuO8myz3l2PwZuyXQvPhdttDZ76GmkppMh/LrskLNh2x2EYwxA5MlMXYdifcl0pgiQT
	 2cSrpMVqxmhSsxrNlz8gbwsyzbupAumxM7e+iGR6blGAhu1VESt7tIeA+ULtNEjz3ljlx
	 FfvBUDXkFJ+xCj3Vsr/0YW51o2umTUhxkXMRefViG19ikG9mNhNfvCcwe/6S4zEv/Ntj5
	 hkndJmviHlezjzYD83cvbMYopOrqj14bz4qX0wtN416lVjiptltSvjRcGNi4RZM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 20 May 2026 14:10:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: disable debug info for analysis jobs
In-Reply-To: <4f3a0cf9-63cf-405a-a19c-c8fc0473b2ce@suse.com>
References: <4f3a0cf9-63cf-405a-a19c-c8fc0473b2ce@suse.com>
Message-ID: <6ed5a037c10e2b896e1269c6856508f5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779279017-39D7B938-963510D8/0/0
X-purgate-type: clean
X-purgate-size: 2119
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:email,linkedin.com:url]
X-Rspamd-Queue-Id: 6234458D5AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-20 10:20, Jan Beulich wrote:
> Its generating and linking takes time (and space), while at the same 
> time
> Eclair should be entirely independent of its presence.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Sadly the setting of EXTRA_XEN_CONFIG doesn't look to be cumulative
> (across "extends:"), so the addition needs making to all four eclair-*
> jobs.
> 

Maybe with anchors and variable expansion it could be made to work, 
having a base template EXTRA_XEN_CONFIG and then adding variables as 
needed, but let's not complicate this unless needed. Indeed ECLAIR is 
not affected by stripping flags currently (though I don't exclude it may 
in the future).

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2539557855
> 
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -47,6 +47,7 @@ eclair-x86_64-allcode:
>      RULESET: "monitored"
>      EXTRA_XEN_CONFIG: |
>        CONFIG_ARGO=y
> +      CONFIG_DEBUG_INFO=n
>        CONFIG_DEBUG_LOCK_PROFILE=y
>        CONFIG_DEBUG_TRACE=y
>        CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
> @@ -105,6 +106,7 @@ eclair-x86_64-amd:
>        CONFIG_INTEL_IOMMU=n
>        CONFIG_EXPERT=y
>        CONFIG_DEBUG=y
> +      CONFIG_DEBUG_INFO=n
>        CONFIG_GDBSX=n
>        CONFIG_FRAME_POINTER=n
>        CONFIG_SELF_TESTS=n
> @@ -129,6 +131,7 @@ eclair-ARM64-allcode:
>        CONFIG_ARM64_SVE=y
>        CONFIG_ARM_SMMU_V3=y
>        CONFIG_BOOT_TIME_CPUPOOLS=y
> +      CONFIG_DEBUG_INFO=n
>        CONFIG_DEBUG_LOCK_PROFILE=y
>        CONFIG_DEBUG_TRACE=y
>        CONFIG_DEVICE_TREE_DEBUG=y
> @@ -206,6 +209,7 @@ eclair-ARM64-amd:
>        CONFIG_ARM_SMMU_V3=y
>        CONFIG_EXPERT=y
>        CONFIG_DEBUG=y
> +      CONFIG_DEBUG_INFO=n
>        CONFIG_FRAME_POINTER=n
>        CONFIG_SELF_TESTS=n
>        CONFIG_DEBUG_LOCKS=n

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

