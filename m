Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84833620AC3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 08:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439763.693811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osJR8-000721-AW; Tue, 08 Nov 2022 07:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439763.693811; Tue, 08 Nov 2022 07:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osJR8-0006zz-6k; Tue, 08 Nov 2022 07:54:22 +0000
Received: by outflank-mailman (input) for mailman id 439763;
 Tue, 08 Nov 2022 07:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MYs3=3I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1osJR6-0006zt-Ju
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 07:54:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be1fd9f-5f3a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 08:54:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9412422326;
 Tue,  8 Nov 2022 07:54:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71DEC13398;
 Tue,  8 Nov 2022 07:54:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fKaAGikLamNhOAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Nov 2022 07:54:17 +0000
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
X-Inumbo-ID: 8be1fd9f-5f3a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667894057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68pMislhyP16umI5FjgQvmDG34PnTcUD3qOoda9GIuk=;
	b=T3B/KZWzlgUECOXO4uDU0DUIEMI03mfwngsrm9R4yvbIlxWT0+p2dK/y5RK7c7RJwbe79a
	eH9ccYsR/9sx+HC8AyJFy45tjPt+L1ynHNdAKaD87Am/7DGfdkymP5cPohBmMzfFdxgJxY
	sBJjdQnpWRQKZ+ZaulKMbXlNkW3WQ6w=
Message-ID: <90878b0e-c40e-e4cc-e423-c514a72ede7f@suse.com>
Date: Tue, 8 Nov 2022 08:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
 <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
 <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
In-Reply-To: <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IogQt2NYCUGaoX16DyfJGZyP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IogQt2NYCUGaoX16DyfJGZyP
Content-Type: multipart/mixed; boundary="------------rn1rs0fJXTVmoo9Q0iurlvBt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <90878b0e-c40e-e4cc-e423-c514a72ede7f@suse.com>
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
 <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
 <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
In-Reply-To: <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>

--------------rn1rs0fJXTVmoo9Q0iurlvBt
Content-Type: multipart/mixed; boundary="------------vLr1oHpPQC8sctz7lUyLUUco"

--------------vLr1oHpPQC8sctz7lUyLUUco
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTEuMjIgMTk6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
Ny8xMS8yMDIyIDA3OjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDYuMTEuMjIg
MjI6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4g
T24gMDEvMTEvMjAyMiAxNToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gV2hlbiBh
IGRvbWFpbiBoYXMgYmVlbiByZWNvZ25pemVkIHRvIGhhdmUgc3RvcHBlZCwgcmVtb3ZlIGFs
bCBpdHMNCj4+Pj4gcmVnaXN0ZXJlZCB3YXRjaGVzLiBUaGlzIGF2b2lkcyBzZW5kaW5nIHdh
dGNoIGV2ZW50cyB0byB0aGUgZGVhZCBkb21haW4NCj4+Pj4gd2hlbiBhbGwgdGhlIG5vZGVz
IHJlbGF0ZWQgdG8gaXQgYXJlIGJlaW5nIHJlbW92ZWQgYnkgdGhlIFhlbiB0b29scy4NCj4+
Pg0KPj4+IMKgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBzaHV0ZG93biBkb2Vzbid0IG1lYW4g
ZGVhZC4gSXQgbWF5IGJlIHVzZWQgZHVyaW5nIA0KPj4+IG1pZ3JhdGlvbiAob3Igc25hcHNo
b3R0aW5nKSwgd2hlcmUgd2UgZG9uJ3Qgd2FudCB0byB0b3VjaCB0aGUgc3RhdGUgaW4gY2Fz
ZSANCj4+PiBvZiBhIGNhbmNlbGxhdGlvbiAob3IgcmVzdW1lKS4NCj4+Pg0KPj4+IEZvciBp
bnN0YW5jZSwgc2VlIHRoZSBjb21tYW5kIFhTX1JFU1VNRSB3aGljaCB3aWxsIGNsZWFyIGRv
bWFpbi0+c2h1dGRvd24uDQo+Pg0KPj4gT2gsIGdvb2QgY2F0Y2ghDQo+Pg0KPj4gSSBuZWVk
IHRvIGFkZGl0aW9uYWxseSBjaGVjayB0aGUgInNodXRkb3duIHJlYXNvbiIuIEkgY2FuIHJl
bW92ZSB0aGUNCj4+IHdhdGNoZXMgb25seSBpbiBjYXNlIG9mIHRoZSByZWFzb24gbm90IGhh
dmluZyBiZWVuICJzdXNwZW5kIi4NCj4gDQo+IFRoaXMgaXMgcXVpdGUgZnJhZ2lsZSBiZWNh
dXNlIHdlIG1heSBhZGQgbmV3IHNodXRkb3duIGNvZGUgaW4gdGhlIGZ1dHVyZSB0aGF0IA0K
PiBjb3VsZCByZXN1bWUuDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBv
bmx5IGRlbGV0ZSB0aGUgd2F0Y2hlcyBpZiB0aGUgZG9tYWluIGlzIA0KPiBlZmZlY3RpdmVs
eSBkeWluZyAoSSBkb24ndCB0aGluayBpdCBjYW4gY29tZSBiYWNrIGZyb20gdGhhdCBzdGF0
ZSkNCg0KVGhpcyBpcyBob3cgaXQgaXMgZG9uZSB0b2RheS4NCg0KVGhlIGRvbWFpbidzIFhl
bnN0b3JlIGVudHJpZXMgYXJlIHJlbW92ZWQgYmVmb3JlIHRoZSBkb21haW4gaXMgYmVpbmcN
CmRlc3Ryb3llZC4NCg0KDQpKdWVyZ2VuDQo=
--------------vLr1oHpPQC8sctz7lUyLUUco
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vLr1oHpPQC8sctz7lUyLUUco--

--------------rn1rs0fJXTVmoo9Q0iurlvBt--

--------------IogQt2NYCUGaoX16DyfJGZyP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNqCykFAwAAAAAACgkQsN6d1ii/Ey+P
NAf/XftbEcLqHGs72VepWx+p3tJm5nNINwQ5kBgKzmsEi19jjmwnvPkzCpjDG9Gkm1dwiRVyrMZk
LZrgrDceisJA9Y0HmR9VXTqyO+o0Nk+2SvjHYhs48UOvDllev3OnHvkh4FpjSP08CZbc0iXEDNMI
h68+mmxRUKOVPLCXENgoN477EoxN0BMMIGrPCzMMJDEtDMGawJFh+gat4cci0M5nFExcGh4vRSfl
6r3HCeXvGhalbuUwEukxJG3FBCBevTTUIS7v8uiF9xgPddc8YNHu3qgl4nmryF6NKBiqKsKSN/PK
lW7/5hRaLsusoJU/MsIsAkgHYyGK9JV1wh+PNjHi8w==
=8Fgo
-----END PGP SIGNATURE-----

--------------IogQt2NYCUGaoX16DyfJGZyP--

