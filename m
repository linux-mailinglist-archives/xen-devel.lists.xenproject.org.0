Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170CD9C0507
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831739.1247105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t918y-0005xf-9w; Thu, 07 Nov 2024 11:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831739.1247105; Thu, 07 Nov 2024 11:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t918y-0005wB-7G; Thu, 07 Nov 2024 11:57:44 +0000
Received: by outflank-mailman (input) for mailman id 831739;
 Thu, 07 Nov 2024 11:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t918w-0005w5-4h
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:57:42 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c83af2a-9cff-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:57:39 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539e7e73740so693869e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:57:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0562642sm21825775e9.21.2024.11.07.03.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:57:38 -0800 (PST)
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
X-Inumbo-ID: 7c83af2a-9cff-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzIiLCJoZWxvIjoibWFpbC1sZjEteDEzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdjODNhZjJhLTljZmYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgwNjU5LjIxMjEyOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730980659; x=1731585459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ptetnW1EcEBHdfLH4TPxXtQEUWElejFgMbfWLraAgA=;
        b=H+doEfAI5f2pUz84QL2iwLi/QjnO8DVuNRjge32VrdoCskpGIUuz+kky1ImAhDS6AA
         uswMyjTmWhR5Vi7mdABGshMl1yvWVo0zwKkaWOzJ+pJSQ7qv94rgT+sDOlTLYPl5A7yk
         dBq2/DSLtVSj6M2UedQzIbEzsf1DDNuKz6I7zbBja8g9nVKpYGt4u4KorXutLZrX+TSe
         tsmdpCHjmMvd8IzdzqQ50IcwUGBNmopt2LsVCvKNvs723yLRLd1//tRB1vathHzMDtcA
         hL09SW6w6enh7aNDf10FphWWMhCCjvD3TryBPUz/csmnpuSoiFLgdjclDWekbwN38798
         ktcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980659; x=1731585459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ptetnW1EcEBHdfLH4TPxXtQEUWElejFgMbfWLraAgA=;
        b=a1xNuVkbivKTv/2b9WzLkQu21+9knFtBLgpGoGMfJdATFy0zgVIK3bYlfQmYtoWF53
         2PGreMzLImUAfcrnirMhOKa4VBhX3QSciXSz9ExFAgvkTv3n0QR00MvTZkIowHYwmyLm
         ScliJrxh6qxGvAUL543pPtFQOCWJgdeNf7wss4ZwKGx4ZdeoTC71IR60fWFiJsPKdLdq
         55Wqu2owJ+Azjc1MVJU6MqkBntV4zl1LtclQuOb+2SpkMZBFV6aP42j+S+E7CQoGS2WF
         IEr90FFLCjyJjusZ2ZyuWmJZmJTGEpyJHhqtoCQcNnb3PFipZVkOGcQ42faIlwQGGRyw
         4KHg==
X-Gm-Message-State: AOJu0YwGpK72r4+MrM3MlyiHWErPPoy+F1jKoFK2ZeDnKGezMI9pyTK1
	j5Eh2rbqg6xyEZBCRzoB1wgQMXsyuIACOq0XAMwcbjo9ri16sQbGX7MrrPG6DA==
X-Google-Smtp-Source: AGHT+IH+t1INUeLLKhf414v4EMBKvE1WlhVyOmwuW/3TEn4X1n2jVv1hOBLwl2q5ZN/8rOb+1/dHGg==
X-Received: by 2002:a05:6512:31c3:b0:53a:c16:a9e with SMTP id 2adb3069b0e04-53d840a9283mr509118e87.51.1730980658635;
        Thu, 07 Nov 2024 03:57:38 -0800 (PST)
Message-ID: <b1ef3ffa-2021-45df-af46-098eb4cb3a46@suse.com>
Date: Thu, 7 Nov 2024 12:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: livepatch-build-tools requires debug
 information
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241107084927.37748-1-roger.pau@citrix.com>
 <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com> <ZyyLAj6MZ3fvOFBC@macbook>
 <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com>
 <e81ae2da-383f-4cc7-8213-66f8ccc9b6e7@citrix.com>
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
In-Reply-To: <e81ae2da-383f-4cc7-8213-66f8ccc9b6e7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 12:30, Andrew Cooper wrote:
> On 07/11/2024 9:48 am, Jan Beulich wrote:
>> On 07.11.2024 10:40, Roger Pau Monné wrote:
>>> On Thu, Nov 07, 2024 at 09:21:26AM +0000, Andrew Cooper wrote:
>>>> On 07/11/2024 8:49 am, Roger Pau Monne wrote:
>>>>> The tools infrastructure used to build livepatches for Xen
>>>>> (livepatch-build-tools) consumes some DWARF debug information present in
>>>>> xen-syms to generate a livepatch (see livepatch-build script usage of readelf
>>>>> -wi).
>>>>>
>>>>> The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
>>>>> on release builds, thus providing a default Kconfig selection that's not
>>>>> suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
>>>>> because it's missing the DWARF debug section.
>>>>>
>>>>> Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Oops, yes.
>>>>
>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> Fixes tag ?
>>> Was borderline on adding one, but wasn't sure since it's strictly
>>> livepatch-build-tools that requires the DWARF data, but custom made
>>> livepatches (like the examples in tests) do not require such
>>> information.
> 
> Ok.  I guess it doesn't matter too much.
> 
>> At which point: Is "select" really appropriate then? Wouldn't it be more
>> logical then to change DEBUG_INFO's default to take LIVEPATCH into account
>> (still permitting people to turn debug info off if they know they won't
>> need it)?
> 
> I am very disinterested in letting people who think they can do
> livepatching without debug symbols shoot themselves in the foot like that.
> 
> It's only debugging symbols.   If people *really* think they know
> better, they can strip them themselves.

Besides my abstract concern, let me also add a concrete practical one. I'm
sure you've noticed that xen.efi is _much_ slower to link with debug info
than without, or than xen-syms. That's a consequence of how GNU ld (really:
libbfd) works internally. By not allowing DEBUG_INFO to stay off you're
forcing me to either wait longer for every single one of my post-commit
pre-push build tests, or to turn off LIVEPATCH there. The latter not really
being a good idea.

Nevertheless, as said in reply to Roger: Go ahead if you absolutely think
that's the only sensible way.

Jan

