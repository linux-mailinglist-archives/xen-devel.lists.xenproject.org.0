Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDF21C49E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 16:12:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juGDv-00025l-9r; Sat, 11 Jul 2020 14:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MSc6=AW=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1juGDt-00025g-Ju
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2020 14:11:25 +0000
X-Inumbo-ID: 67899120-c380-11ea-bca7-bc764e2007e4
Received: from mail-oo1-xc34.google.com (unknown [2607:f8b0:4864:20::c34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67899120-c380-11ea-bca7-bc764e2007e4;
 Sat, 11 Jul 2020 14:11:25 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id a9so1537064oof.12
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2020 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yzLl2PgbI1FNgby9NDzTcsup/gjp2Uex/YQuS8VmxYU=;
 b=qM2wRNus0twBuJctyCrhetAiA4H4O4PAUSsppX2YFQjOSiMUK3kMPVEhKqZQZF4g55
 DLBzmmcC8kLbOMDUTqN++GqlT6pM/Mb/7XridGwQkzYUGvCLjjCH0gy4HxgtLxe79P8c
 B18fyTtOpy+52VVatjOgMHPBmoC+4DTRyIU1gfxYUGlzABbyQgizczkL8X1hiKHYqdYF
 +YmgiVVjQBBs507FU9zEFxKTUDSFt6mVOFDt2jmNNia2RW2pcAK2Fj5Hp8CA9vsacnM1
 knv5h8ZfRwOFFyzCR3M0YnHn47bLPxC6H0YJA22vxBzeiaDsjj9wMk8xE0kzfGut8R1t
 g2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzLl2PgbI1FNgby9NDzTcsup/gjp2Uex/YQuS8VmxYU=;
 b=joK06mwv+yd+PnwhnDwNlpm1UhaBcMAjaTIrPwqHM6aPHTSouoGP+66l0Dgi58apTT
 AhTQhNGGmhsp4NV0OxdZgevSV6roVTM7irX1ziY7ZAwYn7sJe/jI6uqjYow7kLjOQFA/
 dwQ0YkThKULA47CpFfwsivNIvmLFR6oqQmgasVvBPbyRSckQNOCfuI9sRvWGd4EFMsd8
 Dhj/fgObxovLbJd6rSue4Heqhb1vT4gRUHhyzH2pv1P6bHrFZdtzxPNG4ANTBIm5jUg6
 7y+xKdnIFNtUpbhMhs6AIn4szH3F73RT3oMaFmtREk90nfOX9T2eTPagATXIcAgW8qxJ
 VPoA==
X-Gm-Message-State: AOAM532vYSswLTROT92dtoPr89XHNziEWz/ISXtPNmaCH6mYBg901jH4
 3f7xBZ8OsKpAXe7hDbyURrz2wTCnvPy0OLQP45uwvd7D
X-Google-Smtp-Source: ABdhPJzcy6k5v3Yt8/825njvJvXCdsdLtrZUgpv74mVPfIjDgfyzHYzYagTuYX8ycfvp2QWcSD74nWhxOdboT6Ly/mo=
X-Received: by 2002:a4a:9653:: with SMTP id r19mr41397241ooi.85.1594476684538; 
 Sat, 11 Jul 2020 07:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200710131145.589476-1-anthony.perard@citrix.com>
In-Reply-To: <20200710131145.589476-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Jul 2020 15:11:13 +0100
Message-ID: <CAFEAcA__qp9jrvdw7Zt6_y_Z9NjEtn+5arsds9cWpoWF=doYSA@mail.gmail.com>
Subject: Re: [PULL 0/2] xen queue 2020-07-10
To: Anthony PERARD <anthony.perard@citrix.com>
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 10 Jul 2020 at 14:11, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> The following changes since commit b6d7e9b66f59ca6ebc6e9b830cd5e7bf849d31cf:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/tracing-pull-request' into staging (2020-07-10 09:01:28 +0100)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200710
>
> for you to fetch changes up to dd29b5c30cd2a13f8c12376a8de84cb090c338bf:
>
>   xen: cleanup unrealized flash devices (2020-07-10 13:49:16 +0100)
>
> ----------------------------------------------------------------
> xen patches
>
> Fixes following harden checks in qdev.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

