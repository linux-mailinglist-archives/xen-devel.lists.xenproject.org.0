Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6B68B9FF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490253.758899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyey-0002uA-KB; Mon, 06 Feb 2023 10:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490253.758899; Mon, 06 Feb 2023 10:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyey-0002rc-GQ; Mon, 06 Feb 2023 10:23:40 +0000
Received: by outflank-mailman (input) for mailman id 490253;
 Mon, 06 Feb 2023 10:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pOyew-0002pV-9f
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:23:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1806d8-a608-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 11:23:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3941860594;
 Mon,  6 Feb 2023 10:23:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 130BE138E8;
 Mon,  6 Feb 2023 10:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y/RVAybV4GMJDwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Feb 2023 10:23:34 +0000
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
X-Inumbo-ID: 4f1806d8-a608-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675679014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eGuanfrf0A3kzUhMN7lYsuKZW6Zk7dcW6JQI09EEc7E=;
	b=NvBgQUREx2mV11XQLWf0Gb8PzOBQ9OqzGwl8Qb7vUu+Z31/hXKBMFgXd7heDTEFWwji4pX
	j/sCo7cSve/4FXqQlP3RElJd3WirHlBy5AI2+K62FYBczkslE/RT1SCDRYf6EfORPwpWbs
	gafktPBan309XRMi70mwZMBfNgeeAYY=
Message-ID: <3ba95dd4-36f7-334e-0b03-56fa2bc0cbb3@suse.com>
Date: Mon, 6 Feb 2023 11:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-6-jgross@suse.com>
 <20230206094032.se33a5z3kzfauywg@begin>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5/7] Mini-OS: add 9pfs transport layer
In-Reply-To: <20230206094032.se33a5z3kzfauywg@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bc4x9tYfP8tMKt8xWp0H1ECW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bc4x9tYfP8tMKt8xWp0H1ECW
Content-Type: multipart/mixed; boundary="------------xP67I5Wz0d9SdgXgy6oP56QB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <3ba95dd4-36f7-334e-0b03-56fa2bc0cbb3@suse.com>
Subject: Re: [PATCH 5/7] Mini-OS: add 9pfs transport layer
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-6-jgross@suse.com>
 <20230206094032.se33a5z3kzfauywg@begin>
In-Reply-To: <20230206094032.se33a5z3kzfauywg@begin>

--------------xP67I5Wz0d9SdgXgy6oP56QB
Content-Type: multipart/mixed; boundary="------------ex1d1W3yAyV40Lsc7SfLXea8"

--------------ex1d1W3yAyV40Lsc7SfLXea8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDIuMjMgMTA6NDAsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgdmVuLiAwMyBmw6l2ci4gMjAyMyAxMDoxODowNyArMDEwMCwgYSBlY3JpdDoN
Cj4+ICsvKg0KPj4gKyAqIFVzaW5nIGFuIG9wcG9ydHVuaXN0aWMgYXBwcm9hY2ggZm9yIHJl
Y2VpdmluZyBkYXRhOiBpbiBjYXNlIG11bHRpcGxlDQo+PiArICogcmVxdWVzdHMgYXJlIG91
dHN0YW5kaW5nICh3aGljaCBpcyB2ZXJ5IHVubGlrZWx5KSwgd2UgbmV2ZXJ0aGVsZXNzIG5l
ZWQNCj4+ICsgKiB0byBjb25zdW1lIGFsbCBkYXRhIGF2YWlsYWJsZSB1bnRpbCB3ZSByZWFj
aCB0aGUgZGVzaXJlZCByZXF1ZXN0Lg0KPj4gKyAqIEZvciByZXF1ZXN0cyBvdGhlciB0aGFu
IHRoZSBvbmUgd2UgYXJlIHdhaXRpbmcgZm9yLCB3ZSBsaW5rIHRoZSBjb21wbGV0ZQ0KPj4g
KyAqIGRhdGEgdG8gdGhlIHJlcXVlc3QgdmlhIGFuIGludGVybWVkaWF0ZSBidWZmZXIuIEZv
ciBvdXIgb3duIHJlcXVlc3Qgd2UgY2FuDQo+PiArICogb21pdCB0aGF0IGJ1ZmZlciBhbmQg
ZGlyZWN0bHkgZmlsbCB0aGUgY2FsbGVyIHByb3ZpZGVkIHZhcmlhYmxlcy4NCj4+ICsgKi8N
Cj4gDQo+IFRoaXMgZG9jdW1lbnRzIHRoZSAid2h5IiB3aGljaCBpcyB2ZXJ5IHdlbGNvbWUs
IGJ1dCBkb2VzIG5vdCBkb2N1bWVudA0KPiB3aGF0IHRoZSBmdW5jdGlvbiBkb2VzIGV4YWN0
bHkgKEFJVUksIGNvcHkgZnJvbSBidWYxK2J1ZjIgaW50byB0YXJnZXQgdXANCj4gdG8gbGVu
IGJ5dGVzLCBhbmQgdXBkYXRlIGJ1Zi9sZW4gYWNjb3JkaW5nbHkpLg0KDQpPa2F5LCB3aWxs
IGFkZCBzb21lIG1vcmUgY29tbWVudHMuDQoNCj4gDQo+PiArc3RhdGljIHZvaWQgY29weV9i
dWZzKHVuc2lnbmVkIGNoYXIgKipidWYxLCB1bnNpZ25lZCBjaGFyICoqYnVmMiwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpsZW4xLCB1bnNpZ25lZCBpbnQg
KmxlbjIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnRhcmdldCwgdW5zaWdu
ZWQgaW50IGxlbikNCj4+ICt7DQo+PiArICAgIGlmICggbGVuIDw9ICpsZW4xICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgbWVtY3B5KHRhcmdldCwgKmJ1ZjEsIGxlbik7DQo+PiArICAg
ICAgICAqYnVmMSArPSBsZW47DQo+PiArICAgICAgICAqbGVuMSAtPSBsZW47DQo+PiArICAg
IH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBtZW1jcHkodGFyZ2V0
LCAqYnVmMSwgKmxlbjEpOw0KPj4gKyAgICAgICAgdGFyZ2V0ID0gKGNoYXIgKil0YXJnZXQg
KyAqbGVuMTsNCj4+ICsgICAgICAgIGxlbiAtPSAqbGVuMTsNCj4+ICsgICAgICAgICpidWYx
ID0gKmJ1ZjI7DQo+PiArICAgICAgICAqbGVuMSA9ICpsZW4yOw0KPj4gKyAgICAgICAgKmJ1
ZjIgPSBOVUxMOw0KPj4gKyAgICAgICAgKmxlbjIgPSAwOw0KPj4gKyAgICAgICAgaWYgKCBs
ZW4gPiAqbGVuMSApDQo+PiArICAgICAgICAgICAgbGVuID0gKmxlbjE7DQo+IA0KPiBCdXQg
dGhlbiB0aGlzIGlzIGEgc2hvcnQgY29weSwgZG9uJ3Qgd2UgbmVlZCB0byBlcnJvciBvdXQs
IG9yIGF0IGxlYXN0DQo+IGxvZyBzb21ldGhpbmc/IE5vcm1hbGx5IHRoZSBvdGhlciBlbmQg
aXMgbm90IHN1cHBvc2VkIHRvIHB1c2ggZGF0YQ0KPiBpbmNyZW1lbnRhbHksIGJ1dCBiZXR0
ZXIgYXQgbGVhc3QgY2F0Y2ggc3VjaCBtaXNwcm9ncmFtbWluZy4NCg0KSSBjYW4gYWRkIGEg
bG9nIG1lc3NhZ2UuDQoNCj4gDQo+PiArICAgICAgICBtZW1jcHkodGFyZ2V0LCAqYnVmMSwg
KmxlbjEpOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHJjdl85
cF9jb3B5KHN0cnVjdCBkZXZfOXBmcyAqZGV2LCBzdHJ1Y3QgcmVxICpyZXEsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHA5X2hlYWRlciAqaGRyLCBjb25zdCBjaGFy
ICpmbXQsIHZhX2xpc3QgYXApDQo+IA0KPiBQbGVhc2UgZG9jdW1lbnQgd2hhdCB0aGlzIGhl
bHBlciBmdW5jdGlvbiBkb2VzIChhdCB0aGUgdmVyeSBsZWFzdCB3aGljaA0KPiB3YXkgdGhl
IGNvcHkgaGFwcGVucykuIFRoZSBoZHIgIT0gTlVMTCB2cyA9PSBOVUxMIG5vdGFibHkgbmVl
ZHMgdG8gYmUNCj4gZXhwbGFpbmVkLg0KDQpPa2F5Lg0KDQo+IA0KPj4gKyAgICAgICAgY2Fz
ZSAnUSc6DQo+PiArICAgICAgICAgICAgcXZhbCA9IHZhX2FyZyhhcCwgdWludDhfdCAqKTsN
Cj4+ICsgICAgICAgICAgICBjb3B5X2J1ZnMoJmJ1ZjEsICZidWYyLCAmbGVuMSwgJmxlbjIs
IHF2YWwsIDEzKTsNCj4gDQo+IEknZCBzYXkgbWFrZSB0aGlzIDEzIGEgbWFjcm8uDQoNCk9r
YXkuDQoNCj4gDQo+IA0KPj4gK3N0YXRpYyB2b2lkIHJjdl85cChzdHJ1Y3QgZGV2XzlwZnMg
KmRldiwgc3RydWN0IHJlcSAqcmVxLCBjb25zdCBjaGFyICpmbXQsIC4uLikNCj4+ICt7DQo+
PiArICAgIHZhX2xpc3QgYXA7DQo+PiArDQo+PiArICAgIHZhX3N0YXJ0KGFwLCBmbXQpOw0K
Pj4gKw0KPj4gKyAgICBkb3duKCZkZXYtPnJpbmdfaW5fc2VtKTsNCj4+ICsNCj4+ICsgICAg
d2hpbGUgKCAhcmN2XzlwX29uZShkZXYsIHJlcSwgZm10LCBhcCkgKTsNCj4+ICsNCj4+ICsg
ICAgcm1iKCk7IC8qIFJlYWQgYWxsIGRhdGEgYmVmb3JlIHVwZGF0aW5nIHJpbmcgaW5kZXgu
ICovDQo+PiArICAgIGRldi0+aW50Zi0+aW5fY29ucyA9IGRldi0+Y29uc19wdnRfaW47DQo+
IA0KPiBTaG91bGRuJ3QgdGhlcmUgYmUgYW4gZXZlbnQgbm90aWZpY2F0aW9uIGFmdGVyIHVw
ZGF0aW5nIHRoZSBjb25zdW1wdGlvbg0KPiBpbmRleD8NCg0KSG1tLCB5ZXMuDQoNCg0KSnVl
cmdlbg0K
--------------ex1d1W3yAyV40Lsc7SfLXea8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ex1d1W3yAyV40Lsc7SfLXea8--

--------------xP67I5Wz0d9SdgXgy6oP56QB--

--------------Bc4x9tYfP8tMKt8xWp0H1ECW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPg1SUFAwAAAAAACgkQsN6d1ii/Ey92
qgf7BfSpL1a3P5Fg0ErbMeHBESKFsN0h+VmbP/vkfxIKhDG9aEiA3nDMrJCWexGqFosGUnyj0MVe
EEgM8Smv+KzWG4GtERoOx28RyVpnfe3DOIj2iMx2//H1mJtEq/HsLnFS2goHjyv12H8A0Eok5j1q
fWQJpIq/SKTHjEhZDT6BnxUJSfLWILIZb6s493jXHdB2kkBDN5JLdVXcCPxx/t23XziKqX37ofJe
PRZZjJNyVv0FrZ+o9uGn/pn/yOAzhie27HzS4dOOHG/FicU5737HuVgah+dRngc/cs3oMO5k+urm
umZO3I7T5mMu0kHwk4dgTRV8dJGGDGSKekc7f6RKmQ==
=hbgf
-----END PGP SIGNATURE-----

--------------Bc4x9tYfP8tMKt8xWp0H1ECW--

