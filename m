Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD1649426
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 13:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458899.716608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4LEf-000801-9d; Sun, 11 Dec 2022 12:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458899.716608; Sun, 11 Dec 2022 12:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4LEf-0007xu-5e; Sun, 11 Dec 2022 12:15:13 +0000
Received: by outflank-mailman (input) for mailman id 458899;
 Sun, 11 Dec 2022 12:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4LEd-0007x3-JM
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 12:15:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 736e24df-794d-11ed-8fd2-01056ac49cbb;
 Sun, 11 Dec 2022 13:15:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 300D035334;
 Sun, 11 Dec 2022 12:15:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F16A91376E;
 Sun, 11 Dec 2022 12:15:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3D1rOcrJlWOGEQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 11 Dec 2022 12:15:06 +0000
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
X-Inumbo-ID: 736e24df-794d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670760907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=0/65jsHiJnNkwjkY49Ge2ZmtQq4CjJ+RG5OmMB+oBl8=;
	b=YK7Hyy+53fF/Odhxe9+wlnIW7kf97AhZjWfMVAPOSi3dr6ognVLCkOn63XC4jRCn8kRsa+
	uGWSLbDh/Mr5u6zMXgPheathpLQs7Atqt79Gn/p568bNG0fYGLOHQWhK6hFYnuo5lKV99I
	YTa+bNBXX3Qo1ac7vBqshkkq6YX5G0E=
Message-ID: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>
Date: Sun, 11 Dec 2022 13:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>
Cc: kasan-dev <kasan-dev@googlegroups.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
Subject: kfence_protect_page() writing L1TF vulnerable PTE
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZRUJdiEHFWPIctjasAeGHXyx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZRUJdiEHFWPIctjasAeGHXyx
Content-Type: multipart/mixed; boundary="------------PxzJOsklqGZLVS2TT8Wt8wCw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>
Cc: kasan-dev <kasan-dev@googlegroups.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Message-ID: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>
Subject: kfence_protect_page() writing L1TF vulnerable PTE

--------------PxzJOsklqGZLVS2TT8Wt8wCw
Content-Type: multipart/mixed; boundary="------------09GL24rRcr6QqZBnCeKOoI7R"

--------------09GL24rRcr6QqZBnCeKOoI7R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RHVyaW5nIHRlc3RzIHdpdGggUXViZXNPUyBhIHByb2JsZW0gd2FzIGZvdW5kIHdoaWNoIHNl
ZW1lZCB0byBiZSByZWxhdGVkDQp0byBrZmVuY2VfcHJvdGVjdF9wYWdlKCkgd3JpdGluZyBh
IEwxVEYgdnVsbmVyYWJsZSBwYWdlIHRhYmxlIGVudHJ5IFsxXS4NCg0KTG9va2luZyBpbnRv
IHRoZSBmdW5jdGlvbiBJJ20gc2VlaW5nOg0KDQoJc2V0X3B0ZShwdGUsIF9fcHRlKHB0ZV92
YWwoKnB0ZSkgJiB+X1BBR0VfUFJFU0VOVCkpOw0KDQpJIGRvbid0IHRoaW5rIHRoaXMgY2Fu
IGJlIGNvcnJlY3QsIGFzIGtlZXBpbmcgdGhlIFBGTiB1bm1vZGlmaWVkIGFuZA0KanVzdCBy
ZW1vdmluZyB0aGUgX1BBR0VfUFJFU0VOVCBiaXQgaXMgd3JvbmcgcmVnYXJkaW5nIEwxVEYu
DQoNClRoZXJlIHNob3VsZCBiZSBhdCBsZWFzdCB0aGUgaGlnaGVzdCBQRk4gYml0IHNldCBp
biBvcmRlciB0byBiZSBMMVRGDQpzYWZlLg0KDQoNCkp1ZXJnZW4NCg0KWzFdOiBodHRwczov
L2dpdGh1Yi5jb20vUXViZXNPUy9xdWJlcy1pc3N1ZXMvaXNzdWVzLzc5MzUNCg==
--------------09GL24rRcr6QqZBnCeKOoI7R
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------09GL24rRcr6QqZBnCeKOoI7R--

--------------PxzJOsklqGZLVS2TT8Wt8wCw--

--------------ZRUJdiEHFWPIctjasAeGHXyx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOVycoFAwAAAAAACgkQsN6d1ii/Ey92
2Qf/TgMVuqQDkxg9jaeTZpkEDD0D9gh/np1oEiIpQHpvyGZdwlbCuYlEIn6f3VmlF9W4q3JVS1r0
Px1zaKCsHOvxWw2e3cv2ZZEgs6WTX881bdJBvWWxvuYmim2sHZ7QvSgL+5jJFfTjpWhpa262swie
7uglGNyp0dKhH8Mh2BdUxRQ2PYRyccgqMpjPL+Y9ZkkCIo3rsMrqXi1l7bE/rD72kBrAUj2Vh0Ci
US/qhHbN+9vrn6oRWq7YGMsEk08HMQ3gjOut9HaWhSKybSL/P3SKhdjzJNwX421RKsL8EsVL85Pk
EgMWHlecPEnEK+nnZJ/9cjMumELnMVD7umvlHvVsKQ==
=Hl4S
-----END PGP SIGNATURE-----

--------------ZRUJdiEHFWPIctjasAeGHXyx--

