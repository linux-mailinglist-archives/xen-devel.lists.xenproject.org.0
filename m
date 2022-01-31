Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7A4A3E01
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 07:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262739.455101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEQbE-00053g-MI; Mon, 31 Jan 2022 06:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262739.455101; Mon, 31 Jan 2022 06:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEQbE-00051q-Ik; Mon, 31 Jan 2022 06:55:40 +0000
Received: by outflank-mailman (input) for mailman id 262739;
 Mon, 31 Jan 2022 06:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FCUt=SP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nEQbC-00051g-Le
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 06:55:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca974fcc-8262-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 07:55:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C591321106;
 Mon, 31 Jan 2022 06:55:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A60B13A89;
 Mon, 31 Jan 2022 06:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fJbFH+eH92G3OgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 31 Jan 2022 06:55:35 +0000
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
X-Inumbo-ID: ca974fcc-8262-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643612135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFT3Hsh41/MkYuoQcFNE+EdwhVpNW/hkpzCZ5Hi6cw0=;
	b=AVY6mMbJwvpM6GVEyOLIg39Socf1CxIaPSt2OG7TN3crwAqaRy0KY2/R99oiMh0yMijMjO
	fleTKtfebLQBs5Y1HKfvKB2hyC+6bY7WUtoRQCaXT1mEmeGyeGEI/+1MRJRnv63EUEH+xn
	NAog8BS5mSIuxoERF1ZCSek4/IhQSe4=
Message-ID: <3d62ec12-2324-7e73-3056-c5bc99b957a1@suse.com>
Date: Mon, 31 Jan 2022 07:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220130192305.14523-1-rdunlap@infradead.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: update missing ioctl magic numers documentation
In-Reply-To: <20220130192305.14523-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g8743Sae7tkk4pE605o1Lsct"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g8743Sae7tkk4pE605o1Lsct
Content-Type: multipart/mixed; boundary="------------pCekiswIMRoEKRejfVehkXLD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <3d62ec12-2324-7e73-3056-c5bc99b957a1@suse.com>
Subject: Re: [PATCH] xen: update missing ioctl magic numers documentation
References: <20220130192305.14523-1-rdunlap@infradead.org>
In-Reply-To: <20220130192305.14523-1-rdunlap@infradead.org>

--------------pCekiswIMRoEKRejfVehkXLD
Content-Type: multipart/mixed; boundary="------------CnnIMBXRvI0jJ3YalqvaP09U"

--------------CnnIMBXRvI0jJ3YalqvaP09U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjIgMjA6MjMsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gQWRkIG1pc3Npbmcg
aW9jdGwgIm1hZ2ljIG51bWJlcnMiIGZvciB2YXJpb3VzIFhlbiBpbnRlcmZhY2VzDQo+ICh4
ZW5idXNfZGV2LmgsIGdudGFsbG9jLmgsIGdudGRldi5oLCBhbmQgcHJpdmNtZC5oKS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pg0KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4N
Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiAtLS0NCj4gICBEb2N1bWVudGF0aW9uL3VzZXJzcGFj
ZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdCB8ICAgIDMgKysrDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gLS0tIGxpbnV4LW5leHQtMjAyMjAxMjgu
b3JpZy9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJz
dA0KPiArKysgbGludXgtbmV4dC0yMDIyMDEyOC9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1h
cGkvaW9jdGwvaW9jdGwtbnVtYmVyLnJzdA0KPiBAQCAtMTE1LDYgKzExNSw3IEBAIENvZGUg
IFNlcSMgICAgSW5jbHVkZSBGaWxlDQo+ICAgJ0InICAgMDAtMUYgIGxpbnV4L2NjaXNzX2lv
Y3RsLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhDQo+
ICAgJ0InICAgMDAtMEYgIGluY2x1ZGUvbGludXgvcG11LmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uZmxpY3QhDQo+ICAgJ0InICAgQzAtRkYgIGFkdmFuY2Vk
IGJidXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPG1haWx0
bzptYWFzc2VuQHVuaS1mcmVpYnVyZy5kZT4NCj4gKydCJyAgIDAwLTBGICB4ZW4veGVuYnVz
X2Rldi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0
IQ0KDQpIbW0sIHNob3VsZG4ndCB4ZW5idXNfZGV2LmggYmUgbW92ZWQgdG8gaW5jbHVkZS91
YXBpL3hlbiA/DQoNCj4gICAnQycgICBhbGwgICAgbGludXgvc291bmRjYXJkLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCENCj4gICAnQycgICAw
MS0yRiAgbGludXgvY2FwaS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25mbGljdCENCj4gICAnQycgICBGMC1GRiAgZHJpdmVycy9uZXQvd2FuL2Nv
c2EuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCENCj4gQEAg
LTEzNCw2ICsxMzUsNyBAQCBDb2RlICBTZXEjICAgIEluY2x1ZGUgRmlsZQ0KPiAgICdGJyAg
IDgwLThGICBsaW51eC9hcmNmYi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbmZsaWN0IQ0KPiAgICdGJyAgIEREICAgICB2aWRlby9zc3RmYi5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0IQ0KPiAg
ICdHJyAgIDAwLTNGICBkcml2ZXJzL21pc2Mvc2dpLWdydS9ncnVsaWIuaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbmZsaWN0IQ0KPiArJ0UnICAgMDAtMEYgIHhlbi9nbnRhbGxv
Yy5oLCB4ZW4vZ250ZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3Qh
DQoNClNob3VsZCBiZSAnRycgSU1PLg0KDQo+ICAgJ0gnICAgMDAtN0YgIGxpbnV4L2hpZGRl
di5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3Qh
DQo+ICAgJ0gnICAgMDAtMEYgIGxpbnV4L2hpZHJhdy5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uZmxpY3QhDQo+ICAgJ0gnICAgMDEgICAgIGxpbnV4
L21laS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
ZmxpY3QhDQo+IEBAIC0xNzYsNiArMTc4LDcgQEAgQ29kZSAgU2VxIyAgICBJbmNsdWRlIEZp
bGUNCj4gICAnUCcgICA2MC02RiAgc291bmQvc3NjYXBlX2lvY3RsLmggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCENCj4gICAnUCcgICAwMC0wRiAgZHJp
dmVycy91c2IvY2xhc3MvdXNibHAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25mbGljdCENCj4gICAnUCcgICAwMS0wOSAgZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90
ZXN0LmMgICAgICAgICAgICAgICAgICAgICAgICBjb25mbGljdCENCj4gKydQJyAgIDAwLTBG
ICB4ZW4vcHJpdmNtZC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbmZsaWN0IQ0KPiAgICdRJyAgIGFsbCAgICBsaW51eC9zb3VuZGNhcmQuaA0KPiAg
ICdSJyAgIDAwLTFGICBsaW51eC9yYW5kb20uaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbmZsaWN0IQ0KPiAgICdSJyAgIDAxICAgICBsaW51eC9yZmtp
bGwuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZsaWN0
IQ0KPiANCg0KDQpKdWVyZ2VuDQo=
--------------CnnIMBXRvI0jJ3YalqvaP09U
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CnnIMBXRvI0jJ3YalqvaP09U--

--------------pCekiswIMRoEKRejfVehkXLD--

--------------g8743Sae7tkk4pE605o1Lsct
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH3h+YFAwAAAAAACgkQsN6d1ii/Ey82
4Qf8DgZtGF97JAINa3w+08acVkoOpIpEmTRSS+xbNnlDrZPwVZcp0TACyBDPPt0wHICRBomZnb9h
qhZhorC2/78Hte0k6HI2m/0lkjw7yOL2igH1etpKJ1hXd4INjoKLYkjtBFazfeuu0jhOeeXJ5JRj
hH0oM25gIn+0570MhaLNU1LdyaXuj7KaGDvNlOpsp+cR2WyUqGMe4ePgXYoNgHL6fu6pfZfy8IGu
B70M+P5y0XjRJ3dMU7gxEDx7gHEtTdGegR3FRaBs2QcgcZ7iIK6ZKjLHBbF8vyI7pXMa8aZWpNxj
3SJeQXk36I0hw5H/VVZZd2xvV92JEygrteRN21aPFg==
=y4mY
-----END PGP SIGNATURE-----

--------------g8743Sae7tkk4pE605o1Lsct--

