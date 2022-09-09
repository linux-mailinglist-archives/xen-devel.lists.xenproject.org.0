Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FC5B3535
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404160.646515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbGm-0003fU-9v; Fri, 09 Sep 2022 10:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404160.646515; Fri, 09 Sep 2022 10:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbGm-0003dT-5v; Fri, 09 Sep 2022 10:29:56 +0000
Received: by outflank-mailman (input) for mailman id 404160;
 Fri, 09 Sep 2022 10:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWbGk-0003dN-OO
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:29:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 577ced62-302a-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 12:29:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F04F122967;
 Fri,  9 Sep 2022 10:29:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D66BD139D5;
 Fri,  9 Sep 2022 10:29:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xy/uMqAVG2OSeQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 10:29:52 +0000
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
X-Inumbo-ID: 577ced62-302a-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662719392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OriNo0rDdgE6KAilLetTsYPyFFSdMzdzk+Nfn3qHTiE=;
	b=kVcrU6YpHLoOUyyUYFPswOQaDLv+DUb510yH+oqeQJ8nPvuKsDVtUlEE2YU28HOi7JMTSt
	aqvMCDuYoUWKtSj8Zp8epx27JHCTPSZgokP5FLd38bx6f19T2E/Wb8yIDE69BXuFNoMfw0
	oUEqO2cxkujkZ7/8PCnZBxpycD0+3xE=
Message-ID: <0c6e0ed1-9c88-4041-b3a2-50f22a1f0844@suse.com>
Date: Fri, 9 Sep 2022 12:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: libxl source code
Content-Language: en-US
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <DM6PR12MB4297E6A74761806DE47A937E9F439@DM6PR12MB4297.namprd12.prod.outlook.com>
 <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SrQ0loUW4XEVAnDKBE5HaHN3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SrQ0loUW4XEVAnDKBE5HaHN3
Content-Type: multipart/mixed; boundary="------------j0Ko3iSi32pB6cL71yCucoEM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <0c6e0ed1-9c88-4041-b3a2-50f22a1f0844@suse.com>
Subject: Re: libxl source code
References: <DM6PR12MB4297E6A74761806DE47A937E9F439@DM6PR12MB4297.namprd12.prod.outlook.com>
 <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>

--------------j0Ko3iSi32pB6cL71yCucoEM
Content-Type: multipart/mixed; boundary="------------ZXyL7ffLc2GEZ6xFfWMy3PPV"

--------------ZXyL7ffLc2GEZ6xFfWMy3PPV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDA5LjA5LjIyIDEyOjI0LCBTSEFSTUEsIEpZT1RJUk1PWSB3cm90ZToNCj4g
W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQo+IA0KPiBBZGRpbmcgeGVuIGRl
dmVsDQoNClJlbW92aW5nIHhlbi11c2Vycy4NCg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEp5
b3Rpcm1veQ0KPiANCj4gKkZyb206KiBTSEFSTUEsIEpZT1RJUk1PWQ0KPiAqU2VudDoqIEZy
aWRheSwgU2VwdGVtYmVyIDksIDIwMjIgMzo1MiBQTQ0KPiAqVG86KiAneGVuLXVzZXJzQGxp
c3RzLnhlbnByb2plY3Qub3JnJyA8eGVuLXVzZXJzQGxpc3RzLnhlbnByb2plY3Qub3JnPg0K
PiAqU3ViamVjdDoqIGxpYnhsIHNvdXJjZSBjb2RlDQo+IA0KPiBbQU1EIE9mZmljaWFsIFVz
ZSBPbmx5IC0gR2VuZXJhbF0NCj4gDQo+IEhlbGxvLA0KPiANCj4gSSBhbSBsb29raW5nIGZv
ciB0aGUgbGlieGwgc291cmNlIGNvZGUgdG8gdW5kZXJzdGFuZCBob3cgdnNuZCAoUFYgYXVk
aW8gZHJpdmVyKSANCj4gaGFzIGJlZW4gaW1wbGVtZW50ZWQuDQo+IA0KPiBIb3dldmVyLCBp
ZiBJIGxvb2sgaW50byB0aGUgeGVuIHNvdXJjZSB0cmVlIA0KPiAoaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT10cmVlO2Y9dG9vbHM7aD05YjJlZmUwODIy
MjNiYmY2MGI0MWU5NDdjZWI0ODIxZTk4NzA4YzAyO2hiPXJlZnMvaGVhZHMvc3RhYmxlLTQu
MTYgDQo+IDxodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXRy
ZWU7Zj10b29scztoPTliMmVmZTA4MjIyM2JiZjYwYjQxZTk0N2NlYjQ4MjFlOTg3MDhjMDI7
aGI9cmVmcy9oZWFkcy9zdGFibGUtNC4xNj4pLA0KPiANCj4gSSBkbyBub3Qgc2VlIGxpYnhs
IGZvbGRlci4NCj4gDQo+IFNwZWNpZmljYWxseSBJIGFtIGxvb2tpbmcgZm9yIHRoZSBjb2Rl
IHdoaWNoIGlzIHByZXNlbnQgaW4gdGhlIGZvbGxvd2luZyBwYXRjaCBzZXQ6DQo+IA0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMTUwOTU0ODY4Ny02MDcxLTMtZ2l0LXNlbmQt
ZW1haWwtYWwxaW1nQGdtYWlsLmNvbS8gDQo+IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMTUwOTU0ODY4Ny02MDcxLTMtZ2l0LXNlbmQtZW1haWwtYWwxaW1nQGdtYWlsLmNvbS8+
DQo+IA0KPiBDYW4geW91IHBsZWFzZSBoZWxwIG1lIGxvY2F0ZSB0aGUgc291cmNlIGZpbGVz
IGluIHRoaXMgcGF0Y2ggc2V0Pw0KDQpUaGUgY29kZSBoYXMgYmVlbiBtb3ZlZCB0byB0aGUg
dG9vbHMvbGlicy9saWdodCBwYXRoIGluIHRoZSByZXBvc2l0b3J5Lg0KDQoNCkp1ZXJnZW4N
Cg==
--------------ZXyL7ffLc2GEZ6xFfWMy3PPV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZXyL7ffLc2GEZ6xFfWMy3PPV--

--------------j0Ko3iSi32pB6cL71yCucoEM--

--------------SrQ0loUW4XEVAnDKBE5HaHN3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMbFaAFAwAAAAAACgkQsN6d1ii/Ey/P
vQf/ToDzFiwUzX9HNm+AE8koO9uw8GA071wFHzRZtu+H2xNG3EZIEVC6lY0l1njCt7b5OAse+mWZ
Md7Kmty7YKKNtZfIY6+SKnrO0PnIbtkF47zY5Wcd8ASAsilOF55TJpdM3foTxqsLDUwA6dgo7IDc
pAXJ1QVdw1QZ8yV/UqnlPQeIKGljoqRmaPmZSBlHiXt10rAlbWEPBO1LrJp37VTA5KW+dfwoaK/b
2MXJ13JwTetOs4HCvWwXiHlfIhbiY12tJCQOjtCcTFWN4UcY/X73z0NtelvvfrWegGTzo8d8AFTV
N5HN6pHKWIIZssxIAQC4Pbq4Wc6JXpbT/60UX2ZQ5Q==
=s0y1
-----END PGP SIGNATURE-----

--------------SrQ0loUW4XEVAnDKBE5HaHN3--

