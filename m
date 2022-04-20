Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB677508C4F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309467.525744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCPV-0003yx-Gy; Wed, 20 Apr 2022 15:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309467.525744; Wed, 20 Apr 2022 15:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCPV-0003w3-D5; Wed, 20 Apr 2022 15:38:29 +0000
Received: by outflank-mailman (input) for mailman id 309467;
 Wed, 20 Apr 2022 15:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhCPT-0003vx-QM
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:38:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb3a8993-c0bf-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 17:38:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5BBC81F380;
 Wed, 20 Apr 2022 15:38:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30C2B13AD5;
 Wed, 20 Apr 2022 15:38:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y7tpCvIoYGJqOQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:38:26 +0000
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
X-Inumbo-ID: eb3a8993-c0bf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650469106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/pZusOKcqvv/exzu40WZnHGbpb5yQWBb4nm0puIF6fA=;
	b=NBhagqJG1dSGTv5OC5kHZuaFOreInnt3W56D7YlYvqLPjl4eQemG2AjMJyhcpXyUIEpYzF
	5NsRag2w5fAVWWihBMdmlb2m7m5MU0TQ9Icn3ZnFxCArwtGrm+ju1at9lbTa9qctKNbdON
	pxTwJJk2y54ma/legkMZsa+nMksMBcA=
Message-ID: <30e984cb-36e8-d28a-4a02-21e693eb647e@suse.com>
Date: Wed, 20 Apr 2022 17:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 5/7] xen/cpupool: Don't allow removing cpu0 from
 cpupool0
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-6-luca.fancellu@arm.com>
 <214318DB-3359-4525-870F-0293EDDC32A6@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <214318DB-3359-4525-870F-0293EDDC32A6@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LqDLEK2eEDkYYC3Fj0eyNnED"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LqDLEK2eEDkYYC3Fj0eyNnED
Content-Type: multipart/mixed; boundary="------------Bh9g1TH3tJUfd28A0Vnm00Cf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
Message-ID: <30e984cb-36e8-d28a-4a02-21e693eb647e@suse.com>
Subject: Re: [PATCH v7 5/7] xen/cpupool: Don't allow removing cpu0 from
 cpupool0
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-6-luca.fancellu@arm.com>
 <214318DB-3359-4525-870F-0293EDDC32A6@arm.com>
In-Reply-To: <214318DB-3359-4525-870F-0293EDDC32A6@arm.com>

--------------Bh9g1TH3tJUfd28A0Vnm00Cf
Content-Type: multipart/mixed; boundary="------------mW3mwg9lG70kn5irFcmeWO93"

--------------mW3mwg9lG70kn5irFcmeWO93
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjIgMTY6NTcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDExIEFwciAyMDIyLCBhdCAxNjoyMCwgTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBh
cm0uY29tPiB3cm90ZToNCj4+DQo+PiBDcHUwIG11c3QgcmVtYWluIGluIGNwdXBvb2wwLCBv
dGhlcndpc2Ugc29tZSBvcGVyYXRpb25zIGxpa2UgbW92aW5nIGNwdXMNCj4+IGJldHdlZW4g
Y3B1cG9vbHMsIGNwdSBob3RwbHVnLCBkZXN0cm95aW5nIGNwdXBvb2xzLCBzaHV0ZG93biBv
ZiB0aGUgaG9zdCwNCj4+IG1pZ2h0IG5vdCB3b3JrIGluIGEgc2FuZSB3YXkuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
Pj4gLS0tDQo+PiBDaGFuZ2VzIGluIHY3Og0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0KPj4g
eGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMgfCA4ICsrKysrKystDQo+PiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9zY2hlZC9jcHVw
b29sLmMNCj4+IGluZGV4IDg2YTE3NWY5OWNkNS4uMGE5M2JjYzYzMWJmIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMNCj4+ICsrKyBiL3hlbi9jb21tb24v
c2NoZWQvY3B1cG9vbC5jDQo+PiBAQCAtNTcyLDYgKzU3Miw3IEBAIHN0YXRpYyBsb25nIGNm
X2NoZWNrIGNwdXBvb2xfdW5hc3NpZ25fY3B1X2hlbHBlcih2b2lkICppbmZvKQ0KPj4gICAq
IHBvc3NpYmxlIGZhaWx1cmVzOg0KPj4gICAqIC0gbGFzdCBjcHUgYW5kIHN0aWxsIGFjdGl2
ZSBkb21haW5zIGluIGNwdXBvb2wNCj4+ICAgKiAtIGNwdSBqdXN0IGJlaW5nIHVucGx1Z2dl
ZA0KPj4gKyAqIC0gQXR0ZW1wdCB0byByZW1vdmUgYm9vdCBjcHUgZnJvbSBjcHVwb29sMA0K
Pj4gICAqLw0KPj4gc3RhdGljIGludCBjcHVwb29sX3VuYXNzaWduX2NwdShzdHJ1Y3QgY3B1
cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkNCj4+IHsNCj4+IEBAIC01ODIsNyArNTgzLDEy
IEBAIHN0YXRpYyBpbnQgY3B1cG9vbF91bmFzc2lnbl9jcHUoc3RydWN0IGNwdXBvb2wgKmMs
IHVuc2lnbmVkIGludCBjcHUpDQo+PiAgICAgIGRlYnVndHJhY2VfcHJpbnRrKCJjcHVwb29s
X3VuYXNzaWduX2NwdShwb29sPSV1LGNwdT0lZClcbiIsDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGMtPmNwdXBvb2xfaWQsIGNwdSk7DQo+Pg0KPj4gLSAgICBpZiAoICFjcHVfb25s
aW5lKGNwdSkgKQ0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBDcHUwIG11c3QgcmVtYWluIGlu
IGNwdXBvb2wwLCBvdGhlcndpc2Ugc29tZSBvcGVyYXRpb25zIGxpa2UgbW92aW5nIGNwdXMN
Cj4+ICsgICAgICogYmV0d2VlbiBjcHVwb29scywgY3B1IGhvdHBsdWcsIGRlc3Ryb3lpbmcg
Y3B1cG9vbHMsIHNodXRkb3duIG9mIHRoZSBob3N0LA0KPj4gKyAgICAgKiBtaWdodCBub3Qg
d29yayBpbiBhIHNhbmUgd2F5Lg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAoIWMtPmNw
dXBvb2xfaWQgJiYgIWNwdSkgfHwgIWNwdV9vbmxpbmUoY3B1KSApDQo+PiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCj4+DQo+PiAgICAgIG1hc3Rlcl9jcHUgPSBzY2hlZF9nZXRfcmVz
b3VyY2VfY3B1KGNwdSk7DQo+PiAtLSANCj4+IDIuMTcuMQ0KPj4NCj4gDQo+IEhpLA0KPiAN
Cj4gSeKAmW0gZ29pbmcgdG8gYWRkcmVzcyB0aGUgY29tbWVudCBvbiB0aGlzIHNlcmllIGJl
Zm9yZSByZS1wdXNoaW5nIGl0LCBJIHNlZSB0aGVyZQ0KPiBhcmUgbm8gY29tbWVudHMgb24g
dGhpcyBwYXRjaCwgc28gSeKAmW0gd29uZGVyaW5nLCB3aGVuIHlvdSBoYXZlIHRpbWUsIGlm
IHlvdQ0KPiBjYW4gZ2l2ZSBtZSBzb21lIGZlZWRiYWNrIG9uIHRoaXMgb25lLg0KDQpTb3Jy
eSwgSSBzZWVtIHRvIGhhdmUgbWlzc2VkIHRoaXMgb25lLg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------mW3mwg9lG70kn5irFcmeWO93
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mW3mwg9lG70kn5irFcmeWO93--

--------------Bh9g1TH3tJUfd28A0Vnm00Cf--

--------------LqDLEK2eEDkYYC3Fj0eyNnED
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJgKPEFAwAAAAAACgkQsN6d1ii/Ey99
uAf9Gvwv2J5YK90YvDDRpA9Alvl4RhXGXHrSJVZToB4qL6Tl1P15tF4CsyMsRC1JdJ8SfIMsqfJJ
OBjRcXwgoCIiIRdBjqMLQ+8eEHXGl5WytZhNZ1yQiedmmxpp99Ak71AE+L8B5ku9O7xajtEjLA7o
mTpGCrHPMwTH4D3F2cX0s1uAk0y1Lc95jguHb1GHa5xANBPVnVFK4XJfCsptNgAghsVgiWu/6+Na
zO6/O+q89rV15LmuLlyXQioeSohTyuEvpXr0X/Km77//S9i++fyj7Y8oWXHoENTkS3Bt2vskFaO0
4BVL/DYZctY2SGc1HmnLKGi+/tkghK9ZzzLziVgUeA==
=BLZI
-----END PGP SIGNATURE-----

--------------LqDLEK2eEDkYYC3Fj0eyNnED--

