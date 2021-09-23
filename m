Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9D4155AA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193301.344308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEv2-0001bJ-Jm; Thu, 23 Sep 2021 02:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193301.344308; Thu, 23 Sep 2021 02:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEv2-0001Z2-Ef; Thu, 23 Sep 2021 02:57:04 +0000
Received: by outflank-mailman (input) for mailman id 193301;
 Thu, 23 Sep 2021 02:57:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nnny=ON=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mTEv0-0001Yw-PB
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:57:02 +0000
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 339bf0ee-0313-4566-88fc-712d2db902af;
 Thu, 23 Sep 2021 02:57:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v10so13162679edj.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 19:57:01 -0700 (PDT)
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
X-Inumbo-ID: 339bf0ee-0313-4566-88fc-712d2db902af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stYRffpGhZzuPtYL+nsFafXU6FVqJNReuCUTT5KVYcY=;
        b=PFjyQ5QHnDAkBksCNwazeUl98k7zu+zjT4Q8Vzdh7O2RoZ1ZdKV1QxbcBAukOpGbPP
         7SJOCC1N8FZE/9s29rGHw/i5wMx7bIA2WqjknOwiFA38wQdeKNqv4tBLVV82BEqtVTrE
         hMii/RsZtDljcRd2m+9puxayZqzaXPLGehfxs8hvW7moN9yA8ACXixyjGY/4CL95LXmW
         3mekNO7zf1i0zl0CG1KN3Ls9v2FfpgJNNHxjnhCUkdoMdUs59o4LmjKpuXiQFfuZdJxX
         KjbG1TA72Ewzki0yHGK08sVOXRXJztlhMFc7GFCNQ23IOKHcTvaWqQbHglDwJj5ChSkP
         JGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stYRffpGhZzuPtYL+nsFafXU6FVqJNReuCUTT5KVYcY=;
        b=FpL7F84lqfsfKfnGT4VfVkgyFKLdbiHPV3TW2TaYVJdfK7EK0S/qTxTln6YE7XGhoO
         MkEd1V2v8nurHrpZjZOpiHST0vi0Tb/yLjqq9shAOrmePB54g16lyk8VUAC86e25iw6E
         fDxQWfHMEzCOoz5ekOCz1+lUK5d5ZkOqgqMm/zx18DOO6jV5a5u+j+r/xnn9m4ixWSUt
         bxpgkMhLGtLMRfYULjRsKEdbA7YdyRZcjDabq/jSU6hwBTwtfbemdF0whhXwl5HxQRlO
         A6mwWDbXSMsXSeHXnzrYJltDr+o8f6lT2OsrZDJUG4dWC9oGY91DR6uv/p0r6k9O5KJS
         tL6A==
X-Gm-Message-State: AOAM533Bo32d8Wdm8oKNH4raF8w6PkGyYRSBkUMIMqGFXu4JgLmKqGdV
	vavsDrKSe7jSMu7TG1x2Ox0JECCwI6Nw3aLQYpI=
X-Google-Smtp-Source: ABdhPJxqUIQ7WKhJ/OE0Bohn++ZsqNcpsSC5OrCJt2i2aOzMsMYaOXyxXxXYDxI2fJLQWQ+aNyomhjiQhQ3VV0gBqMo=
X-Received: by 2002:a17:907:2639:: with SMTP id aq25mr2717035ejc.138.1632365820261;
 Wed, 22 Sep 2021 19:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <osstest-164996-mainreport@xen.org> <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com> <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
 <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com> <alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 23 Sep 2021 07:56:48 +0500
Message-ID: <CAJ=z9a1W9BqeOGFu3F2+qbXM6UNo8ZO=0y-zYsnK01MNSNdbkw@mail.gmail.com>
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, dpsmith@apertussolutions.com
Content-Type: multipart/alternative; boundary="000000000000dc38e905cca0c88b"

--000000000000dc38e905cca0c88b
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.


On Thu, 23 Sep 2021, 06:10 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 22 Sep 2021, Jan Beulich wrote:
> > On 22.09.2021 01:38, Stefano Stabellini wrote:
> > > On Mon, 20 Sep 2021, Ian Jackson wrote:
> > >> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions -
> FAIL"):
> > >>> As per
> > >>>
> > >>> Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
> > >>> Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639
> inactive_anon:15857 isolated_anon:0
> > >>> Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286
> inactive_file:11182 isolated_file:0
> > >>> Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30
> writeback:0 unstable:0
> > >>> Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922
> slab_unreclaimable:30234
> > >>> Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975
> pagetables:401 bounce:0
> > >>> Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100
> free_cma:1650
> > >>>
> > >>> the system doesn't look to really be out of memory; as per
> > >>>
> > >>> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB
> (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C)
> 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
> > >>>
> > >>> there even look to be a number of higher order pages available
> (albeit
> > >>> without digging I can't tell what "(C)" means). Nevertheless order-4
> > >>> allocations aren't really nice.
> > >>
> > >> The host history suggests this may possibly be related to a qemu
> update.
> > >>
> > >>
> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html
> >
> > Stefano - as per some of your investigation detailed further down I
> > wonder whether you had seen this part of Ian's reply. (Question of
> > course then is how that qemu update had managed to get pushed.)
> >
> > >> The grub cfg has this:
> > >>
> > >>  multiboot /xen placeholder conswitch=x watchdog noreboot
> async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan
> ${xen_rm_opts}
> > >>
> > >> It's not clear to me whether xen_rm_opts is "" or "no-real-mode
> edd=off".
> > >
> > > I definitely recommend to increase dom0 memory, especially as I guess
> > > the box is going to have a significant amount, far more than 4GB. I
> > > would set it to 2GB. Also the syntax on ARM is simpler, so it should be
> > > just: dom0_mem=2G
> >
> > Ian - I guess that's an adjustment relatively easy to make? I wonder
> > though whether we wouldn't want to address the underlying issue first.
> > Presumably not, because the fix would likely take quite some time to
> > propagate suitably. Yet if not, we will want to have some way of
> > verifying that an eventual fix there would have helped here.
> >
> > > In addition, I also did some investigation just in case there is
> > > actually a bug in the code and it is not a simple OOM problem.
> >
> > I think the actual issue is quite clear; what I'm struggling with is
> > why we weren't hit by it earlier.
> >
> > As imo always, non-order-0 allocations (perhaps excluding the bringing
> > up of the kernel or whichever entity) are to be avoided it at possible.
> > The offender in this case looks to be privcmd's alloc_empty_pages().
> > For it to request through kcalloc() what ends up being an order-4
> > allocation, the original IOCTL_PRIVCMD_MMAPBATCH must specify a pretty
> > large chunk of guest memory to get mapped. Which may in turn be
> > questionable, but I'm afraid I don't have the time to try to drill
> > down where that request is coming from and whether that also wouldn't
> > better be split up.
> >
> > The solution looks simple enough - convert from kcalloc() to kvcalloc().
> > I can certainly spin up a patch to Linux to this effect. Yet that still
> > won't answer the question of why this issue has popped up all of the
> > sudden (and hence whether there are things wanting changing elsewhere
> > as well).
>
> Also, I saw your patches for Linux. Let's say that the patches are
> reviewed and enqueued immediately to be sent to Linus at the next
> opportunity. It is going to take a while for them to take effect in
> OSSTest, unless we import them somehow in the Linux tree used by OSSTest
> straight away, right?
>

For Arm testing we don't use a branch provided by Linux upstream. So your
wait will be forever :).


> Should we arrange for one test OSSTest flight now with the patches
> applied to see if they actually fix the issue? Otherwise we might end up
> waiting for nothing...


We could push the patch in the branch we have. However the Linux we use is
not fairly old (I think I did a push last year) and not even the latest
stable.

I can't remember whether we still have some patches on top of Linux to run
on arm (specifically 32-bit). So maybe we should start to track upstream
instead?

This will have the benefits to pick any new patches.

Cheers,

.





>

--000000000000dc38e905cca0c88b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Sor=
ry for the formatting.</div><br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, 23 Sep 2021, 06:10 Stefano Stabellini, &l=
t;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Wed, 22 Sep 2021, Jan Beu=
lich wrote:<br>
&gt; On 22.09.2021 01:38, Stefano Stabellini wrote:<br>
&gt; &gt; On Mon, 20 Sep 2021, Ian Jackson wrote:<br>
&gt; &gt;&gt; Jan Beulich writes (&quot;Re: [xen-unstable test] 164996: reg=
ressions - FAIL&quot;):<br>
&gt; &gt;&gt;&gt; As per<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 in=
active_anon:15857 isolated_anon:0<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.514480 [ 1613.324918]=C2=A0 active_file:1=
3286 inactive_file:11182 isolated_file:0<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.514545 [ 1613.324918]=C2=A0 unevictable:0=
 dirty:30 writeback:0 unstable:0<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.526477 [ 1613.324918]=C2=A0 slab_reclaima=
ble:10922 slab_unreclaimable:30234<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.526540 [ 1613.324918]=C2=A0 mapped:11277 =
shmem:10975 pagetables:401 bounce:0<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.538474 [ 1613.324918]=C2=A0 free:8364 fre=
e_pcp:100 free_cma:1650<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; the system doesn&#39;t look to really be out of memory; a=
s per<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UM=
EC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*2=
56kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB =3D 33456kB<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; there even look to be a number of higher order pages avai=
lable (albeit<br>
&gt; &gt;&gt;&gt; without digging I can&#39;t tell what &quot;(C)&quot; mea=
ns). Nevertheless order-4<br>
&gt; &gt;&gt;&gt; allocations aren&#39;t really nice.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The host history suggests this may possibly be related to a q=
emu update.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"http://logs.test-lab.xenproject.org/osstest/result=
s/host/rochester0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
p://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html</a><b=
r>
&gt; <br>
&gt; Stefano - as per some of your investigation detailed further down I<br=
>
&gt; wonder whether you had seen this part of Ian&#39;s reply. (Question of=
<br>
&gt; course then is how that qemu update had managed to get pushed.)<br>
&gt; <br>
&gt; &gt;&gt; The grub cfg has this:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 multiboot /xen placeholder conswitch=3Dx watchdog noreb=
oot async-show-all console=3Ddtuart dom0_mem=3D512M,max:512M ucode=3Dscan=
=C2=A0 ${xen_rm_opts}<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It&#39;s not clear to me whether xen_rm_opts is &quot;&quot; =
or &quot;no-real-mode edd=3Doff&quot;.<br>
&gt; &gt; <br>
&gt; &gt; I definitely recommend to increase dom0 memory, especially as I g=
uess<br>
&gt; &gt; the box is going to have a significant amount, far more than 4GB.=
 I<br>
&gt; &gt; would set it to 2GB. Also the syntax on ARM is simpler, so it sho=
uld be<br>
&gt; &gt; just: dom0_mem=3D2G<br>
&gt; <br>
&gt; Ian - I guess that&#39;s an adjustment relatively easy to make? I wond=
er<br>
&gt; though whether we wouldn&#39;t want to address the underlying issue fi=
rst.<br>
&gt; Presumably not, because the fix would likely take quite some time to<b=
r>
&gt; propagate suitably. Yet if not, we will want to have some way of<br>
&gt; verifying that an eventual fix there would have helped here.<br>
&gt; <br>
&gt; &gt; In addition, I also did some investigation just in case there is<=
br>
&gt; &gt; actually a bug in the code and it is not a simple OOM problem.<br=
>
&gt; <br>
&gt; I think the actual issue is quite clear; what I&#39;m struggling with =
is<br>
&gt; why we weren&#39;t hit by it earlier.<br>
&gt; <br>
&gt; As imo always, non-order-0 allocations (perhaps excluding the bringing=
<br>
&gt; up of the kernel or whichever entity) are to be avoided it at possible=
.<br>
&gt; The offender in this case looks to be privcmd&#39;s alloc_empty_pages(=
).<br>
&gt; For it to request through kcalloc() what ends up being an order-4<br>
&gt; allocation, the original IOCTL_PRIVCMD_MMAPBATCH must specify a pretty=
<br>
&gt; large chunk of guest memory to get mapped. Which may in turn be<br>
&gt; questionable, but I&#39;m afraid I don&#39;t have the time to try to d=
rill<br>
&gt; down where that request is coming from and whether that also wouldn&#3=
9;t<br>
&gt; better be split up.<br>
&gt; <br>
&gt; The solution looks simple enough - convert from kcalloc() to kvcalloc(=
).<br>
&gt; I can certainly spin up a patch to Linux to this effect. Yet that stil=
l<br>
&gt; won&#39;t answer the question of why this issue has popped up all of t=
he<br>
&gt; sudden (and hence whether there are things wanting changing elsewhere<=
br>
&gt; as well).<br>
<br>
Also, I saw your patches for Linux. Let&#39;s say that the patches are<br>
reviewed and enqueued immediately to be sent to Linus at the next<br>
opportunity. It is going to take a while for them to take effect in<br>
OSSTest, unless we import them somehow in the Linux tree used by OSSTest<br=
>
straight away, right?<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">For Arm testing we don&#39;t use a branch provided by =
Linux upstream. So your wait will be forever :).</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Should we arrange for one test OSSTest flight now with the patches<br>
applied to see if they actually fix the issue? Otherwise we might end up<br=
>
waiting for nothing...</blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">We could push the patch in the branch we have. However th=
e Linux we use is not fairly old (I think I did a push last year) and not e=
ven the latest stable.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 can&#39;t remember whether we still have some patches on top of Linux to r=
un on arm (specifically 32-bit). So maybe we should start to track upstream=
 instead?</div><div dir=3D"auto"><br></div><div dir=3D"auto">This will have=
 the benefits to pick any new patches.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000dc38e905cca0c88b--

