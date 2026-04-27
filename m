Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBIkIGmp72kCDwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:22:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D924D47878C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295218.1571903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHQaG-0005cF-Uj; Mon, 27 Apr 2026 18:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295218.1571903; Mon, 27 Apr 2026 18:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHQaG-0005Zh-RO; Mon, 27 Apr 2026 18:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1295218;
 Mon, 27 Apr 2026 18:21:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1wHQaG-0005Zb-1i
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:21:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHQaE-00DKp2-OU
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 20:21:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69efa912-2eae-0a2a0a5409dd-0a2a4509a59e-40
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 20:21:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <chleroy@kernel.org>)
 id 69efa924-2497-0a2a45090019-aceafc1fc93a-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 20:21:26 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 46E9540246;
 Mon, 27 Apr 2026 18:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCCFC2BCB5;
 Mon, 27 Apr 2026 18:20:40 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777314053;
	bh=fSfdZ5/fBIJBn92+lTQ8RknrFiSruKk4Zm5FPbyuhQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2scZpbKenpOejPaCkxdr8Fr6c4RornKyxLjF0dKFYhSlw+matCdj3SDWlLeqEo9E
	 a373XI9Iold2YwxLkAFI1OVkbxbR9JLgxu/comiCZJeBJjQK8IiPFbF3a0OQIu5zFJ
	 z32D8XDVz5Fo00XfpR09lc3WO+fPx7ont3FOA+TL4jxGM7w1J5Z2cHWcv2Vi05coRU
	 6lIPjD/Eh4XtMiOh4PUlJfQ+hbcnF50oIaF0Y5is14Jb9Uy7pNbq6e4WVWxwPn3QZF
	 F5175xYuXBtUSK+HvgeuPZTDTXog5e6524IUP62vgqpWl/U/vR5Pqvo+DbOYeGkne+
	 cSOzK+yVIhXWw==
Message-ID: <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org>
Date: Mon, 27 Apr 2026 20:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-x25@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-arch@vger.kernel.org
References: <cover.1777306795.git.chleroy@kernel.org>
 <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <ae-j2_QirCySZD02@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777314086-408AFA53-AF96D79F/0/0
X-purgate-type: clean
X-purgate-size: 3340
X-Rspamd-Queue-Id: D924D47878C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.kernel.org,m:ocfs2-deve
 l@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



Le 27/04/2026 à 19:58, Yury Norov a écrit :
> On Mon, Apr 27, 2026 at 07:13:48PM +0200, Christophe Leroy (CS GROUP) wrote:
>> At the time being, x86 and arm64 are missing unsafe_copy_from_user().
> 
> No, they don't. They (should) rely on a generic implementation from
> linux/uaccess.h, like every other arch, except for  PPC and RISCV.
> 
> But they #define arch_unsafe_get_user, and the unsafe_copy_from_user()
> becomes undefined conditionally on that.
> 
> So please, fix that bug instead of introducing another arch flavor.
> We'd always choose generic version, unless there's strong evidence
> that arch one is better.

But they both implement the exact same unsafe_copy_to_user(). What is 
the difference here ?

Should that function become generic too ?

Christophe

> 
> 
> Thanks,
> Yury
>   
>> Add it.
>>
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
>>   arch/x86/include/asm/uaccess.h | 29 ++++++++++++++++++++++++-----
>>   1 file changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
>> index 3a0dd3c2b233..10c458ffa399 100644
>> --- a/arch/x86/include/asm/uaccess.h
>> +++ b/arch/x86/include/asm/uaccess.h
>> @@ -598,7 +598,7 @@ _label:									\
>>    * We want the unsafe accessors to always be inlined and use
>>    * the error labels - thus the macro games.
>>    */
>> -#define unsafe_copy_loop(dst, src, len, type, label)				\
>> +#define unsafe_put_loop(dst, src, len, type, label)				\
>>   	while (len >= sizeof(type)) {						\
>>   		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
>>   		dst += sizeof(type);						\
>> @@ -611,10 +611,29 @@ do {									\
>>   	char __user *__ucu_dst = (_dst);				\
>>   	const char *__ucu_src = (_src);					\
>>   	size_t __ucu_len = (_len);					\
>> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
>> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
>> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
>> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
>> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
>> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
>> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
>> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
>> +} while (0)
>> +
>> +#define unsafe_get_loop(dst, src, len, type, label)				\
>> +	while (len >= sizeof(type)) {						\
>> +		unsafe_get_user(*(type __user *)(src),(type *)(dst),label);	\
>> +		dst += sizeof(type);						\
>> +		src += sizeof(type);						\
>> +		len -= sizeof(type);						\
>> +	}
>> +
>> +#define unsafe_copy_from_user(_dst,_src,_len,label)			\
>> +do {									\
>> +	char *__ucu_dst = (_dst);					\
>> +	const char __user *__ucu_src = (_src);				\
>> +	size_t __ucu_len = (_len);					\
>> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
>> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
>> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
>> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
>>   } while (0)
>>   
>>   #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>> -- 
>> 2.49.0
>>


