Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9C65A2BEB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 18:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393990.633230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRbpZ-0003pI-AB; Fri, 26 Aug 2022 16:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393990.633230; Fri, 26 Aug 2022 16:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRbpZ-0003lw-7Q; Fri, 26 Aug 2022 16:05:13 +0000
Received: by outflank-mailman (input) for mailman id 393990;
 Fri, 26 Aug 2022 16:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRbpX-0003lq-G6
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 16:05:11 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db8a17f0-2558-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 18:05:09 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id g14so1561883qto.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 09:05:09 -0700 (PDT)
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
X-Inumbo-ID: db8a17f0-2558-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=i/CTip9WpY/X3hgrFN+bpar2NlA1mc50bbWCDCA7Mbs=;
        b=c1BUn2JRbfsk1OP41soU2ptJAh/gOaYSHCCK+v3PU5A/oWYheIoA7F2UruASOdJ7kA
         K6JT0oAbLt30fMHzAWomX9VLPaP1n5t50ueZgg46BVRnWYWABjhpujCRCUba6UYH0Iks
         UOpTzFiB8A+FFtRIL9Lacj8vQ04u1/PWGLkdL+INzznQIMS/0YUT8yMEfkX3vMzmwaUN
         o7b+MWO20CeL8/ivoaGVv9wjHbtIZi3+TJ85W3mXyZeaU8vpH8g4LxCN0e60OxgmP8Wd
         4vwADWpgReiLX56pq2QoxcpGijRA5SmPylrpwLHMrhwdMbF9x6ebYgf7y9ullGOQOKp7
         Qb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=i/CTip9WpY/X3hgrFN+bpar2NlA1mc50bbWCDCA7Mbs=;
        b=Z4QCPNqw2gBrm0xh4DPQAzaC6HXcmlr9vQfHDNd41JUnMH3UpEnSfu4tvNNe50Fc9n
         DzqRhTteq5nMf00jlpEy1COzUMRdgHeS3rOZoPzuzMduom/xSs/+3KjuPMgnqWwyrPZd
         +pSKep2T+fxYEVYgDyeAQI2kxI9EYxkFodZuK2J79LxURRqM/rXZceEoFv9WNOsafGWv
         xoHjTQffnfZoNLWjCbU4yfWdVqsMADd3bLRRrbrzUHBFTiiuJ8qPd2R960Wr7o7edIkN
         RqzdnY4CJIdWKdrDnEayh++MVJTUeY/lskbjCr9Idu0UBoy8nukIJyZ6gO0Ocrq9Qwbs
         Elnw==
X-Gm-Message-State: ACgBeo0b7RYKcLajynAZzzRdJwdw6omBziNh4kFo+t3Mw1HJkPrRAYyf
	G6a5xOAQL9xN+mbp+Ab2ZTgbB0r5mugvu04GXgcq6w==
X-Google-Smtp-Source: AA6agR5aBvfAw78sVTKOqX7gOj9tEqFiWe7rcoCTAxAdbkgVJMGcdkSvfJKoaq+EphgpfA+bafx4MECxcOZK9eoij5w=
X-Received: by 2002:a05:622a:287:b0:343:6e93:ac49 with SMTP id
 z7-20020a05622a028700b003436e93ac49mr356339qtw.75.1661529908412; Fri, 26 Aug
 2022 09:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-8-carlo.nonato@minervasys.tech> <5da3c51d-a43b-a967-6f0f-22c1d3ba497d@suse.com>
In-Reply-To: <5da3c51d-a43b-a967-6f0f-22c1d3ba497d@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 26 Aug 2022 18:04:57 +0200
Message-ID: <CAG+AhRWxdxsHu=g2cg-c6NX=Kzisyq9TABh8YwPhN6S1JB_hUg@mail.gmail.com>
Subject: Re: [PATCH 07/12] xen/common: add colored heap info debug-key
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000f9992a05e72713b8"

--000000000000f9992a05e72713b8
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 4:13 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 26.08.2022 14:51, Carlo Nonato wrote:
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -605,6 +605,27 @@ static struct page_info
> *alloc_col_domheap_page(struct domain *d,
> >      return pg;
> >  }
> >
> > +static void dump_col_heap(unsigned char key)
> > +{
> > +    struct page_info *pg;
>
> const and perhaps move into the loop's scope?
>
> > +    unsigned long pages;
> > +    unsigned int color;
> > +
> > +    printk("'%c' pressed -> dumping coloring heap info\n", key);
> > +
> > +    for ( color = 0; color < get_max_colors(); color++ )
> > +    {
> > +        printk("Heap[%u]: ", color);
> > +        pages = 0;
> > +        page_list_for_each( pg, colored_pages(color) )
> > +        {
> > +            BUG_ON(!(page_to_color(pg) == color));
> > +            pages++;
> > +        }
>
> This is a very inefficient way for obtaining a count. On a large
> system this loop is liable to take excessively long. I'm inclined
> to say that even adding a call to process_pending_softirqs() isn't
> going to make this work reasonably.
>

We can definitely add a dynamic array of counters that get updated when
inserting a page in the colored heap so that we don't need to compute
anything here.

I'm also not convinced of having BUG_ON() in keyhandler functions
> which are supposed to only dump state.


You're right. I'll remove that.

> @@ -2853,6 +2874,9 @@ static void cf_check dump_heap(unsigned char key)
> >  static __init int cf_check register_heap_trigger(void)
> >  {
> >      register_keyhandler('H', dump_heap, "dump heap info", 1);
> > +#ifdef CONFIG_CACHE_COLORING
> > +    register_keyhandler('k', dump_col_heap, "dump coloring heap info",
> 1);
> > +#endif
>
> I question the consuming of a separate key for this purpose: What's
> wrong with adding the functionality to dump_heap()?
>

We didn't want to weigh on that functionality so much, but probably
having a separate key is even worse. If it's not a problem I'll merge
it in the dump_heap() function.

Thanks.

- Carlo Nonato

--000000000000f9992a05e72713b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Aug 26, 2022 at 4:13 PM Jan Beuli=
ch &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 26.08.2022 14:51, Carlo Nonato wrote:<br>
&gt; --- a/xen/common/page_alloc.c<br>
&gt; +++ b/xen/common/page_alloc.c<br>
&gt; @@ -605,6 +605,27 @@ static struct page_info *alloc_col_domheap_page(s=
truct domain *d,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return pg;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void dump_col_heap(unsigned char key)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct page_info *pg;<br>
<br>
const and perhaps move into the loop&#39;s scope?<br>
<br>
&gt; +=C2=A0 =C2=A0 unsigned long pages;<br>
&gt; +=C2=A0 =C2=A0 unsigned int color;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 printk(&quot;&#39;%c&#39; pressed -&gt; dumping colorin=
g heap info\n&quot;, key);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for ( color =3D 0; color &lt; get_max_colors(); color++=
 )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Heap[%u]: &quot;, color);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pages =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 page_list_for_each( pg, colored_pages(col=
or) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(!(page_to_color(pg) =
=3D=3D color));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pages++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This is a very inefficient way for obtaining a count. On a large<br>
system this loop is liable to take excessively long. I&#39;m inclined<br>
to say that even adding a call to process_pending_softirqs() isn&#39;t<br>
going to make this work reasonably.<br></blockquote><div><br></div><div>We =
can definitely add a dynamic array of counters that get updated when</div><=
div>inserting a page in the colored heap so that we don&#39;t need to compu=
te</div><div>anything here.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
I&#39;m also not convinced of having BUG_ON() in keyhandler functions<br>
which are supposed to only dump state.</blockquote><div><br></div><div>You&=
#39;re right. I&#39;ll remove that.=C2=A0</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; @@ -2853,6 +2874,9 @@ static void cf_check dump_heap(unsigned char key=
)<br>
&gt;=C2=A0 static __init int cf_check register_heap_trigger(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 register_keyhandler(&#39;H&#39;, dump_heap, &quot;=
dump heap info&quot;, 1);<br>
&gt; +#ifdef CONFIG_CACHE_COLORING<br>
&gt; +=C2=A0 =C2=A0 register_keyhandler(&#39;k&#39;, dump_col_heap, &quot;d=
ump coloring heap info&quot;, 1);<br>
&gt; +#endif<br>
<br>
I question the consuming of a separate key for this purpose: What&#39;s<br>
wrong with adding the functionality to dump_heap()?<br></blockquote><div><b=
r></div><div>We didn&#39;t want to weigh on that functionality so much, but=
 probably</div><div>having a separate key is even worse. If it&#39;s not a =
problem I&#39;ll merge</div><div>it in the dump_heap() function.</div><div>=
<br></div><div>Thanks.</div><div><br></div><div>- Carlo Nonato</div></div><=
/div>

--000000000000f9992a05e72713b8--

