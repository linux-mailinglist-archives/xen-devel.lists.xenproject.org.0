Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B35391D43
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 18:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132645.247345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llweO-0001Ay-B9; Wed, 26 May 2021 16:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132645.247345; Wed, 26 May 2021 16:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llweO-000194-7y; Wed, 26 May 2021 16:44:56 +0000
Received: by outflank-mailman (input) for mailman id 132645;
 Wed, 26 May 2021 16:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqRz=KV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1llweM-00018u-PB
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 16:44:54 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d084766-a88d-4c71-b77a-decb12bf3ab9;
 Wed, 26 May 2021 16:44:53 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a5so2816471lfm.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 May 2021 09:44:53 -0700 (PDT)
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
X-Inumbo-ID: 8d084766-a88d-4c71-b77a-decb12bf3ab9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l7a8ebK5xXDBzz85eTvWQtSsDhN/B+UPY91CR7nbAek=;
        b=jbMVmxWNjO4SR9rmXolvcNvb5t5FZL5P9dz+foLPSZGJg3CX6fNDG7dNOt1sXd2Cdm
         BANKoh/1PXo+PZO9FYW6TWAM2uiY1Yqae2GBUnoUwWkF9yyz0L7Oel5TIBlncFlgn25C
         DsjbEEoLw1B11LMYMwRMqoz7ROaXeo/1+VV51nViWmNAUSpc2hNGVbMb3wazloIsEujj
         ZxutNdhsnFzxfuzC4ieFgQaDGiUtLvYaAnNj//QHjoZYAAku27L4l7mB6DIfjM/x/4xn
         dWz1z0GuGSP46Iaj2rFhb1KX80QEGfyiGkNBD7uMv1Pl49qVIfSq6WHClSTOHuPVhFcv
         0a1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7a8ebK5xXDBzz85eTvWQtSsDhN/B+UPY91CR7nbAek=;
        b=RhMLDV8Qh6s/e6yHPYxR6mLQU5KH6FuNukyKbwZKMsiE3tn8NPr6R5pYlXcBA5ct0u
         xumFtzPONrBCrO/PSs5DE67tpULcZDpFiNu9LC+eAGkmGAiEnh8tjrZSGw/ai1pwUi7U
         FJfBD2iq1bjlCxE8L8teX4T/q63GWxzJV+Lx6M3dbcIQsgNvcXa4qPZkECglYgzP5mjx
         WAz6Lbz7OUDoM0cgZ4m+I/wNr0Gf7/jxrOZWn79IhvO1zVMHKsMqbdGinuTdXJHpyL5w
         WHXhyzvlILwsfnNyqhpIBLZTOmmVQYodU1YNsbT7eJpygz0rkZz/rjT1Bc/fthYb1Uhm
         /uaA==
X-Gm-Message-State: AOAM531b1+nUp1qgaUA/7+udKoDJ9CQoZl9ba+XNtKIFUP9YuDc1N3kH
	kteCAC839sfe69xFTuunyzVHCZ7BwzBQTxFgw7I=
X-Google-Smtp-Source: ABdhPJwLLldtbvjR8nVWso7kqTUf/b6wd/+b9K6ktzHe9O7K1/jEPBXtoK18HfeeUh1t2PyUxEBvm0P7SlqIWcMiC7w=
X-Received: by 2002:a05:6512:38cd:: with SMTP id p13mr2612709lft.419.1622047492718;
 Wed, 26 May 2021 09:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-2-jandryuk@gmail.com>
 <927b886a-9b0c-2162-763b-9c2147227b8c@suse.com> <CAKf6xptZ=tHUUX+NXMfUPz_=wJJz6_FbEG6BraXRgcRokK5bcg@mail.gmail.com>
 <0701d667-b8f6-5691-5a40-e0e8eff0debb@suse.com>
In-Reply-To: <0701d667-b8f6-5691-5a40-e0e8eff0debb@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 May 2021 12:44:41 -0400
Message-ID: <CAKf6xpsY-ER=i4-Ubf8oJFyCQJx=oj011mKhBCHMktz+y6s=hA@mail.gmail.com>
Subject: Re: [PATCH 01/13] cpufreq: Allow restricting to internal governors only
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 11:09 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.05.2021 16:12, Jason Andryuk wrote:
> > On Wed, May 26, 2021 at 9:18 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> Sorry, all quite nit-like remarks, but still ...
> >
> > It's fine.  Would a design session be useful to discuss hwp?
>
> Is there anything beyond patch review that's necessary there? I'm
> also not really set up to usefully join design sessions, I'm afraid.

It's not necessary, but I figured I'd offer since Xen Summit is going on.

The part where it might be useful is the hypercall interface.  I
basically exposed all the MSR configuration.  I couldn't think of a
useful abstraction, and this way the full range of configuration is
available.  Additionally, there are some convenience presets to make
it a little more user friendly.

Thank you for reviewing.

Regards,
Jason

