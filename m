Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67013FDFDA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 18:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176574.321301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLT4K-0005k6-23; Wed, 01 Sep 2021 16:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176574.321301; Wed, 01 Sep 2021 16:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLT4J-0005hA-Su; Wed, 01 Sep 2021 16:26:31 +0000
Received: by outflank-mailman (input) for mailman id 176574;
 Wed, 01 Sep 2021 16:26:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=viXG=NX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mLT4I-0005gw-AR
 for xen-devel@lists.xen.org; Wed, 01 Sep 2021 16:26:30 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0add8b29-e91e-4907-9b94-66544d7c7a2f;
 Wed, 01 Sep 2021 16:26:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso84542wmr.1
 for <xen-devel@lists.xen.org>; Wed, 01 Sep 2021 09:26:28 -0700 (PDT)
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
X-Inumbo-ID: 0add8b29-e91e-4907-9b94-66544d7c7a2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hD6i+Tmn6yQISidhCVyfY7yvCP2yOSJZBebtAHZRXp8=;
        b=CwvDbyjqE/5U4XrUdyWNPgwHyB8fguYfy6xEzFi3IH08QqKYsTprTFs24eXjfPCF8a
         ShehDh1Qm/bis30H4x8En2ucFmy//wQL6v8omiNkShASFVlaa2o/31esQtfnNGwKMWID
         +IINvGanj9JDaUIM4ww8f5noBQvL2l0PakkYoT2VuViWy1V9zmMBA4jy6qw8W63G/TrP
         0bXzpe42VGXPnbah1UHS6yiZNNyzT1w0UKqAa9SE2wHTouHAjz+pPxz4I/EFBCZJOnkc
         0zf/6X8gwHuAFja90RBn+fFOMr3IiNSFB+p24nrVd/lUFuVS1gx035Qjv5VfEBgssWAq
         Ls7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hD6i+Tmn6yQISidhCVyfY7yvCP2yOSJZBebtAHZRXp8=;
        b=qj6HsWGv4ojU4LfqMsSCAeVaFuyme0mqlrlv3+eIHwfS3fTdT5i+m1K7wgJLPtvuMf
         Y7gOuLlCakjBiJmYviuRXUdPfgahFCFZWmy6DVl1yXp/NATVgMMgrK8SArOn7mO59mxL
         39u+o+a1H4gQWS+kcH93rWiElh15FgwsRQOGRae4yiuz07RpmOF+cRl2wQvNdXNn+Tgy
         VbU+hcrFI0zGYNaYlqt1ncZXsFRwmEf6ByxK9L40kykU06x33Gusovar+4veIgvuZtYi
         6EBuadbYLJsVzCGFv2kMbEy7ls5ERKohLypBjpgvsItnSnChXXLmR+GRJadficQRjvyB
         82WA==
X-Gm-Message-State: AOAM5327NqANsbPjWpcx1Dk2OWcHaR5J6ftsSXOoAYapVCYsDADsxLPb
	Fy5XuowL2V3+38vFFqZhcRn1wqdBDK4BidCzvUM=
X-Google-Smtp-Source: ABdhPJxysw6v03n5aApJo8ZcR8hFITSnVlLB+2zC4NsLIOHNVJn4JcLUuEUjcZXwFCHikApOxhJ1pTdAJ66vKauC56c=
X-Received: by 2002:a1c:a181:: with SMTP id k123mr378799wme.90.1630513587810;
 Wed, 01 Sep 2021 09:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <DB9PR08MB685767CFAA4A8BCE7D2225A89EFD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210817080757.GC43203@laputa> <DB9PR08MB6857C656472153A42FB438C49EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210818053840.GE39588@laputa> <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa> <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210831061805.GB69817@laputa> <DB9PR08MB6857A38DAF12053DCA502E039ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210901122910.GA100270@laputa>
In-Reply-To: <20210901122910.GA100270@laputa>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 1 Sep 2021 19:26:16 +0300
Message-ID: <CAPD2p-n1on9H5aegznmMwZHHYvMAN8QR7kxmfj0UCBgyrcyWsw@mail.gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Alex Benn??e" <alex.bennee@linaro.org>, Kaly Xin <Kaly.Xin@arm.com>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, "stefanha@redhat.com" <stefanha@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>, 
	"pratikp@quicinc.com" <pratikp@quicinc.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <paul@xen.org>, nd <nd@arm.com>, Xen Devel <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="00000000000033f5d805caf1878f"

--00000000000033f5d805caf1878f
Content-Type: text/plain; charset="UTF-8"

Hi Akashi,

I am sorry for the possible format issues.


>
> > > >
> > > > It's a RFC discussion. We have tested this RFC patch internally.
> > > > https://lists.xenproject.org/archives/html/xen-devel/2021-
> > > 07/msg01532.html
> > >
> > > I'm afraid that I miss something here, but I don't know
> > > why this proposed API will lead to eliminating 'mmap' in accessing
> > > the queued payload at every request?
> > >
> >
> > This API give Xen device model (QEMU or kvmtool) the ability to map
> > whole guest RAM in device model's address space. In this case, device
> > model doesn't need dynamic hypercall to map/unmap payload memory.
> > It can use a flat offset to access payload memory in its address
> > space directly. Just Like KVM device model does now.
>
Yes!


>
> Thank you. Quickly, let me make sure one thing:
> This API itself doesn't do any mapping operations, right?


Right. The only purpose of that "API" is to guery hypervisor to find
unallocated address space ranges to map the foreign pages into (instead of
stealing real RAM pages),
In a nutshell, if you try to map the whole guest memory in the backend
address space on Arm (or even cache some mappings) you might end up with
memory exhaustion in the backend domain (XSA-300),
and the possibility to hit XSA-300 is higher if your backend needs to serve
several Guests. Of course, this depends on the memory assigned to the
backend domain and to the Guest(s) it serves...
We believe that with the proposed solution the backend will be able to
handle Guest(s) without wasting it's real RAM. However, please note that
proposed Xen + Linux changes which are on review now [1] are far from the
final solution and require rework and some prereq work to operate in a
proper and safe way.


>
> So I suppose that virtio BE guest is responsible to
> 1) fetch the information about all the memory regions in FE,
> 2) call this API to allocate a big chunk of unused space in BE,
> 3) create grant/foreign mappings for FE onto this region(S)
> in the initialization/configuration of emulated virtio devices.
>
> Is this the way this API is expected to be used?
>

No really, the userspace backend doesn't need to call this API at all, all
what backend calls is still
xenforeignmemory_map()/xenforeignmemory_unmap(), so let's say "magic" is
done by Linux and Xen internally.
You can take a look at the virtio-disk PoC [2] (last 4 patches) to better
understand what Wei and I are talking about. There we map the Guest memory
at the beginning and just calculate a pointer at runtime. Again, the code
is not in good shape, but it is enough to demonstrate the feasibility of
the improvement.



> Does Xen already has an interface for (1)?
>

I am not aware of anything existing. For the PoC I guessed the Guest memory
layout in a really hackish way (I got total Guest memory size, so having
GUEST_RAMX_BASE/GUEST_RAMX_SIZE in hand just performed calculation).
Definitely, it is a no-go, so 1) deserves additional discussion/design.

[1]
https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/lkml/1627490656-1267-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/lkml/1627490656-1267-2-git-send-email-olekstysh@gmail.com/
[2]
https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next
-- 
Regards,

Oleksandr Tyshchenko

--00000000000033f5d805caf1878f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi Akashi,</div><div><br><=
/div><div>I am sorry for the possible format issues.</div><div><br></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It&#39;s a RFC discussion. We have tested this RFC patch int=
ernally.<br>
&gt; &gt; &gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-de=
vel/2021-" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.or=
g/archives/html/xen-devel/2021-</a><br>
&gt; &gt; 07/msg01532.html<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m afraid that I miss something here, but I don&#39;t know<b=
r>
&gt; &gt; why this proposed API will lead to eliminating &#39;mmap&#39; in =
accessing<br>
&gt; &gt; the queued payload at every request?<br>
&gt; &gt; <br>
&gt; <br>
&gt; This API give Xen device model (QEMU or kvmtool) the ability to map<br=
>
&gt; whole guest RAM in device model&#39;s address space. In this case, dev=
ice<br>
&gt; model doesn&#39;t need dynamic hypercall to map/unmap payload memory.<=
br>
&gt; It can use a flat offset to access payload memory in its address<br>
&gt; space directly. Just Like KVM device model does now.<br></blockquote><=
div>Yes!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Thank you. Quickly, let me make sure one thing:<br>
This API itself doesn&#39;t do any mapping operations, right?</blockquote><=
div>=C2=A0</div><div>Right. The only purpose of that &quot;API&quot; is to =
guery hypervisor to find unallocated address space ranges to map the foreig=
n pages into (instead of stealing real RAM pages),</div><div>In a nutshell,=
 if you try to map the whole guest memory in the backend address space on A=
rm (or even cache some mappings) you might end up with memory exhaustion in=
 the backend domain (XSA-300),</div><div>and the possibility to hit XSA-300=
 is higher if your backend needs to serve several Guests. Of course, this d=
epends on the memory assigned to the backend domain and to the Guest(s) it =
serves...</div><div>We believe that with the proposed solution the backend =
will be able to handle Guest(s) without wasting it&#39;s real RAM. However,=
 please note that proposed Xen=C2=A0+ Linux changes which are on review now=
 [1] are far from the final solution and require rework and some prereq wor=
k to operate in a proper and safe way.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
So I suppose that virtio BE guest is responsible to<br>
1) fetch the information about all the memory regions in FE,<br>
2) call this API to allocate a big chunk of unused space in BE,<br>
3) create grant/foreign mappings for FE onto this region(S)<br>
in the initialization/configuration of emulated virtio devices.<br>
<br>
Is this the way this API is expected to be used?<br></blockquote><div>=C2=
=A0</div><div>No really, the userspace backend doesn&#39;t need to call thi=
s API at all, all what backend calls is still xenforeignmemory_map()/xenfor=
eignmemory_unmap(), so let&#39;s say &quot;magic&quot; is done by Linux and=
 Xen internally.</div><div>You can take a look at the virtio-disk PoC [2] (=
last 4 patches) to better understand what Wei and I are talking about. Ther=
e we map the Guest memory at the beginning and just calculate a pointer at =
runtime. Again, the code</div><div>is not in good shape, but it is enough t=
o demonstrate the feasibility of the improvement.</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Does Xen already has an interface for (1)?<br></blockquote><div>=C2=A0</div=
><div>I am not aware of anything existing. For the PoC I guessed the Guest =
memory layout in a really hackish way (I got total Guest memory size, so ha=
ving GUEST_RAMX_BASE/GUEST_RAMX_SIZE in hand just performed calculation). D=
efinitely, it is a no-go, so 1) deserves additional discussion/design.</div=
></div><div><br></div><div>[1] <br><a href=3D"https://lore.kernel.org/xen-d=
evel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/">https://lore.k=
ernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/<=
/a><br><a href=3D"https://lore.kernel.org/lkml/1627490656-1267-1-git-send-e=
mail-olekstysh@gmail.com/">https://lore.kernel.org/lkml/1627490656-1267-1-g=
it-send-email-olekstysh@gmail.com/</a><br><a href=3D"https://lore.kernel.or=
g/lkml/1627490656-1267-2-git-send-email-olekstysh@gmail.com/">https://lore.=
kernel.org/lkml/1627490656-1267-2-git-send-email-olekstysh@gmail.com/</a><b=
r></div><div>[2]=C2=A0</div><div><a href=3D"https://github.com/otyshchenko1=
/virtio-disk/commits/map_opt_next">https://github.com/otyshchenko1/virtio-d=
isk/commits/map_opt_next</a></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span=
 style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=
=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font=
></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenk=
o</font></span></div></div></div></div></div></div></div></div>

--00000000000033f5d805caf1878f--

