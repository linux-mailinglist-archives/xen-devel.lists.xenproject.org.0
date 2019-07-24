Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2872FCA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 15:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHCQ-00034W-K4; Wed, 24 Jul 2019 13:20:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZwqZ=VV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqHCO-00034R-Ve
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 13:20:53 +0000
X-Inumbo-ID: dabcd2d2-ae15-11e9-9cfc-cbca0a4064f4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dabcd2d2-ae15-11e9-9cfc-cbca0a4064f4;
 Wed, 24 Jul 2019 13:20:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16225AE44;
 Wed, 24 Jul 2019 13:20:49 +0000 (UTC)
Message-ID: <de37b4263901d204be0a208a0409fc4809c84576.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Date: Wed, 24 Jul 2019 15:20:47 +0200
In-Reply-To: <90e866b9-86e4-6195-ef5f-c1497d5eba35@suse.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515649785.7407.12930278485576636398.stgit@Palanthas.fritz.box>
 <f0acbdd3-200d-0c75-34aa-ab87b0c91f2a@citrix.com>
 <90e866b9-86e4-6195-ef5f-c1497d5eba35@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1 1/5] xen: sched: null: refactor core
 around vcpu_deassign()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1545608028001328562=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1545608028001328562==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CImmz3Dq3kXyh0/SlHFz"


--=-CImmz3Dq3kXyh0/SlHFz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-24 at 10:32 +0000, Jan Beulich wrote:
> On 15.07.2019 17:46, George Dunlap wrote:
> > On 8/25/18 1:21 AM, Dario Faggioli wrote:
> > > vcpu_deassign() has only one caller: _vcpu_remove().
> > > Let's consolidate the two functions into one.
> > >=20
> > > No functional change intended.
> > >=20
> > > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> >=20
> > Acked-by: George Dunlap <george.dunlap@citrix.com>
>=20
> I thought I'd apply this, but I can't find the mail in my mailbox
> anymore. And I'm not surprised, seeing the date of the original
> posting. So unless George wants to apply it, could I ask you,
> Dario, to resend?
>=20
I will resend, sure.

A couple of the patches need tweaking, and I was planning to resend the
entire series at once, if this is not a problem.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-CImmz3Dq3kXyh0/SlHFz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl04Wy8ACgkQFkJ4iaW4
c+47BA/+PvbFVVGo1VEbvuSaB/HmKnkRbd86A9CIwXZWtVMJLBBlTdKRhRmgsHpp
CxJMyEbBNO1i+VDOSBBm2uo2h40OkAMkmLVK+6rgSBlzkTtCqh/n8awnY0Gk7s9Z
yl0B2B9E7aNzFHEylPNTFJMcdLNv+/8HVcO1+iR9/Z597zWPEHl3LQyLXA7zT1GX
xyCbm52wFf36EgrGSJjD3j67wfpdqxdsqLOgFj7+NyW87rZ/2HGkVNNjc5WdlDQH
MoDHGtSvL9A2qkJu8C0X8VSbPVIUMq2/5MJXwO++5w7nK08ha1ePsNkHJ0t0+Ty1
b9TAYKDDgvY8j63Q+WKdq0uXlqHow7YqLYvSntq3NCMVlpxEzuGEfu3Sj+ctgPcn
qW1OeFAePxMFJA7YpF0F7wbAvPPh+xPmC/Om8i3F2GQMklb3SUVEc/9b3VYO73Wb
Pd/tNhMqrMHfEzh3pFInHEp0MEmY8xd9hG3xcu1C4F9Zni7CxEYQpFtvE8WGTjGP
9l+0RoQxsiDOHPTiWALObbmbqsUx+UwWy2yo9zGlRU4cMpYzTLRL6/WKhwhb4TPn
ArPe652fPQxX//Cz4MO/E+BI+PqpF5mXzsW7TN652Mql5Hi4G3cendAoFm9PumUY
4ME4hVXAz9xvZl+VjAx0vZE6YkjrnLzw8dZXho8KvwAAQiIjtaw=
=7NxK
-----END PGP SIGNATURE-----

--=-CImmz3Dq3kXyh0/SlHFz--



--===============1545608028001328562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1545608028001328562==--


