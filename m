Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C67293647
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 09:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8948.24101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUmWF-0006U6-P2; Tue, 20 Oct 2020 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8948.24101; Tue, 20 Oct 2020 07:57:19 +0000
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
	id 1kUmWF-0006Tl-Lm; Tue, 20 Oct 2020 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 8948;
 Tue, 20 Oct 2020 07:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUmWD-0006Tg-Sr
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 07:57:17 +0000
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62c0b558-ab37-44d1-840e-2cd45a042cad;
 Tue, 20 Oct 2020 07:57:16 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id ce10so1292522ejc.5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 00:57:16 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id k9sm1496515ejv.113.2020.10.20.00.57.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 00:57:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUmWD-0006Tg-Sr
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 07:57:17 +0000
X-Inumbo-ID: 62c0b558-ab37-44d1-840e-2cd45a042cad
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 62c0b558-ab37-44d1-840e-2cd45a042cad;
	Tue, 20 Oct 2020 07:57:16 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id ce10so1292522ejc.5
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=0bOY2HFRrUjp3hY8B5bQp5UE09BO7L9vwPLsux92Lcs=;
        b=oCKQfpOC3QFae54cnhhAROBIBdjbdAJX3XF0l9nmHUxJS/FWwXP2ZHISANWLenjdRb
         aVnYN2aWy6R+6qgAUe50cB8a1kD+/EOdFEGybeTQBnhqUAf+TmHH3pRdS7LTy+6IKTx9
         4lpv8320DyOI84OGTuEIKr/eeFbFft9zf2Sxal+W4LKnbOHW/8704R4sV3sQqh6ot8aW
         0WJLGJDU1b7TFCQ0ubjLxQ2BmYDovqFvnj5fB662/g34gWMS7a28hiGpEu1D7SeeSltd
         P1iQy/bb20nCaT9S9+FS7WbwO95Isf4CsnUIsRpiZ33/RQzmiuw22gnpka+zX9GK9lDQ
         c1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=0bOY2HFRrUjp3hY8B5bQp5UE09BO7L9vwPLsux92Lcs=;
        b=gaRUsZnkBYVVKqd7V253tHRSV85TT1r5l3Dv/9CmyUPwEP4WB+/Aqa9GiyUIsnPaib
         0hsTImDQ4aP9EPswm6HMAydRerS7uc2WDfoe4z6yFAJPB174tQvFSaX37jsWtN8nNp63
         70QdZ9pqJY0MVJw7oEneO0mrBsXkBO+SOSFcVcaQ6lwyPxIyjt6LiFXXRHC3N84WotyX
         1OE1sROsnzWRGaoLefCTLchEgThmHg13fjd399JQqRQ9e80z6CbqdehkcecgiD5N/06u
         NkGszsFTv9E76x/Tk37Ax5khxXS1rzrOqOfZ2YzSKoJhhLgIkDf49ajjCzeouWcUwM4p
         77TQ==
X-Gm-Message-State: AOAM531gsBHpo0wMs4DV/XHvT8rtJNa9OebYXkfAAq3HI4HwbEti3Nhp
	OgOrEOix/r6y6+XL9ig0ey4=
X-Google-Smtp-Source: ABdhPJxi0FcaunaorqVm4yX8WQKGEbIFDU8QOU3lVZX5Ez5prpCm+A7EK0wp7CtYS76Ibg1Ap1Fm4g==
X-Received: by 2002:a17:906:28db:: with SMTP id p27mr1922657ejd.424.1603180635945;
        Tue, 20 Oct 2020 00:57:15 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id k9sm1496515ejv.113.2020.10.20.00.57.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 00:57:15 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
Date: Tue, 20 Oct 2020 08:57:13 +0100
Message-ID: <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAJRJ+K5qmWNg2A=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<iwj@xenproject.org>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Paul =
Durrant <paul@xen.org>; Tim Deegan
> <tim@xen.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves previously prepared x86/hvm/ioreq.c to the common code.
>=20
> The common IOREQ feature is supposed to be built with IOREQ_SERVER
> option enabled, which is selected for x86's config HVM for now.
>=20
> In order to avoid having a gigantic patch here, the subsequent
> patches will update remaining bits in the common code step by step:
> - Make IOREQ related structs/materials common
> - Drop the "hvm" prefixes and infixes

FWIW you could tackle the naming changes in patch #1.

> - Remove layering violation by moving corresponding fields
>   out of *arch.hvm* or abstracting away accesses to them
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> ***
> Please note, this patch depends on the following which is
> on review:
> https://patchwork.kernel.org/patch/11816689/
> ***
>=20
> Changes RFC -> V1:
>    - was split into three patches:
>      - x86/ioreq: Prepare IOREQ feature for making it common
>      - xen/ioreq: Make x86's IOREQ feature common
>      - xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>    - update MAINTAINERS file
>    - do not use a separate subdir for the IOREQ stuff, move it to:
>      - xen/common/ioreq.c
>      - xen/include/xen/ioreq.h
>    - update x86's files to include xen/ioreq.h
>    - remove unneeded headers in arch/x86/hvm/ioreq.c
>    - re-order the headers alphabetically in common/ioreq.c
>    - update common/ioreq.c according to the newly introduced arch =
functions:
>      arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()
>=20
> Changes V1 -> V2:
>    - update patch description
>    - make everything needed in the previous patch to achieve
>      a truly rename here
>    - don't include unnecessary headers from asm-x86/hvm/ioreq.h
>      and xen/ioreq.h
>    - use __XEN_IOREQ_H__ instead of __IOREQ_H__
>    - move get_ioreq_server() to common/ioreq.c
> ---
>  MAINTAINERS                     |    8 +-
>  xen/arch/x86/Kconfig            |    1 +
>  xen/arch/x86/hvm/Makefile       |    1 -
>  xen/arch/x86/hvm/ioreq.c        | 1422 =
---------------------------------------
>  xen/arch/x86/mm.c               |    2 +-
>  xen/arch/x86/mm/shadow/common.c |    2 +-
>  xen/common/Kconfig              |    3 +
>  xen/common/Makefile             |    1 +
>  xen/common/ioreq.c              | 1422 =
+++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/hvm/ioreq.h |   39 +-
>  xen/include/xen/ioreq.h         |   71 ++
>  11 files changed, 1509 insertions(+), 1463 deletions(-)
>  delete mode 100644 xen/arch/x86/hvm/ioreq.c
>  create mode 100644 xen/common/ioreq.c
>  create mode 100644 xen/include/xen/ioreq.h
>=20
[snip]
> +static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool =
buf)
> +
> +{
> +    struct domain *d =3D s->target;
> +    struct hvm_ioreq_page *iorp =3D buf ? &s->bufioreq : &s->ioreq;
> +
> +    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +        return;
> +
> +    if ( guest_physmap_remove_page(d, iorp->gfn,
> +                                   page_to_mfn(iorp->page), 0) )
> +        domain_crash(d);
> +    clear_page(iorp->va);
> +}
> +
> +static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
> +{
> +    struct domain *d =3D s->target;
> +    struct hvm_ioreq_page *iorp =3D buf ? &s->bufioreq : &s->ioreq;
> +    int rc;
> +
> +    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +        return 0;
> +
> +    clear_page(iorp->va);
> +
> +    rc =3D guest_physmap_add_page(d, iorp->gfn,
> +                                page_to_mfn(iorp->page), 0);
> +    if ( rc =3D=3D 0 )
> +        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
> +
> +    return rc;
> +}
> +

The 'legacy' mechanism of mapping magic pages for ioreq servers should =
remain x86 specific I think that aspect of the code needs to remain =
behind and not get moved into common code. You could do that in arch =
specific calls in hvm_ioreq_server_enable/disable() and =
hvm_get_ioreq_server_info().

  Paul


