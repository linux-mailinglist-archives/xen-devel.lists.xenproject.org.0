Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D554FA637
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 11:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302124.515683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7AZ-0008RF-0J; Sat, 09 Apr 2022 09:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302124.515683; Sat, 09 Apr 2022 09:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7AY-0008OS-SR; Sat, 09 Apr 2022 09:14:10 +0000
Received: by outflank-mailman (input) for mailman id 302124;
 Sat, 09 Apr 2022 09:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YAo9=UT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nd7AX-0008OI-0F
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 09:14:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6874d6b7-b7e5-11ec-a405-831a346695d4;
 Sat, 09 Apr 2022 11:14:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEFE7210E6;
 Sat,  9 Apr 2022 09:14:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DB9913A77;
 Sat,  9 Apr 2022 09:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L3bkEF5OUWKJXAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 09 Apr 2022 09:14:06 +0000
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
X-Inumbo-ID: 6874d6b7-b7e5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649495646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t4w53XSf5KLPSx/o1mAVdkKDvSYk1M+tQSf5nQtDeRY=;
	b=XSiJ/sSFUoZ7zdh1ZdhK5xmc6dwFoj9ucN6V068Xn/24XPa3HQIifLAMmfZDRKGmpMNcwd
	xPJL8hM3MC3KccndCfxPZBRomN1KMfAXsc3maou9HH5c5phQ4oURLF8QC6cYIUKwPBKDoi
	EIOr8lUQuAqn3zMebW2WvGJhnP/MlxA=
Message-ID: <8c4b7915-28c7-e0b8-6c13-17ca1f3bd4cf@suse.com>
Date: Sat, 9 Apr 2022 11:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
 <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
 <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
 <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tz4HOuIadS0hLCkm0GUPFcrU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tz4HOuIadS0hLCkm0GUPFcrU
Content-Type: multipart/mixed; boundary="------------jcDmYxOMg3ZQDow11SCUgYpr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <8c4b7915-28c7-e0b8-6c13-17ca1f3bd4cf@suse.com>
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
 <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
 <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
 <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>

--------------jcDmYxOMg3ZQDow11SCUgYpr
Content-Type: multipart/mixed; boundary="------------WiQXL9sFlfdX0ec9pD9ETKgw"

--------------WiQXL9sFlfdX0ec9pD9ETKgw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDQuMjIgMjI6MjUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gRnJp
LCA4IEFwciAyMDIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA4LjA0LjIwMjIgMTM6
MzcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+PiBPbiA4IEFwciAyMDIy
LCBhdCAxMDowMSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+
Pj4NCj4+Pj4gT24gMDguMDQuMjAyMiAxMDo0NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+
Pj4+IC0tLQ0KPj4+Pj4gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9jcHVwb29scy50eHQg
fCAxNDAgKysrKysrKysrKysrKysrKysNCj4+Pj4+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9zbXAuaCAgICAgICAgIHwgICAzICsNCj4+Pj4+IHhlbi9jb21tb24vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgIHwgICA3ICsNCj4+Pj4+IHhlbi9jb21tb24vTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsNCj4+Pj4+IHhlbi9jb21tb24vYm9vdF9jcHVwb29s
cy5jICAgICAgICAgICAgIHwgMjA3ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+
IHhlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jICAgICAgICAgICAgIHwgIDEyICstDQo+Pj4+
PiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgICAgICB8ICAxNCArKw0KPj4+
Pj4gNyBmaWxlcyBjaGFuZ2VkLCAzODMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvY3B1
cG9vbHMudHh0DQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9ib290X2Nw
dXBvb2xzLmMNCj4+Pj4NCj4+Pj4gVW5kZXIgd2hvc2UgbWFpbnRhaW5lcnNoaXAgaXMgdGhl
IG5ldyBmaWxlIHRvIGZhbGw/IFdpdGhvdXQgYW4NCj4+Pj4gYWRkaXRpb24gdG8gLi9NQUlO
VEFJTkVSUyBhbmQgd2l0aG91dCB0aGUgZmlsZSBiZWluZyBwbGFjZWQgaW4NCj4+Pj4geGVu
L2NvbW1vbi9zY2hlZC8sIGl0J2xsIGJlIFJFU1QgbWFpbnRhaW5lcnMsIHdoaWNoIEkgdGhp
bmsgd291bGQNCj4+Pj4gYmV0dGVyIGJlIGF2b2lkZWQuIFdvdWxkIGl0IHBlcmhhcHMgbWFr
ZSBzZW5zZSB0byBoYXZlIHRoaXMgYXMNCj4+Pj4geGVuL2NvbW1vbi9zY2hlZC9ib290LmMs
IGFsbG93aW5nIG90aGVyIGJvb3Qtb25seSBjb2RlIHRvDQo+Pj4+IHBvdGVudGlhbGx5IGJl
IG1vdmVkIHRoZXJlIG92ZXIgdGltZT8gVGhpcyB3b3VsZCB0aGVuIGFsc28gYXZvaWQNCj4+
Pj4gbWUgYXNraW5nIGFib3V0IHRoZSB1bmRlcnNjb3JlIGluIHRoZSBmaWxlIG5hbWU6IFVu
ZGVyc2NvcmVzIGFyZQ0KPj4+PiBhIHNvbWV3aGF0IGFydGlmaWNpYWwgdGhpbmcgZm9yIHVz
ZSBpbiBwbGFjZXMgd2hlcmUgZGFzaGVzIGNhbid0DQo+Pj4+IGJlIHVzZWQuIFlldCBpbiB0
aGUgZmlsZSBzeXN0ZW0gZGFzaGVzIGFyZSBmaW5lLCBhbmQgZGFzaGVzIGFyZQ0KPj4+PiAo
c2xpZ2h0bHkpIGVhc2llciB0byB0eXBlLg0KPj4+Pg0KPj4+DQo+Pj4gT2sgSSBjYW4gcHV0
IHRoZSBuZXcgZmlsZSB1bmRlciB4ZW4vY29tbW9uL3NjaGVkLyBhcyBib290LmMsIHNob3Vs
ZCB0aGlzIG5ldw0KPj4+IGZpbGUgYmUgdW5kZXIgdGhpcyBzZWN0aW9uPw0KPj4+DQo+Pj4g
Q1BVIFBPT0xTDQo+Pj4gTTogIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
PiBNOiAgRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4NCj4+PiBTOiAgU3Vw
cG9ydGVkDQo+Pj4gRjogIHhlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+Pj4gKyBGOiAg
eGVuL2NvbW1vbi9zY2hlZC9ib290LmMNCj4+DQo+PiBJZiBpdCdzIHRvIGhvbGQgZ2VuZXJh
bCBzY2hlZHVsZXIgY29kZSAod2hpY2ggdGhpcyBzaG9ydGVyIG5hbWUgd291bGQNCj4+IHN1
Z2dlc3QpLCBpdCBzaG91bGRuJ3QgbmVlZCBhbnkgY2hhbmdlIHRvIC4vTUFJTlRBSU5FUlMg
YXMgdGhlDQo+PiBzY2hlZHVsZXIgc2VjdGlvbiB3b3VsZCBhbHJlYWR5IGNvdmVyIGl0IHRo
ZW4uIElmIGl0IHdhcyB0byByZW1haW4NCj4+IENQVS1wb29scy1zcGVjaWZpYywgdGhlbiB5
b3UnZCBuZWVkIHRvIHN0aWNrIHRvIHRoZSBsb25nZXIgbmFtZSBhbmQNCj4+IHB1dCBpdCBp
biB0aGUgc2VjdGlvbiB5b3UgaGF2ZSByZXByb2R1Y2VkIGFib3ZlLg0KPiANCj4gSW4gbXkg
b3BpbmlvbiBpdCBpcyBiZXN0IGlmIHRoZSBtYWludGVuYW5jZSBvZiBib290X2NwdXBvb2xz
LmMgZmFsbHMNCj4gdW5kZXIgIkNQVSBQT09MUyIuIEx1Y2EsIHlvdSBjYW4gcmV0YWluIG15
IHJldmlld2VkLWJ5IHdoZW4geW91IGFkZA0KPiB0aGUgY2hhbmdlIHRvIE1BSU5UQUlORVJT
IG9yIHJlbmFtZSB0aGUgZmlsZS4NCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhbiBvcGluaW9uIGlm
IGl0IHNob3VsZCBiZSBjYWxsZWQNCj4geGVuL2NvbW1vbi9ib290X2NwdXBvb2xzLmMgb3Ig
eGVuL2NvbW1vbi9ib290LWNwdXBvb2xzLmMNCj4gDQoNCkknZCBnbyB3aXRoIHhlbi9jb21t
b24vc2NoZWQvYm9vdC1jcHVwb29sLmMNCg0KDQpKdWVyZ2VuDQo=
--------------WiQXL9sFlfdX0ec9pD9ETKgw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WiQXL9sFlfdX0ec9pD9ETKgw--

--------------jcDmYxOMg3ZQDow11SCUgYpr--

--------------tz4HOuIadS0hLCkm0GUPFcrU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJRTl0FAwAAAAAACgkQsN6d1ii/Ey99
lwf/XOIK7Yd5P0kDMlhZrJunwO5NCys0ynX/QQsJGplg3uGyT/WQfHbANgVMHZ9xdnOroJsf36Sq
QjMkMvTPw7ds+NbA4CghjGYBI1raKaq77IR5Kq95PmoA63Eck/NB19cfx34gY0E0NXCURKOWUEoW
SdspQXWt6xysoEJnzJ47SyDF9vZWpRgELH3GTVBAIzA5mA/CBh2LL+Ao1gBPmtaSh+0PnOHWXSIP
LrNOp8x4dAj8IZBS5wRgdITLgULqeHD/PuPDqdW3LhzfMiGGOa6HzkeVt2EBV76qTv15zKOIlbWP
SHtFA7WQksR9fIlDJ4hPawznfCLUTeE8q5/ZrkxVvw==
=x+7x
-----END PGP SIGNATURE-----

--------------tz4HOuIadS0hLCkm0GUPFcrU--

