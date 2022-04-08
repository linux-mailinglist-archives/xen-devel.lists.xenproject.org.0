Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF894F9323
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301351.514289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclzY-0001PL-Gc; Fri, 08 Apr 2022 10:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301351.514289; Fri, 08 Apr 2022 10:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclzY-0001MF-Cs; Fri, 08 Apr 2022 10:37:24 +0000
Received: by outflank-mailman (input) for mailman id 301351;
 Fri, 08 Apr 2022 10:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx0l=US=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nclzX-0000aA-0g
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:37:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df5a035b-b727-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:37:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAAA21F861;
 Fri,  8 Apr 2022 10:37:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B051132B9;
 Fri,  8 Apr 2022 10:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6Q5YIGEQUGJjYwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 08 Apr 2022 10:37:21 +0000
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
X-Inumbo-ID: df5a035b-b727-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649414241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzY6e9FDGSdD+Ov6uU4u4SnAC0ql/VbLnal17jJ5tbc=;
	b=N5YybeliQp0Oa/gjLfVooNtQabYCr0PI2Mpx501CBZ4qHwyYmDiy+GzSfQ6Wg3e00jNxQj
	UhedkNGv94FDc9tSWZFjhjeju8/EnN1tND3P9XbTa8thWg3Eo2miFRvVU9SF0uSIlEL1/j
	PG7MV2gzwQDCgG3fes3m4NL5qoSfEEw=
Message-ID: <795479a7-4bc7-3538-373f-1ae79bfc27de@suse.com>
Date: Fri, 8 Apr 2022 12:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
In-Reply-To: <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WPYb6qRMuhoPAByKX06WUwcR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WPYb6qRMuhoPAByKX06WUwcR
Content-Type: multipart/mixed; boundary="------------QXab3Ts7nGmiLyzqjZMxNXLn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <795479a7-4bc7-3538-373f-1ae79bfc27de@suse.com>
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
In-Reply-To: <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>

--------------QXab3Ts7nGmiLyzqjZMxNXLn
Content-Type: multipart/mixed; boundary="------------Fir2hz04VniXn9UV0TVDV0Yc"

--------------Fir2hz04VniXn9UV0TVDV0Yc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDQuMjIgMTE6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wNC4yMDIy
IDEwOjQ1LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gQEAgLTEwNiw2ICsxMDYsOCBAQCBz
dHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gew0KPj4gICAgICAgLyogUGVyLXZDUFUg
YnVmZmVyIHNpemUgaW4gYnl0ZXMuICAwIHRvIGRpc2FibGUuICovDQo+PiAgICAgICB1aW50
MzJfdCB2bXRyYWNlX3NpemU7DQo+PiAgIA0KPj4gKyAgICB1aW50MzJfdCBjcHVwb29sX2lk
Ow0KPiANCj4gVGhpcyBjb3VsZCBkbyB3aXRoIGEgY29tbWVudCBleHBsYWluaW5nIGRlZmF1
bHQgYmVoYXZpb3IuIEluIHBhcnRpY3VsYXINCj4gSSB3b25kZXIgd2hhdCAwIG1lYW5zOiBM
b29raW5nIGF0IGNwdXBvb2xfZGVzdHJveSgpIEkgY2FuJ3Qgc2VlIHRoYXQgaXQNCj4gd291
bGQgYmUgaW1wb3NzaWJsZSB0byBkZWxldGUgcG9vbCAwIChidXQgdGhlcmUgbWF5IG9mIGNv
dXJzZSBiZQ0KPiByZWFzb25zIGVsc2V3aGVyZSwgZS5nLiBwcmV2ZW50aW5nIHBvb2wgMCB0
byBldmVyIGdvIGVtcHR5KSAtIErDvHJnZW4/DQoNClllcywgSSB0aGluayBkZXN0cm95aW5n
IG9mIGNwdXBvb2wgMCBpbiBhIGRvbTBsZXNzIHN5c3RlbSBzaG91bGQgYmUNCnByb2hpYml0
ZWQsIGFzc3VtaW5nIHRoZXJlIGlzIGEgY29udHJvbCBkb21haW4gYmVpbmcgYWJsZSB0byBk
ZXN0cm95DQphIGNwdXBvb2wgaW4gYSBkb20wbGVzcyBzeXN0ZW0uDQoNCk1haW4gcmVhc29u
IGlzIHRoYXQgY3B1cG9vbCAwIGhhcyBhIHNwZWNpYWwgcm9sZSBlLmcuIGR1cmluZyBkb21h
aW4NCmRlc3RydWN0aW9uIChzZWUgZG9tYWluX2tpbGwoKSkgYW5kIGZvciBjcHUgaG90cGx1
ZyBvcGVyYXRpb25zLg0KDQoNCkp1ZXJnZW4NCg0K
--------------Fir2hz04VniXn9UV0TVDV0Yc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Fir2hz04VniXn9UV0TVDV0Yc--

--------------QXab3Ts7nGmiLyzqjZMxNXLn--

--------------WPYb6qRMuhoPAByKX06WUwcR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJQEGAFAwAAAAAACgkQsN6d1ii/Ey/E
twf/djZMvyq02pvicvrk0xFreUrEPSS9Bt3kE/sdrMwjtobDwLgtYUQYGHmfBKbEugnFqfSgw7x0
xwGJslm8DmbBXVKX5SuYlfAgvg0H79DS81ES3E5yXyTlUBO7122IAY4wdvQfxcY3fiC3W2Z/51us
0ffT38RSUGltZFxcwoJ7If/xgTfK5zgP6HxLzXsyWU7NfvONLv/04D7CGbPZX1pBDwUEnrOuNCtq
J4QeQyOp7LtOoKQ0SIRLazsSLg/VPysNS/qL2qTyLdFWm38mIaXOfzoTii5ZcZNIZidzMuRfiZqU
lEcc3Xx5MJsddaJEcCoDxdAijDnxUgccSB1VwFupGg==
=1AX6
-----END PGP SIGNATURE-----

--------------WPYb6qRMuhoPAByKX06WUwcR--

