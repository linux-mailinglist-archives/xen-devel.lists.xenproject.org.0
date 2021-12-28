Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5D480879
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 11:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252177.433175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n29t5-0007Oy-5J; Tue, 28 Dec 2021 10:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252177.433175; Tue, 28 Dec 2021 10:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n29t5-0007My-2H; Tue, 28 Dec 2021 10:39:23 +0000
Received: by outflank-mailman (input) for mailman id 252177;
 Tue, 28 Dec 2021 10:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vDp=RN=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1n29t3-0007Ms-SW
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 10:39:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3b4287-67ca-11ec-9e60-abaf8a552007;
 Tue, 28 Dec 2021 11:39:20 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id b73so11335405wmd.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 02:39:20 -0800 (PST)
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
X-Inumbo-ID: 6a3b4287-67ca-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L9lOZ2zI+DBy+AlCbUUgEUdIHpOKtgV9YxuEHY1YS8c=;
        b=BXMM5J5hQF+lsgrDcp8S899WQfkoMeEyqlmGt8oMjPJpvm70jOf7DHoHaSBmBSl8xW
         SW/igJwkUYrs6srNE1Km06hrtZ29Ml32BPLFMlRejUcvC9D/9XdXBnXpbWkVFICT7nC3
         F5dAfi3ll2dt7nDdTqN2IqPZ8Y80qwrjKRJMiuhWxW9LrpQ5X5OvjYjWN4nlM2JhdlpQ
         gb9UNEX7OHQfDWwgpsrR8/2B0Jp0F5TvQEVOnbO7NoDJu2Z+pSyAkn5Je6Ryq7XJd3ya
         w0EN/YXKPHHOkWj3B0v9oMDg8GZaku7esknXwsSB9H8oiW4fXB3lgupPppQu8Iu1Qaxb
         oy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9lOZ2zI+DBy+AlCbUUgEUdIHpOKtgV9YxuEHY1YS8c=;
        b=MCHNpYd0ZEuKj2n1az/mipcLgHPe/HRmuzBJm4QfKeg7Iyqn68HCS8ygxFTwh72hKF
         ofF/A7do7nsr3m5Fo4LXvFswoB/+hBCKz3aW82Co1wheXmVBBizg+gRIQyQm2yKVFs9Y
         DGHkSKIb9qYQxCNKbMIelI50EQEnV15JMry3MSU7/eWcjkjLpjGAI500mfzfvbrhSK9O
         xSq2z8f1FJ1ETA51HZJd9fvJLH3M+Pl0JwQ5NS0lQpP5XH5ibw9DFAL0Z/UNJWkhAv32
         UMJCMqFo2M/t6ENwktTGKsQd7k5u300ubXwk1b8QlGYuWjiKge64HC/Sw5kkm6w7Zmlq
         QJXQ==
X-Gm-Message-State: AOAM532tKp0bjbGWHM/gefT0SW+pVAASYsfhP/dENH14PzpFCuBVtzeg
	itJm1buEc+mdQcZLBWwAcG/XdOkCVDY7uGf+aNiHq/Gs9L8=
X-Google-Smtp-Source: ABdhPJxiIniXyJsLpmIPsVU+rUwz2YvH+0bifCmzDz/8aPmSeMks5CWe1YfsV6spEqbjzegQb6KIv0WZEJjRa378+iA=
X-Received: by 2002:a1c:a90b:: with SMTP id s11mr17149109wme.54.1640687960216;
 Tue, 28 Dec 2021 02:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20211228041423.2231598-1-gengdongjiu1@gmail.com>
In-Reply-To: <20211228041423.2231598-1-gengdongjiu1@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 28 Dec 2021 11:39:09 +0100
Message-ID: <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: Allow QEMU platform to be built with GICv2
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 28 Dec 2021 at 05:14, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
>
> Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
> complain about unmet dependencies:
>
> tools/kconfig/conf  --syncconfig Kconfig
>
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>    Selected by [y]:
>    - QEMU [=y] && <choice> && ARM_64 [=y]
>
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>    Selected by [y]:
>    - QEMU [=y] && <choice> && ARM_64 [=y]
>
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>    Selected by [y]:
>    - QEMU [=y] && <choice> && ARM_64 [=y]
>
> It turns out that QEMU has been supporting GICv2 virtualization since
> v3.1.0. So an easy way to solve the issue and allow more custom support
> is to remove the dependencies on GICv3.

You took my proposed commit message but the diff in
this version doesn't match it.

>
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
> change since v1:
> 1. Address Stefano's comments to add dependency
>
> change since v2:
> 1. Address Julien's comments to update the commit messages.
> 2. enable GICV3 in arch/arm/configs/tiny64_defconfig
> ---
>  xen/arch/arm/Kconfig                  | 5 +++--
>  xen/arch/arm/configs/tiny64_defconfig | 2 +-
>  xen/arch/arm/platforms/Kconfig        | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..373c698018 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig

Are the changes necessary in arch/arm/Kconfig to solve the issue on QEMU?
If not, then they should be in a separate patch.
If yes, then they ought to be explained in the commit message.

> @@ -35,7 +35,7 @@ config ACPI
>
>  config GICV3
>         bool "GICv3 driver"
> -       depends on ARM_64 && !NEW_VGIC
> +       depends on ARM_64
>         default y
>         ---help---
>
> @@ -44,13 +44,14 @@ config GICV3
>
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
> -        depends on GICV3 && !NEW_VGIC
> +        depends on GICV3
>
>  config HVM
>          def_bool y
>
>  config NEW_VGIC
>         bool "Use new VGIC implementation"
> +       depends on !GICV3
>         ---help---
>
>         This is an alternative implementation of the ARM GIC interrupt
> diff --git a/xen/arch/arm/configs/tiny64_defconfig b/xen/arch/arm/configs/tiny64_defconfig
> index cc6d93f2f8..165603f7e0 100644
> --- a/xen/arch/arm/configs/tiny64_defconfig
> +++ b/xen/arch/arm/configs/tiny64_defconfig
> @@ -4,7 +4,7 @@ CONFIG_ARM=y
>  #
>  # Architecture Features
>  #
> -# CONFIG_GICV3 is not set
> +CONFIG_GICV3=y

The goal of tiny64_defconfig is to have nothing enabled by default.
So we should not enable GICV3 here.

>  # CONFIG_MEM_ACCESS is not set
>  # CONFIG_SBSA_VUART_CONSOLE is not set
>
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..925f6ef8da 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -15,7 +15,7 @@ config ALL_PLAT
>  config QEMU
>         bool "QEMU aarch virt machine support"
>         depends on ARM_64
> -       select GICV3
> +       select GICv3 if !NEW_VGIC

There was an open question in v2. In general, it is better to wait
until the discussion is closed or you mention it after ---. This
avoids being lost.

Cheers,

-- 
Julien Grall

