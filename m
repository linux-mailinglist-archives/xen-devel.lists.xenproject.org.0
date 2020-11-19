Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1852B9742
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31048.61267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmOa-0007G0-Es; Thu, 19 Nov 2020 16:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31048.61267; Thu, 19 Nov 2020 16:02:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmOa-0007Fb-BG; Thu, 19 Nov 2020 16:02:52 +0000
Received: by outflank-mailman (input) for mailman id 31048;
 Thu, 19 Nov 2020 16:02:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfmOZ-0007FW-Cw
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:02:51 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a21a3481-f5c9-40bb-afd6-2fbf3b204106;
 Thu, 19 Nov 2020 16:02:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so7009616wrt.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:02:50 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id t11sm418333wmf.35.2020.11.19.08.02.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:02:49 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfmOZ-0007FW-Cw
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:02:51 +0000
X-Inumbo-ID: a21a3481-f5c9-40bb-afd6-2fbf3b204106
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a21a3481-f5c9-40bb-afd6-2fbf3b204106;
	Thu, 19 Nov 2020 16:02:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so7009616wrt.4
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=HuGQ3lQ03KGnHXC3BKlflZ3nowvXdSaMhL4k2L0BD2M=;
        b=gx00K8ajFIMTdY+C8DB0TbXQgAP8YaLyEHZ88VNCIrQeJ6IaDjBjgrB3A33by8Hnrr
         PNGiratUaDXWttOpmOqPZVkbpS/FfkK+Ylqz6oPGmZWPys+NAOgY9SiEDNkFPM8VM5ZJ
         yNzvZtIApDidsiTSCy9gm9kUWEueqxJvJdBBRpl1rdPf4hgyjPDR/Wg7eHT2aATzjHrE
         I8QXITSl3E2+V6KuAle9bzgZ0dIpc4NwumFBDsS5vQwV4pVHIMb/FbzTufIcpkSkVpLb
         il0v4LIGHBzsIBYIxrzpcgAts0qMpuBdADk/ml5MwroZnwLkXaSZuxdY490FwFJwcDqF
         4gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=HuGQ3lQ03KGnHXC3BKlflZ3nowvXdSaMhL4k2L0BD2M=;
        b=PevSF2oAsCe9zQfOL83ynI4ocNyOEIjWCLoIJUjbMSe4k496R9DvdZtKV4kVpNuQ5R
         qr3E3FkXd4VdrEJDDubV47W63NPBzHc+HgLemZM2syQpuAPhoNVre9qpNCLAZSpmM0kf
         8vQv7tMdld6gJSnCtme8GgmHv2TK+SJ9aVbCzn72fg8iE55+wPXxGAxIxHwsZJJl9BpR
         nU8M1sdnkYwHk8gUKPaCIUOUquceCjp8/pL8QzRaoer4Dc/n72qTWNn4Gl7AGsRh+y8k
         INOleDVBfqmgrnITAmUutqPTK0JNsJucJBa25urrKEjfoo0/prDRs4LBKuWndDLnbSEY
         tzUQ==
X-Gm-Message-State: AOAM531PTjfnm6oNnob2xBHbn6D+AticjVWMmteC5IeTVR4/jODBEhvF
	Kiqkul9ruEr5prhC2oh9mKE=
X-Google-Smtp-Source: ABdhPJxoVO7tqWmWxrswJn8yoH4DYRqq33/CW3fAf4jWthgYI2sCCrr8EgCURFtoZ3KYcnJ2kKl0HQ==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr11551682wrp.77.1605801769679;
        Thu, 19 Nov 2020 08:02:49 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id t11sm418333wmf.35.2020.11.19.08.02.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 08:02:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org> <20201111200721.30551-4-paul@xen.org> <01c7747e-70d0-e32b-45a6-afc1688c1741@suse.com>
In-Reply-To: <01c7747e-70d0-e32b-45a6-afc1688c1741@suse.com>
Subject: RE: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and accessor functions...
Date: Thu, 19 Nov 2020 16:02:48 -0000
Message-ID: <00c901d6be8d$6d7a5c10$486f1430$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogKUvRrlAaY1NKepRytzUA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com
> Sent: 12 November 2020 08:46
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 03/10] viridian: introduce a per-cpu =
hypercall_vpmask and accessor functions...
>=20
> On 11.11.2020 21:07, Paul Durrant wrote:
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -507,15 +507,41 @@ void viridian_domain_deinit(struct domain *d)
> >      XFREE(d->arch.hvm.viridian);
> >  }
> >
> > +struct hypercall_vpmask {
> > +    DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
> > +};
> > +
> > +static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
> > +
> > +static void vpmask_empty(struct hypercall_vpmask *vpmask)
>=20
> const?

Yes, I suppose that's ook for all these since the outer struct is not =
changing... It's a bit misleading though.

>=20
> > +{
> > +    bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
> > +}
> > +
> > +static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned =
int vp)
> > +{
> > +    __set_bit(vp, vpmask->mask);
>=20
> Perhaps assert vp in range here and ...
>=20
> > +}
> > +
> > +static void vpmask_fill(struct hypercall_vpmask *vpmask)
> > +{
> > +    bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
> > +}
> > +
> > +static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned =
int vp)
> > +{
> > +    return test_bit(vp, vpmask->mask);
>=20
> ... here?

Ok.

>=20
> This also wants const again.
>=20
> > @@ -567,13 +594,29 @@ static int hvcall_flush(union hypercall_input =
*input,
> >       * so err on the safe side.
> >       */
> >      if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
> > -        input_params.vcpu_mask =3D ~0ul;
> > +        vpmask_fill(vpmask);
> > +    else
> > +    {
> > +        unsigned int vp;
> > +
> > +        vpmask_empty(vpmask);
> > +        for (vp =3D 0; vp < 64; vp++)
>=20
> Nit: Missing blanks.
>=20

Oh yes. You can tell I was moving between this and libxl code :-)

> > +        {
> > +            if ( !input_params.vcpu_mask )
> > +                break;
> > +
> > +            if ( input_params.vcpu_mask & 1 )
> > +                vpmask_set(vpmask, vp);
> > +
> > +            input_params.vcpu_mask >>=3D 1;
> > +        }
>=20
> Wouldn't bitmap_zero() + bitmap_copy() (in a suitable wrapper)
> be quite a bit cheaper a way to achieve the same effect?
>=20

Yes, I guess that would work.

  Paul

> Jan


