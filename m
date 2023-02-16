Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D218F699904
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 16:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496651.767510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSgIi-00024d-03; Thu, 16 Feb 2023 15:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496651.767510; Thu, 16 Feb 2023 15:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSgIh-00021Y-T9; Thu, 16 Feb 2023 15:35:59 +0000
Received: by outflank-mailman (input) for mailman id 496651;
 Thu, 16 Feb 2023 15:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAGp=6M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pSgIg-00021S-8F
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 15:35:58 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 9a1c11c7-ae0f-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 16:35:56 +0100 (CET)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174]) by
 80c484450f39 with SMTP id 63ee4d5ad517d2c7935668cd (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 16 Feb 2023 15:35:54 GMT
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5339759be1cso16111847b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 07:35:54 -0800 (PST)
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
X-Inumbo-ID: 9a1c11c7-ae0f-11ed-93b5-47a8fe42b414
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1676561754; x=1676568954; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=1ksMJvvUpptf39sCjE5sumEYtEDIJBykOx4KUuxxZxI=;
 b=y0JQgr9fbwXzZOz+damhuj6F122gILyn4GN2zICUNbiVYOvaYzyYHP4ycBzjJwbI6agwVHX8eWPTJsgfeON0UlHxuhbRFyYITCTzt80G93fiqXxT25vHjcSOJGwjAo/5Z3MbknQTFD0sCQk4pxSmreSFLz1qCN0HvkZPQ1N7Qww9Tk1MEagtIw3Rl9EgQx6orbyImr+HVJdX+1ZoTp1t8NzpppCkeeZroF/oSaEVXr8ZhXVRuStiuG+bcOzlO7d7a1abAN18sqRQhFYQpaVsRdqJTsF/kT0wKT8pPHKgAQjXZLNk/DJDrkzD5bEK+H4Mbjw3dg4dIsvFhVQ9t/btdw==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKWjeEaGpQ9ySllH1KSqNtEzAk9khuGag5Jh6eQA5dZjRYu2V42t
	DXR3Wlqyh5G48ef4U3tzdEUwIii+uMjPCrZGZqk=
X-Google-Smtp-Source: AK7set8L1uUKAQEKGzugjRec+uw9smfiaZ9WtSoLjAHgNxee3T7H89BVgl1QqvCpg+rfNl45gf5CTtiw+x7ERgWmVkU=
X-Received: by 2002:a81:4f0b:0:b0:509:bd6:4d4b with SMTP id
 d11-20020a814f0b000000b005090bd64d4bmr617936ywb.282.1676561753822; Thu, 16
 Feb 2023 07:35:53 -0800 (PST)
MIME-Version: 1.0
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com> <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
 <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com> <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
 <000badbf-cd94-76b6-1f60-faa720a5407f@suse.com> <CABfawhkyomrcKDgcMTvpfyTQVYX9zEo4SUBC4m99RXX=ZcBE5g@mail.gmail.com>
 <7db3740b-c483-c400-2800-2af85e697de6@suse.com>
In-Reply-To: <7db3740b-c483-c400-2800-2af85e697de6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Feb 2023 10:35:17 -0500
X-Gmail-Original-Message-ID: <CABfawhkO1yjZnA2_nRU7hjMBMbAobdnyAAQ8xhbWCySJQVutZw@mail.gmail.com>
Message-ID: <CABfawhkO1yjZnA2_nRU7hjMBMbAobdnyAAQ8xhbWCySJQVutZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging teardown
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c7de8405f4d2f34c"

--000000000000c7de8405f4d2f34c
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 10:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.02.2023 16:10, Tamas K Lengyel wrote:
> > On Thu, Feb 16, 2023 at 9:27 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 16.02.2023 13:22, Tamas K Lengyel wrote:
> >>> On Thu, Feb 16, 2023 at 3:31 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 15.02.2023 17:29, Tamas K Lengyel wrote:
> >>>>> On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com>
wrote:
> >>>>>> Did you consider the alternative of adjusting the ASSERT() in
> > question
> >>>>>> instead? It could reasonably become
> >>>>>>
> >>>>>> #ifdef CONFIG_MEM_SHARING
> >>>>>>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
> >>>>> !atomic_read(&d->shr_pages));
> >>>>>> #endif
> >>>>>>
> >>>>>> now, I think. That would be less intrusive a change (helpful for
> >>>>>> backporting), but there may be other (so far unnamed) benefits of
> >>> pulling
> >>>>>> ahead the shared memory teardown.
> >>>>>
> >>>>> I have a hard time understanding this proposed ASSERT.
> >>>>
> >>>> It accounts for the various ways p2m_teardown() can (now) be called,
> >>>> limiting the actual check for no remaining shared pages to the last
> >>>> of all these invocations (on the host p2m with remove_root=true).
> >>>>
> >>>> Maybe
> >>>>
> >>>>     /* Limit the check to the final invocation. */
> >>>>     if ( p2m_is_hostp2m(p2m) && remove_root )
> >>>>         ASSERT(!atomic_read(&d->shr_pages));
> >>>>
> >>>> would make this easier to follow? Another option might be to move
> >>>> the assertion to paging_final_teardown(), ahead of that specific call
> >>>> to p2m_teardown().
> >>>
> >>> AFAICT d->shr_pages would still be more then 0 when this is called
> > before
> >>> sharing is torn down so the rearrangement is necessary even if we do
> > this
> >>> assert only on the final invocation. I did a printk in place of this
> > assert
> >>> without the rearrangement and afaict it was always != 0.
> >>
> >> Was your printk() in an if() as above? paging_final_teardown() runs
really
> >> late during cleanup (when we're about to free struct domain), so I
would
> >> be somewhat concerned if by that time the count was still non-zero.
> >
> > Just replaced the assert with a printk. Without calling relinquish
shared
> > pages I don't find it odd that the count is non-zero, it only gets
> > decremented when you do call relinquish. Once the order is corrected it
is
> > zero.
>
> I may be getting you wrong, but it feels like you're still talking about
> early invocations of p2m_teardown() (from underneath domain_kill()) when
> I'm talking about the final one. No matter what ordering inside
> domain_relinquish_resources() (called from domain_kill()), the freeing
> will have happened by the time that process completes. Which is before
> the (typically last) last domain ref would be put (near the end of
> domain_kill()), and hence before the domain freeing process might be
> invoked (which is where paging_final_teardown() gets involved; see
> {,arch_}domain_destroy()).

I don't recall seeing a count with 0 before I reordered things but the
output on the serial may also have been truncated due to it printing a ton
of lines very quickly, so it could be the last one was zero just didn't
make it to my screen.

Tamas

--000000000000c7de8405f4d2f34c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Feb 16, 2023 at 10:24 AM Jan Beulich &lt;<=
a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt=
;<br>&gt; On 16.02.2023 16:10, Tamas K Lengyel wrote:<br>&gt; &gt; On Thu, =
Feb 16, 2023 at 9:27 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
">jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On 16.=
02.2023 13:22, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; On Thu, Feb 16, =
2023 at 3:31 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeuli=
ch@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt=
; On 15.02.2023 17:29, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt; =
On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@=
suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;=
 Did you consider the alternative of adjusting the ASSERT() in<br>&gt; &gt;=
 question<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; instead? It could reasonably bec=
ome<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; #ifde=
f CONFIG_MEM_SHARING<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 ASSERT(=
!p2m_is_hostp2m(p2m) || !remove_root ||<br>&gt; &gt;&gt;&gt;&gt;&gt; !atomi=
c_read(&amp;d-&gt;shr_pages));<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; #endif<br>&=
gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; now, I think.=
 That would be less intrusive a change (helpful for<br>&gt; &gt;&gt;&gt;&gt=
;&gt;&gt; backporting), but there may be other (so far unnamed) benefits of=
<br>&gt; &gt;&gt;&gt; pulling<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; ahead the sh=
ared memory teardown.<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;=
&gt; I have a hard time understanding this proposed ASSERT.<br>&gt; &gt;&gt=
;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; It accounts for the various ways p2m_tea=
rdown() can (now) be called,<br>&gt; &gt;&gt;&gt;&gt; limiting the actual c=
heck for no remaining shared pages to the last<br>&gt; &gt;&gt;&gt;&gt; of =
all these invocations (on the host p2m with remove_root=3Dtrue).<br>&gt; &g=
t;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; Maybe<br>&gt; &gt;&gt;&gt;&gt;<br>&=
gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0 /* Limit the check to the final invocati=
on. */<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0 if ( p2m_is_hostp2m(p2m) &amp=
;&amp; remove_root )<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
SSERT(!atomic_read(&amp;d-&gt;shr_pages));<br>&gt; &gt;&gt;&gt;&gt;<br>&gt;=
 &gt;&gt;&gt;&gt; would make this easier to follow? Another option might be=
 to move<br>&gt; &gt;&gt;&gt;&gt; the assertion to paging_final_teardown(),=
 ahead of that specific call<br>&gt; &gt;&gt;&gt;&gt; to p2m_teardown().<br=
>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; AFAICT d-&gt;shr_pages would still =
be more then 0 when this is called<br>&gt; &gt; before<br>&gt; &gt;&gt;&gt;=
 sharing is torn down so the rearrangement is necessary even if we do<br>&g=
t; &gt; this<br>&gt; &gt;&gt;&gt; assert only on the final invocation. I di=
d a printk in place of this<br>&gt; &gt; assert<br>&gt; &gt;&gt;&gt; withou=
t the rearrangement and afaict it was always !=3D 0.<br>&gt; &gt;&gt;<br>&g=
t; &gt;&gt; Was your printk() in an if() as above? paging_final_teardown() =
runs really<br>&gt; &gt;&gt; late during cleanup (when we&#39;re about to f=
ree struct domain), so I would<br>&gt; &gt;&gt; be somewhat concerned if by=
 that time the count was still non-zero.<br>&gt; &gt;<br>&gt; &gt; Just rep=
laced the assert with a printk. Without calling relinquish shared<br>&gt; &=
gt; pages I don&#39;t find it odd that the count is non-zero, it only gets<=
br>&gt; &gt; decremented when you do call relinquish. Once the order is cor=
rected it is<br>&gt; &gt; zero.<br>&gt;<br>&gt; I may be getting you wrong,=
 but it feels like you&#39;re still talking about<br>&gt; early invocations=
 of p2m_teardown() (from underneath domain_kill()) when<br>&gt; I&#39;m tal=
king about the final one. No matter what ordering inside<br>&gt; domain_rel=
inquish_resources() (called from domain_kill()), the freeing<br>&gt; will h=
ave happened by the time that process completes. Which is before<br>&gt; th=
e (typically last) last domain ref would be put (near the end of<br>&gt; do=
main_kill()), and hence before the domain freeing process might be<br>&gt; =
invoked (which is where paging_final_teardown() gets involved; see<br>&gt; =
{,arch_}domain_destroy()).<br><div><br></div><div>I don&#39;t recall seeing=
 a count with 0 before I reordered things but the output on the serial may =
also have been truncated due to it printing a ton of lines very quickly, so=
 it could be the last one was zero just didn&#39;t make it to my screen.<br=
></div><div><br></div><div>Tamas<br></div></div>

--000000000000c7de8405f4d2f34c--

