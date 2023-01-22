Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A085677382
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482590.748180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjwx-00044i-1P; Sun, 22 Jan 2023 23:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482590.748180; Sun, 22 Jan 2023 23:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjww-000430-Ux; Sun, 22 Jan 2023 23:40:34 +0000
Received: by outflank-mailman (input) for mailman id 482590;
 Sun, 22 Jan 2023 23:40:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjwv-0002oW-AU
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 23:40:33 +0000
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [2607:f8b0:4864:20::e29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 283cb299-9aae-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 00:40:31 +0100 (CET)
Received: by mail-vs1-xe29.google.com with SMTP id n190so11211159vsc.11
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 15:40:31 -0800 (PST)
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
X-Inumbo-ID: 283cb299-9aae-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=klhteFIeCOqAfIbCYkAE/VvYSMNDVdWDiJyCobSe9jA=;
        b=TGDfWXAYqlPCeZK24Hut7kbXcq5b9JAfSQUhOw3HOc/FbLY9j4QAELEcC/5mLrSug0
         rXSacVWMJK3uP8+jp/YmAYLgGBzNfKkXWPDRQI5aqHo4AHgE0+qHo6tm/xwJTC+Fb42k
         c3sgaxhAVUvtm/yFJbjYy5DqdrR0eIkgkKp1ssqfNqHRCM1WyGrmdGIMu4YP/PMg/1if
         tFVEYV8YE6lslZwqXAq3qHyHEc7GMbSHmEZaZCGmuDz4/hSs47boQ9bJuCMf8htL24Ol
         Y2f5sN3NHc96houoiDWfAKf50SuB/slMwH3lVZlaI8mRk+XZLQSVqVCp2GTsxOQmki2t
         6Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klhteFIeCOqAfIbCYkAE/VvYSMNDVdWDiJyCobSe9jA=;
        b=cwMDqVpV+uQ19dP0I0/NUYY7vnkygnFu1zSY0r63YfFhl0zoyXYbjmiWppeVI75UyJ
         OSCigW3P/drLXhcxbP745T3HoQNMyFkCPCOb35jStX8bIzKmoyQwKnDDpLEEhZkk47XW
         43mZ1r7xa2Lykm5wnD0QiQ503vmiEWeMTOwlZ6vN2gvs+/s9W3xDKAFVMY1qXuOmRmSQ
         8fhWJBox9KKFs9ytdNNcL8wo/32hIhdCUis3C1c4SJF8pcObq0DzR3dz96UI92R+VGLx
         682OdrruDu4I8NE9Mq645idXwNgppTkSBcUEadYDpcCyDJZPQkML2L/G0o0yDx1JT4IJ
         jX8g==
X-Gm-Message-State: AFqh2kqP3YmJg8O4kFaJ+7IHL/0OKuEbWaDRJeixqFtRAYkdor/7guLM
	MKeUHe+Pl7wQ/hC1bdHXMJjd+UD6Ktn3goRGakM=
X-Google-Smtp-Source: AMrXdXvTRkKKb4R5M8neFIif1r2M508tMMWLa0GYCrDT/tLHQzX1HPh9cIyj+wGZM9AXRr+/fIWSQ1A29O/mOp5tox8=
X-Received: by 2002:a67:ba0c:0:b0:3ce:f2da:96a with SMTP id
 l12-20020a67ba0c000000b003cef2da096amr2599867vsn.64.1674430830500; Sun, 22
 Jan 2023 15:40:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <0153a210de96733880fb3f6fddd902862cc2eaca.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <0153a210de96733880fb3f6fddd902862cc2eaca.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:40:04 +1000
Message-ID: <CAKmqyKN2_SUHzRnUeU-YCPLUWCo4eEAL+eFOpfON3N0FDB2Svg@mail.gmail.com>
Subject: Re: [PATCH v1 10/14] xen/riscv: mask all interrupts
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/riscv64/head.S | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index d444dd8aad..ffd95f9f89 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,6 +1,11 @@
> +#include <asm/riscv_encoding.h>
> +
>          .section .text.header, "ax", %progbits
>
>  ENTRY(start)
> +        /* Mask all interrupts */
> +        csrw    CSR_SIE, zero
> +
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
> --
> 2.39.0
>
>

