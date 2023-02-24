Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD346A1E4F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501175.772799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZn9-0002Dp-Id; Fri, 24 Feb 2023 15:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501175.772799; Fri, 24 Feb 2023 15:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZn9-0002Am-FU; Fri, 24 Feb 2023 15:15:23 +0000
Received: by outflank-mailman (input) for mailman id 501175;
 Fri, 24 Feb 2023 15:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3H5S=6U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pVZn7-0002Ag-L8
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:15:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cc4b6c3-b456-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 16:15:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0283D38DE1;
 Fri, 24 Feb 2023 15:15:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB64E13A3A;
 Fri, 24 Feb 2023 15:15:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wNywM4bU+GMWCAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Feb 2023 15:15:18 +0000
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
X-Inumbo-ID: 0cc4b6c3-b456-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677251719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bQ/CxViv3aWP77kUXOw/4pjF/p+w4XUm/zF0keRF30=;
	b=k1RMqS6VJ9/B87lhjjgaWBhVeuwH9TW65Qdg2JXmrP3XusgXWRvvEVC1zP/0HgGLp7rt1m
	ma0TmcIIsxBqxLBTSyaio80nqzilEH4HppX622zGOfCggheCASQadMiHgKlpIK8cat4hUw
	QFOCOpcWGNahgmajd3frxwoxyrsVLnY=
Message-ID: <b277473c-5f64-de20-a9bf-6e2dafa7a2a2@suse.com>
Date: Fri, 24 Feb 2023 16:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
In-Reply-To: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ra079v0Xoq3Pa13SfHcCv53G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ra079v0Xoq3Pa13SfHcCv53G
Content-Type: multipart/mixed; boundary="------------o64r1bgRmU6itW00wNOujzft";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <b277473c-5f64-de20-a9bf-6e2dafa7a2a2@suse.com>
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
In-Reply-To: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>

--------------o64r1bgRmU6itW00wNOujzft
Content-Type: multipart/mixed; boundary="------------PfiXV67MUQDclwL0BRMKQ09t"

--------------PfiXV67MUQDclwL0BRMKQ09t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjMgMTY6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IEZvciBzb21lIGludGVybmFsIHB1cnBvc2UsIEkgbmVlZCB0byB3cml0ZSBhIHNj
cmlwdCB0aGF0IHdvdWxkIGRvIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAgwqAgMSkgU3RhcnQg
YSB0cmFuc2FjdGlvbg0KPiAgwqAgMikgQ2FsbCBHRVRfUEVSTVMNCj4gIMKgIDMpIENhbGwg
U0VUX1BFUk1TIHdpdGggdGhlIHBlcm1pc3Npb24ganVzdCByZXRyaWV2ZWQNCj4gIMKgIDQp
IENvbW1pdCB0aGUgdHJhbnNhY3Rpb24NCj4gDQo+IChEb24ndCBhc2sgd2h5IDopKQ0KPiAN
Cj4gVGhpcyB3YXMgZXhlY3V0ZWQgZnJvbSBkb20wIG9uIGV2ZXJ5IG5vZGVzLiBJbiBzb21l
IGNhc2VzLCB3ZSBub3RpY2VkIHRoYXQgNCkgDQo+IHdvdWxkIHJldHVybiAtRU5PU1BDLg0K
PiANCj4gV2hlbiBkaWdnaW5nIHRocm91Z2ggdGhlIGNvZGUsIGl0IGxvb2tzIGxpa2UgdGhp
cyBpcyBiZWNhdXNlIA0KPiB0cmFuc2FjdGlvbl9maXhfZG9tYWlucygpIChub3cgY2FsbGVk
IGFjY19maXhfZG9tYWlucygpKSB3aWxsIGNoZWNrIHRoYXQgdGhlIA0KPiBxdW90YSBpcyBj
b3JyZWN0Lg0KPiANCj4gVGhlIGRvbWFpbiBpcyBxdWVzdGlvbiB3ZXJlIG92ZXIgaXRzIGxp
bWl0LCBidXQgZ2l2ZW4gdGhpcyBpcyBjYWxsZWQgYnkgZG9tMCwgSSANCj4gd291bGQgaGF2
ZSBleHBlY3RlZCB0aGF0IGl0IHNob3VsZCBub3QgbmV2ZXIgcmV0dXJuIC1FTk9TUEMgKG5v
dGUgdGhhdCBhIA0KPiBTRVRfUEVSTVMgb3V0c2lkZSBvZiBhIHRyYW5zYWN0aW9uIHdvdWxk
IHdvcmssIGJ1dCB0aGlzIGNhbid0IGJlIHVzZWQgb3VyIGNhc2UpLg0KPiANCj4gRnVydGhl
cm1vcmUsIHRoZSB0cmFuc2FjdGlvbiBpcyBub3QgY2hhbmdpbmcgYW55IGFjY291bnRpbmcu
IFNvIEkgZmluZCBhIGJpdCANCj4gc3RyYW5nZSB0aGF0IHdlIHdvdWxkIHByZXZlbnQgaXQg
ZXZlbiBpZiB0aGlzIHdhcyBydW4gZnJvbSBhbiB1bnByaXZpbGVnZWQgZG9tYWluLg0KDQpZ
b3UgYXJlIHJpZ2h0LiBJdCBzaG91bGQgb25seSBiZSByZWplY3RlZCBpZiBub2RlcyBhcmUg
YWRkZWQgaW4gdGhlIHRyYW5zYWN0aW9uLg0KDQo+IA0KPiBEbyB5b3Uga25vdyBpZiB0aGlz
IGlzc3VlcyB3b3VsZCBiZSBmaXhlZCBieSB5b3VyIGN1cnJlbnQgcmV3b3JrPw0KDQpJIGRv
bid0IHRoaW5rIHNvLg0KDQo+IA0KPiBJZiBub3QsIHRoZW4gSSB0aGluayB3ZSBhdCBsZWFz
dCB3YW50IHRvIHNraXAgdGhlIHF1b3RhIGNoZWNrIGlmIHRoZSBkb21haW4gaXMgDQo+IHBy
aXZpbGVnZWQuDQoNCkknbGwgYWRkIHNvbWV0aGluZyB0byBjaGVjayBxdW90YSBvbmx5IGZv
ciB1bnByaXZpbGVnZWQgZG9tYWlucyBBTkQgb25seSBpZg0Kbm9kZXMgaGF2ZSBiZWVuIGFk
ZGVkIGluIHRoZSB0cmFuc2FjdGlvbi4NCg0KPiANCj4gRm9yIG5vbi1wcml2aWxlZ2VkIGRv
bWFpbiwgSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHRvIGRvLiBJIHdhcyBvcmlnaW5h
bGx5IA0KPiB0aGlua2luZyB0byBjaGVjayBpZiBjZC0+bmJlbnRyeSBpcyAwIGFuZCB0aGVu
IHNraXAgdGhlIHF1b3RhIGNoZWNrLiBCdXQgdGhpcyANCj4gd291bGQgYWxsb3cgYSBkb21h
aW4gdG8gcmVtb3ZlIGEgbm9kZSBhbmQgdGhlbiByZXBsYWNlIGJ5IGEgbmV3IG9uZSAoSSB0
aGluayB3ZSANCj4gc3RpbGwgd2FudCB0byBmb3JiaWQgdGhhdCkuDQoNCkNvcnJlY3QuIE5v
ZGUgY3JlYXRpb24gaXMgdGhlIHRyaWdnZXIgd2Ugd2FudC4NCg0KQlRXLCBjdXJyZW50IGNv
ZGUgaXMgcmVhbGx5IGJhZCwgYXMgaXQgd291bGQgZXZlbiByZWplY3QgcmVtb3ZpbmcgYSBu
b2RlDQppbiBhIHRyYW5zYWN0aW9uIGZvciBhIGRvbWFpbiBiZWluZyBhYm92ZSBxdW90YSBh
ZnRlciB0aGF0IHJlbW92ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------PfiXV67MUQDclwL0BRMKQ09t
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PfiXV67MUQDclwL0BRMKQ09t--

--------------o64r1bgRmU6itW00wNOujzft--

--------------Ra079v0Xoq3Pa13SfHcCv53G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP41IYFAwAAAAAACgkQsN6d1ii/Ey/o
vAgAjR2llR/WfKOWdCYhWNH/ILsSdsQdhfrfs3vs/EQEYxW+suxn+zQz0p8TjWUSwQQAHhv4/L3n
nphehZIVd80hteb+2EIQciqXBlNLzs5Y1MBljdC6EQHlH5JSdIwx01zLlTZnFW7MsxW2P/w2VEme
TQPyg16vvzjGA4dfJ0W09P+HwB0bdmm4kSrDjr7dCtaC7JzuKdx5umvtDp8se283xEylLmcBBej4
bdZLyDUiOWqChebePn2GPTV8HKB785ojJgtfmX9wfZsTuwA2Z5RTbvQg4rCFNZK0k/TLLpHbe3rR
NOAJ19EVboHPcBMUVz6LCVLDMrcOwNRsqS2JSo+yKQ==
=NIOp
-----END PGP SIGNATURE-----

--------------Ra079v0Xoq3Pa13SfHcCv53G--

