Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59E59D290
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 09:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391706.629651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQOek-0005ZC-2T; Tue, 23 Aug 2022 07:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391706.629651; Tue, 23 Aug 2022 07:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQOej-0005W0-Vj; Tue, 23 Aug 2022 07:49:01 +0000
Received: by outflank-mailman (input) for mailman id 391706;
 Tue, 23 Aug 2022 07:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CuCZ=Y3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQOeh-0005Vu-SN
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 07:48:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc7792a-22b8-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 09:48:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 314575CE62;
 Tue, 23 Aug 2022 07:48:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12B2313AB7;
 Tue, 23 Aug 2022 07:48:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EzsrA2qGBGPARAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 23 Aug 2022 07:48:58 +0000
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
X-Inumbo-ID: 0bc7792a-22b8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661240938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MhYTAG5i0yW7vYXFI9hEnxXDQ0/3WKmtM1Rnps3f0tU=;
	b=nqgdRyoQPYdSUlERcCCEIllqECwycrvoZFywfVNSrpsuKar4UYInjLv9dZRX12jiMRa/Um
	uO8cV9wrdX2h8SnDcaN8kOTOD7XnBVPaxI/dSIl0f4sRDjDlgW4x1gZr+pzEHv8L8aLjSV
	jBtLsY6+gbRT1JXqkotCISQ49rJZHqY=
Message-ID: <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
Date: Tue, 23 Aug 2022 09:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
Content-Language: en-US
To: Xen developer discussion <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YwSEXonOg1CMzeQv@itl-email>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YwSEXonOg1CMzeQv@itl-email>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L1fVjKFGR3i0x00bmI8pOSlv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L1fVjKFGR3i0x00bmI8pOSlv
Content-Type: multipart/mixed; boundary="------------D2wyBK0WOEdr6tbAN0QMjt0K";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
References: <YwSEXonOg1CMzeQv@itl-email>
In-Reply-To: <YwSEXonOg1CMzeQv@itl-email>

--------------D2wyBK0WOEdr6tbAN0QMjt0K
Content-Type: multipart/mixed; boundary="------------uxLCvBm7x7jdOuztDEhbGPBh"

--------------uxLCvBm7x7jdOuztDEhbGPBh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDguMjIgMDk6NDAsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gSSByZWNl
bnRseSBoYWQgYSBWTeKAmXMgL2Rldi94dmRiIHN0b3Agd29ya2luZyB3aXRoIGEg4oCcYmFj
a2VuZCBoYXMgbm90DQo+IHVubWFwcGVkIGdyYW504oCdIGVycm9yLiAgU2luY2UgL2Rldi94
dmRiIHdhcyB0aGUgVk3igJlzIHByaXZhdGUgdm9sdW1lLA0KPiB0aGF0IHJlbmRlcmVkIHRo
ZSBWTSBlZmZlY3RpdmVseSB1c2VsZXNzLiAgSSBoYWQgdG8ga2lsbCBpdCB3aXRoDQo+IHF2
bS1raWxsLg0KPiANCj4gVGhlIGJhY2tlbmQgb2YgL2Rldi94dmRiIGlzIGRvbTAsIHNvIGEg
bWFsaWNpb3VzIGJhY2tlbmQgaXMgY2xlYXJseSBub3QNCj4gdGhlIGNhdXNlIG9mIHRoaXMu
ICBJIGJlbGlldmUgdGhlIGFjdHVhbCBjYXVzZSBpcyBhIHJhY2UgY29uZGl0aW9uLCBzdWNo
DQo+IGFzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAxLiBHVUkgYWdlbnQgaW4gVk0gYWxsb2Nh
dGVzIGdyYW50IFguDQo+IDIuIEdVSSBhZ2VudCB0ZWxscyBHVUkgZGFlbW9uIGluIGRvbTAg
dG8gbWFwIFguDQo+IDMuIEdVSSBhZ2VudCBmcmVlcyBncmFudCBYLg0KPiA0LiBibGtmcm9u
dCBhbGxvY2F0ZXMgZ3JhbnQgWCBhbmQgcGFzc2VzIGl0IHRvIGRvbTAuDQo+IDUuIGRvbTDi
gJlzIGJsa2JhY2sgbWFwcyBncmFudCBYLg0KPiA2LiBibGtiYWNrIHVubWFwcyBncmFudCBY
Lg0KPiA3LiBHVUkgZGFlbW9uIG1hcHMgZ3JhbnQgWC4NCj4gOC4gYmxrZnJvbnQgdHJpZXMg
dG8gcmV2b2tlIGFjY2VzcyB0byBncmFudCBYIGFuZCBmYWlscy4gIERpc2FzdGVyDQo+ICAg
ICBlbnN1ZXMuDQo+IA0KPiBXaGF0IGNvdWxkIGJlIGRvbmUgdG8gcHJldmVudCB0aGlzIHJh
Y2U/ICBSaWdodCBub3cgYWxsIG9mIHRoZQ0KPiBhcHByb2FjaGVzIEkgY2FuIHRoaW5rIG9m
IGFyZSBob3JyaWJseSBiYWNrd2FyZHMtaW5jb21wYXRpYmxlLiAgVGhleQ0KPiByZXF1aXJl
IHJlcGxhY2luZyBncmFudCBJRHMgd2l0aCBzb21lIHNvcnQgb2YgaGFuZGxlLCBhbmQgcmVx
dWlyaW5nDQo+IHVzZXJzcGFjZSB0byBwYXNzIHRoZXNlIGhhbmRsZXMgdG8gaW9jdGxzLiAg
SXQgaXMgYWxzbyBwb3NzaWJsZSB0aGF0DQo+IG5ldGZyb250IGFuZCBibGtmcm9udCBjb3Vs
ZCByYWNlIGFnYWluc3QgZWFjaCBvdGhlciBpbiBhIHdheSB0aGF0IGNhdXNlcw0KPiB0aGlz
LCB0aG91Z2ggSSBzdXNwZWN0IHRoYXQgcmFjZSB3b3VsZCBiZSBtdWNoIGhhcmRlciB0byB0
cmlnZ2VyLg0KPiANCj4gVGhpcyBoYXMgaGFwcGVuZWQgbW9yZSB0aGFuIG9uY2Ugc28gaXQg
aXMgbm90IGEgZmx1a2UgZHVlIHRvIGUuZy4gY29zbWljDQo+IHJheXMgb3Igb3RoZXIgcmFu
ZG9tIGJpdC1mbGlwcy4NCj4gDQo+IE1hcmVrLCBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlv
bnM/DQoNClRvIG1lIHRoYXQgc291bmRzIGxpa2UgdGhlIGludGVyZmFjZSBvZiB0aGUgR1VJ
IGlzIHRoZSBjdWxwcml0Lg0KDQpUaGUgR1VJIGFnZW50IGluIHRoZSBndWVzdCBzaG91bGQg
b25seSBmcmVlIGEgZ3JhbnQsIGlmIGl0IGdvdCBhIG1lc3NhZ2UNCmZyb20gdGhlIGJhY2tl
bmQgdGhhdCBpdCBjYW4gZG8gc28uIEp1c3QgYXNzdW1pbmcgdG8gYmUgYWJsZSB0byBmcmVl
IGl0DQpiZWNhdXNlIGl0IGlzbid0IGluIHVzZSBjdXJyZW50bHkgaXMgdGhlIGJyb2tlbiBh
c3N1bXB0aW9uIGhlcmUuDQoNCg0KSnVlcmdlbg0K
--------------uxLCvBm7x7jdOuztDEhbGPBh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uxLCvBm7x7jdOuztDEhbGPBh--

--------------D2wyBK0WOEdr6tbAN0QMjt0K--

--------------L1fVjKFGR3i0x00bmI8pOSlv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMEhmkFAwAAAAAACgkQsN6d1ii/Ey9t
SQf/fYLV2cxYM5N+E3q9KOAN07zK8tTH1lhQn7dEGul5qM/OBdc0g4IEvyWABTgkMUJGeDacVfD8
09DLIhefe4xpdTZA7PKy9v8JmkjS/2aOx13mr80K1bJTlFbY8w+pT06q59TRg6aKEy8gCwgZjIi0
QWhCAyqCk39G3V0wBW+UFwnHrL0lIhAeKPiaAEj4wr41g1Kad1kOPX5Qv0imT9z1TsG01i9xXhAx
xmiBJdvZKRK3rxYkJryV6EDN1nii7jgQx3tXTVbh/Z3jp9T0khNI4dnIBRY9S1XC7ibdzeaaXM3F
abKSkelc/l35/lcseUjm/uiaLMOpwlQHLZscHfXKLQ==
=Irz7
-----END PGP SIGNATURE-----

--------------L1fVjKFGR3i0x00bmI8pOSlv--

