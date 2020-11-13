Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C42B1CE3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26507.54917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdZhQ-0007Cj-Cw; Fri, 13 Nov 2020 14:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26507.54917; Fri, 13 Nov 2020 14:05:12 +0000
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
	id 1kdZhQ-0007CK-9f; Fri, 13 Nov 2020 14:05:12 +0000
Received: by outflank-mailman (input) for mailman id 26507;
 Fri, 13 Nov 2020 14:05:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdZhO-0007Bo-Hd
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:05:10 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f643f137-03c3-4a7b-a56b-705aebe3cd3f;
 Fri, 13 Nov 2020 14:05:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i6so14002567lfd.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 06:05:09 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1579328lfe.250.2020.11.13.06.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 06:05:07 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdZhO-0007Bo-Hd
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:05:10 +0000
X-Inumbo-ID: f643f137-03c3-4a7b-a56b-705aebe3cd3f
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f643f137-03c3-4a7b-a56b-705aebe3cd3f;
	Fri, 13 Nov 2020 14:05:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i6so14002567lfd.1
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mMj35E/VQ8uLKKRkNiHDGMQMPmF+Wb2F4IEVPt8+jSk=;
        b=DTSFDGEYsfYXHt3d371K8Re8IvfQsP8xlz0n15SeX2myGOQ6gAFLhle7y4egGSGTEP
         OFAMpM5GfYuZ8M47oVKIAN1tfh6N6tBE2iNWWb6W+xqMhrr+Jtj/DxPT1WHUQK/09eb9
         zaiUUD6REZrBdi3+izPWNvkDmSPccIpx3//87PvBbc4+hYwoviwPErCAlJNzM8P7TSZX
         JXZC0+ukkz8edUFnSFjO9ZFrZCR1ikYB/BRsK7XFQwpUIwTB5GkXsmUR2ihzMaDGuCy1
         3Ld2Vpjw/l7jeJrmqs9f66UX4KkwMEVK5pInYcsMECxDM6z2Vl58bY4IhqCvVjI7E0f0
         SnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mMj35E/VQ8uLKKRkNiHDGMQMPmF+Wb2F4IEVPt8+jSk=;
        b=rwFclX6chbnzfzR6TFzAbEqPlLTme7cE7HnSrIDj3HKr+8Ahbz1sPxaR2hLKiCAkfz
         MshF72whEbcd/ly4v0wa6aJi1NcLbRq/i30fITxrCFNbHway0dVteeDf625FygKhz8Nj
         GX8fdXGgLZSuH+6Q0cUbqx7XJ7UBulOiJSvx7CsYB5onORDvgJ8u3agdJkcHtwvfft4n
         e7FMJ4rgSOvQFDJbLtV4MhrPmYADrkKS6Z5E+INzqDBJ6aymO0YPiUr3X+nUujhJlJqd
         EG363JITs/rzDSB369nU1BSavzPhz3IOlOnxeVWLzwtvRpuMe8mM8h/6Y1dPfn/fm8C+
         IXTA==
X-Gm-Message-State: AOAM530m2jCjNeU9oVBMF0HR4DHBCFcZyMw+VcRLs98U/Wx0QAIHtnG6
	y36LrlUYrTyGJLCa7mDArWI1EfwlO07ZHw==
X-Google-Smtp-Source: ABdhPJzCHAeZbuG1W/40sARjSrPd47L0COXnZFXclD41xKPIn/1PUVrr0cWM6O8LaBYkz9/HvmiZpA==
X-Received: by 2002:a19:c8cc:: with SMTP id y195mr852365lff.225.1605276308392;
        Fri, 13 Nov 2020 06:05:08 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1579328lfe.250.2020.11.13.06.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:05:07 -0800 (PST)
Subject: Re: [PATCH V2 07/23] xen/ioreq: Move x86's ioreq_gfn(server) to
 struct domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-8-git-send-email-olekstysh@gmail.com>
 <00f9046f-5c77-cee5-b201-aa01f880d4e7@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d4d034ff-08cb-3423-5546-a19d601d09f8@gmail.com>
Date: Fri, 13 Nov 2020 16:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00f9046f-5c77-cee5-b201-aa01f880d4e7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 13:21, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -77,7 +77,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>>       if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>           return -EINVAL;
>>   
>> -    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
>> +    spin_lock_recursive(&d->ioreq_server.lock);
>>   
>>       s = get_ioreq_server(d, id);
>>   
>> @@ -92,7 +92,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>>       rc = p2m_set_ioreq_server(d, flags, s);
>>   
>>    out:
>> -    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>> +    spin_unlock_recursive(&d->ioreq_server.lock);
>>   
>>       if ( rc == 0 && flags == 0 )
>>       {
>
> Does this build at this point, when !CONFIG_IOREQ_SERVER? Patch 1
> moves the code here without guards, and patch 2, when introducing
> the Kconfig symbol, doesn't add guards here. I admit I didn't
> check further intermediate patches.
Yes.


I can confirm I checked x86 patch by patch with CONFIG_IOREQ_SERVER, as 
for !CONFIG_IOREQ_SERVER I can't recollect to be 100% sure, but likely I 
tested also patch by patch.
Anyway, I have just rechecked.
Probably it is because this header isn't in use with 
!CONFIG_IOREQ_SERVER since all users are x86/hvm/* and common/ioreq.c


-- 
Regards,

Oleksandr Tyshchenko


