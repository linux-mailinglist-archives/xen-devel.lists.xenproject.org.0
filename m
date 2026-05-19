Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DRPIapTDGr6fQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:12:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F857E65A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312936.1583116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJIx-00010v-3N; Tue, 19 May 2026 12:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312936.1583116; Tue, 19 May 2026 12:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJIx-00010L-0V; Tue, 19 May 2026 12:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1312936;
 Tue, 19 May 2026 12:12:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPJIw-00010E-73
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:12:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJIv-00BuMR-BM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:12:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c538e-5cb7-0a2a0a5109dd-0a2a45048102-28
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:12:09 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c5398-1dec-0a2a45040019-d155dd31dcd9-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:12:09 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-44a044cb827so2486542f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 05:12:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3ac86sm44888822f8f.14.2026.05.19.05.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 05:12:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779192728; x=1779797528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oc9tbDGweMFnSRG+PA+uzUnUtV+b8fj+bFrxGKH15d0=;
        b=WYM5V1k0LCHztNahK4S/89+ulR0R8yPGuBCxFAo6eo5U4x1zEHF8LOqxAxSnlKUSAR
         +DLwHqzyKx4nWEv7LN4HoTfQSSvqtuXQRlWNS2JuwKEaxi/RRovbu4gz4XuAaNtW0Bz6
         3BN172mK6ZLeO59mGS4s1Zndoipf9CM+ItQzkjBGyZ/2uL4LUEcvP51Ql1qQH3SI0+nI
         1CwOFjNP/kZM28QMDqgFdDw4TxDViah+hBeBNKNYSYpHpzUbYB02pQ3mQ5+2iMh2OE5G
         5GH16nIewQTFcSdyDYVdy/BSnd7ZNFABFp/eylwCYczopvXsf3GSvCiu+3msOJIMXE3k
         AHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192728; x=1779797528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc9tbDGweMFnSRG+PA+uzUnUtV+b8fj+bFrxGKH15d0=;
        b=N9h3KpEvvCP11bDDLvaoK7FbAmZBdBgY4qf4Rj2pMCpFeRD9zB1lSxbwfyFusKP1Tj
         pXSd3DWDnLl0fb9JnlK1PR87F+WV/wxRXTNcuAOVmvvKRd2All61aDnWiGOg8qR5FuX2
         rOQOJ3ft0ufMMZrle8eXfrlTQBwTTuUgg9zKOgMmLEs5qHaFFG1UDXajsdhAJe6prsNg
         9Oib75S6s0qxQsc1I7SQQ1JdrkyoHpw7LiOf5LRsfaYBmTBgFytYNOx2gpkwRbi+Jb16
         Kg3aKQRcWxJv9KjiLAB6J7SeAyd/v+aXyDZPQzW3a/M3tzV7SwO2bGaLU+SNdoZosvK5
         MW1A==
X-Forwarded-Encrypted: i=1; AFNElJ9u13OIZLXbk+9MSf6fRBJnwLadWu3HsVqgVcRZHF9B3oHnz2ZMxT9sxWDt30jrRILdmK/j0gvzwco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFZSOQCG3Oo8yqxdEVuSWcD9pNwMb+lNDP96hizoq57RXcpTcN
	1y5/1HhDBBnf/VBz90QHpR9sokNp0JcSBZmPI4dZH5rPbq6xs5ZvxWEyjrRrZk5pbQ==
X-Gm-Gg: Acq92OFDI2EvbZqz+YGjp58oj4NKfMst3A0MbXTUT5cWpGpYHw6CUx4ajHCxnXaZqF8
	j3ttTa+7btqcwXKz4DKHixp87SPWr8hTO4Q9bp1XIV7i0aDn5HdJ6A7t+clOxhkd6jv2dprazTw
	fVg/k/91JqLd3luTmbJ8WfQ6iVuGg+NEIjdV2nldGb/A2yIRL7jcIk3x27/HmqNhsMke30cGMlS
	jxBe3X/8h5xQVWU2ZE3aP4dkFIfEBKDynHAmm7j1zRtt6x3wduTBrSIaiMcPZDQvB5+V7JazlkC
	oE8nwPI4dG6oFqXtdoti9m8XhVMfZm8y6Yc/eOg7BDWy0Cru0+4bWDExRH79OBU0hUV+J44qJZd
	3m6dVMNl4MsJDqk1O/I/EV2SSkfevv6XyYaMKPUw44NRU/qa7Xouz7kfp/2gFAq2hZ3E4I7LIAX
	tD4vxzrEM1rRCnU2rQtLMyMNxpDroEqUgBFfeBGoXIdZOdebADQea0Ug4iBPvkmtibRnVRt+vYn
	Lg9Ro0yAzQdEjs=
X-Received: by 2002:a05:6000:2083:b0:452:d03a:7aad with SMTP id ffacd0b85a97d-45e5c5daea5mr33068692f8f.36.1779192728554;
        Tue, 19 May 2026 05:12:08 -0700 (PDT)
Message-ID: <23e8de1e-b792-4863-bd99-f529642fb963@suse.com>
Date: Tue, 19 May 2026 14:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <b2d4f3f7f049837a25bc00bfb1d3da8b984a8b5a.1778250616.git.oleksii.kurochko@gmail.com>
 <364abd6e-4fff-437a-90c8-bb4489f0c51d@suse.com>
 <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1779192729-41D7C3FF-FEAE8804/0/0
X-purgate-type: clean
X-purgate-size: 1486
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EE9F857E65A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 13:59, Oleksii Kurochko wrote:
> On 5/18/26 5:51 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>>> @@ -17,6 +17,8 @@
>>>    */
>>>   #define RISCV_ISA_EXT_BASE  26
>>>   
>>> +#define RISCV_GUEST_ISA_STR_MAX 256
>>
>> This looks like it won't be good for very long, seeing how long ISA strings can
>> get. I wonder anyway whether ...
>>
>>> @@ -94,6 +95,9 @@ struct arch_domain {
>>>       struct p2m_domain p2m;
>>>   
>>>       struct paging_domain paging;
>>> +
>>> +    DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
>>> +    char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
>>
>> ... a compile-time sized buffer is suitable here. Can't you allocate a buffer
>> just large enough to hold the string?
> 
> It could be allocated dynamically.
> 
> Does it make sense to evaluate in run-time what should be a buffer size? 
> For this case I can't find analogue of realloc() in Xen.

Hmm, I see xrealloc_array(), and surely we could gain xvrealloc_array()
which we'll need anyway once xrealloc_array() uses get converted. (I also
see x{,v}realloc_flex_struct(), but that's of no use here as it looks.)

> Or it would be 
> fine just to take something bigger as a const (lets say 2048) and use it 
> for dynamic allocation?

I'd rather not. Can't you determine how much space the string is going to
occupy?

Jan

