Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417E5309B6
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 09:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335486.559660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt24t-00038A-S1; Mon, 23 May 2022 07:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335486.559660; Mon, 23 May 2022 07:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt24t-00035E-OU; Mon, 23 May 2022 07:02:07 +0000
Received: by outflank-mailman (input) for mailman id 335486;
 Mon, 23 May 2022 07:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IlF8=V7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nt24r-0002Xc-QP
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 07:02:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 407d7e34-da66-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 09:02:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 539BA21A3D;
 Mon, 23 May 2022 07:02:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CD1F139F5;
 Mon, 23 May 2022 07:02:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MkytBWwxi2LNCwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 23 May 2022 07:02:04 +0000
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
X-Inumbo-ID: 407d7e34-da66-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653289324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/GEqblCgyyxZu7IKBZnxRexD9k9kcO3pe+RXkb4b54=;
	b=hQpd8fXwKc9SriPpIB7ea7ahCTmSYRwIuwUep+DnHNRC490Wu65uMqp5dnbncxJDq72nRv
	+d+HjeiIoMSXUew3mVOA1dnFBDielBt1NVzDNZdy7//sGzl3YvphQrjEntcbmANwswNnkp
	lUSo5YQVgjPLL097H7Zm96aiEU9gl9g=
Message-ID: <2c448474-2a07-599a-8894-44b4e72b2055@suse.com>
Date: Mon, 23 May 2022 09:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] tools/libs/ctrl: rename and export do_memory_op as
 xc_memory_op
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h5V2JjR2HQqgGAUkQOkjrui3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h5V2JjR2HQqgGAUkQOkjrui3
Content-Type: multipart/mixed; boundary="------------yTnZMuVIhnudWQTVrvx1GUZr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2c448474-2a07-599a-8894-44b4e72b2055@suse.com>
Subject: Re: [PATCH v2] tools/libs/ctrl: rename and export do_memory_op as
 xc_memory_op
References: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>
In-Reply-To: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>

--------------yTnZMuVIhnudWQTVrvx1GUZr
Content-Type: multipart/mixed; boundary="------------TnmUb4X15WuVu0XbI5prQnL0"

--------------TnmUb4X15WuVu0XbI5prQnL0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDUuMjIgMTk6MTYsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gTWFrZSB0aGUg
ZG9fbWVtb3J5X29wIGZ1bmN0aW9uIGFjY2Vzc2libGUgdG8gdG9vbHMgbGlua2luZyB3aXRo
IGxpYnhjLg0KPiBTaW1pbGFyIGZ1bmN0aW9ucyBhcmUgYWxyZWFkeSBhdmFpbGFibGUgZm9y
IGJvdGggZG9tY3RsIGFuZCBzeXNjdGwuIEFzIHBhcnQNCj4gb2YgdGhpcyBwYXRjaCB3ZSBh
bHNvIGNoYW5nZSB0aGUgaW5wdXQgJ2NtZCcgdG8gYmUgdW5zaWduZWQgaW50IHRvIGFjY3Vy
YXRlbHkNCj4gcmVmbGVjdCB3aGF0IHRoZSBoeXBlcnZpc29yIGV4cGVjdHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29t
Pg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoN
Ckp1ZXJnZW4NCg==
--------------TnmUb4X15WuVu0XbI5prQnL0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TnmUb4X15WuVu0XbI5prQnL0--

--------------yTnZMuVIhnudWQTVrvx1GUZr--

--------------h5V2JjR2HQqgGAUkQOkjrui3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKLMWsFAwAAAAAACgkQsN6d1ii/Ey9c
FwgAhSoGjce81g121prQrfZ7RCV+4kYh1wsQeCCFuBRqgpxJH76GUZR2VHrigQjH7pcYinDWNXja
PnQPcHAUL8Ixy1nVbh+rgwEpvzbtBK6TdqPS55EUyQta6o09ceOl9PnoTOtuEOSOy2QGxOvNAxf2
xeEVD8Oib9i4yUTnJzN+THg4Yjw1FiidY7j/qOEvSGEPZd04cgorQzG1yCnMvmUzDsXDzF4AuE2p
FtNFenr6ea5HIYMeZkwjopVZoxrZEO8XmwZba8FjJ2Wp4pDISThKCpouh0oZBD7EuqBOqXLe35NR
CJ3nQXJMu8B6Dx7xpNxgI6cEO0Igz3tX+r0N6Tx1Dw==
=+8oa
-----END PGP SIGNATURE-----

--------------h5V2JjR2HQqgGAUkQOkjrui3--

