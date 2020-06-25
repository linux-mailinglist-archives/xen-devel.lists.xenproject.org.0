Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84320A0B3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 16:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joSgI-0007hr-2L; Thu, 25 Jun 2020 14:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVq+=AG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1joSgG-0007hm-Tp
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 14:16:45 +0000
X-Inumbo-ID: 7ebeb67a-b6ee-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ebeb67a-b6ee-11ea-bb8b-bc764e2007e4;
 Thu, 25 Jun 2020 14:16:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 9so6705973ljv.5
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/9t7dRTd26Cj0mD+rcWjzqKsb1g6xpQenNsIlbETbYA=;
 b=Yl4IOKZNey4JdB2Y+sia7EKy48PihvaxkjN2VOQqsGrb9F4OsoqujtUdZe0vK8y7Gw
 cADh/kfNFWKeYEAWOjImd3kBmXf8zkD9VHr0QxoArr3ZvKdXexlDUB0u6lrErpD4HIEX
 81rUsSkAtfE1OVeES0Qdr3/X9vs+2p2s4P+qggIf57tzfrrWyqKzYVWMRhKsw1vtfnAm
 60gNG+MghxE+vZHOjSbLVEFP2LCkg6InwmUDuSOVM6T9devy7KAjkIYdQpmNA9S+vea/
 6rN0x55vcPHMDL98aQamFdpqMRBwZa0t099YEz9Yw6koOCfSToJJB4/deOxSOc3BptXD
 pTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9t7dRTd26Cj0mD+rcWjzqKsb1g6xpQenNsIlbETbYA=;
 b=kaz72DtQ/jPmqn8LeuncQMaDiWqbA8MNs3DNGlloR88VPBXRGOTA63bbmVcHDa4vHa
 aqCMKKMkaWx/2OVkq6eCf31bmRYynD82l9BpK8GVejHA8EUyZs5mbY0XU6EYQQ7wsqAI
 sH09YCd2fAcjHohGfV8e0pHcNCMOlqZeUeQBW6UNKVM/+zuWJ7qw36oc+J8uWXMNPocJ
 I5NQbSVqo+2Z2+lRkb5jnctzhwGdYLv8Spn/7a85EjyqraT9M2Sz6mk9pHljGZE+SJMD
 eMw9f6OWNcweR/WxDCIqNu6wln3u8/UwC1yU7i6xloDfFqy0KHvib1A9d/8JLSJBF5X6
 FlcQ==
X-Gm-Message-State: AOAM532xbvscvGIXhbB2CaWJRARsueK/LZ/ZwJEQIZSz27ZF/BV/77MT
 +r6Mx8WVsF/uHWvZzCeKirUPnXwfa3zhQ7ercSM=
X-Google-Smtp-Source: ABdhPJwCJniiKhezzR7ZTc+wMlYcH7mWg7EZRBm3g7B8IQnEZSdk4AF5GbINFUg2+Mbx5GoF4cXpFlFl8i2YMneDqzE=
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr17958993ljp.368.1593094602877; 
 Thu, 25 Jun 2020 07:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
 <20200512225458.GA1530@mattapan.m5p.com>
 <24253.9543.974853.499775@mariner.uk.xensource.com>
 <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
 <24307.32018.502303.817846@mariner.uk.xensource.com>
 <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
 <6cd9c568-84b9-8304-d56f-99d628d945a1@suse.com>
 <24308.42811.393047.88416@mariner.uk.xensource.com>
 <810ea6c8-1ae4-3ecc-3559-fde819f366fe@suse.com>
In-Reply-To: <810ea6c8-1ae4-3ecc-3559-fde819f366fe@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 25 Jun 2020 10:16:29 -0400
Message-ID: <CAKf6xptOma_Xg4=iQ57uLqmmsXabcjEUaiVLQL886Tu+Q_naEw@mail.gmail.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 25, 2020 at 9:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.06.2020 15:31, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [XEN RFC for-4.14] Re: use of "stat -""):
> >> Looking at vfs_statx() in the kernel, I can't see any provisions to
> >> get at the data without traversing the specified path.
> >
> > The question is what "traversing the path" means.
> >
> > How do you explain this ?
> >
> > $ >t
> > $ exec 3>t
> > $ stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 421124
> > $ ll /dev/stdin <&3
> > lrwxrwxrwx 1 root root 15 Jun  7 02:01 /dev/stdin -> /proc/self/fd/0
> > $ ll /proc/self/fd/0 <&3
> > l-wx------ 1 ian ian 64 Jun 25 14:29 /proc/self/fd/0 -> /home/ian/t
> > $ mv t u
> > $ ll /proc/self/fd/0 <&3
> > l-wx------ 1 ian ian 64 Jun 25 14:29 /proc/self/fd/0 -> /home/ian/u
> > $ rm u
> > $ ll /proc/self/fd/0 <&3
> > l-wx------ 1 ian ian 64 Jun 25 14:29 /proc/self/fd/0 -> '/home/ian/u (deleted)'
> > $ stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 421124
> > $ ll -Li /dev/stdin <&3
> > 421124 -rw-rw-r-- 0 ian ian 0 Jun 25 14:28 /dev/stdin
> > $
> >
> > Clearly it isn't actually following this synthetic symlink to
> > "/home/ian/u (deleted)".
>
> Okay, so there's clearly some trickery then which don't know where
> to find.

I can't say I've taken the time to read and understand all this, but
the code in here
https://elixir.bootlin.com/linux/latest/source/fs/proc/fd.c#L147 seems
to lookup FDs to existing structs.

-Jason

