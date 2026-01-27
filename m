Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNDMAS/seGkCuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 17:47:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B897EE7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 17:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215075.1525330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkmDD-0005VU-Fn; Tue, 27 Jan 2026 16:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215075.1525330; Tue, 27 Jan 2026 16:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkmDD-0005Tv-Cn; Tue, 27 Jan 2026 16:46:43 +0000
Received: by outflank-mailman (input) for mailman id 1215075;
 Tue, 27 Jan 2026 16:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZbKa=AA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vkmDB-0005Tp-V7
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 16:46:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb6a10b-fb9f-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 17:46:38 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A93C04EE77F4;
 Tue, 27 Jan 2026 17:46:37 +0100 (CET)
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
X-Inumbo-ID: bfb6a10b-fb9f-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1769532397;
	b=GZxDFUhNuh6/Tiff1Y8x+imUO6/fypfGEDJPkCLTHjKW/phEzP8slCjd/F1o1wyQ76KQ
	 2xJgPNd7Bsk7d6JNvgBNetKnfZSDirtLvSDhUJ2TSNWqL3p2TRsHFXsRlhwgdIRC9cq/L
	 iUPVN/JJrEY4LVtEb49vmBHxCU5loDr5AfzCNXTEeevBxLudJJM8/Qxhmygfjc8Hc3mSz
	 D6S1sVLDA6HdvnlIkRU41rBp0we81eAvVfM5XgtfGCYvfHJtzbmPaJywUdSuvkXOapJqc
	 dWKRCVpIxLXaSrbuzm4NIOg6MgJfqWZsCxkC3LTFQU4ZI7z2Pa+yImfr69JiamXSG9hxK
	 OFIa+fJuLUdqEwbERLv1qF8Dq7bMzSH3b34cCfue3pG8aeme4qP+XwESIPBEDIOqKdX5Y
	 wxzqGYsdAPcRhCYx3zmbqRjWxDTCUxQjVi5fWJR8nL3UdYUC3jrj7mekYM2khueBbYpx0
	 xWT2/BP1qhCRGKFxYy8tPS8NIpcOwTzkTMAbjSDyEdfGKzNDRtL+VbVmNGza8+ueSkYJg
	 /67MbSq4h8pvvCYjJLe/bWsgRuuXGjPCRxP3y97NchsZocOQ9YUKxu3/BdXo7KXZur/B6
	 xAfVx2wudMVUFmxnptMwsFd5HE6dM9RAAIAECNkj5w52u5HlJOZBuJG7Vd7BF6I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1769532397;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=/FvdYw5XUALzymw0RBAmIm90Athdi8EyO3LpUk4DhmQ=;
	b=eVXX/9I95rDhfWI8Qx9NkbjzgSdb/VKfEym8IYSZG1VCDPqsRYsWN5xoTNFDN4zWfwa2
	 X5/HCjog9cA9ryuyGRASqLSmHUYmiJgpEv38SK98Q8sfnoJL3OHTHgzzjblGiNwuBJukm
	 WWjrBBvMOSYsgZQod/cKcf4Cfp+bpafupjR/aectPP2lG4DtNjIxFEVZquzlIU5k/ekW3
	 XXINS9KHjM1DyXQZWlFNva+6FBmmBzhk6No8dV/EsHeswTl2/cSBzMjkGaS3BfFn/PevY
	 2eYT0PliHDq9GfMMzTZzzJ58ykUPFIYIFE1HFfb/UjCLtavJdEA1vgqVPU8VDzocYGkEc
	 JGF7KBB38ONdPWa+VBe85ylRyFijdUnruEvS6VYvrxU1B4UqGncfkGcJeDDzTt4+Cslnc
	 KhkuHDj72UjEkEWH/qmtGSwEzHSTKZzS9CY8+KlP8MyZfI92/kJ3FejSEACgrItzDdvCW
	 ZMGIZZoA5sK/Z8yYLP+VgxcqIFCDwirhGYom2szp1sgsDq3gBs+UB7fF0bIGrfDdIrl6n
	 QJKIR7afr+87/5wzcYMBXuu2ZieXh2Y9Fz6zKu5kJ1qJ1jHlNMEajYvFvMOUm3SJF0YWo
	 Du9rBOXJWSRNBWAICF/e7h1qDtdx0JL9dmfOm7aKQAL9cS7vlFTXPsScaWAYq+o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 17:46:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cmpxchg: Add safety for bad sizes
In-Reply-To: <99440e40-e49b-4101-9074-0be74651d3f2@suse.com>
References: <20260127102351.2215346-1-andrew.cooper3@citrix.com>
 <99440e40-e49b-4101-9074-0be74651d3f2@suse.com>
Message-ID: <4cc57348eb1d45f351f7091dc80991d3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,bugseng.com:url,bugseng.com:mid]
X-Rspamd-Queue-Id: 9B8B897EE7
X-Rspamd-Action: no action

On 2026-01-27 16:53, Jan Beulich wrote:
> On 27.01.2026 11:23, Andrew Cooper wrote:
>> @@ -66,6 +68,8 @@ static always_inline unsigned long __xchg(
>>                         : [x] "+r" (x), [ptr] "+m" (*(volatile 
>> uint64_t *)ptr)
>>                         :: "memory" );
>>          break;
>> +    default:
>> +        __bad_xchg_size();
> 
> What has come of the plans to emit an assembly error directive in such
> situations?
> 
> Also for Misra's sake "break" will be wanted.

Or mark the function noreturn for instance

> 
>> @@ -106,6 +110,8 @@ static always_inline unsigned long __cmpxchg(
>>                         : [new] "r" (new), "a" (old)
>>                         : "memory" );
>>          return prev;
>> +    default:
>> +        BUG();
>>      }
>>      return old;
>>  }
>> @@ -137,6 +143,8 @@ static always_inline unsigned long cmpxchg_local_(
>>                         : "=a" (prev), [ptr] "+m" (*(uint64_t *)ptr)
>>                         : [new] "r" (new), "a" (old) );
>>          break;
>> +    default:
>> +        BUG();
>>      }
>> 
>>      return prev;
> 
> Hmm. If for some reason hvmemul_cmpxchg() ended up hitting either of 
> these,
> we'd immediately have an XSA. Imo these want to be ASSERT_UNREACHABLE()
> with plausible recovery for release builds.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

