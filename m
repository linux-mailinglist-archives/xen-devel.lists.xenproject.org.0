Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DDAC43E6
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 20:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997732.1378552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcoD-0000OC-I9; Mon, 26 May 2025 18:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997732.1378552; Mon, 26 May 2025 18:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcoD-0000Mj-Ey; Mon, 26 May 2025 18:44:25 +0000
Received: by outflank-mailman (input) for mailman id 997732;
 Mon, 26 May 2025 18:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xmSW=YK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uJcoB-0000Lp-Ic
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 18:44:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707ef9d6-3a61-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 20:44:22 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso323325566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 11:44:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8741d84d2sm235449466b.157.2025.05.26.11.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 11:44:20 -0700 (PDT)
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
X-Inumbo-ID: 707ef9d6-3a61-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285062; x=1748889862; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zbIUHxKfg9VMrK+vYDE2a0s1LLC/5CyFtnS/47115E=;
        b=m9vrs+Vl8Pgj0caHfR0ekupXtl+32uoHKWePCZAukROj+oFQP7Har0ST+odMPW1lkD
         Ra/OraHEHcaEE3/yZzIJj54ImBls1xfNdwr5aVgXfDSu1VEZhYEqEOK4XVocddkB6AxH
         3UJOjN+YFZs75tfJSq7O04/HMLP/uKOY3DVFDvNwEF7QFTHqq/UlCl1v5KzneNg/iCVm
         1K9A+9LJ7vU6pE1pKIdHiEhkcczQs3wi6MMrtyVLT7Tiumiymh8BFtBnK0Ne2Cf26eRG
         Jf7Ks4WHqs0r8Eamn5zTKCQqtN7PnM8ZBxXFBDOxeiuxYmW35jU+wd3GN2d/K4au2sUU
         TCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285062; x=1748889862;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zbIUHxKfg9VMrK+vYDE2a0s1LLC/5CyFtnS/47115E=;
        b=ENm2QL70ENgRcTa/w0/u7zFKEBkG3RAcao3VwPFpmoxX4Vt6XX0DcKub+MJ5WOSThZ
         xXtTafh4iysNIKiHhULwgoqJYMcwgGNlJbR0TEpSQY9uvxDBBDQFMa8d4ilNe25VIoOf
         izcUrGvs4b7nNv7ckbwKJ32lJ6doak2Evnl6upOguYdgl+/zliEOobLVxXn3YgfCErJo
         x77i92oc60E+UB5UtczS7UDP83c/P0TLLweZ4JGPL7tAfyU9iQMzG3F4dPdXDDIW2H6s
         DUv9j1S5OSToHFEXnCDpO4/wn0bn9OTI4Q71ZUwDuww681UspAzvWAxfhC9zNeoV96IQ
         4k/A==
X-Forwarded-Encrypted: i=1; AJvYcCVGJJJh8YVcZW62IWqSxRUtNdQu+S4BWjjJogA7CPDkgi6vsVWaFLmnf1zil6lh0XtmJlTNNknM8RA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu0iBC1i8AuYLOD6mVhe2fOKveiydi6vgf1X3pdfyHRaUwP2jZ
	jTxN8U0BdYMKLYq1ozj66/It8KkjQtxHmPUuHcMvMedaTfESALMeQhwj
X-Gm-Gg: ASbGncv1LYXEgiY2WpvgjpCr4cZhiGmkldzpGDp41RwozXz1eI50rjlgY12oG2ilHqO
	Fi62ZPIrsgxG1oDos3CUXaIMue2MCZm5LJObTmXBJAchiJpBNpGiR3fWwAHyatCeQwhCvf0Fi0K
	tPUc4piOyD1kVvNDJukfDiA9YtGuCC0DzIQq2xBC3MDkWCUNYyQe1HKd8vwJfVjxeIf+taGq7cm
	hPyko66S6GeExeRD8pPlZ3Q0swjhik1RIDeFlXn8nk0N73rs26gwcbqZLmX+wgfrGvXawykvv2w
	ZZzv9CE8+QwmYC54BAluAnoNszuUCrU1rXfGXzHTdD1/yKYTUxm5OmRek1dnRtnRkbXZFayET4f
	IUxGewFOeUbrR+PhlZEapkZSe
X-Google-Smtp-Source: AGHT+IFAcBXwB3Q1BettWjyewq6IJDsKoWpo6DQfqhZ2gm9sACTdlt+hpw2XLNmJ+dw6D+uMfkzLIQ==
X-Received: by 2002:a17:906:b84c:b0:ad8:883b:f10d with SMTP id a640c23a62f3a-ad8883bf140mr72433966b.34.1748285061378;
        Mon, 26 May 2025 11:44:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------b063iq5IA1s7JvZwmei5Oz9Y"
Message-ID: <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
Date: Mon, 26 May 2025 20:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
 <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
Content-Language: en-US
In-Reply-To: <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>

This is a multi-part message in MIME format.
--------------b063iq5IA1s7JvZwmei5Oz9Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/25 4:46 PM, Jan Beulich wrote:
> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -0,0 +1,354 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/imsic.c
>> + *
>> + * RISC-V Incoming MSI Controller support
>> + *
>> + * (c) Microchip Technology Inc.
>> + * (c) Vates
>> + */
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/const.h>
>> +#include <xen/cpumask.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/macros.h>
>> +#include <xen/smp.h>
>> +#include <xen/spinlock.h>
>> +#include <xen/xmalloc.h>
>> +
>> +#include <asm/imsic.h>
>> +
>> +static struct imsic_config imsic_cfg;
>> +
>> +    irq_range = xzalloc_array(uint32_t, *nr_parent_irqs * 2);
>> +    if ( !irq_range )
>> +        panic("%s: irq_range[] allocation failed\n", __func__);
>> +
>> +    if ( (rc = dt_property_read_u32_array(node, "interrupts-extended",
>> +                                    irq_range, *nr_parent_irqs * 2)) )
>> +        panic("%s: unable to find interrupt-extended in %s node: %d\n",
>> +              __func__, dt_node_full_name(node), rc);
>> +
>> +    if ( irq_range[1] == IRQ_M_EXT )
>> +    {
>> +        /* Machine mode imsic node, ignore it. */
>> +        rc = IRQ_M_EXT;
>> +        goto cleanup;
>> +    }
> Wouldn't this better be done ...
>
>> +    /* Check that interrupts-extended property is well-formed. */
>> +    for ( unsigned int i = 2; i < (*nr_parent_irqs * 2); i += 2 )
>> +    {
>> +        if ( irq_range[i + 1] != irq_range[1] )
>> +            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
>> +    }
> ... after this consistency check?

My intention was: if the first|irq_range| isn't|IRQ_M_EXT|, then there's no
point in parsing the full|interrupts-extended| property.

However, on the other hand, it might be important to ensure that the
|interrupts-extended| property is properly formed.

So yes, it makes sense to move the check above, before the|for| loop.

> Also %u please when you log unsigned values.
>
>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>> +                               &imsic_cfg.guest_index_bits) )
>> +        imsic_cfg.guest_index_bits = 0;
>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>> +    if ( tmp < imsic_cfg.guest_index_bits )
>> +    {
>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>> +               dt_node_name(node));
>> +        rc = -ENOENT;
>> +        goto cleanup;
>> +    }
>> +
>> +    /* Find number of HART index bits */
>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>> +                               &imsic_cfg.hart_index_bits) )
>> +    {
>> +        /* Assume default value */
>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>> +            imsic_cfg.hart_index_bits++;
> Since fls() returns a 1-based bit number, isn't it rather that in the
> exact-power-of-2 case you'd need to subtract 1?

Agree, in this case, -1 should be taken into account.


>> +    }
>> +    tmp -= imsic_cfg.guest_index_bits;
>> +    if ( tmp < imsic_cfg.hart_index_bits )
>> +    {
>> +        printk(XENLOG_ERR "%s: HART index bits too big\n",
>> +               dt_node_name(node));
>> +        rc = -ENOENT;
>> +        goto cleanup;
>> +    }
>> +
>> +    /* Find number of group index bits */
>> +    if ( !dt_property_read_u32(node, "riscv,group-index-bits",
>> +                               &imsic_cfg.group_index_bits) )
>> +        imsic_cfg.group_index_bits = 0;
>> +    tmp -= imsic_cfg.hart_index_bits;
>> +    if ( tmp < imsic_cfg.group_index_bits )
>> +    {
>> +        printk(XENLOG_ERR "%s: group index bits too big\n",
>> +               dt_node_name(node));
>> +        rc = -ENOENT;
>> +        goto cleanup;
>> +    }
>> +
>> +    /* Find first bit position of group index */
>> +    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
>> +    if ( !dt_property_read_u32(node, "riscv,group-index-shift",
>> +                               &imsic_cfg.group_index_shift) )
>> +        imsic_cfg.group_index_shift = tmp;
>> +    if ( imsic_cfg.group_index_shift < tmp )
>> +    {
>> +        printk(XENLOG_ERR "%s: group index shift too small\n",
>> +               dt_node_name(node));
>> +        rc = -ENOENT;
>> +        goto cleanup;
>> +    }
>> +    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
>> +    if ( tmp >= BITS_PER_LONG )
>> +    {
>> +        printk(XENLOG_ERR "%s: group index shift too big\n",
>> +               dt_node_name(node));
>> +        rc = -EINVAL;
>> +        goto cleanup;
>> +    }
>> +
>> +    /* Find number of interrupt identities */
>> +    if ( !dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids) )
>> +    {
>> +        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
>> +               node->name);
>> +        rc = -ENOENT;
>> +        goto cleanup;
>> +    }
>> +
>> +    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
>> +         (imsic_cfg.nr_ids > IMSIC_MAX_ID) ||
>> +         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )
> Now that you've explained to me what the deal is with these constants: Isn't
> the 1st of the three checks redundant with the last one?

Agree, one of them could be dropped.

>> +/*
>> + * Initialize the imsic_cfg structure based on the IMSIC DT node.
>> + *
>> + * Returns 0 if initialization is successful, a negative value on failure,
>> + * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
>> + * which should be ignored by the hypervisor.
>> + */
>> +int __init imsic_init(const struct dt_device_node *node)
>> +{
>> +    int rc;
>> +    unsigned long reloff, hartid;
>> +    unsigned int nr_parent_irqs, index, nr_handlers = 0;
>> +    paddr_t base_addr;
>> +    unsigned int nr_mmios;
>> +
>> +    /* Parse IMSIC node */
>> +    rc = imsic_parse_node(node, &nr_parent_irqs);
>> +    /*
>> +     * If machine mode imsic node => ignore it.
>> +     * If rc < 0 => parsing of IMSIC DT node failed.
>> +     */
>> +    if ( (rc == IRQ_M_EXT) || rc )
>> +        return rc;
> The former of the checks is redundant with the latter. Did you perhaps mean
> "rc < 0" for that one?

Yes, like the comment is correct but in code I did a mistake.

>
>> +    nr_mmios = imsic_cfg.nr_mmios;
>> +
>> +    /* Allocate MMIO resource array */
>> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
> How large can this and ...
>
>> +    if ( !imsic_cfg.mmios )
>> +    {
>> +        rc = -ENOMEM;
>> +        goto imsic_init_err;
>> +    }
>> +
>> +    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
> ... this array grow (in principle)?

Roughly speaking, this is the number of processors. The highests amount of processors
on the market I saw it was 32. But it was over a year ago when I last checked this.

>   I think you're aware that in principle
> new code is expected to use xvmalloc() and friends unless there are specific
> reasons speaking against that.

Oh, missed 'v'...

>
>> +    if ( !imsic_cfg.msi )
>> +    {
>> +        rc = -ENOMEM;
>> +        goto imsic_init_err;
>> +    }
>> +
>> +    /* Check MMIO register sets */
>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>> +    {
>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>> +        {
>> +            rc = -ENOMEM;
>> +            goto imsic_init_err;
>> +        }
>> +
>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>> +                                   &imsic_cfg.mmios[i].size);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>> +                   node->name, i);
>> +            goto imsic_init_err;
>> +        }
>> +
>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>> +                           imsic_cfg.hart_index_bits +
>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>> +                       imsic_cfg.group_index_shift);
>> +        if ( base_addr != imsic_cfg.base_addr )
>> +        {
>> +            rc = -EINVAL;
>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>> +                   node->name, i);
>> +            goto imsic_init_err;
>> +        }
> Maybe just for my own understanding: There's no similar check for the
> sizes to match / be consistent wanted / needed?

If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
provide, IMO.
So I don't what is possible range for imsic_cfg.mmios[i].size.

>> +    }
>> +
>> +    /* Configure handlers for target CPUs */
>> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
>> +    {
>> +        unsigned long xen_cpuid;
>> +
>> +        rc = imsic_get_parent_hartid(node, i, &hartid);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
>> +                   node->name, i);
>> +            continue;
>> +        }
>> +
>> +        xen_cpuid = hartid_to_cpuid(hartid);
> I'm probably biased by "cpuid" having different meaning on x86, but: To
> be consistent with variable names elsewhere, couldn't this variable simply
> be named "cpu"? With the other item named "hartid" there's no ambiguity
> there anymore.

Sure, I will use "cpu"/"xen_cpu" for instead of xen_cpuid.

>
>> +        if ( xen_cpuid >= num_possible_cpus() )
>> +        {
>> +            printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%u\n",
>> +                   node->name, hartid, i);
> The message continues to be ambiguous (to me as a non-RISC-V person at
> least): You log a hart ID, while you say "cpu ID". Also, as I think I
> said elsewhere already, the hart ID may better be logged using %#lx.

I will correct the message.

>> +        }
>> +
>> +        if ( index == nr_mmios )
>> +        {
>> +            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
>> +                   node->name, i);
>> +            continue;
>> +        }
>> +
>> +        if ( !IS_ALIGNED(imsic_cfg.msi[xen_cpuid].base_addr + reloff, PAGE_SIZE) )
> If this is the crucial thing to check, ...
>
>> +        {
>> +            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on a page\n",
>> +                   node->name, imsic_cfg.msi[xen_cpuid].base_addr + reloff);
>> +            imsic_cfg.msi[xen_cpuid].offset = 0;
>> +            imsic_cfg.msi[xen_cpuid].base_addr = 0;
>> +            continue;
>> +        }
>> +
>> +        cpumask_set_cpu(xen_cpuid, imsic_cfg.mmios[index].cpus);
>> +
>> +        imsic_cfg.msi[xen_cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
>> +        imsic_cfg.msi[xen_cpuid].offset = reloff;
> ... why is it that the two parts are stored separately? If their sum needs to
> be page-aligned, I'd kind of expect it's only ever the sum which is used?

Because in APLIC's target register it is used only base_addr and which one interrupt
file to use is chosen by hart/guest index:
   static void vaplic_update_target(const struct imsic_config *imsic,
                                    int guest_id, unsigned long hart_id,
                                    uint32_t *value)
   {
       unsigned long group_index;
       uint32_t hhxw = imsic->group_index_bits;
       uint32_t lhxw = imsic->hart_index_bits;
       uint32_t hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
       unsigned long base_ppn = imsic->msi[hart_id].base_addr >> IMSIC_MMIO_PAGE_SHIFT;

       group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);

       *value &= APLIC_TARGET_EIID_MASK;
       *value |= guest_id << APLIC_TARGET_GUEST_IDX_SHIFT;
       *value |= hart_id << APLIC_TARGET_HART_IDX_SHIFT;
       *value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
   }


> Also is it really PAGE_SHIFT or rather IMSIC_MMIO_PAGE_SHIFT that needs
> chacking against?

I think more correct will be IMSIC_MMIO_PAGE_SHIFT.

>
> Further please pay attention to line length limits - there are at least two
> violations around my earlier comment here.
>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/include/asm/imsic.h
>> + *
>> + * RISC-V Incoming MSI Controller support
>> + *
>> + * (c) Microchip Technology Inc.
>> + */
>> +
>> +#ifndef ASM__RISCV__IMSIC_H
>> +#define ASM__RISCV__IMSIC_H
> Please update according to the most recent naming rules change (all it takes
> may be to shrink the double underscores).
>
>> +#include <xen/types.h>
>> +
>> +#define IMSIC_MMIO_PAGE_SHIFT   12
>> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
>> +
>> +#define IMSIC_MIN_ID            63
>> +#define IMSIC_MAX_ID            2047
>> +
>> +struct imsic_msi {
>> +    paddr_t base_addr;
>> +    unsigned long offset;
>> +};
>> +
>> +struct imsic_mmios {
>> +    paddr_t base_addr;
>> +    unsigned long size;
>> +    cpumask_var_t cpus;
>> +};
>> +
>> +struct imsic_config {
>> +    /* Base address */
>> +    paddr_t base_addr;
>> +
>> +    /* Bits representing Guest index, HART index, and Group index */
>> +    unsigned int guest_index_bits;
>> +    unsigned int hart_index_bits;
>> +    unsigned int group_index_bits;
>> +    unsigned int group_index_shift;
>> +
>> +    /* IMSIC phandle */
>> +    unsigned int phandle;
>> +
>> +    /* Number of parent irq */
>> +    unsigned int nr_parent_irqs;
>> +
>> +    /* Number off interrupt identities */
>> +    unsigned int nr_ids;
>> +
>> +    /* MMIOs */
>> +    unsigned int nr_mmios;
>> +    struct imsic_mmios *mmios;
> Are the contents of this and ...
>
>> +    /* MSI */
>> +    struct imsic_msi *msi;
> ... this array ever changing post-init? If not, the pointers here may want
> to be pointer-to-const (requiring local variables in the function populating
> the field).

No, they will be initialized once.

Even more I think we can drop  *mmios and nr_mmios from this struct as it is used only
in imsic_init(), so could be allocated and freed there.

Only *msi is used in the function (vaplic_update_target) mentioned above.

>
>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>       return pcpu_info[cpuid].hart_id;
>>   }
>>   
>> +static inline unsigned long hartid_to_cpuid(unsigned long hartid)
>> +{
>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
>> +    {
>> +        if ( hartid == cpuid_to_hartid(cpuid) )
>> +            return cpuid;
>> +    }
>> +
>> +    /* hartid isn't valid for some reason */
>> +    return NR_CPUS;
>> +}
> Considering the values being returned, why's the function's return type
> "unsigned long"?

mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
and MXLEN is 64 for RV64.

>
> Why the use of ARRAY_SIZE() in the loop header? You don't use pcpu_info[]
> in the loop body.

I will chang to NR_CPUs. I thought that it would be more generic if pcpu_info will
be initialized with something else, not NR_CPUs, but I don't rembember why I think
it would be better.

>
> Finally - on big systems this is going to be pretty inefficient a lookup.
> This may want to at least have a TODO comment attached.

Sure, I will add.

Thanks.

~ Oleksii

--------------b063iq5IA1s7JvZwmei5Oz9Y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/25 4:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/imsic.c
@@ -0,0 +1,354 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.c
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) Microchip Technology Inc.
+ * (c) Vates
+ */
+
+#include &lt;xen/bitops.h&gt;
+#include &lt;xen/const.h&gt;
+#include &lt;xen/cpumask.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/smp.h&gt;
+#include &lt;xen/spinlock.h&gt;
+#include &lt;xen/xmalloc.h&gt;
+
+#include &lt;asm/imsic.h&gt;
+
+static struct imsic_config imsic_cfg;
+
+    irq_range = xzalloc_array(uint32_t, *nr_parent_irqs * 2);
+    if ( !irq_range )
+        panic("%s: irq_range[] allocation failed\n", __func__);
+
+    if ( (rc = dt_property_read_u32_array(node, "interrupts-extended",
+                                    irq_range, *nr_parent_irqs * 2)) )
+        panic("%s: unable to find interrupt-extended in %s node: %d\n",
+              __func__, dt_node_full_name(node), rc);
+
+    if ( irq_range[1] == IRQ_M_EXT )
+    {
+        /* Machine mode imsic node, ignore it. */
+        rc = IRQ_M_EXT;
+        goto cleanup;
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Wouldn't this better be done ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Check that interrupts-extended property is well-formed. */
+    for ( unsigned int i = 2; i &lt; (*nr_parent_irqs * 2); i += 2 )
+    {
+        if ( irq_range[i + 1] != irq_range[1] )
+            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... after this consistency check?</pre>
    </blockquote>
    <pre data-start="63" data-end="198">My intention was: if the first <code
    data-start="94" data-end="105">irq_range</code> isn't <code
    data-start="112" data-end="123">IRQ_M_EXT</code>, then there's no
point in parsing the full <code data-start="167" data-end="188">interrupts-extended</code> property.</pre>
    <pre data-start="200" data-end="390">However, on the other hand, it might be important to ensure that the
<code data-start="269" data-end="290">interrupts-extended</code> property is properly formed.

So yes, it makes sense to move the check above, before the <code
    data-start="379" data-end="384">for</code> loop.
</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">Also %u please when you log unsigned values.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
+                               &amp;imsic_cfg.guest_index_bits) )
+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp &lt; imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    /* Find number of HART index bits */
+    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
+                               &amp;imsic_cfg.hart_index_bits) )
+    {
+        /* Assume default value */
+        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
+        if ( BIT(imsic_cfg.hart_index_bits, UL) &lt; *nr_parent_irqs )
+            imsic_cfg.hart_index_bits++;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Since fls() returns a 1-based bit number, isn't it rather that in the
exact-power-of-2 case you'd need to subtract 1?</pre>
    </blockquote>
    <pre>Agree, in this case, -1 should be taken into account.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+    tmp -= imsic_cfg.guest_index_bits;
+    if ( tmp &lt; imsic_cfg.hart_index_bits )
+    {
+        printk(XENLOG_ERR "%s: HART index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    /* Find number of group index bits */
+    if ( !dt_property_read_u32(node, "riscv,group-index-bits",
+                               &amp;imsic_cfg.group_index_bits) )
+        imsic_cfg.group_index_bits = 0;
+    tmp -= imsic_cfg.hart_index_bits;
+    if ( tmp &lt; imsic_cfg.group_index_bits )
+    {
+        printk(XENLOG_ERR "%s: group index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    /* Find first bit position of group index */
+    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
+    if ( !dt_property_read_u32(node, "riscv,group-index-shift",
+                               &amp;imsic_cfg.group_index_shift) )
+        imsic_cfg.group_index_shift = tmp;
+    if ( imsic_cfg.group_index_shift &lt; tmp )
+    {
+        printk(XENLOG_ERR "%s: group index shift too small\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
+    if ( tmp &gt;= BITS_PER_LONG )
+    {
+        printk(XENLOG_ERR "%s: group index shift too big\n",
+               dt_node_name(node));
+        rc = -EINVAL;
+        goto cleanup;
+    }
+
+    /* Find number of interrupt identities */
+    if ( !dt_property_read_u32(node, "riscv,num-ids", &amp;imsic_cfg.nr_ids) )
+    {
+        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
+               node-&gt;name);
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    if ( (imsic_cfg.nr_ids &lt; IMSIC_MIN_ID) ||
+         (imsic_cfg.nr_ids &gt; IMSIC_MAX_ID) ||
+         ((imsic_cfg.nr_ids &amp; IMSIC_MIN_ID) != IMSIC_MIN_ID) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Now that you've explained to me what the deal is with these constants: Isn't
the 1st of the three checks redundant with the last one?
</pre>
    </blockquote>
    <pre>Agree, one of them could be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Initialize the imsic_cfg structure based on the IMSIC DT node.
+ *
+ * Returns 0 if initialization is successful, a negative value on failure,
+ * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
+ * which should be ignored by the hypervisor.
+ */
+int __init imsic_init(const struct dt_device_node *node)
+{
+    int rc;
+    unsigned long reloff, hartid;
+    unsigned int nr_parent_irqs, index, nr_handlers = 0;
+    paddr_t base_addr;
+    unsigned int nr_mmios;
+
+    /* Parse IMSIC node */
+    rc = imsic_parse_node(node, &amp;nr_parent_irqs);
+    /*
+     * If machine mode imsic node =&gt; ignore it.
+     * If rc &lt; 0 =&gt; parsing of IMSIC DT node failed.
+     */
+    if ( (rc == IRQ_M_EXT) || rc )
+        return rc;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The former of the checks is redundant with the latter. Did you perhaps mean
"rc &lt; 0" for that one?</pre>
    </blockquote>
    <pre>Yes, like the comment is correct but in code I did a mistake.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    nr_mmios = imsic_cfg.nr_mmios;
+
+    /* Allocate MMIO resource array */
+    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">How large can this and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !imsic_cfg.mmios )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... this array grow (in principle)?</pre>
    </blockquote>
    <pre>Roughly speaking, this is the number of processors. The highests amount of processors
on the market I saw it was 32. B<span class="Y2IQFc" lang="en">ut it was over a year ago when I last checked this.

</span></pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre"> I think you're aware that in principle
new code is expected to use xvmalloc() and friends unless there are specific
reasons speaking against that.</pre>
    </blockquote>
    <pre>Oh, missed 'v'...

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !imsic_cfg.msi )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i &lt; nr_mmios; i++ )
+    {
+        if ( !alloc_cpumask_var(&amp;imsic_cfg.mmios[i].cpus) )
+        {
+            rc = -ENOMEM;
+            goto imsic_init_err;
+        }
+
+        rc = dt_device_get_address(node, i, &amp;imsic_cfg.mmios[i].base_addr,
+                                   &amp;imsic_cfg.mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = imsic_cfg.mmios[i].base_addr;
+        base_addr &amp;= ~(BIT(imsic_cfg.guest_index_bits +
+                           imsic_cfg.hart_index_bits +
+                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &amp;= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) &lt;&lt;
+                       imsic_cfg.group_index_shift);
+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Maybe just for my own understanding: There's no similar check for the
sizes to match / be consistent wanted / needed?
</pre>
    </blockquote>
    <pre>If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
provide, IMO.
So I don't what is possible range for imsic_cfg.mmios[i].size.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    /* Configure handlers for target CPUs */
+    for ( unsigned int i = 0; i &lt; nr_parent_irqs; i++ )
+    {
+        unsigned long xen_cpuid;
+
+        rc = imsic_get_parent_hartid(node, i, &amp;hartid);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
+                   node-&gt;name, i);
+            continue;
+        }
+
+        xen_cpuid = hartid_to_cpuid(hartid);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I'm probably biased by "cpuid" having different meaning on x86, but: To
be consistent with variable names elsewhere, couldn't this variable simply
be named "cpu"? With the other item named "hartid" there's no ambiguity
there anymore.</pre>
    </blockquote>
    <pre>Sure, I will use "cpu"/"xen_cpu" for instead of xen_cpuid.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( xen_cpuid &gt;= num_possible_cpus() )
+        {
+            printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%u\n",
+                   node-&gt;name, hartid, i);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The message continues to be ambiguous (to me as a non-RISC-V person at
least): You log a hart ID, while you say "cpu ID". Also, as I think I
said elsewhere already, the hart ID may better be logged using %#lx.</pre>
    </blockquote>
    <pre>I will correct the message.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        }
+
+        if ( index == nr_mmios )
+        {
+            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
+                   node-&gt;name, i);
+            continue;
+        }
+
+        if ( !IS_ALIGNED(imsic_cfg.msi[xen_cpuid].base_addr + reloff, PAGE_SIZE) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">If this is the crucial thing to check, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        {
+            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on a page\n",
+                   node-&gt;name, imsic_cfg.msi[xen_cpuid].base_addr + reloff);
+            imsic_cfg.msi[xen_cpuid].offset = 0;
+            imsic_cfg.msi[xen_cpuid].base_addr = 0;
+            continue;
+        }
+
+        cpumask_set_cpu(xen_cpuid, imsic_cfg.mmios[index].cpus);
+
+        imsic_cfg.msi[xen_cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
+        imsic_cfg.msi[xen_cpuid].offset = reloff;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... why is it that the two parts are stored separately? If their sum needs to
be page-aligned, I'd kind of expect it's only ever the sum which is used?
</pre>
    </blockquote>
    <pre>Because in APLIC's target register it is used only base_addr and which one interrupt
file to use is chosen by hart/guest index:
  static void vaplic_update_target(const struct imsic_config *imsic,
                                   int guest_id, unsigned long hart_id,
                                   uint32_t *value)
  {
      unsigned long group_index;
      uint32_t hhxw = imsic-&gt;group_index_bits;
      uint32_t lhxw = imsic-&gt;hart_index_bits;
      uint32_t hhxs = imsic-&gt;group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
      unsigned long base_ppn = imsic-&gt;msi[hart_id].base_addr &gt;&gt; IMSIC_MMIO_PAGE_SHIFT;

      group_index = (base_ppn &gt;&gt; (hhxs + 12)) &amp; (BIT(hhxw, UL) - 1);

      *value &amp;= APLIC_TARGET_EIID_MASK;
      *value |= guest_id &lt;&lt; APLIC_TARGET_GUEST_IDX_SHIFT;
      *value |= hart_id &lt;&lt; APLIC_TARGET_HART_IDX_SHIFT;
      *value |= group_index &lt;&lt; (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
  }


</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">
Also is it really PAGE_SHIFT or rather IMSIC_MMIO_PAGE_SHIFT that needs
chacking against?</pre>
    </blockquote>
    <pre>I think more correct will be IMSIC_MMIO_PAGE_SHIFT.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

Further please pay attention to line length limits - there are at least two
violations around my earlier comment here.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/include/asm/imsic.h
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) Microchip Technology Inc.
+ */
+
+#ifndef ASM__RISCV__IMSIC_H
+#define ASM__RISCV__IMSIC_H
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Please update according to the most recent naming rules change (all it takes
may be to shrink the double underscores).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#include &lt;xen/types.h&gt;
+
+#define IMSIC_MMIO_PAGE_SHIFT   12
+#define IMSIC_MMIO_PAGE_SZ      (1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)
+
+#define IMSIC_MIN_ID            63
+#define IMSIC_MAX_ID            2047
+
+struct imsic_msi {
+    paddr_t base_addr;
+    unsigned long offset;
+};
+
+struct imsic_mmios {
+    paddr_t base_addr;
+    unsigned long size;
+    cpumask_var_t cpus;
+};
+
+struct imsic_config {
+    /* Base address */
+    paddr_t base_addr;
+
+    /* Bits representing Guest index, HART index, and Group index */
+    unsigned int guest_index_bits;
+    unsigned int hart_index_bits;
+    unsigned int group_index_bits;
+    unsigned int group_index_shift;
+
+    /* IMSIC phandle */
+    unsigned int phandle;
+
+    /* Number of parent irq */
+    unsigned int nr_parent_irqs;
+
+    /* Number off interrupt identities */
+    unsigned int nr_ids;
+
+    /* MMIOs */
+    unsigned int nr_mmios;
+    struct imsic_mmios *mmios;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Are the contents of this and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* MSI */
+    struct imsic_msi *msi;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... this array ever changing post-init? If not, the pointers here may want
to be pointer-to-const (requiring local variables in the function populating
the field).</pre>
    </blockquote>
    <pre>No, they will be initialized once.

Even more I think we can drop  *mmios and nr_mmios from this struct as it is used only
in imsic_init(), so could be allocated and freed there.

Only *msi is used in the function (vaplic_update_target) mentioned above.
</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
     return pcpu_info[cpuid].hart_id;
 }
 
+static inline unsigned long hartid_to_cpuid(unsigned long hartid)
+{
+    for ( unsigned int cpuid = 0; cpuid &lt; ARRAY_SIZE(pcpu_info); cpuid++ )
+    {
+        if ( hartid == cpuid_to_hartid(cpuid) )
+            return cpuid;
+    }
+
+    /* hartid isn't valid for some reason */
+    return NR_CPUS;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Considering the values being returned, why's the function's return type
"unsigned long"?</pre>
    </blockquote>
    <pre>mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
and MXLEN is 64 for RV64.

</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

Why the use of ARRAY_SIZE() in the loop header? You don't use pcpu_info[]
in the loop body.</pre>
    </blockquote>
    <pre>I will chang to NR_CPUs. I thought that it would be more generic if pcpu_info will
be initialized with something else, not NR_CPUs, but I don't rembember why I think
it would be better.
</pre>
    <blockquote type="cite"
      cite="mid:ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

Finally - on big systems this is going to be pretty inefficient a lookup.
This may want to at least have a TODO comment attached.</pre>
    </blockquote>
    <pre>Sure, I will add.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------b063iq5IA1s7JvZwmei5Oz9Y--

