Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E124EEE89
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297408.506622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHhb-0005fk-F8; Fri, 01 Apr 2022 13:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297408.506622; Fri, 01 Apr 2022 13:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHhb-0005cz-Bj; Fri, 01 Apr 2022 13:52:35 +0000
Received: by outflank-mailman (input) for mailman id 297408;
 Fri, 01 Apr 2022 13:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1naHha-0005cr-I0
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:52:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id facbe98f-b1c2-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 15:52:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D57EF1FD00;
 Fri,  1 Apr 2022 13:52:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 938F81331E;
 Fri,  1 Apr 2022 13:52:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tBxFIp8DR2LCZgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Apr 2022 13:52:31 +0000
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
X-Inumbo-ID: facbe98f-b1c2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648821151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NguB6iSxc8L7WWabwK13dnwd8swWgePoi39hfCPSpEY=;
	b=ZBusKjzDk/OSjs3eH6MB814259MEq/npNzadnCb6rolCzhCaVdmfRzgcorKXCEa7H4PtkC
	5uSXNCWIkasXrFEnqPf7mvPiLIm8huwjnuL9nUOMTQU31u8kDnLuyOtiO+JbsHR9D06a9L
	CguGhUgIJK3u1xZBriS0TrZViO5DlMk=
Message-ID: <5522e39c-e7b6-eecf-526d-abe6964e068c@suse.com>
Date: Fri, 1 Apr 2022 15:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
 <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
 <57312254-b599-6de5-04aa-f88907c49163@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <57312254-b599-6de5-04aa-f88907c49163@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bRxBE0y580PRKxGp8TOrZBza"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bRxBE0y580PRKxGp8TOrZBza
Content-Type: multipart/mixed; boundary="------------FYnDoI9hIIEXKq4UtDLdeSqd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <5522e39c-e7b6-eecf-526d-abe6964e068c@suse.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
 <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
 <57312254-b599-6de5-04aa-f88907c49163@xen.org>
In-Reply-To: <57312254-b599-6de5-04aa-f88907c49163@xen.org>

--------------FYnDoI9hIIEXKq4UtDLdeSqd
Content-Type: multipart/mixed; boundary="------------FiRWx61O0p1aHByu2ybUKiHy"

--------------FiRWx61O0p1aHByu2ybUKiHy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDQuMjIgMTU6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzA0LzIwMjIgMTE6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwMS4wNC4yMiAxMjoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gSSBoYXZlIHBvc3RlZCBzb21lIGNvbW1lbnRzIGluIHYzIGFmdGVyIHlvdSBzZW50IHRo
aXMgdmVyc2lvbi4gUGxlYXNlIGhhdmUgYSANCj4+PiBsb29rLg0KPj4+DQo+Pj4gT24gMDEv
MDQvMjAyMiAwMTozOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiArc3RhdGlj
IGludCBpbml0X2RvbWFpbihzdHJ1Y3QgeHNfaGFuZGxlICp4c2gsIGxpYnhsX2RvbWluZm8g
KmluZm8pDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IHhjX2ludGVyZmFjZV9jb3Jl
ICp4Y2g7DQo+Pj4+ICvCoMKgwqAgbGlieGxfdXVpZCB1dWlkOw0KPj4+PiArwqDCoMKgIHVp
bnQ2NF90IHhlbnN0b3JlX2V2dGNobiwgeGVuc3RvcmVfcGZuOw0KPj4+PiArwqDCoMKgIGlu
dCByYzsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIHByaW50ZigiSW5pdCBkb20wbGVzcyBkb21h
aW46ICV1XG4iLCBpbmZvLT5kb21pZCk7DQo+Pj4+ICvCoMKgwqAgeGNoID0geGNfaW50ZXJm
YWNlX29wZW4oMCwgMCwgMCk7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCByYyA9IHhjX2h2bV9w
YXJhbV9nZXQoeGNoLCBpbmZvLT5kb21pZCwgSFZNX1BBUkFNX1NUT1JFX0VWVENITiwNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICZ4ZW5zdG9yZV9ldnRjaG4pOw0KPj4+PiArwqDCoMKgIGlmIChyYyAhPSAwKSB7DQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBwcmludGYoIkZhaWxlZCB0byBnZXQgSFZNX1BBUkFNX1NUT1JF
X0VWVENITlxuIik7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsNCj4+Pj4gK8Kg
wqDCoCB9DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCAvKiBBbGxvYyB4ZW5zdG9yZSBwYWdlICov
DQo+Pj4+ICvCoMKgwqAgaWYgKGFsbG9jX3hzX3BhZ2UoeGNoLCBpbmZvLCAmeGVuc3RvcmVf
cGZuKSAhPSAwKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwcmludGYoIkVycm9yIG9uIGFs
bG9jIG1hZ2ljIHBhZ2VzXG4iKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAxOw0K
Pj4+PiArwqDCoMKgIH0NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIHJjID0geGNfZG9tX2dudHRh
Yl9zZWVkKHhjaCwgaW5mby0+ZG9taWQsIHRydWUsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHhlbl9wZm5fdCktMSwg
eGVuc3RvcmVfcGZuLCAwLCAwKTsNCj4+Pj4gK8KgwqDCoCBpZiAocmMpDQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBlcnIoMSwgInhjX2RvbV9nbnR0YWJfc2VlZCIpOw0KPj4+PiArDQo+Pj4+
ICvCoMKgwqAgbGlieGxfdXVpZF9nZW5lcmF0ZSgmdXVpZCk7DQo+Pj4+ICvCoMKgwqAgeGNf
ZG9tYWluX3NldGhhbmRsZSh4Y2gsIGluZm8tPmRvbWlkLCBsaWJ4bF91dWlkX2J5dGVhcnJh
eSgmdXVpZCkpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgcmMgPSBnZW5fc3R1Yl9qc29uX2Nv
bmZpZyhpbmZvLT5kb21pZCwgJnV1aWQpOw0KPj4+PiArwqDCoMKgIGlmIChyYykNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGVycigxLCAiZ2VuX3N0dWJfanNvbl9jb25maWciKTsNCj4+Pj4g
Kw0KPj4+PiArwqDCoMKgIC8qIE5vdyBldmVyeXRoaW5nIGlzIHJlYWR5OiBzZXQgSFZNX1BB
UkFNX1NUT1JFX1BGTiAqLw0KPj4+PiArwqDCoMKgIHJjID0geGNfaHZtX3BhcmFtX3NldCh4
Y2gsIGluZm8tPmRvbWlkLCBIVk1fUEFSQU1fU1RPUkVfUEZOLA0KPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuc3RvcmVfcGZu
KTsNCj4+Pg0KPj4+IE9uIHBhdGNoICMxLCB5b3UgdG9sZCBtZSB5b3UgZGlkbid0IHdhbnQg
dG8gYWxsb2NhdGUgdGhlIHBhZ2UgaW4gWGVuIGJlY2F1c2UgDQo+Pj4gaXQgd291bGRuJ3Qg
YmUgaW5pdGlhbGl6ZWQgYnkgWGVuc3RvcmVkLiBCdXQgdGhpcyBpcyB3aGF0IHdlIGFyZSBk
b2luZyBoZXJlLg0KPj4NCj4+IFhlbnN0b3JlIChhdCBsZWFzdCB0aGUgQyB2YXJpYW50KSBp
cyBvbmx5IHVzaW5nIHRoZSBmaXhlZCBncmFudCByZWYNCj4+IEdOVFRBQl9SRVNFUlZFRF9Y
RU5TVE9SRSwgc28gaXQgZG9lc24ndCBuZWVkIHRoZSBwYWdlIHRvIGJlIGFkdmVydGlzZWQN
Cj4+IHRvIHRoZSBndWVzdC4gQW5kIHRoZSBtYXBwaW5nIGlzIGRvbmUgb25seSB3aGVuIHRo
ZSBkb21haW4gaXMgYmVpbmcNCj4+IGludHJvZHVjZWQgdG8gWGVuc3RvcmUuDQo+IA0KPiBB
bmQgd2UgZG9uJ3QgZXhwZWN0IHRoZSBndWVzdCB0byB1c2UgdGhlIGdyYW50IGVudHJ5IHRv
IGZpbmQgdGhlIHhlbnN0b3JlIHBhZ2U/DQo+Pg0KPj4+DQo+Pj4gVGhpcyB3b3VsZCBiZSBh
IHByb2JsZW0gaWYgTGludXggaXMgc3RpbGwgYm9vdGluZyBhbmQgaGFzbid0IHlldCBjYWxs
IA0KPj4+IHhlbmJ1c19wcm9iZV9pbml0Y2FsbCgpLg0KPj4+DQo+Pj4gSSB1bmRlcnN0YW5k
IHdlIG5lZWQgdG8gaGF2ZSB0aGUgcGFnZSBzZXR1cCBiZWZvcmUgcmFpc2luZyB0aGUgZXZl
bnQgY2hhbm5lbC4gDQo+Pj4gSSBkb24ndCB0aGluayB3ZSBjYW4gYWxsb3cgWGVuc3RvcmVk
IHRvIHNldCB0aGUgSFZNX1BBUkFNIChpdCBtYXkgcnVuIGluIGEgDQo+Pj4gZG9tYWluIHdp
dGggbGVzcyBwcml2aWxlZ2UpLiBTbyBJIHRoaW5rIHdlIG1heSBuZWVkIHRvIGNyZWF0ZSBh
IHNlcGFyYXRlIA0KPj4+IGNvbW1hbmQgdG8ga2ljayB0aGUgY2xpZW50IChub3QgZ3JlYXQp
Lg0KPj4+DQo+Pj4gSnVlcmdlbiwgYW55IHRob3VnaHRzPw0KPj4NCj4+IEkgdGhpbmsgaXQg
c2hvdWxkIHdvcmsgbGlrZSB0aGF0Og0KPj4NCj4+IC0gc2V0dXAgdGhlIGdyYW50IHZpYSB4
Y19kb21fZ250dGFiX3NlZWQoKQ0KPj4gLSBpbnRyb2R1Y2UgdGhlIGRvbWFpbiB0byBYZW5z
dG9yZQ0KPj4gLSBjYWxsIHhjX2h2bV9wYXJhbV9zZXQoKQ0KPj4NCj4+IFdoZW4gdGhlIGd1
ZXN0IGlzIHJlY2VpdmluZyB0aGUgZXZlbnQsIGl0IHNob3VsZCB3YWl0IGZvciB0aGUgeGVu
c3RvcmUNCj4+IHBhZ2UgdG8gYXBwZWFyLg0KPiBJSVVDLCB0aGlzIHdvdWxkIG1lYW4gdGhl
IGd1ZXN0IHdvdWxkIG5lZWQgdG8gZG8gc29tZSBzb3J0IG9mIGJ1c3kgbG9vcCB1bnRpbCAN
Cj4gdGhlIHhlbnN0b3JlIHBhZ2UgdG8gYXBwZWFyLg0KDQpMb29raW5nIGZvciBpdCBldmVy
eSBzZWNvbmQgb3Igc28gd291bGQgYmUgZW5vdWdoLg0KDQo+IElmIHNvLCB0aGlzIGRvZXNu
J3Qgc291bmQgZ3JlYXQgdG8gbWUuIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhh
dmUgYSBmbGFnIA0KPiBpbiB0aGUgcGFnZSB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBwYWdl
IGlzIG5vdCByZWFkeS4NCj4gDQo+IFhlbnN0b3JlZCBjb3VsZCB0aGVuIGNsZWFyIHRoZSBm
bGFnIGJlZm9yZSByYWlzaW5nIHRoZSBldmVudCBjaGFubmVsLg0KDQpIbW0sIHRoZSAiY29u
bmVjdGlvbiIgZmllbGQgY291bGQgYmUgdXNlZCBmb3IgdGhhdC4NCg0KSXQgd291bGQgbWVh
biwgdGhvdWdoLCB0aGF0IGUuZy4gbGlieGwgd291bGQgbmVlZCB0byBpbml0aWFsaXplIHRo
ZQ0KcGFnZSBhY2NvcmRpbmdseSBiZWZvcmUgY2FsbGluZyB4c19pbnRyb2R1Y2UoKS4NCg0K
DQpKdWVyZ2VuDQo=
--------------FiRWx61O0p1aHByu2ybUKiHy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------FiRWx61O0p1aHByu2ybUKiHy--

--------------FYnDoI9hIIEXKq4UtDLdeSqd--

--------------bRxBE0y580PRKxGp8TOrZBza
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJHA58FAwAAAAAACgkQsN6d1ii/Ey91
Jwf/cSZ9iXfH0YO/6ZF+430/JKzF1M8sFca7sH9KUPiSnlyVRUtMpAaKl013VfkT561AfcfEJzWv
R5Om88tX7oDbnJ42xzhNzMoCcFT/eA/qff6URDpTFgOuOhpQY8jC2cDSSOSLMyFcyajswHcpHE2+
5zIdK+VbROsEB+8a/L//rB2ov9c2UzoxqlAgOGpkb3vvmLURXTjoScvAb/tCAvB8QH7vlZtLCqDp
w/WZq0eB90eqPcrn9supmgqwo+Y1ByyTm6MBiubYzgnP2mQ2LRboV6AQ6W3W/xx07Xnq8A6ben5N
U5Wk7ptssBCobe6oj9pEAMKztwVSOSak+JOkCv76yA==
=Cwd6
-----END PGP SIGNATURE-----

--------------bRxBE0y580PRKxGp8TOrZBza--

