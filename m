Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9ED604BCF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 17:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425887.673992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBAZ-00087t-LQ; Wed, 19 Oct 2022 15:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425887.673992; Wed, 19 Oct 2022 15:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBAZ-00085k-I1; Wed, 19 Oct 2022 15:39:47 +0000
Received: by outflank-mailman (input) for mailman id 425887;
 Wed, 19 Oct 2022 15:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CpyO=2U=gmail.com=koct9i@srs-se1.protection.inumbo.net>)
 id 1olBAY-00085b-1X
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 15:39:46 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4043f155-4fc4-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 17:39:43 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id bu25so28843161lfb.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 08:39:43 -0700 (PDT)
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
X-Inumbo-ID: 4043f155-4fc4-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RK4xoOZYyfRDB1X5WsmKkjIdK20um88SdCRg+FscnVc=;
        b=bwXkNkcQOjN0WxRn+TzKaVD2WFrlkFnUl5MFCBpmyQ8g/h4IA/oJp3WpSpIXvkypbV
         Bh21BUf04UYYoe+ca2ZDJ5zATVRCo3yyhph/FOw9+p22jMUp6JNRpkuZNajpZ9SbICU3
         rVs1dmz7a3UlIGSq0j3pEHGzXS8HveSXsKGciz0ORD4LA7isR+5hAX2AEtGESPDguXKY
         TcGtrwKZzH1OYzOL4ZTwug6MmWqsPlAtrQxhwVjGKSK7uUX77D0yIrOMmkXU3HsUa6+a
         IkCbpvyOEsoeqSNcO3Eo5mWDoKPSBLZ7XtJDlBIdkB9y4eSaxSLnqVnryOWGQx69az2D
         aqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RK4xoOZYyfRDB1X5WsmKkjIdK20um88SdCRg+FscnVc=;
        b=NP9fxizAlfJqKLvxIl0QBOzOXarkSmotxFkgjGor7C1iErwGXxi9anhKGpvut8Bmtt
         NeG++SKFVCRqUktwtUtbVcZD7XhFX90/MEa6C9ZBEkzR2SmB9dV79jGYCErnQ3Di+/Rt
         rsBqf9Pfor2WZfXl3UyZ483JvryfoJwk1u1He1pThnTnqhpvOfMuOls2aTn1e4pi234J
         n81EfFusUtCnxt5uVAq0OV3z8Ys4OTiENUBvc8Rkx96HmNTGUJTwqPPzgSnTcqVYYaLV
         /DfY5kdQvg4BiqbCAwiqMMQEfEewHW5NeNKsfKRjxwewVRjEByrNzoQotJ0mk2VCHnRb
         Fl/w==
X-Gm-Message-State: ACrzQf3aRu4mk5Qlcuq3p1G7I7dONE9z8/4FFgz3ygU8rCBvSkfUzJb2
	rpuARBcCtXrhGTwETi6BdprZRcA9H3nYXwr/OPA=
X-Google-Smtp-Source: AMsMyM5xKMUiaYBkD/HxblJqLfy0suavMVVslmZLPZ8He+oTFu65I1yxfrDbu5z2Ftve+UdHzwlPNLyZWKVu0U/E85Y=
X-Received: by 2002:a19:ee10:0:b0:4a3:fa6f:e66d with SMTP id
 g16-20020a19ee10000000b004a3fa6fe66dmr3150133lfb.596.1666193982344; Wed, 19
 Oct 2022 08:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221019095620.124909-1-alexander.atanasov@virtuozzo.com>
 <CALYGNiONv3au6hbAva60jWurwkU5ancWo-o2v7tpSzwguqzD9g@mail.gmail.com> <1c69ff97-831d-ece3-7a52-bb7659fc8dd4@virtuozzo.com>
In-Reply-To: <1c69ff97-831d-ece3-7a52-bb7659fc8dd4@virtuozzo.com>
From: Konstantin Khlebnikov <koct9i@gmail.com>
Date: Wed, 19 Oct 2022 18:39:30 +0300
Message-ID: <CALYGNiMMo7aqgQrcHBWaoU7O9Lpk1qCD2CmRJ5mw+-pFJwFajQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/8] Make balloon drivers' memory changes known to
 the rest of the kernel
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: Alexander Atanasov <alexander.atanasov@virtuozzo.com>, kernel@openvz.org, 
	kernel test robot <lkp@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, 
	Wei Liu <wei.liu@kernel.org>, Nadav Amit <namit@vmware.com>, pv-drivers@vmware.com, 
	Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>, 
	linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000071d4a105eb6504a3"

--00000000000071d4a105eb6504a3
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Oct 2022 at 14:06, Denis V. Lunev <den@virtuozzo.com> wrote:

> On 10/19/22 12:53, Konstantin Khlebnikov wrote:
> > On Wed, 19 Oct 2022 at 12:57, Alexander Atanasov
> > <alexander.atanasov@virtuozzo.com> wrote:
> >
> >     Currently balloon drivers (Virtio,XEN, HyperV, VMWare, ...)
> >     inflate and deflate the guest memory size but there is no
> >     way to know how much the memory size is changed by them.
> >
> >     Make it possible for the drivers to report the values to mm core.
> >
> >     Display reported InflatedTotal and InflatedFree in /proc/meminfo
> >     and print these values on OOM and sysrq from show_mem().
> >
> >     The two values are the result of the two modes the drivers work
> >     with using adjust_managed_page_count or without.
> >
> >     In earlier versions, there was a notifier for these changes
> >     but after discussion - it is better to implement it in separate
> >     patch series. Since it came out as larger work than initially
> >     expected.
> >
> >     Amount of inflated memory can be used:
> >      - totalram_pages() users working with drivers not using
> >         adjust_managed_page_count
> >      - si_meminfo(..) users can improve calculations
> >      - by userspace software that monitors memory pressure
> >
> >
> > Sorry, I see no reason for that series.
> > Balloon inflation adjusts totalram_pages. That's enough.
> >
> no, they are not at least under some circumstances, f.e.
> virtio balloon does not do that with VIRTIO_BALLOON_F_DEFLATE_ON_OOM
> set
>

> > There is no reason to know the amount of non-existent ballooned memory
> > inside.
> > Management software which works outside should care about that.
> >
> The problem comes at the moment when we are running
> our Linux server inside virtual machine and the customer
> comes with crazy questions "where our memory?".
>

Ok. In this case balloon management is partially inside VM.
I.e. we could report portion of balloon as potentially available memory.

I guess memory pressure could deflate balloon till some threshold set by
external hypervisor.
So, without knowledge about this threshold there is no correct answer about
size of available memory.
Showing just size of balloon doesn't gives much.


>
> > For debugging you could get current balloon size from /proc/vmstat
> > (balloon_inflate - balloon_deflate).
> > Also (I guess) /proc/kpageflags has a bit for that.
> >
> > Anyway it's easy to monitor balloon inflation by seeing changes of
> > total memory size.
> for monitoring - may be. But in order to report total amount
> there is no interface so far.
>
> >
> >     Alexander Atanasov (8):
> >       mm: Make a place for a common balloon code
> >       mm: Enable balloon drivers to report inflated memory
> >       mm: Display inflated memory to users
> >       mm: Display inflated memory in logs
> >       drivers: virtio: balloon - report inflated memory
> >       drivers: vmware: balloon - report inflated memory
> >       drivers: hyperv: balloon - report inflated memory
> >       documentation: create a document about how balloon drivers operate
> >
> >      Documentation/filesystems/proc.rst            |   6 +
> >      Documentation/mm/balloon.rst                  | 138
> >     ++++++++++++++++++
> >      MAINTAINERS                                   |   4 +-
> >      arch/powerpc/platforms/pseries/cmm.c          |   2 +-
> >      drivers/hv/hv_balloon.c                       |  12 ++
> >      drivers/misc/vmw_balloon.c                    |   3 +-
> >      drivers/virtio/virtio_balloon.c               |   7 +-
> >      fs/proc/meminfo.c                             |  10 ++
> >      .../linux/{balloon_compaction.h => balloon.h} |  18 ++-
> >      lib/show_mem.c                                |   8 +
> >      mm/Makefile                                   |   2 +-
> >      mm/{balloon_compaction.c => balloon.c}        |  19 ++-
> >      mm/migrate.c                                  |   1 -
> >      mm/vmscan.c                                   |   1 -
> >      14 files changed, 213 insertions(+), 18 deletions(-)
> >      create mode 100644 Documentation/mm/balloon.rst
> >      rename include/linux/{balloon_compaction.h => balloon.h} (91%)
> >      rename mm/{balloon_compaction.c => balloon.c} (94%)
> >
> >     v4->v5:
> >      - removed notifier
> >      - added documentation
> >      - vmware update after op is done , outside of the mutex
> >     v3->v4:
> >      - add support in hyperV and vmware balloon drivers
> >      - display balloon memory in show_mem so it is logged on OOM and
> >     on sysrq
> >     v2->v3:
> >      - added missed EXPORT_SYMBOLS
> >     Reported-by: kernel test robot <lkp@intel.com>
> >      - instead of balloon_common.h just use balloon.h (yes, naming is
> >     hard)
> >      - cleaned up balloon.h - remove from files that do not use it and
> >        remove externs from function declarations
> >     v1->v2:
> >      - reworked from simple /proc/meminfo addition
> >
> >     Cc: Michael S. Tsirkin <mst@redhat.com>
> >     Cc: David Hildenbrand <david@redhat.com>
> >     Cc: Wei Liu <wei.liu@kernel.org>
> >     Cc: Nadav Amit <namit@vmware.com>
> >     Cc: pv-drivers@vmware.com
> >     Cc: Jason Wang <jasowang@redhat.com>
> >     Cc: virtualization@lists.linux-foundation.org
> >     Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> >     Cc: Haiyang Zhang <haiyangz@microsoft.com>
> >     Cc: Stephen Hemminger <sthemmin@microsoft.com>
> >     Cc: Dexuan Cui <decui@microsoft.com>
> >     Cc: linux-hyperv@vger.kernel.org
> >     Cc: Juergen Gross <jgross@suse.com>
> >     Cc: Stefano Stabellini <sstabellini@kernel.org>
> >     Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >     Cc: xen-devel@lists.xenproject.org
> >
> >     base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> >     --
> >     2.31.1
> >
>
>

--00000000000071d4a105eb6504a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Oct 2022 at 14:06, Denis V=
. Lunev &lt;<a href=3D"mailto:den@virtuozzo.com">den@virtuozzo.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/19/=
22 12:53, Konstantin Khlebnikov wrote:<br>
&gt; On Wed, 19 Oct 2022 at 12:57, Alexander Atanasov <br>
&gt; &lt;<a href=3D"mailto:alexander.atanasov@virtuozzo.com" target=3D"_bla=
nk">alexander.atanasov@virtuozzo.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Currently balloon drivers (Virtio,XEN, HyperV, VMWa=
re, ...)<br>
&gt;=C2=A0 =C2=A0 =C2=A0inflate and deflate the guest memory size but there=
 is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0way to know how much the memory size is changed by =
them.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Make it possible for the drivers to report the valu=
es to mm core.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Display reported InflatedTotal and InflatedFree in =
/proc/meminfo<br>
&gt;=C2=A0 =C2=A0 =C2=A0and print these values on OOM and sysrq from show_m=
em().<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The two values are the result of the two modes the =
drivers work<br>
&gt;=C2=A0 =C2=A0 =C2=A0with using adjust_managed_page_count or without.<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0In earlier versions, there was a notifier for these=
 changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0but after discussion - it is better to implement it=
 in separate<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch series. Since it came out as larger work than=
 initially<br>
&gt;=C2=A0 =C2=A0 =C2=A0expected.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Amount of inflated memory can be used:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- totalram_pages() users working with drivers=
 not using<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 adjust_managed_page_count<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- si_meminfo(..) users can improve calculatio=
ns<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- by userspace software that monitors memory =
pressure<br>
&gt;<br>
&gt;<br>
&gt; Sorry, I see no reason for that series.<br>
&gt; Balloon inflation adjusts totalram_pages. That&#39;s enough.<br>
&gt;<br>
no, they are not at least under some circumstances, f.e.<br>
virtio balloon does not do that with VIRTIO_BALLOON_F_DEFLATE_ON_OOM<br>
set<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; There is no reason to know the amount of non-existent ballooned memory=
 <br>
&gt; inside.<br>
&gt; Management software which works outside should care about that.<br>
&gt;<br>
The problem comes at the moment when we are running<br>
our Linux server inside virtual machine and the customer<br>
comes with crazy questions &quot;where our memory?&quot;.<br></blockquote><=
div><br></div><div>Ok. In this case balloon management is partially inside =
VM.</div><div>I.e. we could report portion of balloon as potentially availa=
ble memory.</div><div><br></div><div>I guess memory pressure could deflate =
balloon till some threshold set by external hypervisor.</div><div>So, witho=
ut knowledge about this threshold there is no correct answer about size of =
available memory.<br></div><div>Showing just size of balloon doesn&#39;t gi=
ves much.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; For debugging you could get current=C2=A0balloon=C2=A0size from /proc/=
vmstat <br>
&gt; (balloon_inflate -=C2=A0balloon_deflate).<br>
&gt; Also (I guess) /proc/kpageflags has a bit for that.<br>
&gt;<br>
&gt; Anyway it&#39;s easy to monitor balloon=C2=A0inflation by seeing chang=
es of <br>
&gt; total memory size.<br>
for monitoring - may be. But in order to report total amount<br>
there is no interface so far.<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Alexander Atanasov (8):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mm: Make a place for a common balloon code<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mm: Enable balloon drivers to report inflate=
d memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mm: Display inflated memory to users<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mm: Display inflated memory in logs<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 drivers: virtio: balloon - report inflated m=
emory<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 drivers: vmware: balloon - report inflated m=
emory<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 drivers: hyperv: balloon - report inflated m=
emory<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 documentation: create a document about how b=
alloon drivers operate<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Documentation/filesystems/proc.rst=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Documentation/mm/balloon.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 138<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0arch/powerpc/platforms/pseries/cmm.c=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/hv/hv_balloon.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/misc/vmw_balloon.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/virtio/virtio_balloon.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0fs/proc/meminfo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../linux/{balloon_compaction.h =3D&gt; ballo=
on.h} |=C2=A0 18 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0lib/show_mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0mm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0mm/{balloon_compaction.c =3D&gt; balloon.c}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0mm/migrate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0mm/vmscan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A014 files changed, 213 insertions(+), 18 delet=
ions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 Documentation/mm/balloon.r=
st<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename include/linux/{balloon_compaction.h =
=3D&gt; balloon.h} (91%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename mm/{balloon_compaction.c =3D&gt; ballo=
on.c} (94%)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0v4-&gt;v5:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- removed notifier<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- added documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- vmware update after op is done , outside of=
 the mutex<br>
&gt;=C2=A0 =C2=A0 =C2=A0v3-&gt;v4:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- add support in hyperV and vmware balloon dr=
ivers<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- display balloon memory in show_mem so it is=
 logged on OOM and<br>
&gt;=C2=A0 =C2=A0 =C2=A0on sysrq<br>
&gt;=C2=A0 =C2=A0 =C2=A0v2-&gt;v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- added missed EXPORT_SYMBOLS<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reported-by: kernel test robot &lt;<a href=3D"mailt=
o:lkp@intel.com" target=3D"_blank">lkp@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- instead of balloon_common.h just use balloo=
n.h (yes, naming is<br>
&gt;=C2=A0 =C2=A0 =C2=A0hard)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- cleaned up balloon.h - remove from files th=
at do not use it and<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0remove externs from function declarati=
ons<br>
&gt;=C2=A0 =C2=A0 =C2=A0v1-&gt;v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0- reworked from simple /proc/meminfo addition=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@re=
dhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: David Hildenbrand &lt;<a href=3D"mailto:david@r=
edhat.com" target=3D"_blank">david@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Wei Liu &lt;<a href=3D"mailto:wei.liu@kernel.or=
g" target=3D"_blank">wei.liu@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Nadav Amit &lt;<a href=3D"mailto:namit@vmware.c=
om" target=3D"_blank">namit@vmware.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: <a href=3D"mailto:pv-drivers@vmware.com" target=
=3D"_blank">pv-drivers@vmware.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Jason Wang &lt;<a href=3D"mailto:jasowang@redha=
t.com" target=3D"_blank">jasowang@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: <a href=3D"mailto:virtualization@lists.linux-fo=
undation.org" target=3D"_blank">virtualization@lists.linux-foundation.org</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: &quot;K. Y. Srinivasan&quot; &lt;<a href=3D"mai=
lto:kys@microsoft.com" target=3D"_blank">kys@microsoft.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Haiyang Zhang &lt;<a href=3D"mailto:haiyangz@mi=
crosoft.com" target=3D"_blank">haiyangz@microsoft.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Stephen Hemminger &lt;<a href=3D"mailto:sthemmi=
n@microsoft.com" target=3D"_blank">sthemmin@microsoft.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Dexuan Cui &lt;<a href=3D"mailto:decui@microsof=
t.com" target=3D"_blank">decui@microsoft.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: <a href=3D"mailto:linux-hyperv@vger.kernel.org"=
 target=3D"_blank">linux-hyperv@vger.kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Juergen Gross &lt;<a href=3D"mailto:jgross@suse=
.com" target=3D"_blank">jgross@suse.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Stefano Stabellini &lt;<a href=3D"mailto:sstabe=
llini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Oleksandr Tyshchenko &lt;<a href=3D"mailto:olek=
sandr_tyshchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: <a href=3D"mailto:xen-devel@lists.xenproject.or=
g" target=3D"_blank">xen-devel@lists.xenproject.org</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.31.1<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000071d4a105eb6504a3--

