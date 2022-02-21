Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A284BDAB4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 16:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276344.472480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMB45-0001N7-KC; Mon, 21 Feb 2022 15:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276344.472480; Mon, 21 Feb 2022 15:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMB45-0001KM-Ga; Mon, 21 Feb 2022 15:57:29 +0000
Received: by outflank-mailman (input) for mailman id 276344;
 Mon, 21 Feb 2022 15:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tDfV=TE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nMB44-0001KG-O0
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 15:57:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7749abf-932e-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 16:57:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D87ED2111A;
 Mon, 21 Feb 2022 15:57:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4FE513B2F;
 Mon, 21 Feb 2022 15:57:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d7MCJ2a2E2I4VwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Feb 2022 15:57:26 +0000
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
X-Inumbo-ID: f7749abf-932e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645459046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1A0gfhEuKVDQDqf9bChdIZuM4QAkI1Sm5403kO/AaiE=;
	b=T3U4dQ2EOUvGLusBS9AXYmSVapgIWVc//EzrigrvdbdHr4ZqONd8Cxdsltk8pWjg9sR1ew
	aMN/SXww2PHcIS2PhVC10vbByzc3SyYpGTbiuLU6sbx1anyw9JZ8l97/0SDihBfqQCSvG4
	/STxS3RFcn/jICb+8UCQkaFpYhjpFus=
Message-ID: <06890331-8c75-ddb9-57e8-284c47d4d562@suse.com>
Date: Mon, 21 Feb 2022 16:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
 <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
 <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
In-Reply-To: <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g9q8BnPBMZPaXM4LwKqQOnko"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g9q8BnPBMZPaXM4LwKqQOnko
Content-Type: multipart/mixed; boundary="------------nuwbFMD63OvCpq7mmzhltG0w";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <06890331-8c75-ddb9-57e8-284c47d4d562@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
 <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
 <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
In-Reply-To: <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>

--------------nuwbFMD63OvCpq7mmzhltG0w
Content-Type: multipart/mixed; boundary="------------q1lzEjwDYKv0yWnYKaAhRmvf"

--------------q1lzEjwDYKv0yWnYKaAhRmvf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDIuMjIgMTY6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMi4yMDIy
IDE2OjA1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjEuMDIuMjIgMTU6MzEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIxLjAyLjIwMjIgMTU6MjcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDIxLjAyLjIyIDE1OjE4LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIxLjAyLjIwMjIgMTM6NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gUHJvdmlkaW5nIGEgbWFjcm8gZm9yIGFuIGludmFsaWQgZ3JhbnQgcmVmZXJlbmNlIHdv
dWxkIGJlIGJlbmVmaWNpYWwNCj4+Pj4+PiBmb3IgdXNlcnMsIGVzcGVjaWFsbHkgYXMgc29t
ZSBhcmUgdXNpbmcgdGhlIHdyb25nIHZhbHVlICIwIiBmb3IgdGhhdA0KPj4+Pj4+IHB1cnBv
c2UuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+Pj4+Pg0KPj4+Pj4gT3ZlciB0aGUgeWVhcnMgSSd2ZSBiZWVuIGNv
bnNpZGVyaW5nIHRvIGFkZCBzdWNoIHRvIHRoZSBwdWJsaWMNCj4+Pj4+IGludGVyZmFjZSwg
cGVyaGFwcyBldmVuIG1vcmUgdGhhbiBvbmNlLiBCdXQgSSdtIGFmcmFpZCBpdCdzIG5vdCB0
aGF0DQo+Pj4+PiBlYXN5LiBJbiBwcmluY2lwbGUgMHhmZmZmZmZmZiAod2hpY2ggYnR3IGlz
bid0IG5lY2Vzc2FyaWx5IH4wdSkgY291bGQNCj4+Pj4NCj4+Pj4gSSBjYW4gY2hhbmdlIHRo
YXQgdG8gdXNlIDB4ZmZmZmZmZmYgZXhwbGljaXRseS4NCj4+Pj4NCj4+Pj4+IGJlIGEgdmFs
aWQgcmVmLiBJdCBpcyByZWFsbHkgaW50ZXJuYWwgYWdyZWVtZW50IGJ5IHVzZXJzIG9mIHRo
ZQ0KPj4+Pj4gaW50ZXJmYWNlIHRvIHNldCBmb3IgdGhlbXNlbHZlcyB0aGF0IHRoZXkncmUg
bm90IGV2ZXIgZ29pbmcgdG8gbWFrZQ0KPj4+Pj4gYSB2YWxpZCBncmFudCBiZWhpbmQgdGhh
dCByZWZlcmVuY2UuDQo+Pj4+DQo+Pj4+IEFzIHRoZSBncmFudCByZWZlcmVuY2UgaXMgYW4g
aW5kZXggaW50byB0aGUgZ3JhbnQgdGFibGUgdGhpcyB3b3VsZA0KPj4+PiBsaW1pdCB0aGUg
c2l6ZSBvZiB0aGUgZ3JhbnQgdGFibGUgdG8gIm9ubHkiIFVJTlRfTUFYIC0gMS4gSSBkb24n
dA0KPj4+PiB0aGluayB0aGlzIHdpbGwgYmUgZXZlciBhIGNvbmNlcm4gKG90aGVyIHRoYW4g
YW4gYWNhZGVtaWNhbCBvbmUpLg0KPj4+DQo+Pj4gVGhhdCB3YXNuJ3QgbXkgcG9pbnQuIExp
bWl0aW5nIHRoZSB0YWJsZSB0byBvbmUgbGVzcyBlbnRyeSBpcyBub3QgYQ0KPj4+IGJpZyBk
ZWFsIGluZGVlZC4gQnV0IHdlIGhhdmUgbm8gcmVhc29uIHRvIG1hbmRhdGUgd2hpY2ggZ3Jl
ZihzKSB0bw0KPj4+IGNvbnNpZGVyIGludmFsaWQuIEEgZ3Vlc3QgY291bGQgY29uc2lkZXIg
Z3JlZiAwIHRoZSBpbnZhbGlkIG9uZS4NCj4+DQo+PiBXaXRoIHRoZSBncmVmIGJlaW5nIGFu
IGluZGV4IHN0YXJ0aW5nIHdpdGggMCAoZ3JlZiAwIGlzIHZhbGlkLCBhcyBpdCBpcw0KPj4g
dXNlZCBmb3IgdGhlIGNvbnNvbGUgcmluZyBwYWdlKSwgdGhlIG5hdHVyYWwgY2hvaWNlIGZv
ciBhbiBpbnZhbGlkDQo+PiB2YWx1ZSBpcyB0aGUgaGlnaGVzdCBvbmUgYmVpbmcgcmVwcmVz
ZW50YWJsZS4gQSBncmVmIGlzIG9mIHR5cGUgdWludDMyX3QNCj4+IHJlc3VsdGluZyBpbiB0
aGlzIHZhbHVlIGJlaW5nIDB4ZmZmZmZmZmYuDQo+Pg0KPj4gV2hpbGUgaW4gdGhlb3J5IGEg
Z3JhbnQgdGFibGUgY291bGQgYmUgdGhhdCBsYXJnZSwgaW4gcHJhY3RpY2UgdGhpcw0KPj4g
d2lsbCBuZXZlciBoYXBwZW4uDQo+Pg0KPj4+IFRoZSBoeXBlcnZpc29yIGRvZXNuJ3QgY2Fy
ZS4gSW1vIHRoaXMgc2ltcGx5IGlzIGFuIGFzcGVjdCB3aGljaCBpcw0KPj4NCj4+IFRoaXMg
aXNuJ3QgdHJ1ZS4gVGhlIGh5cGVydmlzb3IgbmVlZHMgdG8gYWxsb2NhdGUgcmVzb3VyY2Vz
IGZvciBiZWluZw0KPj4gYWJsZSB0byBoYW5kbGUgdGhlIGhpZ2hlc3QgcG9zc2libGUgZ3Jl
ZiB2YWx1ZSBmb3IgYSBndWVzdC4gRm9yIGEgdjENCj4+IGdyYW50IHRhYmxlIHRoaXMgd291
bGQgbWVhbiAzMkdCIG9mIGdyYW50IHRhYmxlIHNpemUuIEFyZSB5b3UgcmVhbGx5DQo+PiBj
b25jZXJuZWQgd2Ugd2lsbCBldmVyIGhpdCB0aGlzIGxpbWl0PyBUaGlzIGlzbid0IGF0IHRo
ZSBndWVzdCdzDQo+PiBjaG9pY2UsIGFmdGVyIGFsbCwgYXMgdGhlIG1heCBncmFudCB0YWJs
ZSBzaXplIGlzIGxpbWl0ZWQgYnkgWGVuLg0KPiANCj4gSWYgd2UncmUgbm90IGdvaW5nIHRv
IGhpdCB0aGF0IGxpbWl0LCB3aGF0J3Mgd3Jvbmcgd2l0aCBkZWNsYXJpbmcgdGhlDQo+IGVu
dGlyZSB1cHBlciBoYWxmIG9mIHVpbnQzMl90IHNwYWNlICJpbnZhbGlkIiBmb3IgdXNlIGEg
Z3JlZj8gSWYgd2UNCj4gd29uJ3QgZXZlciBnbyB1cCB0byAzMkdiLCB3ZSBxdWl0ZSBjZXJ0
YWlubHkgYWxzbyB3b24ndCBldmVyIHJlYWNoDQo+IDE2R2IuIFllcywgeW91IHByb2JhYmx5
IGFscmVhZHkgZ3Vlc3NlZCBpdCwgd2UgY2FuIHRoZW4gcmVwZWF0IHRoaXMNCj4gcHJvY2Vz
cyBpdGVyYXRpdmVseSB1bnRpbCB3ZSByZWFjaCA0a2IuDQoNClRoaXMgcmVhc29uaW5nIGlz
IG5vbnNlbnNlLCBhbmQgeW91IGtub3cgaXQuDQoNCj4+PiBub3QgaW4gbmVlZCBvZiBwaW5u
aW5nIGRvd24gaW4gdGhlIEFCSS4gWWV0IGlmIGl0IHdhcyBwaW5uZWQgZG93bg0KPj4+IGxp
a2UgeW91IGRvLCB0aGVuIHRoZSBoeXBlcnZpc29yIHdvdWxkIG5lZWQgdG8gbWFrZSBzdXJl
IGl0IHJlZnVzZXMNCj4+PiB0byBhY3Qgb24gdGhpcyBtYW5kYXRlZCBpbnZhbGlkIGdyZWYu
DQo+Pg0KPj4gVGhpcyBpcyBhbiBlYXN5IG9uZS4gV2UgY291bGQganVzdCByZWZ1c2UgdG8g
aGF2ZSBhIGdyYW50IHRhYmxlIG9mDQo+PiB0aGF0IHNpemUuIEkgY2FuIGFkZCB0aGlzIHRv
IHRoZSBwYXRjaCBpZiB5b3UgcmVhbGx5IHRoaW5rIGl0IGlzDQo+PiBuZWNlc3NhcnkuDQo+
IA0KPiBTaW5jZSBncmFudCB0YWJsZSBzaXplIGlzIG1lYXN1cmVkIGluIHBhZ2VzLCB5b3Un
ZCB0aGVuIGhhdmUgdG8NCj4gcmVmdXNlIHVzZSBvZiBtb3JlIHRoYW4ganVzdCB0aGF0IHNp
bmdsZSBncmVmLiBUaGlzIHdvdWxkIHN0aWxsIG5vdA0KPiBiZSBhbiBpbW1lZGlhdGUgcHJv
YmxlbSwgYnV0IGRlbW9uc3RyYXRlcyBhZ2FpbiB0aGF0IGl0J3MgdW5jbGVhcg0KPiB3aGVy
ZSB0byBkcmF3IHN1Y2ggYSBib3VuZGFyeSwgaWYgb25lIGlzIHRvIGJlIGFydGlmaWNpYWxs
eSBkcmF3bi4NCg0KSXQgc2hvdWxkIGJlIGFzIGhpZ2ggYXMgcG9zc2libGUuIEkgd291bGRu
J3QgbWluZCBqdXN0IHJlZnVzaW5nIHRoZQ0KbGFzdCBwb3NzaWJsZSBncmVmLCBidXQgSSBk
b24ndCB0aGluayB0aGlzIGlzIG5lY2Vzc2FyeS4NCg0KPj4gVEJILCBJIHRoaW5rIHN1Y2gg
Y29tcGxldGVseSB0aGVvcmV0aWNhbCBjb25jZXJucyBzaG91bGQgbm90IHN0YW5kDQo+PiBp
biB0aGUgd2F5IG9mIGFkZGl0aW9ucyB0byB0aGUgQUJJIG1ha2luZyBsaWZlIGVhc2llciBm
b3IgY29uc3VtZXJzLg0KPiANCj4gSW4gY2FzZSBpdCB3YXNuJ3QgY2xlYXIgLSBteSBjb25j
ZXJuIGlzbid0IHRoYXQgc2FjcmlmaWNpbmcgdGhpcyBvbmUNCj4gZW50cnkgbWF5IGNhdXNl
IGEgcHJvYmxlbSwgb3IgdGhhdCB3ZSdkIGV2ZXIgc2VlIGdyYW50IHRhYmxlcyBncm93DQo+
IHRoaXMgYmlnIChhbGJlaXQgZm9yIHRoZSBsYXR0ZXI6IHlvdSBuZXZlciByZWFsbHkga25v
dykuIEluc3RlYWQgbXkNCj4gY29uY2VybiBpcyB0aGF0IGl0IGlzIGNvbmNlcHR1YWxseSB3
cm9uZyBmb3IgdXMgdG8gKG5vdykgaW50cm9kdWNlDQo+IHN1Y2ggYSB2YWx1ZS4NCg0KSSBo
YXZlIHVuZGVyc3Rvb2QgdGhhdCB0aGlzIGlzIHlvdXIgY29uY2Vybi4NCg0KSSBjb250aW51
ZSB0byB0aGluayB0aGF0IHRoaXMgY29uY2VybiBpcyBvZiBwdXJlbHkgYWNhZGVtaWNhbCBu
YXR1cmUuDQoNCg0KSnVlcmdlbg0K
--------------q1lzEjwDYKv0yWnYKaAhRmvf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------q1lzEjwDYKv0yWnYKaAhRmvf--

--------------nuwbFMD63OvCpq7mmzhltG0w--

--------------g9q8BnPBMZPaXM4LwKqQOnko
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmITtmYFAwAAAAAACgkQsN6d1ii/Ey9f
5ggAkvBbvzVrTn64mdNX1SQKv9LxgZ5L9Vaf7nbydd4Xm7iaFbnOMdpKWB3oap9Hoxivm24eISCz
dIjowomw98HM1xkn0IuqYmZ1GZsbR0pwUvQkGFBzenbBhPkLGfNgxw55b8GbWwbAEzov/Kmzn5ET
ieaEWDeBMbDwTvb1aIOmwTPjUPDoutA0aHjGYUOlb05MX4g8heXEvm6EY/7D/wMxmgrvYjGqfghY
bQFb/SXPTKu8ESp2sYrw/9Y5Dm0MK7JSGdDRM8hU3NjSl8q6l0VBDBCVWMDRh0d+Cwj1jQFpuer6
uCg4ba1iTn96PzByW65DnWHb0lfRdSOembPcLxNr7w==
=g+Fm
-----END PGP SIGNATURE-----

--------------g9q8BnPBMZPaXM4LwKqQOnko--

