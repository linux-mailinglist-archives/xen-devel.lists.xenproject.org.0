Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E55D3EA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLJS-0007BI-Vi; Tue, 02 Jul 2019 16:07:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RsqZ=U7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hiLJQ-0007BD-3Y
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:07:20 +0000
X-Inumbo-ID: 7710176c-9ce3-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::8])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7710176c-9ce3-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1562083637;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=oGIAaEpMkd17HjeAtZeQCaypE1/TLyh+2tgF6pG/thk=;
 b=eKCR9twGwp6JsYdal8givGWi/FL1fTE9q0k6I8TYPnIj6tikyLoMn3gMKE7rnYaNxv
 Hy61i7ERpsIIjPMKIRotSgxLGxn5kRFYujg+snXBYlBWiDIK70UJvuSrUzgUmIfgCvhf
 7E+EM+WZWGWhkFan0zwQquW67G32JoX68L8R9tF8Od4Ek2POevqUQh7KugKdWjsWsRSy
 l6tJo5Hxw+0putoXVTUfsvI/xiUZBPTG4G8V6qLdH/B3DpGNMRL8FgLT9M9wNUDmNLvK
 h56rfgVeDLqpcbnKEPn24rpb19tTG89h/xN4rIjMT50mHV4EO9KFZc9HKliFNfeyzmzh
 ZTlQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id 60b3d8v62G6qqK5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 2 Jul 2019 18:06:52 +0200 (CEST)
Date: Tue, 2 Jul 2019 18:06:46 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190702180646.33a251f6.olaf@aepfle.de>
In-Reply-To: <20190702145237.GC22182@perard.uk.xensource.com>
References: <20190621092944.29241-1-olaf@aepfle.de>
 <20190702145237.GC22182@perard.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] Use XEN_SCRIPT_DIR to refer to
 /etc/xen/scripts
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1314281696512063648=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1314281696512063648==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8JNamfWRqMIAw9tM+Zm22ry"; protocol="application/pgp-signature"

--Sig_/8JNamfWRqMIAw9tM+Zm22ry
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 2 Jul 2019 15:52:37 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> As far as I can tell, this isn't true, scripts are located in /etc.

There was zero response to the other patches.
This one just depends on them.

Olaf

--Sig_/8JNamfWRqMIAw9tM+Zm22ry
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl0bgRYACgkQ86SN7mm1
DoBdTw/9HCUBhLvDR874y28VGmT1IeNKEzPuvckiLsfM7wO9qZsVbWxtl2m7JkNd
mGy++LhCRrTVMIpf5JO7rV22HxdX74qnAZCK7VOpFWUtm7UkLI9uIOm0g0PTRp/C
0RZm9Go57ZmUdRLL1ksgfPsLrVVrMuIecdVn0tmrN0tYU2sbiuKDUq3WvTOr7CH3
uXPCbFW7IvqZ2awtFXluomr1m/gcan3UdGu3SDyeLfV5GYzvnzXRr9Gr3MnM/Lm3
UqyTu4kAIXyqkU76k5co209HCJrJHl+6M8Xp0JZjS7UZ/ZLd1KuI84dCK5VLENAU
3rnfCvYiveS7y0LA0TyBuw8Wq74GZbbPipweBQMYlX4/Y7oEvjoLOPmWML9JQDio
YjetnNuPo2+EumKCfUICMR3968Rj9Dim8cNCT4Dy/Pn2rnLrDyDgcs29nMM0Rp+w
o8cLPXbUkebE4o188YswEE8xOBmp/XXgNNzzsYz5p6PmK05xB5iz9358ZCjNcRkR
Ql0iGN+SXestuatWZ2NgjVveeYtoZVfXU9eNQGTDmT+VvcsV2tFCoatT8BFERwMo
BgkcmG2S+sk/VVJ7wZVu3aQnJ16GgV3m0R5db2p9+OWh7kumcvdPDV1gLoVt3ihG
q0D3Tje1DxQVl2JKjxWnk97WNazg7E+KM4EBhRFyESmVdflx2es=
=GvoG
-----END PGP SIGNATURE-----

--Sig_/8JNamfWRqMIAw9tM+Zm22ry--


--===============1314281696512063648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1314281696512063648==--

