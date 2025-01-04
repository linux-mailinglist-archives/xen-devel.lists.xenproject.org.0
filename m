Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B65A0120A
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865089.1276372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTubt-0007xy-IL; Sat, 04 Jan 2025 03:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865089.1276372; Sat, 04 Jan 2025 03:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTubt-0007wY-Ew; Sat, 04 Jan 2025 03:13:57 +0000
Received: by outflank-mailman (input) for mailman id 865089;
 Sat, 04 Jan 2025 03:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTubr-0007hm-LX
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:13:55 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edb86ef0-ca49-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:13:54 +0100 (CET)
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
X-Inumbo-ID: edb86ef0-ca49-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960433; x=1736219633;
	bh=z2slTAQFzwI3MM+uvLyfM4Vn8np/AtB0nRN7UsNFGOo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Il2tFOYIBj4m+LWwgBi7ApKM9DrBjAITOUQK4kdvdzuPL5mkAt/aK5G2DpSB1O/vx
	 Gv6/Lqpp9HvYhTAneFwGuWF8fMBij8TUKz6EYq4swAbadXdYKYCWjW5B3mXqCqafWs
	 RC42oTs0ktzSednXSupAAgMTNgOifXJ/19r+85yl0KwfvPjZdfnd4s4yMmkwoOKFgN
	 gz1JcgvcAcjp477JRC7W/rsvEwozKCACBg8vOljhBUvpZLqM7uHxm2ICrlzVphej8D
	 W7BBm6Qc3W9PLdZePfOILy2Rw86k/XG0POnjwInGvnQJc+MciJKO7R1NDMkxyh3Ivp
	 rs6Cz1jCl1Ngg==
Date: Sat, 04 Jan 2025 03:13:51 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 13/35] xen/console: rename console_input_domain
Message-ID: <FSdDLvEuYjM9G8HzVbm6G-r6N8J2RSPq455KkZRRnsbYdTG7NvirNs8ya79yKaDQ0g5hyBMxQqsnkGl0JxrWUY3ditIW9R_lNQXwE5Hc4pk=@proton.me>
In-Reply-To: <Z1nJNqfqAgYd0pJ7@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com> <Z1nJNqfqAgYd0pJ7@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9b62e47d2776b2a1c939c3392fb41aec756f9189
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, December 11th, 2024 at 9:17 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:43PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > console_input_domain() takes an RCU lock to protect domain structure.
> > That implies call to rcu_unlock_domain() after use.
> >
> > Rename console_input_domain() to rcu_lock_domain_console_owner() to
> > highlight the need of calling rcu_unlock_domain().
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/arm/vpl011.c | 2 +-
> > xen/drivers/char/console.c | 2 +-
> > xen/include/xen/console.h | 2 +-
> > 3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index fe36fe2bd1529a4114884580ded6d6fa55a22f0e..4d682e98553303b4a12f5cd=
7e5e67ab096cd7cc2 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -78,7 +78,7 @@ static void vpl011_write_data_xen(struct domain *d, u=
int8_t data)
> > unsigned long flags;
> > struct vpl011 *vpl011 =3D &d->arch.vpl011;
> > struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
> > - struct domain *input =3D console_input_domain();
> > + struct domain *input =3D rcu_lock_domain_console_owner();
>
>
> May I suggest console_get_domain() and then introducing a
> console_put_domain() which is just a wrapper around
> rcu_unlock_domain()?

Agreed, that looks even better! Thanks.

Fixed.

>
> Thanks, Roger.



