Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDC537979
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 12:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338497.563276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvd2j-0001Dh-4H; Mon, 30 May 2022 10:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338497.563276; Mon, 30 May 2022 10:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvd2j-0001As-1H; Mon, 30 May 2022 10:54:37 +0000
Received: by outflank-mailman (input) for mailman id 338497;
 Mon, 30 May 2022 10:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e3+D=WG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nvd2i-0001Am-6E
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 10:54:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e41eb70f-e006-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 12:54:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8CD8B21B12;
 Mon, 30 May 2022 10:54:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 667B013AFD;
 Mon, 30 May 2022 10:54:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bdPQFmqilGKzXwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 May 2022 10:54:34 +0000
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
X-Inumbo-ID: e41eb70f-e006-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653908074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0pGbku6Z22PBIRRwNTCIH0ON8nrpMgI5zWTU/a6LxSI=;
	b=Ivc5WJ1luFMOWmgq6KIFloSAawotkUmGbP/FNdre/L3L/KZ4QFgDo9vo1M8zp8TQTlUm7k
	pF9Nui5nL0Q+eEVUBIjR6tRd0QiqZxjKHOyUfHI2GrZDNCYZS4Z92SDUcMySXpcJrNeg0h
	dnpVAcrqFMg5wqnsZL6ZXApPxeXC+v0=
Message-ID: <7041fed6-a0ea-e30e-0292-da0ecf1173c4@suse.com>
Date: Mon, 30 May 2022 12:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [linux-linus test] 170771: regressions - FAIL
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-170771-mainreport@xen.org>
 <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1UtL3ACysgQp0M5J2JjS7igO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1UtL3ACysgQp0M5J2JjS7igO
Content-Type: multipart/mixed; boundary="------------87csPgSfXQrD0q0MJwCVQOp9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <7041fed6-a0ea-e30e-0292-da0ecf1173c4@suse.com>
Subject: Re: [linux-linus test] 170771: regressions - FAIL
References: <osstest-170771-mainreport@xen.org>
 <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>
In-Reply-To: <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>

--------------87csPgSfXQrD0q0MJwCVQOp9
Content-Type: multipart/mixed; boundary="------------XkevVCvjE9qX4X2Tj3z0HA0C"

--------------XkevVCvjE9qX4X2Tj3z0HA0C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDUuMjIgMTI6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNS4yMDIy
IDExOjAzLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+PiBmbGlnaHQgMTcwNzcx
IGxpbnV4LWxpbnVzIHJlYWwgW3JlYWxdDQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTcwNzcxLw0KPj4NCj4+IFJlZ3Jlc3Npb25zIDot
KA0KPj4NCj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LA0KPj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46DQo+PiAgIHRl
c3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgMTQgZ3Vlc3Qtc3RhcnQgICAgICAgICAg
IGZhaWwgUkVHUi4gdnMuIDE3MDcxNA0KPj4gICB0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgt
eGwtaW50ZWwgMTQgZ3Vlc3Qtc3RhcnQgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNzA3MTQN
Cj4+ICAgdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXFjb3cyICA4IHhlbi1ib290ICAgICAg
ICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTcwNzE0DQo+PiAgIHRlc3QtYW1kNjQtYW1kNjQt
bGlidmlydCAgICAgIDggeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMu
IDE3MDcxNA0KPj4gICB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcmF3ICA4IHhlbi1ib290
ICAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNzA3MTQNCj4+ICAgdGVzdC1hcm02
NC1hcm02NC14bC1zZWF0dGxlICAgOCB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBS
RUdSLiB2cy4gMTcwNzE0DQo+PiAgIHRlc3QtYW1kNjQtYW1kNjQteGwtcHZodjItaW50ZWwg
MTQgZ3Vlc3Qtc3RhcnQgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE3MDcxNA0KPj4gICB0
ZXN0LWFtZDY0LWFtZDY0LXhsICAgICAgICAgIDE0IGd1ZXN0LXN0YXJ0ICAgICAgICAgICAg
ICBmYWlsIFJFR1IuIHZzLiAxNzA3MTQNCj4gDQo+IFRoaXMNCj4gDQo+IHZpZiB2aWYtMS0w
IHZpZjEuMDogQXNrZWQgZm9yIDAgc2xvdHMgYnV0IGV4Y2VlZHMgdGhpcyBsaW1pdA0KPiB2
aWYgdmlmLTEtMCB2aWYxLjA6IGZhdGFsIGVycm9yOyBkaXNhYmxpbmcgZGV2aWNlDQo+IA0K
PiB0byBtZSBsb29rcyBsaWtlIGEgcmVncmVzc2lvbiBpbiBuZXRmcm9udCwgY29uc2lkZXJp
bmcgdGhhdCB0aGVyZQ0KPiBkb24ndCBsb29rIHRvIGJlIGFueSByZWxldmFudCBuZXRiYWNr
IGNoYW5nZXMuIEkgaGF2ZSB0byBhZG1pdA0KPiB0aG91Z2ggdGhhdCBhbGwgdGhyZWUgcmVj
ZW50IG5ldGZyb250IGNvbW1pdHMgZG9uJ3QgaGF2ZSBhbg0KPiBvYnZpb3VzIGNvbm5lY3Rp
b24gdG8gdGhlIHNsb3QgY291bnQgZ29pbmcgd3JvbmcuIE9yIHdhaXQgLSBpc24ndA0KPiB0
aGlzIGEgcmVzdWx0IG9mIDZmYWM1OTJjY2E2MCAoInhlbjogdXBkYXRlIHJpbmcuaCIpIHRv
dWNoaW5nDQo+IG9ubHkgbmV0ZnJvbnQsIHdoZW4gbmV0YmFjayBhbHNvIGhhcyBhIHVzZSBv
Zg0KPiBSSU5HX0hBU19VTkNPTlNVTUVEX1JFUVVFU1RTKCkgKGluIHhlbnZpZl90eF9idWls
ZF9nb3BzKCkpIHdoaWNoDQo+IHdhbnRzIGFuIGFjdHVhbCBjb3VudCwgbm90IGp1c3QgYSBi
b29sZWFuPw0KDQpPaCwgaW5kZWVkIQ0KDQpUaGFua3MgZm9yIGlkZW50aWZ5aW5nIHRoZSBw
cm9ibGVtLg0KDQpJbiBjYXNlIHlvdSBkb24ndCBoYXZlIGEgcGF0Y2ggcmVhZHkgYWxyZWFk
eSwgSSdsbCBiZSB3cml0aW5nIG9uZSBsYXRlcg0KdG9kYXkuDQoNCg0KSnVlcmdlbg0K
--------------XkevVCvjE9qX4X2Tj3z0HA0C
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------XkevVCvjE9qX4X2Tj3z0HA0C--

--------------87csPgSfXQrD0q0MJwCVQOp9--

--------------1UtL3ACysgQp0M5J2JjS7igO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKUomkFAwAAAAAACgkQsN6d1ii/Ey/T
3wf/ZbTdGPIjJQ+/QOtAXDMVnBEeus9H2twTQsuLsF35odSxXY/ARK3iarYHz3JKTUz6vsVN2XTm
h6tl7Zb0DpEDiCUsw19LmktEv9W6kgA0la58UcO4+ZGfO+gP5ipMd4ZWuY+cmebZXU9uFPbzwEL5
iMFA4igMOPUiY3vng+szUQvwNsB4KKdsuiXWItfQS3YJSU7wWuJ1cUmlpiMR4y4mQeLqLVidzSCQ
xzlyyv/Y8tpK1tfsBdvXhZPg+QW9XOVaY+wUa+j2hefj6fCtc/h8eEyo0+9561AJh06Ztlw4cCNm
pHKX/wL7mndi0/Ht/Kmpc7jaZhjojzgx16FOre7xTg==
=SAHP
-----END PGP SIGNATURE-----

--------------1UtL3ACysgQp0M5J2JjS7igO--

