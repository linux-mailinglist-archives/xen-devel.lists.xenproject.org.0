Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB27EAA8E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 07:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632137.986189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2mzk-0008OS-P7; Tue, 14 Nov 2023 06:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632137.986189; Tue, 14 Nov 2023 06:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2mzk-0008MJ-M8; Tue, 14 Nov 2023 06:33:56 +0000
Received: by outflank-mailman (input) for mailman id 632137;
 Tue, 14 Nov 2023 06:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2mzj-0008MD-R0
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 06:33:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7b9eb78-82b7-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 07:33:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B7521F86A;
 Tue, 14 Nov 2023 06:33:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E18AE13460;
 Tue, 14 Nov 2023 06:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C2X0M9AUU2X0PgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 06:33:52 +0000
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
X-Inumbo-ID: c7b9eb78-82b7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699943633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k6QTjfUFTpoT978p6PzP6vOdCl6WBd/iPQvFHBIevDc=;
	b=YxOzzuGoS8HM5yNJiPkxgZFlYKrbwaclgr+zd4aeyWFlmJM82PHeztk+C5+lAZLdv9984x
	y5rItFX4LxDAMNF7lB/sly6MA5l1dGckH4aLU2dztZiOTtBt+2ykGOXMHxh3gmTHDA68tz
	8AJvGUrtc9LUzy3TflAhRYeEL5QoHpc=
Message-ID: <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
Date: Tue, 14 Nov 2023 07:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
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
In-Reply-To: <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------imFyG014sEQHQqTqd0ATM29f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------imFyG014sEQHQqTqd0ATM29f
Content-Type: multipart/mixed; boundary="------------okXNYjy4eT60YzntXzNtE0Bx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
In-Reply-To: <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>

--------------okXNYjy4eT60YzntXzNtE0Bx
Content-Type: multipart/mixed; boundary="------------QnbmOHVJdxvVsR6zuzwVNudH"

--------------QnbmOHVJdxvVsR6zuzwVNudH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjMgMjM6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBX
aGVuIHJ1bm5pbmcgYXMgc3R1YmRvbSwgbWFwIHRoZSBzdHViZG9tJ3MgWGVuc3RvcmUgcmlu
ZyBwYWdlIGluIG9yZGVyDQo+PiB0byBzdXBwb3J0IHVzaW5nIHRoZSA5cGZzIGZyb250ZW5k
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL2NvcmUuY8KgwqAgfMKgIDIgKysN
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9kb21haW4uYyB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5oIHzCoCAxICsNCj4+
IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvY29yZS5jIGIvdG9vbHMveGVu
c3RvcmVkL2NvcmUuYw0KPj4gaW5kZXggYjllYzUwYjM0Yy4uNGE5ZDg3NGYxNyAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0
b3JlZC9jb3JlLmMNCj4+IEBAIC0yOTkxLDYgKzI5OTEsOCBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqYXJndltdKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGx1X3JlYWRfc3RhdGUo
KTsNCj4+IMKgICNlbmRpZg0KPj4gK8KgwqDCoCBzdHViZG9tX2luaXQoKTsNCj4+ICsNCj4+
IMKgwqDCoMKgwqAgY2hlY2tfc3RvcmUoKTsNCj4+IMKgwqDCoMKgwqAgLyogR2V0IHJlYWR5
IHRvIGxpc3RlbiB0byB0aGUgdG9vbHMuICovDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVu
c3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+PiBpbmRleCBm
YTE3ZjY4NjE4Li4xNjJiODdiNDYwIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmVk
L2RvbWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+IEBAIC0z
Nyw2ICszNywxMCBAQA0KPj4gwqAgI2luY2x1ZGUgPHhlbmN0cmwuaD4NCj4+IMKgICNpbmNs
dWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4NCj4+ICsjaWZkZWYgX19NSU5JT1NfXw0KPj4gKyNp
bmNsdWRlIDxtaW5pLW9zL3hlbmJ1cy5oPg0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gwqAgc3Rh
dGljIHhjX2ludGVyZmFjZSAqKnhjX2hhbmRsZTsNCj4+IMKgIHhlbmdudHRhYl9oYW5kbGUg
Kip4Z3RfaGFuZGxlOw0KPj4gwqAgc3RhdGljIGV2dGNobl9wb3J0X3QgdmlycV9wb3J0Ow0K
Pj4gQEAgLTUwMCw2ICs1MDQsMTEgQEAgc3RhdGljIHZvaWQgKm1hcF9pbnRlcmZhY2UoZG9t
aWRfdCBkb21pZCkNCj4+IMKgwqDCoMKgwqAgaWYgKGRvbWlkID09IHhlbmJ1c19tYXN0ZXJf
ZG9taWQoKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4geGVuYnVzX21hcCgpOw0K
Pj4gKyNpZmRlZiBfX01JTklPU19fDQo+PiArwqDCoMKgIGlmIChkb21pZCA9PSBzdHViX2Rv
bWlkKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiB4ZW5zdG9yZV9idWY7DQo+PiArI2Vu
ZGlmDQo+PiArDQo+PiDCoMKgwqDCoMKgIHJldHVybiB4ZW5nbnR0YWJfbWFwX2dyYW50X3Jl
ZigqeGd0X2hhbmRsZSwgZG9taWQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgR05UVEFCX1JFU0VSVkVEX1hFTlNUT1JFLA0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBST1RfUkVB
RHxQUk9UX1dSSVRFKTsNCj4+IEBAIC01MDksNyArNTE4LDcgQEAgc3RhdGljIHZvaWQgdW5t
YXBfaW50ZXJmYWNlKGRvbWlkX3QgZG9taWQsIHZvaWQgKmludGVyZmFjZSkNCj4+IMKgIHsN
Cj4+IMKgwqDCoMKgwqAgaWYgKGRvbWlkID09IHhlbmJ1c19tYXN0ZXJfZG9taWQoKSkNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCB1bm1hcF94ZW5idXMoaW50ZXJmYWNlKTsNCj4+IC3CoMKg
wqAgZWxzZQ0KPj4gK8KgwqDCoCBlbHNlIGlmIChkb21pZCAhPSBzdHViX2RvbWlkKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHhlbmdudHRhYl91bm1hcCgqeGd0X2hhbmRsZSwgaW50ZXJm
YWNlLCAxKTsNCj4+IMKgIH0NCj4+IEBAIC0xMjE0LDYgKzEyMjMsMjIgQEAgdm9pZCBkb20w
X2luaXQodm9pZCkNCj4+IMKgwqDCoMKgwqAgeGVuZXZ0Y2huX25vdGlmeSh4Y2VfaGFuZGxl
LCBkb20wLT5wb3J0KTsNCj4+IMKgIH0NCj4+ICt2b2lkIHN0dWJkb21faW5pdCh2b2lkKQ0K
Pj4gK3sNCj4+ICsjaWZkZWYgX19NSU5JT1NfXw0KPj4gK8KgwqDCoCBzdHJ1Y3QgZG9tYWlu
ICpzdHViZG9tOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAoc3R1Yl9kb21pZCA8IDApDQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4gKw0KPj4gK8KgwqDCoCBzdHViZG9tID0gaW50
cm9kdWNlX2RvbWFpbihOVUxMLCBzdHViX2RvbWlkLCB4ZW5idXNfZXZ0Y2huLCBmYWxzZSk7
DQo+PiArwqDCoMKgIGlmICghc3R1YmRvbSkNCj4+ICvCoMKgwqDCoMKgwqDCoCBiYXJmX3Bl
cnJvcigiRmFpbGVkIHRvIGluaXRpYWxpemUgc3R1YmRvbSIpOw0KPj4gKw0KPj4gK8KgwqDC
oCB4ZW5ldnRjaG5fbm90aWZ5KHhjZV9oYW5kbGUsIHN0dWJkb20tPnBvcnQpOw0KPiANCj4g
SWYgSSBjb21wYXJlIHRvIGludHJvZHVjZV9kb21haW4oKSwgaXQgaXMgbm90IGVudGlyZWx5
IGNsZWFyIHRvIG1lIHdoeSB0aGUgDQo+IG5vdGlmaWNhdGlvbiBpcyBkb25lIHVuY29uZGl0
aW9uYWxseSBoZXJlLiBDYW4geW91IGNsYXJpZnk/DQoNClRoZXJlIGlzIG5vIHJlYXNvbiB0
byBkbyBpdCBjb25kaXRpb25hbGx5LCBhcyB3ZSBjYW4gYmUgc3VyZSB0aGUgZXZlbnQgY2hh
bm5lbA0KaXMgZXhpc3RpbmcgYW5kIHRoZSByaW5nIHBhZ2UgaXMgYWNjZXNzaWJsZS4NCg0K
DQpKdWVyZ2VuDQo=
--------------QnbmOHVJdxvVsR6zuzwVNudH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------QnbmOHVJdxvVsR6zuzwVNudH--

--------------okXNYjy4eT60YzntXzNtE0Bx--

--------------imFyG014sEQHQqTqd0ATM29f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTFNAFAwAAAAAACgkQsN6d1ii/Ey+n
Qwf/Se/FuYow9WDqOxZZ1KrpFLmXvkrqoVT2yz7jvwXfRlBEuRYKyRt04febiq52a/mJCMrRVWOQ
UhZ5B0z3T5CWO5YLRDpEVfgwYjtbmZrIQu74UDx7uuVzkYDVqPkZUzGPWCshyPetBPTO6ftpFUOB
wM1Pdb3x1LsVyxsn5pEW+yl84GCmQRsJKRLVTQRDXNvPvqDBqOaMTui0Xh+kV28ag7kUksbZ0+22
4Ui4sJTLjSWkOR23Bsyj+rb6YnN5xi9hmVrcQFpytzevJGMszbW9ChE/m+YSqrWLE3yV5awSur1o
vGk6D6QIQUfCe8f0f4auwHHKVeRQduBFbZeVPEX6aw==
=fwXj
-----END PGP SIGNATURE-----

--------------imFyG014sEQHQqTqd0ATM29f--

