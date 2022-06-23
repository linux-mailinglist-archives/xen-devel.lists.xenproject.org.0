Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E030E557A9F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354927.582299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MFn-00085N-H8; Thu, 23 Jun 2022 12:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354927.582299; Thu, 23 Jun 2022 12:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MFn-000824-E6; Thu, 23 Jun 2022 12:48:11 +0000
Received: by outflank-mailman (input) for mailman id 354927;
 Thu, 23 Jun 2022 12:48:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1C=W6=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o4MFm-00081q-4X
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:48:10 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb2c6cdf-f2f2-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 14:48:08 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id 9so758047pgd.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jun 2022 05:48:08 -0700 (PDT)
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
X-Inumbo-ID: bb2c6cdf-f2f2-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7QM3IbvgTeKSF1AeqGPT8Oqd/hSxzNXQVDL5ZIkzm6I=;
        b=H68DIjkg3HLdsH9efZ789irYXfiqTASoTolbsj4LiPa7FajORo8fhJMaz5eCZDUOHW
         n3CPHeXQ2Ubn8OZpndaZK4wHf5JYRaP1mxrc8+dFIKKP0AVqZCNyswSIkxWK7okmwiZz
         WMRUgQiwt+m1RDPUZaWcXH86wqb6XsOpGYMozVr2741f/52VyiO1sDWpFMDZ3/SrFoBv
         6uISYCbJ1Kw2c9EaBL1835gghRr8YLY6Ubk8ef6qTN4wUBkK6mxOuMgpZv4Kbq2cWTQf
         H3iEMUVgVxm6a9QhrzNiqEw5x5Y6OUrLTRqx0cNSrv9csiYv5LM6PeeyLJ+l0/I51MG+
         3+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7QM3IbvgTeKSF1AeqGPT8Oqd/hSxzNXQVDL5ZIkzm6I=;
        b=2s2Y3viJvjw8FoPzBPURynRSfKtZbiO6bHK5UYkANSMEnSxBjVLaC7a1X4+thQEfzj
         MDb9KfEqJkdVGAAsKVSiJFO+OqvK5EOnwnWvAHxiuMKed7alsDihwzrpgvEFEAfvzP9a
         We35N5obZZcqtwqEebV6vDI17Cr4zi9qOMLv4pB9UFB/3RX5eYITrkynXH+x1C/XPOXt
         fGkdqDOdGwOdWLAgm0cBQjNIF/h7pr2otqLAjrQy7584ifq+Exs36CT/nJ//LmSgwtne
         xBmjCe40X1f3ex/JJy8ByngvxPa6aKg9GKY0zohrPbbMab6X6eeYAkI7ivfTIpbtDLsJ
         +6SA==
X-Gm-Message-State: AJIora/vxJ/Q6kPIblmbKqNP479d3HZQaA/2R0DVv9tiM4ddAutiSRSv
	w78OPX6XOv/i6dmPLlQvw8AMrtJqF1fSuqD9+uDzEMLRpZE=
X-Google-Smtp-Source: AGRyM1uWifUE9NJLKsFI77+ViiqFmFM3C5K8EcqC/jm8VhRXSLYS3VCFbqRpjNiGT1+yor/vsums8BXeElWEeCC7Vk8=
X-Received: by 2002:a63:3409:0:b0:40c:9736:287 with SMTP id
 b9-20020a633409000000b0040c97360287mr7592789pga.14.1655988487104; Thu, 23 Jun
 2022 05:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7> <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220622114950.lpidph5ugvozhbu5@vireshk-i7> <CAPD2p-kFeC8FygFcbpEbH3CzrAM7Td+G68t9ebOFR4V0w1dpEQ@mail.gmail.com>
 <20220623054819.do25phfuumnexw73@vireshk-i7>
In-Reply-To: <20220623054819.do25phfuumnexw73@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 23 Jun 2022 15:47:55 +0300
Message-ID: <CAPD2p-=OMDMqdV27E2jTTcE0gx1eiT+9TqLeOVH2u6YfwT_8pg@mail.gmail.com>
Subject: Re: Virtio on Xen with Rust
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="00000000000086ab8e05e21cdd24"

--00000000000086ab8e05e21cdd24
Content-Type: text/plain; charset="UTF-8"

Hello Viresh

[sorry for the possible format issues]

On Thu, Jun 23, 2022 at 8:48 AM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 22-06-22, 18:05, Oleksandr Tyshchenko wrote:
> > Even leaving
> > aside the fact that restricted virtio memory access in the guest means
> that
> > not all of guest memory can be accessed, so even having pre-maped guest
> > memory in advance, we are not able to calculate a host pointer as we
> don't
> > know which gpa the particular grant belongs to.
>
> Ahh, I clearly missed that as well. We can't simply convert the
> address here on the requests :(
>


Exactly, the grant represents the granted guest page, but the backend
doesn't know the guest physical address of that page and it shouldn't know
it, that is the point.
So the backend can only map granted pages, for which the guest explicitly
calls dma_map_*(). The more, currently the backend shouldn't keep them
mapped more than necessary, for example to cache mappings. Otherwise, when
calling dma_unmap_*() guest will notice that grant is still in use by the
backend and complain.



>
> > I am not sure that I understand this use-case.
> > Well, let's consider the virtio-disk example, it demonstrates three
> > possible memory mapping modes:
> > 1. All addresses are gpa, map/unmap at runtime using foreign mappings
> > 2. All addresses are gpa, map in advance using foreign mappings
> > 3. All addresses are grants, only map/unmap at runtime using grants
> mappings
> >
> > If you are asking about #4 which would imply map in advance together with
> > using grants then I think, no. This won't work with the current stuff.
> > These are conflicting opinions, either grants and map at runtime or gpa
> and
> > map in advance.
> > If there is a wish to optimize when using grants then "maybe" it is worth
> > looking into how persistent grants work for PV block device for example
> > (feature-persistent in blkif.h).
>
> I though #4 may make it work for our setup, but it isn't what we need
> necessarily.
>
> The deal is that we want hypervisor agnostic backends, they won't and
> shouldn't know what hypervisor they are running against. So ideally,
> no special handling.
>

I see and agree


>
> To make it work, the simplest of the solutions can be to map all that
> we need in advance, when the vhost negotiations happen and memory
> regions are passed to the backend. It doesn't necessarily mean mapping
> entire guest, but just the regions we need.


> With what I have understood about grants until now, I don't think it
> will work straight away.
>

yes

Below is my understanding, which might be wrong.

I am not sure about x86, there are some moments with its modes, for example
PV guests should always use grants for virtio, but on Arm (which guest type
is HVM):
1. If you run backend(s) in dom0 which is trusted by default, you don't
necessarily need to use grants for the virtio so you will be able to map
what you need in advance using foreign mappings.
2. If you run backend(s) in another domain *which you trust* and you don't
want to use grants for the virtio, I think, you also will be able to map in
advance using foreign mappings, but for that you will need a security
policy to allow your backend's domain to map arbitrary guest pages.
3. If you run backend(s) in non-trusted domain, you will have to use grants
for the virtio, so there is no way to map in advance, only to map at the
runtime what was previously granted by the guest and umap right after using
it.

These is another method how to restrict backend without modifying guest
which is CONFIG_DMA_RESTRICTED_POOL in Linux, but this includes memcpy in
the guest and requires some support in toolstack to make it work, but I
wouldn't
suggest it as the usage of grants for the virtio is better (and already in
upsteam).

Regarding your previous attempt to map 512MB by using grants, what I
understand from the error message is that Xen complains that the passed
grant ref is bigger than the current number of grant table entries.
Now I am wondering where do these 0x40000 - 0x5ffff grant refs (which
backend tries to map in a single call) come from, are they really were
previously granted by the guest and passed to the backend in a
single request?
If the answer is yes, then what does gnttab_usage_print_all() say (key 'g'
in Xen console)? I expect there should be a lot of Xen messages like
"common/grant_table.c:1882:d2v3 Expanding d2 grant table from 28 to 29
frames. Do you see them?



>
> > Yes, this is the correct environment. Please note that Juergen has
> recently
> > pushed new version [1]
>
> Yeah, I am following them up, will test the one you all agree on :)
>
> Thanks.
>
> --
> viresh
>


-- 
Regards,

Oleksandr Tyshchenko

--00000000000086ab8e05e21cdd24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">Hello Viresh<b=
r><br>[sorry for the possible format issues]<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 8:4=
8 AM Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kum=
ar@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 22-06-22, 18:05, Oleksandr Tyshchenko wrote:<br>
&gt; Even leaving<br>
&gt; aside the fact that restricted virtio memory access in the guest means=
 that<br>
&gt; not all of guest memory can be accessed, so even having pre-maped gues=
t<br>
&gt; memory in advance, we are not able to calculate a host pointer as we d=
on&#39;t<br>
&gt; know which gpa the particular grant belongs to.<br>
<br>
Ahh, I clearly missed that as well. We can&#39;t simply convert the<br>
address here on the requests :(<br></blockquote><div><br></div><div><br></d=
iv><div>Exactly, the grant represents the granted guest page, but the backe=
nd doesn&#39;t know the guest physical address of that page and it shouldn&=
#39;t know it, that is the point.<br>So the backend can only map granted pa=
ges, for which the guest explicitly calls dma_map_*(). The more, currently =
the backend shouldn&#39;t keep them mapped more than necessary, for example=
 to cache mappings. Otherwise, when calling dma_unmap_*() guest will notice=
 that grant is still in use by the backend and complain.<br></div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I am not sure that I understand this use-case.<br>
&gt; Well, let&#39;s consider the virtio-disk example, it demonstrates thre=
e<br>
&gt; possible memory mapping modes:<br>
&gt; 1. All addresses are gpa, map/unmap at runtime using foreign mappings<=
br>
&gt; 2. All addresses are gpa, map in advance using foreign mappings<br>
&gt; 3. All addresses are grants, only map/unmap at runtime using grants ma=
ppings<br>
&gt; <br>
&gt; If you are asking about #4 which would imply map in advance together w=
ith<br>
&gt; using grants then I think, no. This won&#39;t work with the current st=
uff.<br>
&gt; These are conflicting opinions, either grants and map at runtime or gp=
a and<br>
&gt; map in advance.<br>
&gt; If there is a wish to optimize when using grants then &quot;maybe&quot=
; it is worth<br>
&gt; looking into how persistent grants work for PV block device for exampl=
e<br>
&gt; (feature-persistent in blkif.h).<br>
<br>
I though #4 may make it work for our setup, but it isn&#39;t what we need<b=
r>
necessarily.<br>
<br>
The deal is that we want hypervisor agnostic backends, they won&#39;t and<b=
r>
shouldn&#39;t know what hypervisor they are running against. So ideally,<br=
>
no special handling.<br></blockquote><div><br></div><div>I see and agree</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
To make it work, the simplest of the solutions can be to map all that<br>
we need in advance, when the vhost negotiations happen and memory<br>
regions are passed to the backend. It doesn&#39;t necessarily mean mapping<=
br>
entire guest, but just the regions we need.</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
With what I have understood about grants until now, I don&#39;t think it<br=
>
will work straight away.<br></blockquote><div><br></div><div>yes</div><div>=
<br></div><div>Below is my understanding, which might be wrong.</div><div><=
br></div><div>I am not sure about x86, there are some moments with its mode=
s, for example PV guests should always use grants for virtio, but on Arm=C2=
=A0(which guest type is HVM):=C2=A0</div><div>1. If you run backend(s) in d=
om0 which is trusted by default, you don&#39;t necessarily need to use gran=
ts for the virtio so you will be able to map what you need in advance using=
 foreign mappings.</div><div>2. If you=C2=A0run backend(s) in another domai=
n *which you trust* and you don&#39;t want to use grants for the virtio, I =
think, you also will be able to map in advance using foreign mappings, but =
for that you will need a security policy to allow your backend&#39;s domain=
 to map arbitrary guest pages.</div><div>3. If=C2=A0you run backend(s) in n=
on-trusted domain, you will have to use=C2=A0grants for the virtio, so ther=
e is no way to map in advance, only to map at the runtime what was previous=
ly granted by the guest and umap right after using it.</div><div><br></div>=
<div>These is another method how to restrict backend without modifying gues=
t which is=C2=A0CONFIG_DMA_RESTRICTED_POOL in Linux, but this includes=C2=
=A0memcpy in the guest and requires some support in toolstack to make it wo=
rk, but I wouldn&#39;t</div><div>suggest it as the usage of grants for the =
virtio is better (and already in upsteam).=C2=A0 =C2=A0</div><div><br></div=
><div>Regarding your previous attempt to map 512MB by using grants,=C2=A0wh=
at I understand from the=C2=A0error message is that Xen complains that the =
passed grant ref is bigger than the current number of grant table entries. =
</div><div>Now I am wondering where do these 0x40000 - 0x5ffff grant=C2=A0r=
efs (which backend tries to map in a single call) come from, are they reall=
y were previously granted by the guest and passed to the=C2=A0backend in a =
single=C2=A0request?<br></div><div>If the answer=C2=A0is yes, then what doe=
s gnttab_usage_print_all() say (key &#39;g&#39; in Xen console)? I expect t=
here should be a lot of Xen messages like &quot;common/grant_table.c:1882:d=
2v3 Expanding d2 grant table from 28 to 29 frames. Do you see them?</div><d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; Yes, this is the correct environment. Please note that Juergen has rec=
ently<br>
&gt; pushed new version [1]<br>
<br>
Yeah, I am following them up, will test the one you all agree on :)<br>
<br>
Thanks.<br>
<br>
-- <br>
viresh<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--00000000000086ab8e05e21cdd24--

