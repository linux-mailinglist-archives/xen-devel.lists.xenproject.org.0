Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DB4ED40B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 08:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296668.505044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZoUl-0003CZ-O3; Thu, 31 Mar 2022 06:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296668.505044; Thu, 31 Mar 2022 06:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZoUl-0003Aj-JX; Thu, 31 Mar 2022 06:41:23 +0000
Received: by outflank-mailman (input) for mailman id 296668;
 Thu, 31 Mar 2022 06:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8eLM=UK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nZoUk-0003Ad-8o
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 06:41:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9328ca12-b0bd-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 08:41:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32C2D1F869;
 Thu, 31 Mar 2022 06:41:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B33B13B4C;
 Thu, 31 Mar 2022 06:41:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gDbvBBBNRWLESwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 31 Mar 2022 06:41:20 +0000
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
X-Inumbo-ID: 9328ca12-b0bd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648708880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8vmQjSEtK9ARIdU7u1ijSRNMyJLYDkCAZuZG8rlBZw=;
	b=C6pe7EO3ptpY+jw/55LZ9IHTqB63NnbswczrU4QwW968RlsU2YkCs8GqsjWLBicR1IniPv
	f5QREXqoJ918Dx2C6RzjTB+RjI6qktbnob75ut3sgvDi70t+Z82JAAkCPmsomPMmeFg0MR
	/cpTVQCg2C6o2MX6uSkMlMvEfKe2+6k=
Message-ID: <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>
Date: Thu, 31 Mar 2022 08:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YkUlLvnEDdc5hwN4@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Increasing domain memory beyond initial maxmem
In-Reply-To: <YkUlLvnEDdc5hwN4@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aHA9xQwN0otxJl5QNoo0XV3U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aHA9xQwN0otxJl5QNoo0XV3U
Content-Type: multipart/mixed; boundary="------------gy19HGlLc9rvtXgs52qRXoQb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>
Subject: Re: Increasing domain memory beyond initial maxmem
References: <YkUlLvnEDdc5hwN4@mail-itl>
In-Reply-To: <YkUlLvnEDdc5hwN4@mail-itl>

--------------gy19HGlLc9rvtXgs52qRXoQb
Content-Type: multipart/mixed; boundary="------------z8UzPm1Weuz5SGSRPh900TvA"

--------------z8UzPm1Weuz5SGSRPh900TvA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDMuMjIgMDU6NTEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBJJ20gdHJ5aW5nIHRvIG1ha2UgdXNlIG9mIENPTkZJR19YRU5fQkFM
TE9PTl9NRU1PUllfSE9UUExVRz15IHRvIGluY3JlYXNlDQo+IGRvbWFpbiBtZW1vcnkgYmV5
b25kIGluaXRpYWwgbWF4bWVtLCBidXQgSSBoaXQgZmV3IGlzc3Vlcy4NCj4gDQo+IEEgbGl0
dGxlIGNvbnRleHQ6IGRvbWFpbnMgaW4gUXViZXMgT1Mgc3RhcnQgd2l0aCByYXRoZXIgbGl0
dGxlIG1lbW9yeQ0KPiAoNDAwTUIgYnkgZGVmYXVsdCkgYnV0IG1heG1lbSBzZXQgaGlnaGVy
ICg0R0IgYnkgZGVmYXVsdCkuIFRoZW4sIHRoZXJlIGlzDQo+IHFtZW1tYW4gZGFlbW9uLCB0
aGF0IGFkanVzdCBiYWxsb29uIHRhcmdldHMgZm9yIGRvbWFpbnMsIGJhc2VkIG9uIChhbW9u
Zw0KPiBvdGhlciB0aGluZ3MpIGRlbWFuZCByZXBvcnRlZCBieSB0aGUgZG9tYWlucyB0aGVt
c2VsdmVzLiBUaGVyZSBpcyBhbHNvIGENCj4gbGl0dGxlIHN3YXAsIHRvIG1pdGlnYXRlIHFt
ZW1tYW4gbGF0ZW5jeSAoZmV3IGh1bmRyZWRzIG1zIGF0IHdvcnN0KS4NCj4gVGhpcyBpbml0
aWFsIG1lbW9yeSA8IG1heG1tZW0gaW4gY2FzZSBvZiBQVkggLyBIVk0gbWFrZXMgdXNlIG9m
IFBvRA0KPiB3aGljaCBJJ20gdHJ5aW5nIHRvIGdldCByaWQgb2YuIEJ1dCBhbHNvLCBJSVVD
IExpbnV4IHdpbGwgd2FzdGUgc29tZQ0KPiBtZW1vcnkgZm9yIGJvb2trZWVwaW5nIGJhc2Vk
IG9uIG1heG1lbSwgbm90IGFjdHVhbGx5IHVzYWJsZSBtZW1vcnkuDQo+IA0KPiBGaXJzdCBp
c3N1ZTogYWZ0ZXIgdXNpbmcgYHhsIG1lbS1tYXhgLCBgeGwgbWVtLXNldGAgc3RpbGwgcmVm
dXNlcyB0bw0KPiBpbmNyZWFzZSBtZW1vcnkgbW9yZSB0aGFuIGluaXRpYWwgbWF4bWVtLiBU
aGF0J3MgYmVjYXVzZSB4bCBtZW0tbWF4IGRvZXMNCj4gbm90IHVwZGF0ZSAnbWVtb3J5L3N0
YXRpYy1tYXgnIHhlbnN0b3JlIG5vZGUuIFRoaXMgb25lIGlzIGVhc3kgdG8gd29yaw0KPiBh
cm91bmQuDQo+IA0KPiBUaGVuLCB0aGUgYWN0dWFsIGhvdHBsdWcgZmFpbHMgb24gdGhlIGRv
bVUgc2lkZSB3aXRoOg0KPiANCj4gWyAgIDUwLjAwNDczNF0geGVuLWJhbGxvb246IHZtZW1t
YXAgYWxsb2MgZmFpbHVyZTogb3JkZXI6OSwgbW9kZToweDRjYzAoR0ZQX0tFUk5FTHxfX0dG
UF9SRVRSWV9NQVlGQUlMKSwgbm9kZW1hc2s9KG51bGwpLGNwdXNldD0vLG1lbXNfYWxsb3dl
ZD0wDQo+IFsgICA1MC4wMDQ3NzRdIENQVTogMSBQSUQ6IDM0IENvbW06IHhlbi1iYWxsb29u
IE5vdCB0YWludGVkIDUuMTYuMTUtMS4zNy5mYzMyLnF1YmVzLng4Nl82NCAjMQ0KPiBbICAg
NTAuMDA0NzkyXSBDYWxsIFRyYWNlOg0KPiBbICAgNTAuMDA0Nzk5XSAgPFRBU0s+DQo+IFsg
ICA1MC4wMDQ4MDhdICBkdW1wX3N0YWNrX2x2bCsweDQ4LzB4NWUNCj4gWyAgIDUwLjAwNDgy
MV0gIHdhcm5fYWxsb2MrMHgxNjIvMHgxOTANCj4gWyAgIDUwLjAwNDgzMl0gID8gX19hbGxv
Y19wYWdlcysweDFmYS8weDIzMA0KPiBbICAgNTAuMDA0ODQyXSAgdm1lbW1hcF9hbGxvY19i
bG9jaysweDExYy8weDFjNQ0KPiBbICAgNTAuMDA0ODU2XSAgdm1lbW1hcF9wb3B1bGF0ZV9o
dWdlcGFnZXMrMHgxODUvMHg1MTkNCj4gWyAgIDUwLjAwNDg2OF0gIHZtZW1tYXBfcG9wdWxh
dGUrMHg5ZS8weDE2Yw0KPiBbICAgNTAuMDA0ODc4XSAgX19wb3B1bGF0ZV9zZWN0aW9uX21l
bW1hcCsweDZhLzB4YjENCj4gWyAgIDUwLjAwNDg5MF0gIHNlY3Rpb25fYWN0aXZhdGUrMHgy
MGEvMHgyNzgNCj4gWyAgIDUwLjAwNDkwMV0gIHNwYXJzZV9hZGRfc2VjdGlvbisweDcwLzB4
MTYwDQo+IFsgICA1MC4wMDQ5MTFdICBfX2FkZF9wYWdlcysweGMzLzB4MTUwDQo+IFsgICA1
MC4wMDQ5MjFdICBhZGRfcGFnZXMrMHgxMi8weDYwDQo+IFsgICA1MC4wMDQ5MzFdICBhZGRf
bWVtb3J5X3Jlc291cmNlKzB4MTJiLzB4MzIwDQo+IFsgICA1MC4wMDQ5NDNdICByZXNlcnZl
X2FkZGl0aW9uYWxfbWVtb3J5KzB4MTBjLzB4MTUwDQo+IFsgICA1MC4wMDQ5NThdICBiYWxs
b29uX3RocmVhZCsweDIwNi8weDM2MA0KPiBbICAgNTAuMDA0OTY4XSAgPyBkb193YWl0X2lu
dHJfaXJxKzB4YTAvMHhhMA0KPiBbICAgNTAuMDA0OTc4XSAgPyBkZWNyZWFzZV9yZXNlcnZh
dGlvbi5jb25zdHByb3AuMCsweDJlMC8weDJlMA0KPiBbICAgNTAuMDA0OTkxXSAga3RocmVh
ZCsweDE2Yi8weDE5MA0KPiBbICAgNTAuMDA1MDAxXSAgPyBzZXRfa3RocmVhZF9zdHJ1Y3Qr
MHg0MC8weDQwDQo+IFsgICA1MC4wMDUwMTFdICByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMA0K
PiBbICAgNTAuMDA1MDIyXSAgPC9UQVNLPg0KPiANCj4gRnVsbCBkbWVzZzogaHR0cHM6Ly9n
aXN0LmdpdGh1Yi5jb20vbWFybWFyZWsvNzJkZDFmOWRiZGQ2M2NmZTQ3OWM5NGEzZjQzOTJi
NDUNCj4gDQo+IEFmdGVyIHRoZSBhYm92ZSwgYGZyZWVgIHJlcG9ydHMgY29ycmVjdCBzaXpl
ICgxR0IgaW4gdGhpcyBjYXNlKSwgYnV0DQo+IHRoYXQgbWVtb3J5IHNlZW1zIHRvIGJlIHVu
dXNhYmxlIHJlYWxseS4gInVzZWQiIGlzIGtlcHQgbG93LCBhbmQgc29vbg0KPiBPT00ta2ls
bGVyIGtpY2tzIGluLg0KPiANCj4gSSBrbm93IHRoZSBpbml0aWFsIDQwME1CIGlzIG5vdCBt
dWNoIGZvciBhIGZ1bGwgTGludXgsIHdpdGggWDExIGV0Yy4gQnV0DQo+IEkgd291bGRuJ3Qg
ZXhwZWN0IGl0IHRvIGZhaWwgdGhpcyB3YXkgd2hlbiBfYWRkaW5nXyBtZW1vcnkuDQo+IA0K
PiBJJ3ZlIHRyaWVkIGFsc28gd2l0aCBpbml0aWFsIDgwME1CLiBJbiB0aGlzIGNhc2UsIEkg
ZG8gbm90IGdldCAiYWxsb2MNCj4gZmFpbHVyZSIgYW55IG1vcmUsIGJ1dCBtb25pdG9yaW5n
IGBmcmVlYCwgdGhlIGV4dHJhIG1lbW9yeSBzdGlsbCBkb2Vzbid0DQo+IHNlZW0gdG8gYmUg
dXNlZC4NCj4gDQo+IEFueSBpZGVhcz8NCj4gDQoNCkkgY2FuJ3QgcmVwcm9kdWNlIHRoYXQu
DQoNCkkgc3RhcnRlZCBhIGd1ZXN0IHdpdGggOEdCIG9mIG1lbW9yeSwgaW4gdGhlIGd1ZXN0
IEknbSBzZWVpbmc6DQoNCiMgdW5hbWUgLWENCkxpbnV4IGxpbnV4LWQxY3kgNS4xNy4wLXJj
NS1kZWZhdWx0KyAjNDA2IFNNUCBQUkVFTVBUIE1vbiBGZWIgMjEgMDk6MzE6MTIgQ0VUIA0K
MjAyMiB4ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXgNCiMgZnJlZQ0KICAgICAgICAg
dG90YWwgICAgIHVzZWQgICAgICBmcmVlICAgc2hhcmVkICBidWZmL2NhY2hlICAgYXZhaWxh
YmxlDQpNZW06ICA4MTc4MjYwICAgIDcxNjI4ICAgODAyMzMwMCAgICAgODU2MCAgICAgICA4
MzMzMiAgICAgODAxMDE5Ng0KU3dhcDogMjA5NzEzMiAgICAgICAgMCAgIDIwOTcxMzINCg0K
VGhlbiBJJ20gcmFpc2luZyB0aGUgbWVtb3J5IGZvciB0aGUgZ3Vlc3QgaW4gZG9tMDoNCg0K
IyB4bCBsaXN0DQpOYW1lICAgICAgICAgICAgICAgIElEICAgTWVtIFZDUFVzICAgICAgU3Rh
dGUgICBUaW1lKHMpDQpEb21haW4tMCAgICAgICAgICAgICAwICAyNjM0ICAgICA4ICAgICBy
LS0tLS0gICAgMTAxNi41DQpYZW5zdG9yZSAgICAgICAgICAgICAxICAgIDMxICAgICAxICAg
ICAtYi0tLS0gICAgICAgMC45DQpzbGUxNXNwMSAgICAgICAgICAgICAzICA4MTkwICAgICA2
ICAgICAtYi0tLS0gICAgIDE4NC42DQojIHhsIG1lbS1tYXggMyAxMDAwMA0KIyB4ZW5zdG9y
ZS13cml0ZSAvbG9jYWwvZG9tYWluLzMvbWVtb3J5L3N0YXRpYy1tYXggMTAyNDAwMDANCiMg
eGwgbWVtLXNldCAzIDEwMDAwDQojIHhsIGxpc3QNCk5hbWUgICAgICAgICAgICAgICAgSUQg
ICBNZW0gVkNQVXMgICAgICBTdGF0ZSAgIFRpbWUocykNCkRvbWFpbi0wICAgICAgICAgICAg
IDAgIDI2MzQgICAgIDggICAgIHItLS0tLSAgICAxMDE4LjUNClhlbnN0b3JlICAgICAgICAg
ICAgIDEgICAgMzEgICAgIDEgICAgIC1iLS0tLSAgICAgICAxLjANCnNsZTE1c3AxICAgICAg
ICAgICAgIDMgMTAwMDAgICAgIDYgICAgIC1iLS0tLSAgICAgMTg2LjcNCg0KSW4gdGhlIGd1
ZXN0IEkgZ2V0IG5vdzoNCg0KIyBmcmVlDQogICAgICAgICB0b3RhbCAgICAgdXNlZCAgICAg
ZnJlZSAgIHNoYXJlZCAgYnVmZi9jYWNoZSAgIGF2YWlsYWJsZQ0KTWVtOiAxMDAzMTcwMCAg
IDExMDkwNCAgOTczNDE3MiAgICAgODU2MCAgICAgIDE4NjYyNCAgICAgOTgxNDM0NA0KU3dh
cDogMjA5NzEzMiAgICAgICAgMCAgMjA5NzEzMg0KDQpBbmQgYWZ0ZXIgdXNpbmcgbG90cyBv
ZiBtZW1vcnkgdmlhIGEgcmFtZGlzazoNCg0KIyBmcmVlDQogICAgICAgICB0b3RhbCAgICAg
dXNlZCAgICAgZnJlZSAgIHNoYXJlZCAgYnVmZi9jYWNoZSAgIGF2YWlsYWJsZQ0KTWVtOiAx
MDAzMTcwMCAgIDExNjY2MCAgMTY2Mzg0MCAgNzE4MTc3NiAgICAgODI1MTIwMCAgICAgMjYz
NTM3Mg0KU3dhcDogMjA5NzEzMiAgICAgICAgMCAgMjA5NzEzMg0KDQpZb3UgY2FuIHNlZSBi
dWZmL2NhY2hlIGlzIG5vdyBsYXJnZXIgdGhhbiB0aGUgaW5pdGlhbCB0b3RhbCBtZW1vcnkN
CmFuZCBmcmVlIGlzIGxvd2VyIHRoYW4gdGhlIGFkZGVkIG1lbW9yeSBhbW91bnQuDQoNCg0K
SnVlcmdlbg0K
--------------z8UzPm1Weuz5SGSRPh900TvA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------z8UzPm1Weuz5SGSRPh900TvA--

--------------gy19HGlLc9rvtXgs52qRXoQb--

--------------aHA9xQwN0otxJl5QNoo0XV3U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJFTQ8FAwAAAAAACgkQsN6d1ii/Ey+2
mAf/X3ILRtyM3UwXJsaKwPnV5yGnGMm0GuK2wyHBTAnrDlTXH/SKjR5qY8IY2uab4XlEQcapzZqg
Ya6EOq2sBxm7V9YWkpG6bEcmbzInedqP8kMivdfHdKXS5RV37dE9QIVHJx2lFNUufTxcS489ERJN
WPrVwklO5H/IisJ3CMwACVGpQ+Mx5nEI77rlw2XnPVJezmv4XnufsEwfVPcceJTwLwbjhgMNCsOf
UUNqfiDCPxKgvVK9fy2RdzoyRNV5KCsvPGd5lXxt0VnVpcQejguTfZsgu9CfVnyr4mZ2/FG4RDKr
q97ER3Q0LdIJT5WR/OewTgy7YNAdQAdy9YxzmHpdAg==
=2JXV
-----END PGP SIGNATURE-----

--------------aHA9xQwN0otxJl5QNoo0XV3U--

