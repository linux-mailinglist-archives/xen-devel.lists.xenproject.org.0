Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A592B9775
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31089.61318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmXN-0000Hw-76; Thu, 19 Nov 2020 16:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31089.61318; Thu, 19 Nov 2020 16:11:57 +0000
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
	id 1kfmXN-0000HX-3r; Thu, 19 Nov 2020 16:11:57 +0000
Received: by outflank-mailman (input) for mailman id 31089;
 Thu, 19 Nov 2020 16:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfmXM-0000HS-81
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:11:56 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06528d73-8496-40c0-9407-fd32284ff86c;
 Thu, 19 Nov 2020 16:11:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a186so4922318wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:11:55 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id f11sm297184wrs.70.2020.11.19.08.11.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:11:54 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfmXM-0000HS-81
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:11:56 +0000
X-Inumbo-ID: 06528d73-8496-40c0-9407-fd32284ff86c
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 06528d73-8496-40c0-9407-fd32284ff86c;
	Thu, 19 Nov 2020 16:11:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a186so4922318wme.1
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=U6KMN71GE0FFhBDQM3+dgQDGGr3MyR1gzDm51G1UqQM=;
        b=puz/D8EAjXk6Az3NYeaavlZX7aaN3pQI298j4GOaJNIEi06mfNII3NS+C99+I4UOwI
         sug5jf28rFBr0DXlJ3MG4jGd53D2xZPuRGqCSGtICNp4+ALl4lb9LKDluBJChkUIZ1fK
         7xixl3TUgWxbJ7ncS7785AhonDZLyoUNavfPi0Qudj5xykY0K7oEY+PBdE+8VWb47nfL
         ySNbCnWv87BCI3sGPUN+QggYOUcYiA8iqtItNFUx7GaswsMwlLyXFQ/b3ZWaBUxUJqcb
         uylyEhHfrDWwu2mtGg0fkKL1zlodMCg3J5I+mXV+GYSP+rh/KOsEX1zbvMwg+Klbn2xF
         C58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=U6KMN71GE0FFhBDQM3+dgQDGGr3MyR1gzDm51G1UqQM=;
        b=SkCdE6ucVucZ3jUfTghvgnYlFlVTBTT86IeXOhwYIATBffV56MQvj2Iv+kyoNUSMYF
         kkeNP2wihZC+3juGAWbBIMKcgr2lufojUjcO5sy0AnMGlGhbkRHGEegSkUwYrL0UtHRB
         E6EsvKbZZm/OcS7w4qvCXm+Y62W+Mazw6Jmp3pkPtnqFEFFqfCp4T1TvUW8dNwl9d6RG
         LbiwtJ3IAhu0RdwdBf7Wa56421N8h0rQgpLlb7EZAnUHbNja9xYEoWTkm3wlyE0xRHi7
         iagQdeksgkFTrtZBBT4JCYSI18+5ipTdhnUIRkxAj//UaHaALifZRcuUJ/UzhN43hWHN
         0LxQ==
X-Gm-Message-State: AOAM531gU6NNeCL2UiP4Z1VqE5kn/HM1z7zdHZ8IYG8KE4NxQLGmblR9
	1C3kvl07tPW/MoqQIheuvzI=
X-Google-Smtp-Source: ABdhPJwDNPThcVMp5xwjf6+U92YaRKfqwdPabk3c9lu/nCa7GuuP+/P5NW5rEWRgt022B3fbIAdjrw==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr5310178wmi.146.1605802314559;
        Thu, 19 Nov 2020 08:11:54 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id f11sm297184wrs.70.2020.11.19.08.11.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 08:11:54 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org> <20201111200721.30551-7-paul@xen.org> <dd6c4a0d-f611-7b81-8c95-72786891f311@suse.com>
In-Reply-To: <dd6c4a0d-f611-7b81-8c95-72786891f311@suse.com>
Subject: RE: [PATCH 06/10] viridian: add ExProcessorMasks variants of the flush hypercalls
Date: Thu, 19 Nov 2020 16:11:53 -0000
Message-ID: <00cc01d6be8e$b24973c0$16dc5b40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogHMVqApAbxd85SpTMBtEA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 12 November 2020 09:19
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 06/10] viridian: add ExProcessorMasks variants of =
the flush hypercalls
>=20
> On 11.11.2020 21:07, Paul Durrant wrote:
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -553,6 +553,83 @@ static unsigned int vpmask_next(struct =
hypercall_vpmask *vpmask, unsigned int
> vp
> >  	     (vp) < HVM_MAX_VCPUS; \
> >  	     (vp) =3D vpmask_next(vpmask, vp))
> >
> > +struct hypercall_vpset {
> > +        struct hv_vpset set;
> > +        uint64_t __bank_contents[64];
>=20
> gcc documents this to be supported as an extension; did you check
> clang supports this, too?

By 'this', do you mean the assumption that that memory layout is =
consecutive?

> (I'd also prefer if the leading
> underscores could be dropped, but as you know I'm not the maintainer
> of this code.)
>=20
> > +static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
> > +{
> > +    uint64_t bank_mask;
> > +    unsigned int nr =3D 0;
> > +
> > +    for ( bank_mask =3D vpset->valid_bank_mask; bank_mask; =
bank_mask >>=3D 1 )
> > +        if ( bank_mask & 1 )
> > +            nr++;
> > +
> > +    return nr;
> > +}
>=20
> Simply use hweight64()?
>=20

Ok.

> > +static uint16_t hv_vpset_to_vpmask(struct hv_vpset *set, size_t =
size,
> > +                                   struct hypercall_vpmask *vpmask)
> > +{
> > +    switch ( set->format )
> > +    {
> > +    case HV_GENERIC_SET_ALL:
> > +        vpmask_fill(vpmask);
> > +        return 0;
> > +
> > +    case HV_GENERIC_SET_SPARSE_4K:
> > +    {
> > +        uint64_t bank_mask;
> > +        unsigned int bank =3D 0, vp =3D 0;
> > +
> > +        vpmask_empty(vpmask);
> > +        for ( bank_mask =3D set->valid_bank_mask; bank_mask; =
bank_mask >>=3D 1 )
> > +        {
> > +            /* Make sure we won't dereference past the end of the =
array */
> > +            if ( (void *)(set->bank_contents + bank) >=3D
> > +                 (void *)set + size )
> > +            {
> > +                ASSERT_UNREACHABLE();
> > +                return -EINVAL;
> > +            }
>=20
> Doesn't this come too late? I.e. don't you want to check instead
> (or also) that you won't overrun the space when copying in from
> the guest? And for the specific purpose here, doesn't it come too
> early, as you won't access any memory when the low bit of bank_mask
> isn't set?
>=20

I'll dry-run this again. It may make more sense to move the check.

  Paul

> Jan


