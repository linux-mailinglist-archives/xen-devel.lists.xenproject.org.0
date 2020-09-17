Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789D26DEA6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:46:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvB0-0006HB-W8; Thu, 17 Sep 2020 14:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDaX=C2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kIvB0-0006H6-1y
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:46:22 +0000
X-Inumbo-ID: 042ad621-30d5-4c5a-bc8d-a2535f8b40c4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 042ad621-30d5-4c5a-bc8d-a2535f8b40c4;
 Thu, 17 Sep 2020 14:46:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600353980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tETeqKdo4XFdGQA59p10Jg4w0pLuDzCdjZpUPCiZ59s=;
 b=GbEYfYOAojJ2RHrbQwVoy0wf0PA90EETW3sRjwX6WEK+YtS7PY178oP6dWEkcRxq2bAOUx
 YKYPvFaRk108R38YbKTPPKsLP2/EKXpsZah/aG+uq0d9CJm866LRg3q1YK/OT58j4mzfqP
 EjZ80t/9NJG3HYlPM8SstNYIQKaa4/A9cEyJqTtn3YSLATYlEh8aVMG/Gna3hO1ZM8y8y9
 m+cihiqGpqWEMxjQtxCIyHZMf3d2pqVfkbBns2OKgz4WYwfWI9WnF3jXiPd+h+M21nQeNI
 Z1FTp+AEV8BV2woaL70PaTVVhClxRuuLm7JeavHz1CvVRkh4KAaIyXG/wRZPgg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A721BAC24;
 Thu, 17 Sep 2020 14:46:53 +0000 (UTC)
Message-ID: <082ef86ec2ecad5f2b76bf4a055123346d6b85cc.camel@suse.com>
Subject: Re: [PATCH 2/5] sched/arinc653: Rename scheduler private structs
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jeff Kubascik
 <jeff.kubascik@dornerworks.com>, xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead
 <josh.whitehead@dornerworks.com>,  Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>
Date: Thu, 17 Sep 2020 16:46:18 +0200
In-Reply-To: <fc0b043d-1fe5-8281-fc18-1e1ba26cb127@citrix.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-3-jeff.kubascik@dornerworks.com>
 <fc0b043d-1fe5-8281-fc18-1e1ba26cb127@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-K4FRftF3hsLLxiv1wEQ0"
User-Agent: Evolution 3.36.5 (by Flathub.org) 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-K4FRftF3hsLLxiv1wEQ0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 13:09 +0100, Andrew Cooper wrote:
> On 16/09/2020 19:18, Jeff Kubascik wrote:
> > diff --git a/xen/common/sched/arinc653.c
> > b/xen/common/sched/arinc653.c
> > index 7bb75ffe2b..d8a23730c3 100644
> > --- a/xen/common/sched/arinc653.c
> > +++ b/xen/common/sched/arinc653.c
> > @@ -50,38 +50,38 @@
> >   * Return a pointer to the ARINC 653-specific scheduler data
> > information
> >   * associated with the given UNIT
> >   */
> > -#define AUNIT(unit) ((arinc653_unit_t *)(unit)->priv)
> > +#define AUNIT(unit) ((struct a653sched_unit *)(unit)->priv)
> > =20
> >  /*
> >   * Return the global scheduler private data given the scheduler
> > ops pointer
> >   */
> > -#define SCHED_PRIV(s) ((a653sched_priv_t *)((s)->sched_data))
> > +#define SCHED_PRIV(s) ((struct a653sched_private *)((s)-
> > >sched_data))
>=20
> While you're cleaning things up, please delete these macros (possibly
> in
> this patch, as you touch every almost every user).  They strictly
> introduce type safety issues, and are in the process of being taken
> out
> of the other schedulers.
>=20
Agreed. See, e.g.: a1c329c2828b ("xen: credit2: make accessor helpers
inline functions instead of macros")


Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-K4FRftF3hsLLxiv1wEQ0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9jdroACgkQFkJ4iaW4
c+5wuBAAoMT8/o/ID6Tk1aGh04Wee1+cUzrXPNCYVdNQ6Unh3a4hatB46AsVGPvv
phNgrzmK3HsNwFX7RHN3fcvDv5FcsskllNOQvZDvdTxRDxrvc1u/3luwzS6LlAI8
HvczuPVTEF+GwT1vBy8pWNszA3QTX6Z5p8CHiyuj4ECx70zrIalH/OAVrULKbi5o
VX+EDLs5YLQfusomgqGAF7xYHNzxraGQ6JwKiD5vqhJhuqT/9DXwyYDHbtRjGwT4
5JcCsvWa53TITh8dU0iJ9sZXVFZsak2iP6pxyy9RtHwUygpG0XggbHmSbb8GOBxL
xXJvT6WZnbEvEKqtZDQefJm4psNCjk2MNXNhCVMpWnuBC0i7t2xuLxrKhIFpCK0e
CcgTDuLLqiOv5ORZp79Zw7nuW7Dic0iB2GeuoTrbkY+IUYqibEsLy5w1qeVsRKeL
dArDptP60mJ/3rnbC9H2Aqd6vVHHeSuNi5+2d6KmnmSLrZ2gjqQGEwDu/9z9MJ3o
xyEzAjGfTOE0yy1awlnfh0IUjG3y+nT+pY1xRDMIBSHi8bJM3IaNuoCN+eE+cFdr
xx7gxvpUTfEz0ntGBpgY9E+FJE1GdVQegF90DKpC6HBvbwoxQFIBBOmPoqYHstSh
5W3X3Vv9amnTIKtDsLI4jvd8oKSnqBQwqsqFCzlvAj0ONFFWH1I=
=ssyg
-----END PGP SIGNATURE-----

--=-K4FRftF3hsLLxiv1wEQ0--


