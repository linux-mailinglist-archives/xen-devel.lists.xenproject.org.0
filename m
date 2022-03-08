Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B24D12E8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286640.486240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVbR-00081s-6I; Tue, 08 Mar 2022 08:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286640.486240; Tue, 08 Mar 2022 08:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVbR-0007yf-2Y; Tue, 08 Mar 2022 08:53:57 +0000
Received: by outflank-mailman (input) for mailman id 286640;
 Tue, 08 Mar 2022 08:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PwwU=TT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nRVbQ-0007yZ-Bj
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:53:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 482248ae-9ebd-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 09:53:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F10881F397;
 Tue,  8 Mar 2022 08:53:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 928BF13C2F;
 Tue,  8 Mar 2022 08:53:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I+1rIqIZJ2KeFwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Mar 2022 08:53:54 +0000
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
X-Inumbo-ID: 482248ae-9ebd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646729634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t43t99z3UkjQ7VrAmE8Gr0s9IgMUfoyzhAEvHBVs+/k=;
	b=HQ+6STtoQxgjdkyMKvrCHRIzG0uxCHeIPlGl/Uad951ZTjugW/78EJWI4uMvaX2q8+h6OE
	tl4WJvDM7X0rNocH+aceIIygomtU9Xc+umoT1dLAboTRhu6BeJ6bo70IwEtZ5ApBE2joLH
	/wDOwgqD2noQ5oDw2SBrR6j4Ffm/bS8=
Message-ID: <a6d8a218-8e4d-a850-6b8a-61c40d067479@suse.com>
Date: Tue, 8 Mar 2022 09:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
 <19d9390c-6ba1-ab0b-e582-8b83101b97a7@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <19d9390c-6ba1-ab0b-e582-8b83101b97a7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OIZoYq1CQjDxsS0oQ0M0srB4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OIZoYq1CQjDxsS0oQ0M0srB4
Content-Type: multipart/mixed; boundary="------------eoctSyBKJ19fO0Y5a5rd0dxk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <a6d8a218-8e4d-a850-6b8a-61c40d067479@suse.com>
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
 <19d9390c-6ba1-ab0b-e582-8b83101b97a7@suse.com>
In-Reply-To: <19d9390c-6ba1-ab0b-e582-8b83101b97a7@suse.com>

--------------eoctSyBKJ19fO0Y5a5rd0dxk
Content-Type: multipart/mixed; boundary="------------pd8oG26yrpBPOesUFcJs02a0"

--------------pd8oG26yrpBPOesUFcJs02a0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDMuMjIgMDk6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wMy4yMDIy
IDA5OjM5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDguMDMuMjIgMDk6MzQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjEyLjIwMjEgMTY6NTUsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEluIG9yZGVyIHRvIGF2b2lkIGluZGlyZWN0IGZ1bmN0aW9uIGNh
bGxzIG9uIHRoZSBoeXBlcmNhbGwgcGF0aCBhcw0KPj4+PiBtdWNoIGFzIHBvc3NpYmxlIHRo
aXMgc2VyaWVzIGlzIHJlbW92aW5nIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb24gdGFibGVzDQo+
Pj4+IGFuZCBpcyByZXBsYWNpbmcgdGhlIGh5cGVyY2FsbCBoYW5kbGVyIGNhbGxzIHZpYSB0
aGUgZnVuY3Rpb24gYXJyYXkNCj4+Pj4gYnkgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgY2Fs
bCBtYWNyb3MuDQo+Pj4+DQo+Pj4+IEFub3RoZXIgYnktcHJvZHVjdCBvZiBnZW5lcmF0aW5n
IHRoZSBjYWxsIG1hY3JvcyBpcyB0aGUgYXV0b21hdGljDQo+Pj4+IGdlbmVyYXRpbmcgb2Yg
dGhlIGh5cGVyY2FsbCBoYW5kbGVyIHByb3RvdHlwZXMgZnJvbSB0aGUgc2FtZSBkYXRhIGJh
c2UNCj4+Pj4gd2hpY2ggaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgbWFjcm9zLg0KPj4+Pg0K
Pj4+PiBUaGlzIGhhcyB0aGUgYWRkaXRpb25hbCBhZHZhbnRhZ2Ugb2YgdXNpbmcgdHlwZSBz
YWZlIGNhbGxzIG9mIHRoZQ0KPj4+PiBoYW5kbGVycyBhbmQgdG8gZW5zdXJlIHJlbGF0ZWQg
aGFuZGxlciAoZS5nLiBQViBhbmQgSFZNIG9uZXMpIHNoYXJlDQo+Pj4+IHRoZSBzYW1lIHBy
b3RvdHlwZXMuDQo+Pj4+DQo+Pj4+IEEgdmVyeSBicmllZiBwZXJmb3JtYW5jZSB0ZXN0IChw
YXJhbGxlbCBidWlsZCBvZiB0aGUgWGVuIGh5cGVydmlzb3INCj4+Pj4gaW4gYSA2IHZjcHUg
Z3Vlc3QpIHNob3dlZCBhIHZlcnkgc2xpbSBpbXByb3ZlbWVudCAobGVzcyB0aGFuIDElKSBv
Zg0KPj4+PiB0aGUgcGVyZm9ybWFuY2Ugd2l0aCB0aGUgcGF0Y2hlcyBhcHBsaWVkLiBUaGUg
dGVzdCB3YXMgcGVyZm9ybWVkIHVzaW5nDQo+Pj4+IGEgUFYgYW5kIGEgUFZIIGd1ZXN0Lg0K
Pj4+Pg0KPj4+PiBDaGFuZ2VzIGluIFYyOg0KPj4+PiAtIG5ldyBwYXRjaGVzIDYsIDE0LCAx
NQ0KPj4+PiAtIHBhdGNoIDc6IHN1cHBvcnQgaHlwZXJjYWxsIHByaW9yaXRpZXMgZm9yIGZh
c3RlciBjb2RlDQo+Pj4+IC0gY29tbWVudHMgYWRkcmVzc2VkDQo+Pj4+DQo+Pj4+IENoYW5n
ZXMgaW4gVjM6DQo+Pj4+IC0gcGF0Y2hlcyAxIGFuZCA0IHJlbW92ZWQgYXMgYWxyZWFkeSBh
cHBsaWVkDQo+Pj4+IC0gY29tbWVudHMgYWRkcmVzc2VkDQo+Pj4+DQo+Pj4+IEp1ZXJnZW4g
R3Jvc3MgKDEzKToNCj4+Pj4gICAgIHhlbjogbW92ZSBkb192Y3B1X29wKCkgdG8gYXJjaCBz
cGVjaWZpYyBjb2RlDQo+Pj4+ICAgICB4ZW46IGhhcm1vbml6ZSByZXR1cm4gdHlwZXMgb2Yg
aHlwZXJjYWxsIGhhbmRsZXJzDQo+Pj4+ICAgICB4ZW46IGRvbid0IGluY2x1ZGUgYXNtL2h5
cGVyY2FsbC5oIGZyb20gQyBzb3VyY2VzDQo+Pj4+ICAgICB4ZW46IGluY2x1ZGUgY29tcGF0
L3BsYXRmb3JtLmggZnJvbSBoeXBlcmNhbGwuaA0KPj4+PiAgICAgeGVuOiBnZW5lcmF0ZSBo
eXBlcmNhbGwgaW50ZXJmYWNlIHJlbGF0ZWQgY29kZQ0KPj4+PiAgICAgeGVuOiB1c2UgZ2Vu
ZXJhdGVkIHByb3RvdHlwZXMgZm9yIGh5cGVyY2FsbCBoYW5kbGVycw0KPj4+PiAgICAgeDg2
L3B2LXNoaW06IGRvbid0IG1vZGlmeSBoeXBlcmNhbGwgdGFibGUNCj4+Pj4gICAgIHhlbi94
ODY6IGRvbid0IHVzZSBoeXBlcmNhbGwgdGFibGUgZm9yIGNhbGxpbmcgY29tcGF0IGh5cGVy
Y2FsbHMNCj4+Pj4gICAgIHhlbi94ODY6IGNhbGwgaHlwZXJjYWxsIGhhbmRsZXJzIHZpYSBn
ZW5lcmF0ZWQgbWFjcm8NCj4+Pj4gICAgIHhlbi9hcm06IGNhbGwgaHlwZXJjYWxsIGhhbmRs
ZXJzIHZpYSBnZW5lcmF0ZWQgbWFjcm8NCj4+Pj4gICAgIHhlbi94ODY6IGFkZCBoeXBlcmNh
bGwgcGVyZm9ybWFuY2UgY291bnRlcnMgZm9yIGh2bSwgY29ycmVjdCBwdg0KPj4+PiAgICAg
eGVuOiBkcm9wIGNhbGxzX3RvX211bHRpY2FsbCBwZXJmb3JtYW5jZSBjb3VudGVyDQo+Pj4+
ICAgICB0b29scy94ZW5wZXJmOiB1cGRhdGUgaHlwZXJjYWxsIG5hbWVzDQo+Pj4NCj4+PiBB
cyBpdCdzIHByZXR0eSBjZXJ0YWluIG5vdyB0aGF0IHBhcnRzIG9mIHRoaXMgd2hpY2ggZGlk
bid0IGdvIGluIHlldCB3aWxsDQo+Pj4gbmVlZCByZS1iYXNpbmcsIEknbSBnb2luZyB0byBk
cm9wIHRoaXMgZnJvbSBteSB3YWl0aW5nLXRvLWJlLWFja2VkIGZvbGRlciwNCj4+PiBleHBl
Y3RpbmcgYSB2NCBpbnN0ZWFkLg0KPj4NCj4+IFllcywgSSB3YXMgcGxhbm5pbmcgdG8gc3Bp
biB0aGF0IHVwIHNvb24uDQo+Pg0KPj4gVGhlIG1haW4gcmVtYWluaW5nIHF1ZXN0aW9uIGlz
IHdoZXRoZXIgd2Ugd2FudCB0byBzd2l0Y2ggdGhlIHJldHVybiB0eXBlDQo+PiBvZiBhbGwg
aHlwZXJjYWxscyAob3IgYXQgbGVhc3QgdGhlIG9uZXMgY29tbW9uIHRvIGFsbCBhcmNocykg
bm90DQo+PiByZXF1aXJpbmcgdG8gcmV0dXJuIDY0LWJpdCB2YWx1ZXMgdG8gImludCIsIGFz
IEp1bGllbiByZXF1ZXN0ZWQuDQo+IA0KPiBDb3VsZCB5b3UgcmVtaW5kIG1lIG9mIHRoZSAo
c3ViKXRocmVhZCB0aGlzIHdhcyBpbiwgdG8gcmVhZCB0aHJvdWdoIHRoZQ0KPiBqdXN0aWZp
Y2F0aW9uIGFnYWluPyBXaXRob3V0IHJlY2FsbGluZyBhbnkgZGV0YWlscyBJIGd1ZXNzIEkn
ZCBwcmVmZXINCj4gdG8gc3RpY2sgdG8gbG9uZyBmb3Igbm9uLWNvbXBhdCBmbGF2b3JzLg0K
DQpUaGlzIGRpc2N1c3Npb24gc3RhcnRlZCB3aXRoOg0KDQpodHRwczovL2xpc3RzLnhlbi5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0xMi90aHJlYWRzLmh0bWwjMDEyOTMN
Cg0KDQpKdWVyZ2VuDQoNCg==
--------------pd8oG26yrpBPOesUFcJs02a0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------pd8oG26yrpBPOesUFcJs02a0--

--------------eoctSyBKJ19fO0Y5a5rd0dxk--

--------------OIZoYq1CQjDxsS0oQ0M0srB4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmInGaIFAwAAAAAACgkQsN6d1ii/Ey/d
ywf9H1RsbG5hksI7ijpx4DHd9lExFpbhnnUim8LsGdsxaeZ7J1/6zZfxyNEl35/m3t/P4Y52jFMi
qKlTp/w9Bv3dtfuOThB7G4w3ilSOKQ++hSzAQpAnOgwCh164nmPQGsiiy7cE+EGsbj86CwXq+VBy
/F1IpVvqcQHzQJQgqlevtEvI/IW7XCTP/KvKoCPRtTfTOfa29rx7/sOTffWd2FMgtQ6/x0KyK6ts
1kugLmvv55MO19RRZX91nCQBfHnOaQxKR90v9Z21JzpvSF6jhXaBsqbA/tLqaUlNrJFEkourtPsh
dc1QT38wAYALDmUbspAbFoiXVK5tGvwqm2H4tHcRlg==
=Zlip
-----END PGP SIGNATURE-----

--------------OIZoYq1CQjDxsS0oQ0M0srB4--

