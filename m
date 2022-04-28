Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F42513B30
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 20:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316736.535755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk8Uy-0007E1-Ox; Thu, 28 Apr 2022 18:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316736.535755; Thu, 28 Apr 2022 18:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk8Uy-0007BM-Lf; Thu, 28 Apr 2022 18:04:16 +0000
Received: by outflank-mailman (input) for mailman id 316736;
 Thu, 28 Apr 2022 18:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50wr=VG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nk8Uw-0007BG-Ju
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 18:04:14 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bca2d86-c71d-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 20:04:13 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id ay11so4071876qtb.4
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 11:04:12 -0700 (PDT)
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
X-Inumbo-ID: 9bca2d86-c71d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jecZhItbx7VnRnOJqkUVUsRQR95GKWnZvs6DE4Ykza8=;
        b=LduMzDYJEXfPb+CjNbrlTSBZ0el2LdoB31flxf/T97/WQYSY+aZQEgFi8rOgjiJk1f
         YgmzWKJYWkSdHq4FFZPaSCvsA2NnrLettKtWBoOSbEpxS3JYKHoh6Xk0eErRNnuEyWfc
         2n/rVlvey60r5hDqUBU0ZZfVrMVkE/nN8WjypOYFqWNYxiJGCsbZvMBNCmG9iNv7hP5v
         QBo4rVXdLKxXMKDvpnItrPaybdKn3rzUw+UVPqy3cwXJr4ecDg2E6AA2SKQgrjY1Pp6k
         PYIDJYRlugKyIbVR1/PiaR5CBVw4Vm79LVHG65pLdUdNZpfB4cC+K8Ny0ikY2zgy8/ML
         P+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jecZhItbx7VnRnOJqkUVUsRQR95GKWnZvs6DE4Ykza8=;
        b=HGOsOl/Jzt4VUiT/8vU+pzzg7jv6hUMJMb2jk3R5W29PyL6EaKLkr8rO4XdSTPs7h2
         NBxYbWeGbS7OOma1HgHL5VUkkwXtM6XX6JE8X3b3+l2+8/z/AwNzPWCGA3l9cAZQsxnU
         GS2zmSOx3j+M0FokYLfv0mtZ2OP6JeRlSSKcMHuUcMb/3Mjqo1rwadr+jVAuwSaNCJdl
         xsWdQupy9KE0/6DSJAo1tEjSPvxJHOiQxqaroku6GhoNk17qHQl8tmyvvkFBBYH8uGLg
         lZF0xoXWLJwtjeAWLaqPEe/H8FB0DBAF3tn81dCy3ardr8NzUjrJXBFrz/mextk5PXLn
         gcrA==
X-Gm-Message-State: AOAM531dnUNE9BXQuYBfIi+1Ey4u2bE1gkq6HnT/NAqJ+ytIR6xW5+Sd
	gsI5b7Uvllsemt0Bcb5ArmX5SxlC5Q9SmR6a5KY=
X-Google-Smtp-Source: ABdhPJwWqWOOIthvQMcxh+SHWcOxHZ+QsTCUdnObEXwaDJo685Zyi78MnucQndd3bgLVNozgAZ47qi1G4SBUUvF5dso=
X-Received: by 2002:ac8:5d8e:0:b0:2f3:6073:7514 with SMTP id
 d14-20020ac85d8e000000b002f360737514mr19388343qtx.534.1651169051831; Thu, 28
 Apr 2022 11:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220428082743.16593-1-jgross@suse.com> <20220428082743.16593-9-jgross@suse.com>
In-Reply-To: <20220428082743.16593-9-jgross@suse.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 28 Apr 2022 21:03:59 +0300
Message-ID: <CAPD2p-nisRgMOzy+w2jx5ULfZTyv4MqtG0wkV9jNn3wNg415sQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000cc734505ddbac07d"

--000000000000cc734505ddbac07d
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 11:28 AM Juergen Gross <jgross@suse.com> wrote:

Hello Juergen

[sorry for the possible format issue]

Instead of using a private macro for an invalid grant reference use
> the common one.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/xen-front-pgdir-shbuf.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/xen/xen-front-pgdir-shbuf.c
> b/drivers/xen/xen-front-pgdir-shbuf.c
> index a959dee21134..fa2921d4fbfc 100644
> --- a/drivers/xen/xen-front-pgdir-shbuf.c
> +++ b/drivers/xen/xen-front-pgdir-shbuf.c
> @@ -21,15 +21,6 @@
>
>  #include <xen/xen-front-pgdir-shbuf.h>
>
> -#ifndef GRANT_INVALID_REF
> -/*
> - * FIXME: usage of grant reference 0 as invalid grant reference:
> - * grant reference 0 is valid, but never exposed to a PV driver,
> - * because of the fact it is already in use/reserved by the PV console.
> - */
> -#define GRANT_INVALID_REF      0
> -#endif
> -
>  /**
>   * This structure represents the structure of a shared page
>   * that contains grant references to the pages of the shared
> @@ -83,7 +74,7 @@ grant_ref_t
>  xen_front_pgdir_shbuf_get_dir_start(struct xen_front_pgdir_shbuf *buf)
>  {
>         if (!buf->grefs)
> -               return GRANT_INVALID_REF;
> +               return INVALID_GRANT_REF;
>
>         return buf->grefs[0];
>  }
> @@ -142,7 +133,7 @@ void xen_front_pgdir_shbuf_free(struct
> xen_front_pgdir_shbuf *buf)
>                 int i;
>
>                 for (i = 0; i < buf->num_grefs; i++)
> -                       if (buf->grefs[i] != GRANT_INVALID_REF)
> +                       if (buf->grefs[i] != INVALID_GRANT_REF)
>                                 gnttab_end_foreign_access(buf->grefs[i],
> 0UL);
>         }
>         kfree(buf->grefs);
> @@ -355,7 +346,7 @@ static void backend_fill_page_dir(struct
> xen_front_pgdir_shbuf *buf)
>         }
>         /* Last page must say there is no more pages. */
>         page_dir = (struct xen_page_directory *)ptr;
> -       page_dir->gref_dir_next_page = GRANT_INVALID_REF;
> +       page_dir->gref_dir_next_page = INVALID_GRANT_REF;
>  }
>
>  /**
> @@ -384,7 +375,7 @@ static void guest_fill_page_dir(struct
> xen_front_pgdir_shbuf *buf)
>
>                 if (grefs_left <= XEN_NUM_GREFS_PER_PAGE) {
>                         to_copy = grefs_left;
> -                       page_dir->gref_dir_next_page = GRANT_INVALID_REF;
> +                       page_dir->gref_dir_next_page = INVALID_GRANT_REF;
>


I faced an issue with testing PV Sound with the current series.

root@salvator-x-h3-4x2g-xt-domu:~# aplay /media/MoodyLoop.wav
Playing WAVE '/media/MoodyLoop.wav' : Signed 16 bit Little Endian, Rate
44100 Hz, Stereo
(XEN) common/grant_table.c:1053:d1v2 Bad ref 0xffffffff for d6

Here we have an interesting situation. PV Sound frontend uses this
xen-front-pgdir-shbuf framework. Technically, this patch changes
page_dir->gref_dir_next_page (reference to the next page describing page
directory) from 0 to 0xffffffff here.
#define INVALID_GRANT_REF  ((grant_ref_t)-1)

But according to the protocol (sndif.h), "0" means that there are no more
pages in the list and the user space backend expects only that value. So
receiving 0xffffffff it assumes there are pages in the list and trying to
process...
https://elixir.bootlin.com/linux/v5.18-rc4/source/include/xen/interface/io/sndif.h#L650


I think, the same is relevant to backend_fill_page_dir() as well.

                } else {
>                         to_copy = XEN_NUM_GREFS_PER_PAGE;
>                         page_dir->gref_dir_next_page = buf->grefs[i + 1];
> --
> 2.34.1
>
>
>

-- 
Regards,

Oleksandr Tyshchenko

--000000000000cc734505ddbac07d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 28, 2022 at 11:28 AM Juer=
gen Gross &lt;<a href=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; wr=
ote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div class=3D=
"gmail_attr">Hello=C2=A0Juergen</div><div dir=3D"ltr" class=3D"gmail_attr">=
<br></div><div class=3D"gmail_attr">[sorry for the possible format issue]</=
div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Instead of using a private macro for an invalid =
grant reference use<br>
the common one.<br>
<br>
Signed-off-by: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=
=3D"_blank">jgross@suse.com</a>&gt;<br>
---<br>
=C2=A0drivers/xen/xen-front-pgdir-shbuf.c | 17 ++++-------------<br>
=C2=A01 file changed, 4 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pg=
dir-shbuf.c<br>
index a959dee21134..fa2921d4fbfc 100644<br>
--- a/drivers/xen/xen-front-pgdir-shbuf.c<br>
+++ b/drivers/xen/xen-front-pgdir-shbuf.c<br>
@@ -21,15 +21,6 @@<br>
<br>
=C2=A0#include &lt;xen/xen-front-pgdir-shbuf.h&gt;<br>
<br>
-#ifndef GRANT_INVALID_REF<br>
-/*<br>
- * FIXME: usage of grant reference 0 as invalid grant reference:<br>
- * grant reference 0 is valid, but never exposed to a PV driver,<br>
- * because of the fact it is already in use/reserved by the PV console.<br=
>
- */<br>
-#define GRANT_INVALID_REF=C2=A0 =C2=A0 =C2=A0 0<br>
-#endif<br>
-<br>
=C2=A0/**<br>
=C2=A0 * This structure represents the structure of a shared page<br>
=C2=A0 * that contains grant references to the pages of the shared<br>
@@ -83,7 +74,7 @@ grant_ref_t<br>
=C2=A0xen_front_pgdir_shbuf_get_dir_start(struct xen_front_pgdir_shbuf *buf=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!buf-&gt;grefs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GRANT_INVALI=
D_REF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return INVALID_GRAN=
T_REF;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return buf-&gt;grefs[0];<br>
=C2=A0}<br>
@@ -142,7 +133,7 @@ void xen_front_pgdir_shbuf_free(struct xen_front_pgdir_=
shbuf *buf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; buf-&gt;num_grefs; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (buf-&gt;grefs[i] !=3D GRANT_INVALID_REF)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (buf-&gt;grefs[i] !=3D INVALID_GRANT_REF)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnttab_end_foreign_access(buf-&gt;gr=
efs[i], 0UL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(buf-&gt;grefs);<br>
@@ -355,7 +346,7 @@ static void backend_fill_page_dir(struct xen_front_pgdi=
r_shbuf *buf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Last page must say there is no more pages. *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 page_dir =3D (struct xen_page_directory *)ptr;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0page_dir-&gt;gref_dir_next_page =3D GRANT_INVAL=
ID_REF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0page_dir-&gt;gref_dir_next_page =3D INVALID_GRA=
NT_REF;<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -384,7 +375,7 @@ static void guest_fill_page_dir(struct xen_front_pgdir_=
shbuf *buf)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grefs_left &lt;=
=3D XEN_NUM_GREFS_PER_PAGE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 to_copy =3D grefs_left;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0page_dir-&gt;gref_dir_next_page =3D GRANT_INVALID_REF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0page_dir-&gt;gref_dir_next_page =3D INVALID_GRANT_REF;<br></block=
quote><div>=C2=A0</div><div><br></div><div>I faced an issue with testing PV=
 Sound with the current=C2=A0series.</div><div><br></div><div>root@salvator=
-x-h3-4x2g-xt-domu:~# aplay /media/MoodyLoop.wav<br>Playing WAVE &#39;/medi=
a/MoodyLoop.wav&#39; : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo</=
div><div>(XEN) common/grant_table.c:1053:d1v2 Bad ref 0xffffffff for d6<br>=
</div><div><br></div><div>Here we have an interesting situation. PV Sound f=
rontend=C2=A0uses this xen-front-pgdir-shbuf framework. Technically, this p=
atch changes page_dir-&gt;gref_dir_next_page (reference to the next page de=
scribing page directory) from 0 to=C2=A00xffffffff here.</div><div>#define =
INVALID_GRANT_REF=C2=A0 ((grant_ref_t)-1)<br></div><div><br></div><div>But =
according to the protocol (sndif.h), &quot;0&quot; means that there are no =
more pages in the list and the user space backend expects only that value. =
So receiving=C2=A00xffffffff it assumes there are pages in the list and try=
ing to process...=C2=A0=C2=A0</div><div><a href=3D"https://elixir.bootlin.c=
om/linux/v5.18-rc4/source/include/xen/interface/io/sndif.h#L650">https://el=
ixir.bootlin.com/linux/v5.18-rc4/source/include/xen/interface/io/sndif.h#L6=
50</a><br></div><div><br></div><div><br></div><div>I think, the=C2=A0same i=
s relevant to=C2=A0backend_fill_page_dir() as well.</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 to_copy =3D XEN_NUM_GREFS_PER_PAGE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 page_dir-&gt;gref_dir_next_page =3D buf-&gt;grefs[i + 1];<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--000000000000cc734505ddbac07d--

