Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOF0HGrqBGrOQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 23:17:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543753AEC0
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 23:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308505.1579944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGxA-0001le-9i; Wed, 13 May 2026 21:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308505.1579944; Wed, 13 May 2026 21:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGxA-0001it-79; Wed, 13 May 2026 21:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1308505;
 Wed, 13 May 2026 21:17:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNGx8-0001im-UN
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 21:17:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGx7-00EUSt-TR
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 23:17:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04ea09-2eae-0a2a0a5409dd-0a2a4502be78-44
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 23:17:13 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04ea59-af86-0a2a45020019-a237832f8c9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 23:17:13 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A34754EE1D2C;
 Wed, 13 May 2026 23:17:13 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778707033;
	b=2uehh0KZQilLEJoP05q7J9zNLJbA6L/qWsnFklkG4CcZKiPo1SfZYDJ7FwLll21fwROG
	 E02XOkvvfnrefvmyC5zFs2TmZ4olu/Cl5H8mEgCOyJWN5RcB3geNOfgYqttGP2nSOeUIj
	 M2EQQMBxGS+8A0hICsOS7FIozCSWgDeBP1U+DUtG8seoEDaY23nDOexyy6jRiEiTX+s2U
	 UDx6JlcPtegCP1pyfsZd1Ls3lZ3XpyeGhjcPddqsZqFtFLPjSLoxa/VZPpTcLOTubGyD+
	 95GZUEkdwkNQZY1+jKo5aWdP9zA8D7irt0PZ04yaTdNxRuAfO+igsKyVBskCxQMv5rxqm
	 OnwLQ/SZ9PgR7QVDc+8RYD5lDxy45xLca5HnnRAG9XM6Cnntk31S7tU2OR6IVTaKUuc6I
	 yYa2rS+0TXr6/QPhEYZzJLjl1fxsWors2HFWHsziwd/lB1cSEeu9BNk96OjDfgqE0tYN6
	 T06hcgF6PVJE8j8d101htB2nXj5KON8IlbT0tioZN6CmIzK3sX7M09Opy2dfF7rAksL+b
	 7KOvHIrys/CS6DORPGQ+RcB60etz0HpcSHDhVGBVQXHBkzPNv1JNZRDsjtbb4LkWObepC
	 ghmncPoXeN3ktKfBmNtJxaAhDzHv3klKqjmZ8CIOGHu879eVZ6MYqMxfohzXNz0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778707033;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=oqMIl3ImIBNcSHSKMRhcxFJ25v5N9fxZ+6J6hCoODDo=;
	b=a7VmKZk/8+rDyVZpGZ0qtTM8qrxYwdccYgVz87RmAGPICcfjN7GEJQDh04GsJhJleqIM
	 dW77walFlT2At3F+14KTjPnSndLIXvYRZNamTmka9zKphhu075in2qzVMtNgpEXbTdyBY
	 kJhKnzZbJ5V3B2yLXwcU63lz6MwoaoNnF4GhFCdkZdMHrO/L13dgMi+qSR9mihsNzatdR
	 i5Vly00leQAS78CaLr8gd5FLJyo7ReQAIt1cxkDQtkdGuysDLtLNZ1Lcas3+bF5dJd+H4
	 KQOmOhvwfgqgzpxuwaNVzosSdy4cVy+D6ArNYheyrKEqkMHoialSiSskXw2t7qYQsy/Bk
	 a+fzLf7/kwHo3alHb7oABZZebpi7j519dUV1RlL+wq/GtPs/aBv4xOsVotXmPdIiwuuwh
	 V9huWFibMCQw1isyvGXbPchzdSMvQw83wa+O/jjKDfnDE6Wwy5PcFsDTSD4eHxlHdsLn2
	 aV+J4jbuY9xG5NWW0sHQD4z9SzqXNTqVqTjESr0xDZppEpbKiEn2HPVs8Fe0eRW96mIEo
	 kDfBlP984QVsJEKsqQqUTE9KB8niZdT1TbxZkxTbNpNmUlVKmw56NrOKoWp2Zrxc+PIAV
	 hl3MEih9xTC3hT5jkSELCEcL7Sm9TZQbNTmDvZWndF83NiR3k9UVoeRIWNmWnZo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 13 May 2026 23:17:13 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/5] x86/guest: rename a local variable
In-Reply-To: <ea005773-792a-4db8-a8d9-a88049006870@suse.com>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <ea005773-792a-4db8-a8d9-a88049006870@suse.com>
Message-ID: <010ae9668460c5a3a9705793713a976e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778707033-8316D161-F136A303/0/0
X-purgate-type: clean
X-purgate-size: 1098
X-Rspamd-Queue-Id: 1543753AEC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linkedin.com:url,suse.com:email,b.sc:url,bugseng.com:email,bugseng.com:mid,bugseng.com:url];
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
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On 2026-05-13 13:44, Jan Beulich wrote:
> ... shadowing a file scope one, thuis violating Misra C:2012 rule 5.3
> ("An identifier declared in an inner scope shall not hide an identifier
> declared in an outer scope"). No difference in generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -203,11 +203,11 @@ static void __init init_memmap(void)
> 
>  static void cf_check xen_evtchn_upcall(void)
>  {
> -    struct vcpu_info *vcpu_info = this_cpu(vcpu_info);
> +    struct vcpu_info *vi = this_cpu(vcpu_info);
>      unsigned long pending;
> 
> -    vcpu_info->evtchn_upcall_pending = 0;
> -    pending = xchg(&vcpu_info->evtchn_pending_sel, 0);
> +    vi->evtchn_upcall_pending = 0;
> +    pending = xchg(&vi->evtchn_pending_sel, 0);
> 
>      while ( pending )
>      {

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

