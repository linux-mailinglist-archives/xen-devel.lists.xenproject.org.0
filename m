Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABB6980DE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 17:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496124.766703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKfX-0004vR-N3; Wed, 15 Feb 2023 16:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496124.766703; Wed, 15 Feb 2023 16:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKfX-0004sU-J7; Wed, 15 Feb 2023 16:30:07 +0000
Received: by outflank-mailman (input) for mailman id 496124;
 Wed, 15 Feb 2023 16:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EB96=6L=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pSKfV-000424-1R
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 16:30:05 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id fee0f921-ad4d-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 17:30:02 +0100 (CET)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179]) by
 e5eb38c229f8 with SMTP id 63ed088816b764e6c16079a3 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 15 Feb 2023 16:30:00 GMT
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-4a263c4ddbaso284134887b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 08:30:00 -0800 (PST)
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
X-Inumbo-ID: fee0f921-ad4d-11ed-93b5-47a8fe42b414
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1676478600; x=1676485800; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=3JcYIJ8kGEXm/rsvXm1X6HA3jDavISFYmyXYUcjPfT4=;
 b=ScHiTyu9GBjWlplTh03VbVQrBJLDMsgYI3J0G0vXbXPGf1hYE0nCm0GOMots251q0d8KzAt5jb/H3OLUgdt8Rrh2CUiTOl+1ShdJL/vm+m4II444pegqnZOODuwDpqa4C1Cx7E8MgZ1bc37696U8Cg63tVuA3OI+UhSjPhiyazhNCXuOuN7cc4v1xjy3h9qQjqOyqGxeuN9vb6EIaSr/FqA8ypPLNkHVKmswih2Objfvspnp7w/d/hJpS78cXnA+xk4OaW4xpo7ZeDjgJji070mjFrP4iZ0cPFpP/ccU63uSWIDPSJ+jtjfSzKcA5PagRQh+updORphsRyLt+MG5Mg==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKWB3ujELtvVs205uPzb57iQYn+KMi1xrAJo1tyvicmU+zmiPvjU
	JFwb4YeYN8352eXiYjt7VVvYik348I5zZp/RpGA=
X-Google-Smtp-Source: AK7set89sVM0olLvnKaVY/lw+VKsVKbVPgLIuD29KC28I2kv589Diabb9LoIFHMF9kYT40unnJSKA1YCnTQHhjDdjFs=
X-Received: by 2002:a25:8e05:0:b0:88b:c82b:f90d with SMTP id
 p5-20020a258e05000000b0088bc82bf90dmr334143ybl.641.1676478600137; Wed, 15 Feb
 2023 08:30:00 -0800 (PST)
MIME-Version: 1.0
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com>
In-Reply-To: <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 15 Feb 2023 11:29:23 -0500
X-Gmail-Original-Message-ID: <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
Message-ID: <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging teardown
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006f524c05f4bf979b"

--0000000000006f524c05f4bf979b
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.02.2023 06:07, Tamas K Lengyel wrote:
> > An assert failure has been observed at p2m-basic.c:173 when performing
vm
>
> Please can you at least also name the function here? The line number is
> going to change, and when coming back to this change later, it'll be
> more troublesome to figure out which precise assertion was meant. Yes,
> ...
>
> > forking and then destroying the forked VM. The assert checks whether the
> > domain's shared pages counter is 0.
>
> ... you verbally describe it here, but still.

Sure.

>
> > According to the patch that originally
> > added the assert (7bedbbb5c31) the p2m_teardown should only happen after
> > mem_sharing already relinquished all shared pages.
> >
> > In this patch we flip the order in which relinquish ops are called to
avoid
> > tripping the assert.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> > Note: it is unclear why this assert hasn't tripped in the past. It
hasn't
> > been observed with 4.17-rc1 but it is in RELEASE-4.17.0
>
> That's almost certainly a result of e7aa55c0aab3 ("x86/p2m: free the
paging
> memory pool preemptively"), which added calls to p2m_teardown() to
> hap_teardown(). If you agree, this wants recording in a Fixes: tag, as
> - being an XSA fix - that change has been backported to everywhere, and
> hence the issue now also exists everywhere.

Ough.. In that case we'll need this patch backported too. Will add the
Fixes: tag.

>
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -2310,6 +2310,32 @@ int domain_relinquish_resources(struct domain *d)
> >          if ( ret )
> >              return ret;
> >
> > +#ifdef CONFIG_MEM_SHARING
> > +    PROGRESS(shared):
>
> If we go with the re-ordering as you suggest, then please also move the
> enumerator near the top of the switch() body.

Sure.

>
> Did you consider the alternative of adjusting the ASSERT() in question
> instead? It could reasonably become
>
> #ifdef CONFIG_MEM_SHARING
>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
!atomic_read(&d->shr_pages));
> #endif
>
> now, I think. That would be less intrusive a change (helpful for
> backporting), but there may be other (so far unnamed) benefits of pulling
> ahead the shared memory teardown.

I have a hard time understanding this proposed ASSERT.

>
> > +        if ( is_hvm_domain(d) )
> > +        {
> > +            /* If the domain has shared pages, relinquish them allowing
> > +             * for preemption. */
>
> Similarly, if the code is to be moved, please correct style here at this
> occasion.

Sure.

>
> > +            ret = relinquish_shared_pages(d);
> > +            if ( ret )
> > +                return ret;
>
> While I can easily agree with the movement ahead of this being okay, ...
>
> > +            /*
> > +             * If the domain is forked, decrement the parent's pause
count
> > +             * and release the domain.
> > +             */
> > +            if ( mem_sharing_is_fork(d) )
> > +            {
> > +                struct domain *parent = d->parent;
> > +
> > +                d->parent = NULL;
> > +                domain_unpause(parent);
> > +                put_domain(parent);
> > +            }
>
> ... I can only trust you on being sure that moving ahead of this is
> okay, too.

That's fine, we are in the teardown of the fork so it doesn't matter where
you are releasing the parent as long as its after the fork is unlinked from
it.

Thanks,
Tamas

--0000000000006f524c05f4bf979b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 14.02.2023 06:07, Tamas K Lengyel wrote:<br>&gt; &gt; An assert=
 failure has been observed at p2m-basic.c:173 when performing vm<br>&gt;<br=
>&gt; Please can you at least also name the function here? The line number =
is<br>&gt; going to change, and when coming back to this change later, it&#=
39;ll be<br>&gt; more troublesome to figure out which precise assertion was=
 meant. Yes,<br>&gt; ...<br>&gt;<br>&gt; &gt; forking and then destroying t=
he forked VM. The assert checks whether the<br>&gt; &gt; domain&#39;s share=
d pages counter is 0.<br>&gt;<br><div>&gt; ... you verbally describe it her=
e, but still.</div><div><br></div><div>Sure.<br></div><div><br></div>&gt;<b=
r>&gt; &gt; According to the patch that originally<br>&gt; &gt; added the a=
ssert (7bedbbb5c31) the p2m_teardown should only happen after<br>&gt; &gt; =
mem_sharing already relinquished all shared pages.<br>&gt; &gt;<br>&gt; &gt=
; In this patch we flip the order in which relinquish ops are called to avo=
id<br>&gt; &gt; tripping the assert.<br>&gt; &gt;<br>&gt; &gt; Signed-off-b=
y: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tamas@tklengy=
el.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; Note: it is unclear why this a=
ssert hasn&#39;t tripped in the past. It hasn&#39;t<br>&gt; &gt; been obser=
ved with 4.17-rc1 but it is in RELEASE-4.17.0<br>&gt;<br>&gt; That&#39;s al=
most certainly a result of e7aa55c0aab3 (&quot;x86/p2m: free the paging<br>=
&gt; memory pool preemptively&quot;), which added calls to p2m_teardown() t=
o<br>&gt; hap_teardown(). If you agree, this wants recording in a Fixes: ta=
g, as<br>&gt; - being an XSA fix - that change has been backported to every=
where, and<br><div>&gt; hence the issue now also exists everywhere.</div><d=
iv><br></div><div>Ough.. In that case we&#39;ll need this patch backported =
too. Will add the Fixes: tag.<br></div><div><br></div>&gt;<br>&gt; &gt; ---=
 a/xen/arch/x86/domain.c<br>&gt; &gt; +++ b/xen/arch/x86/domain.c<br>&gt; &=
gt; @@ -2310,6 +2310,32 @@ int domain_relinquish_resources(struct domain *d=
)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; &gt; <b=
r>&gt; &gt; +#ifdef CONFIG_MEM_SHARING<br>&gt; &gt; + =C2=A0 =C2=A0PROGRESS=
(shared):<br>&gt;<br>&gt; If we go with the re-ordering as you suggest, the=
n please also move the<br><div>&gt; enumerator near the top of the switch()=
 body.</div><div><br></div><div>Sure.<br></div><div><br></div>&gt;<br>&gt; =
Did you consider the alternative of adjusting the ASSERT() in question<br>&=
gt; instead? It could reasonably become<br>&gt;<br>&gt; #ifdef CONFIG_MEM_S=
HARING<br>&gt; =C2=A0 =C2=A0 ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||=
 !atomic_read(&amp;d-&gt;shr_pages));<br>&gt; #endif<br>&gt;<br>&gt; now, I=
 think. That would be less intrusive a change (helpful for<br>&gt; backport=
ing), but there may be other (so far unnamed) benefits of pulling<br><div>&=
gt; ahead the shared memory teardown.</div><div><br></div><div>I have a har=
d time understanding this proposed ASSERT.<br></div><div><br></div>&gt;<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( is_hvm_domain(d) )<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* If the domain has shared pages, relinquish them allowing<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for preemption. */=
<br>&gt;<br>&gt; Similarly, if the code is to be moved, please correct styl=
e here at this<br><div>&gt; occasion.</div><div><br></div><div>Sure.<br></d=
iv><div><br></div>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ret =3D relinquish_shared_pages(d);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt;<br>&gt; While I can easi=
ly agree with the movement ahead of this being okay, ...<br>&gt;<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the domain is forked, decrement the pa=
rent&#39;s pause count<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * and release the domain.<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 */<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f ( mem_sharing_is_fork(d) )<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct domain *parent =3D d-&gt;parent;<br>&gt; &gt; +<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;parent =3D N=
ULL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
domain_unpause(parent);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0put_domain(parent);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0}<br>&gt;<br>&gt; ... I can only trust you on being su=
re that moving ahead of this is<br><div>&gt; okay, too.</div><div><br></div=
><div>That&#39;s fine, we are in the teardown of the fork so it doesn&#39;t=
 matter where you are releasing the parent as long as its after the fork is=
 unlinked from it.</div><div><br></div><div>Thanks,<br></div><div>Tamas<br>=
</div></div>

--0000000000006f524c05f4bf979b--

