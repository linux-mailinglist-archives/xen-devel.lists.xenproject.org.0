Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCWgCOjpBGrOQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 23:15:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C500253AE9A
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 23:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308500.1579936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGuq-0001FK-TM; Wed, 13 May 2026 21:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308500.1579936; Wed, 13 May 2026 21:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGuq-0001D0-QR; Wed, 13 May 2026 21:14:52 +0000
Received: by outflank-mailman (input) for mailman id 1308500;
 Wed, 13 May 2026 21:14:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNGup-0001Cs-TY
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 21:14:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGup-00EUHP-AL
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 23:14:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e96f-e002-0a2a0a5209dd-0a2a4508b6a2-42
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 23:14:51 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e9cb-63b5-0a2a45080019-a237832f9c62-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 23:14:51 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AB4994EE1D2C;
 Wed, 13 May 2026 23:14:50 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778706891;
	b=CLrKCVqiK6WnDWdEZDlJCkTOQWJgFMl5AkDPK/8DP9wyDTvzdTfuemfRjEl0HDfO/NXV
	 t9yqo/c7yWjcUuU9HlJWDTy/34A/3WxbxAMQY+igRoGoVD6D9Sx2UhNCgzm+xTNF0k3R7
	 VyoNHaZZbpGHSBBcfgw8K65jtveBDVnGdI6l1LZD+cPNi0ChuyEX66I6cMnAOWnnrgmPq
	 OmEKlqDn3Fmfy9y7swZ+BCLCxKPrKbLPesTYywurs2Yb3C0akzdY4vWRQjmmdldanjhJe
	 gGqN8QCklJV5O88LXHBWd/TdbPMYAHl2CQ8v87hSx1m1GTxcpf+FSNKAWiinP5A2Z1dj2
	 RY2/yHwk8Q7ia2uPmiEzV4chk3yief38u4n6kC51R26m/ouTWBNw6WCqy+UafqiqJ7+P0
	 IUtSTVVJxRuRpzeD/5DFUDx7/5GcVRX4tNu0ky5ll2ZeLnL8xqaAt9LtHpN/kquoJrulP
	 ShfDACX0YAVeKCpFxzIbQr0U46bEuKDm1/3zOi3B/W+CRxzIWGdxX0k75tH88BHjrGCH/
	 hLNz7VvHUpluayFGuOwGDLMvvkOOa6Sp8XAv6/o5qk7IE0VhF7jfa5WM5T2Y4ogMHl6P3
	 cHAspD/z8oT+4Z+jzwwPog4Hw11pfJO27eRUWOnR0j2iIRiPgy8TKiUaozS4NmM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778706891;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=PTvjraaklV2YyLSuhdYYWG+LojtBf4e8CWfb3/VE0nw=;
	b=jvkL24C+mMhD3da7gFmmBbC0eeQ3jx1lKWan3FUn3YdE2/ZZOvBJfuVqKytc1yI51M/T
	 M6eWcAkrQ5M5Uo2ygPAJ+S5d73olTQuGG6DcQ7qJyKgNduI76IOtF2HqynCQHFVbvl6Yx
	 r4m2wY1oCd+2uEyqjipn6tTANaIYGvhUC3PtZmHM6R8Y/LYcaMsATzoNhpwoKhiL4btx5
	 ajMG4BPqIDERUzTTCUzNYGcgsgiS16Ux1oamreNwcXG0sLxK7WdwRjU2SZ3TRdyerfblv
	 QKKCEXzgRdljrTG+sFI729HtbKPtThs6KUVbiaehSLiJb7KV0UkiR5msMAWU68qAONYJg
	 2gMMD3gdH4R5kzWcvgVrdDf5UWkQ9OTGN66eclFzRzQq557fnL5khQdG6oqSU5Y/MDQgV
	 Kuug1ted08Dke1i7aIbvf6OJ8pzvvk6D0hhSOu3NhGDkgGyvEpZ/VpU0zywG4Hl4Fa2pv
	 TQoVum7BQTe1JjXOOLYSTO1W38Rkzs/SK+5uQHkwyx7Tveyiow67BbV+/sr6tLZY6HxSE
	 N3Jb9ezc5Pb0s5dcG2ic4czfFzgZFUvOShsS4hGPzxizj1wW+omcScUYOPdTVAt0yFSAF
	 4tCc4rtwl18gJWJr0vE8iDfuAdYh3Y61fQeSyzd52LFmY0KiFNaIbHtxIFN/B64=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 13 May 2026 23:14:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86: address Misra C:2012 rule 8.4
In-Reply-To: <bc6027ad-c8e8-4586-b165-d0f730cfa63c@suse.com>
References: <bc6027ad-c8e8-4586-b165-d0f730cfa63c@suse.com>
Message-ID: <883724a4dc0899f8aafd252c3d974a3d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1778706891-BF171DB1-22F0873D/0/0
X-purgate-type: clean
X-purgate-size: 1760
X-Rspamd-Queue-Id: C500253AE9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_FIVE(0.00)[5];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[b.sc:url,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,linkedin.com:url]
X-Rspamd-Action: no action

On 2026-05-13 16:03, Jan Beulich wrote:
> ... ("A compatible declaration shall be visible when an object or 
> function
> with external linkage is defined"). Three variables lack asmlinkage
> annotations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
> (covering more than just this)
> 
> --- a/xen/arch/x86/guest/xen/pvh-boot.c
> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
> @@ -22,7 +22,7 @@
> 
>  /* Initialised in head.S, before .bss is zeroed. */
>  bool __initdata pvh_boot;
> -uint32_t __initdata pvh_start_info_pa;
> +uint32_t asmlinkage __initdata pvh_start_info_pa;
> 
>  static multiboot_info_t __initdata pvh_mbi;
>  static module_t __initdata pvh_mbi_mods[8];
> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -40,7 +40,7 @@ DEFINE_PER_CPU(struct vcpu_info *, vcpu_
>   *     0 vmcall
>   *   > 0 vmmcall
>   */
> -int8_t __initdata early_hypercall_insn = -1;
> +int8_t asmlinkage __initdata early_hypercall_insn = -1;
> 
>  /*
>   * Called once during the first hypercall to figure out which 
> instruction to
> --- a/xen/arch/x86/pv/hypercall.c
> +++ b/xen/arch/x86/pv/hypercall.c
> @@ -180,7 +180,7 @@ void pv_ring1_init_hypercall_page(void *
>      }
>  }
> 
> -void do_entry_int82(struct cpu_user_regs *regs)
> +void asmlinkage do_entry_int82(struct cpu_user_regs *regs)
>  {
>      if ( unlikely(untrusted_msi) )
>          check_for_unexpected_msi((uint8_t)regs->entry_vector);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

