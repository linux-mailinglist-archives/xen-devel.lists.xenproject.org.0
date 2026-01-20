Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEnDJAi0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB70481CB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208759.1520907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9wK-00029I-O5; Tue, 20 Jan 2026 11:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208759.1520907; Tue, 20 Jan 2026 11:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9wK-00027H-KR; Tue, 20 Jan 2026 11:30:28 +0000
Received: by outflank-mailman (input) for mailman id 1208759;
 Tue, 20 Jan 2026 11:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfLJ=7Z=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vi9wJ-00027B-DW
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:30:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a938c0b-f5f3-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 12:30:26 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 11F784EE3C04;
 Tue, 20 Jan 2026 12:30:25 +0100 (CET)
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
X-Inumbo-ID: 6a938c0b-f5f3-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768908625;
	b=lCq4b98Mf0PertI5RkWj5GXlQfVErI68gGYMI6R7fmi1qXQB4YBi+BktvgZDzF4/Up5x
	 jqC2OvrTwwpCfg5End/WBV/YLACcD4v4n58qBs2VyGu4bMdTxKNKhiNKbivSJLVoCRFX8
	 hp5aLqz2BqxviEZQPyIDJkoilMoE7HDE7XUPoq85Wp0UDJd1ay7h9O8zfyJaXQ3BPQyGl
	 a+TpSct0Uy7oTiy0Lo5PzZzgHbR5oe9bktHc1O5m+L3U7mY9vpLbAk07VDVhnFCkWHDpw
	 sxDXX3boJYSznHnqbNlGoCAgI1yCJaakRKhDeuJZ8PsAJmu1WuR0QzqiT9AQr4Tauttuc
	 +oZxBTjs1imRPngFKdbGnRX57LC5lmc9zewWlGS3uSIAop2N4fh3swDijJoHZrldgixju
	 nIknXUfOr8zc2ZDF54vGKc1MgCLS1tNQdaA69952nh0HZ6LPI9nWndw0WMGKhguYSgMLR
	 1DQNgOcjrMDrbQR+1C/joW//o1Lz6klALdarurFuWqaLO9L0iilacqJG3P9SAgmrR6IaC
	 W67ClhpBOfgLe2yK1hIagPLGIIhK46SavTQRdHbz3zx5yTKD3Q6zd+ONMQXHxihdSfM6C
	 aHZv6FZX2Rt9hVkeLS74OqGKf8vo5oHW4chmAw6KR1Lpw/Wqple+t2SAvdpTskU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768908625;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=T0dpN5Yol5j6OhB+Xjhb7MHZC+YeHMALVWycAZpPAp8=;
	b=tTEZwiQSRNoDYee+5lQJ6IoBu0Dpe5cjFLz7wO/AhsIaxSmdW5yw5rDczLoIwNJIXEjX
	 q5XmjFz7tU9GQvr6PNKjitMyVeNd5UA03PJMQvL8TN30O71lyNWJsF/Dk2ZuMklTliRsX
	 IvXx6Hmoh7aR74jvrkMgxquvMC+aijwXL78j7KcAvXu4M3m+JuJgOyyF3zzzsHzG3glY+
	 ZcbebCwPVCOTkqL04ykvIpilWAi+D068vDDPzsivzUscXtxx+G8iH6AxikiDxdCecEale
	 5nkZjWZyQ6nnd6GBPtojLkDCeJctk4zDby9jY2OYDomCEAkqM08EQZAOWCHBWouDqPZxx
	 qo+pyeytJM3m0I1u1WUDb1p+2z3/aUIxwAUFrx3T1ZlboWlaJdhPU03RYwuYl65lvzX80
	 wMFJFnw13QUW5o2q4P8n/5rGtc7SUOFoNBXAZuhiVU5h5GNY989iVd6Bh06GvfKqAPj8D
	 bdShHpsKvEopYYVg6lAXzC3OYSQijZEqHplPsvknZR9AHhTAv1V1bbV8jMktryq6qM9xv
	 Al6qbd9TlfUhNoaFWeQ6zbz9R3uQNpPu6FlrMHOBpkKjEWjKnmkoV2kceNrZORxyo/NSD
	 ifWx+ueJXu3rM8VZE7OBQLwY7Z1cKwGLUMTkmU7zRNZ8wFGGMDuAAWjksmGS4Uo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 12:30:25 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/4] Add Kconfig option to remove microcode loading
 support
In-Reply-To: <DFTD71OIC6E9.16UX1IJAIGMWV@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <d5620135-5e91-4223-a0ba-c6876fb8702f@suse.com>
 <DFTCOGP65Q9O.3S2TVE18USSUP@amd.com>
 <5e34118f-af8b-45ca-a5e3-ba214ab101d3@suse.com>
 <DFTD71OIC6E9.16UX1IJAIGMWV@amd.com>
Message-ID: <8f1f6f61b1e397c90c74d0138f94ba8c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo,b.sc:url]
X-Rspamd-Queue-Id: 8CB70481CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 12:03, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 11:52 AM CET, Jan Beulich wrote:
>> On 20.01.2026 11:38, Alejandro Vallejo wrote:
>>> On Tue Jan 20, 2026 at 11:20 AM CET, Jan Beulich wrote:
>>>> On 20.01.2026 10:38, Alejandro Vallejo wrote:
>>>>> The only dependency here is patch 2 going in before patch 3. 
>>>>> Everything else
>>>>> can be freely rearranged.
>>>> 
>>>> Is this correct? Didn't you say (confirming what I observed 
>>>> elsewhere a little
>>>> while back) that there's a complaint when a file listed in the 
>>>> exclusions doesn't
>>>> exist anymore (which may have been cppcheck, not Eclair, but still 
>>>> breaking CI)?
>>>> IOW can patch 4 really be separate from patch 3? Or, if its 
>>>> description was to
>>>> be trusted, wouldn't it need to go ahead of what is now patch 3?
>>> 
>>> Doh, you're right, they are out of order. Patch 4 now just removes 
>>> the exclusion
>>> so it's fine to do it separately.
>> 
>> I.e. the description there saying "it's clean" is accurate, and it was 
>> excluded
>> for (effectively) no reason?
> 
> All I can say is that I looked at the report after running Eclair and 
> found no
> trace of earlycpio.c in the violations. It's not clean, but I don't 
> think it
> is as of now.
> 
> As to why it was excluded in the first place, your guess is as good as 
> mine.
> Maybe all decompressors were excluded regardless of them being clean or 
> not
> (e.g: zstd is also excluded).
> 

Well, the list was devised by AMD before even plumbing the MISRA 
checking infrastructure, so it may well be that some files in there can 
be removed because they have no violations on clean guidelines (that is 
not to say that they contain no violations at all: it may be that they 
have some additional ones in non-clean guidelines).

> Cheers,
> Alejandro

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

