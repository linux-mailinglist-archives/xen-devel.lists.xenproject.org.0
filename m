Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF34516897
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 00:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318520.538328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlHls-0005zo-J8; Sun, 01 May 2022 22:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318520.538328; Sun, 01 May 2022 22:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlHls-0005wv-Fq; Sun, 01 May 2022 22:10:28 +0000
Received: by outflank-mailman (input) for mailman id 318520;
 Sun, 01 May 2022 22:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIdX=VJ=linaro.org=linus.walleij@srs-se1.protection.inumbo.net>)
 id 1nlHlq-0005wp-P3
 for xen-devel@lists.xenproject.org; Sun, 01 May 2022 22:10:26 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc032a1-c99b-11ec-a405-831a346695d4;
 Mon, 02 May 2022 00:10:25 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebf4b91212so131986067b3.8
 for <xen-devel@lists.xenproject.org>; Sun, 01 May 2022 15:10:25 -0700 (PDT)
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
X-Inumbo-ID: 7fc032a1-c99b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8WXuaqzf5H6JbTMCrSNoDEe2cTNFwsekkVTcYWtQXX8=;
        b=NIMD1MgHFUA8qDcBtlkRUl6QwAMsrYm2LFtmvl8/1tnPPHxRUpA1yQ5LUAYctdi06T
         TOsD/Pv8VDI71Se+5p7Pej/mhD4qgf+k14w13KqKouOzghHkUgz02mr9ht1C5Q+AQUuh
         0KviUgNPzfaZP4wqvtLikTYkYLlECRohNbsEu9h/EpakyyZgJrAzbiZa3kK32wRWZAP8
         v8ZanNeCIK/+zl9E9gG5DRVG3Hrx7mW8dweXwuLE07vm1+xVHs5Z+8j39wJwgxAr3TB0
         sIVDxA8IhVVZXSJeGhmsZmd4DHlgLnJXoULjO7WRPuijicppJaGPBhttKcLNbK4Ul/z4
         EqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8WXuaqzf5H6JbTMCrSNoDEe2cTNFwsekkVTcYWtQXX8=;
        b=Nz/Clw8R4CQOsuRAwwUQThWjQ0g7B9dtkKJu28X0Lj4sSz6BzFdSWXOrr98mtOqf0C
         jrOxtVk9EmNGYIFCumSpPqm2GUZlGV1ejp1xcysmHVCjeVPLrKVIeI8/0Dzl7N4aSp2H
         hiYDQcVlHUXIXvagvi93PPPY4V2AWxs5RkmTiecOaxxFFDQc2EauIg6lNsUkwHVTmSV7
         gLQ4P7s68pNXe6vofyc03a5PcgzJ6wxbIbt3ia9bblCLQyoKThd/HXgcflDDO2yjLxc2
         2rVjjqaGVtr69q7+IJIK1qKtXZrfl9SedqXtlL5Nn+lHWNe0RcuczEAIlM8NHkXMAgHg
         JDIA==
X-Gm-Message-State: AOAM532vKpkOHRmLOJdCFzjXBzGUTmksMNo+pBY7SuxQPJiDiRWeSfUw
	jFwXXkMXoT6srk4EYyl3tF3eX4padDAIJHj2GbzZww==
X-Google-Smtp-Source: ABdhPJwVRMVN6PYWPNDrbRGkbqET+tO2dajvHrcjRYlUisQxn4zRaAT7N9xEe7+WAUzHysUVA7VWrMEEZM+qWd2jZ7k=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr9302689ywh.126.1651443023815; Sun, 01
 May 2022 15:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220427154111.529975-1-kuba@kernel.org> <20220427154111.529975-2-kuba@kernel.org>
In-Reply-To: <20220427154111.529975-2-kuba@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 May 2022 00:10:12 +0200
Message-ID: <CACRpkdYOrUkVCW6Bq2V0wkk+2AEP3tkw18m4ra83Gn29knxhYA@mail.gmail.com>
Subject: Re: [PATCH net-next 01/14] eth: remove copies of the NAPI_POLL_WEIGHT define
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, pabeni@redhat.com, netdev@vger.kernel.org, 
	ulli.kroll@googlemail.com, mlindner@marvell.com, stephen@networkplumber.org, 
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com, grygorii.strashko@ti.com, 
	wei.liu@kernel.org, paul@xen.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-omap@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 5:41 PM Jakub Kicinski <kuba@kernel.org> wrote:

> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
>
> Drop the special defines in a bunch of drivers where the
> removal is relatively simple so grouping into one patch
> does not impact reviewability.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: ulli.kroll@googlemail.com
> CC: linus.walleij@linaro.org
> CC: mlindner@marvell.com
> CC: stephen@networkplumber.org
> CC: nbd@nbd.name
> CC: john@phrozen.org
> CC: sean.wang@mediatek.com
> CC: Mark-MC.Lee@mediatek.com
> CC: matthias.bgg@gmail.com
> CC: grygorii.strashko@ti.com
> CC: wei.liu@kernel.org
> CC: paul@xen.org
> CC: prabhakar.mahadev-lad.rj@bp.renesas.com
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
> CC: linux-omap@vger.kernel.org
> CC: xen-devel@lists.xenproject.org

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

