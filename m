Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5735EBB10
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 09:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412278.655519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od4cG-0007rj-Do; Tue, 27 Sep 2022 07:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412278.655519; Tue, 27 Sep 2022 07:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od4cG-0007pJ-B7; Tue, 27 Sep 2022 07:02:52 +0000
Received: by outflank-mailman (input) for mailman id 412278;
 Tue, 27 Sep 2022 07:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1od4cE-0007p7-HX
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 07:02:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655578ab-3e32-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 09:02:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95A531FCDB;
 Tue, 27 Sep 2022 07:02:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7685B139BE;
 Tue, 27 Sep 2022 07:02:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jQl8GxigMmNkbgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Sep 2022 07:02:48 +0000
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
X-Inumbo-ID: 655578ab-3e32-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664262168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uq0Is0Sw0BisMCZPTteoAuarp+3efwf96ydoTTnd3oo=;
	b=kpt+FVcLNd1AsTejUsMQT6F8jln7VkcgqTvbEHYcy4+7MmqOIYhj6wwrakbOFgqZXeWz/C
	/dU9cFF+nC9b6c5AgGE8PnI8ghYzxMIG7W4RO+bu6IUoA8RgutdYaTQzBk6z6HJoP65fb/
	GSY1FkU/b9Qdduv3UI6Lz3ssKUpc1ps=
Message-ID: <e2305664-37f2-cdc9-c3f2-a4d9978e28dc@suse.com>
Date: Tue, 27 Sep 2022 09:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Design session PVH dom0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
 <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
 <a91f9205-9f75-7fff-d5db-26d7729847db@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a91f9205-9f75-7fff-d5db-26d7729847db@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------geCXZkosMFoLeRx1cCvbE6Mh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------geCXZkosMFoLeRx1cCvbE6Mh
Content-Type: multipart/mixed; boundary="------------50QPqsKRNyKFHS0s0fCdvSFN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <e2305664-37f2-cdc9-c3f2-a4d9978e28dc@suse.com>
Subject: Re: Design session PVH dom0
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
 <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
 <a91f9205-9f75-7fff-d5db-26d7729847db@suse.com>
In-Reply-To: <a91f9205-9f75-7fff-d5db-26d7729847db@suse.com>

--------------50QPqsKRNyKFHS0s0fCdvSFN
Content-Type: multipart/mixed; boundary="------------dlrtoZK0xUTHQdi9nVeNiu4n"

--------------dlrtoZK0xUTHQdi9nVeNiu4n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMTc6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wOS4yMDIy
IDEwOjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjYuMDkuMjIgMDk6NTMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA5LjIwMjIgMTA6MjAsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE15IGZhdm9yaXRlIHNvbHV0aW9uIHdvdWxkIGJlIHNvbWUga2lu
ZCBvZiBidWZmZXIgYWRkcmVzcyBxdWFsaWZpZXIgZm9yIGVhY2gNCj4+Pj4gYnVmZmVyIChl
LmcuIHZpcnR1YWwsIHBoeXNpY2FsLCBTRy1saXN0LCBtYXliZSBuZXN0ZWQgU0ctbGlzdCku
IFNvIHRoZSBuZXcNCj4+Pj4gaHlwZXJjYWxscyB3b3VsZCBub3QgbWVhbiAicGh5c2ljYWwg
YnVmZmVyIGFkZHJlc3NlcyIsIGJ1dCAicXVhbGlmaWVkIGJ1ZmZlcg0KPj4+PiBhZGRyZXNz
ZXMiLiBCeSByZXF1aXJpbmcgYSBtaW5pbXVtIG9mIDQtYnl0ZSBhbGlnbm1lbnQgZm9yIGVh
Y2ggYnVmZmVyIChjYW4gd2UNCj4+Pj4gZG8gdGhhdCwgYXQgbGVhc3QgZm9yIHRoZSBuZXcg
aHlwZXJjYWxscz8pIHRoaXMgd291bGQgbGVhdmUgdGhlIDIgbG93ZXN0IGJpdHMNCj4+Pj4g
b2YgYSBidWZmZXIgYWRkcmVzcyBmb3IgdGhlIG5ldyBxdWFsaWZpZXIuIElmIGJ5IGFueSBt
ZWFucyBhbiB1bmFsaWduZWQgYnVmZmVyDQo+Pj4+IGlzIG5lZWRlZCBzb21ldGltZXMsIGl0
IGNvdWxkIHN0aWxsIGJlIGFjaGlldmVkIHZpYSBhIHNpbmdsZS1lbnRyeSBTRy1saXN0Lg0K
Pj4+DQo+Pj4gV2hpbGUgdGhpcyBtaWdodCBiZSBhbiBvcHRpb24sIEknbSBub3Qgc3VyZSBJ
J2QgYmUgcmVhbGx5IGhhcHB5IHdpdGggc3VjaA0KPj4+IHJlLXVzZSBvZiB0aGUgbG93IGFk
ZHJlc3MgYml0cywgbm9yIHdpdGggdGhlIGltcGxpZWQgZnVydGhlciByZXN0cmljdGlvbg0K
Pj4+IG9uIGJ1ZmZlciBhbGlnbm1lbnQgKG1vc3Qgc3RydWN0LXMgd2UgdXNlIGFyZSA0LWJ5
dGUgYWxpZ25lZCBhdCBsZWFzdCwNCj4+PiBidXQgSSBkb24ndCB0aGluayBpdCdzIGFsbCBv
ZiB0aGVtLCBwbHVzIHdlIGFsc28gaGF2ZSBndWVzdCBoYW5kbGVzIHRvDQo+Pj4gZS5nLiBh
cnJheXMgb2YgY2hhcikuDQo+Pg0KPj4gVGhlIHVuYWxpZ25lZCBjYXNlcyBjb3VsZCBiZSBo
YW5kbGVkIGR5bmFtaWNhbGx5IHZpYSB0aGUgc2luZ2xlLWVudHJ5DQo+PiBTRy1saXN0Lg0K
PiANCj4gQ2FuIHRoZXk/IFRoZSBmaXJzdCBleGFtcGxlIHlvdSBnYXZlLCB0aGUgYml0bWFw
IHBhc3NlZCB0byBjb2xsZWN0IHRoZQ0KPiBvdXRwdXQgb2YgWEVOX0RPTUNUTF9TSEFET1df
T1Bfe0NMRUFOLFBFRUt9LCBjb21lcyBhcyBhIGhhbmRsZS1vZi11aW50OCwNCj4gaS5lLiBn
ZW5lcmFsbHkgbGFyZ2UgYnV0IG5vdCBuZWNlc3NhcmlseSBhbGlnbmVkIChldmVuIGlmIGlu
IHByYWN0aWNlDQo+IHRoZSBjYWxsZXIgbGlrZWx5IHdpbGwgcGFzcyBhIHBhZ2UgYWxpZ25l
ZCBidWZmZXIgb2YgbXVsdGlwbGUgcGFnZXMgaW4NCj4gc2l6ZSkuIElmIHdlIGludHJvZHVj
ZWQgcGh5c2ljYWwtYWRkcmVzcyBiYXNlcyByZXBsYWNlbWVudCBzdWItb3BzLCBJDQo+IHRo
aW5rIHdlIHdvdWxkIG1ha2UgdGhlIGJ1ZmZlciBkZXNjcmliZWQgYnkgYW4gYXJyYXkgb2Yg
R0ZOcywgbm90IGV2ZW4NCj4gYWxsb3dpbmcgc3ViLXBhZ2UgYWxpZ25tZW50IG9yIHNpemUu
DQoNCkluIGNhc2UgdGhlIGJ1ZmZlciBpcyBjcm9zc2luZyBwYWdlIGJvdW5kYXJpZXMsIHRo
ZSBTRy1saXN0IHdvdWxkIG5lZWQgdG8NCmhhdmUgbW9yZSB0aGFuIG9uZSBlbnRyeSwgb2Yg
Y291cnNlIChhc3N1bWluZyB0aGUgU0ctbGlzdCB2YXJpYW50IGlzIGNob3NlbikuDQoNCg0K
SnVlcmdlbg0K
--------------dlrtoZK0xUTHQdi9nVeNiu4n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------dlrtoZK0xUTHQdi9nVeNiu4n--

--------------50QPqsKRNyKFHS0s0fCdvSFN--

--------------geCXZkosMFoLeRx1cCvbE6Mh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMyoBgFAwAAAAAACgkQsN6d1ii/Ey/b
xQgAiiDe76aoLdMXWMj8CliF6JNDDwZp7fzkIGhcIuEwSdcjxkDw9/IasZLaDHPbf+qSVUE1yqeY
bapTsk47ZVytPz8pHrhAVM+a5YdG8dCLypl42l+52ZhPqwbtonOAsG0qBfw9BHjXcz0nuwFfZkPZ
0nu/XxZ+LNoYYWorC2UWzgU9ZZfaoQad+tWpSBGuG66ncuTo1hKuW8XiNsewzKHxLUWWxbi/3QHs
9007sSFE+/m5AJg8yoerY7cg37DLnNoupDUnbZOdUwhQMkLIFrmEtNvionyX0t/vuQMox3S6mKr1
vmqIzcPYkEPwHeIb1r5jlZ/GrhRQ6pOZtkrb5fRaZg==
=npl3
-----END PGP SIGNATURE-----

--------------geCXZkosMFoLeRx1cCvbE6Mh--

