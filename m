Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMd9BCngmGlkNwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:28:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6416B35E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 23:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237741.1539992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYz3-0004to-UE; Fri, 20 Feb 2026 22:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237741.1539992; Fri, 20 Feb 2026 22:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYz3-0004rq-RF; Fri, 20 Feb 2026 22:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1237741;
 Fri, 20 Feb 2026 22:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjHa=AY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vtYz2-0004rk-Qc
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 22:28:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 775d93db-0eab-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 23:28:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 0624C4EE7806;
 Fri, 20 Feb 2026 23:28:22 +0100 (CET)
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
X-Inumbo-ID: 775d93db-0eab-11f1-b164-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771626502;
	b=k2drEl+33ibwTdFLxCHf8ZfXf5FLxkevHpKPReJQAyfxttFSx11n4iRZTMzqirYwfHb0
	 wMo0Mv7iPG1Nd09Cryag94v1JyOztQ+By61oH5GW/68A/u3Zrm8jPefPUDw2d1NZCBEax
	 a/z1Dpo5K4xT3gYoqbXt/XamkaS3i389QIBIRcmEOeAx0KxYGfNwAVdRSwD0CST1oz21V
	 7An2S5HZJL5sFiuhoLR/lZ/rrlCptklDtgVwfEK6o5tJCraBct1qwLNYHRWBPS4rl5qMz
	 7J66Rr4vbebANbchqz+aiObp3Hie1mLlG7rCuJbXaXDhjiBqO1fUXX5CesJYWxINVLjxY
	 JLr8nNpWHEgR3RVaHu6qygzi/fja2g1gDKMpD2rD3GZdeVm1Q58+VO6rV4rrtgTPRH0Ck
	 5oRXiJ7KJqMHJ10afbYEQt71tKN+EY40jgrrV/e3+0ONHRoiYQN0Xstybz6OZcFFKbXgb
	 IQX6196lOXi8sh9c/NNw1cIZEAF2tVuoikFjaIQs2Gx1K0CKaLL72cTYEuFORFekX/cLt
	 wJCYMWL0YEzB/Dt5hPKUyktOKdRToWT+DKt3rFprbfPdcZON62AysLi84DFUdMA2BJTCJ
	 j5YqqtkCI6z6+K1ZFKSw0r5JX4/LY0Y4V4OEK1Qb8aY4jN3E4gtG2KxuFftDc9o=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771626502;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=zZn5QYlNeJIrV89Vh+0VBlA03d/Zh8ZaSlffBESY800=;
	b=LSsOboDPP69AEAsZ39HPOcBKbR+qfhFELXJlf+coHChJR2OJYj14ERDXfHFqh9f8BB5k
	 TllRMJrLRUvoj3jxpFA0M9/EtlkPsD5xtuZwOKcNWVahRrsqKRqYoPsR8ZurC5+Xlvji3
	 KovcsF1fxi0302erofuskgIWiSq3gjb8H3F4tWIT1y14JSlg7wfaCt/SiatLMLf9gUy0G
	 9adrJdg9HmeokrLrns/YjO1QTBfX5vbOz30tIsj/rlnkWcA1KmchsoLoqT1Lv9OwSqZsm
	 LWZTBC1Z8Kamy0mjVJNpefBAm+bNqaLHFfH/DazRvIlunqHQ2uL3jvUXgrloen9C6rTzD
	 N3rokAZ9t3X9rMfbhdRY96q1jgYkM3iLrNM/Iq2+D7czOT1sFS0kDhXAFOMVDXtGmLwO9
	 ODzIxbHFC1jw4UPVQ/lzAxDZTeZK/1oF/adqZahyMNk+kFkEn9cPQu8szHlsD+TZkDqtB
	 xwjP/nWjgr1GTQXQoPi8Iv2DwZWuQ/IRxperV6opyGOg9D6wE9cR/B1KnVNnlqT5o8/Gg
	 Kpyr5gj2lqvJzAdZm1pfvxPrHHpO7nnqVME1Jq/zidZsMiQUISkww0N0rYpTz5ojoyNTz
	 iK6Rd5n11XWoigWRMOlz3yaIjbBHOiRlNcxPZbTEfPPmy2bgokY+c1xPwbPOy90=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 23:28:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 09/12] x86/shadow: Rework write_atomic() call in
 shadow_write_entries()
In-Reply-To: <20260220214653.3497384-10-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-10-andrew.cooper3@citrix.com>
Message-ID: <a25b0b1e59431224d47d7303755900e1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 93D6416B35E
X-Rspamd-Action: no action

On 2026-02-20 22:46, Andrew Cooper wrote:
> Eclair complains of a side effect in a sizeof() expression (R13.6).
> 
> write_atomic() only evaluates each parameter once, but rewrite the 
> expression
> to less resemble entries in an obfuscation contest.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/mm/shadow/set.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/shadow/set.c 
> b/xen/arch/x86/mm/shadow/set.c
> index 8b670b6bb555..96ba2811077e 100644
> --- a/xen/arch/x86/mm/shadow/set.c
> +++ b/xen/arch/x86/mm/shadow/set.c
> @@ -62,8 +62,8 @@ shadow_write_entries(void *d, const void *s, unsigned 
> int entries, mfn_t mfn)
> 
>      ASSERT(IS_ALIGNED((unsigned long)dst, sizeof(*dst)));
> 
> -    for ( ; i < entries; i++ )
> -        write_atomic(&dst++->l1, src++->l1);
> +    for ( ; i < entries; i++, dst++, src++ )
> +        write_atomic(&dst->l1, src->l1);
> 
>      unmap_domain_page(map);
>  }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

