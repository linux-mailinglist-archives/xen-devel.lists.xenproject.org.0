Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5B6808BA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486712.754139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQOL-0007HG-C8; Mon, 30 Jan 2023 09:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486712.754139; Mon, 30 Jan 2023 09:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQOL-0007Eq-9F; Mon, 30 Jan 2023 09:23:57 +0000
Received: by outflank-mailman (input) for mailman id 486712;
 Mon, 30 Jan 2023 09:23:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMQOK-0007Ek-3R
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:23:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0855678-a07f-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 10:23:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7858521A0B;
 Mon, 30 Jan 2023 09:23:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38DF413444;
 Mon, 30 Jan 2023 09:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AsJuDKmM12MqaQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 09:23:53 +0000
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
X-Inumbo-ID: d0855678-a07f-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675070633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yD/ihHce94iSN3d5ir8ilsHhMIbvNXBZefgFxgj5Cpo=;
	b=V2Le3IegQRJ3SzoMc1+1fJzRMcKGDqImnB/aJcgHmAvDcSjrpqHgdislftYFgThlnBpVNw
	4tt2xKTTKd2AqG8xSfTcRjlmORmBaS7/v+ZDc513jspfAByl9IG4iIjYur0vex3q1/BfCv
	Qluy9QmlX7HyvwC0X//TANq5A/WEc1A=
Message-ID: <65757a42-f55b-55e9-4853-4854ecabbfca@suse.com>
Date: Mon, 30 Jan 2023 10:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] xen/public: move xenstore related doc into 9pfs.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230130090937.31623-1-jgross@suse.com>
 <83ea4c36-4762-c06f-28bc-00deedb7efd3@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <83ea4c36-4762-c06f-28bc-00deedb7efd3@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------550xXOwYHDISJOFsd5jC0yuu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------550xXOwYHDISJOFsd5jC0yuu
Content-Type: multipart/mixed; boundary="------------pz8ODHep3umwCK8ktMeXu4eY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <65757a42-f55b-55e9-4853-4854ecabbfca@suse.com>
Subject: Re: [PATCH v3] xen/public: move xenstore related doc into 9pfs.h
References: <20230130090937.31623-1-jgross@suse.com>
 <83ea4c36-4762-c06f-28bc-00deedb7efd3@xen.org>
In-Reply-To: <83ea4c36-4762-c06f-28bc-00deedb7efd3@xen.org>

--------------pz8ODHep3umwCK8ktMeXu4eY
Content-Type: multipart/mixed; boundary="------------T3mGt4uhRVlrmy0Mj8RQQX0E"

--------------T3mGt4uhRVlrmy0Mj8RQQX0E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjMgMTA6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzAxLzIwMjMgMDk6MDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGUgWGVuc3RvcmUgcmVsYXRlZCBkb2N1bWVudGF0aW9uIGlzIGN1cnJlbnRseSB0byBiZSBm
b3VuZCBpbg0KPj4gZG9jcy9taXNjLzlwZnMucGFuZG9jLCBpbnN0ZWFkIG9mIHRoZSByZWxh
dGVkIGhlYWRlciBmaWxlDQo+PiB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vOXBmcy5oIGxpa2Ug
Zm9yIG1vc3Qgb3RoZXIgcGFyYXZpcnR1YWxpemVkDQo+PiBkZXZpY2UgcHJvdG9jb2xzLg0K
Pj4NCj4+IFRoZXJlIGlzIGEgY29tbWVudCBpbiB0aGUgaGVhZGVyIHBvaW50aW5nIGF0IHRo
ZSBkb2N1bWVudCwgYnV0IHRoZQ0KPj4gZ2l2ZW4gZmlsZSBuYW1lIGlzIHdyb25nLiBBZGRp
dGlvbmFsbHkgc3VjaCBoZWFkZXJzIGFyZSBtZWFudCB0byBiZQ0KPj4gY29waWVkIGludG8g
Y29uc3VtaW5nIHByb2plY3RzIChMaW51eCBrZXJuZWwsIHFlbXUsIGV0Yy4pLCBzbyBwb2lu
dGluZw0KPj4gYXQgYSBkb2MgZmlsZSBpbiB0aGUgWGVuIGdpdCByZXBvc2l0b3J5IGlzbid0
IHJlYWxseSBoZWxwZnVsIGZvciB0aGUNCj4+IGNvbnN1bWVycyBvZiB0aGUgaGVhZGVyLg0K
Pj4NCj4+IFRoaXMgc2l0dWF0aW9uIGlzIGZhciBmcm9tIGlkZWFsLCB3aGljaCBpcyBhbHJl
YWR5IGJlaW5nIHByb3ZlZCBieSB0aGUNCj4+IGZhY3QgdGhhdCBuZWl0aGVyIHFlbXUgbm9y
IHRoZSBMaW51eCBrZXJuZWwgYXJlIGltcGxlbWVudGluZyB0aGUNCj4+IGRldmljZSBhdHRh
Y2gvZGV0YWNoIHByb3RvY29sIGNvcnJlY3RseS4gQWRkaXRpb25hbGx5IHRoZSBkb2N1bWVu
dGVkDQo+PiBYZW5zdG9yZSBlbnRyaWVzIGFyZSBub3QgbWF0Y2hpbmcgdGhlIHJlYWxpdHks
IGFzIHRoZSAidGFnIiBYZW5zdG9yZQ0KPj4gZW50cnkgaXMgb24gdGhlIGZyb250ZW5kIHNp
ZGUsIG5vdCBvbiB0aGUgYmFja2VuZCBvbmUuDQo+Pg0KPj4gVGhlcmUgaXMgYW5vdGhlciBi
dWcgaW4gdGhlIGNvbm5lY3Rpb24gc2VxdWVuY2U6IHRoZSBmcm9udGVuZCBuZWVkcyB0bw0K
Pj4gd2FpdCBmb3IgdGhlIGJhY2tlbmQgdG8gaGF2ZSBwdWJsaXNoZWQgaXRzIGZlYXR1cmVz
IGJlZm9yZSBiZWluZyBhYmxlDQo+PiB0byBhbGxvY2F0ZSBpdHMgcmluZ3MgYW5kIGV2ZW50
LWNoYW5uZWxzLg0KPj4NCj4+IENoYW5nZSB0aGF0IGJ5IG1vdmluZyB0aGUgWGVuc3RvcmUg
cmVsYXRlZCA5cGZzIGRvY3VtZW50YXRpb24gZnJvbQ0KPj4gZG9jcy9taXNjLzlwZnMucGFu
ZG9jIGludG8geGVuL2luY2x1ZGUvcHVibGljL2lvLzlwZnMuaCB3aGlsZSBmaXhpbmcNCj4+
IHRoZSB3cm9uZyBYZW5zdG9yZSBlbnRyeSBkZXRhaWwgYW5kIHRoZSBjb25uZWN0aW9uIHNl
cXVlbmNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjI6DQo+PiAtIGFkZCByZWZlcmVuY2UgdG8gaGVhZGVy
IGluIHRoZSBwYW5kb2MgZG9jdW1lbnQgKEphbiBCZXVsaWNoKQ0KPj4gVjM6DQo+PiAtIGZp
eCBmbGF3IGluIHRoZSBjb25uZWN0aW9uIHNlcXVlbmNlDQo+IA0KPiBQbGVhc2UgZG9uJ3Qg
ZG8gdGhhdCBpbiB0aGUgc2FtZSBwYXRjaC4gVGhpcyBtYWtlcyBhIGxvdCBtb3JlIGRpZmZp
Y3VsdCB0byANCj4gY29uZmlybSB0aGUgZG9jIG1vdmVtZW50IHdhcyBjb3JyZWN0Lg0KDQpZ
b3UgaGF2ZSB0byBjaGVjayBpdCBtYW51YWxseSBhbnl3YXksIGFzIHRoZSBjb21tZW50IGZv
cm1hdCBpcyBwcmVmaXhpbmcNCiIgKiAiIHRvIGV2ZXJ5IGxpbmUuDQoNCkl0cyBub3QgYXMg
aWYgdGhlIGNoYW5nZXMgd291bGQgYmUgVEhBVCBjb21wbGljYXRlZCwgYW5kIHRoZSBjb21t
aXQgbWVzc2FnZQ0KaXMgcXVpdGUgY2xlYXIgV0hBVCBpcyBjaGFuZ2VkLg0KDQpJIGNhbiBk
byB0aGUgc3BsaXQsIG9mIGNvdXJzZSwgaWYgeW91IHJlYWxseSBuZWVkIHRoYXQgKGluIHRo
aXMgY2FzZSBJJ2QNCmVuZCB1cCB3aXRoIDMgcGF0Y2hlcywgb25lIGZvciB0aGUgbW92ZSwg
b25lIGZvciB0aGUgInRhZyIgZW50cnksIGFuZCBvbmUNCmZvciB0aGUgZml4IG9mIHRoZSBj
b25uZWN0aW9uIHNlcXVlbmNlKS4NCg0KDQpKdWVyZ2VuDQo=
--------------T3mGt4uhRVlrmy0Mj8RQQX0E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------T3mGt4uhRVlrmy0Mj8RQQX0E--

--------------pz8ODHep3umwCK8ktMeXu4eY--

--------------550xXOwYHDISJOFsd5jC0yuu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPXjKgFAwAAAAAACgkQsN6d1ii/Ey+L
8Qf/XVFferY96jOSbRkHPdsfDHdZu2/gQsGGvdgBQh9sZ8e8/4r5kvjCfxmHW9Ac2kHuILk1xGJj
Bt+ZWmPSi3u8JIZcL8YnZ7wKERHQTnpa46EquVZxfK5yYXJFenY4CYUh3V/ZRl03jIjj1Q+a0myM
B1fs2El/a+8eaZl9cQYC31WRXPOiP5fEMn0s9RuvzPjD3pK/JRwu6rT/2HuZvkf2ujWd1MB1bM0Y
3e3maiWAUEnyBYqDssr3PxYGAJUfrpNnShCaCvPrL0TpJO/Cdx5OVD1Tlsc+v076tdXCQxFoJGh+
1IBKRz4R83Xax3D5526N9EqhsHjx/QmcsmQF5jNtWQ==
=eRNT
-----END PGP SIGNATURE-----

--------------550xXOwYHDISJOFsd5jC0yuu--

