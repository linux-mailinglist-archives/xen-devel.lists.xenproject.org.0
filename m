Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220FE5888C7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379657.613287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9vT-00085t-Gq; Wed, 03 Aug 2022 08:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379657.613287; Wed, 03 Aug 2022 08:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9vT-000841-DW; Wed, 03 Aug 2022 08:40:23 +0000
Received: by outflank-mailman (input) for mailman id 379657;
 Wed, 03 Aug 2022 08:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJ9vS-00083v-5d
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:40:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8ab85e7-1307-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 10:40:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AD371FF01;
 Wed,  3 Aug 2022 08:40:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED3FE13A94;
 Wed,  3 Aug 2022 08:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GdKkOHM06mJgbgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Aug 2022 08:40:19 +0000
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
X-Inumbo-ID: e8ab85e7-1307-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659516020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rmxwKc+cjbFGrUjdX12bhI0xsVn6THtHpv07WhaHWMg=;
	b=bUS1WrgdB5t3wKOvnrf33fj8XenNahxXm+4IBf7cbxJ53vbo/mXtI+eTEwSsFd2fP2QZJ5
	rEZkTf8wy640Ap/puPKkf8v9w03f73UUU3nHYaW0p5nW5XLFdtvE7iXUI+Ya3r6nfNQjA5
	+7/1Caq1MsppbiKL+LQwzdK4fMur3Ts=
Message-ID: <cf447844-c645-a8ae-c675-8717e0fb125f@suse.com>
Date: Wed, 3 Aug 2022 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-2-jgross@suse.com>
 <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
 <8b51d326-feb5-2aac-80f7-969ef8bd2ba6@suse.com>
 <c7b9ebaf-28dc-12ff-c1b3-9e7d9eab85ef@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
In-Reply-To: <c7b9ebaf-28dc-12ff-c1b3-9e7d9eab85ef@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0QwxMs9rx1S3zR4SGaQAbnVC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0QwxMs9rx1S3zR4SGaQAbnVC
Content-Type: multipart/mixed; boundary="------------JSCmuscODUxe0d7aqmHayeH2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <cf447844-c645-a8ae-c675-8717e0fb125f@suse.com>
Subject: Re: [PATCH 1/3] xen/sched: introduce cpupool_update_node_affinity()
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-2-jgross@suse.com>
 <266615bb-1465-f38c-5eee-ad2f4e7256fa@suse.com>
 <8b51d326-feb5-2aac-80f7-969ef8bd2ba6@suse.com>
 <c7b9ebaf-28dc-12ff-c1b3-9e7d9eab85ef@suse.com>
In-Reply-To: <c7b9ebaf-28dc-12ff-c1b3-9e7d9eab85ef@suse.com>

--------------JSCmuscODUxe0d7aqmHayeH2
Content-Type: multipart/mixed; boundary="------------Y0rizh7fsUEBonTQeXyXdcbn"

--------------Y0rizh7fsUEBonTQeXyXdcbn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjIgMTA6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wOC4yMDIy
IDEwOjAxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDMuMDguMjIgMDk6NTAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAyLjA4LjIwMjIgMTU6MjcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+ICsr
KyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+IEBAIC0xNzkwLDI4ICsxNzkwLDE0
IEBAIGludCB2Y3B1X2FmZmluaXR5X2RvbWN0bChzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJf
dCBjbWQsDQo+Pj4+ICAgICAgICByZXR1cm4gcmV0Ow0KPj4+PiAgICB9DQo+Pj4+ICAgIA0K
Pj4+PiAtdm9pZCBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAq
ZCkNCj4+Pj4gK3ZvaWQgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5X25vYWxsb2Moc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY3B1bWFza190ICpvbmxpbmUsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhZmZpbml0eV9tYXNrcyAqYWZm
aW5pdHkpDQo+Pj4+ICAgIHsNCj4+Pj4gLSAgICBjcHVtYXNrX3Zhcl90IGRvbV9jcHVtYXNr
LCBkb21fY3B1bWFza19zb2Z0Ow0KPj4+PiAgICAgICAgY3B1bWFza190ICpkb21fYWZmaW5p
dHk7DQo+Pj4+IC0gICAgY29uc3QgY3B1bWFza190ICpvbmxpbmU7DQo+Pj4+ICAgICAgICBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsNCj4+Pj4gICAgICAgIHVuc2lnbmVkIGludCBjcHU7
DQo+Pj4+ICAgIA0KPj4+PiAtICAgIC8qIERvIHdlIGhhdmUgdmNwdXMgYWxyZWFkeT8gSWYg
bm90LCBubyBuZWVkIHRvIHVwZGF0ZSBub2RlLWFmZmluaXR5LiAqLw0KPj4+PiAtICAgIGlm
ICggIWQtPnZjcHUgfHwgIWQtPnZjcHVbMF0gKQ0KPj4+PiAtICAgICAgICByZXR1cm47DQo+
Pj4+IC0NCj4+Pj4gLSAgICBpZiAoICF6YWxsb2NfY3B1bWFza192YXIoJmRvbV9jcHVtYXNr
KSApDQo+Pj4+IC0gICAgICAgIHJldHVybjsNCj4+Pj4gLSAgICBpZiAoICF6YWxsb2NfY3B1
bWFza192YXIoJmRvbV9jcHVtYXNrX3NvZnQpICkNCj4+Pj4gLSAgICB7DQo+Pj4+IC0gICAg
ICAgIGZyZWVfY3B1bWFza192YXIoZG9tX2NwdW1hc2spOw0KPj4+PiAtICAgICAgICByZXR1
cm47DQo+Pj4+IC0gICAgfQ0KPj4+DQo+Pj4gSW5zdGVhZCBvZiBzcGxpdHRpbmcgdGhlIGZ1
bmN0aW9uLCBkaWQgeW91IGNvbnNpZGVyIHVzaW5nDQo+Pj4gY29uZF96YWxsb2NfY3B1bWFz
a192YXIoKSBoZXJlLCB0aHVzIGFsbG93aW5nIChidXQgbm90IHJlcXVpcmluZykNCj4+PiBj
YWxsZXJzIHRvIHByZS1hbGxvY2F0ZSB0aGUgbWFza3M/IFdvdWxkIGltbyBiZSBxdWl0ZSBh
IGJpdCBsZXNzDQo+Pj4gY29kZSBjaHVybiAoSSB0aGluaykuDQo+Pg0KPj4gVGhpcyB3b3Vs
ZCByZXF1aXJlIHRvIGNoYW5nZSBhbGwgY2FsbGVycyBvZiBkb21haW5fdXBkYXRlX25vZGVf
YWZmaW5pdHkoKQ0KPj4gdG8gYWRkIHRoZSBhZGRpdGlvbmFsIG1hc2sgcGFyYW1ldGVyLiBU
aGUgbm93IGNvbW1vbi9zY2hlZCBsb2NhbCBzdHJ1Y3QNCj4+IGFmZmluaXR5X21hc2tzIHdv
dWxkIHRoZW4gbmVlZCB0byBtYWRlIGdsb2JhbGx5IHZpc2libGUuDQo+Pg0KPj4gSSdtIG5v
dCBzdXJlIHRoaXMgaXMgYSBnb29kIGlkZWEuDQo+IA0KPiBIbW0sIEkgc2VlIHRoZXJlIGFy
ZSBxdWl0ZSBhIGZldyBjYWxsZXJzIChzbyB0aGVyZSB3b3VsZCBiZSBjb2RlIGNodXJuDQo+
IGVsc2V3aGVyZSkuIEJ1dCBJIGRvbid0IHRoaW5rIHRoZSBzdHJ1Y3Qgd291bGQgbmVlZCBt
YWtpbmcgZ2xvYmFsbHkNCj4gdmlzaWJsZSAtIHRoZSBtYWpvcml0eSBvZiBjYWxsZXJzIGNv
dWxkIHNpbXBseSBwYXNzIE5VTEwsIG1ha2luZyB0aGUNCj4gZnVuY3Rpb24gdXNlIGEgbG9j
YWwgaW5zdGFuY2Ugb2YgdGhlIHN0cnVjdCBpbnN0ZWFkLiBQZXJzb25hbGx5IEkgdGhpbmsN
Cj4gdGhhdCB3b3VsZCBzdGlsbCBiZSBuZWF0ZXIgdGhhbiBoYXZpbmcgYSBfbm9hbGxvYy1z
dWZmaXhlZCB2YXJpYW50IG9mIGENCj4gZnVuY3Rpb24gKGFuZCBzcGVjaWZpY2FsbHkgaW4g
dGhpcyBjYXNlIGFsc28gd2l0aCBhbiBhbHJlYWR5IGxvbmcgbmFtZSkuDQoNCkhtbSwgdHJ1
ZS4NCg0KSSBjb3VsZCBldmVuIHJlbmFtZSB0aGUgcmVhbCBmdW5jdGlvbiB0byBkb21haW5f
dXBkYXRlX25vZGVfYWZmKCkgYW5kDQphZGQgYW4gaW5saW5lIGRvbWFpbl91cGRhdGVfbm9k
ZV9hZmZpbml0eSgpIGZ1bmN0aW9uIGFkZGluZyB0aGUgTlVMTA0KcGFyYW1ldGVyLg0KDQo+
IEJ1dCBJIGd1ZXNzIHRoaXMgaXMgdGhlbiB1cCB0byB5b3UgLyB0aGUgc2NoZWR1bGVyIG1h
aW50YWluZXJzLg0KPiANCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMN
Cj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMNCj4+Pj4gQEAgLTQxMCw2
ICs0MTAsNDggQEAgaW50IGNwdXBvb2xfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IGNwdXBvb2wgKmMpDQo+Pj4+ICAgICAgICByZXR1cm4gcmV0Ow0KPj4+PiAgICB9
DQo+Pj4+ICAgIA0KPj4+PiArLyogVXBkYXRlIGFmZmluaXRpZXMgb2YgYWxsIGRvbWFpbnMg
aW4gYSBjcHVwb29sLiAqLw0KPj4+PiArc3RhdGljIGludCBjcHVwb29sX2FsbG9jX2FmZmlu
X21hc2tzKHN0cnVjdCBhZmZpbml0eV9tYXNrcyAqbWFza3MpDQo+Pj4+ICt7DQo+Pj4+ICsg
ICAgaWYgKCAhYWxsb2NfY3B1bWFza192YXIoJm1hc2tzLT5oYXJkKSApDQo+Pj4+ICsgICAg
ICAgIHJldHVybiAtRU5PTUVNOw0KPj4+PiArICAgIGlmICggYWxsb2NfY3B1bWFza192YXIo
Jm1hc2tzLT5zb2Z0KSApDQo+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+PiArDQo+Pj4+
ICsgICAgZnJlZV9jcHVtYXNrX3ZhcihtYXNrcy0+aGFyZCk7DQo+Pj4+ICsgICAgcmV0dXJu
IC1FTk9NRU07DQo+Pj4+ICt9DQo+Pj4NCj4+PiBXb3VsZG4ndCB0aGlzIGJlIGEgbmljZSBn
ZW5lcmFsIGhlbHBlciBmdW5jdGlvbiwgYWxzbyB1c2FibGUgZnJvbQ0KPj4+IG91dHNpZGUg
b2YgdGhpcyBDVT8NCj4+DQo+PiBJIGNvbnNpZGVyZWQgdGhhdCwgYnV0IHdhc24ndCBzdXJl
IHRoaXMgaXMgcmVhbGx5IGhlbHBmdWwuIFRoZSBvbmx5DQo+PiBwb3RlbnRpYWwgb3RoZXIg
dXNlciB3b3VsZCBiZSBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoKSwgcmVxdWlyaW5n
DQo+PiB0byB1c2UgdGhlIHphbGxvYyB2YXJpYW50IG9mIHRoZSBhbGxvY2F0aW9uIGluIHRo
ZSBoZWxwZXIgKG5vdCB0aGF0IHRoaXMNCj4+IHdvdWxkIGJlIGEgbWFqb3IgcHJvYmxlbSwg
dGhvdWdoKS4NCj4gDQo+IEkgd2FzIGFjdHVhbGx5IHRoaW5raW5nIHRoZSBvdGhlciB3YXkg
YXJvdW5kIC0gdGhlIGNsZWFyaW5nIG9mIHRoZSBtYXNrcw0KPiBtaWdodCBiZXR0ZXIgbW92
ZSBpbnRvIHdoYXQgaXMgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5X25vYWxsb2MoKSBp
bg0KPiB0aGlzIHZlcnNpb24gb2YgdGhlIHBhdGNoLCBzbyB0aGUgaGVscGVyIGNvdWxkIGNv
bnRpbnVlIHRvIHVzZSB0aGUgbm9uLQ0KPiBjbGVhcmluZyBhbGxvY2F0aW9ucy4NCg0KSSBn
dWVzcyB3aXRoIGNvbmRfemFsbG9jX2NwdW1hc2tfdmFyKCkgdGhpcyB3b3VsZCBjb21lIGZv
ciBmcmVlLg0KDQoNCkp1ZXJnZW4NCg==
--------------Y0rizh7fsUEBonTQeXyXdcbn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Y0rizh7fsUEBonTQeXyXdcbn--

--------------JSCmuscODUxe0d7aqmHayeH2--

--------------0QwxMs9rx1S3zR4SGaQAbnVC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLqNHMFAwAAAAAACgkQsN6d1ii/Ey+G
7AgAhoFED82+fQz6Hi5kkWvy21LYo+ccHBFczB/1749l8xeQYg4n/Rr5Ng7O70/OoJKSaGAvE0N0
2zev9F0VBI6kp9J6hh23c+fdy3U/TaeXaupcdWcXNKwGLfLfNx4mBWlhSJ7rOXjr79C2mvigV1qh
llOJbfRtR0QWtbONECbDgz8KvLJ5pkOA3OxqHM78EuY/DV73BKrwCNIw7+jLN6TtOgGLNrrgwJop
ej3CNhF1a5uScIAuPPWUMwXJ4H5S66c04Agid4/4W61NcY2HbClWg7kP49v5jRMtXBqCQ2bITyX8
89Qa3MB5WLejFcL6CAkWn7ba6HWwrcYLVd/Gps60xQ==
=zY6L
-----END PGP SIGNATURE-----

--------------0QwxMs9rx1S3zR4SGaQAbnVC--

