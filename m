Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D69372EDC
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122625.231287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldymL-0003CH-Am; Tue, 04 May 2021 17:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122625.231287; Tue, 04 May 2021 17:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldymL-0003Bs-7a; Tue, 04 May 2021 17:24:13 +0000
Received: by outflank-mailman (input) for mailman id 122625;
 Tue, 04 May 2021 17:24:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldymI-0003Bm-Q2
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:24:10 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c232f10-9ce1-438e-b501-a314e73fb1fc;
 Tue, 04 May 2021 17:24:09 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id w4so3462748ljw.9
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:24:09 -0700 (PDT)
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
X-Inumbo-ID: 3c232f10-9ce1-438e-b501-a314e73fb1fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=QWuHKK8AqgvxefPI9dlc0z3SCAD3/cmGO76guAI1cS0=;
        b=NW7geWlHB2h9N62ZfGXz8K6d1WbrcPQ4Ttz+cDEqBZe9Wgw5/8aJhPJS3lfnYrME60
         Ij36Z7LZMtLHOU9xmtIgkWhTQVME+mr9MftouCBbXOz2ExRppFRY5UdwYKpgMn+1bDdn
         Q3rNCWiK3qU4DidIOCM7gBP4jJ9uZ9zefIOy1mgxRgfAFtbvudvivjN6tWgWrZM4A1OU
         ZRDpZ4EA8LfMTkFWISDmQdVkMEKHQz9t/msJF8Ht6CsIcsGgMpbxs17/86ktiyo+rTlJ
         ZeTrx/lJ0I09aoLHaYS8s21+GacoUa4dOFYpLQ3ga5WoR8ssXCfdUQC6kMAcpT7APt+2
         0VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QWuHKK8AqgvxefPI9dlc0z3SCAD3/cmGO76guAI1cS0=;
        b=J5oAUtL5FWqHFuZxh2/aCVscB8tZJCAlDzdYei8GSn7b15pCPn8oigMjLQeCqYJbwU
         XPkISuoO1lnPBAYZQlakp3UJfI20C02/oGNclDHt0s8FEf7yv8pFERH9RLXHgUnsiKTV
         bb4FML4n7niUGreRHKTQaqnatiU86rUYAuitsDcztr10YCSrsW+W3dK6kxMQOEZVP39T
         JE4BxpvZfry+DGxGk3cEX20Ui34RKcpEEJoODyl9TCrcnQdWzEat1GuH0HlH7AcQRL3N
         +tc/Hko2ajEa4NkKOqU8jC5DIKaXFX+3w3kQ6v8YniIgXLRR/+2+uwi81NM1Qnxg4N+g
         4fMA==
X-Gm-Message-State: AOAM532MyTBxjb1IWzu2qItdewFZrAyuk09gPHRDHPm4RveYF2d1cK7N
	DHJqjfj0JwenE2z0qKPaZi8G2QG/nipRETa6vyc=
X-Google-Smtp-Source: ABdhPJy1+xM7x8wugzqEkYm4App3lQE0uFAWbFaBKI5MJ+CF2iyLIHcwg0/ibDhi5mKX5jzl85bDbka16YV1DKlYBSM=
X-Received: by 2002:a05:651c:14c:: with SMTP id c12mr18470942ljd.437.1620149048503;
 Tue, 04 May 2021 10:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124842.220445-1-jandryuk@gmail.com> <20210504124842.220445-10-jandryuk@gmail.com>
 <20210504133332.pt56xjrxvbnz2htd@begin>
In-Reply-To: <20210504133332.pt56xjrxvbnz2htd@begin>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 4 May 2021 13:23:57 -0400
Message-ID: <CAKf6xpuS_FoWpkBxMEudJsOwfKG96f8_Vd8p6tcU5C1f01PT6Q@mail.gmail.com>
Subject: Re: [PATCH 9/9] vtpmmgr: Support GetRandom passthrough on TPM 2.0
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Jason Andryuk <jandryuk@gmail.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	Quan Xu <quan.xu0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 4, 2021 at 9:33 AM Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> Jason Andryuk, le mar. 04 mai 2021 08:48:42 -0400, a ecrit:
> > GetRandom passthrough currently fails when using vtpmmgr with a hardware
> > TPM 2.0.
> > vtpmmgr (8): INFO[VTPM]: Passthrough: TPM_GetRandom
> > vtpm (12): vtpm_cmd.c:120: Error: TPM_GetRandom() failed with error code (30)
> >
> > When running on TPM 2.0 hardware, vtpmmgr needs to convert the TPM 1.2
> > TPM_ORD_GetRandom into a TPM2 TPM_CC_GetRandom command.  Besides the
> > differing ordinal, the TPM 1.2 uses 32bit sizes for the request and
> > response (vs. 16bit for TPM2).
> >
> > Place the random output directly into the tpmcmd->resp and build the
> > packet around it.  This avoids bouncing through an extra buffer, but the
> > header has to be written after grabbing the random bytes so we have the
> > number of bytes to include in the size.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  stubdom/vtpmmgr/marshal.h          | 10 +++++++
> >  stubdom/vtpmmgr/vtpm_cmd_handler.c | 48 ++++++++++++++++++++++++++++++
> >  2 files changed, 58 insertions(+)
> >
> > diff --git a/stubdom/vtpmmgr/marshal.h b/stubdom/vtpmmgr/marshal.h
> > index dce19c6439..20da22af09 100644
> > --- a/stubdom/vtpmmgr/marshal.h
> > +++ b/stubdom/vtpmmgr/marshal.h
> > @@ -890,6 +890,15 @@ inline int sizeof_TPM_AUTH_SESSION(const TPM_AUTH_SESSION* auth) {
> >       return rv;
> >  }
> >
> > +static
> > +inline int sizeof_TPM_RQU_HEADER(BYTE* ptr) {
> > +     int rv = 0;
> > +     rv += sizeof_UINT16(ptr);
> > +     rv += sizeof_UINT32(ptr);
> > +     rv += sizeof_UINT32(ptr);
> > +     return rv;
> > +}
> > +
> >  static
> >  inline BYTE* pack_TPM_RQU_HEADER(BYTE* ptr,
> >               TPM_TAG tag,
> > @@ -923,5 +932,6 @@ inline int unpack3_TPM_RQU_HEADER(BYTE* ptr, UINT32* pos, UINT32 max,
> >  #define pack_TPM_RSP_HEADER(p, t, s, r) pack_TPM_RQU_HEADER(p, t, s, r)
> >  #define unpack_TPM_RSP_HEADER(p, t, s, r) unpack_TPM_RQU_HEADER(p, t, s, r)
> >  #define unpack3_TPM_RSP_HEADER(p, l, m, t, s, r) unpack3_TPM_RQU_HEADER(p, l, m, t, s, r)
> > +#define sizeof_TPM_RSP_HEADER(p) sizeof_TPM_RQU_HEADER(p)
> >
> >  #endif
> > diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> > index 2ac14fae77..7ca1d9df94 100644
> > --- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
> > +++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> > @@ -47,6 +47,7 @@
> >  #include "vtpm_disk.h"
> >  #include "vtpmmgr.h"
> >  #include "tpm.h"
> > +#include "tpm2.h"
> >  #include "tpmrsa.h"
> >  #include "tcg.h"
> >  #include "mgmt_authority.h"
> > @@ -772,6 +773,52 @@ static int vtpmmgr_permcheck(struct tpm_opaque *opq)
> >       return 1;
> >  }
> >
> > +TPM_RESULT vtpmmgr_handle_getrandom(struct tpm_opaque *opaque,
> > +                                 tpmcmd_t* tpmcmd)
> > +{
> > +     TPM_RESULT status = TPM_SUCCESS;
> > +     TPM_TAG tag;
> > +     UINT32 size;
> > +     UINT32 rand_offset;
> > +     UINT32 rand_size;
> > +     TPM_COMMAND_CODE ord;
> > +     BYTE *p;
> > +
> > +     p = unpack_TPM_RQU_HEADER(tpmcmd->req, &tag, &size, &ord);
> > +
> > +     if (!hw_is_tpm2()) {
> > +             size = TCPA_MAX_BUFFER_LENGTH;
> > +             TPMTRYRETURN(TPM_TransmitData(tpmcmd->req, tpmcmd->req_len,
> > +                                           tpmcmd->resp, &size));
> > +             tpmcmd->resp_len = size;
> > +
> > +             return TPM_SUCCESS;
> > +     }
>
>
> We need to check for the size of the request before unpacking (which
> doesn't check for it), don't we?

Yes, good catch.  vtpmmgr_handle_cmd doesn't check either.

> > +     /* TPM_GetRandom req: <header><uint32 num bytes> */
> > +     unpack_UINT32(p, &rand_size);
> > +
> > +     /* Call TPM2_GetRandom but return a TPM_GetRandom response. */
> > +     /* TPM_GetRandom resp: <header><uint32 num bytes><num random bytes> */
> > +        rand_offset = sizeof_TPM_RSP_HEADER(tpmcmd->resp) +
> > +                   sizeof_UINT32(tpmcmd->resp);
>
> There is a spurious indentation here, at first sight I even thought it
> was part of the comment.

Sorry about that - it was 8 spaces instead of a tab.

> We also need to check that rand_size is not too large?
> - that the returned data won't overflow tpmcmd->resp + rand_offset
> - that it fits in a UINT16

Yes, will do.

> Also, TPM2_GetRandom casts bytesRequested into UINT16*, that's bogus, it
> should use a local UINT16 variable and assign *bytesRequested.

Good catch.  I'll do that in a new patch.

> > +     TPMTRYRETURN(TPM2_GetRandom(&rand_size, tpmcmd->resp + rand_offset));
> > +
> > +     p = pack_TPM_RSP_HEADER(tpmcmd->resp, TPM_TAG_RSP_COMMAND,
> > +                             rand_offset + rand_size, status);
> > +     p = pack_UINT32(p, rand_size);
> > +     tpmcmd->resp_len = rand_offset + rand_size;
> > +
> > +     return status;
> > +
> > +abort_egress:
> > +     tpmcmd->resp_len = VTPM_COMMAND_HEADER_SIZE;
> > +     pack_TPM_RSP_HEADER(tpmcmd->resp, tag + 3, tpmcmd->resp_len, status);
> > +
> > +     return status;
> > +}
> > +
> >  TPM_RESULT vtpmmgr_handle_cmd(
> >               struct tpm_opaque *opaque,
> >               tpmcmd_t* tpmcmd)
> > @@ -842,6 +889,7 @@ TPM_RESULT vtpmmgr_handle_cmd(
> >               switch(ord) {
> >               case TPM_ORD_GetRandom:
> >                       vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_GetRandom\n");
> > +                     return vtpmmgr_handle_getrandom(opaque, tpmcmd);
> >                       break;
>
> Drop the break, then. I would say also move (or drop) the log, like the
> other cases.

Will drop the break.  I would just leave the log since it matches the
other cases in this case statement.  But I can remove it if you want.

Regards,
Jason

