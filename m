Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB22C0F4D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34746.65956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEAc-0002RZ-8i; Mon, 23 Nov 2020 15:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34746.65956; Mon, 23 Nov 2020 15:54:26 +0000
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
	id 1khEAc-0002RA-5Q; Mon, 23 Nov 2020 15:54:26 +0000
Received: by outflank-mailman (input) for mailman id 34746;
 Mon, 23 Nov 2020 15:54:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hMa=E5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1khEAa-0002R5-Pa
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:54:24 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6e539e6-f9fd-4a3e-b479-5c067959b420;
 Mon, 23 Nov 2020 15:54:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p8so19090620wrx.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 07:54:23 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v64sm17806354wme.25.2020.11.23.07.54.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 07:54:22 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1hMa=E5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1khEAa-0002R5-Pa
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:54:24 +0000
X-Inumbo-ID: d6e539e6-f9fd-4a3e-b479-5c067959b420
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6e539e6-f9fd-4a3e-b479-5c067959b420;
	Mon, 23 Nov 2020 15:54:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p8so19090620wrx.5
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 07:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=dtLp3z3OszpC4Cvul1IHj72ypy0NqjbhBISXM5maT7k=;
        b=P+5izuE0fIgR9dOhxFtO1vk2J6BriMf8+U0AaC01Itb5Q9wi61roe6kaiW0I5M6NQS
         NLxFunhsMF/CJuu4VWt/ORHI0RJ5VPdb8/PQg7avMuoPgh/3MOYPDg/6C5A/9KxDDFyj
         1WXCTujOz2xod9/c3sM7ENBsqBoe+mR0aj72Fdf6l1JVBE/VLjhebhxCXqXdZ6LhGl0n
         3cu/Wo/UxfnoaiC4PuZ+1JWwJ8ID9sZnuC00mov6wJfy76V33Y224MfElj13/62QZLFW
         bR9cIGIDOly7IgGdE2V1ikKgPt7Dw+KQK+aqrXs8lC0OX2YD7eyp7+zEOODfCAadAJ0P
         RH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=dtLp3z3OszpC4Cvul1IHj72ypy0NqjbhBISXM5maT7k=;
        b=RUN5Q4zRckV3l455CvocJ5L9uz1rwpxawr+bLLLSMxzFwdmjF9Q10Z3yZmd0bIdKp/
         zLmdw1VCRVy87CXRfBCG+WKBJ+8voVV1iZ6lYR1FzWojRJt2EO3U5K4X2Kf1iI4iazgZ
         KhBCO+z/YCGqFXX6cyZjokfSqAm8jJcDbEarZt6faSVK5SnEO7GmzpX+SKKRzdA90hjY
         hXb9Zg+KB9iZQKG8KMkbiLFAhJKyhi+fpZ+s7yiE58AEuVyW6rgYDoT1pDiGvOMYBerk
         gLGChZ0aLMlRfuXzMwC6adTS9CYW1oth4S7L2tkgoSG5n8JXyrHGswlsohQxa5LBcwzT
         rcBA==
X-Gm-Message-State: AOAM532kdMynBCZWSN9rroWoR1w9/iBo6ur1ZgRtH/0e7KwoTx2qfDkt
	MKpVnx2Q4u2fqZpcO8q7F+o=
X-Google-Smtp-Source: ABdhPJyPp8dyWgfITSgE+EOR/rQ5F3MH+VXMWaCyOolFYEJbX0ezODzgJe6FxrVtYfjzZ0mFOWRqrA==
X-Received: by 2002:adf:e544:: with SMTP id z4mr297428wrm.83.1606146862784;
        Mon, 23 Nov 2020 07:54:22 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
        by smtp.gmail.com with ESMTPSA id v64sm17806354wme.25.2020.11.23.07.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 07:54:22 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-13-git-send-email-olekstysh@gmail.com> <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com> <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com> <04a81b7e-213a-968b-048c-dfa68b6e3b0d@gmail.com> <96e6622c-08b3-ff85-75f1-14c8b7cd6d6e@suse.com> <30c01448-d4f2-803e-1569-5e806f830efc@gmail.com>
In-Reply-To: <30c01448-d4f2-803e-1569-5e806f830efc@gmail.com>
Subject: RE: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved function names
Date: Mon, 23 Nov 2020 15:54:20 -0000
Message-ID: <002101d6c1b0$e906a520$bb13ef60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAHGHN6+A53Zm3YCEAEcxwGeQu0fAlZCbOYBa5sxg6pHcMug

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 23 November 2020 15:48
> To: Jan Beulich <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; =
George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien =
Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian
> <kevin.tian@intel.com>; Julien Grall <julien.grall@arm.com>; =
xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from =
involved function names
>=20
>=20
> On 23.11.20 16:56, Jan Beulich wrote:
>=20
> Hi Jan, Paul
>=20
> > On 23.11.2020 15:39, Oleksandr wrote:
> >> As it was agreed, below the list of proposed renaming (naming) =
within
> >> current series.
> > Thanks for compiling this. A couple of suggestions for =
consideration:
> >
> >> 1. Global (existing):
> >> hvm_map_mem_type_to_ioreq_server     -> ioreq_server_map_mem_type
> >> hvm_select_ioreq_server              -> ioreq_server_select
> >> hvm_send_ioreq                       -> ioreq_send
> >> hvm_ioreq_init                       -> ioreq_init
> > ioreq_domain_init() (or, imo less desirable domain_ioreq_init())?
> On Arm (for example) I see two variants are present:
> 1. That starts with subsystem:
> - tee_domain_init
> - iommu_domain_init
>=20
>=20
> 2. Where sybsystem in the middle:
> - domain_io_init
> - domain_vuart_init
> - domain_vtimer_init
>=20
> If there is no rule, but a matter of taste then I would use
> ioreq_domain_init(),
> so arch_ioreq_init() wants to be arch_ioreq_domain_init().
>=20
> >
> >> hvm_destroy_all_ioreq_servers        -> ioreq_server_destroy_all
> >> hvm_all_ioreq_servers_add_vcpu       -> ioreq_server_add_vcpu_all
> >> hvm_all_ioreq_servers_remove_vcpu    -> =
ioreq_server_remove_vcpu_all
> >> hvm_broadcast_ioreq                  -> ioreq_broadcast
> >> hvm_create_ioreq_server              -> ioreq_server_create
> >> hvm_get_ioreq_server_info            -> ioreq_server_get_info
> >> hvm_map_io_range_to_ioreq_server     -> ioreq_server_map_io_range
> >> hvm_unmap_io_range_from_ioreq_server -> ioreq_server_unmap_io_range
> >> hvm_set_ioreq_server_state           -> ioreq_server_set_state
> >> hvm_destroy_ioreq_server             -> ioreq_server_destroy
> >> hvm_get_ioreq_server_frame           -> ioreq_server_get_frame
> >> hvm_ioreq_needs_completion           -> ioreq_needs_completion
> >> hvm_mmio_first_byte                  -> ioreq_mmio_first_byte
> >> hvm_mmio_last_byte                   -> ioreq_mmio_last_byte
> >> send_invalidate_req                  -> =
ioreq_signal_mapcache_invalidate
> >>
> >> handle_hvm_io_completion             -> handle_io_completion
> > For this one I'm not sure what to suggest, but I'm not overly happy
> > with the name.
>=20
> I also failed to find a better name. Probably ioreq_ or vcpu_ioreq_
> prefix wants to be added here?
>=20
>=20
> >
> >> hvm_io_pending                       -> io_pending
> > vcpu_ioreq_pending() or vcpu_any_ioreq_pending()?
>=20
> I am fine with vcpu_ioreq_pending()
>=20

...in which case vcpu_ioreq_handle_completion() seems like a reasonable =
choice.

>=20
> >
> >> 2. Global (new):
> >> arch_io_completion
> >> arch_ioreq_server_map_pages
> >> arch_ioreq_server_unmap_pages
> >> arch_ioreq_server_enable
> >> arch_ioreq_server_disable
> >> arch_ioreq_server_destroy
> >> arch_ioreq_server_map_mem_type
> >> arch_ioreq_server_destroy_all
> >> arch_ioreq_server_get_type_addr
> >> arch_ioreq_init
> > Assuming this is the arch hook of the similarly named function
> > further up, a similar adjustment may then be wanted here.
>=20
> Yes.
>=20
>=20
> >
> >> domain_has_ioreq_server
> >>
> >>
> >> 3. Local (existing) in common ioreq.c:
> >> hvm_alloc_ioreq_mfn               -> ioreq_alloc_mfn
> >> hvm_free_ioreq_mfn                -> ioreq_free_mfn
> > These two are server functions, so should imo be ioreq_server_...().
>=20
> ok, but ...
>=20
>=20
> > However, if they're static (as they're now), no distinguishing
> > prefix is strictly necessary, i.e. alloc_mfn() and free_mfn() may
> > be fine. The two names may be too short for Paul's taste, though.
> > Some similar shortening may be possible for some or all of the ones
>=20
>=20
> ... In general I would be fine with any option. However, using the
> shortening rule for all
> we are going to end up with single-word function names (enable, init, =
etc).
> So I would prefer to leave locals as is (but dropping hvm prefixes of
> course and
> clarify ioreq_server_alloc_mfn/ioreq_server_free_mfn).
>=20
> Paul, Jan what do you think?

I prefer ioreq_server_alloc_mfn/ioreq_server_free_mfn. The problem with =
shortening is that function names become ambiguous within the source =
base and hence harder to find.

  Paul


