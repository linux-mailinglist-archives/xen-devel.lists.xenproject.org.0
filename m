Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C296B962A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 14:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509600.785655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4gz-0002Nz-U9; Tue, 14 Mar 2023 13:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509600.785655; Tue, 14 Mar 2023 13:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4gz-0002Lg-Qp; Tue, 14 Mar 2023 13:27:53 +0000
Received: by outflank-mailman (input) for mailman id 509600;
 Tue, 14 Mar 2023 13:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6q5S=7G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pc4gy-0002LW-Ql
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 13:27:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f4aca4-c26c-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 14:27:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 125261F894;
 Tue, 14 Mar 2023 13:27:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DAF8713A1B;
 Tue, 14 Mar 2023 13:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S7sHNFZ2EGS5eAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Mar 2023 13:27:50 +0000
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
X-Inumbo-ID: 04f4aca4-c26c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678800471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSmzoiEHzOu29dSOiLI449n0Ml2QCewFvWPuirU68kM=;
	b=ZbQtbbwLyC6cTGowmjbV+4bBSe5VKibi6iQBQIh2rPbf8NvW5Xj1pCVzspOUqPaQuYn2Ec
	7ztnv+dEKYk+S1L8kgy3xPwtisgHGDSkGyeANmdlbff5QY1EC3jBuU8iYSf+ejw2aaZ5n5
	WPzjZwsVlczs99zLN13TxKs/m3/BDZs=
Message-ID: <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
Date: Tue, 14 Mar 2023 14:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-179607-mainreport@xen.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
In-Reply-To: <osstest-179607-mainreport@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x3EgoHg6jXHUAbEx03E0afjW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x3EgoHg6jXHUAbEx03E0afjW
Content-Type: multipart/mixed; boundary="------------4nx8102QRlUGq4B0t0nK75n0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
References: <osstest-179607-mainreport@xen.org>
In-Reply-To: <osstest-179607-mainreport@xen.org>

--------------4nx8102QRlUGq4B0t0nK75n0
Content-Type: multipart/mixed; boundary="------------dCC6zSEQtk5eAbRMNfahW5yS"

--------------dCC6zSEQtk5eAbRMNfahW5yS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDMuMjMgMTM6NTIsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToNCj4gZmxp
Z2h0IDE3OTYwNyBsaW51eC1saW51cyByZWFsIFtyZWFsXQ0KPiBodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc5NjA3Lw0KPiANCj4gUmVncmVz
c2lvbnMgOi0oDQo+IA0KPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBi
bG9ja2luZywNCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46DQo+
ICAgdGVzdC1hbWQ2NC1hbWQ2NC1mcmVlYnNkMTItYW1kNjQgMTMgZ3Vlc3Qtc3RhcnQgICAg
ICAgICAgZmFpbCBSRUdSLiB2cy4gMTc4MDQyDQo+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1j
cmVkaXQxICAxOSBndWVzdC1zYXZlcmVzdG9yZS4yICAgICAgZmFpbCBSRUdSLiB2cy4gMTc4
MDQyDQo+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1zaGFkb3cgICAxNCBndWVzdC1zdGFydCAg
ICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTc4MDQyDQoNCi4uLg0KDQpJbiB0aGUgbG9n
cyBbMV0gSSdtIHNlZWluZyBlcnJvcnMgbGlrZToNCg0KTWFyIDEzIDIzOjUxOjI2LjI3NTQy
MSBbICAyNzEuNzEzNzQwXSB4ZW5icjA6IHBvcnQgMih2aWYxLjApIGVudGVyZWQgZm9yd2Fy
ZGluZyANCnN0YXRlDQpNYXIgMTMgMjM6NTE6MjYuMjg3MzQ2IChYRU4pIGNvbW1vbi9ncmFu
dF90YWJsZS5jOjI5ODI6ZDB2MyBjb3B5IGJleW9uZCBwYWdlIGFyZWENCk1hciAxMyAyMzo1
MTo0OC4xMTUzODMgKFhFTikgY29tbW9uL2dyYW50X3RhYmxlLmM6Mjk4MjpkMHYzIGNvcHkg
YmV5b25kIHBhZ2UgYXJlYQ0KTWFyIDEzIDIzOjUxOjQ5LjEyMzM0NyAoWEVOKSBjb21tb24v
Z3JhbnRfdGFibGUuYzoyOTgyOmQwdjMgY29weSBiZXlvbmQgcGFnZSBhcmVhDQpNYXIgMTMg
MjM6NTE6NDkuNDU5MzY3IChYRU4pIGNvbW1vbi9ncmFudF90YWJsZS5jOjI5ODI6ZDB2MyBj
b3B5IGJleW9uZCBwYWdlIGFyZWENCg0KR2l2ZW4gdGhlIHZpZiByZWxhdGVkIG1lc3NhZ2Ug
ZGlyZWN0bHkgYmVmb3JlIHRob3NlIGVycm9ycyB0aGUgY2hhbmNlIGlzIGhpZ2gNCnRoaXMg
cHJvYmxlbSBpcyByZWxhdGVkIHRvIG5ldGJhY2suDQoNClJvc3MsIHlvdXIgcGF0Y2ggInhl
bi9uZXRiYWNrOiBFbnN1cmUgcHJvdG9jb2wgaGVhZGVycyBkb24ndCBmYWxsIGluIHRoZQ0K
bm9uLWxpbmVhciBhcmVhIiAodXBzdHJlYW0gY29tbWl0IGFkN2Y0MDJhZTRmNDY2NikgZGlk
IHRoZSBtb3N0IHJlY2VudCBjaGFuZ2VzDQppbiBuZXRiYWNrIGFmZmVjdGluZyBHTlRUQUJP
UF9jb3B5IG9wZXJhdGlvbnMuIFRoZXJlIGFyZSBwcm9iYWJseSBwYWdlIGJvdW5kYXJ5DQpj
aGVja3MgKHByb2JhYmx5IG9uIG5ldGJhY2sgc2lkZSkgbWlzc2luZy4gQ291bGQgeW91IHBs
ZWFzZSBoYXZlIGEgbG9vaz8NCg0KDQpKdWVyZ2VuDQoNClsxXTogDQpodHRwOi8vbG9ncy50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc5NjA3L3Rlc3QtYW1kNjQt
YW1kNjQteGwvc2VyaWFsLWFsYmFuYTAubG9nDQo=
--------------dCC6zSEQtk5eAbRMNfahW5yS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------dCC6zSEQtk5eAbRMNfahW5yS--

--------------4nx8102QRlUGq4B0t0nK75n0--

--------------x3EgoHg6jXHUAbEx03E0afjW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQQdlYFAwAAAAAACgkQsN6d1ii/Ey9s
Jwf7BwqPpexsxkXbKxJqZwCiD/EQh/kMSXB0IsB6oCH+Ttt1XN/zlDmi3Mvqd48GlR8i2ZisY3+n
foMfuOZdvIKmoUQ5j/DLbKBtWrvRMO68yafEtdj+BcO8r+bMThY63L02SSAfngMYdmv8GBQuCMiv
08v05JAcUSfdQLdfcOKwA6wl+NMgrjzocYNGe74afzE/OJZWIo4ZVGoBtzijGsuSWWxCpyGmBD+f
JqigdkpUPf/K4SVSQuaO+B9o3IlyxeYCO9mb+MK88Xd2W/g2rwPrUM/PirlAU67K7rzqaUk5S4D1
AN42TdzCBRmoiRTVu2FscO+UUFNa86kbC+dXrrWVlg==
=9WTR
-----END PGP SIGNATURE-----

--------------x3EgoHg6jXHUAbEx03E0afjW--

