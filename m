Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080959D17B0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 19:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839456.1255262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6Bi-0000ib-I2; Mon, 18 Nov 2024 18:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839456.1255262; Mon, 18 Nov 2024 18:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6Bi-0000fP-EB; Mon, 18 Nov 2024 18:09:26 +0000
Received: by outflank-mailman (input) for mailman id 839456;
 Mon, 18 Nov 2024 18:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Qym=SN=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tD6Bg-0000XQ-FJ
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 18:09:24 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3c5f3185-a5d8-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 19:09:22 +0100 (CET)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id B3D1220BEBD0;
 Mon, 18 Nov 2024 10:09:17 -0800 (PST)
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
X-Inumbo-ID: 3c5f3185-a5d8-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzLjc3LjE1NC4xODIiLCJoZWxvIjoibGludXgubWljcm9zb2Z0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjNjNWYzMTg1LWE1ZDgtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTUzMzYyLjM2NTc1NCwic2VuZGVyIjoiZWFoYXJpaGFAbGludXgubWljcm9zb2Z0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B3D1220BEBD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731953360;
	bh=wR2vAxb4KjC7bChWhYgHEm7VYOkoUSKJ2zrGmmUQgeU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=QcXvfQn32bbEJk/CliGqPjJlSoPmzpqy39Cb7yWbUp/UMAorBMUaWUr/NKZ9e69DC
	 EuA6BiEwniO9Hz9jAZdoaPATG/Z4etAtwQMMCiIdSJ0wltRFnatVskzJPAClKWSWJ2
	 IoOFaRlq/Uc2MlJVJm0M77F7OwMbRuycEwh39LjI=
Message-ID: <52cc0733-49fc-4452-99c6-8c18bf20dde7@linux.microsoft.com>
Date: Mon, 18 Nov 2024 10:09:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, James.Bottomley@HansenPartnership.com,
 Julia.Lawall@inria.fr, agordeev@linux.ibm.com, airlied@gmail.com,
 akpm@linux-foundation.org, andrew+netdev@lunn.ch, anna-maria@linutronix.de,
 ath11k@lists.infradead.org, axboe@kernel.dk,
 bcm-kernel-feedback-list@broadcom.com, borntraeger@linux.ibm.com,
 catalin.marinas@arm.com, ceph-devel@vger.kernel.org,
 christian.gmeiner@gmail.com, christophe.leroy@csgroup.eu, cocci@inria.fr,
 coreteam@netfilter.org, daniel@zonque.org, davem@davemloft.net,
 dick.kennedy@broadcom.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, etnaviv@lists.freedesktop.org,
 florian.fainelli@broadcom.com, gor@linux.ibm.com,
 gregkh@linuxfoundation.org, haojian.zhuang@gmail.com, hca@linux.ibm.com,
 horms@kernel.org, idryomov@gmail.com, intel-xe@lists.freedesktop.org,
 james.smart@broadcom.com, jeroendb@google.com, jikos@kernel.org,
 jinpu.wang@cloud.ionos.com, jjohnson@kernel.org, joe.lawrence@redhat.com,
 johan.hedberg@gmail.com, jpoimboe@kernel.org, kadlec@netfilter.org,
 kuba@kernel.org, kvalo@kernel.org, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-rpi-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org,
 live-patching@vger.kernel.org, louis.peens@corigine.com,
 lucas.demarchi@intel.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, maddy@linux.ibm.com, marcel@holtmann.org,
 martin.petersen@oracle.com, mbenes@suse.cz, mpe@ellerman.id.au,
 mripard@kernel.org, naveen@kernel.org, netdev@vger.kernel.org,
 netfilter-devel@vger.kernel.org, nicolas.palix@imag.fr, npiggin@gmail.com,
 obitton@habana.ai, ogabbay@kernel.org, oss-drivers@corigine.com,
 pabeni@redhat.com, pablo@netfilter.org, perex@perex.cz,
 pkaligineedi@google.com, pmladek@suse.com, rjui@broadcom.com,
 robert.jarzmik@free.fr, rodrigo.vivi@intel.com, roger.pau@citrix.com,
 sbranden@broadcom.com, shailend@google.com, simona@ffwll.ch,
 svens@linux.ibm.com, thomas.hellstrom@linux.intel.com, tiwai@suse.com,
 tzimmermann@suse.de, xen-devel@lists.xenproject.org, xiubli@redhat.com
Subject: Re: [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies script
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
 <20241116060541.5798-1-christophe.jaillet@wanadoo.fr>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20241116060541.5798-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/15/2024 10:05 PM, Christophe JAILLET wrote:
> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
>> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
>>   scripts/coccinelle/misc/secs_to_jiffies.cocci | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..af762b1c0aac8f044f21150bfaafd9efc834ee87
>> --- /dev/null
>> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +///
>> +/// Find usages of:
>> +/// - msecs_to_jiffies(value*1000)
>> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
>> +///
>> +// Confidence: High
>> +// Copyright: (C) 2024 Easwar Hariharan Microsoft
>> +//
>> +// Keywords: secs, seconds, jiffies
>> +//
>> +
>> +@@ constant C; @@
>> +
>> +- msecs_to_jiffies(C * 1000)
>> ++ secs_to_jiffies(C)
>> +
>> +@@ constant C; @@
>> +
>> +- msecs_to_jiffies(C * MSEC_PER_SEC)
>> ++ secs_to_jiffies(C)
>>
> Hi,
> 
> 	@@ constant C =~ "000"; @@
> 
> 	* msecs_to_jiffies(C)
> 
> also spots things like msecs_to_jiffies(1000)
> 
> I'm not sure that coccinelle is enable to capture part of the regex to automate the removal of the 000 when converting from ms to s.
> 
> Just my 2c,
> 
> CJ

Thank you, I'll try that rule for the later parts. Thank you all for
helping with writing Coccinelle rules, I'm not familiar with
metaprogramming in general and Coccinelle in particular, so these are
super helpful.

- Easwar

