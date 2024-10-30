Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098EC9B6133
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828100.1242930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66gh-0002ZG-0i; Wed, 30 Oct 2024 11:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828100.1242930; Wed, 30 Oct 2024 11:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66gg-0002W9-UG; Wed, 30 Oct 2024 11:16:30 +0000
Received: by outflank-mailman (input) for mailman id 828100;
 Wed, 30 Oct 2024 11:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t66gf-00026s-Ve
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:16:29 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6735a976-96b0-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 12:16:26 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso4600115f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:16:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3c236sm15061806f8f.35.2024.10.30.04.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 04:16:25 -0700 (PDT)
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
X-Inumbo-ID: 6735a976-96b0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzQiLCJoZWxvIjoibWFpbC13cjEteDQzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY3MzVhOTc2LTk2YjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg2OTg2LjM3NDI0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730286986; x=1730891786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MXqPuPi199o/qEWEhYg7YxRf9gL98Q+KOVTsqPBOLeY=;
        b=VJt++yDtzaBUMI2hl3aJ7+rvicO40zyz/SCecB0tqW1UoVIQAcd27itfcPkvUDXHC1
         44cAU2+A/K4gc8dOWSKwq5Ry950CMH9PXovqsGH0hABNh0mzzLY47a+IoYRrnWlgppZo
         MeC/puNleCs9URQdUijsdaUKwO3LXz9ddTLakpmouCMo92BdY+oQbC11OwvKig1nxnzm
         V3l+f2l3DMW+qcGlOUV10AQlLHLZkVn9yQvtAEvGvg7yakkqTkyeJy97RTC5Cd4vfZBX
         eChIefKwzO4r25UvpE8QoehzWK4pxG3daebzXw0D43QN8avSu1sv39By9fnxmGEHeDEz
         SwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286986; x=1730891786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXqPuPi199o/qEWEhYg7YxRf9gL98Q+KOVTsqPBOLeY=;
        b=D3PUp0MvnlP+3WZGYdiJxJtr8D5AXux36sCoxPESPyKNOU28YeTDuTIdi1G6knecGE
         Z64z/c0NRdqp9TjydZnACbkSvT/PD+WkaX9GR8osWT/+VtkNmFr98lzYGzicdIw5d+ZO
         OxNaDuYuCkpwYg++UnI7OcxDEgKcdr+DjgVCUVRQcEyJirzb+CNPC+ccw+Epbz2kXbUx
         jvE45hgbRtViB3clwmi2O7zd8o/W5EC9jOZBniwyWz7cH/MuhaZdy1WR1URb4Et5Q5Y6
         mcR/wagnhojXZypHEIuT6oKhbcgtIufRbViIEdBwyIIGNBIFdcPj4yAljkJwxbVkJnyb
         njdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJzfODo2emVMXod26V9TSSDW+rzJPqIls4mZj2VHAvFRod+OOvTAm8TwchCl/zn3qvKHJvG1hsJn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiPUPoDRlqx5Np3RWITbHKRb/7Z7UMCd8HpVRcjFsZQQltn2ix
	Z3r5vEOiU5lBbUuEZj45UGI232Mg9syObirO83vHTDZiHb42c9n10KPqyC7Low==
X-Google-Smtp-Source: AGHT+IFzPkLspuHDkdv+hfYXvu0qQDWJpie8E0owVWh0gXnFq6KIEBrIIcO5byL4vlYU+58vrsEgrQ==
X-Received: by 2002:adf:f18c:0:b0:374:c621:3d67 with SMTP id ffacd0b85a97d-38061137930mr11556275f8f.24.1730286985690;
        Wed, 30 Oct 2024 04:16:25 -0700 (PDT)
Message-ID: <848bfd79-66c8-43a2-9f6a-44b87f130516@suse.com>
Date: Wed, 30 Oct 2024 12:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Use standard C types for sized integers
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241030104406.2173357-2-frediano.ziglio@cloud.com>
 <6a7bd508-99af-4602-86aa-f46d718e36c2@suse.com>
 <CACHz=ZixwA4aW3RAsusb=NjR6funSTXDCyViSJRSqjM5N_114Q@mail.gmail.com>
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
In-Reply-To: <CACHz=ZixwA4aW3RAsusb=NjR6funSTXDCyViSJRSqjM5N_114Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 12:10, Frediano Ziglio wrote:
> On Wed, Oct 30, 2024 at 11:02 AM Jan Beulich <jbeulich@suse.com> wrote:
>> It's only here where the fixed width type is largely needed (or alternatively
>>
>>             signed int linear_pt_count:16;
> 
> That would be different. Compilers do not allow to take addresses of bit-fields.

Oh, right, I forgot we take the address of this field in a few places.

Jan

