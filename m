Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4524A7184
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264183.457189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFeK-0002dn-97; Wed, 02 Feb 2022 13:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264183.457189; Wed, 02 Feb 2022 13:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFeK-0002bq-5f; Wed, 02 Feb 2022 13:26:16 +0000
Received: by outflank-mailman (input) for mailman id 264183;
 Wed, 02 Feb 2022 13:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CazJ=SR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nFFeI-0002bk-U8
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:26:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1860abb-842b-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:26:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B05E521155;
 Wed,  2 Feb 2022 13:26:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 690A213E48;
 Wed,  2 Feb 2022 13:26:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Eo7UF3WG+mE6RwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Feb 2022 13:26:13 +0000
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
X-Inumbo-ID: b1860abb-842b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643808373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=66/i9/7BChVSjKsIp/tZStWJ4Mb9HCZtM3YchF7iVO8=;
	b=Dr7iZIwZhw6WRGOhU2Y5HIcT8BNL7+Ea4Wb6y7G186V3bR2VfEfOmnI0v/QjBuurNF1hAy
	At13Ch7H6PE1YQkKQCCJnzeGT1IZkBzlnhL9hFVsDCUIdslca/UZdAjk/0qo0vuyAJklsk
	tOocpUjM+qvcOUSfPLabV3NBW7dxQKk=
Message-ID: <ce722a8a-2bc3-9450-0965-1eadb119d42f@suse.com>
Date: Wed, 2 Feb 2022 14:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 0/5] tools: remove include/xen-external directory
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220130084343.19070-1-jgross@suse.com> <YfpwrHRwcHQHFyw0@perard>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YfpwrHRwcHQHFyw0@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pFxJ4l6PBEchwaj84yBS4GyZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pFxJ4l6PBEchwaj84yBS4GyZ
Content-Type: multipart/mixed; boundary="------------c0tB3o3EfEWEGShNMvmsBU5G";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ce722a8a-2bc3-9450-0965-1eadb119d42f@suse.com>
Subject: Re: [PATCH 0/5] tools: remove include/xen-external directory
References: <20220130084343.19070-1-jgross@suse.com> <YfpwrHRwcHQHFyw0@perard>
In-Reply-To: <YfpwrHRwcHQHFyw0@perard>

--------------c0tB3o3EfEWEGShNMvmsBU5G
Content-Type: multipart/mixed; boundary="------------WUWyyx7du2eCgORIu9Q0uXnX"

--------------WUWyyx7du2eCgORIu9Q0uXnX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDIuMjIgMTI6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBTdW4sIEph
biAzMCwgMjAyMiBhdCAwOTo0MzozOEFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gVGhlIHRvb2xzL2luY2x1ZGUveGVuLWV4dGVybmFsIGRpcmVjdG9yeSBjb250YWlucyBh
IGhlYWRlciBmaWxlIGZyb20NCj4+IEZyZWVCU0QgdXNlZCB0byBnZW5lcmF0ZSBYZW4gaGVh
ZGVyIGZpbGVzLiBUaGlzIHNlcmllcyBpcyByZXBsYWNpbmcgdGhlDQo+PiBjb21wbGV0ZSBk
aXJlY3RvcnkgYnkgYSBzaW5nbGUgaGVhZGVyIHdpdGggdGhlIHNhbWUgc2VtYW50aWNzLg0K
Pj4NCj4+IEp1ZXJnZW4gR3Jvc3MgKDUpOg0KPj4gICAgdG9vbHMvbGlicy9saWdodDogcmVw
bGFjZSBfbGlieGxfbGlzdC5oIHdpdGggX3hlbl9saXN0LmgNCj4+ICAgIHRvb2xzL2xpYnMv
dG9vbGNvcmU6IHJlcGxhY2UgX3hlbnRvb2xjb3JlX2xpc3QuaCB3aXRoIF94ZW5fbGlzdC5o
DQo+PiAgICB0b29scy9saWJzL2V2dGNobjogdXNlIF94ZW5fbGlzdC5oDQo+PiAgICB0b29s
cy9pbmNsdWRlOiByZW1vdmUgeGVuLWV4dGVybmFsIGRpcmVjdG9yeQ0KPj4NCj4+ICAgdG9v
bHMvaW5jbHVkZS9feGVuX2xpc3QuaCAgICAgICAgICAgICAgICAgICAgIHwgIDUyMyArKysr
KysrKysNCj4+ICAgdG9vbHMvaW5jbHVkZS9saWJ4bC5oICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgNCArLQ0KPiANCj4gSGksDQo+IA0KPiBXaGlsZSB0aGlzIGxvb2tzIGxpa2Ug
YSBnb29kIGNsZWFudXAsIEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgaXMgYQ0KPiBnb29k
IGlkZWEgd2l0aCByZWdhcmRzIHRvIHRoZSBjaGFuZ2UgaW4gbGlieGwncyBwdWJsaWMgaGVh
ZGVycy4NCj4gDQo+IFRoZSBMSUJYTF9UQUlMUV8qIG1hY3JvIGFyZSBleHBvc2VkIHZpYSBs
aWJ4bC5oLCBhbmQgaXQgc2VlbXMgdGhhdCB1c2luZw0KPiBgbGlieGxfZXZlbnQubGlua2Ag
aXMgZXhwbGljaXRseSBhbGxvd2VkICh2aWEgImxpYnhsX3R5cGVzLmlkbCIpIHRvIG1ha2UN
Cj4gYSBsaXN0IG9mIGV2ZW50IGluIGEgYXBwbGljYXRpb24uIEJ1dCB0aGVyZSBpc24ndCBy
ZWFsbHkgYSByZWFzb24gdG8gdXNlDQo+IHRoZSBtYWNyby4NCj4gDQo+IEkgZGlkbid0IGZp
bmQgYW55IHVzZSBvZiB0aGUgbWFjcm9zIGluIGxpYnZpcnQsIHNvIG1heWJlIGl0J3MgZmlu
ZSB0bw0KPiBjaGFuZ2UgaXQ/DQo+IA0KPiBXaGF0IGRvIHBlb3BsZSB0aGluaz8NCg0KSWYg
dGhvdWdodCB0byBiZSBuZWVkZWQgSSBjb3VsZCBzdGlsbCBhZGQgdGhlIExJQlhMX1RBSUxR
XyogbWFjcm9zDQp0byBsaWJ4bC5oIGJ5IGRlZmluaW5nIHRoZW0gYXMgYWxpYXNlcyBvZiB0
aGUgWEVOX1RBSUxRXyogbWFjcm9zLg0KDQoNCkp1ZXJnZW4NCg==
--------------WUWyyx7du2eCgORIu9Q0uXnX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WUWyyx7du2eCgORIu9Q0uXnX--

--------------c0tB3o3EfEWEGShNMvmsBU5G--

--------------pFxJ4l6PBEchwaj84yBS4GyZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH6hnQFAwAAAAAACgkQsN6d1ii/Ey+Z
yQf/R4PN7lOd/F7yD/ln3aT4fKH+DcM6lpN6orx/frWTCdjLm0LBEFGAN+8ceaTmQics+BQ8a/hI
4lyUcwfjii96plSpCsQ5kZk/mAf035rRvhxM9lsMewhxP0TuBBQ7vqUHkgo2VzAAVb3uhzXfNaFF
xkkVa0FZjCBIL5w6adHU5/j5MBSK+SvyNXvxDVn7JjUoxDBcxp3+XPcKO5MYo0f0E0sizXVOZlCq
+Lc1sPwYSJJpGg+Sg+pulsSHyptQq/rbQYHyb/N6VHqebcAK3VrQbJdnrb3GegXv4UwfJZqhsf7E
fyup1YZnZ5tgt2hZV8RITajdAAI/WEQ90cWO1vGjYw==
=xUjy
-----END PGP SIGNATURE-----

--------------pFxJ4l6PBEchwaj84yBS4GyZ--

