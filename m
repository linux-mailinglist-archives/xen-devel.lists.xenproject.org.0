Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FE2C3010
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 19:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36786.68814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdF2-0007jU-E5; Tue, 24 Nov 2020 18:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36786.68814; Tue, 24 Nov 2020 18:40:40 +0000
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
	id 1khdF2-0007j5-AV; Tue, 24 Nov 2020 18:40:40 +0000
Received: by outflank-mailman (input) for mailman id 36786;
 Tue, 24 Nov 2020 18:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Zhb=E6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1khdF1-0007j0-Kl
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:40:39 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45289449-690e-4326-b0ac-a1da34df2809;
 Tue, 24 Nov 2020 18:40:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w24so3950248wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 10:40:38 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id q66sm7533447wme.6.2020.11.24.10.40.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Nov 2020 10:40:37 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5Zhb=E6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1khdF1-0007j0-Kl
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:40:39 +0000
X-Inumbo-ID: 45289449-690e-4326-b0ac-a1da34df2809
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 45289449-690e-4326-b0ac-a1da34df2809;
	Tue, 24 Nov 2020 18:40:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w24so3950248wmi.0
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 10:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=xVMrEUi82jOaWz0MJruX61qpO0RoLueRqr3pVIhR4Cg=;
        b=drD5GkCS69gCpKabzmP2fuT1G/hrFF0qpR3ZPu9kw/geTe9rfR+BgudS9nIFeiBtTF
         vlPJIY+GagP2dHMAhAze6reyi+Xcgsxn2F82pT8vvDIsw5ZazERD/eFKj14SmUieNTlx
         KZo7x+l+kyUlJngbNkiJa8ETwKIja364otFQtc4G9NoTG1vW8f8vRXN0P8KsJhqsuwh6
         G409CgujLGK/ugRQAjG275YS2hnXM1a+Ei5W8Ew8sDRhKNchalSL21jeYjRYo/r9ukOJ
         VSeGSG68dFnGObZnmBOqtUOxArP4ELiXMEqoXbV3wvdu79Y2WXHVlH2bDOgWloVD+evA
         iKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=xVMrEUi82jOaWz0MJruX61qpO0RoLueRqr3pVIhR4Cg=;
        b=A1qODfOnBtQU/99EO3tuH3gPIJUpRuuQiYJvYYsP12vf8S8G2fd6prGrm4YlqepTCA
         8qPhfNZqygiplpGiFRDUegPdl5yCsz5KRuOVKCWAbbO2xjkBsFysDZzbpSRA0RxC1oBF
         hYUUyiDKlOd/NB+ijvH8vKC4N5682JtObtrLMFGsgvJmB+gmEImIHlg/H2zvX0ZFrQZt
         +n5Sp6lSfUWWSyHnw6VY9WXBfpolKOkyhj1XWjMaHQgEKWGZaPJa6C9lfumESJd/qzyU
         YI3huiODIyuQGjYTdXIDHbuBqz7DmTHFyaJkC45lfiZWQf37bL7ziogsemhUUulsrhJL
         xoqg==
X-Gm-Message-State: AOAM533i/cYjqxuZ9sE8IGV+FFQku6d7fwODy5Mt+GxJiN20Ad3EJoec
	QI/rtfc6H1mmsUtfhNiSWmU=
X-Google-Smtp-Source: ABdhPJz2wq7G9BCrob+7dJcpXgP9tx15CHmCavNyi7Z8p9yg+hLdvXssdTEDk17i+o1WFWfo5CJ2Xw==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr6039192wmc.161.1606243237862;
        Tue, 24 Nov 2020 10:40:37 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id q66sm7533447wme.6.2020.11.24.10.40.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 10:40:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201120094900.1489-1-paul@xen.org> <20201120094900.1489-9-paul@xen.org> <1b8d71bc-5f6d-b458-e0fc-2a2f0d29ddd8@suse.com>
In-Reply-To: <1b8d71bc-5f6d-b458-e0fc-2a2f0d29ddd8@suse.com>
Subject: RE: [PATCH v2 08/12] viridian: add ExProcessorMasks variants of the flush hypercalls
Date: Tue, 24 Nov 2020 18:40:36 -0000
Message-ID: <006101d6c291$4d12ea20$e738be60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH2MKAKjLdIZTWPg9fOgT90SKBicQEWVvALAlYgE+upfVyzYA==
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 24 November 2020 16:56
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v2 08/12] viridian: add ExProcessorMasks variants =
of the flush hypercalls
>=20
> On 20.11.2020 10:48, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > The Microsoft Hypervisor TLFS specifies variants of the already =
implemented
> > HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST hypercalls that take a =
'Virtual
> > Processor Set' as an argument rather than a simple 64-bit mask.
> >
> > This patch adds a new hvcall_flush_ex() function to implement these
> > (HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX) hypercalls. This makes =
use of
> > new helper functions, hv_vpset_nr_banks() and hv_vpset_to_vpmask(), =
to
> > determine the size of the Virtual Processor Set (so it can be copied =
from
> > guest memory) and parse it into hypercall_vpmask (respectively).
> >
> > NOTE: A guest should not yet issue these hypercalls as =
'ExProcessorMasks'
> >       support needs to be advertised via CPUID. This will be done in =
a
> >       subsequent patch.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>=20
> Just a couple of cosmetic remarks, apart from them this looks
> good to me, albeit some of the size calculations are quite,
> well, involved. I guess like with most parts if this series,
> in the end Wei will need to give his ack.
>=20
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -576,6 +576,70 @@ static unsigned int vpmask_nr(const struct =
hypercall_vpmask *vpmask)
> >      return bitmap_weight(vpmask->mask, HVM_MAX_VCPUS);
> >  }
> >
> > +#define HV_VPSET_BANK_SIZE \
> > +    sizeof_field(struct hv_vpset, bank_contents[0])
> > +
> > +#define HV_VPSET_SIZE(banks)   \
> > +    (sizeof(struct hv_vpset) + (banks * HV_VPSET_BANK_SIZE))
>=20
> Personally I think this would be better done using
> offsetof(struct hv_vpset, bank_contents), but you're the maintainer.
> However, "banks" wants parenthesizing, just in case.
>=20

No, I actually prefer using offsetof() and yes I do indeed need to =
parenthesize 'banks'.

> > +#define HV_VPSET_MAX_BANKS \
> > +    (sizeof_field(struct hv_vpset, valid_bank_mask) * 8)
> > +
> > +struct hypercall_vpset {
> > +    union {
> > +        struct hv_vpset set;
> > +        uint8_t pad[HV_VPSET_SIZE(HV_VPSET_MAX_BANKS)];
> > +    };
> > +};
>=20
> A struct with just a union as member could be expressed as a simple
> union - any reason you prefer the slightly more involved variant?
>=20

Not really... it's only that it was a struct in the original patch. I'll =
change to using a union.

> > +static DEFINE_PER_CPU(struct hypercall_vpset, hypercall_vpset);
> > +
> > +static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
> > +{
> > +    return hweight64(vpset->valid_bank_mask);
> > +}
> > +
> > +static uint16_t hv_vpset_to_vpmask(struct hv_vpset *set,
>=20
> const?
>=20

Ok.

> > @@ -656,6 +720,78 @@ static int hvcall_flush(union hypercall_input =
*input,
> >      return 0;
> >  }
> >
> > +static int hvcall_flush_ex(union hypercall_input *input,
>=20
> const again?
>=20

True, but I'll need to go back and do that for the others too.

> > +                           union hypercall_output *output,
> > +                           unsigned long input_params_gpa,
> > +                           unsigned long output_params_gpa)
>=20
> Mainly for cosmetic reasons and to be in sync with
> hvm_copy_from_guest_phys()'s respective parameter, perhaps both
> would better be paddr_t?
>=20

Ok. Again I'll fix the prior patches to match.

  Paul

> Jan


