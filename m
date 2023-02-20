Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9469C940
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 12:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498010.768792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU3ya-0004G0-O7; Mon, 20 Feb 2023 11:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498010.768792; Mon, 20 Feb 2023 11:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU3ya-0004EG-Ks; Mon, 20 Feb 2023 11:04:56 +0000
Received: by outflank-mailman (input) for mailman id 498010;
 Mon, 20 Feb 2023 11:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMXb=6Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pU3yZ-0003zE-1P
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 11:04:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66206be3-b10e-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 12:04:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8827320005;
 Mon, 20 Feb 2023 11:04:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6300F134BA;
 Mon, 20 Feb 2023 11:04:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dax9FtNT82NBPAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Feb 2023 11:04:51 +0000
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
X-Inumbo-ID: 66206be3-b10e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676891091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F9/ZiE99IXAL27UTSrwjYZjIXy2MJesLf5yBAuf1/1s=;
	b=tuha3FVxmEx0Qe2IlORAXY3rEvNaGMSy7hQ0LauaBcWEELdWlNKuKORjm2a5PcFu3G8JBn
	zhH16AfDxPOnnP822msRWjxnTRuX0IPYpBb3pcsB4MmQ9Qk6pC+WurzH7himY78JOitXCt
	tyFSj89SZl6Wyz/YRfwYW9dQ0FNyWtA=
Message-ID: <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
Date: Mon, 20 Feb 2023 12:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
In-Reply-To: <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m0BE5fzngLLxza0vgqFxdubl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m0BE5fzngLLxza0vgqFxdubl
Content-Type: multipart/mixed; boundary="------------06BB4I4vDQMn8HcuKC07CLyu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
In-Reply-To: <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>

--------------06BB4I4vDQMn8HcuKC07CLyu
Content-Type: multipart/mixed; boundary="------------dUTlRdcje0VlHKvOLc8n9bAA"

--------------dUTlRdcje0VlHKvOLc8n9bAA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMTA6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIwLzAxLzIwMjMgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGUgYWNjb3VudGluZyBmb3IgdGhlIG51bWJlciBvZiBub2RlcyBvZiBhIGRvbWFpbiBpbiBh
biBhY3RpdmUNCj4+IHRyYW5zYWN0aW9uIGlzIG5vdCB3b3JraW5nIGNvcnJlY3RseSwgYXMg
aXQgYWxsb3dzIHRvIGNyZWF0ZSBhcmJpdHJhcnkNCj4+IG51bWJlciBvZiBub2Rlcy4gVGhl
IHRyYW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1ZSB0byBleGNlZWRpbmcNCj4+IHRo
ZSBudW1iZXIgb2Ygbm9kZXMgcXVvdGEsIGJ1dCBiZWZvcmUgY2xvc2luZyB0aGUgdHJhbnNh
Y3Rpb24gYW4NCj4+IHVucHJpdmlsZWdlZCBndWVzdCBjb3VsZCBjYXVzZSBYZW5zdG9yZSB0
byB1c2UgYSBsb3Qgb2YgbWVtb3J5Lg0KPiANCj4gSSBrbm93IEkgc2FpZCBJIHdvdWxkIGRl
bGF5IG15IGRlY2lzaW9uIG9uIHRoaXMgcGF0Y2guIEhvd2V2ZXIsIEkgd2FzIHN0aWxsIA0K
PiBleHBlY3RpbmcgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGJlIHVwZGF0ZWQgYmFzZWQgb24g
b3VyIHByZXZpb3VzIGRpc2N1c3Npb24uDQoNCkFzIHNhaWQgYmVmb3JlLCBJIHdhcyB3YWl0
aW5nIG9uIHRoZSBzZXR0bGVtZW50IG9mIG91ciBkaXNjdXNzaW9uIGJlZm9yZQ0KZG9pbmcg
dGhlIHVwZGF0ZS4NCg0KPiBBbHNvIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQsICJUaGUgdHJh
bnNhY3Rpb24gd2lsbCBmaW5hbGx5IGZhaWwgZHVlIHRvIGV4Y2VlZGluZyANCj4gdGhlIG51
bWJlciBvZiBub2RlcyBxdW90YSIgbWF5IG5vdCBiZSB0cnVlIGZvciBhIGNvdXBsZSBvZiBy
ZWFzb25zOg0KPiAgwqAgMSkgVGhlIHRyYW5zYWN0aW9uIG1heSByZW1vdmVkIGEgbm9kZSBh
ZnRlcndhcmRzLg0KDQpZZXMsIGFuZD8gSnVzdCBiZWNhdXNlIGl0IGlzIGEgdHJhbnNhY3Rp
b24sIHRoaXMgaXMgc3RpbGwgYSB2aW9sYXRpb24gb2YNCnRoZSBxdW90YS4gRXZlbiBvdXRz
aWRlIGEgdHJhbnNhY3Rpb24geW91IGNvdWxkIHVzZSB0aGUgc2FtZSByZWFzb25pbmcsDQpi
dXQgeW91IGRvbid0ICh3aGljaCBpcyBjb3JyZWN0LCBvZiBjb3Vyc2UpLg0KDQpJbiBjYXNl
IHlvdSBuZXZlciBmaW5pc2ggdGhlIHRyYW5zYWN0aW9uLCB5b3UgYXJlIG93bmVyIG9mIG1v
cmUgdGhhbg0KYWxsb3dlZCBub2Rlcy4NCg0KPiAgwqAgMikgQSBub2RlIG1heSBoYXZlIGJl
ZW4gcmVtb3ZlZCBvdXRzaWRlIG9mIHRoZSB0cmFuc2FjdGlvbi4NCg0KSWYgdGhlIHJlbW92
ZWQgbm9kZSBoYXNuJ3QgYmVlbiB0b3VjaGVkIGJ5IHRoZSB0cmFuc2FjdGlvbiwgaXQgd2ls
bCBiZQ0KYWNjb3VudGVkIGZvciBjb3JyZWN0bHkuIElmIGl0IGhhcyBiZWVuIHRvdWNoZWQs
IHRoZSB0cmFuc2FjdGlvbiB3aWxsDQpmYWlsIGFueXdheS4NCg0KPiBJbiBib3RoIHNpdHVh
dGlvbiwgdGhlIHRyYW5zYWN0aW9uIHdpbGwgc3RpbGwgYmUgY29tbWl0dGVkLiBUaGlzIHdp
bGwgbm93IGJlIA0KPiBwcmV2ZW50ZWQgYnkgdGhpcyBwYXRjaC4NCg0KQXMgc2FpZCBhYm92
ZSwgb25seSBpbiB0aGUgZmlyc3QgY2FzZS4NCg0KPiBXaGlsZSBJIHVuZGVyc3RhbmQsIHRo
ZXkgbWF5IGJlIGVkZ2UgY2FzZXMsIHRoaXMgaXMgYWxzbyB0cnVlIGZvciB3aGF0IHlvdSBh
cmUgDQo+IGFpbWluZyB0byBzb2x2ZS4gU28gSSBhbSBzdGlsbCBub3QgY29udmluY2VkIGFi
b3V0IHRoZSBiZW5lZml0cyBvZiB0aGlzIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg0K
--------------dUTlRdcje0VlHKvOLc8n9bAA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------dUTlRdcje0VlHKvOLc8n9bAA--

--------------06BB4I4vDQMn8HcuKC07CLyu--

--------------m0BE5fzngLLxza0vgqFxdubl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPzU9IFAwAAAAAACgkQsN6d1ii/Ey91
oQf+NY2d7F8BDg48JlJiuFADAdAFhsV3j8YOg/syntf4cRX+lrlVr+S1xACzXNTsgjQzg7onV3ux
wiLnVfz216A8NUyX3wG5SOMwL9xZQrDr9zh2UjA8ZFfCilin1v8a8CqQELL5OIlSiYCZHE/hJ/jo
jQZOc3PNmEqlKyB0KBKrjctF0myoPSHpGjalBHjWFlyqjgdNol1Wvz6xpxtTEYj/3BUTr7cg96fQ
rPQkUNpyBKs7O3ikhsk2P7bZV1pywKDLcwXguvARgVL/YwIW6/nr3D64F1p+eR7Pa8FnRz3Gp0jv
E/iqe3VduQlH6pPAXTruMGTk78rUSPltmkqrcr0AyQ==
=US7E
-----END PGP SIGNATURE-----

--------------m0BE5fzngLLxza0vgqFxdubl--

