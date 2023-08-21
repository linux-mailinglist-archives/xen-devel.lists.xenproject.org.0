Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8888782D18
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587650.919004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY6gp-0002A4-1y; Mon, 21 Aug 2023 15:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587650.919004; Mon, 21 Aug 2023 15:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY6go-00027e-TG; Mon, 21 Aug 2023 15:19:34 +0000
Received: by outflank-mailman (input) for mailman id 587650;
 Mon, 21 Aug 2023 15:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Cwo=EG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qY6gn-00027T-KA
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:19:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 206b3715-4036-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 17:19:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC9BD1F459;
 Mon, 21 Aug 2023 15:19:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AB0D13421;
 Mon, 21 Aug 2023 15:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +4OrFIKA42QrGgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Aug 2023 15:19:30 +0000
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
X-Inumbo-ID: 206b3715-4036-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692631170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OfitHrWONvJzfnaXscuUap/3KxxQtEEPcKDFsJm5GAU=;
	b=ZatmB3w/b0bhM7CONpNqIKOv1JDKpERiREwYkdIXVgFe2jYTmRsbueVe4E13YW+42Jj/Sz
	BF/mqVZAwL8W3ymvbtCd3xcED/OsKDVWLqRUG9Dam7VNfckWiUVGdj48YUMggUd9ZgF0pf
	Nd31+eOQtnT1MiJPNXpJERxZwRn1xqg=
Message-ID: <6d165116-6c55-4fa1-a378-92f1a7a444b4@suse.com>
Date: Mon, 21 Aug 2023 17:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] tools/xenstore: move xenstored sources into dedicated
 directory
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <jgrall@amazon.com>
References: <20230821081422.17027-1-jgross@suse.com>
 <9c10e5ba-6b5a-4d97-bce2-908a588729f6@perard>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <9c10e5ba-6b5a-4d97-bce2-908a588729f6@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------unbuT9EIY144VzHm0EYOK6fd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------unbuT9EIY144VzHm0EYOK6fd
Content-Type: multipart/mixed; boundary="------------Cb52yfbrUwjjo0B0F00frywm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <jgrall@amazon.com>
Message-ID: <6d165116-6c55-4fa1-a378-92f1a7a444b4@suse.com>
Subject: Re: [PATCH v6] tools/xenstore: move xenstored sources into dedicated
 directory
References: <20230821081422.17027-1-jgross@suse.com>
 <9c10e5ba-6b5a-4d97-bce2-908a588729f6@perard>
In-Reply-To: <9c10e5ba-6b5a-4d97-bce2-908a588729f6@perard>

--------------Cb52yfbrUwjjo0B0F00frywm
Content-Type: multipart/mixed; boundary="------------w5vRfPOuPvc0qfDRu9DK2Pa0"

--------------w5vRfPOuPvc0qfDRu9DK2Pa0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDguMjMgMTc6MTcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBNb24sIEF1
ZyAyMSwgMjAyMyBhdCAxMDoxNDoyMkFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC8uZ2l0aWdub3JlIGIvdG9vbHMveGVu
c3RvcmVkLy5naXRpZ25vcmUNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAw
MDAwMDAwMDAwLi5lZGJiNWQ3OWZlDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90b29s
cy94ZW5zdG9yZWQvLmdpdGlnbm9yZQ0KPj4gQEAgLTAsMCArMSBAQA0KPj4gK3hlbnN0b3Jl
ZA0KPiANCj4gQ291bGQgeW91IHdyaXRlIHRoYXQgIi94ZW5zdG9yZWQiID8gVGhlIHByZWZp
eCAiLyIganVzdCBtYWtlcyBzdXJlIHRoYXQNCj4gb25seSB0aGUgZmlsZSBpbiB0aGUgY3Vy
cmVudCBkaXJlY3RvcnkgaXMgaWdub3JlZCwgYW5kIG5vdCBhbnkNCj4gInhlbnN0b3JlZCIg
aW4gc3ViZGlyZWN0b3J5LiBKdXN0IGluIGNhc2UuDQoNCk9rYXkuDQoNCj4gDQo+PiBkaWZm
IC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL01ha2VmaWxlIGIvdG9vbHMveGVuc3RvcmVkL01h
a2VmaWxlDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4u
ZjNiZDNkNDNjNA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVk
L01ha2VmaWxlDQo+PiBAQCAtMCwwICsxLDQ4IEBADQo+PiArWEVOX1JPT1Q9JChDVVJESVIp
Ly4uLy4uDQo+PiAraW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9SdWxlcy5taw0KPj4gKw0K
Pj4gK2luY2x1ZGUgTWFrZWZpbGUuY29tbW9uDQo+PiArDQo+PiAreGVuc3RvcmVkOiBMRExJ
QlMgKz0gJChMRExJQlNfbGlieGVuZXZ0Y2huKQ0KPj4gK3hlbnN0b3JlZDogTERMSUJTICs9
ICQoTERMSUJTX2xpYnhlbmdudHRhYikNCj4+ICt4ZW5zdG9yZWQ6IExETElCUyArPSAkKExE
TElCU19saWJ4ZW5jdHJsKQ0KPj4gK3hlbnN0b3JlZDogTERMSUJTICs9IC1scnQNCj4+ICt4
ZW5zdG9yZWQ6IExETElCUyArPSAkKFNPQ0tFVF9MSUJTKQ0KPj4gKw0KPj4gK2lmZXEgKCQo
Q09ORklHX1NZU1RFTUQpLHkpDQo+PiArJChYRU5TVE9SRURfT0JKUy15KTogQ0ZMQUdTICs9
ICQoU1lTVEVNRF9DRkxBR1MpDQo+PiAreGVuc3RvcmVkOiBMRExJQlMgKz0gJChTWVNURU1E
X0xJQlMpDQo+PiArZW5kaWYNCj4+ICsNCj4+ICtUQVJHRVRTICs9IHhlbnN0b3JlZA0KPiAN
Cj4gQ291bGQgeW91IGNoYW5nZSB0aGF0IHRvIDo9IGluc3RlYWQgb2YgKz0gPyBUQVJHRVRT
IGlzIGN1cnJlbnRseQ0KPiBpbnRyb2R1Y2VkIHdpdGggYSA6PSAoaW4gdG9vbHMveGVuc3Rv
cmUvTWFrZWZpbGUpLg0KDQpGaW5lIHdpdGggbWUuDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMveHMtY2xpZW50cy8uZ2l0aWdub3JlIGIvdG9vbHMveHMtY2xpZW50cy8uZ2l0aWdu
b3JlDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uMjMz
ZmQ4MjI4YQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvdG9vbHMveHMtY2xpZW50cy8u
Z2l0aWdub3JlDQo+PiBAQCAtMCwwICsxLDEwIEBADQo+PiAreGVuc3RvcmUNCj4+ICt4ZW5z
dG9yZS1jaG1vZA0KPj4gK3hlbnN0b3JlLWNvbnRyb2wNCj4+ICt4ZW5zdG9yZS1leGlzdHMN
Cj4+ICt4ZW5zdG9yZS1saXN0DQo+PiAreGVuc3RvcmUtbHMNCj4+ICt4ZW5zdG9yZS1yZWFk
DQo+PiAreGVuc3RvcmUtcm0NCj4+ICt4ZW5zdG9yZS13YXRjaA0KPj4gK3hlbnN0b3JlLXdy
aXRlDQo+IA0KPiBTYW1lIHRoaW5nIGhlcmUsIGNvdWxkIHlvdSBwcmVmaXggYWxsIHRob3Nl
IGVudHJpZXMgd2l0aCAiLyI/DQoNClllcy4NCg0KPiANCj4+IGRpZmYgLS1naXQgYS90b29s
cy94ZW5zdG9yZS9NYWtlZmlsZSBiL3Rvb2xzL3hzLWNsaWVudHMvTWFrZWZpbGUNCj4+IHNp
bWlsYXJpdHkgaW5kZXggNzQlDQo+PiByZW5hbWUgZnJvbSB0b29scy94ZW5zdG9yZS9NYWtl
ZmlsZQ0KPj4gcmVuYW1lIHRvIHRvb2xzL3hzLWNsaWVudHMvTWFrZWZpbGUNCj4+IGluZGV4
IGRjMzliNmNiMzEuLjFjNTc0MDQ1MGEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9y
ZS9NYWtlZmlsZQ0KPj4gKysrIGIvdG9vbHMveHMtY2xpZW50cy9NYWtlZmlsZQ0KPiANCj4g
SSdtIHRlbXB0ZWQgdG8gYXNrIGZvciB0aGUgdGFyZ2V0cyAiY2xpZW50cy1pbnN0YWxsIiBh
bmQNCj4gImNsaWVudHMtdW5pbnN0YWxsIiB0byBiZSByZW1vdmVkIGZyb20gdGhpcyBtYWtl
ZmlsZS4gTm90aGluZyBpcyBjYWxsaW5nDQo+IHRoZW0gaW4gb3VyIGJ1aWxkIHN5c3RlbSBh
bmQgc29tZXRoaW5nIG91dHNpZGUgdGhlIGdpdCB0cmVlIHRoYXQgcmVseSBvbg0KPiB0aGF0
IHdvdWxkIG5lZWQgdG8gYmUgYWRqdXN0ZWQgdG8gdGhlIG5ldyBkaXJlY3RvcnkuIEJ1dCBt
YXliZSB0aGF0IGNhbg0KPiBiZSBkb25lIGluIGEgZm9sbG93dXAgcGF0Y2ggYXMgaXQgd291
bGQgaGVscCB3aXRoIHJldmVydGluZyBpdCBpZiB0aGUNCj4gdGFyZ2V0cyBhcmUgYWN0dWFs
bHkgdXNlZnVsLg0KDQpJJ2xsIHJlbW92ZSB0aG9zZS4NCg0KPiANCj4gDQo+IEluIGFueSBj
YXNlLCB0aGUgcGF0Y2ggaXMgYWxyZWFkeSBnb29kOg0KPiBBY2tlZC1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQoNClRoYW5rcywNCg0KSnVlcmdl
bg0KDQo=
--------------w5vRfPOuPvc0qfDRu9DK2Pa0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------w5vRfPOuPvc0qfDRu9DK2Pa0--

--------------Cb52yfbrUwjjo0B0F00frywm--

--------------unbuT9EIY144VzHm0EYOK6fd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTjgIEFAwAAAAAACgkQsN6d1ii/Ey8A
Iwf5AY/GTLPZlVkNj3gYO6QfBqCzPezV7f8LBNxxV/06HkBknunWRQSrivGIHU5MZUQ7pUuRwtul
HtbeGSPuaFTTVHxdELVqm3LqUh19WaIIXcTcPmEDG7LTAUyh4GmkF/avwRiEiJmD2rkrys1kHux9
MtLFTn3iCPjktrZCFrz87T9J5FAyHeX3u+5h3AgGPrFhLtr6CY+TqvjrqBVfRvKnRzFmFZG/c1Vi
VzwRwxQ27e91LhuXTEom8hJAT+DG8KpYMbsFQzQtnt5U07R4kjAWjuFVfLQlRx+1y4GJMr8tYUb5
/s9bQtWPbVgUycjSIQbWJhYf6M5+2yHzVCE6l4g9Xw==
=6pP3
-----END PGP SIGNATURE-----

--------------unbuT9EIY144VzHm0EYOK6fd--

