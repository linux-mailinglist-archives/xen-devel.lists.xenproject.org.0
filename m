Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5E3B9BA2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 06:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149083.275577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzB3r-0007mH-Dm; Fri, 02 Jul 2021 04:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149083.275577; Fri, 02 Jul 2021 04:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzB3r-0007jv-AM; Fri, 02 Jul 2021 04:45:55 +0000
Received: by outflank-mailman (input) for mailman id 149083;
 Fri, 02 Jul 2021 04:45:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiW2=L2=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1lzB3q-0007jp-9f
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 04:45:54 +0000
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84291fa-e516-4e66-99a1-616021f2c5e9;
 Fri, 02 Jul 2021 04:45:53 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id f21so10153651ioh.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jul 2021 21:45:53 -0700 (PDT)
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
X-Inumbo-ID: c84291fa-e516-4e66-99a1-616021f2c5e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8R7vzE3sMCLc8J7Cy3dbusGdeTZZo2sinRkBhrCFmms=;
        b=vTaC25hO73MXSL3xPAej+rc5V6NNcyjA9e2gk6Na2UN5AUZ1b/LvUAbsUFub2TeDcQ
         SnqMKnU1xekNb5TZe3LTGZsa+H92Mgzidgh8lJs6k8U8cb19GBvj9nvbkj+0R3g73LUQ
         1oZXDB9ybhX+tWcSb2W/PZdwfhpndH0+/E0CrN8ZeoihyFsdxRZbVhvRC0qVoBGVbdP/
         mfIbtSgVyP2Hg5NFeFxNs2eePudXkESuG3pTsc3XbtaeCXAi3JlVxIohSVbW9UAqOAzX
         GCzI8CenBjICm6Nkuym/wIxaxHIVoyJt44yKBheMwDSH6GN+zp3Iog5FXgD9E4DSEEsd
         sUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8R7vzE3sMCLc8J7Cy3dbusGdeTZZo2sinRkBhrCFmms=;
        b=fNK6I2z5b74QCm832t8TnQXlnnrO/gs2MvrJn1o5gGnv5kYoIc2U6Kdf3Zdwvro3Li
         THMDq0cNQhHs79qAthzai0uKzaqLcb8iAQxk2XJt9yeN6xLtN+vCrIYwudym9CNOZSdI
         fpxTjhZK5Hy1riEK3B8uQwe7R8XhadOgkJ1acBNc0K6sJT1C7mJUHlBauNgAs+M3Jdbz
         YDoohHfvIm6lGmPuObBvTWqa7BHOFf/0HJv5TBemzNyxlI0bpJcYWx/SVwWOsQdos9MI
         qLWuCwU3Csbdhs2bxldGtTf72BKrlb0+PrdF88c58Rg7xnWMjaFEldNrbrhAP2Am3D1W
         RNtw==
X-Gm-Message-State: AOAM53250Cke1zojy6IkZsNNjlDMUGMkV73BOO+1chvfj2Kyrury7wFS
	M/tBDR87tYOEzSXWI7q/793KM981FS5xsWZ1I2Q=
X-Google-Smtp-Source: ABdhPJz/iJbO1+nGINTuz8kFu1jMtHs4zerb1uteu5ERhzJm1QbC8Dwd/Dv4EFWPHaHVIu7q2TjJ3GL4VMz7W4JsHG8=
X-Received: by 2002:a05:6638:614:: with SMTP id g20mr2722369jar.135.1625201153073;
 Thu, 01 Jul 2021 21:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210701141011.785641-1-anthony.perard@citrix.com> <20210701141011.785641-32-anthony.perard@citrix.com>
In-Reply-To: <20210701141011.785641-32-anthony.perard@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jul 2021 14:45:27 +1000
Message-ID: <CAKmqyKOAw3qWw=moLLeqE5EoehBBLeJMuV+7t3Vn0QiMMA16Gg@mail.gmail.com>
Subject: Re: [XEN PATCH v6 31/31] build,riscv: tell the build system about riscv64/head.S
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 12:22 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> This allows to `make arch/riscv/riscv64/head.o`.
>
> Example of rune on a fresh copy of the repository:
>     make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- KBUILD_DEFCONFIG=tiny64_defconfig arch/riscv/riscv64/head.o
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/riscv64/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 xen/arch/riscv/riscv64/Makefile
>
> diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
> new file mode 100644
> index 000000000000..15a4a65f6615
> --- /dev/null
> +++ b/xen/arch/riscv/riscv64/Makefile
> @@ -0,0 +1 @@
> +extra-y += head.o
> --
> Anthony PERARD
>
>

