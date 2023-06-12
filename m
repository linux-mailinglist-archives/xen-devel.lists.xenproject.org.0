Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E972BF06
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546959.854083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8eoQ-0008Mk-5n; Mon, 12 Jun 2023 10:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546959.854083; Mon, 12 Jun 2023 10:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8eoQ-0008Jo-2a; Mon, 12 Jun 2023 10:30:14 +0000
Received: by outflank-mailman (input) for mailman id 546959;
 Mon, 12 Jun 2023 10:30:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SXsF=CA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q8eoO-0008Je-EK
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:30:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b74cd8d-090c-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 12:30:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC24A20462;
 Mon, 12 Jun 2023 10:30:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81284138EC;
 Mon, 12 Jun 2023 10:30:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id or69HbHzhmTxKwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Jun 2023 10:30:09 +0000
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
X-Inumbo-ID: 1b74cd8d-090c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686565809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EwMz3bhQrX5ndWZ2IywtvVFJtsC4vWOMDbAeLaWyMoA=;
	b=WOKzQuyOQFJxYs+VbBMg7EdgZw7Jp3GBpB8FRw8tB7ENsz9LzZh262TPSF4qwn+9HgZLUp
	F6kI1zzkSTJabuzjpOJXZbSKARhbBWJcBAeerHaQfGzt5QX74lyko+YYeRyHZ625rywGF1
	GLc5rjDAbk2mp1jmVaq7cbnAYsqdsuU=
Message-ID: <4a7c772d-7a10-d899-23dc-beacbf2fb9da@suse.com>
Date: Mon, 12 Jun 2023 12:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tools/xenstored: Correct the prototype of
 domain_max_chk()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230612101319.29842-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230612101319.29842-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YGEoEeKDBztvTDiD0ZrM4OUQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YGEoEeKDBztvTDiD0ZrM4OUQ
Content-Type: multipart/mixed; boundary="------------xtX3cSksPtrgd2C32EcMlO1P";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <4a7c772d-7a10-d899-23dc-beacbf2fb9da@suse.com>
Subject: Re: [PATCH] tools/xenstored: Correct the prototype of
 domain_max_chk()
References: <20230612101319.29842-1-julien@xen.org>
In-Reply-To: <20230612101319.29842-1-julien@xen.org>

--------------xtX3cSksPtrgd2C32EcMlO1P
Content-Type: multipart/mixed; boundary="------------fwmET0cWmxhYzTSIt0tyVUl8"

--------------fwmET0cWmxhYzTSIt0tyVUl8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDYuMjMgMTI6MTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IFNvbWUgdmVyc2lvbiBvZiBHQ0Mg
d2lsbCBjb21wbGFpbiBiZWNhdXNlIHRoZSBwcm90b3R5cGUgYW5kIHRoZQ0KPiBkZWNsYXJh
dGlvbiBvZiBkb21haW5fbWF4X2NoaygpIGRvbid0IG1hdGNoOg0KPiANCj4geGVuc3RvcmVk
X2RvbWFpbi5jOjE1MDM6NjogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciAnZG9tYWlu
X21heF9jaGsnIGR1ZSB0byBlbnVtL2ludGVnZXIgbWlzbWF0Y2g7IGhhdmUgJ19Cb29sKGNv
bnN0IHN0cnVjdCBjb25uZWN0aW9uICosIGVudW0gYWNjaXRlbSwgIHVuc2lnbmVkIGludCkn
IFstV2Vycm9yPWVudW0taW50LW1pc21hdGNoXQ0KPiAgIDE1MDMgfCBib29sIGRvbWFpbl9t
YXhfY2hrKGNvbnN0IHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBlbnVtIGFjY2l0ZW0gd2hh
dCwNCj4gICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fg0KPiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20geGVuc3RvcmVkX2RvbWFpbi5jOjMxOg0KPiB4ZW5zdG9yZWRfZG9tYWluLmg6MTQ2
OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mICdkb21haW5fbWF4X2Noaycgd2l0
aCB0eXBlICdfQm9vbChjb25zdCBzdHJ1Y3QgY29ubmVjdGlvbiAqLCB1bnNpZ25lZCBpbnQs
ICB1bnNpZ25lZCBpbnQpJw0KPiAgICAxNDYgfCBib29sIGRvbWFpbl9tYXhfY2hrKGNvbnN0
IHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCB1bnNpZ25lZCBpbnQgd2hhdCwNCj4gICAgICAg
IHwgICAgICBefn5+fn5+fn5+fn5+fg0KPiANCj4gVXBkYXRlIHRoZSBwcm90b3R5cGUgdG8g
bWF0Y2ggdGhlIGRlY2xhcmF0aW9uLg0KPiANCj4gVGhpcyB3YXMgc3BvdHRlZCBieSBHaXRs
YWIgQ0kgd2l0aCB0aGUgam9iIG9wZW5zdXNlLXR1bWJsZXdlZWQtZ2NjLg0KPiANCj4gRml4
ZXM6IDY4NTA0ODQ0MWUxYyAoInRvb2xzL3hlbnN0b3JlOiBzd2l0Y2ggcXVvdGEgbWFuYWdl
bWVudCB0byBiZSB0YWJsZSBiYXNlZCIpDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8amdyYWxsQGFtYXpvbi5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------fwmET0cWmxhYzTSIt0tyVUl8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------fwmET0cWmxhYzTSIt0tyVUl8--

--------------xtX3cSksPtrgd2C32EcMlO1P--

--------------YGEoEeKDBztvTDiD0ZrM4OUQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSG87EFAwAAAAAACgkQsN6d1ii/Ey9L
9Qf/UbjJ9+oHylwqYgw+BdS7tDqAOASAJXv92wnIFV2VubZIHZl7DcGsrR9BGvrnIOR35a+emHwk
aPN9Qxx6GSlsV9+rnqirfIMn4Zm9VOB8sJnEsvoYo+GCKVxj1VfR/gs/y0oL7v7pWyOfuxtUx5wx
Qy5ck3owIbHCI7ZgNz8gAVX8lZ+NhiOzj0d/rq6JxK8xF/nV2PN8a/QbyuM8uAzETe7UYP7tkphp
pUC/1tYBI5VKQEky8mweu08IVYOu2ZCNyDeHVAHglDUH2MxUzv5xtGMDtit9ci7B0peVG2GuVME2
yIUUZ4N36tRRSwFPIj97wV1Yo1qXyJjaPYQsi2QeRQ==
=X9yx
-----END PGP SIGNATURE-----

--------------YGEoEeKDBztvTDiD0ZrM4OUQ--

