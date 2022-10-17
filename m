Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432D600745
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 09:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424133.671345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okKDq-0001It-KB; Mon, 17 Oct 2022 07:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424133.671345; Mon, 17 Oct 2022 07:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okKDq-0001Fq-GS; Mon, 17 Oct 2022 07:07:38 +0000
Received: by outflank-mailman (input) for mailman id 424133;
 Mon, 17 Oct 2022 07:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qIJJ=2S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1okKDo-0001Fe-Kd
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 07:07:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6014e15a-4dea-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 09:07:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB268225E8;
 Mon, 17 Oct 2022 07:07:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0B7A13398;
 Mon, 17 Oct 2022 07:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LS1KLTb/TGN3bgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 17 Oct 2022 07:07:34 +0000
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
X-Inumbo-ID: 6014e15a-4dea-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665990454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nQWbV7dO/f2Ds+mzbc1CPb/Q/HnPyC/nUshCSTjfA7Q=;
	b=i6parxQi0WD1x3prQGQmwYRGOeCpqX/4q98IyhOqunc9dkE1tk5+EUsZZCs/EUrUvifQzW
	6+zKuyes22DFvvcG6F/HgeQdDOplUNwmWH/wFxvI1YMk/6bXrKoGC1WKKc+03ky23ssDBR
	W41GYNVgF10wcuNtB/AEKzk+5t8nlnE=
Message-ID: <4907e079-0001-dbc6-dbfc-ee737882fc4c@suse.com>
Date: Mon, 17 Oct 2022 09:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: jbeulich@suse.com, xen-devel@lists.xenproject.org,
 JESHWANTHKUMAR.NK@amd.com
References: <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Subject: Re: privcmd.c not calling set_phys_to_machine
In-Reply-To: <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RYqb83ORAVnLa2hZ9SVFf6PQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RYqb83ORAVnLa2hZ9SVFf6PQ
Content-Type: multipart/mixed; boundary="------------qxAfc9fn6JjaOdIpkrrK0eY7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: jbeulich@suse.com, xen-devel@lists.xenproject.org,
 JESHWANTHKUMAR.NK@amd.com
Message-ID: <4907e079-0001-dbc6-dbfc-ee737882fc4c@suse.com>
Subject: Re: privcmd.c not calling set_phys_to_machine
References: <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop>

--------------qxAfc9fn6JjaOdIpkrrK0eY7
Content-Type: multipart/mixed; boundary="------------CFzExf8Cj4r3aK3j2rfsB2J7"

--------------CFzExf8Cj4r3aK3j2rfsB2J7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTAuMjIgMjM6MDQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gSGkgSnVl
cmdlbiBhbmQgYWxsLA0KPiANCj4gSSBhbSB3cml0aW5nIGFnYWluIHRvIGFzayBhIHF1ZXN0
aW9uIGFib3V0IHByaXZjbWQuYyBpbiBQViBkb20wIHg4Ni4NCj4gVGhpcyBpcyByZWxhdGVk
IHRvIHRoZSBwcmV2aW91cyBwaW5fdXNlcl9wYWdlc19mYXN0IGlzc3VlOg0KPiANCj4gaHR0
cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVsJm09MTY2MjY4OTE0NzI3NjMwDQo+IGh0dHBz
Oi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE2NjMyMjM4NTkxMjA1Mg0KPiANCj4gDQo+
IEluIHN1bW1hcnkgdGhpcyBpcyB0aGUgc2l0dWF0aW9uOg0KPiANCj4gMS4gZG9tVSAoSFZN
KSBrZXJuZWwgc3BhY2U6DQo+ICAgICAgYS4gcGFnZXMgYWxsb2NhdGlvbiB3aXRoIGdldF9m
cmVlX3BhZ2VzKCkNCj4gICAgICBiLiBnZXQgZG1hX2hhbmRsZSBieSBjYWxsaW5nIGRtYV9t
YXBfcGFnZSgpIG9uIHRoZSBwYWdlcyBhbGxvY2F0ZWQgaW4gKDEuYSkNCj4gICAgICBjLiBz
ZW5kIGRtYV9oYW5kbGUgdG8gZG9tMCAoUFYpIHVzaW5nIHZpcnRpbyBxdWV1ZQ0KPiANCj4g
Mi4gZG9tMCB1c2Vyc3BhY2UgKFFFTVUpOg0KPiAgICAgICAgICBhLiByZWFkIGRtYV9oYW5k
bGUgZnJvbSB2aXJ0aW8gcXVldWUNCj4gICAgICAgICAgYi4gbWFwIGRtYV9oYW5kbGUgdXNp
bmcgUUVNVSBkbWFfbWVtb3J5X21hcCgpLCB3aGljaCBjYWxscw0KPiAgICAgICAgICAgICB4
ZW5mb3JlaWdubWVtb3J5X21hcDIsIHdoaWNoIGlzIElPQ1RMX1BSSVZDTURfTU1BUEJBVENI
X1YyLA0KPiAgICAgICAgICAgICB3aGljaCBlbmRzIHVwIGNhbGxpbmcgZHJpdmVycy94ZW4v
cHJpdmNtZC5jOnByaXZjbWRfaW9jdGxfbW1hcF9iYXRjaA0KPiAgICAgICAgICAgICBbdGhp
cyBpcyB2ZXJpZmllZCB0byB3b3JrIGNvcnJlY3RseSwgdGhlIG1hcHBpbmcgd29ya3NdDQo+
ICAgICAgICAgIGMuIG9wZW4gL2Rldi90ZWUgbm9kZSBhbmQgbWFrZSBhbiBpb2N0bCBjYWxs
IHRvIHJlZ2lzdGVyIHRoZQ0KPiAgICAgICAgICAgICB2aXJ0dWFsIGFkZHJlc3MgKGZyb20g
c3RlcCAyLmIpIHdpdGggVEVFLg0KPiANCj4gMy4gZG9tMCBrZXJuZWwgc3BhY2U6DQo+ICAg
ICAgICAgIGEuIEFNRCBURUUgZHJpdmVyIGdldCB0aGUgdmlydHVhbCBhZGRyZXNzIHBhc3Nl
ZCBieSB1c2Vyc3BhY2UNCj4gICAgICAgICAgYi4gQU1EIFRFRSBkcml2ZXIgZ2V0IHRoZSBs
aXN0IG9mIHBhZ2VzIGNvcnJlc3BvbmRpbmcgdG8gdGhlDQo+ICAgICAgICAgICAgIHZpcnR1
YWwgYWRkcmVzcyAoMy5hKSBhbmQgY2FsbHMgZG1hX21hcF9wYWdlKCkgb24gdGhlbQ0KDQpJ
J20gcmF0aGVyIHN1cmUgIkFNRCBURUUgZHJpdmVyIGdldCB0aGUgbGlzdCBvZiBwYWdlcyBj
b3JyZXNwb25kaW5nIHRvIHRoZQ0KdmlydHVhbCBhZGRyZXNzIiBpcyB0aGUgcHJvYmxlbS4g
VGhlIFBURXMgc2hvdWxkIGhhdmUgdGhlICJzcGVjaWFsIiBmbGFnDQpzZXQsIG1lYW5pbmcg
dGhhdCB0aGVyZSBpcyBubyBzdHJ1Y3QgcGFnZSBhc3NvY2lhdGVkIHdpdGggdGhpcyB2aXJ0
dWFsIGFyZWEuDQoNCj4gVGhlIGxhc3Qgc3RlcCAoMy5iKSBtaXNiZWhhdmVzIGFzIGRldl9h
ZGRyIGF0IHRoZSBiZWdpbm5pbmcgb2YNCj4geGVuX3N3aW90bGJfbWFwX3BhZ2UgKHdoaWNo
IGltcGxlbWVudHMgZG1hX21hcF9wYWdlKCkgaW4gZG9tKSkgaXMgMC4NCj4gDQo+ICAgIGRt
YV9hZGRyX3QgZGV2X2FkZHIgPSB4ZW5fcGh5c190b19kbWEoZGV2LCBwaHlzKTsNCj4gICAg
LyogZGV2X2FkZHIgaGVyZSBpcyB6ZXJvICovDQo+IA0KPiANCj4gQ291bGQgaXQgYmUgdGhh
dCB0aGUgb3JpZ2luYWwgbWFwcGluZyBvZiB0aGUgZm9yZWlnbiBwYWdlcyBpbiBEb20wLCBk
b25lDQo+IGJ5IHN0ZXAgMi5iLCBpcyBub3QgY29tcGxldGU/IExvb2tpbmcgaW50bw0KPiBw
cml2Y21kX2lvY3RsX21tYXBfYmF0Y2gsIGZvciBQViBndWVzdHMsIGl0IGlzIGNhbGxpbmcg
bW1hcF9iYXRjaF9mbjoNCj4gDQo+IAlCVUdfT04odHJhdmVyc2VfcGFnZXNfYmxvY2sobS5u
dW0sIHNpemVvZih4ZW5fcGZuX3QpLA0KPiAJCQkJICAgICZwYWdlbGlzdCwgbW1hcF9iYXRj
aF9mbiwgJnN0YXRlKSk7DQo+IA0KPiBtbWFwX2JhdGNoX2ZuIGNhbGxzIHhlbl9yZW1hcF9k
b21haW5fZ2ZuX2FycmF5LCB3aGljaCBjYWxscw0KPiB4ZW5fcmVtYXBfcGZuLg0KPiANCj4g
eGVuX3JlbWFwX3BmbiBvbmx5IGNoYW5nZXMgdGhlIFZBLT5QQSBtYXBwaW5nIGFuZCBkb2Vz
IG5vdGhpbmcgZWxzZS4NCj4gU3BlY2lmaWNhbGx5LCBub2JvZHkgc2VlbXMgdG8gY2FsbCBz
ZXRfcGh5c190b19tYWNoaW5lIGluIHRoaXMgY29kZQ0KPiBwYXRoLiBJc24ndCBzZXRfcGh5
c190b19tYWNoaW5lIHJlcXVpcmVkPw0KDQpOb3QgZm9yIHNwZWNpYWwgbWVtb3J5IHBhZ2Vz
Lg0KDQo+IERvbid0IHdlIG5lZWQgYSBjYWxsIHRvIHNldF9waHlzX3RvX21hY2hpbmUgc28g
dGhhdCB0aGUgbmV4dCB0aW1lIGENCj4gZHJpdmVyIHRyaWVzIHRvIGNhbGw6DQo+IA0KPiAg
ICAvKiBhZGRyZXNzIGlzIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcGFzc2VkIGJ5IFFFTVUgdXNl
cnNwYWNlICovDQo+ICAgIGRtYV9tYXBfcGFnZSh2aXJ0X3RvX3BhZ2UoYWRkcmVzcykpDQo+
IA0KPiBpdCB3aWxsIGJlaGF2ZSBjb3JyZWN0bHk/IE9yIGFtIEkgbWlzc2luZyBzb21ldGhp
bmc/DQo+IA0KPiANCj4gSG93IGlzIHhlbl9waHlzX3RvX2RtYSBleHBlY3RlZCB0byB3b3Jr
IGNvcnJlY3RseSBmb3I6DQo+IA0KPiAgICAvKiBhZGRyZXNzIGlzIHRoZSB2aXJ0dWFsIGFk
ZHJlc3MgcGFzc2VkIGJ5IFFFTVUgdXNlcnNwYWNlIGFuZCBtYXBwZWQNCj4gICAgICogaW4g
Mi5iICovDQo+ICAgIHBoeXNfYWRkciA9IHZpcnRfdG9fcGh5cyhhZGRyZXNzKTsNCj4gICAg
eGVuX3BoeXNfdG9fZG1hKGRldiwgcGh5c19hZGRyKTsNCj4gDQo+IA0KPiBNeSBndWVzcyB3
b3VsZCBiZSB0aGF0IHdlIG5lZWQgdG8gYWRkOg0KPiANCj4gICAgc2V0X3BoeXNfdG9fbWFj
aGluZShwZm4sIEZPUkVJR05fRlJBTUUobWZuKSk7DQo+IA0KPiBpbiBtbWFwX2JhdGNoX2Zu
IG9yIHhlbl9yZW1hcF9wZm4/DQoNCkkgdGhpbmsgdGhpcyBtaWdodCBiZSBhIGxpdHRsZSBi
aXQgbW9yZSBjb21wbGljYXRlZC4NCg0KVGhpcyBjb3VsZCB3b3JrLCBpZiB0aGVyZSBpcyBy
ZWFsbHkgYSBzdHJ1Y3QgcGFnZSBhdmFpbGFibGUgZm9yIHRoZSBQRk4uDQpPVE9IIHRoaXMg
bWlnaHQgYmUgbm90IHRoZSBjYXNlIHF1aXRlIG9mdGVuLCBhcyB3ZSBhcmUgdXNpbmcgem9u
ZSBkZXZpY2UNCm1lbW9yeSBmb3IgZm9yZWlnbiBtYXBwaW5ncyBwZXIgZGVmYXVsdCBmb3Ig
c29tZSB0aW1lIG5vdy4NCg0KU29sdmluZyB0aGlzIG1pZ2h0IHJlcXVpcmUgc29tZXRoaW5n
IGxpa2UgZG1hX21hcF9wZm4oKSBpbnN0ZWFkIG9mDQpkbWFfbWFwX3BhZ2UoKSwgd2hpY2gg
c291bmRzIGEgbGl0dGxlIGJpdCBsaWtlIGRtYV9kaXJlY3RfbW1hcCgpLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------CFzExf8Cj4r3aK3j2rfsB2J7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CFzExf8Cj4r3aK3j2rfsB2J7--

--------------qxAfc9fn6JjaOdIpkrrK0eY7--

--------------RYqb83ORAVnLa2hZ9SVFf6PQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNM/zYFAwAAAAAACgkQsN6d1ii/Ey+g
UwgAkeN0SYgJkBog5nzIlrdh/sI14PXIHal9BHTsATZ8W9HYe+BjcpCaLPZXJQTotthO7R1vSWVb
foi+JU8u+0KBJ7v5XCQKJO1t5NeJow0fh6RZC7qa0dKSKDR+hzotlLi0OjSFzCDwzLD0E+kJlm2M
TEiRIUezw/Gqa8kAEKAp5kOk8tZsM/bMAmQ3sSZSbr4S1jO/xt9khTZknP4zS2KtGUBCoju8Fi/5
aayYk+dfIh3hebikpKEITRiiIIRSWEi7rnN9Po8mZFCaSpymd81Ee6UbByDAD7WJ34MLQDr0y+DX
WBhLI4zJcodW18bH0OX73GGAUoulOkP38zDOyFpLHA==
=zugx
-----END PGP SIGNATURE-----

--------------RYqb83ORAVnLa2hZ9SVFf6PQ--

