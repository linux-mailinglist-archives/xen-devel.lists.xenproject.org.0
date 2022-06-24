Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D1559A28
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 15:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355566.583289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4j6f-0003Pb-3V; Fri, 24 Jun 2022 13:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355566.583289; Fri, 24 Jun 2022 13:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4j6f-0003MQ-0P; Fri, 24 Jun 2022 13:12:17 +0000
Received: by outflank-mailman (input) for mailman id 355566;
 Fri, 24 Jun 2022 13:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4j6d-0003MH-27
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 13:12:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43705efd-f3bf-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 15:12:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A6811F909;
 Fri, 24 Jun 2022 13:12:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 042FC13480;
 Fri, 24 Jun 2022 13:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZlBdOyy4tWJMeQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Jun 2022 13:12:12 +0000
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
X-Inumbo-ID: 43705efd-f3bf-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656076333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8evYzFwvo69rzCly7bkSSEquukJj4VadkKuCgUkp5U0=;
	b=L8i/stBbiZn8Np5eet3LS6aHcdtlFDIyYSB3ytyQyvywfp8RyqcpIensUryImtHUYhrDhF
	hP2yWwx5uhbJ+Th2fbJ8Ghn0j0KJCycVPiRHNl+RMoHClq6fO4u4ZLW4IlTIFmCG72gB/U
	+qt6KYxua2aonkiLWaFtvEjsnk8kL8U=
Message-ID: <b05fd5b4-c419-256d-ec56-7916cef74b39@suse.com>
Date: Fri, 24 Jun 2022 15:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: Oleksandr <olekstysh@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
 <CAFLBxZbm0KcLhpqs2tGXgx6-JP+3OtkMEReTaphBC-JHZ3sJDQ@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
In-Reply-To: <CAFLBxZbm0KcLhpqs2tGXgx6-JP+3OtkMEReTaphBC-JHZ3sJDQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2jYlYO08nbwtwG0jJEVYbgvG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2jYlYO08nbwtwG0jJEVYbgvG
Content-Type: multipart/mixed; boundary="------------Nx6tv1gxiDXRxjqsti0IM9Cr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <dunlapg@umich.edu>
Cc: Oleksandr <olekstysh@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
Message-ID: <b05fd5b4-c419-256d-ec56-7916cef74b39@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
 <CAFLBxZbm0KcLhpqs2tGXgx6-JP+3OtkMEReTaphBC-JHZ3sJDQ@mail.gmail.com>
In-Reply-To: <CAFLBxZbm0KcLhpqs2tGXgx6-JP+3OtkMEReTaphBC-JHZ3sJDQ@mail.gmail.com>

--------------Nx6tv1gxiDXRxjqsti0IM9Cr
Content-Type: multipart/mixed; boundary="------------U8zeXxs5PUPL4lklEHwmAIjr"

--------------U8zeXxs5PUPL4lklEHwmAIjr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjIgMTQ6NDUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIFdlZCwgRGVj
IDE1LCAyMDIxIGF0IDM6NTggUE0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tIA0K
PiA8bWFpbHRvOmpncm9zc0BzdXNlLmNvbT4+IHdyb3RlOg0KPiANCj4gICAgIE9uIDE1LjEy
LjIxIDE2OjAyLCBPbGVrc2FuZHIgd3JvdGU6IA0KPiANCj4gDQo+ICAgICBJbiBwcmFjdGlj
ZSB3ZSBhcmUgaGF2aW5nIHNvbWV0aGluZyBsaWtlIHRoZSAicHJvdG9jb2wiIGFscmVhZHkg
dG9kYXk6DQo+ICAgICB0aGUgZGlzayBkZXZpY2UgbmFtZSBpcyBlbmNvZGluZyB0aGF0ICgi
eHZkKiIgaXMgYSBYZW4gUFYgZGlzaywgd2hpbGUNCj4gICAgICJzZCoiIGlzIGFuIGVtdWxh
dGVkIFNDU0kgZGlzaywgd2hpY2ggaGFwcGVucyB0byBiZSBwcmVzZW50ZWQgdG8gdGhlDQo+
ICAgICBndWVzdCBhcyAieHZkKiIsIHRvbykuIEFuZCB0aGlzIGlzIGFuIGFkZGl0aW9uYWwg
aW5mb3JtYXRpb24gbm90DQo+ICAgICByZWxhdGVkIHRvIHRoZSBiYWNrZW5kdHlwZS4NCj4g
DQo+ICAgICBTbyB3ZSBoYXZlIGJhc2ljYWxseSB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRp
b24gaXRlbXMsIHdoaWNoIGFyZQ0KPiAgICAgb3J0aG9nb25hbCB0byBlYWNoIG90aGVyIChz
b21lIGNvbWJpbmF0aW9ucyBtaWdodCBub3QgbWFrZSBzZW5zZSwNCj4gICAgIGJ1dCBpbiB0
aGVvcnkgbW9zdCB3b3VsZCBiZSBwb3NzaWJsZSk6DQo+IA0KPiAgICAgMS4gcHJvdG9jb2w6
IGVtdWxhdGVkIChub3QgUFYpLCBYZW4gKGxpa2UgdG9kYXkpLCB2aXJ0aW8NCj4gDQo+ICAg
ICAyLiBiYWNrZW5kdHlwZTogcGh5IChibGtiYWNrKSwgcWRpc2sgKHFlbXUpLCBvdGhlciAo
ZS5nLiBhIGRhZW1vbikNCj4gDQo+ICAgICAzLiBmb3JtYXQ6IHJhdywgcWNvdywgcWNvdzIs
IHZoZCwgcWVkDQo+IA0KPiAgICAgVGhlIGNvbWJpbmF0aW9uIHZpcnRpbytwaHkgd291bGQg
YmUgZXF1aXZhbGVudCB0byB2aG9zdCwgQlRXLiBBbmQNCj4gICAgIHZpcnRpbytvdGhlciBt
aWdodCBldmVuIHVzZSB2aG9zdC11c2VyLCBkZXBlbmRpbmcgb24gdGhlIGRhZW1vbi4NCj4g
DQo+IA0KPiBTb3JyeSB0byBmbHkgaW4gaGVyZSA3IG1vbnRocyBhZnRlciB0aGUgZmFjdCB0
byBxdWliYmxlIGFib3V0IHNvbWV0aGluZywgYnV0IA0KPiBzaW5jZSB3ZSdyZSBiYWtpbmcg
c29tZXRoaW5nIGludG8gYW4gZXh0ZXJuYWwgaW50ZXJmYWNlLCBJIHRoaW5rIGl0J3Mgd29y
dGggDQo+IG1ha2luZyBzdXJlIHdlIGdldCBpdCBleGFjdGx5IHJpZ2h0Lg0KPiANCj4gSXQg
c2VlbXMgdG8gbWUgdGhhdCB0aGUgY3VycmVudCB3YXkgdGhhdCAiYmFja2VuZHR5cGUiIGlz
IHVzZWQgaXMgdG8gdGVsbCBsaWJ4bCANCj4gaG93IHRvIHNldCB1cCB0aGUgY29ubmVjdGlv
bi7CoCBGb3IgInBoeSIsIGl0IHRhbGtzIHRvIHRoZSBkb20wIGJsa2JhY2sgZHJpdmVyLCAN
Cj4gYW5kIGhhbmRzIGl0IGEgZmlsZSBvciBzb21lIG90aGVyIHBoeXNpY2FsIGRldmljZS7C
oCBGb3IgcWRpc2ssIGl0IHRhbGtzIHRvIHRoZSANCj4gUUVNVSB3aGljaCBpcyBhbHJlYWR5
IGFzc29jaWF0ZWQgd2l0aCB0aGUgZG9tYWluOiBlaXRoZXIgdGhlIHFkaXNrIHByb2Nlc3Mg
DQo+IHN0YXJ0ZWQgdXAgd2hlbiB0aGUgUFYvSCBkb21haW4gd2FzIGNyZWF0ZWQsIG9yIHRo
ZSBlbXVsYXRvciBzdGFydGVkIHVwIHdoZW4gdGhlIA0KPiBIVk0gZ3Vlc3Qgd2FzIGNyZWF0
ZWQuwqAgKENvcnJlY3QgbWUgaWYgSSd2ZSBtYWRlIGEgbWlzdGFrZSBoZXJlLikNCj4gDQo+
IEdpdmVuIHRoYXQsICJvdGhlciIgaXMganVzdCB3cm9uZy7CoCBUaGUgdG9vbHN0YWNrIG5l
ZWRzIHRvIGtub3cgKnNwZWNpZmljYWxseSogDQo+IGhvdyB0byBkcml2ZSB0aGUgdGhpbmcg
dGhhdCdzIGdvaW5nIHRvIGJlIHByb3ZpZGluZyB0aGUgcHJvdG9jb2wuwqAgSSdtIG5vdCBz
dXJlIA0KPiB3aGF0IHlvdSdyZSBleHBlY3RpbmcgdG8gdXNlIGluIHRoaXMgY2FzZSwgYnV0
IHByZXN1bWFibHkgaWYgd2UncmUgYWRkaW5nIGEgDQo+IHRoaXJkIHRoaW5nIChpbiBhZGRp
dGlvbiB0byBibGtiYWNrIGFuZCBRRU1VKSwgdGhlbiBhdCBzb21lIHBvaW50IHdlJ3JlIGdv
aW5nIHRvIA0KPiBiZSBhZGRpbmcgYSBmb3VydGggdGhpbmcsIGFuZCBhIGZpZnRoIHRoaW5n
IGFzIHdlbGwuwqAgV2hhdCBkbyB3ZSBjYWxsIHRoZW0/ICANCj4gIk90aGVyIG90aGVyIiBh
bmQgIm90aGVyIG90aGVyIG90aGVyIj8NCg0KVGhlIGlkZWEgd2FzIHRvIGFsbG93IGFuIHVu
c3BlY2lmaWVkIGV4dGVybmFsIGNvbXBvbmVudCB0byBiZSB1c2VkLiBJdA0Kd291bGQgb25s
eSBuZWVkIGluZm9ybWF0aW9uIGF2YWlsYWJsZSBpbiBYZW5zdG9yZSBhbmQgImRvIHRoZSBy
aWdodCB0aGluZyIuDQoNClRoaXMgYWxsb3dzIHRvIGhhdmUgY3VzdG9tIGJhY2tlbmRzIHdp
dGhvdXQgaGF2aW5nIHRvIG1vZGlmeSAobGliKXhsIG9yDQp0aGUgY29uZmlnIHN5bnRheCBp
biBjYXNlIGEgbmV3IG9uZSBpcyBiZWluZyBhZGRlZC4NCg0KSW4gY2FzZSBYZW5zdG9yZSBp
c24ndCBlbm91Z2ggZm9yIHRoZSBuZWVkZWQgaW5mb3JtYXRpb24gb2YgYSBuZXcgYmFja2Vu
ZCwNCmEgbW9yZSBzcGVjaWZpYyBiYWNrZW5kdHlwZSB3b3VsZCBiZSBuZWVkZWQuDQoNCj4g
SWYgd2UncmUgcGxhbm5pbmcgb24gaGF2aW5nIGEgZ2VuZXJhbCBpbnRlcmZhY2UgZm9yIHRo
ZXNlIGRhZW1vbnMgdGhhdCBhcmUgZ29pbmcgDQo+IHRvIGJlIGJlIHZpcnRpbyBwcm92aWRl
cnMsIHdlIHNob3VsZCBjb21lIHVwIHdpdGggYSBzcGVjaWZpYyBuYW1lIGZvciB0aGVtIGFz
IGEgDQo+IGNsYXNzLCBhbmQgdXNlIHRoYXQgZm9yIHRoZSBuYW1lLg0KPiANCj4gRnVydGhl
cm1vcmUsICJ2aXJ0aW8rcGh5ID09IHZob3N0IiBpcyBqdXN0IHdyb25nOiBwaHkgbWVhbnMg
dGhhdCBsaWJ4bCBpcyB1c2luZyANCj4gYmxrYmFjaywgYW5kIGJsa2JhY2sgY2FuJ3Qgc3Bl
YWsgdGhlIHZpcnRpbyBwcm90b2NvbC7CoCBJZiB3ZSB3YW50IHRvIHVzZSB2aG9zdCANCj4g
KG9yIHNvbWV0aGluZyBsaWtlIGl0KSwgdGhlbiBpdCB3aWxsIG5lZWQgaXRzIG93biBzZXBh
cmF0ZSBiYWNrZW5kdHlwZS4NCg0KUmVhbGx5PyBUb2RheSAidmlydGlvIiArICJwaHkiIGlz
bid0IHVzZWQgYW55d2hlcmUsIGFzIGl0IGN1cnJlbnRseSBtYWtlcyBubw0Kc2Vuc2UuIEp1
c3QgYmVjYXVzZSAicGh5IiBoYXMgYmVlbiB1c2VkIGZvciBibGtiYWNrLCBpdCBkb2Vzbid0
IG1lYW4gdGhhdA0KdGhpcyBuZWVkcyB0byBzdGF5IHRoaXMgd2F5LiBXaXRoIHRoZSBuZXcg
c2NoZW1lLCAieGVuK3BoeSIgbWVhbnMgYmxrYmFjaywNCndoaWxlICJ2aXJ0aW8rcGh5IiBp
cyB5ZXQgdW5kZWZpbmVkLiBJZGVudGlmeWluZyAicGh5IiB3aXRoIGEgInBoeXNpY2FsIGRl
dmljZSIsDQppdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHVzZSAidmlydGlvK3BoeSIgZm9yIHZo
b3N0LCBhcyB2aG9zdC1ibG9jayBpcyB0aGUNCmVxdWl2YWxlbnQgdG8gYmxrYmFjayBpbiB0
aGUgdmlydGlvIHdvcmxkLg0KDQoNCkp1ZXJnZW4NCg==
--------------U8zeXxs5PUPL4lklEHwmAIjr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------U8zeXxs5PUPL4lklEHwmAIjr--

--------------Nx6tv1gxiDXRxjqsti0IM9Cr--

--------------2jYlYO08nbwtwG0jJEVYbgvG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK1uCwFAwAAAAAACgkQsN6d1ii/Ey/b
ugf/TrWywdkIHq2tdD+8Jxo4MeeyyCyaoHz9RIGtDhda05ogY89oI6m/594hNwQkGy63GtuXvu6g
AncJNAPUhb5ZEgClItZlp9/P/HffOsiiOhLg6uM5odwXjwCyiW1JT233H6Y1+9FO6dAkuYM02fNV
D2sKKkQFdZatZH2npsXs20O9tcRlq7rbFloYcFT7pC2dEas9CSgjq0PlD/2kbWyr+N9dbxNaFM0T
mBgqr/5wAzhVkcmbkK1Nfh1V36c3+PevkZCpiwiD66RZkypDaK/lyJ3SNmf9Ph+mKbhIWVHwZX3Q
bSY8vEkTY4LRxL9K+oAQBF5TMEezyzxlNToSkbcQKQ==
=+HS9
-----END PGP SIGNATURE-----

--------------2jYlYO08nbwtwG0jJEVYbgvG--

