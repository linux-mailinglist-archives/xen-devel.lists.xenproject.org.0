Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0329394B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9079.24408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUp50-0007Lf-9r; Tue, 20 Oct 2020 10:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9079.24408; Tue, 20 Oct 2020 10:41:22 +0000
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
	id 1kUp50-0007LG-6H; Tue, 20 Oct 2020 10:41:22 +0000
Received: by outflank-mailman (input) for mailman id 9079;
 Tue, 20 Oct 2020 10:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUp4z-0007LB-3C
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:41:21 +0000
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc6fc9e-57af-4ccc-8e40-b2248c23c285;
 Tue, 20 Oct 2020 10:41:20 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e22so1958841ejr.4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:41:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id v2sm2000163ejh.57.2020.10.20.03.41.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 03:41:18 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUp4z-0007LB-3C
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:41:21 +0000
X-Inumbo-ID: 0cc6fc9e-57af-4ccc-8e40-b2248c23c285
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0cc6fc9e-57af-4ccc-8e40-b2248c23c285;
	Tue, 20 Oct 2020 10:41:20 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e22so1958841ejr.4
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=jMMJAuqMJd9IwVqmRHD9s4S3XfgSMs6de7upEmAz9ms=;
        b=XocC9RKzCwbr5Y2Xe3XjxoLhS6G71tzSLhFVF+8vmAfEwbWph4Xr7CYoPy+c3l9Cjw
         HmPUz8FEqSkvFpZQ+lvsusotJXB6JWH6mBkNJAobtRaWKJow0i3/Q19QHt4iDzTh8FNv
         2FOXdlnPl0gipwTPgMHQXXQRjgOwWR+JcE5PrimYbNdtiugGuPi//qzawJwjR3Gf0Udo
         C3aI3Pm32Gpmx27Zmgs8D1R9A0K9/pzYcN+BTQdUVAj0fbjYzgrqpGSyerFl83TnYgxA
         k7RDinNVAjmcP0ving3Y12HDt9FhjDimTLBDOFYqK2ZJzUuPK/U4QCZZdx4sWrNPHfpR
         +jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=jMMJAuqMJd9IwVqmRHD9s4S3XfgSMs6de7upEmAz9ms=;
        b=OhkhGuYeICpIXdmPKQrLdcKP4elEoTXy/3Zi3K9NUoMkrBOT91OKWe7m/+kSxvRIR4
         6yiNy7UBP4tR38eEuXu0psOOnybbaDaqUsohUc8rMp50WmBz5hxQdIwaSUJMhA1p66tq
         yQjYXC1fmlFPCtDBFINWdKc6YR9PqON/K6X7G/kPQQsbHw/kAE7+jQaQwH/KIhL5K8nr
         5SJ9QAh+eJD8DM+JHRidM5lz7JsUSrX3Yhxw5xk0N9blpcFTaq0QfUgf7DKUE5KW13DT
         cBCG4qsdM6CqBu5xOBYiur64NkGeluwabpcSno+4qk5yvTaLg93PoYibSG14DwMU8lLj
         jD8w==
X-Gm-Message-State: AOAM531b0+33SZ8fHpjNmyGo8rl6bYlFJu7ab2Nv5AQ9RT/5G2Uz3njR
	LQa1kEVscFAKF+fDhXU7CCk=
X-Google-Smtp-Source: ABdhPJyUVMVtvA5KSETiwHrRy/IApkaY7X05GHs1FxJMaRXedpHnjS5KY7uxC42I3lFy80mFpg1wdA==
X-Received: by 2002:a17:906:52c6:: with SMTP id w6mr2299919ejn.199.1603190479392;
        Tue, 20 Oct 2020 03:41:19 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
        by smtp.gmail.com with ESMTPSA id v2sm2000163ejh.57.2020.10.20.03.41.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 03:41:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-9-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 08/23] xen/ioreq: Introduce ioreq_params to abstract accesses to arch.hvm.params
Date: Tue, 20 Oct 2020 11:41:17 +0100
Message-ID: <004c01d6a6cd$8b3e22e0$a1ba68a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAHfL4kBqmlR/vA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 08/23] xen/ioreq: Introduce ioreq_params to =
abstract accesses to arch.hvm.params
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> We don't want to move HVM params field out of *arch.hvm* in this =
particular
> case as although it stores a few IOREQ params, it is not a =
(completely)
> IOREQ stuff and is specific to the architecture. Instead, abstract
> accesses by the proposed macro.
>=20
> This is a follow up action to reduce layering violation in the common =
code.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>=20

Keeping the 'legacy' magic page code under an x86 ioreq.c would avoid =
the need for this patch.

  Paul

> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes V1 -> V2:
>    - new patch
> ---
>  xen/common/ioreq.c               | 4 ++--
>  xen/include/asm-x86/hvm/domain.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 7f91bc2..a07f1d7 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -223,7 +223,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct =
ioreq_server *s)
>      for ( i =3D HVM_PARAM_IOREQ_PFN; i <=3D HVM_PARAM_BUFIOREQ_PFN; =
i++ )
>      {
>          if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
> -            return _gfn(d->arch.hvm.params[i]);
> +            return _gfn(ioreq_params(d, i));
>      }
>=20
>      return INVALID_GFN;
> @@ -255,7 +255,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct =
ioreq_server *s,
>=20
>      for ( i =3D HVM_PARAM_IOREQ_PFN; i <=3D HVM_PARAM_BUFIOREQ_PFN; =
i++ )
>      {
> -        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
> +        if ( gfn_eq(gfn, _gfn(ioreq_params(d, i))) )
>               break;
>      }
>      if ( i > HVM_PARAM_BUFIOREQ_PFN )
> diff --git a/xen/include/asm-x86/hvm/domain.h =
b/xen/include/asm-x86/hvm/domain.h
> index 5d60737..c3af339 100644
> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -63,6 +63,8 @@ struct hvm_pi_ops {
>      void (*vcpu_block)(struct vcpu *);
>  };
>=20
> +#define ioreq_params(d, i) ((d)->arch.hvm.params[i])
> +
>  struct hvm_domain {
>      /* Cached CF8 for guest PCI config cycles */
>      uint32_t                pci_cf8;
> --
> 2.7.4



