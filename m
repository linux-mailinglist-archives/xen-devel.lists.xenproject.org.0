Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C10459FAFD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392597.631051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqDS-0004n4-IF; Wed, 24 Aug 2022 13:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392597.631051; Wed, 24 Aug 2022 13:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqDS-0004lH-FP; Wed, 24 Aug 2022 13:14:42 +0000
Received: by outflank-mailman (input) for mailman id 392597;
 Wed, 24 Aug 2022 13:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQqDQ-0004lB-KG
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 13:14:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6a82a32-23ae-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 15:14:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3F3D3434E;
 Wed, 24 Aug 2022 13:14:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63D3813780;
 Wed, 24 Aug 2022 13:14:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qz/aFj4kBmOkZQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 13:14:38 +0000
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
X-Inumbo-ID: a6a82a32-23ae-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661346878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w/sYw3NcoWYwrXF2/kOec+46M1ET5zP7UlMCgtAkMZE=;
	b=D4ordXch++qfNjU/Dlb7N+ZIfsYYp81ljBLkpeQe8yUe78LYvwSSWNlAhHXSxfWU2HsjvR
	zmEOt8s18F6P3ydfcknCzyqmx74euuLbh0QMPKvOmoKi3LOM9SMPNBrvGLru7ej0LqHOzn
	ggY+r3RxI3+R52wI8wJi4YDPEsMSeXo=
Message-ID: <497dd97e-eea1-b4a9-6a04-cd2575e1d41c@suse.com>
Date: Wed, 24 Aug 2022 15:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org,
 Stratos-dev@op-lists.linaro.org, mathieu.poirier@linaro.com,
 christopher.w.clark@gmail.com, boris.ostrovsky@oracle.com,
 gregkh@linuxfoundation.org, vincent.guittot@linaro.org, olekstysh@gmail.com
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <a04eebde-1ad4-b6d2-9867-caea88de0484@suse.com> <8735dlj21i.fsf@linaro.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
In-Reply-To: <8735dlj21i.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3Kk0FH6Pkn0GtpNzzKaGyUd9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3Kk0FH6Pkn0GtpNzzKaGyUd9
Content-Type: multipart/mixed; boundary="------------40aVjlAsTu8qjT1mpc3GDoj2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org,
 Stratos-dev@op-lists.linaro.org, mathieu.poirier@linaro.com,
 christopher.w.clark@gmail.com, boris.ostrovsky@oracle.com,
 gregkh@linuxfoundation.org, vincent.guittot@linaro.org, olekstysh@gmail.com
Message-ID: <497dd97e-eea1-b4a9-6a04-cd2575e1d41c@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <a04eebde-1ad4-b6d2-9867-caea88de0484@suse.com> <8735dlj21i.fsf@linaro.org>
In-Reply-To: <8735dlj21i.fsf@linaro.org>

--------------40aVjlAsTu8qjT1mpc3GDoj2
Content-Type: multipart/mixed; boundary="------------UAtCoOcISWxF16gw2inHgbg8"

--------------UAtCoOcISWxF16gw2inHgbg8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTM6NDcsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gDQo+IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JpdGVzOg0KPiANCj4+IFtbUEdQIFNpZ25lZCBQ
YXJ0OlVuZGVjaWRlZF1dDQo+PiBPbiAyNC4wOC4yMiAxMToxOSwgVmlyZXNoIEt1bWFyIHdy
b3RlOg0KPj4+IE9uIDI0LTAzLTIyLCAwNjoxMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+
Pj4gRm9yIGEgcmF0aGVyIGxvbmcgdGltZSB3ZSB3ZXJlIHVzaW5nICJub3JtYWwiIHVzZXIg
cGFnZXMgZm9yIHRoaXMgcHVycG9zZSwNCj4+Pj4gd2hpY2ggd2VyZSBqdXN0IGxvY2tlZCBp
bnRvIG1lbW9yeSBmb3IgZG9pbmcgdGhlIGh5cGVyY2FsbC4NCj4+Pj4NCj4+Pj4gVW5mb3J0
dW5hdGVseSB0aGVyZSBoYXZlIGJlZW4gdmVyeSByYXJlIHByb2JsZW1zIHdpdGggdGhhdCBh
cHByb2FjaCwgYXMNCj4+Pj4gdGhlIExpbnV4IGtlcm5lbCBjYW4gc2V0IGEgdXNlciBwYWdl
IHJlbGF0ZWQgUFRFIHRvIGludmFsaWQgZm9yIHNob3J0DQo+Pj4+IHBlcmlvZHMgb2YgdGlt
ZSwgd2hpY2ggbGVkIHRvIEVGQVVMVCBpbiB0aGUgaHlwZXJ2aXNvciB3aGVuIHRyeWluZyB0
bw0KPj4+PiBhY2Nlc3MgdGhlIGh5cGVyY2FsbCBkYXRhLg0KPj4+Pg0KPj4+PiBJbiBMaW51
eCB0aGlzIGNhbiBhdm9pZGVkIG9ubHkgYnkgdXNpbmcga2VybmVsIG1lbW9yeSwgd2hpY2gg
aXMgdGhlDQo+Pj4+IHJlYXNvbiB3aHkgdGhlIGh5cGVyY2FsbCBidWZmZXJzIGFyZSBhbGxv
Y2F0ZWQgYW5kIG1tYXAoKS1lZCB0aHJvdWdoIHRoZQ0KPj4+PiBwcml2Y21kIGRyaXZlci4N
Cj4+PiBIaSBKdWVyZ2VuLA0KPj4+IEkgdW5kZXJzdGFuZCB3aHkgd2UgbW92ZWQgZnJvbSB1
c2VyIHBhZ2VzIHRvIGtlcm5lbCBwYWdlcywgYnV0IEkNCj4+PiBkb24ndA0KPj4+IGZ1bGx5
IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQgdG8gbWFrZSB0d28gc2VwYXJhdGUgY2FsbHMgdG8g
bWFwIHRoZQ0KPj4+IGd1ZXN0IG1lbW9yeSwgaS5lLiBtbWFwKCkgZm9sbG93ZWQgYnkgaW9j
dGwoSU9DVExfUFJJVkNNRF9NTUFQQkFUQ0gpLg0KPj4+IFdoeSBhcmVuJ3Qgd2UgZG9pbmcg
YWxsIG9mIGl0IGZyb20gbW1hcCgpIGl0c2VsZiA/IEkgaGFja2VkIGl0IHVwIHRvDQo+Pj4g
Y2hlY2sgb24gaXQgYW5kIGl0IHdvcmtzIGZpbmUgaWYgd2UgZG8gaXQgYWxsIGZyb20gbW1h
cCgpIGl0c2VsZi4NCj4+DQo+PiBIeXBlcmNhbGwgYnVmZmVycyBhcmUgbmVlZGVkIGZvciBt
b3JlIHRoYW4ganVzdCB0aGUgIk1NQVBCQVRDSCIgaHlwZXJjYWxsLg0KPj4gT3IgYXJlIHlv
dSBzdWdnZXN0aW5nIG9uZSBkZXZpY2UgcGVyIHBvc3NpYmxlIGh5cGVyY2FsbD8NCj4+DQo+
Pj4gQXJlbid0IHdlIGFidXNpbmcgdGhlIExpbnV4IHVzZXJzcGFjZSBBQkkgaGVyZSA/IEFz
IHN0YW5kYXJkIHVzZXJzcGFjZQ0KPj4+IGNvZGUgd291bGQgZXhwZWN0IGp1c3QgbW1hcCgp
IHRvIGJlIGVub3VnaCB0byBtYXAgdGhlIG1lbW9yeS4gWWVzLCB0aGUNCj4+PiBjdXJyZW50
IHVzZXIsIFhlbiBpdHNlbGYsIGlzIGFkYXB0ZWQgdG8gbWFrZSB0d28gY2FsbHMsIGJ1dCBp
dCBicmVha3MNCj4+PiBhcyBzb29uIGFzIHdlIHdhbnQgdG8gdXNlIHNvbWV0aGluZyB0aGF0
IHJlbGllcyBvbiBMaW51eCB1c2Vyc3BhY2UNCj4+PiBBQkkuDQo+Pg0KPj4gSSB0aGluayB5
b3UgYXJlIHN0aWxsIG1peGluZyB1cCB0aGUgaHlwZXJjYWxsIGJ1ZmZlcnMgd2l0aCB0aGUg
bWVtb3J5DQo+PiB5b3Ugd2FudCB0byBtYXAgdmlhIHRoZSBoeXBlcmNhbGwuIEF0IGxlYXN0
IHRoZSByZWZlcmVuY2UgdG8ga2VybmVsDQo+PiBtZW1vcnkgYWJvdmUgaXMgc3VnZ2VzdGlu
ZyB0aGF0Lg0KPiANCj4gQXJlbid0IHRoZSBoeXBlcmNhbGwgYnVmZmVycyBhbGwgaW50ZXJu
YWwgdG8gdGhlIGtlcm5lbC9oeXBlcnZpc29yDQo+IGludGVyZmFjZSBvciBhcmUgeW91IHRh
bGtpbmcgYWJvdXQgdGhlIGlvY3RsIGNvbnRlbnRzPw0KDQpUaGUgaHlwZXJjYWxsIGJ1ZmZl
cnMgYXJlIGZpbGxlZCBieSB0aGUgWGVuIGxpYnJhcmllcyBpbiB1c2VyIG1vZGUuIFRoZQ0K
aW9jdGwoKSBpcyByZWFsbHkgb25seSBhIHBhc3N0aHJvdWdoIG1lY2hhbmlzbSBmb3IgZG9p
bmcgaHlwZXJjYWxscywgYXMNCmh5cGVyY2FsbHMgYXJlIGFsbG93ZWQgb25seSBmcm9tIHRo
ZSBrZXJuZWwuIEluIG9yZGVyIG5vdCBoYXZpbmcgdG8NCmFkYXB0IHRoZSBrZXJuZWwgZHJp
dmVyIGZvciBlYWNoIG5ldyBoeXBlcmNhbGwsIGFsbCBwYXJhbWV0ZXJzIGZvciB0aGUNCmh5
cGVyY2FsbCwgaW5jbHVkaW5nIHRoZSBpbiBtZW1vcnkgb25lcywgYXJlIHByZXBhcmVkIGJ5
IHRoZSBYZW4NCmxpYnJhcmllcyBhbmQgdGhlbiBnaXZlbiB0byB0aGUgaHlwZXJ2aXNvciB2
aWEgdGhlIGlvY3RsKCkuIFRoaXMgYWxsb3dzDQp0byB1c2UgZXhpc3Rpbmcga2VybmVscyB3
aXRoIG5ldyBYZW4gdmVyc2lvbnMuDQoNCllvdXIgZGVjaXNpb24gdG8gaWdub3JlIHRoZSBY
ZW4gbGlicmFyaWVzIG1pZ2h0IGZpcmUgYmFjayBpbiBjYXNlIGENCmRvbTAtb25seSBoeXBl
cmNhbGwgaXMgYmVpbmcgY2hhbmdlZCBpbiBhIG5ldyBYZW4gdmVyc2lvbiBvciBldmVuIGlu
IGENClhlbiB1cGRhdGU6IGFzIFhlbiB0b29scyBhbmQgdGhlIGh5cGVydmlzb3IgYXJlIGNv
dXBsZWQsIHRoZSB1cGRhdGVkDQpYZW4gbGlicmFyaWVzIHdpbGwgd29yayB3aXRoIHRoZSBu
ZXcgaHlwZXJ2aXNvciwgd2hpbGUgeW91ciBWTU0gd2lsbA0KcHJvYmFibHkgYnJlYWssIHVu
bGVzcyB5b3UgYXJlIGJ1aWxkaW5nIGl0IGZvciBlYWNoIFhlbiB2ZXJzaW9uLg0KDQoNCkp1
ZXJnZW4NCg==
--------------UAtCoOcISWxF16gw2inHgbg8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------UAtCoOcISWxF16gw2inHgbg8--

--------------40aVjlAsTu8qjT1mpc3GDoj2--

--------------3Kk0FH6Pkn0GtpNzzKaGyUd9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMGJD0FAwAAAAAACgkQsN6d1ii/Ey/1
9wf/fjOOvwJB2ZYsCX1zVqqH2EvTFT5gxsMbg3FPyZTcBflNQ5+hGuPvedUg4Hsd22Ao2b4Szeaf
nZMIvrYduq0yrhcDRxW1NNVP5FIzLl/CgHEMuTg1qypO7ICllDIrDldM+qBSF+khWSM0zHswq+U/
6mrrujq15pvu14B/SeisxP6VVXXgIndzXklYk2w++DiAFdiWEkZHmnNIC+y/DhiTccs0W9nJmlAb
BaMYs5OzDsZEQSjT1m85IxPS9XCaW8SzEm9FTetI6+faiMIfpIEm8RovnSd1HanV4t1dUcJLD1V8
OWm9PYpPnsHikuPylhwML7t68b9L7j/oH37KC1Uk2A==
=e2UW
-----END PGP SIGNATURE-----

--------------3Kk0FH6Pkn0GtpNzzKaGyUd9--

