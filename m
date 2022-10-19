Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D379C604216
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 12:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425730.673758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol6ht-000343-Ul; Wed, 19 Oct 2022 10:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425730.673758; Wed, 19 Oct 2022 10:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol6ht-00031Q-Ri; Wed, 19 Oct 2022 10:53:53 +0000
Received: by outflank-mailman (input) for mailman id 425730;
 Wed, 19 Oct 2022 10:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CpyO=2U=gmail.com=koct9i@srs-se1.protection.inumbo.net>)
 id 1ol6hs-00030S-7k
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 10:53:52 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50863696-4f9c-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 12:53:50 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id i21so18706852ljh.12
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 03:53:50 -0700 (PDT)
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
X-Inumbo-ID: 50863696-4f9c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SLJhYMtLXgKI7Y17ZUIiMFD3J1dSMKzi0bGsbw5e7go=;
        b=BIopzC1/zEhmwdduNBVA6swDAiJ/PaY8ch4dJ2rG5XuPIEphc4HpFIwENy/oXgcF77
         g26f5vpGaEszcK++cCcUTKXnXewQJhMolM/QKzyYXNbX9xSmjD/h8CuNjZnIiz7Pow8u
         9oViyTjYtEDviMMGlKH85v/Ws+BdAJzTCaIXgEvN2cQC8OYtO73LOuvgzZLgMf+F+rIG
         mtckB/MCVPgD2rV3KUTEV82YQSZME3UNkpjhzr5nvBMLdEHKNnoKLk44gbindiuqP3++
         9IOegW4jhF+LV2Vq5vqvc4+NLv43nVgJjixrVLu9Nl+mWgLbiiG+y5EemQvr99KzMTYQ
         tpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLJhYMtLXgKI7Y17ZUIiMFD3J1dSMKzi0bGsbw5e7go=;
        b=xV0S/2yb8Zn01SCLrXGGRr3ljRXG3XGf7zg3ZQN51G8XWbQOw205PS73GMh875T+mB
         2UqIFaSDQHIWzl3nyw/MXA5mZtTuveyR7rLY9oopfmYQDOlyXXy3HGR5c5+DTYag5Yp2
         da8YKF2ujTIgUimkcra6lOB0CW9ARom1cqJ1zAsqfHIf43FiKsfLlR9v0/Ctrgw/wxx8
         Tg/+6yjovJU4LXW3X7BGa3zu609DZ1/fLRwosxOQhDkmdTGvQ3PDN0MMKb4ubwQcG1cn
         jJ/MSwpWfUq34iCibM9nkbOX4G4jaEEZqjL2LtWQcpUGQFg1G5PmkpR79cDB/0qzm5Na
         rcRw==
X-Gm-Message-State: ACrzQf3qSUITs8nguRUCUGoMXLxZ8lMKuPfQztrlzMqwv4XsXw6WL3Q4
	J8lPSLMRqFkmqVMW8fbKgOk+tzcZLRHt5VfLmvk=
X-Google-Smtp-Source: AMsMyM56LTTzTKGc4F++LzICGIh8ple7Tae6Xn81CIYsoHyoaHlCwHgx+9D2SKe1qtnypzSnzS56crQyLn1GyeQTpJg=
X-Received: by 2002:a05:651c:194c:b0:26f:ec78:6172 with SMTP id
 bs12-20020a05651c194c00b0026fec786172mr2697844ljb.479.1666176829774; Wed, 19
 Oct 2022 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221019095620.124909-1-alexander.atanasov@virtuozzo.com>
In-Reply-To: <20221019095620.124909-1-alexander.atanasov@virtuozzo.com>
From: Konstantin Khlebnikov <koct9i@gmail.com>
Date: Wed, 19 Oct 2022 13:53:38 +0300
Message-ID: <CALYGNiONv3au6hbAva60jWurwkU5ancWo-o2v7tpSzwguqzD9g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/8] Make balloon drivers' memory changes known to
 the rest of the kernel
To: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Cc: kernel@openvz.org, kernel test robot <lkp@intel.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Wei Liu <wei.liu@kernel.org>, 
	Nadav Amit <namit@vmware.com>, pv-drivers@vmware.com, Jason Wang <jasowang@redhat.com>, 
	virtualization@lists.linux-foundation.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>, 
	linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000012626105eb6106d0"

--00000000000012626105eb6106d0
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Oct 2022 at 12:57, Alexander Atanasov <
alexander.atanasov@virtuozzo.com> wrote:

> Currently balloon drivers (Virtio,XEN, HyperV, VMWare, ...)
> inflate and deflate the guest memory size but there is no
> way to know how much the memory size is changed by them.
>
> Make it possible for the drivers to report the values to mm core.
>
> Display reported InflatedTotal and InflatedFree in /proc/meminfo
> and print these values on OOM and sysrq from show_mem().
>
> The two values are the result of the two modes the drivers work
> with using adjust_managed_page_count or without.
>
> In earlier versions, there was a notifier for these changes
> but after discussion - it is better to implement it in separate
> patch series. Since it came out as larger work than initially expected.
>
> Amount of inflated memory can be used:
>  - totalram_pages() users working with drivers not using
>     adjust_managed_page_count
>  - si_meminfo(..) users can improve calculations
>  - by userspace software that monitors memory pressure
>

Sorry, I see no reason for that series.
Balloon inflation adjusts totalram_pages. That's enough.

There is no reason to know the amount of non-existent ballooned memory
inside.
Management software which works outside should care about that.

For debugging you could get current balloon size from /proc/vmstat
(balloon_inflate - balloon_deflate).
Also (I guess) /proc/kpageflags has a bit for that.

Anyway it's easy to monitor balloon inflation by seeing changes of total
memory size.


>
> Alexander Atanasov (8):
>   mm: Make a place for a common balloon code
>   mm: Enable balloon drivers to report inflated memory
>   mm: Display inflated memory to users
>   mm: Display inflated memory in logs
>   drivers: virtio: balloon - report inflated memory
>   drivers: vmware: balloon - report inflated memory
>   drivers: hyperv: balloon - report inflated memory
>   documentation: create a document about how balloon drivers operate
>
>  Documentation/filesystems/proc.rst            |   6 +
>  Documentation/mm/balloon.rst                  | 138 ++++++++++++++++++
>  MAINTAINERS                                   |   4 +-
>  arch/powerpc/platforms/pseries/cmm.c          |   2 +-
>  drivers/hv/hv_balloon.c                       |  12 ++
>  drivers/misc/vmw_balloon.c                    |   3 +-
>  drivers/virtio/virtio_balloon.c               |   7 +-
>  fs/proc/meminfo.c                             |  10 ++
>  .../linux/{balloon_compaction.h => balloon.h} |  18 ++-
>  lib/show_mem.c                                |   8 +
>  mm/Makefile                                   |   2 +-
>  mm/{balloon_compaction.c => balloon.c}        |  19 ++-
>  mm/migrate.c                                  |   1 -
>  mm/vmscan.c                                   |   1 -
>  14 files changed, 213 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/mm/balloon.rst
>  rename include/linux/{balloon_compaction.h => balloon.h} (91%)
>  rename mm/{balloon_compaction.c => balloon.c} (94%)
>
> v4->v5:
>  - removed notifier
>  - added documentation
>  - vmware update after op is done , outside of the mutex
> v3->v4:
>  - add support in hyperV and vmware balloon drivers
>  - display balloon memory in show_mem so it is logged on OOM and on sysrq
> v2->v3:
>  - added missed EXPORT_SYMBOLS
> Reported-by: kernel test robot <lkp@intel.com>
>  - instead of balloon_common.h just use balloon.h (yes, naming is hard)
>  - cleaned up balloon.h - remove from files that do not use it and
>    remove externs from function declarations
> v1->v2:
>  - reworked from simple /proc/meminfo addition
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: pv-drivers@vmware.com
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: linux-hyperv@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
>
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> --
> 2.31.1
>
>

--00000000000012626105eb6106d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 19 Oct 2022 at 12:57, Alexander A=
tanasov &lt;<a href=3D"mailto:alexander.atanasov@virtuozzo.com">alexander.a=
tanasov@virtuozzo.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Currently balloon drivers (=
Virtio,XEN, HyperV, VMWare, ...)<br>
inflate and deflate the guest memory size but there is no<br>
way to know how much the memory size is changed by them.<br>
<br>
Make it possible for the drivers to report the values to mm core.<br>
<br>
Display reported InflatedTotal and InflatedFree in /proc/meminfo<br>
and print these values on OOM and sysrq from show_mem().<br>
<br>
The two values are the result of the two modes the drivers work<br>
with using adjust_managed_page_count or without.<br>
<br>
In earlier versions, there was a notifier for these changes<br>
but after discussion - it is better to implement it in separate<br>
patch series. Since it came out as larger work than initially expected.<br>
<br>
Amount of inflated memory can be used:<br>
=C2=A0- totalram_pages() users working with drivers not using<br>
=C2=A0 =C2=A0 adjust_managed_page_count<br>
=C2=A0- si_meminfo(..) users can improve calculations<br>
=C2=A0- by userspace software that monitors memory pressure<br></blockquote=
><div><br></div><div>Sorry, I see no reason for that series.</div><div>Ball=
oon inflation adjusts totalram_pages. That&#39;s enough.</div><div><br></di=
v><div>There is no reason to know the amount of non-existent ballooned memo=
ry inside.<br></div><div>Management software which works outside should car=
e about that.</div><div><br></div><div>For debugging you could get current=
=C2=A0balloon=C2=A0size from /proc/vmstat (balloon_inflate -=C2=A0balloon_d=
eflate).</div><div>Also (I guess) /proc/kpageflags has a bit for that.</div=
><div><br></div><div>Anyway it&#39;s easy to monitor balloon=C2=A0inflation=
 by seeing changes of total memory size.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Alexander Atanasov (8):<br>
=C2=A0 mm: Make a place for a common balloon code<br>
=C2=A0 mm: Enable balloon drivers to report inflated memory<br>
=C2=A0 mm: Display inflated memory to users<br>
=C2=A0 mm: Display inflated memory in logs<br>
=C2=A0 drivers: virtio: balloon - report inflated memory<br>
=C2=A0 drivers: vmware: balloon - report inflated memory<br>
=C2=A0 drivers: hyperv: balloon - report inflated memory<br>
=C2=A0 documentation: create a document about how balloon drivers operate<b=
r>
<br>
=C2=A0Documentation/filesystems/proc.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0Documentation/mm/balloon.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 138 ++++++++++++++++++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +-<br>
=C2=A0arch/powerpc/platforms/pseries/cmm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/hv/hv_balloon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++<br>
=C2=A0drivers/misc/vmw_balloon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0drivers/virtio/virtio_balloon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0fs/proc/meminfo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
=C2=A0.../linux/{balloon_compaction.h =3D&gt; balloon.h} |=C2=A0 18 ++-<br>
=C2=A0lib/show_mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<=
br>
=C2=A0mm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0mm/{balloon_compaction.c =3D&gt; balloon.c}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 19 ++-<br>
=C2=A0mm/migrate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 -<br>
=C2=A0mm/vmscan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 -<br>
=C2=A014 files changed, 213 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100644 Documentation/mm/balloon.rst<br>
=C2=A0rename include/linux/{balloon_compaction.h =3D&gt; balloon.h} (91%)<b=
r>
=C2=A0rename mm/{balloon_compaction.c =3D&gt; balloon.c} (94%)<br>
<br>
v4-&gt;v5:<br>
=C2=A0- removed notifier<br>
=C2=A0- added documentation<br>
=C2=A0- vmware update after op is done , outside of the mutex<br>
v3-&gt;v4:<br>
=C2=A0- add support in hyperV and vmware balloon drivers<br>
=C2=A0- display balloon memory in show_mem so it is logged on OOM and on sy=
srq<br>
v2-&gt;v3:<br>
=C2=A0- added missed EXPORT_SYMBOLS<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" target=
=3D"_blank">lkp@intel.com</a>&gt;<br>
=C2=A0- instead of balloon_common.h just use balloon.h (yes, naming is hard=
)<br>
=C2=A0- cleaned up balloon.h - remove from files that do not use it and<br>
=C2=A0 =C2=A0remove externs from function declarations<br>
v1-&gt;v2:<br>
=C2=A0- reworked from simple /proc/meminfo addition<br>
<br>
Cc: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_bla=
nk">mst@redhat.com</a>&gt;<br>
Cc: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=3D"_bl=
ank">david@redhat.com</a>&gt;<br>
Cc: Wei Liu &lt;<a href=3D"mailto:wei.liu@kernel.org" target=3D"_blank">wei=
.liu@kernel.org</a>&gt;<br>
Cc: Nadav Amit &lt;<a href=3D"mailto:namit@vmware.com" target=3D"_blank">na=
mit@vmware.com</a>&gt;<br>
Cc: <a href=3D"mailto:pv-drivers@vmware.com" target=3D"_blank">pv-drivers@v=
mware.com</a><br>
Cc: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank"=
>jasowang@redhat.com</a>&gt;<br>
Cc: <a href=3D"mailto:virtualization@lists.linux-foundation.org" target=3D"=
_blank">virtualization@lists.linux-foundation.org</a><br>
Cc: &quot;K. Y. Srinivasan&quot; &lt;<a href=3D"mailto:kys@microsoft.com" t=
arget=3D"_blank">kys@microsoft.com</a>&gt;<br>
Cc: Haiyang Zhang &lt;<a href=3D"mailto:haiyangz@microsoft.com" target=3D"_=
blank">haiyangz@microsoft.com</a>&gt;<br>
Cc: Stephen Hemminger &lt;<a href=3D"mailto:sthemmin@microsoft.com" target=
=3D"_blank">sthemmin@microsoft.com</a>&gt;<br>
Cc: Dexuan Cui &lt;<a href=3D"mailto:decui@microsoft.com" target=3D"_blank"=
>decui@microsoft.com</a>&gt;<br>
Cc: <a href=3D"mailto:linux-hyperv@vger.kernel.org" target=3D"_blank">linux=
-hyperv@vger.kernel.org</a><br>
Cc: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_blank">=
jgross@suse.com</a>&gt;<br>
Cc: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
Cc: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@epam.co=
m" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
Cc: <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank">xen=
-devel@lists.xenproject.org</a><br>
<br>
base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000012626105eb6106d0--

