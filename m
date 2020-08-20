Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29C24B7AC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:02:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8iLH-0007a4-2P; Thu, 20 Aug 2020 11:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4RSJ=B6=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1k8iLG-0007Zv-74
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:02:46 +0000
X-Inumbo-ID: 90a2eb07-8fba-475c-b02b-116862d3b3c7
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90a2eb07-8fba-475c-b02b-116862d3b3c7;
 Thu, 20 Aug 2020 11:02:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p20so1636027wrf.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XE6Gq1mZO7mZoivJyY+LGN392tpD4hCYS1oZJHwiQXg=;
 b=kDUG+QDF5IeSmWujXXRLoFo6x1Y2XE/OjI9364DtS3RmXh2ZQ1wPVrDLVURBYPTFXP
 btbpa0BVe+g9d5+L3kZW512WSJ1r2WU+ar3o716rPejXhWhfc76zK+NUO/X51iuTNBxO
 XwXmPWy29zNtmvLR9nT+sm2GzaBlPlG5UvUJhz8nYjZdJ5wi1W5JiXKnVY+hnthwB9m3
 xew9naIgb3VWlAPZhU0jOZGyDsnQDWG1RsNEnOhSmSKDF3+qp4BLLp5+aPs6Y//SUjGu
 xd59CzsmKNgYo/VFShlQtZ3T+ejKGt9t8RVR49dhb0GKS+9qgCDo+w3GiHGSzUVTHMCe
 cARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XE6Gq1mZO7mZoivJyY+LGN392tpD4hCYS1oZJHwiQXg=;
 b=DmBtxAydwSS7WsHxs4rtyQDwzNTyBZL8/ZleOCpsVdv+ieOLTERzw4FFvPuV5+rJda
 uKDG3JQeHc2g8bFA0izWMHecZpqkeo/6XfAoPlx6XGDMKVKLb6yTIxoya8zhU1WChp0l
 hJ9h3ASB6LTpluLpYq+0VI87Pynlcf1zZORDd12FqUQfvAcTa0OCDNMqWkSZsO2qKWnA
 ZoFNMiB1ecWHpOdtXlWyLtAWnosx3QDGBeFZdiwLtZaDtJcmUWyCpRU+8RVpF9M/0x11
 PbVnQ4lnnin0tmxujgMul8bfnXjeiGt/DcV0eMBTPkFmV6RmZ0u2L2sKG7rAluAwRb5l
 gCIA==
X-Gm-Message-State: AOAM53109KfAkTca+IUTSb37fs9tm4N0dVCeqcmDufqGp7jmV0VUfJrc
 0EPi1ekU4cY23f0qXnuEDWgWwNNzza7CsXDm5BI=
X-Google-Smtp-Source: ABdhPJzf7aaYw4w5oGfQjit6LcnJq37zT/EeAWXfEioHazh79D800++rP3BeASB52htgs1Mw2U/VwuEVaKAybJOb1E4=
X-Received: by 2002:adf:a287:: with SMTP id s7mr2879754wra.103.1597921364605; 
 Thu, 20 Aug 2020 04:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-iXTF3F05+RH=ttOhwpOfcngfPY_bAp73fYprxg__QB+fD2w@mail.gmail.com>
 <62cabf58-b889-4f60-8065-634db3eaea66@xen.org>
In-Reply-To: <62cabf58-b889-4f60-8065-634db3eaea66@xen.org>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 20 Aug 2020 12:02:33 +0100
Message-ID: <CAJ=z9a0g2Ygv+ehVdiHAAJne64mQOMECOnonca502H7YfMehMA@mail.gmail.com>
Subject: Re: About VIRTIO support on Xen
To: Jedi Chen <jedix81@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Bertrand Marquis <Bertrand.Marquis@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 20 Aug 2020 at 11:59, Julien Grall <julien@xen.org> wrote:
>
>
>
> On 20/08/2020 05:45, Jedi Chen wrote:
> > Hi xen-devel,
>
> Hi,
>
> >
> > I am very interesting about the VIRTIO on Xen. And from one meeting
> > report of AGL Virtualization Expert Group (EG-VIRT)
> > https://wiki.automotivelinux.org/eg-virt-meetings#pm_cest_meeting4, I
> > got the information that ARM and Linaro are
> > upstreaming XEN work incorporating VirtIO. But I can't find any
> > information in the mailing list. Is there any
> > architecture overview or design doc about it?
>
> There is some discussion on xen-devel [1] to add support for Virtio MMIO
> on Arm. This is still in early development, but you should be able to
> get a PoC setup with the work.
>
> Best regards,
>
> [1] <1596478888-23030-1-git-send-email-olekstysh@gmail.com>

Sorry I should have added a direct link:

https://lore.kernel.org/xen-devel/1596478888-23030-1-git-send-email-olekstysh@gmail.com/

>
> >
> > Thanks,
> >
> >
> >
>
>
>
> --
> Julien Grall

