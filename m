Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11269690CDB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492586.762195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8nH-0005A8-IK; Thu, 09 Feb 2023 15:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492586.762195; Thu, 09 Feb 2023 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8nH-00057b-FL; Thu, 09 Feb 2023 15:25:03 +0000
Received: by outflank-mailman (input) for mailman id 492586;
 Thu, 09 Feb 2023 15:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iTR=6F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQ8nF-00057T-Jh
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:25:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea294e7f-a88d-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:24:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3DDE21CFF;
 Thu,  9 Feb 2023 15:24:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71F0A1339E;
 Thu,  9 Feb 2023 15:24:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6rxYGkoQ5WMENgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Feb 2023 15:24:58 +0000
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
X-Inumbo-ID: ea294e7f-a88d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675956298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy8Eb2M4P0ITdUmne0PgSM5cwbx56kcFx+hQ500uRd8=;
	b=DmtlvF44HQJpJw6YQo2gpeiiN2vq6E9zpYeSemIEOd5u8ugZ8pWhwjE2SaORZ+0JXDdwP/
	jhrrQRp8Vq5WFaMf25ReHjxbC6sBMdd4mNXbkWzp43q0LXnq3VxRWfHVmf//m2uRinxOwa
	LwTzmFJPvfn6MgJnq6bnBAn5axEXslQ=
Message-ID: <e0da9d10-9329-550d-2efc-0001e8ec8bf6@suse.com>
Date: Thu, 9 Feb 2023 16:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20230209144148.4132-1-jgross@suse.com>
 <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uLAgZPQsSRpGIoAqy4tPAeu0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uLAgZPQsSRpGIoAqy4tPAeu0
Content-Type: multipart/mixed; boundary="------------s3xuugCybWC600gcqKB0C6hJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
Message-ID: <e0da9d10-9329-550d-2efc-0001e8ec8bf6@suse.com>
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
References: <20230209144148.4132-1-jgross@suse.com>
 <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
In-Reply-To: <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>

--------------s3xuugCybWC600gcqKB0C6hJ
Content-Type: multipart/mixed; boundary="------------KGSFDY2i2Td44PPazvwKvCZV"

--------------KGSFDY2i2Td44PPazvwKvCZV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDIuMjMgMTY6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA5LzAyLzIw
MjMgMjo0MSBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEluIGRvY3MvbWlzYy94ZW5z
dG9yZS50eHQgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBYZW5zdG9yZSBub2RlIGFjY2Vzcw0K
Pj4gcGVybWlzc2lvbnMgaXMgbWlzc2luZyBvbmUgaW1wb3J0YW50IGFzcGVjdCwgd2hpY2gg
Y2FuIGJlIGZvdW5kIG9ubHkNCj4+IGluIHRoZSBjb2RlIG9yIGluIHRoZSB3aWtpIFsxXToN
Cj4+DQo+PiBUaGUgZmlyc3QgcGVybWlzc2lvbiBlbnRyeSBpcyBkZWZpbmluZyB0aGUgb3du
ZXIgb2YgdGhlIG5vZGUgdmlhIHRoZQ0KPj4gZG9taWQsIGFuZCB0aGUgYWNjZXNzIHJpZ2h0
cyBmb3IgYWxsIGRvbWFpbnMgTk9UIGhhdmluZyBhIGRlZGljYXRlZA0KPj4gcGVybWlzc2lv
biBlbnRyeS4NCj4+DQo+PiBNYWtlIHRoYXQgYXNwZWN0IGNsZWFyIGluIHRoZSBvZmZpY2lh
bCBkb2N1bWVudGF0aW9uLg0KPj4NCj4+IFsxXTogaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qu
b3JnL3dpa2kvWGVuQnVzI1Blcm1pc3Npb25zDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gSSBmZWVsIGFzIGlmIEVkdmlu
IGRlc2VydmVzIHNvbWUga2luZCBvZiBjcmVkaXQgaGVyZSwgc2VlaW5nIGFzIGl0IHdhcw0K
PiBoaXMgb2JzZXJ2YXRpb24uLi4NCg0KSSB3b3VsZG4ndCBtaW5kLiBXaGF0IGtpbmQgb2Yg
dGFnIHdvdWxkIGJlIGFwcHJvcHJpYXRlPyAiUmVwb3J0ZWQtYnk6Ij8NCg0KDQpKdWVyZ2Vu
DQo=
--------------KGSFDY2i2Td44PPazvwKvCZV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KGSFDY2i2Td44PPazvwKvCZV--

--------------s3xuugCybWC600gcqKB0C6hJ--

--------------uLAgZPQsSRpGIoAqy4tPAeu0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPlEEkFAwAAAAAACgkQsN6d1ii/Ey+G
+wf8CyEInSlHh8FcuKh0nEWx7WFQwTxUFMtDaNIrC3ebs3sZFyvyQuqA4UWt7xpXTQWPfbM+oTW3
9smmcUwejqq7n+03pZ2SJnk8BvzOc51UUPd5GVvQ7HHdj0hI/Gwa7tJ6N2gIniLqUrh51Z/Ovpj3
Gps/3Nb21Wk/WYaNRv8WjG/uMEwp5y+7M3GBFb0yXpKqE7D3+62glppNuTMf/VHJuVkpjtoMXwM8
1suVMO2p26aglv5ohqvwDeFsBL9oGEtqB0bMNHxOR6d1CQGixGoPDHr7sLHwcItKbUjtvTEuik7v
/JpTa5q+z4OssTT9NCjGwe+jDVq/JhLgE5l23hhNUg==
=K9k7
-----END PGP SIGNATURE-----

--------------uLAgZPQsSRpGIoAqy4tPAeu0--

