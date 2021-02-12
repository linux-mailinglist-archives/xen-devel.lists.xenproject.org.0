Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94A31A6FE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 22:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84452.158421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAgAT-00035O-Se; Fri, 12 Feb 2021 21:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84452.158421; Fri, 12 Feb 2021 21:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAgAT-00033Z-Od; Fri, 12 Feb 2021 21:40:01 +0000
Received: by outflank-mailman (input) for mailman id 84452;
 Fri, 12 Feb 2021 21:40:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EDRu=HO=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1lAgAS-00030H-KF
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 21:40:00 +0000
Received: from mail-il1-x12a.google.com (unknown [2607:f8b0:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ee7315b-b2e2-4b8f-bda5-5808c2261b31;
 Fri, 12 Feb 2021 21:39:59 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id g9so545072ilc.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Feb 2021 13:39:59 -0800 (PST)
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
X-Inumbo-ID: 7ee7315b-b2e2-4b8f-bda5-5808c2261b31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jp4CCHwWK240T1rzKA41Yn74M6YlFRWIOSQ6mAraccc=;
        b=RWzc+u5PJMONDFlBzkgnv9gzrcnhqfOiQi8SEexMjFuNfqDtxyTl7d3D+DU4N5rn8X
         dNqYO/cLgfTHOw/rxa920ZsS57PySmZH4/DD6nNdeEbBna1uKhu0c3bnCIFWHTKD1uSC
         7ys4Z250E3DdBz6ssIM8sihIfzgsE2CE4OGpXryRjoUSfBGSfIeJA8vBBlkukgO5I75v
         omdwytRj4y+Q7H2d6R5QrTLUMape5tPICR0gUqesni70IiM9wZeXQfvntglMCHhoFalm
         8VgR6hoHEJo/bk9ElYvXHl6Yua1fEKH3GnGN+UyZClvVWF+lIysi23UeOOVH3KKIVz9J
         j9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jp4CCHwWK240T1rzKA41Yn74M6YlFRWIOSQ6mAraccc=;
        b=ATvNcZhhrQzdmvazD7sS8zye2KzhewI0Xw5RblDDhkbwEiimzQ0otv3/o9YfMBSlbT
         kN3PfgMr5sdFjyNjc2rMONNgGhwGZHiPUKRVq3mly0OLFurDY3mmqa2hGduDj8vIh8qV
         2BVgdYPtOLPZV51cer/Ljd9ReIQygLh9AJ7p2lY7E7EeXkhMVTjGS2y8ImZZZGgIgUkJ
         cGCNSDZeDo1VvzE1d0mzVMPO/Sjzxtae07esuZiAbz2Bjvzn8tDo/SNaPvziut27IEoP
         DNHcyR1VDLsNK5gerWPxUzXLisyVrt7xtxtU58Ylgp+cpXdvYo66Nh4KOnmN7odLiQLJ
         +Sdg==
X-Gm-Message-State: AOAM533ZORG6dFfuF9I7SRGH2gCqt1y+fky+CdQ4uVVq+0RjQWhCFS2L
	ln2uDKU4/mZPL+SL2XlRLZZCbnuYtBpnAgdhPuQ=
X-Google-Smtp-Source: ABdhPJzSYfVvPhaNdhr6PllD44RL2BM6sEzXFDBlNJvKz9+9scpPbwgU89qj2yJK8Dpm+bOe9xIKp2iFVZnlOlkRWBk=
X-Received: by 2002:a92:d445:: with SMTP id r5mr3870130ilm.227.1613165999438;
 Fri, 12 Feb 2021 13:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20210211171945.18313-1-alex.bennee@linaro.org> <20210211171945.18313-7-alex.bennee@linaro.org>
In-Reply-To: <20210211171945.18313-7-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:39:18 -0800
Message-ID: <CAKmqyKM6JPDfk555+Dswn4V-hd-qqDPr+V-a31QeVJg=148iWQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] docs: add some documentation for the guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, julien@xen.org, andre.przywara@arm.com, 
	stefano.stabellini@linaro.org, 
	"open list:X86" <xen-devel@lists.xenproject.org>, stefano.stabellini@xilinx.com, 
	stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 9:20 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-7-alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> v2
>   - add docs and MAINTAINERS
> ---
>  docs/system/guest-loader.rst | 54 ++++++++++++++++++++++++++++++++++++
>  docs/system/index.rst        |  1 +
>  MAINTAINERS                  |  1 +
>  3 files changed, 56 insertions(+)
>  create mode 100644 docs/system/guest-loader.rst
>
> diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
> new file mode 100644
> index 0000000000..37d03cbd89
> --- /dev/null
> +++ b/docs/system/guest-loader.rst
> @@ -0,0 +1,54 @@
> +..
> +   Copyright (c) 2020, Linaro
> +
> +Guest Loader
> +------------
> +
> +The guest loader is similar to the `generic-loader` although it is
> +aimed at a particular use case of loading hypervisor guests. This is
> +useful for debugging hypervisors without having to jump through the
> +hoops of firmware and boot-loaders.
> +
> +The guest loader does two things:
> +
> +  - load blobs (kernels and initial ram disks) into memory
> +  - sets platform FDT data so hypervisors can find and boot them
> +
> +This is what is typically done by a boot-loader like grub using it's
> +multi-boot capability. A typical example would look like:
> +
> +.. parsed-literal::
> +
> +  |qemu_system| -kernel ~/xen.git/xen/xen \
> +    -append "dom0_mem=3D1G,max:1G loglvl=3Dall guest_loglvl=3Dall" \
> +    -device guest-loader,addr=3D0x42000000,kernel=3DImage,bootargs=3D"ro=
ot=3D/dev/sda2 ro console=3Dhvc0 earlyprintk=3Dxen" \
> +    -device guest-loader,addr=3D0x47000000,initrd=3Drootfs.cpio
> +
> +In the above example the Xen hypervisor is loaded by the -kernel
> +parameter and passed it's boot arguments via -append. The Dom0 guest
> +is loaded into the areas of memory. Each blob will get
> +`/chosen/module@<addr>` entry in the FDT to indicate it's location and
> +size. Additional information can be passed with by using additional
> +arguments.
> +
> +Currently the only supported machines which use FDT data to boot are
> +the ARM and RiscV `virt` machines.
> +
> +Arguments
> +^^^^^^^^^
> +
> +The full syntax of the guest-loader is::
> +
> +  -device guest-loader,addr=3D<addr>[,kernel=3D<file>,[bootargs=3D<args>=
]][,initrd=3D<file>]
> +
> +``addr=3D<addr>``
> +  This is mandatory and indicates the start address of the blob.
> +
> +``kernel|initrd=3D<file>``
> +  Indicates the filename of the kernel or initrd blob. Both blobs will
> +  have the "multiboot,module" compatibility string as well as
> +  "multiboot,kernel" or "multiboot,ramdisk" as appropriate.
> +
> +``bootargs=3D<args>``
> +  This is an optional field for kernel blobs which will pass command
> +  like via the `/chosen/module@<addr>/bootargs` node.
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index cee1c83540..6ad9c93806 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -26,6 +26,7 @@ Contents:
>     ivshmem
>     linuxboot
>     generic-loader
> +   guest-loader
>     vnc-security
>     tls
>     gdb
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 774b3ca7a5..853f174fcf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1997,6 +1997,7 @@ Guest Loader
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  S: Maintained
>  F: hw/core/guest-loader.c
> +F: docs/system/guest-loader.rst
>
>  Intel Hexadecimal Object File Loader
>  M: Su Hang <suhang16@mails.ucas.ac.cn>
> --
> 2.20.1
>
>

