Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGX2CoLABmo2ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:43:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A354A15C
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309613.1580666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmGJ-0007QV-A7; Fri, 15 May 2026 06:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309613.1580666; Fri, 15 May 2026 06:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmGJ-0007Oq-6j; Fri, 15 May 2026 06:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1309613;
 Fri, 15 May 2026 06:43:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNmGI-0007NT-2T
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:43:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmGH-00CEa8-Em
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:43:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a06c06d-e002-0a2a0a5209dd-0a2a4506c85a-24
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:43:05 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a06be20-7371-0a2a45060019-a237832fcabc-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:33:04 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 4D9394EE3D7A;
 Fri, 15 May 2026 08:33:04 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778826784;
	b=okWlmnKyooXt5GyZzL7aaqBl1tdG/FuIPD89EaJg1D+HDFiUdHXwDTwZTju13LrHBtLc
	 qHBoWJbq+VLWG2oALOpnx6CcCNi0yoxkCOyhK/HLdCeFDk3hPblgxRq7lV0fmZwhzdzNP
	 Ayh//6zG0osCkExElQ0D0We46Lb2Myd1JwjQpnyduGSwq4lykJLnWNLpskHTps9wID3kr
	 /eesnToQD/gPf3Okepul4cobMNh2L8yrJCCfZJRE/OM40Zre0AhOyPwlAPgykdk1frkw+
	 qY/PFf+NYbSTdDGACPVT8i2SPGpbFWt23ZTmZTACRUdniMbGPYqZW56ljOXXpRYh1/tWl
	 X2yp70MKBjBhlACV2t5RKvP1itdtD1oHOkc8drYfL/oioH/DHjnRiXn3XrnXI9dB6lMaY
	 I1ZHsJ6ielp+hFS5vDhgrFyasMMrRG8qWGF13B8Mp6ptJEyKVAGwpxhkTbZa9/XpoMnta
	 ZoDxAhgROgyQkCFWB1XswRL43vgc/F/830mFuZl/Ivaob/bjMnTYaHXeERsxzjPM0FA9t
	 D2cinOaQ+lwU5BRGT+V/p3xitK9nfY35SZ3V5PcY7iZ86Tior1oT7JjhMWflAQoWfty0M
	 Be4MQfX5s+hDcPSjdUNWdsAj109hqYL9nylaMrl5fURS9iIcAIGJ42/VoCBQPvw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778826784;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=74libaaE1OF76LkVcaOCBRfEKpsiBmcVPvzkbmWj3cY=;
	b=DWrxfYmH02AZAV0PFfCkMaKI0QfJDGYbe9IjnyovZQJBulL6nsavk5kBbSlPWQXMvti2
	 R3hwUZLPXJuIUPr6yV3eI9Bz3Tb6zFo2RfRG36KQ/ZBkaKNeUxlj8J2fNbW7HqiD5FlHm
	 4CEcH+nyxIq3P4oPpgcmYbf51b1lRfxLh0+LEi73Uc0R2aPWx44YhbxtG+6ZKAAzKk2il
	 358+CxZBPnFDP4+MdOyQsp4JKgHVQ8zpaWE4afSdc8Ki+QFqEmSDuwi/IIST0hJd1EAVF
	 cI6B/NMXH2ZRsKviXwIRyJ+oY2taUGFng1a2/Hhbk7xdxjyZ8tyql2ONZ/D4Nbtmqv4ml
	 VOM2gM7DoXqtp9PqOaYAZznhWi5rqPRXznwzHppqwlS8SAptspwcJ+06Fuyv2mIXOgAzh
	 kxtulNCdSLCHGnov3IKCgH7QNtO9jXUssh9ZQX0UoMGWkNQUdD0utX8Q6vZQQzykHmBPj
	 22VtdclKXKHr4tGF5SzyLksfAy/wjB/QSDim5/Y09WN7APLJ/8SRihWbyIAn9SRMlA9s/
	 +ka/VHE6fTJSzvJUSamrzLHscrK9I384pdzfd7SaIHUnWyOOGkrQNn4Z/ojI7jEkn+7nO
	 8Ja8Z6YaGM6JM9k0iFcElmnsRNOqDNaO0e6Pqy+uUpozd/hKZmkIsnGkNkIRv+I=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 15 May 2026 08:33:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
In-Reply-To: <5dc8ae7f-3aed-4e25-b2b8-6bb0feb7f61a@suse.com>
References: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
 <36723a55f4465ab1a99041b8bb0575c4@bugseng.com>
 <5dc8ae7f-3aed-4e25-b2b8-6bb0feb7f61a@suse.com>
Message-ID: <b07793dac26e1ab526c69b3d7be0231b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778826784-8FD7AD75-B4A2ECA5/13/0
X-purgate-type: clean
X-purgate-size: 1467
X-Rspamd-Queue-Id: DC5A354A15C
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,gitlab.com:url,linkedin.com:url,bugseng.com:url,bugseng.com:mid,b.sc:url]
X-Rspamd-Action: no action

On 2026-05-15 08:28, Jan Beulich wrote:
> On 13.05.2026 22:47, Nicola Vetrini wrote:
>> On 2026-05-13 16:03, Jan Beulich wrote:
>>> ... ("Conversions shall not be performed between a pointer to an
>>> incomplete type and any other type"): Add an intermediate cat to void
>>> *.
>>> 
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
>>> (covering more than just this)
>>> 
>>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>>> @@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
>>> 
>>>  #if BITS_PER_LONG == 64
>>> 
>>> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
>>> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
>> 
>> Notwithstanding the comment from Andrew, I think a comment here could 
>> be
>> nice to explain what it going on, otherwise the double cast looks 
>> quite
>> odd.
> 
> I've added
> 
> /* Two layers of casting to cover Misra C:2012 rule 11.2. */
> 

Sounds good

>> Unrelated: why not contextually marking this rule as clean to prevent
>> regressions?
> 
> Isn't this rule (and the others my patches were targeting) marked as 
> clean
> already, hence why the allcode job fails?
> 

Oh, you are right, I didn't check.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

