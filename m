Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB2832C8C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 16:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669101.1041722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQrA0-0006w6-PM; Fri, 19 Jan 2024 15:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669101.1041722; Fri, 19 Jan 2024 15:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQrA0-0006u0-Lz; Fri, 19 Jan 2024 15:52:00 +0000
Received: by outflank-mailman (input) for mailman id 669101;
 Fri, 19 Jan 2024 15:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7y8=I5=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1rQr9z-0006tu-Cm
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 15:51:59 +0000
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd3a3d9-b6e2-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 16:51:58 +0100 (CET)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-58e256505f7so424443eaf.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 07:51:58 -0800 (PST)
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
X-Inumbo-ID: acd3a3d9-b6e2-11ee-98f2-6d05b1d4d9a1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705679517; x=1706284317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pm28q3TZ7lhHecJgTwi+Q6z2jRKdFYN2qkBEe1yZM3c=;
        b=AKJw/DW8Q/0gvs8YsIsvxQYM7DGQeIQni4aqFlI6WBV2hggUpg7srOsPzcAFYCV/pM
         w8WchMK6ON7tbuP2NcSFit2ZCTjMPk9eqmGmDrKve89KtuNREW4kMKqR6CeqLfm9sMXL
         waNi6Kn3bAW5ZT4GLjrWw854IE7frc6Na7N/e5SdkNSASXOJUsPoOb2S38R7SGAfBHQC
         zyu58doi18kyKiLBcKOlep1/CR5o/DhKYBqkrG6auW34HlG+tajxF1AKU5KkoRGFG5Ta
         bn3p6AZR5UY3+muxgEjQlC8oFUsFGkptMrvrbpl8XUCdZD6RT0P4tg8V5z7HVIpWl0ty
         Rbsw==
X-Gm-Message-State: AOJu0YwlkfqHh1KDZzWQxR0/pbEjuGsC/Y1ugH27htHGYN+6TyZyRx3Q
	E4ioxZd4TtNH8+s5CtvaHdr16bfSCDyUjTlj1x4SOE+SFueUOhU0fXRMjpYlKuqLwy1IrIuaOID
	YB0d5+KAMXdCEac+dtwU9qSNyyiHKYjaU
X-Google-Smtp-Source: AGHT+IGOk5ESY163S3DnNHuFubZY8eO9yL9Ac3aC7HXnxaDG4leZUWEE8gGgqLhNtBX6PEc76/aH9EwQMp+5oPA8ns0=
X-Received: by 2002:a05:6359:2ea3:b0:176:1227:873f with SMTP id
 rp35-20020a0563592ea300b001761227873fmr2750024rwb.50.1705679516755; Fri, 19
 Jan 2024 07:51:56 -0800 (PST)
MIME-Version: 1.0
References: <YdQgf2+E467kuTxK@Air-de-Roger> <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger> <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger> <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
 <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de> <Y2OwzjfUnCFf2EDU@Air-de-Roger>
 <CAKhsbWZM3y7D=vQzng3GndQOzhx5RcDHWFVXdJZhCt-qz5CtwQ@mail.gmail.com>
 <DCF59D19-59C2-43E9-9F25-7F64FFF691F7@appli.se> <ZZ1P4lSL_jPztGJ3@macbook>
In-Reply-To: <ZZ1P4lSL_jPztGJ3@macbook>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Fri, 19 Jan 2024 23:51:45 +0800
Message-ID: <CAKhsbWZBYGmTjf_L99U=Az7ijLS2zqGOv90zfBCVtVRbL80oUQ@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Niklas Hallqvist <niklas@appli.se>, Paul Leiber <paul@onlineschubla.de>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 11:28=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Tue, Jan 09, 2024 at 12:13:04PM +0100, Niklas Hallqvist wrote:
> > > On 14 Dec 2022, at 07:16, G.R. <firemeteor@users.sourceforge.net> wro=
te:
...
> > > Hi Roger,
> > > Just another query of the latest status. It'll be great if you can
> > > share a link to the upstream commit.
> > > I'm thinking of asking for a back-port of your fix to the FreeNAS
> > > community, assuming it will take a long time to roll out otherwise.
> > >
> > > Thanks,
> > > G.R.
> > >
> > >>
> > >> Thanks, Roger.
> > >
> > >
> >
> > Hi everyone!
> >
> > So did anything ever happen on this?  I find myself in the same situati=
on with TrueNAS core 13, and can=E2=80=99t see any signs of changes in the =
FreeBSD 13 branches.
>
> Hello,
>
> I don't think the change is suitable to backport, it's IMO too
> intrusive and risky.  It was committed late 2022, and it's in 14.0:
>
...
> TrueNAS/OOPNsense might consider picking it up themselves.
>
> Thanks, Roger.

Just FYI: I was able to locate that commit in 14.0 tree and
cherry-picked it into TrueNas 13.
I did it last November and the build has been running stably without
issue since.
The fix was fairly standalone and didn't cause any trouble during the
cherry-picking so it could be reasonable to raise a request in the
TrueNAS forum.

Thanks,
G.R.

