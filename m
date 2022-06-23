Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BACF5574DA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354555.581717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HrW-0001yT-OW; Thu, 23 Jun 2022 08:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354555.581717; Thu, 23 Jun 2022 08:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HrW-0001w7-LG; Thu, 23 Jun 2022 08:06:50 +0000
Received: by outflank-mailman (input) for mailman id 354555;
 Thu, 23 Jun 2022 08:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4HrV-0001vz-8F
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:06:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6de4ce95-f2cb-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 10:06:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA6B41FD3B;
 Thu, 23 Jun 2022 08:06:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 905F8133A6;
 Thu, 23 Jun 2022 08:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zXu2IRcftGK+eAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 08:06:47 +0000
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
X-Inumbo-ID: 6de4ce95-f2cb-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655971607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doIDdn0aOABPHcXDiQsLrntQW0gdmP4ima+5H6rdDkM=;
	b=FdK0DDSShte1Tld6g2QoBTTjaJQqTX6wQluZl7mDEiZ7/fFdwEAHUGO75/ysc2X2nGg9dL
	mdaRO0w3OUFivZG51MsONTqRUYWDn15i7uRa+I9BXNl2NHtxjeh1Mi7v1SFtXI+B/K8/Sd
	2dWcifpi0OhbwrWjPTx/wILc/8DiMgk=
Message-ID: <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
Date: Thu, 23 Jun 2022 10:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Problem loading linux 5.19 as PV dom0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UV4NmG4z3h7tmtKl6dIKj0XU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UV4NmG4z3h7tmtKl6dIKj0XU
Content-Type: multipart/mixed; boundary="------------UfVWdtDCmUNP0UQO72LD4IvQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
Subject: Re: Problem loading linux 5.19 as PV dom0
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
In-Reply-To: <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>

--------------UfVWdtDCmUNP0UQO72LD4IvQ
Content-Type: multipart/mixed; boundary="------------PJjURniSlnlNfF70ktqO2YfB"

--------------PJjURniSlnlNfF70ktqO2YfB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wNi4yMDIy
IDE4OjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQSBMaW51eCBrZXJuZWwgNS4xOSBj
YW4gb25seSBiZSBsb2FkZWQgYXMgZG9tMCwgaWYgaXQgaGFzIGJlZW4NCj4+IGJ1aWx0IHdp
dGggQ09ORklHX0FNRF9NRU1fRU5DUllQVCBlbmFibGVkLiBUaGlzIGlzIGR1ZSB0byB0aGUN
Cj4+IGZhY3QgdGhhdCBvdGhlcndpc2UgdGhlIChyZWxldmFudCkgbGFzdCBzZWN0aW9uIG9m
IHRoZSBidWlsdA0KPj4ga2VybmVsIGhhcyB0aGUgTk9MT0FEIGZsYWcgc2V0IChpdCBpcyBz
dGlsbCBtYXJrZWQgd2l0aA0KPj4gU0hGX0FMTE9DKS4NCj4+DQo+PiBJIHRoaW5rIGF0IGxl
YXN0IHRoZSBoeXBlcnZpc29yIG5lZWRzIHRvIGJlIGNoYW5nZWQgdG8gc3VwcG9ydA0KPj4g
dGhpcyBsYXlvdXQuIE90aGVyd2lzZSBpdCB3aWxsIHB1dCB0aGUgaW5pdGlhbCBwYWdlIHRh
YmxlcyBmb3INCj4+IGRvbTAgYXQgdGhlIHNhbWUgcG9zaXRpb24gYXMgdGhpcyBsYXN0IHNl
Y3Rpb24sIGxlYWRpbmcgdG8NCj4+IGVhcmx5IGNyYXNoZXMuDQo+IA0KPiBJc24ndCBYZW4g
dXNpbmcgdGhlIGJ6SW1hZ2UgaGVhZGVyIHRoZXJlLCByYXRoZXIgdGhhbiBhbnkgRUxGDQo+
IG9uZT8gSW4gd2hpY2ggY2FzZSBpdCB3b3VsZCBtYXR0ZXIgaG93IHRoZSBOT0xPQUQgc2Vj
dGlvbiBpcw0KDQpGb3IgYSBQViBrZXJuZWw/IE5vLCBJIGRvbid0IHRoaW5rIHNvLiBKdXN0
IHNlbnQgYSBwYXRjaCByZXBhaXJpbmcNCnRoZSBpc3N1ZSwgQlRXLg0KDQo+IGFjdHVhbGx5
IHJlcHJlc2VudGVkIGluIHRoYXQgaGVhZGVyLiBDYW4geW91IHByb3ZpZGUgYSBkdW1wIChv
cg0KPiBiaW5hcnkgcmVwcmVzZW50YXRpb24pIG9mIGJvdGggaGVhZGVycz8NCg0KUHJvZ3Jh
bSBIZWFkZXI6DQogICAgIExPQUQgb2ZmICAgIDB4MDAwMDAwMDAwMDIwMDAwMCB2YWRkciAw
eGZmZmZmZmZmODEwMDAwMDAgcGFkZHIgDQoweDAwMDAwMDAwMDEwMDAwMDAgYWxpZ24gMioq
MjENCiAgICAgICAgICBmaWxlc3ogMHgwMDAwMDAwMDAxNDVlMTE0IG1lbXN6IDB4MDAwMDAw
MDAwMTQ1ZTExNCBmbGFncyByLXgNCiAgICAgTE9BRCBvZmYgICAgMHgwMDAwMDAwMDAxODAw
MDAwIHZhZGRyIDB4ZmZmZmZmZmY4MjYwMDAwMCBwYWRkciANCjB4MDAwMDAwMDAwMjYwMDAw
MCBhbGlnbiAyKioyMQ0KICAgICAgICAgIGZpbGVzeiAweDAwMDAwMDAwMDA2YjcwMDAgbWVt
c3ogMHgwMDAwMDAwMDAwNmI3MDAwIGZsYWdzIHJ3LQ0KICAgICBMT0FEIG9mZiAgICAweDAw
MDAwMDAwMDIwMDAwMDAgdmFkZHIgMHgwMDAwMDAwMDAwMDAwMDAwIHBhZGRyIA0KMHgwMDAw
MDAwMDAyY2I3MDAwIGFsaWduIDIqKjIxDQogICAgICAgICAgZmlsZXN6IDB4MDAwMDAwMDAw
MDAzMTJhOCBtZW1zeiAweDAwMDAwMDAwMDAwMzEyYTggZmxhZ3MgcnctDQogICAgIExPQUQg
b2ZmICAgIDB4MDAwMDAwMDAwMjBlOTAwMCB2YWRkciAweGZmZmZmZmZmODJjZTkwMDAgcGFk
ZHIgDQoweDAwMDAwMDAwMDJjZTkwMDAgYWxpZ24gMioqMjENCiAgICAgICAgICBmaWxlc3og
MHgwMDAwMDAwMDAwMWZkMDAwIG1lbXN6IDB4MDAwMDAwMDAwMDMxNzAwMCBmbGFncyByd3gN
CiAgICAgTk9URSBvZmYgICAgMHgwMDAwMDAwMDAxNjVkZjEwIHZhZGRyIDB4ZmZmZmZmZmY4
MjQ1ZGYxMCBwYWRkciANCjB4MDAwMDAwMDAwMjQ1ZGYxMCBhbGlnbiAyKioyDQogICAgICAg
ICAgZmlsZXN6IDB4MDAwMDAwMDAwMDAwMDIwNCBtZW1zeiAweDAwMDAwMDAwMDAwMDAyMDQg
ZmxhZ3MgLS0tDQoNCg0KU2VjdGlvbnM6DQpJZHggTmFtZSAgICAgICAgICBTaXplICAgICAg
Vk1BICAgICAgICAgICAgICAgTE1BICAgICAgICAgICAgICAgRmlsZSBvZmYgIEFsZ24NCi4u
Lg0KICAzMCAuc21wX2xvY2tzICAgIDAwMDA5MDAwICBmZmZmZmZmZjgyZWRjMDAwICAwMDAw
MDAwMDAyZWRjMDAwICAwMjJkYzAwMCAgMioqMg0KICAgICAgICAgICAgICAgICAgIENPTlRF
TlRTLCBBTExPQywgTE9BRCwgUkVBRE9OTFksIERBVEENCiAgMzEgLmRhdGFfbm9zYXZlICAw
MDAwMTAwMCAgZmZmZmZmZmY4MmVlNTAwMCAgMDAwMDAwMDAwMmVlNTAwMCAgMDIyZTUwMDAg
IDIqKjINCiAgICAgICAgICAgICAgICAgICBDT05URU5UUywgQUxMT0MsIExPQUQsIERBVEEN
CiAgMzIgLmJzcyAgICAgICAgICAwMDExYTAwMCAgZmZmZmZmZmY4MmVlNjAwMCAgMDAwMDAw
MDAwMmVlNjAwMCAgMDIyZTYwMDAgIDIqKjEyDQogICAgICAgICAgICAgICAgICAgQUxMT0MN
CiAgMzMgLmJyayAgICAgICAgICAwMDAyNjAwMCAgZmZmZmZmZmY4MzAwMDAwMCAgZmZmZmZm
ZmY4MzAwMDAwMCAgMDAwMDAwMDAgIDIqKjANCiAgICAgICAgICAgICAgICAgICBBTExPQw0K
DQpBbmQgdGhlIHJlbGF0ZWQgbGlua2VyIHNjcmlwdCBwYXJ0Og0KDQogICAgICAgICBfX2Vu
ZF9vZl9rZXJuZWxfcmVzZXJ2ZSA9IC47DQoNCiAgICAgICAgIC4gPSBBTElHTihQQUdFX1NJ
WkUpOw0KICAgICAgICAgLmJyayAoTk9MT0FEKSA6IEFUKEFERFIoLmJyaykgLSBMT0FEX09G
RlNFVCkgew0KICAgICAgICAgICAgICAgICBfX2Jya19iYXNlID0gLjsNCiAgICAgICAgICAg
ICAgICAgLiArPSA2NCAqIDEwMjQ7ICAgICAgICAgLyogNjRrIGFsaWdubWVudCBzbG9wIHNw
YWNlICovDQogICAgICAgICAgICAgICAgICooLmJzcy4uYnJrKSAgICAgICAgICAgIC8qIGFy
ZWFzIGJyayB1c2VycyBoYXZlIHJlc2VydmVkICovDQogICAgICAgICAgICAgICAgIF9fYnJr
X2xpbWl0ID0gLjsNCiAgICAgICAgIH0NCg0KICAgICAgICAgLiA9IEFMSUdOKFBBR0VfU0la
RSk7ICAgICAgICAgICAvKiBrZWVwIFZPX0lOSVRfU0laRSBwYWdlIGFsaWduZWQgKi8NCiAg
ICAgICAgIF9lbmQgPSAuOw0KDQoNCkp1ZXJnZW4NCg==
--------------PJjURniSlnlNfF70ktqO2YfB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PJjURniSlnlNfF70ktqO2YfB--

--------------UfVWdtDCmUNP0UQO72LD4IvQ--

--------------UV4NmG4z3h7tmtKl6dIKj0XU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0HxcFAwAAAAAACgkQsN6d1ii/Ey/t
DAf/YQPIu+2TFIXCGJ1Lu7ZBLCZgcPeDZm0wfRGIi8CFV2MG0NsUXIKgOHvJJWYTTPbPGcx4U5Lr
emLZabCgSMj/Tr2ZF0M4rg3qI9M+vgSQ2I6JK0Pl6fuVdkNT3C/xXySL45PVvA5zNcA1s1BvyD65
fbW7uNRqvx8VECKIvMXMxDw7JEOLZcOmQ9hWqETznz9swBxDH/XlrSBvCTBI/yEHaxVLpJHQ0D6a
9fY/B1UpOyTyIGfN47lp8zm1WQ3UivoFSSKLgtoNbOTU3n0CWZzCnLvyyc5Lds0eOaZ6JfbRohoi
hPnknOUlQeAXWr0fg6Yb0+uQBwO9wd5ze7c2A9sBuA==
=LIy9
-----END PGP SIGNATURE-----

--------------UV4NmG4z3h7tmtKl6dIKj0XU--

