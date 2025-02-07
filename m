Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D2A2D058
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884085.1293891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWcZ-00088i-Q8; Fri, 07 Feb 2025 22:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884085.1293891; Fri, 07 Feb 2025 22:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWcZ-00086Q-NQ; Fri, 07 Feb 2025 22:14:47 +0000
Received: by outflank-mailman (input) for mailman id 884085;
 Fri, 07 Feb 2025 22:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vKp5=U6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tgWcY-00086K-1u
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:14:46 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef0d3f2b-e5a0-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 23:14:44 +0100 (CET)
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
X-Inumbo-ID: ef0d3f2b-e5a0-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738966482; x=1739225682;
	bh=mPnMnK3N/VD/jZe495R4EYVPLNsPUhImqQFwr/EPBlo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MxRx0/wbZddb1nb3sJMSgbIZ8vG+2leMXROMNvj7mv6Kk3tXZbaegYvpAHiwbRJBk
	 ruqjkksUqjgB+t6NfSxcQUaFpqEGj9DYuO6n60qLVwGjdXVxwHJ2wfckPiwBMiZA7n
	 r98KQizqHwxTuw/aii7XTz2BPu3GtH5YRu/A4cjjcM0OAA7E70HdXMGbP+PgTkU2Ij
	 tVtOixwipWXQQPuv+4y92V6Zvs7USyzkCJ8VVv6+DvGAvdH3s8eRChy6v7TyS6gQaa
	 I3nX7EA8p5iyqqtZNLBaixJe9PVAc/cpA7IL1amxjIoy68DZEt82Hvn9ywO2Tj//25
	 uSVu/4InRNk7Q==
Date: Fri, 07 Feb 2025 22:14:39 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 20/24] x86/hvm: add HVM-specific Kconfig
Message-ID: <taLADuH7m0G0EB1Hw6kwJvTmj3OX5Z67aUDAt3RG5KZNifCcqDHLJhUhX8D_eMN87Xwz9jAAtN2fWJUuOMlYZa_vn7u5r5-yUh_TDTd5FZc=@proton.me>
In-Reply-To: <f28c0573-8ded-431d-a6ba-b814755b3380@suse.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-20-c5d36b31d66c@ford.com> <f28c0573-8ded-431d-a6ba-b814755b3380@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7bf93998bf81b205bdbedbd641e86f2894304d7d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, January 30th, 2025 at 5:12 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>=20
>=20
> On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > Add separate menu for configuring HVM build-time settings to help organ=
izing
> > HVM-specific options.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> Largely: Why not. Question is whether what is being moved now may
> eventually require moving back, if support was extended to PV (MEM_PAGING
> and MEM_SHARING). That doesn't look very likely though.

Thank you.

I moved the patch to a separate thread:
  https://lore.kernel.org/xen-devel/20250207220302.4190210-1-dmukhin@ford.c=
om/

>=20
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -30,7 +30,6 @@ config X86
> > select HAS_SCHED_GRANULARITY
> > select HAS_UBSAN
> > select HAS_VMAP
> > - select HAS_VPCI if HVM
> > select NEEDS_LIBELF
>=20
>=20
> I don't mind the movement of this line, but I'd like to point out that it
> may be beneficial to have all selects of HAS_* in a central place. Views
> of other maintainers (or of course anyone else) appreciated.
>=20
> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -0,0 +1,74 @@
> > +menuconfig HVM
> > + bool "HVM support"
> > + depends on !PV_SHIM_EXCLUSIVE
> > + default !PV_SHIM
> > + select COMPAT
> > + select IOREQ_SERVER
> > + select MEM_ACCESS_ALWAYS_ON
> > + select HAS_VPCI
>=20
>=20
> We strive to have such lists of selects sorted alphabetically, preventing
> everyone to add to the end of the list (in turn reducing the risk of
> patches conflicting).
>=20
> Jan

