Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E831D65E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86139.161349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCHwa-0001J7-QZ; Wed, 17 Feb 2021 08:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86139.161349; Wed, 17 Feb 2021 08:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCHwa-0001Ii-Ms; Wed, 17 Feb 2021 08:12:20 +0000
Received: by outflank-mailman (input) for mailman id 86139;
 Wed, 17 Feb 2021 08:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DxxK=HT=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lCHwZ-0001Id-Q6
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:12:19 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3a59a0a-b68a-40c0-8488-1526509153c7;
 Wed, 17 Feb 2021 08:12:17 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id c3so11340750qkj.11
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 00:12:17 -0800 (PST)
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
X-Inumbo-ID: e3a59a0a-b68a-40c0-8488-1526509153c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VTjdFI+DhbdiZu1W84z4/bry4Ozmd78oQz1jcG+yAz8=;
        b=axOw/BlkT6+Fgu929G7QhIJhl+AsLB9nEhtRfHwYvE2H5ceqtkinWuagD51jTVbVCR
         AKUe9tVsk9liOydGR2Fgtq9kcStxAsgXTKw1tM2P8UnKVx1dSM8QpbePiq48t99DXV0J
         YSx+kSv7UBur7zrkYkuNlHMNKMDHwNWPfoEz0LKR7t/5GvZP4RnMR3uH6yiNhxV6fIPN
         yADghDzeYgRTEXnHW55jKoTt+zhWNFK3m630+DKVkI8k0+3KeGu2z7JgICx7onRZd+OW
         4MuVpOXV9nyswuXcoTl5/xZp6kb/3s8ggCmvv+jllrOvP6+d+3DAMiN6JaBVGLXnxlnf
         wVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VTjdFI+DhbdiZu1W84z4/bry4Ozmd78oQz1jcG+yAz8=;
        b=ISTxfW2yT5mEJ9mrb0WhSIsFP8ibYQI4iYCjBMhZyJHBhTGB5k/zEIwV2lwfLcp+nk
         PLJ/WJmxRuTQSlSHmiKFWv8o9kOSsuvAHiaSwCux5RxY1nXae350swITOLGH0EA1Brzc
         58areGHI/PJ4dWY5lm/iUltr+gtZ1W2UtyKESgX0T9Q4ExMdguaDjXkzr9ggCmZkootC
         yXRt055QMVerHdZflwY0YS/MtD3e9e8ZVXQi3gBZseHqMlH2IKAevlZz8FSGjpzzF3MD
         +ubb+nBL3nP4c5PglqCzgY+9Z4wpKFgkWGNdC2Hczr8RrzgkjYm9qAZ0luqeNgzvkg6X
         yfsg==
X-Gm-Message-State: AOAM532woVIUQTbYTtOZFKuFMilcbFQYDWxwQJ64BmGbwnyQb/4gVR6I
	btoN3gwMHi7Hcjz4F0MXHJYVXjlu3bcyCv+igBBAvQ==
X-Google-Smtp-Source: ABdhPJyDPOkIN7B3Sy9stn/hUhmweh/Z4xG0/NMCd9Jaw3934wXaTtNnai8UHWvY6Xa6ZuqbUaxvst3ZymC3O68IUR4=
X-Received: by 2002:a37:d0b:: with SMTP id 11mr14688599qkn.267.1613549537469;
 Wed, 17 Feb 2021 00:12:17 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s> <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
In-Reply-To: <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 17 Feb 2021 00:12:07 -0800
Message-ID: <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=BCrgen, thanks for taking a look at this. A few comments below:

On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:
>
> On 16.02.21 21:34, Stefano Stabellini wrote:
> > + x86 maintainers
> >
> > It looks like the tlbflush is getting stuck?
>
> I have seen this case multiple times on customer systems now, but
> reproducing it reliably seems to be very hard.

It is reliably reproducible under my workload but it take a long time
(~3 days of the workload running in the lab).

> I suspected fifo events to be blamed, but just yesterday I've been
> informed of another case with fifo events disabled in the guest.
>
> One common pattern seems to be that up to now I have seen this effect
> only on systems with Intel Gold cpus. Can it be confirmed to be true
> in this case, too?

I am pretty sure mine isn't -- I can get you full CPU specs if that's usefu=
l.

> In case anybody has a reproducer (either in a guest or dom0) with a
> setup where a diagnostic kernel can be used, I'd be _very_ interested!

I can easily add things to Dom0 and DomU. Whether that will disrupt the
experiment is, of course, another matter. Still please let me know what
would be helpful to do.

Thanks,
Roman.

