Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035C592ECA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387404.623614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZ1i-0001k2-3w; Mon, 15 Aug 2022 12:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387404.623614; Mon, 15 Aug 2022 12:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZ1i-0001hI-0y; Mon, 15 Aug 2022 12:17:02 +0000
Received: by outflank-mailman (input) for mailman id 387404;
 Mon, 15 Aug 2022 12:17:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNZ1g-0001hC-VY
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:17:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29b1bca3-1c94-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 14:17:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8AE692096C;
 Mon, 15 Aug 2022 12:16:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 629CD13A99;
 Mon, 15 Aug 2022 12:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bo6yFjs5+mK0JgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 12:16:59 +0000
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
X-Inumbo-ID: 29b1bca3-1c94-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660565819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xUGW5gkNWAPK2gQhfgY0iEzS0osF8fLbNflblMST/s=;
	b=c2eX4e1JYaM5R+1H1xaDuCN6plCEAW1e/ahVyLdE5OH5hy5rCCXtgc7xLt9Kjl+OBpkWBF
	xFcJTycd0lmuXUeogE9kQfKjQyUmERImUiE6vQxoLucWm2Cvfa+RYEre9zpnwJS0MgwPdG
	vWOEEpcHxD+dqR37NAMa+ZSs6qwLMvs=
Message-ID: <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
Date: Mon, 15 Aug 2022 14:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
In-Reply-To: <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Ezg1fCQf0Dim8glvmtyPKde"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Ezg1fCQf0Dim8glvmtyPKde
Content-Type: multipart/mixed; boundary="------------Jlq9Qd67Ab0h4uIYzJSYKoSw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
In-Reply-To: <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>

--------------Jlq9Qd67Ab0h4uIYzJSYKoSw
Content-Type: multipart/mixed; boundary="------------hKumZrqxMpbSrAuyO3fBWNr0"

--------------hKumZrqxMpbSrAuyO3fBWNr0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMTQ6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDIy
IDEzOjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTUuMDguMjIgMTM6NTIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE1LjA4LjIwMjIgMTM6MDQsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+ICsr
KyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+IEBAIC0zMjM3LDYgKzMyMzcsNjUg
QEAgb3V0Og0KPj4+PiAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4gICAgfQ0KPj4+PiAgICAN
Cj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgY3B1X3JtX2RhdGEgKnNjaGVkdWxlX2NwdV9ybV9hbGxv
Yyh1bnNpZ25lZCBpbnQgY3B1KQ0KPj4+PiArew0KPj4+PiArICAgIHN0cnVjdCBjcHVfcm1f
ZGF0YSAqZGF0YTsNCj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNy
Ow0KPj4+PiArICAgIHVuc2lnbmVkIGludCBpZHg7DQo+Pj4+ICsNCj4+Pj4gKyAgICByY3Vf
cmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBzciA9
IGdldF9zY2hlZF9yZXMoY3B1KTsNCj4+Pj4gKyAgICBkYXRhID0geG1hbGxvY19mbGV4X3N0
cnVjdChzdHJ1Y3QgY3B1X3JtX2RhdGEsIHNyLCBzci0+Z3JhbnVsYXJpdHkgLSAxKTsNCj4+
Pj4gKyAgICBpZiAoICFkYXRhICkNCj4+Pj4gKyAgICAgICAgZ290byBvdXQ7DQo+Pj4+ICsN
Cj4+Pj4gKyAgICBkYXRhLT5vbGRfb3BzID0gc3ItPnNjaGVkdWxlcjsNCj4+Pj4gKyAgICBk
YXRhLT52cHJpdl9vbGQgPSBpZGxlX3ZjcHVbY3B1XS0+c2NoZWRfdW5pdC0+cHJpdjsNCj4+
Pj4gKyAgICBkYXRhLT5wcHJpdl9vbGQgPSBzci0+c2NoZWRfcHJpdjsNCj4+Pg0KPj4+IFJl
cGVhdGluZyBhIHYxIGNvbW1lbnQ6DQo+Pj4NCj4+PiAiQXQgbGVhc3QgZnJvbSBhbiBhYnN0
cmFjdCBwZXJzcGVjdGl2ZSwgZG9lc24ndCByZWFkaW5nIGZpZWxkcyBmcm9tDQo+Pj4gICAg
c3IgcmVxdWlyZSB0aGUgUkNVIGxvY2sgdG8gYmUgaGVsZCBjb250aW51b3VzbHkgKGkuZS4g
bm90IGRyb3BwaW5nDQo+Pj4gICAgaXQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9uIGFu
ZCByZS1hY3F1aXJpbmcgaXQgaW4gdGhlIGNhbGxlcik/Ig0KPj4+DQo+Pj4gSW5pdGlhbGx5
IEkgdGhvdWdodCB5b3UgZGlkIHJlc3BvbmQgdG8gdGhpcyBpbiBzb21lIHdheSwgYnV0IHdo
ZW4NCj4+PiBsb29raW5nIGZvciBhIG1hdGNoaW5nIHJlcGx5IEkgY291bGRuJ3QgZmluZCBv
bmUuDQo+Pg0KPj4gT2gsIHNvcnJ5Lg0KPj4NCj4+IFRoZSBSQ1UgbG9jayBpcyBwcm90ZWN0
aW5nIG9ubHkgdGhlIHNyLCBub3QgYW55IGRhdGEgcG9pbnRlcnMgaW4gdGhlIHNyDQo+PiBh
cmUgcmVmZXJlbmNpbmcuIFNvIGl0IGlzIGZpbmUgdG8gZHJvcCB0aGUgUkNVIGxvY2sgYWZ0
ZXIgcmVhZGluZyBzb21lDQo+PiBvZiB0aGUgZmllbGRzIGZyb20gdGhlIHNyIGFuZCBzdG9y
aW5nIGl0IGluIHRoZSBjcHVfcm1fZGF0YSBtZW1vcnkuDQo+IA0KPiBIbW0sIGludGVyZXN0
aW5nLiAiUHJvdGVjdGluZyBvbmx5IHRoZSBzciIgdGhlbiBtZWFucyB3aGF0IGV4YWN0bHk/
DQo+IEp1c3QgaXRzIGFsbG9jYXRpb24sIGJ1dCBub3QgaXRzIGNvbnRlbnRzPw0KDQpDb3Jy
ZWN0Lg0KDQo+IFBsdXMgaXQncyBub3QganVzdCB0aGUgcG9pbnRlcnMgLSBzci0+Z3JhbnVs
YXJpdHkgYWxzbyB3b3VsZCBiZXR0ZXIgbm90DQo+IGluY3JlYXNlIGluIHRoZSBtZWFudGlt
ZSAuLi4gUXVpdGUgbGlrZWx5IHRoZXJlJ3MgYSByZWFzb24gd2h5IHRoYXQgYWxzbw0KPiBj
YW5ub3QgaGFwcGVuLCB5ZXQgZXZlbiB0aGVuIEkgdGhpbmsgYSBicmllZiBjb2RlIGNvbW1l
bnQgbWlnaHQgYmUNCj4gaGVscGZ1bCBoZXJlLg0KDQpPa2F5LCB3aWxsIGFkZCBzb21ldGhp
bmcgbGlrZToNCg0KIkJldHdlZW4gc2NoZWR1bGVfY3B1X3JtX2FsbG9jKCkgYW5kIHRoZSBy
ZWFsIGNwdSByZW1vdmFsIGFjdGlvbiB0aGUgcmVsZXZhbnQNCiAgY29udGVudHMgb2Ygc3Ry
dWN0IHNjaGVkX3Jlc291cmNlIGNhbid0IGNoYW5nZSwgYXMgdGhlIGNwdSBpbiBxdWVzdGlv
biBpcw0KICBsb2NrZWQgYWdhaW5zdCBhbnkgb3RoZXIgbW92ZW1lbnQgdG8gb3IgZnJvbSBj
cHVwb29scywgYW5kIHRoZSBkYXRhIGNvcGllZA0KICBieSBzY2hlZHVsZV9jcHVfcm1fYWxs
b2MoKSBpcyBjcHVwb29sIHNwZWNpZmljLiINCg0KSXMgdGhhdCBva2F5Pw0KDQoNCkp1ZXJn
ZW4NCg==
--------------hKumZrqxMpbSrAuyO3fBWNr0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------hKumZrqxMpbSrAuyO3fBWNr0--

--------------Jlq9Qd67Ab0h4uIYzJSYKoSw--

--------------0Ezg1fCQf0Dim8glvmtyPKde
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6OToFAwAAAAAACgkQsN6d1ii/Ey92
QggAioag24x/AOSzU89jn0aB3H3dOqwnma5f0jzdizFkEoj7tQX6pjjTJ+KnQuINyvj8dExV6o/n
zB4MetD0T4IQRY3X7lpRkeNSFeMfaQTSd+ekCqPaLU34fzWT9a/+MwLpbMLodzOqrdSuog06+0mg
iL7NRW7myPPCU1+DHhZX0cz+dl+7cEjHjjUBDslFBILd9bJULMOdX8VMK9ZitE40sU1lDdIYrCfj
bajxMzWEtK6EWrB3bWr6fpTEEa3D6fVwZ4KmfKRAPagQ0rktJ628Dm2MSsWANMxgHhaAJ6C9+au8
dYHJxnEARaAq2jxlzjVRv3r/dbQ4L1xPnIPrDMIsIw==
=aAu/
-----END PGP SIGNATURE-----

--------------0Ezg1fCQf0Dim8glvmtyPKde--

