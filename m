Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2B4AD0C9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 06:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267528.461269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHJ6s-00083Z-Th; Tue, 08 Feb 2022 05:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267528.461269; Tue, 08 Feb 2022 05:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHJ6s-00080i-Q2; Tue, 08 Feb 2022 05:32:14 +0000
Received: by outflank-mailman (input) for mailman id 267528;
 Tue, 08 Feb 2022 05:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=co3W=SX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHJ6r-00080c-IZ
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 05:32:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77283f77-88a0-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 06:32:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A3E2210F5;
 Tue,  8 Feb 2022 05:32:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31EFB13483;
 Tue,  8 Feb 2022 05:32:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c1TwClsAAmLYAQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Feb 2022 05:32:11 +0000
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
X-Inumbo-ID: 77283f77-88a0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644298331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp8RfcIImegUW97/EwpSKc9/Nx5qsPeExShdbHIc2Yc=;
	b=B0NDypWqDLWXl1iUfICwz6KIpvvXTb1Rsg++VZN2daSOEBbbfSQplwa3t07aFq4A5DR/qz
	48wBjK440kJ9lqCu+rFrDcMghjvJf7nQi3SwH3AFKzMEvXafVX1thKG8MZtH7OmWBhCyJO
	m2ntXl7QEh2hLPy8dQugAEBp9ath5Yc=
Message-ID: <60aa8654-a40f-e5fa-e669-d8fba72a4866@suse.com>
Date: Tue, 8 Feb 2022 06:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220207064147.9585-1-jgross@suse.com>
 <YgFgZADfaoLNor4T@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 0/5] tools: remove include/xen-external directory
In-Reply-To: <YgFgZADfaoLNor4T@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------75mXxfsOLO9kCUlKji3OQXek"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------75mXxfsOLO9kCUlKji3OQXek
Content-Type: multipart/mixed; boundary="------------24rI7c4JOpARgjGI897T2wIY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <60aa8654-a40f-e5fa-e669-d8fba72a4866@suse.com>
Subject: Re: [PATCH v2 0/5] tools: remove include/xen-external directory
References: <20220207064147.9585-1-jgross@suse.com>
 <YgFgZADfaoLNor4T@perard.uk.xensource.com>
In-Reply-To: <YgFgZADfaoLNor4T@perard.uk.xensource.com>

--------------24rI7c4JOpARgjGI897T2wIY
Content-Type: multipart/mixed; boundary="------------Rb9Q2mO73Yr5Agvqc4eP0bTJ"

--------------Rb9Q2mO73Yr5Agvqc4eP0bTJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDIuMjIgMTk6MDksIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBNb24sIEZl
YiAwNywgMjAyMiBhdCAwNzo0MTo0MkFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gVGhlIHRvb2xzL2luY2x1ZGUveGVuLWV4dGVybmFsIGRpcmVjdG9yeSBjb250YWlucyBh
IGhlYWRlciBmaWxlIGZyb20NCj4+IEZyZWVCU0QgdXNlZCB0byBnZW5lcmF0ZSBYZW4gaGVh
ZGVyIGZpbGVzLiBUaGlzIHNlcmllcyBpcyByZXBsYWNpbmcgdGhlDQo+PiBjb21wbGV0ZSBk
aXJlY3RvcnkgYnkgYSBzaW5nbGUgaGVhZGVyIHdpdGggdGhlIHNhbWUgc2VtYW50aWNzLg0K
Pj4NCj4+IENoYW5nZXMgaW4gVjI6DQo+PiAtIHJlbW92ZSBzdGFsZSBjb21tZW50IGluIHBh
dGNoIDENCj4gDQo+IEp1c3QgbmVlZCB0byBmaXggdGhlIGJ1aWxkIG5vdywgb3RoZXJ3aXNl
LCB0aGUgc2VyaWVzIGxvb2tzIGZpbmU6DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC9wYXRjaGV3L3hlbi8tL3BpcGVsaW5lcy80NjQ4MDMwMDcNCj4gXiB4ZW50b29sY29y
ZSBjb252ZXJzaW9uIHNlZW1zIHVuZmluaXNoZWQuDQoNCkhtbSwgd2VpcmQuDQoNClNlZW1z
IEkgZGlkIG9ubHkgYW4gaW5jcmVtZW50YWwgYnVpbGQsIGJ1dCBJIHRoaW5rIGl0IHNob3Vs
ZCBoYXZlIGZhaWxlZA0KbmV2ZXJ0aGVsZXNzLiBJIHN1c3BlY3Qgc29tZXRoaW5nIGlzIHdy
b25nIHdpdGggdGhlIGRlcGVuZGVuY2llcy4NCg0KDQpKdWVyZ2VuDQo=
--------------Rb9Q2mO73Yr5Agvqc4eP0bTJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Rb9Q2mO73Yr5Agvqc4eP0bTJ--

--------------24rI7c4JOpARgjGI897T2wIY--

--------------75mXxfsOLO9kCUlKji3OQXek
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmICAFoFAwAAAAAACgkQsN6d1ii/Ey+7
AAf/d+n92T6hO+MJUdlpImh8AgdfYMYPbwo1oCnzU0178wGq5SyvZEaUIeix5NtOZ1Tp4vUNyoOU
rvHw/Hq2QzO9xxNKCxGkGRmDr2dXLPGKo2RjZBa44GhrWf1eVGeqihD65U+5FrJzwT4pH/gNQVQ9
fstRQQQps6QfS8h2fX3XlIucPSfXuenpttM+JoSOKxzQysSzfTaLY6kh5xTcqEDG/+OYlFkXVjhf
c1aZdR32cDzsJcLXx0czWpMXvuUcJjWmAwdO3K1o2IOzjQxcE3UujlTs+Z45GgQIh8ckmPR81pvb
p9x8RvJUuqGdxsO5uF86eJ8AmUDa93hz97UX+R6DWg==
=KtLY
-----END PGP SIGNATURE-----

--------------75mXxfsOLO9kCUlKji3OQXek--

