Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BC70C0F1
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537976.837659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16RC-0006l0-AJ; Mon, 22 May 2023 14:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537976.837659; Mon, 22 May 2023 14:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16RC-0006iB-6e; Mon, 22 May 2023 14:23:02 +0000
Received: by outflank-mailman (input) for mailman id 537976;
 Mon, 22 May 2023 14:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRnz=BL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q16RA-0006i5-IV
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:23:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2555ad51-f8ac-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 16:22:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F1821FF55;
 Mon, 22 May 2023 14:22:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B36113336;
 Mon, 22 May 2023 14:22:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GbL6CMB6a2QlHAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 May 2023 14:22:56 +0000
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
X-Inumbo-ID: 2555ad51-f8ac-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684765376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4NNUJ0p3UejTtuJtDpLt5athMDKhxztzYwBpT9sLic=;
	b=HU5egji8GIchdffyRW1XlaC48/Na4pnRvt9yZGj60dlQMxB+mBCkOhAI/WIRlHxbQcmcqM
	5pDED6HXvwVzLzjeQIPBPqPlXrviparTVol/pZUC/stOPmDMen4EEdvDaNao9azmee7Jc4
	jGp5mxdk3XsiO2mINsbTQQ4rAstpvkU=
Message-ID: <e06f42d2-191e-a516-d0d3-8f84c9c79471@suse.com>
Date: Mon, 22 May 2023 16:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] MAINTAINERS: add more xenstore files
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230428132756.8763-1-jgross@suse.com>
 <599f18f9-880a-c016-9e98-4090e135fdf6@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <599f18f9-880a-c016-9e98-4090e135fdf6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5SMXePJ5LDu3v9aKf305CuNY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5SMXePJ5LDu3v9aKf305CuNY
Content-Type: multipart/mixed; boundary="------------jJof0c0WtZLyPk57OlBDW0HX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <e06f42d2-191e-a516-d0d3-8f84c9c79471@suse.com>
Subject: Re: [PATCH] MAINTAINERS: add more xenstore files
References: <20230428132756.8763-1-jgross@suse.com>
 <599f18f9-880a-c016-9e98-4090e135fdf6@suse.com>
In-Reply-To: <599f18f9-880a-c016-9e98-4090e135fdf6@suse.com>

--------------jJof0c0WtZLyPk57OlBDW0HX
Content-Type: multipart/mixed; boundary="------------lefej49ZRXVFMdCJn5vmzwrX"

--------------lefej49ZRXVFMdCJn5vmzwrX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDUuMjMgMTc6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wNC4yMDIz
IDE1OjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gWGVuc3RvcmUgY29uc2lzdHMgb2Yg
bW9yZSBmaWxlcyB0aGFuIGp1c3QgdGhlIHRvb2xzL3hlbnN0b3JlIGRpcmVjdG9yeS4NCj4+
DQo+PiBBZGQgdGhlbSB0byB0aGUgWEVOU1RPUkUgYmxvY2suDQo+Pg0KPj4gU3VnZ2VzdGVk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+
PiAgIE1BSU5UQUlORVJTIHwgNSArKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMNCj4+IGluZGV4IDBlNWViYTIzMTIuLmYyZjE4ODFiMzIgMTAwNjQ0DQo+PiAtLS0gYS9N
QUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+IEBAIC02NTMsNiArNjUzLDEx
IEBAIE06CVdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+PiAgIE06CUp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCj4+ICAgUjoJSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4+ICAgUzoJU3VwcG9ydGVkDQo+PiArRjoJdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3Jl
LWRvbWFpbi5jDQo+PiArRjoJdG9vbHMvaW5jbHVkZS94ZW5zdG9yZS1jb21wYXQvDQo+PiAr
RjoJdG9vbHMvaW5jbHVkZS94ZW5zdG9yZS5oDQo+PiArRjoJdG9vbHMvaW5jbHVkZS94ZW5z
dG9yZV9saWIuaA0KPj4gK0Y6CXRvb2xzL2xpYnMvc3RvcmUvDQo+PiAgIEY6CXRvb2xzL3hl
bnN0b3JlLw0KPiANCj4gSSB3b25kZXIgaWYgYXQgdGhlIHNhbWUgdGltZSB4ZW5zdG9yZSBz
cGVjaWZpYyBpbmNsdWRlIGZpbGVzIHNob3VsZG4ndA0KPiBoYXZlIGJlZW4gcHVyZ2VkIGZy
b20gTElCUy4NCg0KUHJvYmFibHksIHllcy4gSSdsbCBzZW5kIGEgcGF0Y2guDQoNCg0KSnVl
cmdlbg0KDQo=
--------------lefej49ZRXVFMdCJn5vmzwrX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------lefej49ZRXVFMdCJn5vmzwrX--

--------------jJof0c0WtZLyPk57OlBDW0HX--

--------------5SMXePJ5LDu3v9aKf305CuNY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRrer8FAwAAAAAACgkQsN6d1ii/Ey9Z
Agf+LTEmp0N1mzSGVvL1KnipjTSQEzhYJaWZRKRYXX8G9pjJ/Pi8DBHTEHivBhsptSx6SwrYSC+N
FmABEz8RAc5XsXLv8X7LbCbKA1tC4BaZxPZmc2sEK4ALrgf9eUkpKP1asZkLaXC0PfP+0cYKzvpN
A8b9Y0eNXtZ+ljW08iyp+B1jcponHnqVAwPz1j3dZ/+ty2gsNiD35J3JMOZj1Dl6VGTsHwlGzKzb
Tru7/L3kR5sbtqoCANPciHu/NbQuE2LNboKhGz+72IpsKDiGWeNmid1UF1x2ukaojWvfnMGWb+vt
VnDcB2S1UTlpqlVnyaMoWJaQrrgQ+JqKLb7cPVWLDw==
=dMrK
-----END PGP SIGNATURE-----

--------------5SMXePJ5LDu3v9aKf305CuNY--

