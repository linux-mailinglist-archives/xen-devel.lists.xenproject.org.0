Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526685B2F32
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 08:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403830.646073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXi5-0003MK-T9; Fri, 09 Sep 2022 06:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403830.646073; Fri, 09 Sep 2022 06:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXi5-0003KF-P2; Fri, 09 Sep 2022 06:41:53 +0000
Received: by outflank-mailman (input) for mailman id 403830;
 Fri, 09 Sep 2022 06:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWXi4-0003K7-E7
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 06:41:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bd36dab-300a-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 08:41:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 480FF1F8C6;
 Fri,  9 Sep 2022 06:41:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 031A313AE9;
 Fri,  9 Sep 2022 06:41:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2noYOS3gGmOaHwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 06:41:49 +0000
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
X-Inumbo-ID: 7bd36dab-300a-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662705710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CH0N6o+0UbE3T1NFfhiqsKP6AKDsT9Yxig6MrvuJxdU=;
	b=G+sAoFJ0khUWyGTqdvK/hiOG+jINDcTjMchzo+kh40ttXTD/omm9DlHGW7M+OSmbjogYqj
	X63AR/impT6x7Xv/UjwCkBz5OJYvPC9y3brn4LbCzpQJY/HmzJQJsjOjzPq65dDrggTIaA
	JZ12EMQ1Un9nZ7AwSCa1AOeaxa3LOTw=
Message-ID: <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
Date: Fri, 9 Sep 2022 08:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 JESHWANTHKUMAR.NK@amd.com, Devaraj.Rangasamy@amd.com,
 Mythri.Pandeshwarakrishna@amd.com, SivaSangeetha.SK@amd.com,
 Rijo-john.Thomas@amd.com
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JvzOd2CWJooH4rmPI8hB1ugt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JvzOd2CWJooH4rmPI8hB1ugt
Content-Type: multipart/mixed; boundary="------------i5e5YIf7XsUp8Ihz4lDxNcwJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 JESHWANTHKUMAR.NK@amd.com, Devaraj.Rangasamy@amd.com,
 Mythri.Pandeshwarakrishna@amd.com, SivaSangeetha.SK@amd.com,
 Rijo-john.Thomas@amd.com
Message-ID: <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>

--------------i5e5YIf7XsUp8Ihz4lDxNcwJ
Content-Type: multipart/mixed; boundary="------------nlFP6Bm2rRPYGqvkD3i4GNpH"

--------------nlFP6Bm2rRPYGqvkD3i4GNpH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjIgMDQ6MTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gQWRkaW5n
IG1vcmUgcGVvcGxlIGluIENDDQo+IA0KPiBPbiBUaHUsIDggU2VwIDIwMjIsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+IEhpIEp1ZXJnZW4sDQo+Pg0KPj4gQSBjb2xsZWFndWUg
aXMgc2VlaW5nIGEgZmFpbHVyZSBvbiB4ODYgaW4gTGludXggRG9tMC4gVGhlIGZhaWx1cmUg
aXMNCj4+IHBpbl91c2VyX3BhZ2VzX2Zhc3Qgd2l0aCBhZGRyZXNzZXMgdGhhdCBjb3JyZXNw
b25kIHRvIGZvcmVpZ24gbWVtb3J5DQo+PiBwYWdlczoNCj4+DQo+PiAtIFFFTVUgbWFwcyBh
IGRvbVUgYWRkcmVzcyB1c2luZyBkbWFfbWVtb3J5X21hcCAoeGVuX21hcF9jYWNoZSkNCj4+
IC0gUUVNVSBjYWxscyBhbiBJT0NUTCB0byB0aGUgVEVFIHN1YnN5c3RlbSB3aXRoIHRoZSBW
aXJ0dWFsIEFkZHJlc3MNCj4+ICAgIHJldHVybmVkIGJ5IGRtYV9tZW1vcnlfbWFwDQo+PiAt
IExpbnV4IHRlZV9zaG1fcmVnaXN0ZXItPnBpbl91c2VyX3BhZ2VzX2Zhc3QgUmV0dXJucyAt
MTQgLSBkcml2ZXJzL3RlZS90ZWVfc2htLmMNCj4+DQo+PiBPbmNlIHVwb24gYSB0aW1lIGl0
IHVzZWQgdG8gYmUgdGhlIGNhc2UgdGhhdCBnZXRfdXNlcl9wYWdlc19mYXN0IHdvdWxkDQo+
PiBmYWlsIG9uIFhlbiBiZWNhdXNlIHdlIGRpZG4ndCBoYXZlIGEgc3RydWN0IHBhZ2UgY29y
cmVzcG9uZGluZyB0bw0KPj4gZm9yZWlnbiBtZW1vcnkgbWFwcGluZ3MuIEJ1dCB0aGF0IGhh
c24ndCBiZWVuIHRoZSBjYXNlIGZvciB5ZWFycyBub3cuDQo+Pg0KPj4gQW55IG90aGVyIGlk
ZWFzIHdoeSBpdCB3b3VsZCBmYWlsPw0KDQpJIHRoaW5rIHdlIGNhbiBleHBlY3QgdGhhdCBh
Y2Nlc3Nfb2soKSBpc24ndCBmYWlsaW5nLg0KDQpJIGFzc3VtZSB0aGUgbWFwcGluZyB3YXMg
ZG9uZSBhbGxvd2luZyB3cml0ZXMgKHNvcnJ5IGZvciBwYXJhbm9pYSBtb2RlKT8NCg0KT3Ro
ZXIgdGhhbiB0aGF0IEknbSBub3QgaGF2aW5nIGVub3VnaCBtZW1vcnkgbWFuYWdlbWVudCBz
a2lsbHMuIEl0IG1pZ2h0IGJlDQpyZWxhdGVkIHRvIG1tYXAoKS1lZCBmb3JlaWduIHBhZ2Vz
IGhhdmluZyBfUEFHRV9TUEVDSUFMIHNldCwgdGhvdWdoLg0KDQoNCkp1ZXJnZW4NCg==
--------------nlFP6Bm2rRPYGqvkD3i4GNpH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------nlFP6Bm2rRPYGqvkD3i4GNpH--

--------------i5e5YIf7XsUp8Ihz4lDxNcwJ--

--------------JvzOd2CWJooH4rmPI8hB1ugt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMa4C0FAwAAAAAACgkQsN6d1ii/Ey/s
3QgAgGa/NWgwIcUFlBfPI7LkIhR4G88bobIulAj6r5wlsDH92Q6xnViYGI4FpOMu+0KdApivsVZT
0K+Hp8xyKzhB7p99dHe6yq+lMFCAIxXTc2+SYPscMpkOJ/ZQ0UZuRIG848Q2kJXNmyV+5yu+qJUT
QFF11BJMffl78WQxh/miFiCiAxl7MMQ7FEezE2AXoHfyteiN20p2pQTJU6o2F1Kz2/9XS9WWh7pM
wjIPjYRtelfCiO+LY/0yagMaDislfc9J21/IPniIdVoOspQsTYYKKIloM55cm7SehH1RcKM6SEmz
o/xG2cK/VnU2srZgHuNMIECOO1X0ohzLlP9pLUMk5Q==
=1yZn
-----END PGP SIGNATURE-----

--------------JvzOd2CWJooH4rmPI8hB1ugt--

