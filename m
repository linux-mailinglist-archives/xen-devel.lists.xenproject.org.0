Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA52B9881
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31193.61487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfn6C-0005Dg-Nm; Thu, 19 Nov 2020 16:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31193.61487; Thu, 19 Nov 2020 16:47:56 +0000
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
	id 1kfn6C-0005DH-KF; Thu, 19 Nov 2020 16:47:56 +0000
Received: by outflank-mailman (input) for mailman id 31193;
 Thu, 19 Nov 2020 16:47:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfn6A-0005DB-Tr
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:47:54 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1731af1-f070-4113-b0c2-27995c80fcb4;
 Thu, 19 Nov 2020 16:47:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id d142so7825493wmd.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:47:54 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id u6sm574570wmj.40.2020.11.19.08.47.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:47:52 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfn6A-0005DB-Tr
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:47:54 +0000
X-Inumbo-ID: c1731af1-f070-4113-b0c2-27995c80fcb4
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1731af1-f070-4113-b0c2-27995c80fcb4;
	Thu, 19 Nov 2020 16:47:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id d142so7825493wmd.4
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Exw3myhehWT2/9tPrsDQoWiIuT+J+BTbzR4akiYXSpI=;
        b=PsWOOjrzzmk84CdhZM/EW4UrpanJRNqZv+H6Nfe4Mx6XR4wGoNjodOKCqV5+wv5mLr
         KQzWARYzijodq3emI/vf+blBCigaCKCuxnDOjRvSU/Y624C8gnJwKVyTT7yC6X/x/qOL
         FkREZJxpFLzNEQ/zPr+VG7KAApLCwcYvLO00696Nue52gUMLdWPaVMKv3xn6CmfUVvxl
         LS7BloTkIHliU1vEhckwwsVxfQsHR9ejwVIluoSwOXC2CuLjvvFcy+qb+FMizaA/V76q
         HiesQPIi82eBHB1oxI1FhgDz3VC3z5mJ8PGd5sEHuIG8sGHyI1Ak1qs8T1cRw5huti7y
         U3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=Exw3myhehWT2/9tPrsDQoWiIuT+J+BTbzR4akiYXSpI=;
        b=SxeCPI/I+za6y694RkRv+/AyZWbjcDbskqAPNDSB50jetQYM+Y9bT8YSvmlKRczhrC
         8ONiyISsu3GYGYCz3CPkgl5L28j52b1Tku0RMW43KIkDwfWSYmWHjEdVApRdMvpn0uFh
         ztNyszoONgsc70LAsq9AGOyJRcMCr5aLqKzX3R4MdBQvMRiksrNX4szsf89ru87M5SYH
         1dvuBF5XF/ZTKasyXzLp1D9KDQ+pYAUrwQlIgNc/b6HLXPGTi9M+U5QolA41eebmzLXA
         I+73lPjic8vUNWGhfgSwk2js8toOYSUys6JRhZ7QhNMt7ZoR8KcxGcUlzRUNzxe+7dVh
         d4qw==
X-Gm-Message-State: AOAM532qf0YEQGTh9qM4j43SwwAs3wulrnSYxnbzI0gPxYZXywtRfy/p
	GLhCfOI+FZ9llvk8fFoiBEU=
X-Google-Smtp-Source: ABdhPJyljCFPFEHkP0a17oyTk6p8MoWTjdAJtafhl5XLvjdfD69NtmX9BA3Cm9nWnvvgrueFiVvSaA==
X-Received: by 2002:a1c:b487:: with SMTP id d129mr5745313wmf.38.1605804473291;
        Thu, 19 Nov 2020 08:47:53 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id u6sm574570wmj.40.2020.11.19.08.47.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 08:47:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org> <20201111200721.30551-7-paul@xen.org> <dd6c4a0d-f611-7b81-8c95-72786891f311@suse.com> <00cc01d6be8e$b24973c0$16dc5b40$@xen.org> <f974ee35-239a-644f-ab81-ab4a435e3693@suse.com>
In-Reply-To: <f974ee35-239a-644f-ab81-ab4a435e3693@suse.com>
Subject: RE: [PATCH 06/10] viridian: add ExProcessorMasks variants of the flush hypercalls
Date: Thu, 19 Nov 2020 16:47:52 -0000
Message-ID: <00ce01d6be93$b90857d0$2b190770$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogHMVqApAbxd85QCfSbd3ALQ2i2tqSJbAxA=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 November 2020 16:45
> To: paul@xen.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Wei Liu' <wl@xen.org>; =
'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'Roger Pau Monn=C3=A9' =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 06/10] viridian: add ExProcessorMasks variants of =
the flush hypercalls
>=20
> On 19.11.2020 17:11, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 12 November 2020 09:19
> >>
> >> On 11.11.2020 21:07, Paul Durrant wrote:
> >>> --- a/xen/arch/x86/hvm/viridian/viridian.c
> >>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> >>> @@ -553,6 +553,83 @@ static unsigned int vpmask_next(struct =
hypercall_vpmask *vpmask, unsigned int
> >> vp
> >>>  	     (vp) < HVM_MAX_VCPUS; \
> >>>  	     (vp) =3D vpmask_next(vpmask, vp))
> >>>
> >>> +struct hypercall_vpset {
> >>> +        struct hv_vpset set;
> >>> +        uint64_t __bank_contents[64];
> >>
> >> gcc documents this to be supported as an extension; did you check
> >> clang supports this, too?
> >
> > By 'this', do you mean the assumption that that memory layout is =
consecutive?
>=20
> No, rather the basic language aspect that in standard C a struct
> member which is a struct ending in a flexible array member may
> not be followed by any other field.
>

Ah, ok, now I understand what you mean. I'll union it to reserve the =
space instead.

  Paul
=20
> Jan


