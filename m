Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FB371269C
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 14:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540112.841612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WZe-00055Q-Vi; Fri, 26 May 2023 12:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540112.841612; Fri, 26 May 2023 12:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WZe-00052z-T2; Fri, 26 May 2023 12:29:38 +0000
Received: by outflank-mailman (input) for mailman id 540112;
 Fri, 26 May 2023 12:29:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xi8L=BP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q2WZd-00052r-VA
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 12:29:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9e6b288-fbc0-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 14:29:36 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F10A321B33;
 Fri, 26 May 2023 12:29:35 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B9FC6134AB;
 Fri, 26 May 2023 12:29:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id zLRpKy+mcGQ1WAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 26 May 2023 12:29:35 +0000
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
X-Inumbo-ID: f9e6b288-fbc0-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685104175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwjcmuagLfOHSWG0LiIoiDu9YlO+nsSe2Nz9n6SGCS0=;
	b=rCCOrHUhD58lG93TowQiKzFXAJl9OQOgFzen9QaDterYVrWTcNgBL6TVLBCQDSXGoWXUPv
	HO9M2/VQhjW2d9qhAsD+giDTAHdRqZhH+l1W7lduTGHtoLvlPHpfugRphcyc3XxLC1xCbk
	Tum53QqzTiKHoxe8tXy1jIxTPCNyZb4=
Message-ID: <6e83b70e-a3a5-d11f-c0ea-fb0c5f0c0829@suse.com>
Date: Fri, 26 May 2023 14:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH] tools/xenstore: remove deprecated parameter from
 xenstore commands help
To: =?UTF-8?Q?Cyril_R=c3=a9bert?= <slack@rabbit.lu>,
 xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <47cbac6bcf8f454b47bc6430c101f064a5623261.1685041564.git.slack@rabbit.lu>
Content-Language: en-US
In-Reply-To: <47cbac6bcf8f454b47bc6430c101f064a5623261.1685041564.git.slack@rabbit.lu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wcf7RH3Pc0cME6RJcl0dOAgc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wcf7RH3Pc0cME6RJcl0dOAgc
Content-Type: multipart/mixed; boundary="------------n5mvIR6liUv90bJsSbK43Q0S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Cyril_R=c3=a9bert?= <slack@rabbit.lu>,
 xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6e83b70e-a3a5-d11f-c0ea-fb0c5f0c0829@suse.com>
Subject: Re: [XEN PATCH] tools/xenstore: remove deprecated parameter from
 xenstore commands help
References: <47cbac6bcf8f454b47bc6430c101f064a5623261.1685041564.git.slack@rabbit.lu>
In-Reply-To: <47cbac6bcf8f454b47bc6430c101f064a5623261.1685041564.git.slack@rabbit.lu>

--------------n5mvIR6liUv90bJsSbK43Q0S
Content-Type: multipart/mixed; boundary="------------KSZlhZ4E2rwQyhmRzNiIE0mB"

--------------KSZlhZ4E2rwQyhmRzNiIE0mB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDUuMjMgMjE6MDYsIEN5cmlsIFLDqWJlcnQgd3JvdGU6DQo+IENvbXBsZXRpbmcg
Y29tbWl0IGM2NTY4N2UgKCJ0b29scy94ZW5zdG9yZTogcmVtb3ZlIHNvY2tldC1vbmx5IG9w
dGlvbiBmcm9tIHhlbnN0b3JlIGNsaWVudCIpLg0KPiBBcyB0aGUgc29ja2V0LW9ubHkgb3B0
aW9uICgtcykgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBYZW5zdG9yZSBhY2Nlc3MgY29t
bWFuZHMgKHhlbnN0b3JlLSopLA0KPiBhbHNvIHJlbW92ZSB0aGUgcGFyYW1ldGVyIGZyb20g
dGhlIGNvbW1hbmRzIGhlbHAgKHhlbnN0b3JlLSogLWgpLg0KPiANCj4gU3VnZ2VzdGVkLWJ5
OiBZYW5uIERpcnNvbiA8eWFubi5kaXJzb25AdmF0ZXMuZnI+DQo+IFNpZ25lZC1vZmYtYnk6
IEN5cmlsIFLDqWJlcnQgPHNsYWNrQHJhYmJpdC5sdT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------KSZlhZ4E2rwQyhmRzNiIE0mB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KSZlhZ4E2rwQyhmRzNiIE0mB--

--------------n5mvIR6liUv90bJsSbK43Q0S--

--------------Wcf7RH3Pc0cME6RJcl0dOAgc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRwpi8FAwAAAAAACgkQsN6d1ii/Ey/o
ZQgAnCXBIohKM9ALfeQfamwssAohKGyC+/u7MV0wsbQQLoQixFRX6cbgk/6vxclSl5OsOUVIFLw1
PgCJo0T8IKwISQCMEYBaMina86T6sQ+2SNlCNsJsBhBwq7kyVQbxFmtbDAUkXYCKbhvNXrPiSd12
w7bh8Y9hiVtOcA6BFnqntmIvJJTjpOhsPu4f1jIKsn/NhU8ce+xz92m0n6uSIH/Ho2cXdpYXmcZY
ER2E3SDe/HHarUkPHcv4HIsgmOdhiM9wm1XjVujUHkrwtCe8GMg7E1G0Bgc4dHv+kKU+YwYNrP1G
FBUFguX6BSVqnzXyCDSdWAXFYU4C0EFT/Y7SJD8l/g==
=Prr3
-----END PGP SIGNATURE-----

--------------Wcf7RH3Pc0cME6RJcl0dOAgc--

