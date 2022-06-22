Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAEE554850
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 14:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353824.580814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zEw-0007PD-2c; Wed, 22 Jun 2022 12:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353824.580814; Wed, 22 Jun 2022 12:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zEv-0007MY-Vx; Wed, 22 Jun 2022 12:13:45 +0000
Received: by outflank-mailman (input) for mailman id 353824;
 Wed, 22 Jun 2022 12:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3zEu-0007MS-RL
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 12:13:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1b0dca7-f224-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 14:13:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 747661FD03;
 Wed, 22 Jun 2022 12:13:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42D3013A5D;
 Wed, 22 Jun 2022 12:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iA4EDnYHs2JxBwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 12:13:42 +0000
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
X-Inumbo-ID: c1b0dca7-f224-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655900022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nyz5d+Nfti6ATwCcKW/q97KnzMJtSbCcqDsc1SjYCpo=;
	b=XvpRQe6MZnEPaTJj/QI8pXk5tRINNyXNHyE47OIwPrMC5cFG2eOA7NjxfD4kPtTG282/2M
	yA32C6JfdI5/YLt2dN9N5alEw/c3dh6CnwID5sFXEpjBGI/V5lHNlvDNHl2toyE5Huzi0u
	I8JZlLbPI7fCIcrgz4FFQNEkiiWazHo=
Message-ID: <bc8899d7-0300-8640-57d9-52c2a1bf599c@suse.com>
Date: Wed, 22 Jun 2022 14:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
 <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Tentative fix for dom0 boot problem
In-Reply-To: <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0WbjTE05TTpPXqsbwm0Ut7e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L0WbjTE05TTpPXqsbwm0Ut7e
Content-Type: multipart/mixed; boundary="------------7o6Slg9VvQkxA3AwnxNLmKTP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bc8899d7-0300-8640-57d9-52c2a1bf599c@suse.com>
Subject: Re: Tentative fix for dom0 boot problem
References: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
 <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>
In-Reply-To: <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>

--------------7o6Slg9VvQkxA3AwnxNLmKTP
Content-Type: multipart/mixed; boundary="------------2l6dvOFPu0Bx0QNLZKxZGb0k"

--------------2l6dvOFPu0Bx0QNLZKxZGb0k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDYuMjIgMTI6NTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAy
Mi8wNi8yMDIyIDExOjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSnVsaWVuLA0KPiAN
Cj4gSGkgSnVlcmdlbiwNCj4gDQo+PiBjb3VsZCB5b3UgcGxlYXNlIHRlc3QgdGhlIGF0dGFj
aGVkIHBhdGNoZXM/DQo+IA0KPiBJIGFtIGdldHRpbmcgdGhlIGZvbGxvd2luZyBlcnJvcjoN
Cj4gDQo+IChYRU4pIGQwdjAgVW5oYW5kbGVkOiB2ZWMgMTQsICNQRlswMDAzXQ0KPiAoWEVO
KSBQYWdldGFibGUgd2FsayBmcm9tIGZmZmZmZmZmODQwMDEwMDA6DQo+IChYRU4pwqAgTDRb
MHgxZmZdID0gMDAwMDAwMDQ2YzAwNDA2NyAwMDAwMDAwMDAwMDA0MDA0DQo+IChYRU4pwqAg
TDNbMHgxZmVdID0gMDAwMDAwMDQ2YzAwMzA2NyAwMDAwMDAwMDAwMDA0MDAzDQo+IChYRU4p
wqAgTDJbMHgwMjBdID0gMDAwMDAwMDQ2YzAyNDA2NyAwMDAwMDAwMDAwMDA0MDI0DQo+IChY
RU4pwqAgTDFbMHgwMDFdID0gMDAxMDAwMDQ2YzAwMTAyNSAwMDAwMDAwMDAwMDA0MDAxDQoN
CkhtbSwgZnJvbSB0aGlzIGRhdGEgSSBndWVzcyB0aGlzIHdhcyBhIHdyaXRlIHRvIGEgcGFn
ZSB0YWJsZS4NCg0KPiAoWEVOKSBkb21haW5fY3Jhc2hfc3luYyBjYWxsZWQgZnJvbSBlbnRy
eS5TOiBmYXVsdCBhdCBmZmZmODJkMDQwMzI1OTA2IA0KPiB4ODZfNjQvZW50cnkuUyNjcmVh
dGVfYm91bmNlX2ZyYW1lKzB4MTVkLzB4MTc3DQo+IChYRU4pIERvbWFpbiAwICh2Y3B1IzAp
IGNyYXNoZWQgb24gY3B1IzE6DQo+IChYRU4pIC0tLS1bIFhlbi00LjE3LXVuc3RhYmxlwqAg
eDg2XzY0wqAgZGVidWc9ecKgIFRhaW50ZWQ6wqDCoCBDwqDCoMKgIF0tLS0tDQo+IChYRU4p
IENQVTrCoMKgwqAgMQ0KPiAoWEVOKSBSSVA6wqDCoMKgIGUwMzM6WzxmZmZmZmZmZjgzMmEz
NDgxPl0NCg0KQ2FuIHlvdSBwbGVhc2UgZmluZCBvdXQgdGhlIGFzc29jaWF0ZWQgc3RhdGVt
ZW50Pw0KDQo+IChYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAwMDIwNsKgwqAgRU06IDHCoMKg
IENPTlRFWFQ6IHB2IGd1ZXN0IChkMHYwKQ0KPiAoWEVOKSByYXg6IDAwMDAwMDAwMDAwMDAw
MDDCoMKgIHJieDogZmZmZmZmZmY4NDAwMDAwMMKgwqAgcmN4OiAwMDAwMDAwMDAwMDJiMDAw
DQo+IChYRU4pIHJkeDogZmZmZmZmZmY4NDAwMDAwMMKgwqAgcnNpOiBmZmZmZmZmZjg0MDAw
MDAwwqDCoCByZGk6IGZmZmZmZmZmODQwMDEwMDANCj4gKFhFTikgcmJwOiAwMDAwMDAwMDAw
MDAwMDAwwqDCoCByc3A6IGZmZmZmZmZmODJhMDNlNjDCoMKgIHI4OsKgIDAwMDAwMDAwMDAw
MDAwMDANCj4gKFhFTikgcjk6wqAgMDAwMDAwMDAwMDAwMDAwMMKgwqAgcjEwOiAwMDAwMDAw
MDAwMDAwMDAwwqDCoCByMTE6IDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTikgcjEyOiAwMDAw
MDAwMDAwMDAwMDAwwqDCoCByMTM6IDAwMDAwMDAwMDAwMDAwMDDCoMKgIHIxNDogMDAwMDAw
MDAwMDAwMDAwMA0KPiAoWEVOKSByMTU6IDAwMDAwMDAwMDAwMDAwMDDCoMKgIGNyMDogMDAw
MDAwMDA4MDA1MDAzM8KgwqAgY3I0OiAwMDAwMDAwMDAwMzQyNmUwDQo+IChYRU4pIGNyMzog
MDAwMDAwMDQ2YzAwMTAwMMKgwqAgY3IyOiBmZmZmZmZmZjg0MDAxMDAwDQo+IChYRU4pIGZz
YjogMDAwMDAwMDAwMDAwMDAwMMKgwqAgZ3NiOiBmZmZmZmZmZjgzMjcxMDAwwqDCoCBnc3M6
IDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTikgZHM6IDAwMDDCoMKgIGVzOiAwMDAwwqDCoCBm
czogMDAwMMKgwqAgZ3M6IDAwMDDCoMKgIHNzOiBlMDJiwqDCoCBjczogZTAzMw0KPiAoWEVO
KSBHdWVzdCBzdGFjayB0cmFjZSBmcm9tIHJzcD1mZmZmZmZmZjgyYTAzZTYwOg0KPiAoWEVO
KcKgwqDCoCAwMDAwMDAwMDAwMDJiMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMyBmZmZmZmZmZjgzMmEzNDgxDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAxMDAwMGUwMzAg
MDAwMDAwMDAwMDAxMDAwNiBmZmZmZmZmZjgyYTAzZWE4IDAwMDAwMDAwMDAwMGUwMmINCj4g
KFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCBmZmZmZmZmZjgzMmFlODg0IDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
DQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCBmZmZmZmZmZjgzMmEzMTdmIDAwMDAwMDAw
MDAwMDAwMDANCg0KRnVydGhlciBhbmFseXNpcyBtaWdodCBiZSBlYXNpZXIgaWYgeW91IGNh
biBzdXBwbHkgZnVuY3Rpb24gKyBkaXNwbGFjZW1lbnQgZm9yDQphbnkgdGV4dCBzZWdtZW50
IGFkZHJlc3NlcyBvbiB0aGUgc3RhY2suDQoNCkJUVywgSSBjb3VsZCBib290IHRoZSBrZXJu
ZWwgd2l0aCBteSBwYXRjaGVzIGFzIERvbTAgd2l0aG91dCBhbnkgcHJvYmxlbS4gT1RPSA0K
aXQgYm9vdGVkIGV2ZW4gd2l0aG91dCB0aGUgcGF0Y2hlcy4gOi0pDQoNCg0KSnVlcmdlbg0K

--------------2l6dvOFPu0Bx0QNLZKxZGb0k
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2l6dvOFPu0Bx0QNLZKxZGb0k--

--------------7o6Slg9VvQkxA3AwnxNLmKTP--

--------------L0WbjTE05TTpPXqsbwm0Ut7e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKzB3UFAwAAAAAACgkQsN6d1ii/Ey/N
xQgAg7PauOQo/Oz56BZRiiz9fw5N19MVdonS9gkBAxsFHxBz0014y+NE4Aj9w/TrOxjeBuwk/V1v
BrsqYctmzudl1XdntkohHbPY0plS3WJSEy3uVGCFvJWMI+VlALzPAXULGEvoQ6ixEpQmW09enpBN
kOTsrL9DYkcAz6AfE2FTUFENvHcHPtnzB14J6SmaiDSrwgr2f5lZDYVod4uS7nTm/ZH2jAhp+C1M
O96npf5bNa/38xrCHyxTjl4JL8Cvgi4U511a3QWfvCo3ACROpsBWsbUB/PGxCQRTXIj2RRTHDV94
ELOOB+CPxQ673LvxozjXpTTGpL7XHtrxgte00eBThg==
=BmQY
-----END PGP SIGNATURE-----

--------------L0WbjTE05TTpPXqsbwm0Ut7e--

