Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5A48B919
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256159.439458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7OE5-0001Tw-W3; Tue, 11 Jan 2022 20:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256159.439458; Tue, 11 Jan 2022 20:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7OE5-0001R1-Sg; Tue, 11 Jan 2022 20:58:41 +0000
Received: by outflank-mailman (input) for mailman id 256159;
 Tue, 11 Jan 2022 20:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMrX=R3=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1n7OE4-0001Om-Bt
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:58:40 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe6eeb7-7321-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:58:38 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id o12so1087309lfk.1;
 Tue, 11 Jan 2022 12:58:38 -0800 (PST)
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
X-Inumbo-ID: 3fe6eeb7-7321-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1v+9Ueeg7OUQ3kdGw68OPT8Wm7+J1hRdoFF6SyrlxQ=;
        b=dO552taYRC5MqeaXNw/2wooBC+b8eO3MpdHdMrzRRyHd/yRb60MgaWsX7b6jrYkmBv
         eE47KfBKv2Gw9UWVJRn1GGxVVdgVM9+3wuTE8QwiaE/yXQoDE4+bSRY+AdicMea+8UYm
         LU822VxSMB6ViC3KyW8N/Yc/fzGn2o4JrFNAOxXc8bi8NEn9va+zYBqARo+uAEbr4hgS
         Tqbp5VKPsL6wUAQCiUAWZzrVnIjl0QaF1nOdnCUffWveoSp63IEOjl+i/5T9hbTiT4fQ
         lKKBlk+uW7qoKeFu2dQ7uY36xkPKu4yeNd+BNNFv/NMoo6A/3hsp0UvxdnOrXANnJKWD
         cQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1v+9Ueeg7OUQ3kdGw68OPT8Wm7+J1hRdoFF6SyrlxQ=;
        b=tPoq4VTiTBbWE4i8TcR6e4i+6yTRSLXiJfxP+wNiWorPVn1E5Xt4IN+d+c4IBNdOdc
         bUnZLYA2vTZtTZ1ku4EZs+jfWCuEF7757tRngV4CTXZUE70XtV3SOsCWt/TZoL9T+ooW
         YtLMUDiD7So+Fl7QKz8AFbqS2oGi7itVjo6tQnJ5NXmzvS8DQLGpzlzLBzUzID0KPH3/
         RUamKuOnfxBR7I20IIoWEWYbfn35E5v496dwUOqbcTm3S+5mHhsrp0d7uHMWu+luAHCi
         7FWCI8S13/En/Pc9v28MrGepWf5a/1cnpl6mAw6rtc3F1S3jWwYMKZL2zYlN8LvAqX0X
         iEmw==
X-Gm-Message-State: AOAM533La/A62WwIOuz34CvNgg9DyGPdYpSd7JN/laMDlATfkg15/Gs0
	UiVrEiNlvN4rLdn5OKuGt92FEBdhGX5c5iJunuY=
X-Google-Smtp-Source: ABdhPJwsZgYQK/QDNS7/XYyoGOTw2hRcfA8tQikuefdLMc9jR5U9Sozdg6EdupTPlksDCEb9VgmPXIACxsw4hRU299Y=
X-Received: by 2002:a05:651c:1241:: with SMTP id h1mr2097250ljh.459.1641934718135;
 Tue, 11 Jan 2022 12:58:38 -0800 (PST)
MIME-Version: 1.0
References: <20220111151215.22955-1-jgross@suse.com> <20220111151215.22955-5-jgross@suse.com>
 <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>
In-Reply-To: <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 11 Jan 2022 15:58:26 -0500
Message-ID: <CAKf6xps03Dn8kaAPeAgctU9Dze17qX-uLVx05+yX038weqwtJQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in tpm_tis
To: Andrew Cooper <amc96@srcf.net>
Cc: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 11, 2022 at 3:29 PM Andrew Cooper <amc96@srcf.net> wrote:
>
> On 11/01/2022 15:12, Juergen Gross wrote:
> > diff --git a/tpm_tis.c b/tpm_tis.c
> > index 477f555..abea7a1 100644
> > --- a/tpm_tis.c
> > +++ b/tpm_tis.c
> > @@ -1093,6 +1097,23 @@ ssize_t tpm_getcap(struct tpm_chip *chip, uint32_t subcap_id, cap_t *cap,
> >          return rc;
> >  }
> >
> > +static void shutdown_tpm_tis(struct tpm_chip* tpm){
>
> Style, as you're moving it.  Also in the function.
>
> > @@ -1360,6 +1369,35 @@ int tpm_tis_posix_fstat(int fd, struct stat* buf)
> >     return 0;
> >  }
> >
> > +static struct file_ops tpm_tis_ops = {
> > +    .name = "tpm_tis",
> > +    .read = tpm_tis_posix_read,
> > +    .write = tpm_tis_posix_write,
> > +    .lseek = lseek_default,
> > +    .close = tpm_tis_close,
> > +    .fstat = tpm_tis_posix_fstat,
> > +};
> > +
> > +int tpm_tis_open(struct tpm_chip* tpm)
>
> Style.
>
> > +{
> > +   struct file *file;
> > +   static unsigned int ftype_tis;
> > +
> > +   /* Silently prevent multiple opens */
> > +   if(tpm->fd != -1) {
> > +      return tpm->fd;
> > +   }
>
> Another WTF moment.  We silently swallow multiple open()s, but don't
> refcout close()s ?
>
> This cannot be correct, or sensible, behaviour.
>
> Jason/Daniel - thoughts?

Looks like vtpmmgr only opens a single global fd, so it has not been a
problem in practice.

You need some sort of synchronization to let multiple entities access
the TPM.  So limiting to only a single entity/single FD is a
reasonable restriction.

Regards,
Jason

