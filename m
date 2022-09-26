Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAB5EA84B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411880.654988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocp0V-0008Aa-OT; Mon, 26 Sep 2022 14:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411880.654988; Mon, 26 Sep 2022 14:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocp0V-00088D-Lf; Mon, 26 Sep 2022 14:22:51 +0000
Received: by outflank-mailman (input) for mailman id 411880;
 Mon, 26 Sep 2022 14:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi8o=Z5=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1ocp0T-000881-Ot
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:22:49 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b21da079-3da6-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 16:22:48 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id e81so8524216ybb.13
 for <xen-devel@lists.xenproject.org>; Mon, 26 Sep 2022 07:22:48 -0700 (PDT)
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
X-Inumbo-ID: b21da079-3da6-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KLXz7tSfev0iNxajMi2a+v851ogylcLP5u+KTavsJco=;
        b=bqlLKMo+1A2k1ba6REzI3SBcd96YxnZ+uQVoIjwConT3WSKjXXhZYbfWd2xTbhxLrU
         ki+NJn6sHp2YnmVqj7a1GzBqEiMnkiYhgmHGRCFza5Ss2JY8KWysidElb4Sjx5dFSVv9
         +SDhaznIDxneiAuV+kBkau0yqgPGfoJ/WzW8JBomTdeYfnOsAMwrQvxDH1Ez7gZY4PAg
         tiCG6vj7I6Npo4qnOUwGN4fzsGiZbkEaWvy0Qi2o5oe4tEJGPb3HTZKm/hm9auCGdxMq
         qxf9KfphyBQAO28aUbfga72pysxZeEYBAQ+RfFlfNUzSz29vHxOJJCM7PtgpE2lWuRG2
         TDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KLXz7tSfev0iNxajMi2a+v851ogylcLP5u+KTavsJco=;
        b=vHbktyUVoVZ2Syh9hIMJyrgpvutV94zKkRRbAvJyIZNZmHYQf4AH9D/uzJ6dsTTdhR
         TAvtcaVqUpy3Tr7GuDwJ/FITQirOArf0Vpmc+IbzC3cF/9J2oa3z6wXHhNY5R+PRa4Hn
         w7boMeZi+8dN5w6dqmpP/hAcp9F9Wwpa4jiNmeTzYfTbyz+t5v2IQwxjb020kByUx5pQ
         VcAxJcFnT4SlWlhW56nEPglsbZe9tQuKUTp0lTLu/+WjR3C4p2OWOfhqRtCH9KdrMspH
         IXClNRpvzlA9oBa0fdxmnImJu9Kt2pAqj0khNV0cRTs3oLAeavfeuFovzhtF88hwiO3S
         7ncw==
X-Gm-Message-State: ACrzQf0pi8DEAPjUrZ6vNCeoTLze9D7SfU9bCiK6Z0rh/3nZd4AgKb/F
	8dTjcXZQz1D7+xreRLoQCr7aKrpphCoYfJWUb+c=
X-Google-Smtp-Source: AMsMyM7eswUFhza7ZAObu6Hd58ICESBa7G4K0UG5RQ1OJBLH6Ak154zWQhqI8MfBPyVtHo0NmXOYIzkbhv61vwW6MZo=
X-Received: by 2002:a25:2441:0:b0:6ae:bb37:3db3 with SMTP id
 k62-20020a252441000000b006aebb373db3mr22590096ybk.213.1664202167590; Mon, 26
 Sep 2022 07:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <86f8a095ff18e4dc41ecb9cef5153438158b91ce.1663878942.git.tamas.lengyel@intel.com>
 <7a469ef7-5ad7-5abf-2c1f-fa29496fa2a5@suse.com>
In-Reply-To: <7a469ef7-5ad7-5abf-2c1f-fa29496fa2a5@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 26 Sep 2022 10:22:10 -0400
Message-ID: <CABfawhkJ1KSxmV=usLh9mKSyT+-_=PgQrhkGe8G0J_ZjqZ9siw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/vpmu: Fix race-condition in vpmu_load
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000008a77d05e99543d6"

--00000000000008a77d05e99543d6
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 10:12 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 22.09.2022 22:48, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/cpu/vpmu.c
> > +++ b/xen/arch/x86/cpu/vpmu.c
> > @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)
> >      vpmu->last_pcpu = pcpu;
> >      per_cpu(last_vcpu, pcpu) = v;
> >
> > +    vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
> > +
> >      if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
> >          vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >
> > +    vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
> > +
> >      apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
> >  }
> >
> >  int vpmu_load(struct vcpu *v, bool_t from_guest)
> >  {
> >      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> > -    int pcpu = smp_processor_id(), ret;
> > -    struct vcpu *prev = NULL;
> > +    int ret;
> >
> >      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
> >          return 0;
> >
> > -    /* First time this VCPU is running here */
> > -    if ( vpmu->last_pcpu != pcpu )
> > -    {
> > -        /*
> > -         * Get the context from last pcpu that we ran on. Note that if
> another
> > -         * VCPU is running there it must have saved this VPCU's context
> before
> > -         * startig to run (see below).
> > -         * There should be no race since remote pcpu will disable
> interrupts
> > -         * before saving the context.
> > -         */
> > -        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
> > -        {
> > -            on_selected_cpus(cpumask_of(vpmu->last_pcpu),
> > -                             vpmu_save_force, (void *)v, 1);
> > -            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> > -        }
> > -    }
> > -
> > -    /* Prevent forced context save from remote CPU */
> > -    local_irq_disable();
> > -
> > -    prev = per_cpu(last_vcpu, pcpu);
> > -
> > -    if ( prev != v && prev )
> > -    {
> > -        vpmu = vcpu_vpmu(prev);
> > -
> > -        /* Someone ran here before us */
> > -        vpmu_save_force(prev);
> > -        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> > -
> > -        vpmu = vcpu_vpmu(v);
> > -    }
> > -
> > -    local_irq_enable();
> > -
> >      /* Only when PMU is counting, we load PMU context immediately. */
> >      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||
> >           (!has_vlapic(vpmu_vcpu(vpmu)->domain) &&
>
> What about the other two uses of vpmu_save_force() in this file? I looks
> to me as if only the use in mem_sharing.c needs to be retained.
>

I don't know, maybe. I rather focus this patch only on the issue and its
fix as I don't want to introduce unintended side effects by doing a
cleanup/consolidation at other code-paths when not strictly necessary.

Tamas

--00000000000008a77d05e99543d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 26, 2022 at 10:12 AM Jan =
Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22.09.=
2022 22:48, Tamas K Lengyel wrote:<br>
&gt; --- a/xen/arch/x86/cpu/vpmu.c<br>
&gt; +++ b/xen/arch/x86/cpu/vpmu.c<br>
&gt; @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vpmu-&gt;last_pcpu =3D pcpu;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 per_cpu(last_vcpu, pcpu) =3D v;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 vpmu_set(vpmu, VPMU_CONTEXT_SAVE);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( alternative_call(vpmu_ops.arch_vpmu_save, v, =
0) )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTEXT_LOADED=
);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_=
MASKED);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int vpmu_load(struct vcpu *v, bool_t from_guest)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct vpmu_struct *vpmu =3D vcpu_vpmu(v);<br>
&gt; -=C2=A0 =C2=A0 int pcpu =3D smp_processor_id(), ret;<br>
&gt; -=C2=A0 =C2=A0 struct vcpu *prev =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /* First time this VCPU is running here */<br>
&gt; -=C2=A0 =C2=A0 if ( vpmu-&gt;last_pcpu !=3D pcpu )<br>
&gt; -=C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Get the context from last pcpu th=
at we ran on. Note that if another<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* VCPU is running there it must hav=
e saved this VPCU&#39;s context before<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* startig to run (see below).<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There should be no race since rem=
ote pcpu will disable interrupts<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* before saving the context.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADE=
D) )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on_selected_cpus(cpumask_of=
(vpmu-&gt;last_pcpu),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu_save_force, (void *)v, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTE=
XT_LOADED);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 } <br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Prevent forced context save from remote CPU */<br>
&gt; -=C2=A0 =C2=A0 local_irq_disable();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 prev =3D per_cpu(last_vcpu, pcpu);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if ( prev !=3D v &amp;&amp; prev )<br>
&gt; -=C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu =3D vcpu_vpmu(prev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Someone ran here before us */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_save_force(prev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu =3D vcpu_vpmu(v);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 local_irq_enable();<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Only when PMU is counting, we load PMU context =
immediately. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(!has_vlapic(vpmu_vcpu(vpmu)-&=
gt;domain) &amp;&amp;<br>
<br>
What about the other two uses of vpmu_save_force() in this file? I looks<br=
>
to me as if only the use in mem_sharing.c needs to be retained.<br></blockq=
uote><div><br></div><div>I don&#39;t know, maybe. I rather focus this patch=
 only on the issue and its fix as I don&#39;t want to introduce unintended =
side effects by doing a cleanup/consolidation at other code-paths when not =
strictly necessary.</div><div><br></div><div>Tamas <br></div></div></div>

--00000000000008a77d05e99543d6--

