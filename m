Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20644E5DEC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 06:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294148.499974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXFlZ-000370-Qd; Thu, 24 Mar 2022 05:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294148.499974; Thu, 24 Mar 2022 05:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXFlZ-00034h-NZ; Thu, 24 Mar 2022 05:12:09 +0000
Received: by outflank-mailman (input) for mailman id 294148;
 Thu, 24 Mar 2022 05:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+IHq=UD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXFlY-00034b-0U
 for xen-devel@lists.xen.org; Thu, 24 Mar 2022 05:12:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f87bb0-ab30-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 06:12:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 21DBC210EB;
 Thu, 24 Mar 2022 05:12:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0DB513A66;
 Thu, 24 Mar 2022 05:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cqjmMKX9O2KSfwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Mar 2022 05:12:05 +0000
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
X-Inumbo-ID: f2f87bb0-ab30-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648098726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c8IZXwI1yS4Fh3MiwvEuqX2MGeUL0iRrW8f0q8SlDPw=;
	b=E0anDJgpO9Og7QMI+1rvB3DNWd1PjaIODbiLJVEEUKEMYsn2kfOQoPJyWLYinS8D18spg0
	kcIv23vuuLFvt9HPSKDW/d+4xD9Phfnyda9W6iasimw0NYqAF6m7Jj8PkinNOddoRDIAt+
	DxPyMvCQTqR/rP89MfeawBR91D3Zyzk=
Message-ID: <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
Date: Thu, 24 Mar 2022 06:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, alex.bennee@linaro.org
Cc: xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org,
 viresh.kumar@linaro.org, mathieu.poirier@linaro.com,
 christopher.w.clark@gmail.com, boris.ostrovsky@oracle.com
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
In-Reply-To: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0n6VuV0UyryJFCIuDFZIVaJI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0n6VuV0UyryJFCIuDFZIVaJI
Content-Type: multipart/mixed; boundary="------------SGwZ0ePbgTKsZgHH1O6IIkBv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, alex.bennee@linaro.org
Cc: xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org,
 viresh.kumar@linaro.org, mathieu.poirier@linaro.com,
 christopher.w.clark@gmail.com, boris.ostrovsky@oracle.com
Message-ID: <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>

--------------SGwZ0ePbgTKsZgHH1O6IIkBv
Content-Type: multipart/mixed; boundary="------------CID3Fb0de7Kc0u5yOxhc00g1"

--------------CID3Fb0de7Kc0u5yOxhc00g1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjIgMDI6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gSSBhbSBw
cmV0dHkgc3VyZSB0aGUgcmVhc29ucyBoYXZlIHRvIGRvIHdpdGggb2xkIHg4NiBQViBndWVz
dHMsIHNvIEkgYW0NCj4gQ0NpbmcgSnVlcmdlbiBhbmQgQm9yaXMuDQo+IA0KPiANCj4+IEhp
LA0KPj4NCj4+IFdoaWxlIHdlJ3ZlIGJlZW4gd29ya2luZyBvbiB0aGUgcnVzdC12bW0gdmly
dGlvIGJhY2tlbmRzIG9uIFhlbiB3ZQ0KPj4gb2J2aW91c2x5IGhhdmUgdG8gbWFwIGd1ZXN0
IG1lbW9yeSBpbmZvIHRoZSB1c2Vyc3BhY2Ugb2YgdGhlIGRhZW1vbi4NCj4+IEhvd2V2ZXIg
Zm9sbG93aW5nIHRoZSBsb2dpYyBvZiB3aGF0IGlzIGdvaW5nIG9uIGlzIGEgbGl0dGxlIGNv
bmZ1c2luZy4NCj4+IEZvciBleGFtcGxlIGluIHRoZSBMaW51eCBiYWNrZW5kIHdlIGhhdmUg
dGhpczoNCj4+DQo+PiAgICB2b2lkICpvc2RlcF94ZW5mb3JlaWdubWVtb3J5X21hcCh4ZW5m
b3JlaWdubWVtb3J5X2hhbmRsZSAqZm1lbSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90IGRvbSwgdm9pZCAqYWRkciwNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBwcm90LCBpbnQgZmxhZ3MsIHNpemVfdCBu
dW0sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB4ZW5f
cGZuX3QgYXJyWy8qbnVtKi9dLCBpbnQgZXJyWy8qbnVtKi9dKQ0KPj4gICAgew0KPj4gICAg
ICAgIGludCBmZCA9IGZtZW0tPmZkOw0KPj4gICAgICAgIHByaXZjbWRfbW1hcGJhdGNoX3Yy
X3QgaW9jdGx4Ow0KPj4gICAgICAgIHNpemVfdCBpOw0KPj4gICAgICAgIGludCByYzsNCj4+
DQo+PiAgICAgICAgYWRkciA9IG1tYXAoYWRkciwgbnVtIDw8IFhDX1BBR0VfU0hJRlQsIHBy
b3QsIGZsYWdzIHwgTUFQX1NIQVJFRCwNCj4+ICAgICAgICAgICAgICAgICAgICBmZCwgMCk7
DQo+PiAgICAgICAgaWYgKCBhZGRyID09IE1BUF9GQUlMRUQgKQ0KPj4gICAgICAgICAgICBy
ZXR1cm4gTlVMTDsNCj4+DQo+PiAgICAgICAgaW9jdGx4Lm51bSA9IG51bTsNCj4+ICAgICAg
ICBpb2N0bHguZG9tID0gZG9tOw0KPj4gICAgICAgIGlvY3RseC5hZGRyID0gKHVuc2lnbmVk
IGxvbmcpYWRkcjsNCj4+ICAgICAgICBpb2N0bHguYXJyID0gYXJyOw0KPj4gICAgICAgIGlv
Y3RseC5lcnIgPSBlcnI7DQo+Pg0KPj4gICAgICAgIHJjID0gaW9jdGwoZmQsIElPQ1RMX1BS
SVZDTURfTU1BUEJBVENIX1YyLCAmaW9jdGx4KTsNCj4+DQo+PiBXaGVyZSB0aGUgZmQgcGFz
c2VkIGRvd24gaXMgYXNzb2NpYXRlZCB3aXRoIHRoZSAvZGV2L3hlbi9wcml2Y21kIGRldmlj
ZQ0KPj4gZm9yIGlzc3VpbmcgaHlwZXJjYWxscyBvbiB1c2Vyc3BhY2VzIGJlaGFsZi4gV2hh
dCBpcyBjb25mdXNpbmcgaXMgd2h5DQo+PiB0aGUgZnVuY3Rpb24gZG9lcyBpdCdzIG93biBt
bWFwIC0gb25lIHdvdWxkIGFzc3VtZSB0aGUgcGFzc2VkIGFkZHIgd291bGQNCj4+IGJlIGFz
c29jaWF0ZWQgd2l0aCBhIGFub255bW91cyBvciBmaWxlIGJhY2tlZCBtbWFwIHJlZ2lvbiBh
bHJlYWR5IHRoYXQNCj4+IHRoZSBjYWxsaW5nIGNvZGUgaGFzIHNldHVwLiBBcHBseWluZyBh
IG1tYXAgdG8gYSBzcGVjaWFsIGRldmljZSBzZWVtcyBhDQo+PiBsaXR0bGUgb2RkLg0KPj4N
Cj4+IExvb2tpbmcgYXQgdGhlIGltcGxlbWVudGF0aW9uIG9uIHRoZSBrZXJuZWwgc2lkZSBp
dCBzZWVtcyB0aGUgbW1hcA0KPj4gaGFuZGxlciBvbmx5IHNldHMgYSBmZXcgZmxhZ3M6DQo+
Pg0KPj4gICAgc3RhdGljIGludCBwcml2Y21kX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4gICAgew0KPj4gICAgICAgICAgICAvKiBE
T05UQ09QWSBpcyBlc3NlbnRpYWwgZm9yIFhlbiBiZWNhdXNlIGNvcHlfcGFnZV9yYW5nZSBk
b2Vzbid0IGtub3cNCj4+ICAgICAgICAgICAgICogaG93IHRvIHJlY3JlYXRlIHRoZXNlIG1h
cHBpbmdzICovDQo+PiAgICAgICAgICAgIHZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9Q
Rk5NQVAgfCBWTV9ET05UQ09QWSB8DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Vk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOw0KPj4gICAgICAgICAgICB2bWEtPnZtX29w
cyA9ICZwcml2Y21kX3ZtX29wczsNCj4+ICAgICAgICAgICAgdm1hLT52bV9wcml2YXRlX2Rh
dGEgPSBOVUxMOw0KPj4NCj4+ICAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgICB9DQo+Pg0K
Pj4gU28gY2FuIEkgY29uZmlybSB0aGF0IHRoZSBtbWFwIG9mIC9kZXYveGVuL3ByaXZjbWQg
aXMgYmVpbmcgY2FsbGVkIGZvcg0KPj4gc2lkZSBlZmZlY3RzPyBJcyBpdCBzbyB3aGVuIHRo
ZSBhY3R1YWwgaW9jdGwgaXMgY2FsbGVkIHRoZSBjb3JyZWN0IGZsYWdzDQo+PiBhcmUgc2V0
IG9mIHRoZSBwYWdlcyBhc3NvY2lhdGVkIHdpdGggdGhlIHVzZXIgc3BhY2UgdmlydHVhbCBh
ZGRyZXNzDQo+PiByYW5nZT8NCj4+DQo+PiBDYW4gSSBjb25maXJtIHRoZXJlIHNob3VsZG4n
dCBiZSBhbnkgbGltaXRhdGlvbiBvbiB3aGVyZSBhbmQgaG93IHRoZQ0KPj4gdXNlcnNwYWNl
IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBpcyBzZXR1cCBmb3IgdGhlIG1hcHBpbmcgaW4gdGhl
IGd1ZXN0DQo+PiBtZW1vcnk/DQo+Pg0KPj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHRoaXMg
aXNuJ3QgZG9uZSBpbiB0aGUgaW9jdGwgcGF0aCBpdHNlbGY/DQoNCkZvciBhIHJhdGhlciBs
b25nIHRpbWUgd2Ugd2VyZSB1c2luZyAibm9ybWFsIiB1c2VyIHBhZ2VzIGZvciB0aGlzIHB1
cnBvc2UsDQp3aGljaCB3ZXJlIGp1c3QgbG9ja2VkIGludG8gbWVtb3J5IGZvciBkb2luZyB0
aGUgaHlwZXJjYWxsLg0KDQpVbmZvcnR1bmF0ZWx5IHRoZXJlIGhhdmUgYmVlbiB2ZXJ5IHJh
cmUgcHJvYmxlbXMgd2l0aCB0aGF0IGFwcHJvYWNoLCBhcw0KdGhlIExpbnV4IGtlcm5lbCBj
YW4gc2V0IGEgdXNlciBwYWdlIHJlbGF0ZWQgUFRFIHRvIGludmFsaWQgZm9yIHNob3J0DQpw
ZXJpb2RzIG9mIHRpbWUsIHdoaWNoIGxlZCB0byBFRkFVTFQgaW4gdGhlIGh5cGVydmlzb3Ig
d2hlbiB0cnlpbmcgdG8NCmFjY2VzcyB0aGUgaHlwZXJjYWxsIGRhdGEuDQoNCkluIExpbnV4
IHRoaXMgY2FuIGF2b2lkZWQgb25seSBieSB1c2luZyBrZXJuZWwgbWVtb3J5LCB3aGljaCBp
cyB0aGUNCnJlYXNvbiB3aHkgdGhlIGh5cGVyY2FsbCBidWZmZXJzIGFyZSBhbGxvY2F0ZWQg
YW5kIG1tYXAoKS1lZCB0aHJvdWdoIHRoZQ0KcHJpdmNtZCBkcml2ZXIuDQoNCj4+DQo+PiBJ
J20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gWGVuIGFu
ZCBLVk0gaW4gdGhlIEFQSQ0KPj4gY2hvaWNlcyBoZXJlLiBJIHRoaW5rIHRoZSBlcXVpdmFs
ZW50IGlzIHRoZSBLVk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lPTg0KPj4gaW9jdGwgZm9yIEtW
TSB3aGljaCBicmluZ3MgYSBzZWN0aW9uIG9mIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNz
IHNwYWNlDQo+PiBpbnRvIHRoZSB1c2Vyc3BhY2VzIHZhZGRyIHJhbmdlLg0KDQpUaGUgbWFp
biBkaWZmZXJlbmNlIGlzIGp1c3QgdGhhdCB0aGUgY29uc3VtZXIgb2YgdGhlIGh5cGVyY2Fs
bCBidWZmZXIgaXMNCk5PVCB0aGUga2VybmVsLCBidXQgdGhlIGh5cGVydmlzb3IuIEluIHRo
ZSBLVk0gY2FzZSBib3RoIGFyZSB0aGUgc2FtZSwgc28NCmEgYnJpZWYgcGVyaW9kIG9mIGFu
IGludmFsaWQgUFRFIGNhbiBiZSBoYW5kbGVkIGp1c3QgZmluZSBpbiBLVk0sIHdoaWxlDQp0
aGUgWGVuIGh5cGVydmlzb3IgaGFzIG5vIGlkZWEgdGhhdCB0aGlzIHNpdHVhdGlvbiB3aWxs
IGJlIG92ZXIgdmVyeSBzb29uLg0KDQoNCkp1ZXJnZW4NCg==
--------------CID3Fb0de7Kc0u5yOxhc00g1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CID3Fb0de7Kc0u5yOxhc00g1--

--------------SGwZ0ePbgTKsZgHH1O6IIkBv--

--------------0n6VuV0UyryJFCIuDFZIVaJI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI7/aUFAwAAAAAACgkQsN6d1ii/Ey/S
Fwf+PP0QKriFGEQ3Wo/t6GQBZcCJVXJVd+ml+uUdZPIQ8ucKpaeiuQ4hqqqYIjBuPIs+g0YwMII4
gYnjjlQeqdAXIuZI8eXgNTMT8eLn7k8vipC5hjHew74MWFyL0hNd1BfZJn5OhaL4hoxJYOQX74ZF
ZXd7dYkmqszN1jZEtCXOeEJ/NFkQCgqSYY1m2Yd5oNPlU15ct664k+qY5G+9zbORJIY8LKMRNhbL
AA2aCtHzVyXQuMbAkgM7L8XQoCbqDwx3eHj30tVanTR+ZhZdpWV/AcfWFJ+7f+n5vNJdFZ3CqhUY
+q0XRv473QIGczIPF/8VbqYAZQxOpXeFKD5mZ52n1A==
=f68j
-----END PGP SIGNATURE-----

--------------0n6VuV0UyryJFCIuDFZIVaJI--

