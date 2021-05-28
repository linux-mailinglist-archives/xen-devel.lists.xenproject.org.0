Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB43944EB
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 17:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133999.249545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmeFf-0001dL-U1; Fri, 28 May 2021 15:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133999.249545; Fri, 28 May 2021 15:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmeFf-0001aa-Qj; Fri, 28 May 2021 15:18:19 +0000
Received: by outflank-mailman (input) for mailman id 133999;
 Fri, 28 May 2021 15:18:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+lD=KX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lmeFe-0001aU-Ht
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 15:18:18 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c27dea2c-51ef-4644-ba42-18836297bab1;
 Fri, 28 May 2021 15:18:17 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E03C41FD2F;
 Fri, 28 May 2021 15:18:16 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 072E811906;
 Fri, 28 May 2021 15:18:15 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id jNhaObcJsWC+DAAALh3uQQ
 (envelope-from <dfaggioli@suse.com>); Fri, 28 May 2021 15:18:15 +0000
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
X-Inumbo-ID: c27dea2c-51ef-4644-ba42-18836297bab1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622215096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=we9YjhvjOoTuBvT2KSjS85nvFYPt8UnNItAKK7Irsmk=;
	b=WmDX6XUFF7mbuEykS+nioj3EfAsKpP+J+BPtSdRqI1fb02Uv5I0Pxf3BYdpP8JjL0VdtO/
	NLBUyuatiLwfH8BMevN4RaG1VBv3yv8hhrdt4Lr8y5lqCUQaf5Qf/wbHmezmSube4OIf8J
	wXB5JW9vDElnjCZTYK9Mf9m8O6qSyCY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622215096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=we9YjhvjOoTuBvT2KSjS85nvFYPt8UnNItAKK7Irsmk=;
	b=WmDX6XUFF7mbuEykS+nioj3EfAsKpP+J+BPtSdRqI1fb02Uv5I0Pxf3BYdpP8JjL0VdtO/
	NLBUyuatiLwfH8BMevN4RaG1VBv3yv8hhrdt4Lr8y5lqCUQaf5Qf/wbHmezmSube4OIf8J
	wXB5JW9vDElnjCZTYK9Mf9m8O6qSyCY=
Message-ID: <ab4e6ff41a08a874bba805873c94e0d8fa1d0986.camel@suse.com>
Subject: Re: Ping: [Bugfix PATCH for-4.15] xen: credit2: fix per-entity load
 tracking when continuing running
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org
Date: Fri, 28 May 2021 17:18:15 +0200
In-Reply-To: <a3f31cde-f1e5-e643-28bc-cdb2b36f372d@suse.com>
References: <161615605709.5036.4052641880659992679.stgit@Wayrath>
	 <a3f31cde-f1e5-e643-28bc-cdb2b36f372d@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+F0ocCRSGkHJGFd8OTX0"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.10
X-Spamd-Result: default: False [-2.10 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 SIGNED_PGP(-2.00)[];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO


--=-+F0ocCRSGkHJGFd8OTX0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-04-27 at 10:35 +0200, Jan Beulich wrote:
> On 19.03.2021 13:14, Dario Faggioli wrote:
> >=20
> > ---
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Ian Jackson <iwj@xenproject.org>
> > ---
> > Despite the limited effect, it's a bug. So:
> > - it should be backported;
> > - I think it should be included in 4.15. The risk is pretty low,
> > for
> > =C2=A0 the same reasons already explained when describing its limited
> > impact.
>=20
> I'm a little puzzled to find this is still in my waiting-to-go-in
> folder, for not having had an ack (or otherwise). George?
>=20
Yeah, and it probably still is, so... George? :-D

BTW, I'm dropping IanJ as, quite obviously,this won't go in 4.15. :-P
It should however (after it goes in) be backported (to 4.15 and
probably even earlier... I can have a look myself if it helps).

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-+F0ocCRSGkHJGFd8OTX0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCxCbcACgkQFkJ4iaW4
c+4ipA/+IEaOlOIl/41XnhBGn5YKD0iwoEZR/XNjs9wz1IUrd49+S3aOkH5kcTLE
joI+E4TvAsRp+QBNAdRl2AKOCbv1B+mYqLzPJARzx0/pYX5+0tt1SMvvWh88kJ24
1S8iEl5i2+KS6htytaFvs1BGXzQn5X3B8HBh8EpKwy6+Bh8gU6husf40pgpGIOMC
8tesaRP0GDITz88rwb807Axfelt8Pca0QKWe6z4XXdsqimCJd1IgGzsKGQKdzlFa
bxaNU9A4FAcRUmXSAcd+Mv+OPNoQU13rtqpiIkxMgEVDSBr2xuLjR7jUIZ3Ci65x
V3cCqAonNkOvLMlbN9YNtXPXfUFkHQkFDzYholcwhzMDOPNh/G/b6dtPo7ZM0LoY
d8Twr2UGClY6tDpOPfFTLy/5TaakorRO7uaG8FE/UYBbYdXF5xH1GOklvdYRfLe0
+w2AOT9/lw6luA3+0IWi9EgFMwGvKoUKpUWW/ftQTwtYCKV1S3tYVmMpN/c4YVWA
9QljNDEGNv9jswTiFA++Hdp+4QcmWcB3SF7aa0kk+ClmFdik5Y+Q+ChUVfnYAp5L
4Iw4BJbKfb/mB9KAsUYk3EU/xT/dp+qJDH4G2ziJ+4YIM/18cnZ+QMNoJFsuYxHa
BZSvcsfD4Vi+7l8gOYu7wK527NDmR3fe8bMh5jZgBnCGhpsGSdE=
=JRaH
-----END PGP SIGNATURE-----

--=-+F0ocCRSGkHJGFd8OTX0--


