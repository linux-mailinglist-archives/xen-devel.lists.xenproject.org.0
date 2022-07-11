Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95515701EE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 14:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365082.595138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsRY-0002We-6y; Mon, 11 Jul 2022 12:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365082.595138; Mon, 11 Jul 2022 12:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsRY-0002TJ-4F; Mon, 11 Jul 2022 12:23:16 +0000
Received: by outflank-mailman (input) for mailman id 365082;
 Mon, 11 Jul 2022 12:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZ7N=XQ=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oAsRX-0002TD-0y
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 12:23:15 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c05f19e-0114-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 14:23:13 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id h23so8479346ejj.12
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jul 2022 05:23:13 -0700 (PDT)
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
X-Inumbo-ID: 3c05f19e-0114-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7z/Yw9bPW0DKGPmwQ7L+ORE6AGYICJHFKRHeV9+hFV8=;
        b=AT9EqtxGAhw/HNz9jVvPlD6wn9mv0vExV0mgbdwR4kjqrQVqMpOAj+pYVCvNCjdZ4G
         ndmjZa7laJUubXpRZkvAPBB7Y8G9bO8BSrljV8AYlArBI7N4eKQyOSTa4SKrwMTh4mn1
         isVj2ZckCGYYc8Yni820umaxWqDfOSjhA5nuV+w2WvPSjG+uynmX3brRFyqTKhEo4e17
         RF8Suej5Mh115ZgAmcPaD1KjliH//1QX3oPsAaWWynTZIjlDxVMxkdIzUwqJLpyn6/GR
         3WPEs37JGcXxV2rQGvn+LGEcgjy6/zLPtbzivRy4WMROQxwBGJzt+94evhcp6fHNXDV4
         L1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7z/Yw9bPW0DKGPmwQ7L+ORE6AGYICJHFKRHeV9+hFV8=;
        b=7Fag6DK0o7mNzp0VnVoqNhvdT9R4Pd1Vn150FgubUCU+60e/tYJpwL0VorZ/lDKB+Y
         yQPqd62grmQsrmzbPk3Nni75wQAbV8PbghBQ48VYKN1NmLCQmRtKKMolbmBBp1n1wOyC
         1wME8JTZdr5WghinufULa+mCvfZF8IWKFO+glhe4SWwH/AJFdInLce56GPuqg8imVYo/
         WoGgMz8nma0XUuY+0RsqV4mXMDyf/uZTYNqObDMYQL+QVxBLUsVp2Ex3apTshYuSHllV
         N0/OHLp+TltkL9uTYN2Kwcq1X9ovM9iNldId4dOXGH3Rm5n0Oz7NzUAOu0b2Wk+A8LEu
         5uNg==
X-Gm-Message-State: AJIora8dsycPlI3Y/nQqdG68FW47Hk16s2Dv7vA2ZZ50fkTK+L3X213G
	rr+69/yP8sntzqyhb/Gm+Y4UEUhgj8tsCSuU7JU=
X-Google-Smtp-Source: AGRyM1ul3/Uo69TqevUNUyvADa4YDbgHF6GpdCfR57h6fRrE9LnqCEviFE8YhRVMjNYzCpT8qu3JDmVBo16tyc7D37g=
X-Received: by 2002:a17:906:dc8f:b0:725:28d1:422d with SMTP id
 cs15-20020a170906dc8f00b0072528d1422dmr17888687ejc.131.1657542193353; Mon, 11
 Jul 2022 05:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20220709101035.2989428-2-dmitry.semenets@gmail.com> <7e32d853-a1e4-f828-7c27-dbd2e3595d5f@suse.com>
In-Reply-To: <7e32d853-a1e4-f828-7c27-dbd2e3595d5f@suse.com>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Mon, 11 Jul 2022 15:23:02 +0300
Message-ID: <CACM97VUqyG66XHO__+8v6F4Uq=oVi_-_8R=B8STjgOzCb9kmaw@mail.gmail.com>
Subject: Re: [PATCH 2/4] tools: allow vchan XenStore paths more then 64 bytes long
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Dmytro Semenets <dmytro_semenets@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Juergen,
=D0=BF=D0=BD, 11 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3. =D0=B2 10:24, Juergen Gro=
ss <jgross@suse.com>:
>
> On 09.07.22 12:10, dmitry.semenets@gmail.com wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >
> > Current vchan implementation, while dealing with XenStore paths,
> > allocates 64 bytes buffer on the stack which may not be enough for
> > some use-cases. Make the buffer longer to respect maximum allowed
> > XenStore path of XENSTORE_ABS_PATH_MAX.
> >
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> > ---
> >   tools/libs/vchan/init.c | 28 ++++++++++++++++++++++------
> >   1 file changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> > index c6b8674ef5..17945c24a1 100644
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
> > @@ -257,6 +257,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, i=
nt domain, const char* xs_base
> >       // store the base path so we can clean up on server closure
> >       ctrl->xs_path =3D strdup(xs_base);
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
> > @@ -278,14 +284,14 @@ retry_transaction:
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
> > @@ -301,6 +307,7 @@ retry_transaction:
> >       free(domid_str);
> >       xs_close(xs);
> >    fail:
> > +     free(buf);
> >       return ret;
> >   }
> >
> > @@ -418,13 +425,20 @@ struct libxenvchan *libxenvchan_client_init(struc=
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
> > @@ -435,8 +449,9 @@ struct libxenvchan *libxenvchan_client_init(struct =
xentoollog_logger *logger,
> >       if (!xs)
> >               goto fail;
>
> You are leaking buf in this case.
No. buf released in line 474. ctrl leaks in fail case
>
> >
> > +
> >   // find xenstore entry
> > -     snprintf(buf, sizeof buf, "%s/ring-ref", xs_path);
> > +     snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_path);
> >       ref =3D xs_read(xs, 0, buf, &len);
> >       if (!ref)
> >               goto fail;
> > @@ -444,7 +459,7 @@ struct libxenvchan *libxenvchan_client_init(struct =
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
> > @@ -474,6 +489,7 @@ struct libxenvchan *libxenvchan_client_init(struct =
xentoollog_logger *logger,
> >    out:
> >       if (xs)
> >               xs_close(xs);
> > +     free(buf);
> >       return ctrl;
> >    fail:
> >       libxenvchan_close(ctrl);
>
> Juergen

