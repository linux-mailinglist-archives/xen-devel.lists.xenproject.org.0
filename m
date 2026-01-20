Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJcwMTe0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15648283
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208823.1520958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAb2-0001Kj-Vp; Tue, 20 Jan 2026 12:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208823.1520958; Tue, 20 Jan 2026 12:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAb2-0001IS-T6; Tue, 20 Jan 2026 12:12:32 +0000
Received: by outflank-mailman (input) for mailman id 1208823;
 Tue, 20 Jan 2026 12:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ranb=7Z=bounce.vates.tech=bounce-md_30504962.696f712b.v1-ee886b8fb1314c1c84d06adf7cbdb819@srs-se1.protection.inumbo.net>)
 id 1viAb1-0001IM-VK
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 12:12:32 +0000
Received: from mail14.wdc04.mandrillapp.com (mail14.wdc04.mandrillapp.com
 [205.201.139.14]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49f25c09-f5f9-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 13:12:29 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail14.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4dwR636n25z8XS0yM
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 12:12:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ee886b8fb1314c1c84d06adf7cbdb819; Tue, 20 Jan 2026 12:12:27 +0000
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
X-Inumbo-ID: 49f25c09-f5f9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768911147; x=1769181147;
	bh=wKT9Fl0NmSHSWf8iFV43O6AxB+It7qf1xSBZsR0J08Q=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bcEp8tDZqHKGBdbsU3Nk3+LyRG3VUypk6MK3Cz8TpCc+6go3/pP8o4gLQU8ijO82G
	 1DndcBCk6HvxT2ekV9N8thMWpcGERpTwKhgudI6O/e/DhoKXaBQtJ91Nzr0TLSJ4Ca
	 T7/lNgx3iPXuQJVqQ3A96fxhYlyAbX0YdNVNdQudaF4Ow6TrIChy4gmXT1E+tJ9YS/
	 yeoSLR/obO3mpc00hAvcyZ91wc1r6MW76mh2fWIdFU0+r23kK6O1iS5m1dLhqFmwVK
	 7xsBa8zkQBXnH5DQ4kfVcHbMx3KfrOo1wewo985/4oMuW5f9QPVPFUcNc1EkWHTgJ9
	 uB1x2ItoKEvuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768911147; x=1769171647; i=ngoc-tu.dinh@vates.tech;
	bh=wKT9Fl0NmSHSWf8iFV43O6AxB+It7qf1xSBZsR0J08Q=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KYft1wh306YONTkIOBMbJuUOGHCPl5cY01ZvX1AERtqcaR2M2zoKvlgS+8P9ADnIg
	 q0ka1asESwLZ39U/Q1iqSCYZgcvGRpsXbe7iHQossq5VBYjdDj8k6JxezSydqRBkwH
	 WTkzWzfCcZUJnwYBLCFmSfph18I5o1cfs+NtnYu+ecWJ8xR6U36CVst/wK0dZNs0bd
	 UE7wSONRgxEKQy3gnLvH9Wjo4x/nyIfza11k6iZZTnkHEQLuuDE+CrEML2bTk0rZDh
	 o0Xd4RokN6VW33PEHRDkHO4kCkXGi6vREy4ymud07lcoprmfiStGMasSEBhPT+ABIC
	 lHW+MF+ViKPyA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768911146170
Message-Id: <cff32c5b-a085-468a-be26-a858244b228d@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech> <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com>
In-Reply-To: <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ee886b8fb1314c1c84d06adf7cbdb819?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260120:md
Date: Tue, 20 Jan 2026 12:12:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,vates.tech:dkim,vates.tech:mid,vates.tech:url,lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3A15648283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 11:35, Jan Beulich wrote:
> On 20.01.2026 10:57, Tu Dinh wrote:
>> time_offset is currently always added to wc_sec. This means that without
>> the actual value of time_offset, guests have no way of knowing what's
>> the actual host clock. Once the guest clock drifts beyond 1 second,
>> updates to the guest RTC would themselves change time_offset and make it
>> impossible to resync guest time to host time.
> 
> Despite my earlier comments this part of the description looks unchanged.
> I still don't see why host time (or in fact about any host property) should
> be exposed to guests.
> 

I've answered this question in a followup reply from November, which 
I'll reproduce here:

vRTC drift can happen for other reasons. For example, Windows can write 
to the RTC at any time; if a guest clock drift has already happened 
(e.g. after a migration), an unfortunately-timed RTC write will make it 
permanent. Windows time providers don't have the ability to control when 
Windows writes to RTC either. Thus the "real" host clock time is needed 
to help the VM adjust to the correct time.

IOW, it's the distinction between "keeping track of already correct 
time" versus "correcting wrong time by adjusting the offset"; the latter 
is what I'm looking for.

(Follow up: Here's my attempt to rewrite the description to account for 
the above)

Xen currently does not expose the host's wall clock time in shared_info. 
This means while shared_info can be used as an alternative to the 
emulated RTC, it can't be used to keep the virtual wall clock in sync. 
Expose the time_offset value in struct shared_info in order to allow 
guests to synchronize their own wall clock to that of the host.

This is needed because on Windows guests, the PV drivers don't control 
the timing of RTC updates, as this is done by the kernel itself 
periodically. If the guest's internal clock deviates from the RTC (e.g. 
after resuming from suspend), a RTC write would cause time_offset to 
deviate from the supposed value (timezone offset) and thus cause the RTC 
to become incorrect.

Provide a new feature bit XENFEAT_shared_info_time_offset for this
functionality.

>> Since there's no way to add more fields to struct shared_info, the
>> addition has to be done through struct arch_shared_info instead. Add two
>> fields in arch_shared_info representing time_offset's low and high
>> 32-bit halves.
> 
> Again, despite my earlier question, reasoning of why two halves rather than
> a (signed) 64-bit value isn't supplied here.
> 

This was also in my last email:

Both are just for easy consumption of the time offset on 32-bit guests. 
Unsigned is particularly because these are only parts of an int64_t (and 
therefore have no signedness themselves) and I prefer to let the 
conversion happen after reading the two fields.

(Follow up: Also, the alignment of int64_t differs between GCC and MSVC 
compilers. Using int64_t here would change the alignment of struct 
arch_shared_info)

>> Provide a new feature bit XENFEAT_shared_info_time_offset for this
>> functionality.
>>
>> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
>> ---
>> v2: Remove unnecessary casts.
> 
> Did you really? What about ...
> 
>> --- a/xen/common/time.c
>> +++ b/xen/common/time.c
>> @@ -118,6 +118,11 @@ void update_domain_wallclock_time(struct domain *d)
>>       shared_info(d, wc_sec_hi) = sec >> 32;
>>   #endif
>>   
>> +    shared_info(d, arch.time_offset) =
>> +        (uint32_t)d->time_offset.seconds;
>> +    shared_info(d, arch.time_offset_hi) =
>> +        (uint32_t)(d->time_offset.seconds >> 32);
> 
> ... both of these?
> 

I thought these downcasts should be explicit. I can remove these as well.

NB: A blank line in reference.size was lost when preparing the patch, 
I'll fix it in the resend

> Jan



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


