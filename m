Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424B5866BB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:11:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378609.611888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRSH-00077g-8N; Mon, 01 Aug 2022 09:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378609.611888; Mon, 01 Aug 2022 09:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRSH-00075s-5a; Mon, 01 Aug 2022 09:11:17 +0000
Received: by outflank-mailman (input) for mailman id 378609;
 Mon, 01 Aug 2022 09:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VFMp=YF=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oIRSG-00075m-9h
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:11:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e527c57d-1179-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 11:11:15 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id y13so5169933ejp.13
 for <xen-devel@lists.xenproject.org>; Mon, 01 Aug 2022 02:11:15 -0700 (PDT)
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
X-Inumbo-ID: e527c57d-1179-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TRNIMYENFbytbGAGgkruDsZRk7dxz/bAkAVtNBfMW7k=;
        b=jrlcbodL2Y+nMqKX2xWrcKu49a0vVJFNYrFY+8MCEAwpAK2Ow1e4cK/88W37+r3hLk
         LzcWoAzPWsAX0aiftQtnn+1QPikz5AgZGTjABIB6zuxcJzlCwhtajZ0oSOd9eieS+j6H
         0Ey4fryE+c+jn125WClqKRn7xojSYfdNR/JxoljDK2xz2wpT5TrlFJ5VcLSajTnWIo1L
         jQ11jF1zrPmIOV9HQ+Pn7FGq2qVqQwKvLlAFeKU/4hyqLbh6o8bLdG4nnoJOvw5/r1v8
         +x4vUIFZxbggQKyfNuWJ4K7B080ZdSobX4+0qYu/Oe82S3u4EJFlTFpOcZPpy2P3pnCI
         k6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TRNIMYENFbytbGAGgkruDsZRk7dxz/bAkAVtNBfMW7k=;
        b=xZWPyjwd2b6NDE2zEK07lSPXoQtoMvELHs6P3HDFGl/C9KNIhvmRBNtd4GUSnra0I9
         QkZvqex+1wBUG1ugV84jr8XyH1vf4zDBJu/QTXcG3pYdPIJzRahzlYyn6sLeprKGptsj
         QplMsteLRB4pSRBUx4Ylm5Q32Tjq4x3aVtWqYO4D0hdmo9JFf9aOV0q/2PfU7tYpve++
         nmYBwWG0tY9im542zshBw4qYmSjpVLoMNJpX3EEYVPKpxkid9nGsWsjKRyC0b9wE4jBB
         EeqBZPo8S8aCnM9MnE+kIzMhWb3fGp63TXVv6PbvqiKDfr5tSfDFhr7BRbCqPT+3lRo+
         idSQ==
X-Gm-Message-State: ACgBeo2NPMjtQPiBppecMt4eiMTCu/nuGEw9n6EgNE0TR5YemuN+SKBE
	KQpj3mmivO7OyThg2ebvXgKBxobHOT5sJP+mu9g=
X-Google-Smtp-Source: AA6agR4FWql8dmGfC3TiNEjKLG3dQVO6XOG/1H7rUAYLAubnacImDjt6ubK0B4NltG35Uu0Nv/0zASL7UgcPKYCFc2Q=
X-Received: by 2002:a17:907:288a:b0:730:996d:c605 with SMTP id
 em10-20020a170907288a00b00730996dc605mr18472ejc.682.1659345074612; Mon, 01
 Aug 2022 02:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-2-dmitry.semenets@gmail.com> <124efe96-ed51-6312-75a8-1248724b619e@suse.com>
In-Reply-To: <124efe96-ed51-6312-75a8-1248724b619e@suse.com>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Mon, 1 Aug 2022 12:11:03 +0300
Message-ID: <CACM97VVkUQE7rW2BD+cDkPAc2=RivWj2XrXXNUBJt5zXEqMtAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64
 bytes long
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Dmytro Semenets <dmytro_semenets@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 1 =D0=B0=D0=B2=D0=B3. 2022 =D0=B3. =D0=B2 11:59, Juergen Gros=
s <jgross@suse.com>:
>
> On 13.07.22 17:03, dmitry.semenets@gmail.com wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >
> > Current vchan implementation, while dealing with XenStore paths,
> > allocates 64 bytes buffer on the stack which may not be enough for
> > some use-cases. Make the buffer longer to respect maximum allowed
> > XenStore path of XENSTORE_ABS_PATH_MAX.
> >
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> > Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> > ---
> >   tools/libs/vchan/init.c | 28 ++++++++++++++++++++++------
> >   1 file changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> > index 9195bd3b98..38658f30af 100644
> > --- a/tools/libs/vchan/init.c
> > +++ b/tools/libs/vchan/init.c
> > @@ -249,7 +249,7 @@ static int init_xs_srv(struct libxenvchan *ctrl, in=
t domain, const char* xs_base
> >       int ret =3D -1;
> >       struct xs_handle *xs;
> >       struct xs_permissions perms[2];
> > -     char buf[64];
> > +     char *buf;
> >       char ref[16];
> >       char* domid_str =3D NULL;
> >       xs_transaction_t xs_trans =3D XBT_NULL;
> > @@ -259,6 +259,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, i=
nt domain, const char* xs_base
> >       if (!ctrl->xs_path)
> >               return -1;
> >
> > +     buf =3D malloc(XENSTORE_ABS_PATH_MAX);
> > +     if (!buf) {
> > +             free(ctrl);
> > +             return 0;
> > +     }
> > +
> >       xs =3D xs_open(0);
> >       if (!xs)
> >               goto fail;
> > @@ -280,14 +286,14 @@ retry_transaction:
> >               goto fail_xs_open;
> >
> >       snprintf(ref, sizeof ref, "%d", ring_ref);
> > -     snprintf(buf, sizeof buf, "%s/ring-ref", xs_base);
> > +     snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_base);
> >       if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
> >               goto fail_xs_open;
> >       if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
> >               goto fail_xs_open;
> >
> >       snprintf(ref, sizeof ref, "%d", ctrl->event_port);
> > -     snprintf(buf, sizeof buf, "%s/event-channel", xs_base);
> > +     snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/event-channel", xs_base)=
;
> >       if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
> >               goto fail_xs_open;
> >       if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
> > @@ -303,6 +309,7 @@ retry_transaction:
> >       free(domid_str);
> >       xs_close(xs);
> >    fail:
> > +     free(buf);
> >       return ret;
> >   }
> >
> > @@ -419,13 +426,20 @@ struct libxenvchan *libxenvchan_client_init(struc=
t xentoollog_logger *logger,
> >   {
> >       struct libxenvchan *ctrl =3D malloc(sizeof(struct libxenvchan));
> >       struct xs_handle *xs =3D NULL;
> > -     char buf[64];
> > +     char *buf;
> >       char *ref;
> >       int ring_ref;
> >       unsigned int len;
> >
> >       if (!ctrl)
> >               return 0;
> > +
> > +     buf =3D malloc(XENSTORE_ABS_PATH_MAX);
> > +     if (!buf) {
> > +             free(ctrl);
> > +             return 0;
> > +     }
> > +
> >       ctrl->ring =3D NULL;
> >       ctrl->event =3D NULL;
> >       ctrl->gnttab =3D NULL;
> > @@ -436,8 +450,9 @@ struct libxenvchan *libxenvchan_client_init(struct =
xentoollog_logger *logger,
> >       if (!xs)
> >               goto fail;
> >
> > +
> >   // find xenstore entry
> > -     snprintf(buf, sizeof buf, "%s/ring-ref", xs_path);
> > +     snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_path);
> >       ref =3D xs_read(xs, 0, buf, &len);
> >       if (!ref)
> >               goto fail;
> > @@ -445,7 +460,7 @@ struct libxenvchan *libxenvchan_client_init(struct =
xentoollog_logger *logger,
> >       free(ref);
> >       if (!ring_ref)
> >               goto fail;
> > -     snprintf(buf, sizeof buf, "%s/event-channel", xs_path);
> > +     snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/event-channel", xs_path)=
;
> >       ref =3D xs_read(xs, 0, buf, &len);
> >       if (!ref)
> >               goto fail;
> > @@ -475,6 +490,7 @@ struct libxenvchan *libxenvchan_client_init(struct =
xentoollog_logger *logger,
> >    out:
> >       if (xs)
> >               xs_close(xs);
> > +     free(buf);
> >       return ctrl;
> >    fail:
> >       libxenvchan_close(ctrl);
>
> I think you are leaking buf in case of "goto fail".
No. File with patch doesn't have follows lines:
    ctrl =3D NULL;
    goto out;
}
>
>
> Juergen

