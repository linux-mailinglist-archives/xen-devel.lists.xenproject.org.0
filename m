Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B394F33CF31
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 09:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98217.186245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM4eo-0007B3-9E; Tue, 16 Mar 2021 08:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98217.186245; Tue, 16 Mar 2021 08:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM4eo-0007Ae-65; Tue, 16 Mar 2021 08:02:26 +0000
Received: by outflank-mailman (input) for mailman id 98217;
 Tue, 16 Mar 2021 08:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lM4em-0007AZ-B9
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 08:02:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3008581c-28c7-460b-9d96-3288052e0b05;
 Tue, 16 Mar 2021 08:02:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8730AAC1F;
 Tue, 16 Mar 2021 08:02:22 +0000 (UTC)
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
X-Inumbo-ID: 3008581c-28c7-460b-9d96-3288052e0b05
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615881742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2jUnwx30oLup+3RF6idd9C+gHMgvw06OY6GSdwq9n4=;
	b=Tsclj9QDv8yGsn0KqH4ftv9Aw1GoGHyf4ZJEzBCLXANbPadxf329KDsNCw5S/DJZ6g/0/X
	9stKCug9IdqI+Fq6Ez5MZid4MDTjNLqlVHh3fPoCYFt4sbTz6ZtSphPiQ/OzX+8Xl+ZYVC
	Seit5z6zQzstA89Ak/UkiKm92lRxk/4=
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
 <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
 <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
 <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
 <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
 <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
 <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
 <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com>
 <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com>
 <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4916dec1-1bb9-7e6f-2fe5-577bbab92861@suse.com>
Date: Tue, 16 Mar 2021 09:02:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.03.2021 03:10, Dylanger Daly wrote:
> I just wanted to close this off and let everyone know the issue ended up being a faulty/misconfigured HPET clock.
> 
> Appending `clocksource=tsc tsc=unstable hpetbroadcast=0` to Xen's CMDLINE totally fixed my issue, I assume Xen was detecting TSC may have been 'off' and was trying to recover/self-correct?

I find this a very confusing combination of command line options.
In particular "tsc=unstable" clears one of the feature prereqs
(TSC_RELIABLE) that are required for "clocksource=tsc" to take
any effect, afaict. I therefore would conclude that you're not
actually running with TSC as the clock source. Did you check the
hypervisor log (which might prove me wrong)?

Jan

