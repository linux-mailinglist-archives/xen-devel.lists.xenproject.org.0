Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A96C345F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512738.792923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ped4u-0001se-Fq; Tue, 21 Mar 2023 14:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512738.792923; Tue, 21 Mar 2023 14:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ped4u-0001q2-CM; Tue, 21 Mar 2023 14:35:08 +0000
Received: by outflank-mailman (input) for mailman id 512738;
 Tue, 21 Mar 2023 14:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s3fm=7N=neowutran.ovh=me@srs-se1.protection.inumbo.net>)
 id 1ped4B-0001oZ-VB
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:34:24 +0000
Received: from neowutran.ovh (vps-eb112777.vps.ovh.net [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 783f7876-c7f5-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:34:22 +0100 (CET)
Received: from neowutran.ovh (82-65-208-184.subs.proxad.net [82.65.208.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 9CEB560D1C;
 Tue, 21 Mar 2023 14:34:16 +0000 (UTC)
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
X-Inumbo-ID: 783f7876-c7f5-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh;
	s=my-selector-name; t=1679409256;
	bh=R6slRKmJiDjS9tbt+LavBYIjU2VjgXHVJjgyVAFJPOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kkMEPdQYvQJsFIfjRsXYY+3G3pv/frgQE3ZEmEPZOOnaXVKbBYOmP+HgaohxQK2E+
	 SdQAYBcgyU9bN8mdSYl7EnieZhq1cLvm1Q4iLx5anr8eo4CXkNxQV9by1+31TGWP+e
	 64gVKoZ1plzu5VNJBAQLLmcfGWDwaONTZPUZh+L+YSNacfFD+DtFZh3JIdQV/uCtWG
	 71E+MUDs+RdiIIOTFSe6fGlKvJuxR/XiuDKh7x87AgS5w1RsjDE1VRypi/WFwV64at
	 1t0pVNrlmeypq5Tf37PjlE5XUboxd/MWrvvhMyvY3Ek8LL9X5Pm4MKkvSjO7df1eTv
	 WovfWVI+w71k14tXYNWOSSuqmJ8QzaGXo6vthd0dG5DtOaUbOeI1jebvZGYEOsHfVL
	 I9q6ABr9jzpZmys6b9fCMepFcmqAG4RMwhCrWasTGSozVIua80pYTXfSJzArayvJhY
	 WNxjDIfXw4ARsbDxnhB5iGX5BY7exKH9NVAEiZOKlXbSbiYSGU4zBSMnZh1hJKtzqJ
	 1Fqkk3WqrIMUKEqmOYj1kXp5PbrQkmklJTaDH1Zd1R1nkhDqtwOum3fd6l1AgQ/wlt
	 jlzu5bRgVIF4aWNcF7Dap/YKWwGX38QHxE9ZFQ6houuU5ecGm9slf5zVbJmL/wrU7Z
	 iMKcwWC14Re4+TtH+n278IqE=
Date: Tue, 21 Mar 2023 15:34:19 +0100
From: Neowutran <me@neowutran.ovh>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <20230321143419.p3q74rpoqhm6tk6k@archlinux>
References: <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
 <ZBkwboNcQu6ooSRC@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6k3iv5lldr5zkjvz"
Content-Disposition: inline
In-Reply-To: <ZBkwboNcQu6ooSRC@mattapan.m5p.com>


--6k3iv5lldr5zkjvz
Content-Type: text/p
lain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > >>>>>> I was taking a look at the BIOS manual for this motherboard and =
noticed
> > >>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
> > >>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
>=20
> This does appear to be an improvement.  With this the system boots if
> the "Local APIC Mode" setting is "auto".  As you may have guessed,
> "(XEN) Switched to APIC driver x2apic_phys".
>=20
>=20
>=20
> When I tried setting "Local APIC Mode" to "x2APIC" though things didn't
> go so well. =20

I confirm what Elliott said, just tested the patch on my computer (ryzen 70=
00 series).=20

Before, I was using the workaround "x2apic=3Dfalse" in the xen boot
option.=20

After applying the patch, when "Local APIC Mode" is set to "auto" ( or
at least not "x2APIC"), then it work without needing the "x2apic=3Dfalse"
workaround.=20
If "Local APIC Mode" is set to "X2APIC", then it is stuck waiting for
nvme  
information, like without the patch and without the "x2apic=3Dfalse"
workaround.=20

--6k3iv5lldr5zkjvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQOCLfH+LKMwBsqlpoBUK/6/4MojwUCZBnAXgAKCRABUK/6/4Mo
jxnXAP9NQrW6d7c3vzdk6hWWDv/mB8oMcTYIkIjrRveLmuPOqQD/Z4bmrzCOniu3
mRI1LGCpp3cP90ApzV+ZMkb3KD5NzQ4=
=3cdz
-----END PGP SIGNATURE-----

--6k3iv5lldr5zkjvz--
 

