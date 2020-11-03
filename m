Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD72A3E75
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18017.42746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZrSM-0004CK-Gb; Tue, 03 Nov 2020 08:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18017.42746; Tue, 03 Nov 2020 08:14:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZrSM-0004Bv-DV; Tue, 03 Nov 2020 08:14:18 +0000
Received: by outflank-mailman (input) for mailman id 18017;
 Tue, 03 Nov 2020 08:14:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZrSK-0004Bq-B7
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 08:14:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 439aca46-d17e-429c-8439-21789aefb5c3;
 Tue, 03 Nov 2020 08:14:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79EF7AC6A;
 Tue,  3 Nov 2020 08:14:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZrSK-0004Bq-B7
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 08:14:16 +0000
X-Inumbo-ID: 439aca46-d17e-429c-8439-21789aefb5c3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 439aca46-d17e-429c-8439-21789aefb5c3;
	Tue, 03 Nov 2020 08:14:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604391253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfEbVcIhf2++JwztfKmp+knnaDJbbwEmnJBOoNoFZAc=;
	b=odWbReI2kFoxA6bed5moN/kIIaNvOXeTuvbhi0+WqqAoo7IWHOmnnYCccjEaUMtiWi7jJN
	UilymOtAQMdq1NGwyO5O9olcXh7IR/uhldm7m0No6/FbIwh5XnqSssNk5IOMK5lVbM6fJP
	/RbxbjbHMjZwMO/hQDj/dd3LtOAN+5k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79EF7AC6A;
	Tue,  3 Nov 2020 08:14:13 +0000 (UTC)
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <20201031002405.4545-1-sstabellini@kernel.org>
 <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com>
 <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c127499b-810b-63af-5487-2cc9ecfdba09@suse.com>
Date: Tue, 3 Nov 2020 09:14:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.11.2020 22:41, Stefano Stabellini wrote:
> On Mon, 2 Nov 2020, Jan Beulich wrote:
>> On 31.10.2020 01:24, Stefano Stabellini wrote:
>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>>>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>>  
>>>  config ARM_SSBD
>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>> -	depends on HAS_ALTERNATIVE
>>> +	bool "Speculative Store Bypass Disable"
>>> +	depends on HAS_ALTERNATIVE && EXPERT
>>>  	default y
>>
>> At the example of this, I'm afraid when the default isn't "n"
>> (or there's no default directive at all, as ought to be
>> equivalent to and preferred over "default n"), such a
>> transformation is not functionally identical: Before your
>> change, with !EXPERT this option defaults to y. After your
>> change this option is unavailable (which resolves to it being
>> off for all consuming purposes).
>>
>> IOW there are reasons to have "if ..." attached to the prompts
>> (for this construct indeed only making the prompt conditional,
>> not the entire option), but there are also cases where the
>> cleanup you do is indeed desirable / helpful.
> 
> Yeah, thanks for catching it, it is obviously a problem.
> 
> My intention was just to "tag" somehow the options to EXPERT so that it
> would show on the menu. Maybe a better, simpler, way to do it is
> to add the word "EXPERT" to the one line prompt:
> 
>  config ARM_SSBD
> -	bool "Speculative Store Bypass Disable" if EXPERT
> +	bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
>  	depends on HAS_ALTERNATIVE
>  	default y
>  	help
> 
> 
> What do you think?

While on the surface this may look like an improvement, I don't
see how it would actually help: If you read the Kconfig file
itself, the dependency is seen anyway. And on the menu I don't
see the point of telling someone who has enabled EXPERT that a
certain option is (or is not) an expert one. If they think
they're experts, so should they be treated. (It was, after all,
a deliberate decision to make enabling expert mode easier, and
hence easier to use for what one might consider not-really-
experts. I realize saying so may be considered tendentious; I
mean it in a purely technical sense, and I'd like to apologize
in advance to anyone not sharing this as a possible perspective
to take.)

Plus, of course, the addition of such (EXPERT) markers to
future options' prompts is liable to get forgotten now and then,
so sooner or later we'd likely end up with an inconsistent
mixture anyway.

Jan

