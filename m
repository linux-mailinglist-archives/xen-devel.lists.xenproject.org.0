Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57864615BAB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 06:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435475.688831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq5z5-0001xa-B8; Wed, 02 Nov 2022 05:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435475.688831; Wed, 02 Nov 2022 05:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq5z5-0001vo-7z; Wed, 02 Nov 2022 05:08:15 +0000
Received: by outflank-mailman (input) for mailman id 435475;
 Wed, 02 Nov 2022 05:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O20d=3C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oq5z4-0001vi-4X
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 05:08:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b83dbb-5a6c-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 06:08:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5ECFF1F381;
 Wed,  2 Nov 2022 05:08:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3015A13A92;
 Wed,  2 Nov 2022 05:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ukZ5Cjz7YWNvMAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Nov 2022 05:08:12 +0000
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
X-Inumbo-ID: 59b83dbb-5a6c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667365692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SHD1rp9a64PHC8EVZ4s5dCxgknbCBnCOQOnHcjubODQ=;
	b=lNjBmPycmiHJoMs+Vx+VnpoTw3hplJW+MjffbXr9kYSgdOkgdi4ipIWE6czmDr4quAIfdS
	sSgXeKhXHb+hmH20En1RnhlhGHzAElrcoHJE4m2htJ/wv8QHJBEoUr5Ql7jcQ292NlcG/R
	/iYrU1uxxjlkPXRAOzt2zsjhrKdHoTk=
Message-ID: <3dd589c2-800c-50e7-c4ef-30e7e0aaeb79@suse.com>
Date: Wed, 2 Nov 2022 06:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and
 XENSTORED_ROOTDIR
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-2-jgross@suse.com>
 <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8BllobqHo6sJt8MnsRTbsXkW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8BllobqHo6sJt8MnsRTbsXkW
Content-Type: multipart/mixed; boundary="------------b0ooxhQCl8NkI0Q11wz3f7aP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Message-ID: <3dd589c2-800c-50e7-c4ef-30e7e0aaeb79@suse.com>
Subject: Re: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and
 XENSTORED_ROOTDIR
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-2-jgross@suse.com>
 <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>
In-Reply-To: <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>

--------------b0ooxhQCl8NkI0Q11wz3f7aP
Content-Type: multipart/mixed; boundary="------------ZalPBB93YlaXmVEQL1JWffzr"

--------------ZalPBB93YlaXmVEQL1JWffzr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjIgMTc6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAxLzExLzIw
MjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBYRU5fTElCX1NUT1JFRCBpcyBz
ZXJ2aW5nIG5vIHJlYWwgcHVycG9zZSwgYXMgaXQgaXMgYSBtb3VudCBwb2ludCBmb3INCj4+
IGEgdG1wZnMsIHNvIGl0IGNhbiBiZSByZXBsYWNlZCBlYXNpbHkgYnkgWEVOX1JVTl9TVE9S
RUQuDQo+Pg0KPj4gWEVOU1RPUkVEX1JPT1RESVIgaXMgYmFzaWNhbGx5IHVudXNlZCBhbHJl
YWR5LCB0aGVyZSBpcyBqdXN0IGEgc2luZ2xlDQo+PiByZWZlcmVuY2UgaW4geHNfZGFlbW9u
X3Jvb3RkaXIoKSB3aXRoIGEgZmFsbGJhY2sgdG8gWEVOX0xJQl9TVE9SRUQsDQo+PiBhbmQg
YSAuZ2RiaW5pdCBmaWxlIHNldHRpbmcgaXQuDQo+Pg0KPj4gUmVtb3ZlIHRoZSAuZ2RiaW5p
dCBmaWxlLCBhcyBpdCBpcyBub3Qga25vd24gaGF2aW5nIGJlZW4gdXNlZCBzaW5jZQ0KPj4g
YWdlcywgYW5kIG1ha2UgeHNfZGFlbW9uX3Jvb3RkaXIoKSBhbiBhbGlhcyBvZiB4c19kYWVt
b25fcnVuZGlyKCkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPiANCj4gRG8gSSBnZXQgYSBSZXF1ZXN0ZWQvUmVwb3J0ZWQtYnk/
DQoNCk9oIHllcywgb2YgY291cnNlLiBEbyB5b3Ugd2FudCBtZSB0byByZXNlbmQgd2l0aCBp
dD8gSSdkIGJlIGZpbmUgd2l0aA0KDQpSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KYWRkZWQgd2hlbiBjb21taXR0aW5nLg0KDQo+
IA0KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCg0KVGhhbmtzLA0KDQpKdWVyZ2VuDQoNCg==
--------------ZalPBB93YlaXmVEQL1JWffzr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZalPBB93YlaXmVEQL1JWffzr--

--------------b0ooxhQCl8NkI0Q11wz3f7aP--

--------------8BllobqHo6sJt8MnsRTbsXkW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNh+zsFAwAAAAAACgkQsN6d1ii/Ey/3
MQgAk+hQ46syfotEamxQ0ghxJrHiyPA7aqC5NDF5n2uAQF+2vresgSC3AmDmVjG1Fy7unS6pTTSc
P6yxhdyrcGlP1/GFO2swro6X/ptgcE1BVKL4X/KrX8z0T1C27KfqKO9CKQi1pgAHx03k3+2EIZSI
CKx/Tj/MnCM+9FyZYPgxe+yBqhdAujF1b32X60aX3O+2heh+gqQ0EPfqg0oyjoQydDrPccWRtxkt
cNoPFs0V5sBWo+MoqOoRWpLInw8cIJW/S8uaodT04ddF5SzEZRJ5bNdlIwWxzDhIve7uU24y/pnz
MteNqrc8ScC2hdE0qbvg3CRYbb1b78sr/dJnxkNOVA==
=kvyV
-----END PGP SIGNATURE-----

--------------8BllobqHo6sJt8MnsRTbsXkW--

