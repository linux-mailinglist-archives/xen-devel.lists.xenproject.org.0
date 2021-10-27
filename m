Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E443D7B7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 01:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217548.377648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsbn-0001tv-1V; Wed, 27 Oct 2021 23:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217548.377648; Wed, 27 Oct 2021 23:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsbm-0001s9-Uj; Wed, 27 Oct 2021 23:45:26 +0000
Received: by outflank-mailman (input) for mailman id 217548;
 Wed, 27 Oct 2021 23:45:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M2QJ=PP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mfsbl-0001rw-UX
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 23:45:25 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 646ec479-80ae-4518-9736-8ecb0d978c9b;
 Wed, 27 Oct 2021 23:45:24 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g8so17473389edb.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 16:45:24 -0700 (PDT)
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
X-Inumbo-ID: 646ec479-80ae-4518-9736-8ecb0d978c9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2iSCHqJVLf6tYgbKKAiQCHDbyiwZZSfoEu8uZI9MyTo=;
        b=QSWAseTBZkRK/COzIKl34J63FPh5JGJAmBMdkig8dolFIG++RULZ7qwYji8kdi5BiT
         FvuHIPV6GTzRHuoUjmolxBgy72fn8hQXeXHfrjQEEipTQP2vb68wUIW4gZLxmN04bFIp
         5IE45h5DyMPLU/gKCfNGpj312dUfQDjpAw0SgNEJr4lPxXyUU1DP7ubTVpcaqkw6BaNn
         8Y06CSf1JYWmRHhFOpuoUCkFaT3wdGYEDt2WAlvlrJpHJ0Mt0+qaIEtJt3+V4eC71FLg
         icK4PjTmrOI7RHwh+SwqQmmTU+76pVe8rGUvBKbFRH+6ooSpjKpVaR1coAUQ7lFV0K5H
         zc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2iSCHqJVLf6tYgbKKAiQCHDbyiwZZSfoEu8uZI9MyTo=;
        b=izYCaGUj37c1e3Kq1DYIiLrEwCCUzvHIEccg2vXqbWtvvACdhdnoHiwc88g2Q68YtO
         lMDIi/tpXVrGgfVhtPcaNGS+E53LroMrVeeBp/vMvtxwS3EX2kg9SpR4Z2RBaQxuMF+I
         p1+VSYBNL7I/U8+7BYM0HwZ9gAcjir6TqEgDaHk4VX51l+JDHiIOs8wemW6n/yWrzh8s
         nR/YdcSJxf8vjvlf2mQyJtPltVwOkncAB/mFqYiJ1mu88sHkqCvlnZbmIuGPZR12fJ2G
         vdDST5FJJRWq4Uc1BW3VrBBZ6KMC3RmN6CzDYA4umKsIAINSiELZOvTcL9odzqGJ1B59
         Lyug==
X-Gm-Message-State: AOAM531WP4rQ8gNvy/UTgNmj7Wz7I4Ho4onNGN+tERO6Sh9djO8Q0lno
	zIlpDRHrEUmItVbbP9Sms+k0Gv53MpBlYk01uZ0=
X-Google-Smtp-Source: ABdhPJy0vIP8thTX0QKPSUeeatVhdrnFo9GbgqbPs1ewdORdeMgS9p3gVoPfN8/3UOKc2vEXHX27BVdfkO4Ga/wyo+A=
X-Received: by 2002:a50:9e64:: with SMTP id z91mr1265317ede.219.1635378323885;
 Wed, 27 Oct 2021 16:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211026122903.15042-1-michal.orzel@arm.com> <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
 <70c30a6c-b779-805e-079a-41bb484894b9@xen.org> <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
 <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org> <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
In-Reply-To: <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 28 Oct 2021 00:45:12 +0100
Message-ID: <CAJ=z9a0nTsLph_Q7T29Wz-bzAMj2YFTMQ4ow4-r9-_Spc2_BVA@mail.gmail.com>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Ian Jackson <iwj@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000001193ec05cf5e3001"

--0000000000001193ec05cf5e3001
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Oct 2021, 00:43 Julien Grall, <julien.grall.oss@gmail.com> wrote:

>
>
> On Thu, 28 Oct 2021, 00:14 Stefano Stabellini, <sstabellini@kernel.org>
> wrote:
>
>> On Wed, 27 Oct 2021, Julien Grall wrote:
>> > > > > > +    return ret;
>> > > > > >    }
>> > > > > >    static int register_smmu_master(struct arm_smmu_device *smmu,
>> > > > > > @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct
>> device
>> > > > > > *dev)
>> > > > > >        } else {
>> > > > > >            struct arm_smmu_master *master;
>> > > > > > +        spin_lock(&arm_smmu_devices_lock);
>> > > > > >            master = find_smmu_master(smmu, dev->of_node);
>> > > > > > +        spin_unlock(&arm_smmu_devices_lock);
>> > > > >
>> > > > > At the moment, unlocking here is fine because we don't remove the
>> > > > > device. However, there are a series to supporting removing a
>> device (see
>> > > > > [1]). So I think it would be preferable to unlock after the last
>> use of
>> > > > > 'cfg'.
>> > > > >
>> > > Ok. I will move unlocking to the end of this else {} block. I was not
>> aware
>> > > of the patch you are referring to.
>> >
>> > I think the end of the else is still too early. This needs to at least
>> be past
>> > iommu_group_set_iommudata() because we store cfg.
>> >
>> > Potentially, the lock wants to also englobe
>> arm_smmu_master_alloc_smes(). So I
>> > am wondering whether it would be simpler to hold the lock for the whole
>> > duration of arm_smmu_add_device() (I can see value when we will want to
>> > interlock with the remove code).
>>
>> The patch was to protect the smmu master list. From that point of view
>> the unlock right after find_smmu_master would be sufficient, right?
>>
>
> Yes. However this is not fixing all the problems (see below).
>
>
>> We only need to protect cfg if we are worried that the same device is
>> added in two different ways at the same time. Did I get it right? If so,
>> I would say that that case should not be possible? Am I missing another
>> potential conflict?
>>
>
> It should not be possible to add the same device twice. The problem is
> more when we are going to remove the device. In this case, "master" may
> disappear at any point.
>
> The support for removing device is not yet implemented in the tree. But
> there is already a patch on the ML. So I think it would be shortsighted to
> only move the lock to just solve concurrent access to the list.
>
>
>>
>> I am pointing this out for two reasons:
>>
>> Protecting the list is different from protecting each element from
>> concurrent modification of the element itself. If the latter is a
>> potential problem, I wonder if arm_smmu_add_device is the only function
>> affected?
>>
>
> I had a brief looked at the code and couldn't find any other places where
> this may be an issue.
>
>
>> The second reason is that extending the lock past
>> arm_smmu_master_alloc_smes is a bit worrying because it causes
>> &arm_smmu_devices_lock and smmu->stream_map_lock to nest, which wasn't
>> the case before.
>>
>
> Nested locks are common. I don't believe there would be a problem here
> with this one.
>
>
>> I am not saying that it is a bad idea to extend the lock past
>> arm_smmu_master_alloc_smes -- it might be the right thing to do.
>
>
> I don't usually suggest locking changes blindly ;).
>
> But I
>
> am merely saying that it might be best to think twice about it.
>
> and/or do
>> that after 4.16.
>
>
> To be honest, this patch is not useful the callback to register a device
> in the IOMMU subsystem. So if you are concerned with
>

The sentence makes no sense sorry. I meant the add callback doesn't support
PCI devices. So the locking is a latent issue at the moment.

 the my suggested locking then, I am afraid the current patch is a no-go on
> my side for 4.16.
>
> That said we can work towards a new locking approach for 4.17. However, I
> would want to have a proposal from your side or at least some details on
> why the suggested locking is not suitable.
>
> Cheers,
>

--0000000000001193ec05cf5e3001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 28 Oct 2021, 00:43 Julien Grall, &lt;<a href=
=3D"mailto:julien.grall.oss@gmail.com">julien.grall.oss@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div><br><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
28 Oct 2021, 00:14 Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 27 Oct 2021, Juli=
en Grall wrote:<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 return ret;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 static int register_smmu_master(struc=
t arm_smmu_device *smmu,<br>
&gt; &gt; &gt; &gt; &gt; @@ -2056,7 +2066,10 @@ static int arm_smmu_add_dev=
ice(struct device<br>
&gt; &gt; &gt; &gt; &gt; *dev)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct arm_smmu_master *master;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_l=
ock(&amp;arm_smmu_devices_lock);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 master =3D find_smmu_master(smmu, dev-&gt;of_node);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_u=
nlock(&amp;arm_smmu_devices_lock);<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; At the moment, unlocking here is fine because we don&#3=
9;t remove the<br>
&gt; &gt; &gt; &gt; device. However, there are a series to supporting remov=
ing a device (see<br>
&gt; &gt; &gt; &gt; [1]). So I think it would be preferable to unlock after=
 the last use of<br>
&gt; &gt; &gt; &gt; &#39;cfg&#39;.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; Ok. I will move unlocking to the end of this else {} block. I was=
 not aware<br>
&gt; &gt; of the patch you are referring to.<br>
&gt; <br>
&gt; I think the end of the else is still too early. This needs to at least=
 be past<br>
&gt; iommu_group_set_iommudata() because we store cfg.<br>
&gt; <br>
&gt; Potentially, the lock wants to also englobe arm_smmu_master_alloc_smes=
(). So I<br>
&gt; am wondering whether it would be simpler to hold the lock for the whol=
e<br>
&gt; duration of arm_smmu_add_device() (I can see value when we will want t=
o<br>
&gt; interlock with the remove code).<br>
<br>
The patch was to protect the smmu master list. From that point of view<br>
the unlock right after find_smmu_master would be sufficient, right?<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. How=
ever this is not fixing all the problems (see below).</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
We only need to protect cfg if we are worried that the same device is<br>
added in two different ways at the same time. Did I get it right? If so,<br=
>
I would say that that case should not be possible? Am I missing another<br>
potential conflict?<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">It should not be possible to add the same device twice. =
The problem is more when we are going to remove the device. In this case, &=
quot;master&quot; may disappear at any point.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">The support for removing device is not yet implemente=
d in the tree. But there is already a patch on the ML. So I think it would =
be shortsighted to only move the lock to just solve concurrent access to th=
e list.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
I am pointing this out for two reasons:<br>
<br>
Protecting the list is different from protecting each element from<br>
concurrent modification of the element itself. If the latter is a<br>
potential problem, I wonder if arm_smmu_add_device is the only function<br>
affected?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I had a brief looked at the code and couldn&#39;t find any other =
places where this may be an issue.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The second reason is that extending the lock past<br>
arm_smmu_master_alloc_smes is a bit worrying because it causes<br>
&amp;arm_smmu_devices_lock and smmu-&gt;stream_map_lock to nest, which wasn=
&#39;t<br>
the case before.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Nested locks are common. I don&#39;t believe there would be=
 a problem here with this one.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I am not saying that it is a bad idea to extend the lock past<br>
arm_smmu_master_alloc_smes -- it might be the right thing to do. </blockquo=
te></div></div><div dir=3D"auto"><br><span style=3D"font-family:sans-serif"=
>I don&#39;t usually suggest locking changes blindly ;).</span><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">But I</blockquote></div></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
am merely saying that it might be best to think twice about it.</blockquote=
></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">and/or do<br>
that after 4.16.</blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">To be honest, this patch is not useful the callback to register=
 a device in the IOMMU subsystem. So if you are concerned with</div><div di=
r=3D"auto"></div></div></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">The sentence makes no sense sorry. I meant the add callb=
ack doesn&#39;t support PCI devices. So the locking is a latent issue at th=
e moment.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"a=
uto">=C2=A0the my suggested locking then, I am afraid the current patch is =
a no-go on my side for 4.16.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">That said we can work towards a new locking approach for 4.17. However=
, I would want to have a proposal from your side or at least some details o=
n why the suggested locking is not suitable.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Cheers,</div><div dir=3D"auto"></div></div>
</blockquote></div></div></div>

--0000000000001193ec05cf5e3001--

