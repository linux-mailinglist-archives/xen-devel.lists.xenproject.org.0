Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706195F57C2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 17:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416308.660971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og6at-0005gv-Ek; Wed, 05 Oct 2022 15:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416308.660971; Wed, 05 Oct 2022 15:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og6at-0005ea-Bm; Wed, 05 Oct 2022 15:45:59 +0000
Received: by outflank-mailman (input) for mailman id 416308;
 Wed, 05 Oct 2022 15:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1og6as-0005eS-AL
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 15:45:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd7d3ce9-44c4-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 17:45:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 956451F8D1;
 Wed,  5 Oct 2022 15:45:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E27713345;
 Wed,  5 Oct 2022 15:45:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v0JrHbSmPWM1SgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Oct 2022 15:45:56 +0000
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
X-Inumbo-ID: cd7d3ce9-44c4-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664984756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TpBzPmJIAtSaRs0h+cceiJA73uDEVV38dIoDlYGqkkY=;
	b=DEUYwLdO/aZtiyevuj0C8xA3+5G+T2BGQEXpct4gEhA33mHVkJ7mM4+qnFL760+Yh3ImwK
	9bKNELcLInZSxmsFUAywuaBIqcUl+1b8sMXig3nhCFIaA1yXXqqcuJnBcTLgWiwWaHEWvh
	5TSeMt49qAeF944/CVc3BDdCQB+Un9A=
Message-ID: <a8366482-ba75-19e7-4e82-ba968ec9ddcb@suse.com>
Date: Wed, 5 Oct 2022 17:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com> <Yz2L9eTdbA3vS43g@mail-itl>
 <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com> <Yz2kKU5qEvD25iJX@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
In-Reply-To: <Yz2kKU5qEvD25iJX@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jyYE0pN4nrQoCl0FhJJ8GDww"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jyYE0pN4nrQoCl0FhJJ8GDww
Content-Type: multipart/mixed; boundary="------------eAR0Jx87y5n7uwgxmMqiFs00";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <a8366482-ba75-19e7-4e82-ba968ec9ddcb@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com> <Yz2L9eTdbA3vS43g@mail-itl>
 <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com> <Yz2kKU5qEvD25iJX@mail-itl>
In-Reply-To: <Yz2kKU5qEvD25iJX@mail-itl>

--------------eAR0Jx87y5n7uwgxmMqiFs00
Content-Type: multipart/mixed; boundary="------------MjS4cVdE20cqdY2SxR1kgPXJ"

--------------MjS4cVdE20cqdY2SxR1kgPXJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjIgMTc6MzUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDU6MDQ6MjlQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDA1LjEwLjIyIDE1OjUxLCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JvdGU6DQo+Pj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDM6MzQ6NTZQ
TSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMDUuMTAuMjIgMTU6MjUs
IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgT2N0
IDA1LCAyMDIyIGF0IDAyOjU3OjAxUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
Pj4+Pj4gT24gMDUuMTAuMjIgMTQ6NDEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3
cm90ZToNCj4+Pj4+Pj4gSGksDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFdoZW4gYm9vdGluZyBYZW4g
d2l0aCBMaW51eCBkb20wIG5lc3RlZCB1bmRlciBLVk0sDQo+Pj4+Pj4+IENPTkZJR19YRU5f
VklSVElPX0ZPUkNFX0dSQU5UPXkgbWFrZXMgaXQgdW5hYmxlIHRvIHVzZSB2aXJ0aW8gZGV2
aWNlcw0KPj4+Pj4+PiBwcm92aWRlZCBieSBMMCBoeXBlcnZpc29yIChLVk0gd2l0aCBxZW11
KS4gV2l0aCBQViBkb20wLCBncmFudHMgYXJlDQo+Pj4+Pj4+IHJlcXVpcmVkIGZvciB2aXJ0
aW8gZXZlbiBpZiBqdXN0IENPTkZJR19YRU5fVklSVElPIGlzIGVuYWJsZWQuDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IFRoaXMgaXMgcHJvYmFibHkgdW5jb21tb24gY29ybmVyIGNhc2UsIGJ1dCBv
bmUgdGhhdCBoYXMgYml0dGVuIG1lIGluIG15DQo+Pj4+Pj4+IENJIHNldHVwLi4uIEkgdGhp
bmsgWGVuIHNob3VsZCBzZXQgc21hcnRlcg0KPj4+Pj4+PiB2aXJ0aW9fcmVxdWlyZV9yZXN0
cmljdGVkX21lbV9hY2MoKSwgdGhhdCBlbmZvcmNlcyBpdCBvbmx5IGZvciBkZXZpY2VzDQo+
Pj4+Pj4+IHJlYWxseSBwcm92aWRlZCBieSBhbm90aGVyIFhlbiBWTSAobm90IGJ5IHRoZSAi
b3V0ZXIgaG9zdCIpLCBidXQgSSdtIG5vdA0KPj4+Pj4+PiBzdXJlIGhvdyB0aGF0IGNvdWxk
IGJlIGRvbmUuIEFueSBpZGVhcz8NCj4+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IEl0IHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBhZGQgYSBib290IHBhcmFtZXRlciBmb3IgdGhhdCBwdXJwb3Nl
LiBVc2luZyBpdA0KPj4+Pj4+IHdvdWxkIG9wZW4gYSBzZWN1cml0eSBob2xlLCB0aG91Z2gg
KGJhc2ljYWxseSBsaWtlIGFsbCBQQ0kgcGFzc3Rocm91Z2ggdG8NCj4+Pj4+PiBQViBndWVz
dHMpLg0KPj4+Pj4NCj4+Pj4+IFdoYXQgYWJvdXQgZXhjbHVkaW5nIGp1c3QgZG9tMD8gQXQg
bGVhc3QgY3VycmVudGx5LCB0aGVyZSBpcyBubyB3YXkgZm9yDQo+Pj4+PiBkb20wIHRvIHNl
ZSB2aXJ0aW8gZGV2aWNlcyBwcm92aWRlZCBieSBhbm90aGVyIFhlbiBkb21VLg0KPj4+Pg0K
Pj4+PiBFdmVuIG5vdCB2aWEgaG90cGx1Zz8NCj4+Pg0KPj4+IFRoYXQncyB3aHkgSSBzYWlk
ICJjdXJyZW50bHkiLCBJSVVDIGhvdHBsdWcgb2YgdmlydGlvIGRldmljZXMgdW5kZXIgWGVu
DQo+Pj4gZG9lc24ndCB3b3JrIHlldCwgbm8/DQo+Pj4gV2l0aCBob3RwbHVnIHdvcmtpbmcs
IGl0IHdvdWxkIG5lZWQgdG8gYmUgYSBwcm9wZXIgZGV0ZWN0aW9uIHdoZXJlIHRoZQ0KPj4+
IGJhY2tlbmQgbGl2ZXMsIGFuZCBwcm9iYWJseSB3aXRoIHNvbWUgZXh0cmEgY29uc2lkZXJh
dGlvbnMgcmUgWGVuIG9uDQo+Pj4gWGVuIChiYXNlZCBvbiBiZWxvdywgcHYtc2hpbSBjb3Vs
ZCB1c2UgZ3JhbnRzKS4NCj4+DQo+PiBBcyBzdGF0ZWQgYmVmb3JlLCB0aGlzIGlzbid0IGEg
cHJvYmxlbSBzcGVjaWZpYyB0byB2aXJ0aW8gZGV2aWNlcy4gVGhlIHNhbWUNCj4+IGFwcGxp
ZXMgdG8gWGVuIFBWIGRldmljZXMuDQo+IA0KPiBXaHkgaXMgdGhhdCBhbiBpc3N1ZSBmb3Ig
WGVuIFBWIGRldmljZXM/IFRoZXkgYWx3YXlzIHVzZSBncmFudHMsIHNvIG5vIG5lZWQNCj4g
Zm9yIGV4Y2VwdGlvbi4gQnV0IG1vcmUgcmVsZXZhbnQgaGVyZSwgdGhlcmUgaXMgbm8gcHJv
dG9jb2wgZm9yIEwwDQo+IGh5cGVydmlzb3IgKHRoYXQgd291bGQgbmVlZCB0byBiZSBYZW4p
IHRvIHByb3ZpZGUgUFYgZGV2aWNlIHRvIG5lc3RlZCBMMQ0KPiBndWVzdCAoYmVzaWRlcyBw
di1zaGltIGNhc2UsIHdoaWNoIGlzIGFscmVhZHkgaGFuZGxlZCksIHNvIEwxIGd1ZXN0DQo+
IGNhbm5vdCBjb25mdXNlIFBWIGRldmljZSBwcm92aWRlZCBieSBMMCBhbmQgTDEuDQoNClRo
YXQncyB0aGUgcG9pbnQuIFRvZGF5IHVzaW5nIHZpcnRpbyB0aGUgd2F5IHlvdSBhcmUgdXNp
bmcgaXQgaXMgcG9zc2libGUNCm9ubHkgYmVjYXVzZSB2aXJ0aW8gZGV2aWNlcyBkb24ndCBo
YXZlIHRoZSBzZWN1cml0eSBmZWF0dXJlcyBvZiBYZW4gUFYNCmRldmljZXMuIFdpdGggYWRk
aW5nIGdyYW50IHN1cHBvcnQgZm9yIHZpcnRpbyBkZXZpY2VzIHRoaXMgaGFzIGNoYW5nZWQu
DQoNCkJUVywgeW91IGNhbiBoYXZlIHRoZSBvbGQgdmlydGlvIGJlaGF2aW9yIGJhY2sgYnkg
bm90IGVuYWJsaW5nDQpDT05GSUdfWEVOX1ZJUlRJTy4NCg0KPiANCj4+PiBGb3IgbWUgc3Bl
Y2lmaWNhbGx5LCBhIGNvbW1hbmQgbGluZSBvcHRpb24gd291bGQgd29yayAoYmVjYXVzZSBJ
IGRvbid0DQo+Pj4gdXNlIFhlbi1iYXNlZCB2aXJ0aW8gZGV2aWNlcyB3aGVuIG5lc3RlZCB1
bmRlciBLVk0sIG9yIGFueXdoZXJlIGF0IGFsbCwNCj4+PiBhdCBsZWFzdCBub3QgeWV0KSwg
YnV0IEkgY2FuIHNlZSBmdXR1cmUgY2FzZXMgd2hlcmUgeW91IGhhdmUgdmlydGlvDQo+Pj4g
ZGV2aWNlcyBmcm9tIGJvdGggTDAgYW5kIEwxIGluIHRoZSBzYW1lIGd1ZXN0LCBhbmQgdGhl
biBpdCB3b3VsZG4ndCBiZQ0KPj4+IHRoYXQgc2ltcGxlLg0KPj4NCj4+IExldHMgdGhpbmsg
b2YgYSBnZW5lcmFsIHNvbHV0aW9uIGNvdmVyaW5nIGFsbCBQViBkZXZpY2VzIChYZW4gYW5k
IHZpcnRpbykuDQo+IA0KPiBJbiBmYWN0LCBJIHdvbmRlciB3aGF0J3MgdGhlIHNlY3VyaXR5
IGJlbmVmaXQgb2YNCj4gQ09ORklHX1hFTl9WSVJUSU9fRk9SQ0VfR1JBTlQuIElmIHRoZSBi
YWNrZW5kIGxpdmVzIGluIGRvbTAgKG9yDQo+IHN0dWJkb21haW4pLCBpdCBjYW4gYWNjZXNz
IHdob2xlIGd1ZXN0IG1lbW9yeSBhbnl3YXksIHdoZXRoZXIgZnJvbnRlbmQNCj4gbGlrZXMg
aXQgb3Igbm90LiBCdXQgaWYgdGhlIGJhY2tlbmQgaXMgZWxzZXdoZXJlIChvciBndWVzdCBp
cyBwcm90ZWN0ZWQNCj4gd2l0aCBBTUQgU0VWLVNOUCwgWFNNIG9yIHNpbWlsYXIpLCB0aGVu
IHRoZSBiYWNrZW5kIHdvbid0IGJlIGFibGUgdG8gYWNjZXNzDQo+IG1lbW9yeSBvdXRzaWRl
IG9mIHdoYXQgZnJvbnRlbmQgc2hhcmVzIGV4cGxpY2l0bHkuIFNvLCBpbiB0aGUgbm9uLWRv
bTAgY2FzZSwNCj4gYmFja2VuZCB0cnlpbmcgdG8gcHJvdmlkZSBub24tZ3JhbnQtYmFzZWQg
dmlydGlvIGRldmljZSB3aWxsIHNpbXBseSBub3QNCj4gZnVuY3Rpb24gKGJlY2F1c2Ugb2Yg
aW5hYmlsaXR5IHRvIGFjY2VzcyBndWVzdCdzIG1lbW9yeSksIGluc3RlYWQgb2YNCj4gZ2Fp
bmluZyB1bmludGVuZGVkIGFjY2Vzcy4gQW0gSSBtaXNzaW5nIHNvbWUgaW1wbGljaXQgbWVt
b3J5IHNoYXJpbmcNCj4gaGVyZT8NCg0KWW91IGFyZSBtaXNzaW5nIHRoZSBwb3NzaWJpbGl0
eSB0byBoYXZlIGEgZGVwcml2aWxlZ2VkIHVzZXIgbGFuZCB2aXJ0aW8NCmJhY2tlbmQuDQoN
CkFuZCBCVFcsIFNFViB3b24ndCBkaXNhYmxlIGd1ZXN0IG1lbW9yeSBhY2Nlc3MsIGl0IHdp
bGwganVzdCBtYWtlIGl0DQppbXBvc3NpYmxlIHRvIGludGVycHJldGUgbWVtb3J5IGNvbnRl
bnRzIGZyb20gb3V0c2lkZS4gQSBtYWxpY2lvdXMNCmJhY2tlbmQgY2FuIHN0aWxsIGVhc2ls
eSBjcmFzaCBhIFNFViBndWVzdCBieSBjbG9iYmVyaW5nIGl0cyBtZW1vcnkuDQoNCg0KSnVl
cmdlbg0K
--------------MjS4cVdE20cqdY2SxR1kgPXJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------MjS4cVdE20cqdY2SxR1kgPXJ--

--------------eAR0Jx87y5n7uwgxmMqiFs00--

--------------jyYE0pN4nrQoCl0FhJJ8GDww
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM9prQFAwAAAAAACgkQsN6d1ii/Ey/v
wQf8DYQ+OvhzkYSYeVdl3r5iOMNy8nFRgJG84fdQTNNBdGnEsNrGRB8V8E2V4mFugpou/jMWsIT2
NfXVB8S3M0cl0bflt6cfHah1ovej5S927FhjsslMm+vKoRYjJWaBLEZ3Iu0ajObRf7xdocx3oEXt
Bm+6vfzE+wrCfehP8bdDxJIXzq8HCuwrEXcLxFSM//Owd1vOz8oKm0B2pMwaRrKgo5MD23VwgfyX
2SkqHlhrL2Y4SnBkbhK6IGlDAMBVlw5lqN2EnBYqr6uwhaZTKoBhN/aUSHEL7lrgNswbg/pDYd+E
xADtgSlrPKSn4nUJiAazNSNYQxc7wafmFwsGmSF7uA==
=amos
-----END PGP SIGNATURE-----

--------------jyYE0pN4nrQoCl0FhJJ8GDww--

