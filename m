Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66168B9A7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490234.758862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyWk-0000Th-6H; Mon, 06 Feb 2023 10:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490234.758862; Mon, 06 Feb 2023 10:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyWk-0000Qf-1u; Mon, 06 Feb 2023 10:15:10 +0000
Received: by outflank-mailman (input) for mailman id 490234;
 Mon, 06 Feb 2023 10:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pOyWi-0007eF-FH
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:15:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffd585c-a607-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 11:15:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4B3760593;
 Mon,  6 Feb 2023 10:15:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FE57138E8;
 Mon,  6 Feb 2023 10:15:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6RqtJSjT4GPhBwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Feb 2023 10:15:04 +0000
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
X-Inumbo-ID: 1ffd585c-a607-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675678504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=24gc4b4kCjRbILk7EM18yr6i0qc8TwuEJDtNvQq1DTI=;
	b=WqLogXlgn7rBLXX+UWzkByzhDaH848BkHiyK0JaBs0ynVmisYXzik2VE1SZ7n6UW8lRM1g
	LyGshCRc6mxg9RIyCqxWsfEwfXfSl3c9MoG0N+6HEcxdojxhdrNqpQwV76CRRJ4o0031mK
	AaJMKo/n0LKSjaoymOJSUAiMMwnzrCA=
Message-ID: <466e1389-4691-f444-4792-4f5a4a3c7847@suse.com>
Date: Mon, 6 Feb 2023 11:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-7-jgross@suse.com>
 <20230206100545.xice46pygaoh53bf@begin>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
In-Reply-To: <20230206100545.xice46pygaoh53bf@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8ZbwYTaDRyDJ8fqLn06001jE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8ZbwYTaDRyDJ8fqLn06001jE
Content-Type: multipart/mixed; boundary="------------n06Dc1QYBkwAe02blN1wVy2I";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <466e1389-4691-f444-4792-4f5a4a3c7847@suse.com>
Subject: Re: [PATCH 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-7-jgross@suse.com>
 <20230206100545.xice46pygaoh53bf@begin>
In-Reply-To: <20230206100545.xice46pygaoh53bf@begin>

--------------n06Dc1QYBkwAe02blN1wVy2I
Content-Type: multipart/mixed; boundary="------------S3fzr0NNhVvsK6Ixi4OndRVK"

--------------S3fzr0NNhVvsK6Ixi4OndRVK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDIuMjMgMTE6MDUsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgdmVuLiAwMyBmw6l2ci4gMjAyMyAxMDoxODowOCArMDEwMCwgYSBlY3JpdDoN
Cj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IGdldF9maWQoc3RydWN0IGRldl85cGZzICpkZXYp
DQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgZmlkOw0KPj4gKw0KPj4gKyAgICBmaWQg
PSBmZnMoZGV2LT5maWRfbWFzayk7DQo+PiArICAgIGlmICggZmlkICkNCj4+ICsgICAgICAg
IGRldi0+ZmlkX21hc2sgJj0gMVVMTCA8PCAoZmlkIC0gMSk7DQo+IA0KPiBJc24ndCB0aGF0
IG1pc3NpbmcgYSB+ID8NCg0KT2gsIGluZGVlZC4NCg0KPiANCj4+IEBAIC00NTksNiArNTIy
LDEzNCBAQCBzdGF0aWMgaW50IHA5X2F0dGFjaChzdHJ1Y3QgZGV2XzlwZnMgKmRldikNCj4+
ICAgICAgIHJldHVybiByZXQ7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIGludCBwOV9j
bHVuayhzdHJ1Y3QgZGV2XzlwZnMgKmRldiwgdWludDMyX3QgZmlkKQ0KPj4gK3sNCj4+ICsg
ICAgc3RydWN0IHJlcSAqcmVxID0gZ2V0X2ZyZWVfcmVxKGRldik7DQo+PiArICAgIGludCBy
ZXQ7DQo+PiArDQo+PiArICAgIGlmICggIXJlcSApDQo+PiArICAgICAgICByZXR1cm4gRU5P
RU5UOw0KPiANCj4gUmF0aGVyIEVBR0FJTj8gKGFuZCBzaW1pbGFyIGluIG90aGVyIGZ1bmN0
aW9ucykNCj4gKGFjdHVhbGx5IHA5X3ZlcnNpb24gYW5kIHA5X2F0dGFjaCBjb3VsZCBiZSB1
cGRhdGVkIHRvbywgZXZlbiBpZiBpbg0KPiB0aGVpciBjYXNlIGl0J3Mgbm90IHN1cHBvc2Vk
IHRvIGhhcHBlbi4NCg0KWWVzLCBtaWdodCBiZSBiZXR0ZXIuDQoNCj4gDQo+PiArICAgIHJl
cS0+Y21kID0gUDlfQ01EX0NMVU5LOw0KPj4gKyAgICBzZW5kXzlwKGRldiwgcmVxLCAiVSIs
IGZpZCk7DQo+PiArICAgIHJjdl85cChkZXYsIHJlcSwgIiIpOw0KPj4gKyAgICByZXQgPSBy
ZXEtPnJlc3VsdDsNCj4+ICsNCj4+ICsgICAgcHV0X2ZyZWVfcmVxKGRldiwgcmVxKTsNCj4+
ICsNCj4+ICsgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+IA0KPiANCj4+ICtzdGF0aWMgdW5z
aWduZWQgaW50IHNwbGl0X3BhdGgoY29uc3QgY2hhciAqcGF0aG5hbWUsIGNoYXIgKipzcGxp
dF9wdHIpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgcGFydHMgPSAxOw0KPj4gKyAg
ICBjaGFyICpwOw0KPj4gKw0KPj4gKyAgICAqc3BsaXRfcHRyID0gc3RyZHVwKHBhdGhuYW1l
KTsNCj4+ICsNCj4+ICsgICAgZm9yICggcCA9IHN0cmNocigqc3BsaXRfcHRyLCAnLycpOyBw
OyBwID0gc3RyY2hyKHAgKyAxLCAnLycpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgKnAg
PSAwOw0KPj4gKyAgICAgICAgcGFydHMrKzsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBy
ZXR1cm4gcGFydHM7DQo+PiArfQ0KPiANCj4gRG8gd2UgbmVlZCB0byBjYXJlIGFib3V0IGFu
IGVtcHR5IHBhcnQgaWYgd2UncmUgcGFzc2VkICIvZm9vLy9iYXIiPw0KDQpJJ2QgcmF0aGVy
IGFkZCBhIGNoZWNrIGZvciB0aGUgZmlsZSBuYW1lIHRvIGJlIHByb3Blcmx5IGNhbm9uaWNh
bGl6ZWQNCmZ1cnRoZXIgdXAgaW4gdGhlIGhpZXJhcmNoeSAoZWl0aGVyIGluIG9wZW4oKSBk
aXJlY3RseSwgb3IgaW4gb3Blbl85cGZzKCkpLg0KDQo+IA0KPj4gICBzdGF0aWMgaW50IG9w
ZW5fOXBmcyhzdHJ1Y3QgbW91bnRfcG9pbnQgKm1udCwgY29uc3QgY2hhciAqcGF0aG5hbWUs
IGludCBmbGFncywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgbW9kZV90IG1vZGUpDQo+
PiAgIHsNCj4+IC0gICAgZXJybm8gPSBFTk9TWVM7DQo+PiArICAgIGludCBmZDsNCj4+ICsg
ICAgY2hhciAqcGF0aCA9IE5VTEw7DQo+PiArICAgIGNoYXIgKnA7DQo+PiArICAgIHN0cnVj
dCBmaWxlICpmaWxlOw0KPj4gKyAgICBzdHJ1Y3QgZmlsZV85cGZzICpmOXBmczsNCj4+ICsg
ICAgdWludDE2X3QgbndhbGs7DQo+PiArICAgIHVpbnQ4X3Qgb21vZGU7DQo+PiArICAgIGlu
dCByZXQ7DQo+PiArDQo+PiArICAgIGY5cGZzID0gY2FsbG9jKDEsIHNpemVvZigqZjlwZnMp
KTsNCj4+ICsgICAgZjlwZnMtPmRldiA9IG1udC0+ZGV2Ow0KPj4gKyAgICBmOXBmcy0+Zmlk
ID0gUDlfUk9PVF9GSUQ7DQo+PiArDQo+PiArICAgIGZkID0gYWxsb2NfZmQoZnR5cGVfOXBm
cyk7DQo+PiArICAgIGZpbGUgPSBnZXRfZmlsZV9mcm9tX2ZkKGZkKTsNCj4+ICsgICAgZmls
ZS0+ZmlsZWRhdGEgPSBmOXBmczsNCj4+ICsNCj4+ICsgICAgc3dpdGNoICggZmxhZ3MgJiBP
X0FDQ01PREUgKQ0KPj4gKyAgICB7DQo+PiArICAgIGNhc2UgT19SRE9OTFk6DQo+PiArICAg
ICAgICBvbW9kZSA9IFA5X09SRUFEOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIGNh
c2UgT19XUk9OTFk6DQo+PiArICAgICAgICBvbW9kZSA9IFA5X09XUklURTsNCj4+ICsgICAg
ICAgIGJyZWFrOw0KPj4gKyAgICBjYXNlIE9fUkRXUjoNCj4+ICsgICAgICAgIG9tb2RlID0g
UDlfT1JEV1I7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsgICAgZGVmYXVsdDoNCj4+ICsg
ICAgICAgIHJldCA9IEVJTlZBTDsNCj4+ICsgICAgICAgIGdvdG8gZXJyOw0KPj4gKyAgICB9
DQo+IFsuLi5dDQo+PiArIGVycjoNCj4+ICsgICAgZnJlZShwYXRoKTsNCj4+ICsgICAgY2xv
c2UoZmQpOw0KPj4gKyAgICBlcnJubyA9IHJldDsNCj4gDQo+IFRoaXMgc2VlbXMgbWlzc2lu
ZyBmcmVlKGY5cGZzKT8NCg0KY2xvc2UoKSBkb2VzIHRoYXQgdmlhIGNsb3NlXzlwZnMoKS4N
Cg0KDQpKdWVyZ2VuDQoNCg==
--------------S3fzr0NNhVvsK6Ixi4OndRVK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------S3fzr0NNhVvsK6Ixi4OndRVK--

--------------n06Dc1QYBkwAe02blN1wVy2I--

--------------8ZbwYTaDRyDJ8fqLn06001jE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPg0ygFAwAAAAAACgkQsN6d1ii/Ey8Y
fQf/fL7x9heXbEJBL48tSCXTW6OYw7jEzQOiizt5WRR0+/lm93CySveo90odsVzZXKI+s5gi78ft
NyKLQvw+N594qURTcW1a+6f6O8cVRXC9x3CVC1OiwjgFMES3zJQ3D9FoxL2gMGNLSoyPY+fl8ekN
IOwEfoGB7weTgKf3upcttULmIA6dX3lSmZbQQb8tNCrDLJ75WL5f0cdzkzvOscIcNkz4bdNE3jZw
Zsc8DPKoJWXg9lMaER/W9ks/GhgW5NVf9wGEEwnQuJLfCQeECn1rxa1G5qficMjz0hPMuG/FlyWT
UfNABn4wOItpOuRTYfB16NK4OkCBQz1e4qBIoxwdqQ==
=aPHh
-----END PGP SIGNATURE-----

--------------8ZbwYTaDRyDJ8fqLn06001jE--

