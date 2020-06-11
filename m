Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163841F5FF2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 04:21:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjCow-0001Ps-US; Thu, 11 Jun 2020 02:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EiPr=7Y=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jjCov-0001Pn-QY
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 02:19:57 +0000
X-Inumbo-ID: 0b68be7e-ab8a-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b68be7e-ab8a-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 02:19:57 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id g62so3522782qtd.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HZna+dvbx6XbLhq6c1A4NTyxG9xhwm8M/vKDqUdnlKM=;
 b=G4zcufPWuKf8GJhsLpA5hHr7cfQXQOD86Nuk29yETP0LaD5RtcnGr5Z5jWI8gU4/c/
 ZfSX3V8RmfTa7e6Apr/5IFA7gdx96oDjynEeYKEAT01EkWImYrWWmZ4cyiYQ7s32hNBX
 u/sXVhb+yLrjAZoi+B/o0zTE3JUWePA45v5MIHhuF0eSjQecnx9sMKp9/NFLI2VDlLR+
 ZkyESiBJ2cJw1vssPbxw8EmaMSMeAzDURcHmg8ZVO7hvjSa4vdjr6RX5xaH6YxxkQN/Z
 8EDpecwFF42giWDAq6o5QiZLcy/q4xw+4rHxZt3AjJ+BNFQEAQVQz4ZePvGgd64P1V7G
 dCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZna+dvbx6XbLhq6c1A4NTyxG9xhwm8M/vKDqUdnlKM=;
 b=cXEiuzM3DeRv+zPwsLQrFemz29atlGmAuiuRsIgg0zH+G23QKr6+wxu/czLF4oF0Mi
 EmRBdl+GMq3MJCQk3mu1w0LEa7PGJXdaSxwThbskTw1UCW0n6dJzNv+fxt70zeXDSTJ2
 MmtOL6xIVNET0pbDQPd3WjXaEJ/3dswZff6kM6+ODuT5ozFIb2IyxE+PykMlV95XMbO5
 9TE/SoGSieeIpHZGFkJpiQEYtFTY2u0aQnoeJZaSZGE7on/D8fZ9rAWEGQFE4AVRDcgY
 NjIfz31OG0thD2CUydQXYzNFGol994sc8N1z//CkDWi+Ftxg0X2di6DwR7h0eAl4d70F
 BBOQ==
X-Gm-Message-State: AOAM533bZZ+yjpEVVVlbkLtqCXbrseRlAbGKVU6MhDFPq4pLogyaOezo
 6HZVVBjmPFiT7S5nz5BNaRO07fAMSsCQ1NgPH/ixQw==
X-Google-Smtp-Source: ABdhPJxc5PRydCAbLvgTyZYGhh1SRbhlxTpM9Xh/WhWqqhZYJMw4hKBofLcsc83+OnJT+O4FBu7v3Aq3Q6Bs7ateOfM=
X-Received: by 2002:ac8:40dc:: with SMTP id f28mr4113698qtm.63.1591841997045; 
 Wed, 10 Jun 2020 19:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200610185415.GG7231@minyard.net>
In-Reply-To: <20200610185415.GG7231@minyard.net>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 10 Jun 2020 19:19:45 -0700
Message-ID: <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
To: Corey Minyard <cminyard@mvista.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 tamas@tklengyel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
>
> I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> existing sd cards, and this was working fine.  I finally got to a full
> yocto build of the system, and it didn't boot.
>
> In fact, Xen didn't print anything at all, and nothing happens that
> might suggest it's booting without any console output.
>
> I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> else the same, the 4.19 version of that overlay works, and the 5.4
> version does not work.  It also didn't work if I completely removed the
> overlay.  The base device trees are the same between the two kernels.
>
> Looking at the overlay changes between the versions and Xen source, I
> can't trace down anything that would cause an issue.  Has anyone seen
> this issue of have any ideas?

FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
    https://github.com/raspberrypi/linux/tree/rpi-5.6.y

The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).

Thanks,
Roman.

