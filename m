Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F268077A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 09:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486643.754049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPbn-0005Eh-Da; Mon, 30 Jan 2023 08:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486643.754049; Mon, 30 Jan 2023 08:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPbn-0005CR-AW; Mon, 30 Jan 2023 08:33:47 +0000
Received: by outflank-mailman (input) for mailman id 486643;
 Mon, 30 Jan 2023 08:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMPbm-0005CL-OQ
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 08:33:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced8f7b4-a078-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 09:33:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E16E21976;
 Mon, 30 Jan 2023 08:33:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 104EB13A06;
 Mon, 30 Jan 2023 08:33:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B9v2AeiA12NBUAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 08:33:44 +0000
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
X-Inumbo-ID: ced8f7b4-a078-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675067624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JS3xYt/PFkAZ5ccg25c9dVtoNiBgZfyd59cxnaWQbRk=;
	b=YQXKhrCwKPWJIDz2q5413IT4bs74XndcnoZyV+wWLivaPKOHdFPInMr93162l622A2oFfl
	QUb0l+d0LDaAyvkD7QcYryAuTmpxyBfGB/cxc1wbvHiS52vTajHGasx/UqhKDuUEl5fS15
	tLqXftjUKZ4AJCebFYVQUBf0yCVUOrU=
Message-ID: <72145559-dc4b-eae9-de70-50429cef8939@suse.com>
Date: Mon, 30 Jan 2023 09:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/public: move xenstore related doc into 9pfs.h
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230130081722.29012-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230130081722.29012-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0AMu4URJvm4oxx7SfqBLSSZR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0AMu4URJvm4oxx7SfqBLSSZR
Content-Type: multipart/mixed; boundary="------------QJlSYRqFnF0nd1Fj4E45wypq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <72145559-dc4b-eae9-de70-50429cef8939@suse.com>
Subject: Re: [PATCH v2] xen/public: move xenstore related doc into 9pfs.h
References: <20230130081722.29012-1-jgross@suse.com>
In-Reply-To: <20230130081722.29012-1-jgross@suse.com>

--------------QJlSYRqFnF0nd1Fj4E45wypq
Content-Type: multipart/mixed; boundary="------------2fCWHspyxWIQYc6JJkYVvf0n"

--------------2fCWHspyxWIQYc6JJkYVvf0n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjMgMDk6MTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFRoZSBYZW5zdG9y
ZSByZWxhdGVkIGRvY3VtZW50YXRpb24gaXMgY3VycmVudGx5IHRvIGJlIGZvdW5kIGluDQo+
IGRvY3MvbWlzYy85cGZzLnBhbmRvYywgaW5zdGVhZCBvZiB0aGUgcmVsYXRlZCBoZWFkZXIg
ZmlsZQ0KPiB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vOXBmcy5oIGxpa2UgZm9yIG1vc3Qgb3Ro
ZXIgcGFyYXZpcnR1YWxpemVkDQo+IGRldmljZSBwcm90b2NvbHMuDQo+IA0KPiBUaGVyZSBp
cyBhIGNvbW1lbnQgaW4gdGhlIGhlYWRlciBwb2ludGluZyBhdCB0aGUgZG9jdW1lbnQsIGJ1
dCB0aGUNCj4gZ2l2ZW4gZmlsZSBuYW1lIGlzIHdyb25nLiBBZGRpdGlvbmFsbHkgc3VjaCBo
ZWFkZXJzIGFyZSBtZWFudCB0byBiZQ0KPiBjb3BpZWQgaW50byBjb25zdW1pbmcgcHJvamVj
dHMgKExpbnV4IGtlcm5lbCwgcWVtdSwgZXRjLiksIHNvIHBvaW50aW5nDQo+IGF0IGEgZG9j
IGZpbGUgaW4gdGhlIFhlbiBnaXQgcmVwb3NpdG9yeSBpc24ndCByZWFsbHkgaGVscGZ1bCBm
b3IgdGhlDQo+IGNvbnN1bWVycyBvZiB0aGUgaGVhZGVyLg0KPiANCj4gVGhpcyBzaXR1YXRp
b24gaXMgZmFyIGZyb20gaWRlYWwsIHdoaWNoIGlzIGFscmVhZHkgYmVpbmcgcHJvdmVkIGJ5
IHRoZQ0KPiBmYWN0IHRoYXQgbmVpdGhlciBxZW11IG5vciB0aGUgTGludXgga2VybmVsIGFy
ZSBpbXBsZW1lbnRpbmcgdGhlDQo+IGRldmljZSBhdHRhY2gvZGV0YWNoIHByb3RvY29sIGNv
cnJlY3RseS4gQWRkaXRpb25hbGx5IHRoZSBkb2N1bWVudGVkDQo+IFhlbnN0b3JlIGVudHJp
ZXMgYXJlIG5vdCBtYXRjaGluZyB0aGUgcmVhbGl0eSwgYXMgdGhlICJ0YWciIFhlbnN0b3Jl
DQo+IGVudHJ5IGlzIG9uIHRoZSBmcm9udGVuZCBzaWRlLCBub3Qgb24gdGhlIGJhY2tlbmQg
b25lLg0KPiANCj4gQ2hhbmdlIHRoYXQgYnkgbW92aW5nIHRoZSBYZW5zdG9yZSByZWxhdGVk
IDlwZnMgZG9jdW1lbnRhdGlvbiBmcm9tDQo+IGRvY3MvbWlzYy85cGZzLnBhbmRvYyBpbnRv
IHhlbi9pbmNsdWRlL3B1YmxpYy9pby85cGZzLmggd2hpbGUgZml4aW5nDQo+IHRoZSB3cm9u
ZyBYZW5zdG9yZSBlbnRyeSBkZXRhaWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0tLQ0KPiBWMjoNCj4gLSBhZGQgcmVmZXJl
bmNlIHRvIGhlYWRlciBpbiB0aGUgcGFuZG9jIGRvY3VtZW50IChKYW4gQmV1bGljaCkNCg0K
T2gsIEkganVzdCBmb3VuZCBhbm90aGVyIGJ1ZyBpbiB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0
aGUgY29ubmVjdGlvbg0KcHJvdG9jb2wgd2hpbGUgdHJ5aW5nIHRvIGZpeCB0aGUgTGludXgg
ZnJvbnRlbmQuIEknbGwgc2VuZCBWMyBvZiB0aGUNCnBhdGNoIHNvb24uDQoNCg0KSnVlcmdl
bg0K
--------------2fCWHspyxWIQYc6JJkYVvf0n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2fCWHspyxWIQYc6JJkYVvf0n--

--------------QJlSYRqFnF0nd1Fj4E45wypq--

--------------0AMu4URJvm4oxx7SfqBLSSZR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPXgOcFAwAAAAAACgkQsN6d1ii/Ey+d
rQf/RfVy1ICt8fcOOeohV7CpYykuh7yGgtFLQRUcREBeddqAIPCxqmkNBWf1APWssdtLfoB9jZyh
zAW9gzO3RSV+fKT+iDcYTvBEdqiuz7cYgdzOSiBGtin5YdE+1o73EHyIxTGmPVtgoKHPDHK+1uho
YfY+wbupN37whf335A3w2kOI2V89FS3a/L7ELDGZBVw+mrpuVaD/0H58aDU6hyBzSa03kjWLH5OA
miHD38/2hwROYlgVGgwPA84l4vZEc1aSGzogUcJ7EZeelwgeYClSDpkOXaOYGgscGQh1C0GPgGcm
Ukei0ofaCu2yRVz3OJbTLwxGN4+qA7PXxi6e+Sk1Pg==
=aSul
-----END PGP SIGNATURE-----

--------------0AMu4URJvm4oxx7SfqBLSSZR--

