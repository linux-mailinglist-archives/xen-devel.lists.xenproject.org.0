Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436F546DEA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 22:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346674.572564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzknt-0003Da-GS; Fri, 10 Jun 2022 20:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346674.572564; Fri, 10 Jun 2022 20:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzknt-0003AA-Ci; Fri, 10 Jun 2022 20:00:21 +0000
Received: by outflank-mailman (input) for mailman id 346674;
 Fri, 10 Jun 2022 20:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8JV=WR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nzkns-0003A4-9N
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 20:00:20 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a6e30a-e8f7-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 22:00:18 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id d19so230838lji.10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 13:00:18 -0700 (PDT)
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
X-Inumbo-ID: f3a6e30a-e8f7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ujDhRtw1GqfaFOiy5pTKfU1xZmqAMfX+H4865dSGPY8=;
        b=ltEWxWvQ76Z/Dzx7En5hEUnJGimFZUBC5s9Ypm9tybGMYOLaBSniFfytEh39DdHoQG
         vDpqC7RnudNBDoqFCJ9Cl1TlLhfrkLEHY6fMYf41Spp175HYS5unGJ6JvFy/GHFo2bHt
         s2CLbTakEIlv1HtDe8YiNV+IzLRxZt5xrj24JwRDI9t8GexF4V2dwGtzMfSi/6/4kDuN
         IDfzFxYvVtwVdQN5do5Hf28HQVPN2NVTP5uiXro6CLu8e6p4xJz4udOA9MXGAZdHpN1q
         0tjcZBN4/ANmbrfcfJrzhnP9f3CAiYy6CBJMCm3glz/nN9B3VJfV6WO8pFgj0OkMc+Yc
         dhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ujDhRtw1GqfaFOiy5pTKfU1xZmqAMfX+H4865dSGPY8=;
        b=xcApGfj8on4RhTCcYFMLUomOxgzwWWE3aL4JJcVqhxSjCfoW94Ex17iPNBWNZtg0SM
         uaTUGIvgBX94TbY57i/XqE0CVfvtKtNeKnkuxPgl2DX815ktbWmkwTeT1oKxqpWvTNj5
         nzLaCmV9WC2FdaKcakFDjCNv13I4xczjyXj9xWW1Dsb8fgKbgiQsoJStAMPpxz1bMlzU
         Ak++Yrtmy6gB/x1GCoyIkPikK4gm+qIuW7hTGT36jr5K6a5f9jEL63/K4kpAfUOjou4p
         2mQeP6BO+TKPrGVEEoeuX8wy38fE0H2Gn2vHcY9+PAPK11sYBzxNQgnWPiVoQjT54JQ3
         HjPA==
X-Gm-Message-State: AOAM533hX7a87zkTKe9r3dsgIkUOyF09Sn4NRn2t8N/V/VRgbyhRmNfD
	FjM70ISBbdaAg/P0TOP/3FhGj912og5kXP26A68=
X-Google-Smtp-Source: ABdhPJyt8BzadCeh3ZrTJo8xv/NZrEx4+QfjHpzhm6AsGAVJ2HZDL0B/RgKQtDVn9mixT2hWRo/NShjw69wmGQoYzd4=
X-Received: by 2002:a2e:9f52:0:b0:255:7897:58be with SMTP id
 v18-20020a2e9f52000000b00255789758bemr22117827ljk.15.1654891217926; Fri, 10
 Jun 2022 13:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220609185024.447922-1-mathieu.desnoyers@efficios.com> <20220609185024.447922-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20220609185024.447922-3-mathieu.desnoyers@efficios.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 10 Jun 2022 16:00:06 -0400
Message-ID: <CAKf6xpv3aBrzB=ds5jSd2MbFr=VePOMfJygos6E4cLegaizU0w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] grub-mkconfig linux_xen: Fix quadratic algorithm
 for sorting menu items
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: grub-devel@gnu.org, Daniel Kiper <dkiper@net-space.pl>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 9, 2022 at 2:50 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> The current implementation of the 20_linux_xen script implements its
> menu items sorting in bash with a quadratic algorithm, calling "sed",
> "sort", "head", and "grep" to compare versions between individual lines,
> which is annoyingly slow for kernel developers who can easily end up
> with 50-100 kernels in their boot partition.
>
> This fix is ported from the 10_linux script, which has a similar
> quadratic code pattern.
>
> [ Note: this is untested. I would be grateful if anyone with a Xen
>   environment could test it before it is merged. ]

Hi, Mathieu,

I tested by manually applying patch 2/5 on top of Fedora 36's
installed /etc/grub.d/20_linux_xen, and manually applying patch 1/5 to
/usr/share/grub/grub-mkconfig_lib.  It seems to generate grub.cfg
menuentry-ies in the correct order.

Note for patch 1/5, it's best practice to use "$@" with the double
quotes to prevent word splitting of arguments.  Doesn't really matter
for that function at this time though.

Regards,
Jason

