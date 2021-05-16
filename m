Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B53821D3
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 00:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128010.240409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liPZ9-0006fJ-O7; Sun, 16 May 2021 22:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128010.240409; Sun, 16 May 2021 22:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liPZ9-0006cX-LA; Sun, 16 May 2021 22:48:55 +0000
Received: by outflank-mailman (input) for mailman id 128010;
 Sun, 16 May 2021 22:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0Ii=KL=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1liPZ7-0006cR-Bs
 for xen-devel@lists.xenproject.org; Sun, 16 May 2021 22:48:53 +0000
Received: from mail-il1-x136.google.com (unknown [2607:f8b0:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940f7ca9-406d-402b-9956-7580411b36ec;
 Sun, 16 May 2021 22:48:52 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id h15so1657379ilr.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 May 2021 15:48:52 -0700 (PDT)
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
X-Inumbo-ID: 940f7ca9-406d-402b-9956-7580411b36ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=813jZWrJgwbGDM0rg0Twntty63F/whIPr9Jlee3RRDM=;
        b=HxmJu5ODXps9H/4Ys9/o0JMv1ptdEQavDzq69ub4+09awhcuOkqx7pwyRQLF7Rgry1
         d799ZuSqo1qZf5jS/LPmfIgcYJZQkMl5Bsa1BWLaI+GmICA2bBUYIlA6JbN7j3hLji7a
         W7/O9pSmZQKYeQn4BKN4vG/AXFXM7Q7NwWVyNRcOHjBjTulBvBfFXTABJEh6N5MzuLFB
         /6J8PBUszVonYsnpAZBeE63aBa2jc5wZRXQWHJckzOs2iTrIIcFnm5vaBV4ZyAthkL9z
         4Fi7rX9tU5dUXlk+SWEl+BobNP1QZv+v5v0OcgdB+xNSI9ukke/O/cuWastxU3VG2FiS
         iEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=813jZWrJgwbGDM0rg0Twntty63F/whIPr9Jlee3RRDM=;
        b=YDwSM4S6yNaQaH9hP/2UZ7WDi7Y5OG+sI8WI8MzNFy/HbpiT2n8nrInetLlNU1zILf
         M1qvePBvKrvLcyKVvJd1Uv8lM9nGOKZmVx23+vpTtTrgdj0goF8pw4i3ziDo2/7Nx5tj
         I8GusyaZVyXLckj3E74NnbdCUisXg4mAMOebwaDM1imB773rW9bLGi3eBO63iU7Bachb
         avwIaZ2NzvdS+yc+bX1cd7uONijyWELl6txdbwjeTGN6fytYhjCViyudNzfTl03yKPj+
         i8ZT3RR2nlHU5cKgVpifoHEbo1AwsndkXdwW4XXl8oTiGbq9/u9c4BkPmY8LTWNju4AW
         ojjA==
X-Gm-Message-State: AOAM53196mq9yKBzTrTVoWwZLZARDyJRCjrH/R97FxIxbjXJVlDw8UwZ
	FXmrOz7mE76KdhQdLI7qBEcLx5xiqsuk58A1wO4=
X-Google-Smtp-Source: ABdhPJyPduUHLxtCBHpDMk77p3AQ1w9SH4eWFdPTzFlOW4bkdGpkWY8Kiu4hsYsKEmNK0o5O4dPM92AF02FwlLCYGsc=
X-Received: by 2002:a05:6e02:eac:: with SMTP id u12mr50967693ilj.177.1621205332119;
 Sun, 16 May 2021 15:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621017334.git.connojdavis@gmail.com> <3960a676376e0163d97ac02f968966cdfaccbf75.1621017334.git.connojdavis@gmail.com>
In-Reply-To: <3960a676376e0163d97ac02f968966cdfaccbf75.1621017334.git.connojdavis@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 May 2021 08:48:26 +1000
Message-ID: <CAKmqyKPKU6-P5yrkNG4upCEjOZUngF8QrfZs4Q0mBYyKRsuPqw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Connor Davis <connojdavis@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, 
	Bobby Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 15, 2021 at 4:54 AM Connor Davis <connojdavis@gmail.com> wrote:
>
> Defaulting to yes only for X86 and ARM reduces the requirements
> for a minimal build when porting new architectures.
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/drivers/char/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index b572305657..b15b0c8d6a 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -1,6 +1,6 @@
>  config HAS_NS16550
>         bool "NS16550 UART driver" if ARM
> -       default y
> +       default y if (ARM || X86)
>         help
>           This selects the 16550-series UART support. For most systems, say Y.
>
> --
> 2.31.1
>

