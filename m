Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A34748DB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246950.425920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBGL-0005tr-67; Tue, 14 Dec 2021 17:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246950.425920; Tue, 14 Dec 2021 17:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBGL-0005r9-2V; Tue, 14 Dec 2021 17:06:49 +0000
Received: by outflank-mailman (input) for mailman id 246950;
 Tue, 14 Dec 2021 17:06:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBGJ-0005r0-Pi
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:06:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBGI-0004co-PE; Tue, 14 Dec 2021 17:06:46 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBGI-0004dS-J3; Tue, 14 Dec 2021 17:06:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=3O7SKgxbikZjYBZgc3TdUmLQIqhTETNz8bS/8BF5bCQ=; b=LXc81H3OgV/LOzJddtEMbZn4mT
	V11AoxX+CZeZquBL/kWgmbz/42FSr7p0F7Xm+SB1D9nmTBzH7lnAjAQB6SB03w4PLPC5K5Xp0I+G1
	bhoil4I1XW2EyvNIzB13m/GN2GO1F8EsMorjK+k6PKzNv0N8gfKFSyciXUnsXJ2JNnDo=;
Message-ID: <67c1bcb0-032b-0699-74d2-70677d177f64@xen.org>
Date: Tue, 14 Dec 2021 17:06:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 20/47] build: add headers path to CFLAGS once for
 all archs
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-21-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-21-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/11/2021 13:39, Anthony PERARD wrote:
> This just remove duplication.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/Makefile           | 3 +++
>   xen/arch/arm/arch.mk   | 3 ---
>   xen/arch/riscv/arch.mk | 2 --
>   xen/arch/x86/arch.mk   | 2 --
>   4 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 06d5e4fd61c1..efd7538099f3 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -312,6 +312,9 @@ CFLAGS += -flto
>   LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
>   endif
>   
> +CFLAGS += -I$(srctree)/include
> +CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
> +
>   # Note that link order matters!
>   ALL_OBJS-y                := common/built_in.o
>   ALL_OBJS-y                += drivers/built_in.o
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index 4e3f7014305e..094b67072304 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -1,9 +1,6 @@
>   ########################################
>   # arm-specific definitions
>   
> -CFLAGS += -I$(srctree)/include
> -CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
> -
>   $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>   $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
>   
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index 694ba053ceab..ae8fe9dec730 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -11,5 +11,3 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>   # -mcmodel=medlow would force Xen into the lower half.
>   
>   CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> -CFLAGS += -I$(srctree)/include
> -CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 5152de343082..1ba488d645c0 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -3,8 +3,6 @@
>   
>   export XEN_IMG_OFFSET := 0x200000
>   
> -CFLAGS += -I$(srctree)/include
> -CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
>   CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
>   CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
>   CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)

-- 
Julien Grall

