Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7668B88B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 10:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490128.758703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxha-0004vO-1M; Mon, 06 Feb 2023 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490128.758703; Mon, 06 Feb 2023 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxhZ-0004rz-Ua; Mon, 06 Feb 2023 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 490128;
 Mon, 06 Feb 2023 09:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pOxhY-0004pu-F8
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 09:22:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1dfe44-a5ff-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 10:22:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F4463F282;
 Mon,  6 Feb 2023 09:22:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A22713677;
 Mon,  6 Feb 2023 09:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dsioFMPG4GNcNgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Feb 2023 09:22:11 +0000
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
X-Inumbo-ID: bc1dfe44-a5ff-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675675331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xq9DAQJA5bLa0f2FnBAlUYRsTbrf3r86W3+9Gv9KH+Y=;
	b=GcgRheuijXKt5LJvz9UKO3aK4JuaTMyMnOm+r95o1mJCBaBPDEojs3tEOBYDACu7S9zYIl
	ecWSc9KhF1fWCzncQPI5Zp4a0aw9kcTZ17tO+hMPprVa+a2TEDXJB59TjW06y9+Qp82FKD
	OLXD1a/jNlRbYOos8uzmT4dl4NvmpUs=
Message-ID: <383cbd1b-6518-bc1d-a3ae-5562e3dec5c1@suse.com>
Date: Mon, 6 Feb 2023 10:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-5-jgross@suse.com>
 <20230206090139.ehvf2czoocn6j7nc@begin>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/7] Mini-OS: add 9pfs frontend
In-Reply-To: <20230206090139.ehvf2czoocn6j7nc@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vx4qmPovfF4xTZ3bqa6wrOE5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vx4qmPovfF4xTZ3bqa6wrOE5
Content-Type: multipart/mixed; boundary="------------ufXSVO0GXigeBQDpw4HOHnfQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <383cbd1b-6518-bc1d-a3ae-5562e3dec5c1@suse.com>
Subject: Re: [PATCH 4/7] Mini-OS: add 9pfs frontend
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-5-jgross@suse.com>
 <20230206090139.ehvf2czoocn6j7nc@begin>
In-Reply-To: <20230206090139.ehvf2czoocn6j7nc@begin>

--------------ufXSVO0GXigeBQDpw4HOHnfQ
Content-Type: multipart/mixed; boundary="------------mvNQMwStrrqXLQfuQ1suzeyP"

--------------mvNQMwStrrqXLQfuQ1suzeyP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDIuMjMgMTA6MDEsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgdmVuLiAwMyBmw6l2ci4gMjAyMyAxMDoxODowNiArMDEwMCwgYSBlY3JpdDoN
Cj4+ICt2b2lkICppbml0XzlwZnJvbnQodW5zaWduZWQgaW50IGlkLCBjb25zdCBjaGFyICpt
bnQpDQo+PiArew0KPiBbLi4uXQ0KPj4gKyAgICBmcmVlKHhlbmJ1c193YXRjaF9wYXRoX3Rv
a2VuKFhCVF9OSUwsIGJlcGF0aCwgYmVwYXRoLCAmZGV2LT5ldmVudHMpKTsNCj4gDQo+IEJl
dHRlciBjaGVjayBmb3IgZXJyb3JzLCBvdGhlcndpc2UgdGhlIHJlc3Qgd2lsbCBoYW5nIHdp
dGhvdXQgdXNlZnVsDQo+IGZlZWRiYWNrLg0KDQpUaGlzIGlzIGEgY29tbW9uIHBhdHRlcm4g
aW4gTWluaS1PUyBmcm9udGVuZHMuDQoNCkkgY2FuIGFkZCBhbiBlcnJvciBjaGVjaywgb2Yg
Y291cnNlLg0KDQo+IA0KPj4gKyAgICBmb3IgKCB2ID0gdmVyc2lvbjsgKnY7IHYrKyApDQo+
PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggc3RydG91bCh2LCAmdiwgMTApID09IDEgKQ0K
Pj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHYgPSBOVUxMOw0KPj4gKyAgICAgICAg
ICAgIGJyZWFrOw0KPiANCj4gVGhpcyBsb29rcyBmcmFnaWxlPyBpZiB2ZXJzaW9uIGlzICIy
LjEiIGl0IHdpbGwgYWNjZXB0IGl0IGFwcGFyZW50bHk/IEkNCj4gZ3Vlc3MgYmV0dGVyIGNo
ZWNrIHdoZXRoZXIgc3RydG91bCBkaWQgcmVhZCBhIG51bWJlciwgYW5kIGluIHRoYXQgY2Fz
ZQ0KPiBicmVhayB0aGUgbG9vcCBhbnl3YXksIHN1Y2Nlc3NmdWxseSBpZiB0aGUgbnVtYmVy
IGlzIDEgYW5kIHdpdGggZmFpbHVyZQ0KPiBvdGhlcndpc2UuDQoNClZlcnNpb25zIGFyZSBk
ZWZpbmVkIHRvIGJlIGludGVnZXJzLg0KDQpJIGNhbiBhZGQgY2hlY2tzIGZvciBzYW5pdGl6
aW5nIGJhY2tlbmQgd3JpdHRlbiBkYXRhLCBidXQgSSdtIG5vdCBzdXJlIHdlDQpuZWVkIHRo
YXQuIEluIGNhc2UgdGhlIGJhY2tlbmQgd2FudHMgdG8gZm9vbCB1cywgaXQgY2FuIGVhc2ls
eSB0ZWxsIHVzIHRvDQpzdXBwb3J0IHZlcnNpb24gMSBldmVuIGlmIGl0IGRvZXNuJ3QuDQoN
Cj4gDQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsgICAgZnJlZSh2ZXJzaW9uKTsN
Cj4+ICsgICAgaWYgKCB2ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcmVhc29uID0gInZl
cnNpb24gMSBub3Qgc3VwcG9ydGVkIjsNCj4+ICsgICAgICAgIGdvdG8gZXJyOw0KPj4gKyAg
ICB9DQo+IA0KPiBUaGlzIGxvb2tzIG9kZDogd2hlbiBudW1iZXIgMSBpcyBkZXRlY3RlZCB0
aGlzIGJyZWFrcyBvdXQgc3VjY2Vzc2Z1bGx5LA0KPiB3aGlsZSB0aGUgZXJyb3IgbWVzc2Fn
ZSBvdGhlcndpc2Ugc2F5cyB0aGF0IGl0J3MgdmVyc2lvbiAxIHdoaWNoIGlzIG5vdA0KPiBz
dXBwb3J0ZWQ/IElzIHRoZSBtZXNzYWdlIHN1cHBvc2VkIHRvIGJlICJ2ZXJzaW9uIGdyZWF0
ZXIgdGhhbiAxIG5vdA0KPiBzdXBwb3J0ZWQiPw0KDQpJIGNhbiBjaGFuZ2UgdGhlIG1lc3Nh
Z2UgdG8gIkJhY2tlbmQgZG9lc24ndCBzdXBwb3J0IHZlcnNpb24gMSIuDQoNCj4gDQo+PiAr
IGVycjoNCj4+ICsgICAgaWYgKCBiZXBhdGhbMF0gKQ0KPj4gKyAgICAgICAgZnJlZSh4ZW5i
dXNfdW53YXRjaF9wYXRoX3Rva2VuKFhCVF9OSUwsIGJlcGF0aCwgYmVwYXRoKSk7DQo+PiAr
ICAgIGlmICggbXNnICkNCj4+ICsgICAgICAgIHByaW50aygiOXBmc2Zyb250IGFkZCAldSBm
YWlsZWQsIGVycm9yICVzIGFjY2Vzc2luZyBYZW5zdG9yZVxuIiwNCj4+ICsgICAgICAgICAg
ICAgICBpZCwgbXNnKTsNCj4+ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgcHJpbnRrKCI5cGZz
ZnJvbnQgYWRkICV1IGZhaWxlZCwgJXNcbiIsIGlkLCByZWFzb24pOw0KPj4gKyAgICBmcmVl
XzlwZnJvbnQoZGV2KTsNCj4gDQo+IEluIGNhc2Ugb2YgZWFybHkgZXJyb3JzLCB0aGlzIHdp
bGwgdHJ5IHRvIGZyZWUgdW5pbml0aWFsaXplZCBldnRjaG4sDQo+IHJpbmdfcmVmLCBldGMu
DQoNCk9oIHJpZ2h0LCBJIG5lZWQgdG8gY2hlY2sgdGhvc2UgZm9yIGJlaW5nIG5vdCAwLg0K
DQoNCkp1ZXJnZW4NCg==
--------------mvNQMwStrrqXLQfuQ1suzeyP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mvNQMwStrrqXLQfuQ1suzeyP--

--------------ufXSVO0GXigeBQDpw4HOHnfQ--

--------------vx4qmPovfF4xTZ3bqa6wrOE5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPgxsIFAwAAAAAACgkQsN6d1ii/Ey9o
NggAnkHMVcRn8nmL2Sn6reRQ+Y/QBblOgM7AMasT+FM1uKkklT6aV4fr0MI1lqj4q4i0uERyhASW
0FZXJ2WLSy/Jg2kSO88Ofb3+NkL+oasI2PBVjwqZJfBgOP9yXu44IiVezCe9WsxGeRd4B6t/IL2W
GH+De1P21wgaeUy33rwhHLr6nv0wbYBexn/7GviDly5wyFPvH9iPqKQ4GcrWMZGOHF5OL/jN2U8o
C0xPyKa2lD07SiloC+ECo7HHdm5qE0xdAUBSmwQxIr2JAB7gXspGOejIZptlCAi5EnzIousZmZXt
L3bWsCGq/Y116NBHCE+Kdhx3IPTPNQ9HY5f+PMYhow==
=5Wcp
-----END PGP SIGNATURE-----

--------------vx4qmPovfF4xTZ3bqa6wrOE5--

