Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5336402E2C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 20:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181298.328395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNfXa-0005hZ-K5; Tue, 07 Sep 2021 18:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181298.328395; Tue, 07 Sep 2021 18:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNfXa-0005eh-Gy; Tue, 07 Sep 2021 18:09:50 +0000
Received: by outflank-mailman (input) for mailman id 181298;
 Tue, 07 Sep 2021 18:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3oQ=N5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mNfXZ-0005eb-J0
 for xen-devel@lists.xen.org; Tue, 07 Sep 2021 18:09:49 +0000
Received: from mail-oi1-x22f.google.com (unknown [2607:f8b0:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e4df1ca-9116-47f3-8ca0-a63691a40011;
 Tue, 07 Sep 2021 18:09:47 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bi4so13838516oib.9
 for <xen-devel@lists.xen.org>; Tue, 07 Sep 2021 11:09:47 -0700 (PDT)
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
X-Inumbo-ID: 0e4df1ca-9116-47f3-8ca0-a63691a40011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aVw++g1itE5W1KXRa2qBfqmZ00VcJA2TbGtfWD/TAkI=;
        b=Pno1ppX3t5c+a8nm871i+2J1n2BTXpQiYb+0xVgI98VEyKggmXDlkBqbsM/rLw+apF
         TObj4WW/6sqIscc58HqCalPz9bfinKhEMT/xR6A9uHnvn5W8HRiL4L4PPh0r79kRZffG
         peNo0DzLXFSzrt79CrL4LhA+KbPYfrI0h4RpVYpHY6/wQINkaK9Z1kQHCsok6L8MUFAW
         galdV+YBy69bYskaJcQ6lemREOUgxrQjQi3bxGh5wC/ElN38IEE5HO2bvX0sDJL05qoH
         2y3wuFdRC7P/JSAvrSCE1BkKkq0PBtH+fA6bXBO2OMGgoqoE+smATTEkQrIdHBBD1Ab/
         bXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVw++g1itE5W1KXRa2qBfqmZ00VcJA2TbGtfWD/TAkI=;
        b=RRF+4gVwezgI/4GVvxrQvJmeTVdlS+S3jHYg3TjHKeIZ9czYYgMMgid8dmponYWFjv
         QRtcuI/f6eLwdqDODkh36H2E/NUVKXwZg1qchQG3td8F/qH3xXVKnA+bmLnQbiUqv02z
         BqXCyuzOLjsleHpARhSucWmaWTEYr3AqFvVzZMgwK8qnK1wsLEmG2eyhBbvBYdEL0VeC
         rx0jGufZCLQtNQR2KGw4KlATCsOTUj82gmb3QPu8who8fPNvew/PpKQUQDKyVk1WyMrn
         myzrVWpdFeiv0+SBDr5hYmCTBr99/qVjQbnW364uJvE9qyIvdIybUEVObI8wM5BERmAy
         zh/g==
X-Gm-Message-State: AOAM5338EUjSgINvSEeJ38EHSH/ZnK2YPac68JNa+3Ptor0wrrMr2NBi
	yc28TedQjq/YHQLsXzedQgCUenNYtM3Bcsn4GhE=
X-Google-Smtp-Source: ABdhPJy3qil9pHk//YzKgBCdmYRr9vXF2WvPB4AvwKW/VBzOF3cQYTL8LpdSl6GW6VODwOTT7axdkrNAu6sm37ATyNc=
X-Received: by 2002:a05:6808:690:: with SMTP id k16mr4024290oig.152.1631038186568;
 Tue, 07 Sep 2021 11:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <DB9PR08MB6857C656472153A42FB438C49EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210818053840.GE39588@laputa> <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa> <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CACMJ4GbmNgbB5ponYt3NGEk3j6YCksot+kDy2qs8HMdFXWnQbw@mail.gmail.com>
 <CACMJ4GbqPc29n+CAknY4kCjrQnkCSR=W+rymuY7Xa1EZb0MW5w@mail.gmail.com>
 <20210902071902.GC71098@laputa> <CACMJ4GYY0wkm0vOzJfq8M9dCxPq1ZFwWT8Q73rMjqtrP7if-Zw@mail.gmail.com>
 <20210907115501.GC49004@laputa>
In-Reply-To: <20210907115501.GC49004@laputa>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 7 Sep 2021 11:09:34 -0700
Message-ID: <CACMJ4GYvndK6Cat-cZxM3rJ+6Ys2-hT=0_QivQ4md1MHAGbN3Q@mail.gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Alex Benn??e" <alex.bennee@linaro.org>, 
	Kaly Xin <Kaly.Xin@arm.com>, Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, "stefanha@redhat.com" <stefanha@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>, 
	"pratikp@quicinc.com" <pratikp@quicinc.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <paul@xen.org>, Xen Devel <xen-devel@lists.xen.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, James McKenzie <james@bromium.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000b9c09e05cb6bab7a"

--000000000000b9c09e05cb6bab7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 4:55 AM AKASHI Takahiro <takahiro.akashi@linaro.org>
wrote:

> Hi,
>
> I have not covered all your comments below yet.
> So just one comment:
>
> On Mon, Sep 06, 2021 at 05:57:43PM -0700, Christopher Clark wrote:
> > On Thu, Sep 2, 2021 at 12:19 AM AKASHI Takahiro <
> takahiro.akashi@linaro.org>
> > wrote:
>
> (snip)
>
> > >    It appears that, on FE side, at least three hypervisor calls (and
> data
> > >    copying) need to be invoked at every request, right?
> > >
> >
> > For a write, counting FE sendv ops:
> > 1: the write data payload is sent via the "Argo ring for writes"
> > 2: the descriptor is sent via a sync of the available/descriptor ring
> >   -- is there a third one that I am missing?
>
> In the picture, I can see
> a) Data transmitted by Argo sendv
> b) Descriptor written after data sendv
> c) VirtIO ring sync'd to back-end via separate sendv
>
> Oops, (b) is not a hypervisor call, is it?
>

That's correct, it is not - the blue arrows in the diagram are not
hypercalls, they are intended to show data movement or action in the flow
of performing the operation, and (b) is a data write within the guest's
address space into the descriptor ring.



> (But I guess that you will have to have yet another call for notification
> since there is no config register of QueueNotify?)
>

Reasoning about hypercalls necessary for data movement:

VirtIO transport drivers are responsible for instantiating virtqueues
(setup_vq) and are able to populate the notify function pointer in the
virtqueue that they supply. The virtio-argo transport driver can provide a
suitable notify function implementation that will issue the Argo hypercall
sendv hypercall(s) for sending data from the guest frontend to the backend.
By issuing the sendv at the time of the queuenotify, rather than as each
buffer is added to the virtqueue, the cost of the sendv hypercall can be
amortized over multiple buffer additions to the virtqueue.

I also understand that there has been some recent work in the Linaro
Project Stratos on "Fat Virtqueues", where the data to be transmitted is
included within an expanded virtqueue, which could further reduce the
number of hypercalls required, since the data can be transmitted inline
with the descriptors.
Reference here:
https://linaro.atlassian.net/wiki/spaces/STR/pages/25626313982/2021-01-21+P=
roject+Stratos+Sync+Meeting+notes
https://linaro.atlassian.net/browse/STR-25

As a result of the above, I think that a single hypercall could be
sufficient for communicating data for multiple requests, and that a
two-hypercall-per-request (worst case) upper bound could also be
established.

Christopher



>
> Thanks,
> -Takahiro Akashi
>
>
> > Christopher
> >
> >
> > >
> > > Thanks,
> > > -Takahiro Akashi
> > >
> > >
> > > > * Here are the design documents for building VirtIO-over-Argo, to
> > > support a
> > > >   hypervisor-agnostic frontend VirtIO transport driver using Argo.
> > > >
> > > > The Development Plan to build VirtIO virtual device support over Ar=
go
> > > > transport:
> > > >
> > >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development+Phase+1
> > > >
> > > > A design for using VirtIO over Argo, describing how VirtIO data
> > > structures
> > > > and communication is handled over the Argo transport:
> > > >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO+Argo
> > > >
> > > > Diagram (from the above document) showing how VirtIO rings are
> > > synchronized
> > > > between domains without using shared memory:
> > > >
> > >
> https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#media-b=
lob-url=3Dtrue&id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&collection=3Dconte=
ntId-1348763698&contextId=3D1348763698&mimeType=3Dimage%2Fpng&name=3Ddevice=
-buffer-access-virtio-argo.png&size=3D243175&width=3D1106&height=3D1241
> > > >
> > > > Please note that the above design documents show that the existing
> VirtIO
> > > > device drivers, and both vring and virtqueue data structures can be
> > > > preserved
> > > > while interdomain communication can be performed with no shared
> memory
> > > > required
> > > > for most drivers; (the exceptions where further design is required
> are
> > > those
> > > > such as virtual framebuffer devices where shared memory regions are
> > > > intentionally
> > > > added to the communication structure beyond the vrings and
> virtqueues).
> > > >
> > > > An analysis of VirtIO and Argo, informing the design:
> > > >
> > >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+=
Argo+as+a+transport+medium+for+VirtIO
> > > >
> > > > * Argo can be used for a communication path for configuration
> between the
> > > > backend
> > > >   and the toolstack, avoiding the need for a dependency on XenStore=
,
> > > which
> > > > is an
> > > >   advantage for any hypervisor-agnostic design. It is also amenable
> to a
> > > > notification
> > > >   mechanism that is not based on Xen event channels.
> > > >
> > > > * Argo does not use or require shared memory between VMs and
> provides an
> > > > alternative
> > > >   to the use of foreign shared memory mappings. It avoids some of t=
he
> > > > complexities
> > > >   involved with using grants (eg. XSA-300).
> > > >
> > > > * Argo supports Mandatory Access Control by the hypervisor,
> satisfying a
> > > > common
> > > >   certification requirement.
> > > >
> > > > * The Argo headers are BSD-licensed and the Xen hypervisor
> implementation
> > > > is GPLv2 but
> > > >   accessible via the hypercall interface. The licensing should not
> > > present
> > > > an obstacle
> > > >   to adoption of Argo in guest software or implementation by other
> > > > hypervisors.
> > > >
> > > > * Since the interface that Argo presents to a guest VM is similar t=
o
> > > DMA, a
> > > > VirtIO-Argo
> > > >   frontend transport driver should be able to operate with a physic=
al
> > > > VirtIO-enabled
> > > >   smart-NIC if the toolstack and an Argo-aware backend provide
> support.
> > > >
> > > > The next Xen Community Call is next week and I would be happy to
> answer
> > > > questions
> > > > about Argo and on this topic. I will also be following this thread.
> > > >
> > > > Christopher
> > > > (Argo maintainer, Xen Community)
> > > >
> > > >
> > >
> -------------------------------------------------------------------------=
-------
> > > > [1]
> > > > An introduction to Argo:
> > > >
> > >
> https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-=
%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
> > > > https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ
> > > > Xen Wiki page for Argo:
> > > >
> > >
> https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)=
_for_Xen
> > > >
> > > > [2]
> > > > OpenXT Linux Argo driver and userspace library:
> > > > https://github.com/openxt/linux-xen-argo
> > > >
> > > > Windows V4V at OpenXT wiki:
> > > > https://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/V4V
> > > > Windows v4v driver source:
> > > > https://github.com/OpenXT/xc-windows/tree/master/xenv4v
> > > >
> > > > HP/Bromium uXen V4V driver:
> > > > https://github.com/uxen-virt/uxen/tree/ascara/windows/uxenv4vlib
> > > >
> > > > [3]
> > > > v2 of the Argo test unikernel for XTF:
> > > >
> > >
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02234.htm=
l
> > > >
> > > > [4]
> > > > Argo HMX Transport for VirtIO meeting minutes:
> > > >
> > >
> https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.htm=
l
> > > >
> > > > VirtIO-Argo Development wiki page:
> > > >
> > >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development+Phase+1
> > > >
> > >
> > >
>

--000000000000b9c09e05cb6bab7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 4:55 AM AKASHI=
 Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">takahiro.akashi=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
I have not covered all your comments below yet.<br>
So just one comment:<br>
<br>
On Mon, Sep 06, 2021 at 05:57:43PM -0700, Christopher Clark wrote:<br>
&gt; On Thu, Sep 2, 2021 at 12:19 AM AKASHI Takahiro &lt;<a href=3D"mailto:=
takahiro.akashi@linaro.org" target=3D"_blank">takahiro.akashi@linaro.org</a=
>&gt;<br>
&gt; wrote:<br>
<br>
(snip)<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 It appears that, on FE side, at least three hypervis=
or calls (and data<br>
&gt; &gt;=C2=A0 =C2=A0 copying) need to be invoked at every request, right?=
<br>
&gt; &gt;<br>
&gt; <br>
&gt; For a write, counting FE sendv ops:<br>
&gt; 1: the write data payload is sent via the &quot;Argo ring for writes&q=
uot;<br>
&gt; 2: the descriptor is sent via a sync of the available/descriptor ring<=
br>
&gt;=C2=A0 =C2=A0-- is there a third one that I am missing?<br>
<br>
In the picture, I can see<br>
a) Data transmitted by Argo sendv<br>
b) Descriptor written after data sendv<br>
c) VirtIO ring sync&#39;d to back-end via separate sendv<br>
<br>
Oops, (b) is not a hypervisor call, is it?<br></blockquote><div><br></div><=
div>That&#39;s correct, it is not - the blue arrows in the diagram are not =
hypercalls, they are intended to show data movement or action in the flow o=
f performing the operation, and (b) is a data write within the guest&#39;s =
address space into the descriptor ring.</div><div><br></div><div>=C2=A0<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
(But I guess that you will have to have yet another call for notification<b=
r>
since there is no config register of QueueNotify?)<br></blockquote><div><br=
></div><div>Reasoning about hypercalls necessary for data movement:</div><d=
iv><br></div><div>VirtIO transport drivers are responsible for instantiatin=
g virtqueues (setup_vq) and are able to populate the notify function pointe=
r in the virtqueue that they supply. The virtio-argo transport driver can p=
rovide a suitable notify function implementation that will issue the Argo h=
ypercall sendv hypercall(s) for sending data from the guest frontend to the=
 backend. By issuing the sendv at the time of the queuenotify, rather than =
as each buffer is added to the virtqueue, the cost of the sendv hypercall c=
an be amortized over multiple buffer additions to the virtqueue.</div><div>=
<br></div><div><div>I also understand that there has been some recent work =
in the Linaro Project Stratos on &quot;Fat Virtqueues&quot;, where the data=
 to be transmitted is included within an expanded virtqueue, which could fu=
rther reduce the number of hypercalls required, since the data can be trans=
mitted inline with the descriptors.</div><div>Reference here:<br></div><div=
><a href=3D"https://linaro.atlassian.net/wiki/spaces/STR/pages/25626313982/=
2021-01-21+Project+Stratos+Sync+Meeting+notes">https://linaro.atlassian.net=
/wiki/spaces/STR/pages/25626313982/2021-01-21+Project+Stratos+Sync+Meeting+=
notes</a><br></div><div><a href=3D"https://linaro.atlassian.net/browse/STR-=
25">https://linaro.atlassian.net/browse/STR-25</a><br></div><br class=3D"gm=
ail-Apple-interchange-newline"></div><div>As a result of the above, I think=
 that a single hypercall could be sufficient for communicating data for mul=
tiple requests, and that a two-hypercall-per-request (worst case) upper bou=
nd could also be established.</div><div><br></div><div>Christopher</div><di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Thanks,<br>
-Takahiro Akashi<br>
<br>
<br>
&gt; Christopher<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; -Takahiro Akashi<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; * Here are the design documents for building VirtIO-over-Arg=
o, to<br>
&gt; &gt; support a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hypervisor-agnostic frontend VirtIO transport dr=
iver using Argo.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The Development Plan to build VirtIO virtual device support =
over Argo<br>
&gt; &gt; &gt; transport:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/1696=
169985/VirtIO-Argo+Development+Phase+1" rel=3D"noreferrer" target=3D"_blank=
">https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development+Phase+1</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A design for using VirtIO over Argo, describing how VirtIO d=
ata<br>
&gt; &gt; structures<br>
&gt; &gt; &gt; and communication is handled over the Argo transport:<br>
&gt; &gt; &gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages=
/1348763698/VirtIO+Argo" rel=3D"noreferrer" target=3D"_blank">https://openx=
t.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO+Argo</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Diagram (from the above document) showing how VirtIO rings a=
re<br>
&gt; &gt; synchronized<br>
&gt; &gt; &gt; between domains without using shared memory:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-a=
bd4377a1194#media-blob-url=3Dtrue&amp;id=3D01f7d0e1-7686-4f0b-88e1-457c1d30=
df40&amp;collection=3DcontentId-1348763698&amp;contextId=3D1348763698&amp;m=
imeType=3Dimage%2Fpng&amp;name=3Ddevice-buffer-access-virtio-argo.png&amp;s=
ize=3D243175&amp;width=3D1106&amp;height=3D1241" rel=3D"noreferrer" target=
=3D"_blank">https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a11=
94#media-blob-url=3Dtrue&amp;id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&amp;=
collection=3DcontentId-1348763698&amp;contextId=3D1348763698&amp;mimeType=
=3Dimage%2Fpng&amp;name=3Ddevice-buffer-access-virtio-argo.png&amp;size=3D2=
43175&amp;width=3D1106&amp;height=3D1241</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Please note that the above design documents show that the ex=
isting VirtIO<br>
&gt; &gt; &gt; device drivers, and both vring and virtqueue data structures=
 can be<br>
&gt; &gt; &gt; preserved<br>
&gt; &gt; &gt; while interdomain communication can be performed with no sha=
red memory<br>
&gt; &gt; &gt; required<br>
&gt; &gt; &gt; for most drivers; (the exceptions where further design is re=
quired are<br>
&gt; &gt; those<br>
&gt; &gt; &gt; such as virtual framebuffer devices where shared memory regi=
ons are<br>
&gt; &gt; &gt; intentionally<br>
&gt; &gt; &gt; added to the communication structure beyond the vrings and v=
irtqueues).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; An analysis of VirtIO and Argo, informing the design:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/1333=
428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO" rel=3D"noreferrer=
" target=3D"_blank">https://openxt.atlassian.net/wiki/spaces/DC/pages/13334=
28225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; * Argo can be used for a communication path for configuratio=
n between the<br>
&gt; &gt; &gt; backend<br>
&gt; &gt; &gt;=C2=A0 =C2=A0and the toolstack, avoiding the need for a depen=
dency on XenStore,<br>
&gt; &gt; which<br>
&gt; &gt; &gt; is an<br>
&gt; &gt; &gt;=C2=A0 =C2=A0advantage for any hypervisor-agnostic design. It=
 is also amenable to a<br>
&gt; &gt; &gt; notification<br>
&gt; &gt; &gt;=C2=A0 =C2=A0mechanism that is not based on Xen event channel=
s.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; * Argo does not use or require shared memory between VMs and=
 provides an<br>
&gt; &gt; &gt; alternative<br>
&gt; &gt; &gt;=C2=A0 =C2=A0to the use of foreign shared memory mappings. It=
 avoids some of the<br>
&gt; &gt; &gt; complexities<br>
&gt; &gt; &gt;=C2=A0 =C2=A0involved with using grants (eg. XSA-300).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; * Argo supports Mandatory Access Control by the hypervisor, =
satisfying a<br>
&gt; &gt; &gt; common<br>
&gt; &gt; &gt;=C2=A0 =C2=A0certification requirement.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; * The Argo headers are BSD-licensed and the Xen hypervisor i=
mplementation<br>
&gt; &gt; &gt; is GPLv2 but<br>
&gt; &gt; &gt;=C2=A0 =C2=A0accessible via the hypercall interface. The lice=
nsing should not<br>
&gt; &gt; present<br>
&gt; &gt; &gt; an obstacle<br>
&gt; &gt; &gt;=C2=A0 =C2=A0to adoption of Argo in guest software or impleme=
ntation by other<br>
&gt; &gt; &gt; hypervisors.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; * Since the interface that Argo presents to a guest VM is si=
milar to<br>
&gt; &gt; DMA, a<br>
&gt; &gt; &gt; VirtIO-Argo<br>
&gt; &gt; &gt;=C2=A0 =C2=A0frontend transport driver should be able to oper=
ate with a physical<br>
&gt; &gt; &gt; VirtIO-enabled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0smart-NIC if the toolstack and an Argo-aware bac=
kend provide support.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The next Xen Community Call is next week and I would be happ=
y to answer<br>
&gt; &gt; &gt; questions<br>
&gt; &gt; &gt; about Argo and on this topic. I will also be following this =
thread.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Christopher<br>
&gt; &gt; &gt; (Argo maintainer, Xen Community)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; -----------------------------------------------------------------=
---------------<br>
&gt; &gt; &gt; [1]<br>
&gt; &gt; &gt; An introduction to Argo:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://static.sched.com/hosted_files/xensummit19/92/A=
rgo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%2=
02019.pdf" rel=3D"noreferrer" target=3D"_blank">https://static.sched.com/ho=
sted_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%2=
0Clark%20-%20Xen%20Summit%202019.pdf</a><br>
&gt; &gt; &gt; <a href=3D"https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ" re=
l=3D"noreferrer" target=3D"_blank">https://www.youtube.com/watch?v=3DcnC0Tg=
3jqJQ</a><br>
&gt; &gt; &gt; Xen Wiki page for Argo:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Medi=
ated_Exchange_(HMX)_for_Xen" rel=3D"noreferrer" target=3D"_blank">https://w=
iki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen</a=
><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [2]<br>
&gt; &gt; &gt; OpenXT Linux Argo driver and userspace library:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/openxt/linux-xen-argo" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openxt/linux-xen-argo</a><=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Windows V4V at OpenXT wiki:<br>
&gt; &gt; &gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages=
/14844007/V4V" rel=3D"noreferrer" target=3D"_blank">https://openxt.atlassia=
n.net/wiki/spaces/DC/pages/14844007/V4V</a><br>
&gt; &gt; &gt; Windows v4v driver source:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/OpenXT/xc-windows/tree/master/=
xenv4v" rel=3D"noreferrer" target=3D"_blank">https://github.com/OpenXT/xc-w=
indows/tree/master/xenv4v</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; HP/Bromium uXen V4V driver:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/uxen-virt/uxen/tree/ascara/win=
dows/uxenv4vlib" rel=3D"noreferrer" target=3D"_blank">https://github.com/ux=
en-virt/uxen/tree/ascara/windows/uxenv4vlib</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [3]<br>
&gt; &gt; &gt; v2 of the Argo test unikernel for XTF:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2=
021-01/msg02234.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xe=
nproject.org/archives/html/xen-devel/2021-01/msg02234.html</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [4]<br>
&gt; &gt; &gt; Argo HMX Transport for VirtIO meeting minutes:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2=
021-02/msg01422.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xe=
nproject.org/archives/html/xen-devel/2021-02/msg01422.html</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; VirtIO-Argo Development wiki page:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/1696=
169985/VirtIO-Argo+Development+Phase+1" rel=3D"noreferrer" target=3D"_blank=
">https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development+Phase+1</a><br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000b9c09e05cb6bab7a--

