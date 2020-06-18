Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75F1FF05B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:15:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlsW4-0008Vz-Ql; Thu, 18 Jun 2020 11:15:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gG4j=77=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jlsW3-0008Vu-FQ
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:15:31 +0000
X-Inumbo-ID: 05437ec8-b155-11ea-b7bb-bc764e2007e4
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05437ec8-b155-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 11:15:30 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id e5so4190160ote.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lfy+bP/6vJ3x/eThUcFMoD17ZCsLCF7U1giHYoTwtA4=;
 b=sUxznxSmchgqY2f5sYqi6xE3YfX14kI/Ag2KwH8ycZkmBoba3F+gzNOyDL+AkZm30b
 V8WrWBPR4W/AGEaGYd7o1M6CPMRS2iJi3GtlWVZdXcIl0DWvyY1w/qkhWIesrNYeva5x
 gmWhJY8Ho6jcQzf1jUHNhipod6sf0QKr/cPxpRxIVL1opWWcd8a+0+cx4Ny4zvpqUnfa
 iTt/HYuR4puUSdP0McH5kvLUdq3Fl50h18gSkxhUDa8jfYEnYaXVLeGdsJGXAHu1e7WX
 TkFo/sKLgUAf5ZMPUq79VtLepytd05CLpn7dWwwvmdNT9Zax52uL2iwrKlK8K+SgLUc2
 f/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lfy+bP/6vJ3x/eThUcFMoD17ZCsLCF7U1giHYoTwtA4=;
 b=eBcraZ+Trk9eQ8fLCks/j4yB/tMl+bI8sfrAOOHCM3SteeNLg5ml958iHvcNHBn1N4
 TjLkQmtp4wk+oSBjnd07TOEN8VzPjiDyvHsOFNwbBAqluoh8LtisWFJsPx5qhjjsgK8o
 DzinjxFBytQx434VGERN8mVO9772H9KWdz1H6zcDl63vc8f5OhFECC8O+w+Y+e3tWPRO
 z221s3Ex/ubr6FSDJMoLl3rprbKhH9xyYgRQ7yECBSAbo02bQpet6eGiM4Bk4c1UqPCk
 s0uxy60ln/44LCEAuiSRmrpLn/2yAgSVftGf9I3ynx8NYNC9853P3hJ1JQK4VfkdPvf8
 miUg==
X-Gm-Message-State: AOAM531E/zxoee055eweqjzp6IFiGWv8s3sMAKHnKkIDTUH4R9Y9gO2D
 /21yeT1VgfdccjaaZ68uVhURfJ7HydEstZcZJ8w03Q==
X-Google-Smtp-Source: ABdhPJy48JqtekoXt/q251dx9kp7Qx2YkwKld0xXxO1OsCMccwd06f7lZhP3D9H98GxoL52m/6CA5MxkhAk5hJKdiyk=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr2919781oto.91.1592478930363; 
 Thu, 18 Jun 2020 04:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200617122901.13327-1-kraxel@redhat.com>
In-Reply-To: <20200617122901.13327-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:15:19 +0100
Message-ID: <CAFEAcA8KhmoSsXBPOJAu6upNiQc5H26OeP=Hm1fNtS5c-We5=Q@mail.gmail.com>
Subject: Re: [PULL 0/4] Microvm 20200617 patches
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 17 Jun 2020 at 13:33, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 5c24bce3056ff209a1ecc50ff4b7e65b85ad8e74:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-plugin-160620-2' into staging (2020-06-16 14:57:15 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/microvm-20200617-pull-request
>
> for you to fetch changes up to c8b473594b8fbba169a6ea950493a3015d15a18d:
>
>   microvm: move virtio base to 0xfeb00000 (2020-06-17 14:24:28 +0200)
>
> ----------------------------------------------------------------
> microvm: memory config tweaks
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

