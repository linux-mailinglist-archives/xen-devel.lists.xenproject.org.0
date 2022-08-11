Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B406E58F86C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 09:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384227.619531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM2hh-0000hR-KC; Thu, 11 Aug 2022 07:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384227.619531; Thu, 11 Aug 2022 07:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM2hh-0000e2-H4; Thu, 11 Aug 2022 07:34:05 +0000
Received: by outflank-mailman (input) for mailman id 384227;
 Thu, 11 Aug 2022 07:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jyZJ=YP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oM2hf-0000dv-J2
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 07:34:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a9a687-1947-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 09:34:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 09575386E0;
 Thu, 11 Aug 2022 07:34:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E2A51342A;
 Thu, 11 Aug 2022 07:34:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t776JOiw9GI/OgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 11 Aug 2022 07:34:00 +0000
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
X-Inumbo-ID: f7a9a687-1947-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660203241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYBgpWOu3/19WD+GMmYcvppDczQ7yVeocRDLqEddeno=;
	b=m0mpPtGQZ4p86yYoJ+tXFcY4kk28Yb/57J8XBinSkv9s15tO4GWtA2fRjwO03xI8lfQP/Q
	3Q7EoBi6YjXyZc6BQXnIumpPKaWZSaT4umQrocKR2ittgzddjc/UMuv4pz2JUWMSbsIAl8
	FKBEUq7hgk3fBgNVlrlP0HHHbTiAsdM=
Message-ID: <23495ff0-4561-00b4-d96b-2f1bf4117b7a@suse.com>
Date: Thu, 11 Aug 2022 09:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Reg. Tee init fail...
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
 <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>
 <60bf0e8a-1b58-4df4-fdcf-bcfeedd64e77@suse.com> <YvQ3cEFxWFi7fXjX@mail-itl>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YvQ3cEFxWFi7fXjX@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tnHr9OQoOKo2g0TtkaKgfTTc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tnHr9OQoOKo2g0TtkaKgfTTc
Content-Type: multipart/mixed; boundary="------------jIKTS0XSEgSD69M9L2V9hZIE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Message-ID: <23495ff0-4561-00b4-d96b-2f1bf4117b7a@suse.com>
Subject: Re: Reg. Tee init fail...
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
 <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>
 <60bf0e8a-1b58-4df4-fdcf-bcfeedd64e77@suse.com> <YvQ3cEFxWFi7fXjX@mail-itl>
In-Reply-To: <YvQ3cEFxWFi7fXjX@mail-itl>

--------------jIKTS0XSEgSD69M9L2V9hZIE
Content-Type: multipart/mixed; boundary="------------rHe8xxYbkm2Z4cqfvU2PxKlH"

--------------rHe8xxYbkm2Z4cqfvU2PxKlH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDguMjIgMDA6NTUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gVGh1LCBKdW4gMzAsIDIwMjIgYXQgMDc6MzE6MzhBTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDMwLjA2LjIyIDA1OjMyLCBTSywgU2l2YVNhbmdlZXRoYSAo
U2l2YSBTYW5nZWV0aGEpIHdyb3RlOg0KPj4+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBH
ZW5lcmFsXQ0KPj4+DQo+Pj4gK3RlYW0NCj4+Pg0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPg0KPj4+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDMwLCAyMDIyIDE6MzQgQU0NCj4+
PiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4+PiBDYzogU0ssIFNpdmFT
YW5nZWV0aGEgKFNpdmEgU2FuZ2VldGhhKSA8U2l2YVNhbmdlZXRoYS5TS0BhbWQuY29tPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJx
dWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+OyBqZ3Jvc3NAc3VzZS5jb207IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tDQo+
Pj4gU3ViamVjdDogUmU6IFJlZy4gVGVlIGluaXQgZmFpbC4uLg0KPj4+DQo+Pj4gQWRkaW5n
IEp1ZXJnZW4gYW5kIEJvcmlzIGJlY2F1c2UgdGhpcyBpcyBhIExpbnV4L3g4NiBpc3N1ZS4N
Cj4+Pg0KPj4+DQo+Pj4gQXMgeW91IGNhbiBzZWUgZnJvbSB0aGlzIExpbnV4IGRyaXZlcjoN
Cj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZlbGl4aXIuYm9vdGxpbi5jb20lMkZsaW51eCUyRmxhdGVzdCUy
RnNvdXJjZSUyRmRyaXZlcnMlMkZjcnlwdG8lMkZjY3AlMkZ0ZWUtZGV2LmMlMjNMMTMyJmFt
cDtkYXRhPTA1JTdDMDElN0NTaXZhU2FuZ2VldGhhLlNLJTQwYW1kLmNvbSU3Q2U5NjJhOTA3
Nzk0ZjQ5MTdhODBiMDhkYTVhMGE3YjNiJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0
ZTE4M2QlN0MwJTdDMCU3QzYzNzkyMTI5ODMxNTgyODEwNCU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhh
V3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0YT1OeG1NVWNraURS
R0x2M3FMSnJoWktCdDJ6TlR1b21FWnFZSmRWNzR0WHhBJTNEJmFtcDtyZXNlcnZlZD0wDQo+
Pj4NCj4+PiBMaW51eCBhcyBkb20wIG9uIHg4NiBpcyB0cnlpbmcgdG8gY29tbXVuaWNhdGUg
d2l0aCBmaXJtd2FyZSAoVEVFKS4gTGludXggaXMgY2FsbGluZyBfX3BhIHRvIHBhc3MgYSBw
aHlzaWNhbCBhZGRyZXNzIHRvIGZpcm13YXJlLiBIb3dldmVyLCBfX3BhIHJldHVybnMgYSAi
ZmFrZSIgYWRkcmVzcyBub3QgYW4gbWZuLiBJIGltYWdpbmUgdGhhdCBhIHF1aWNrIHdvcmth
cm91bmQgd291bGQgYmUgdG8gY2FsbCAidmlydF90b19tYWNoaW5lIiBpbnN0ZWFkIG9mICJf
X3BhIiBpbiB0ZWUtZGV2LmMuDQo+Pj4NCj4+PiBOb3JtYWxseSwgaWYgdGhpcyB3YXMgYSBk
ZXZpY2UsIHRoZSAicmlnaHQgZml4IiB3b3VsZCBiZSB0byB1c2Ugc3dpb3RsYi14ZW46eGVu
X3N3aW90bGJfbWFwX3BhZ2UgdG8gZ2V0IGJhY2sgYSByZWFsIHBoeXNpY2FsIGFkZHJlc3Mu
DQo+Pj4NCj4+PiBIb3dldmVyLCB4ZW5fc3dpb3RsYl9tYXBfcGFnZSBpcyBtZWFudCB0byBi
ZSB1c2VkIGFzIHBhcnQgb2YgdGhlIGRtYV9vcHMgQVBJIGFuZCB0YWtlcyBhIHN0cnVjdCBk
ZXZpY2UgKmRldiBhcyBpbnB1dCBwYXJhbWV0ZXIuIE1heWJlIHhlbl9zd2lvdGxiX21hcF9w
YWdlIGNhbiBiZSB1c2VkIGZvciB0ZWUtZGV2IGFzIHdlbGw/DQo+Pj4NCj4+Pg0KPj4+IEJh
c2ljYWxseSB0ZWUtZGV2IHdvdWxkIG5lZWQgdG8gY2FsbCBkbWFfbWFwX3BhZ2UgYmVmb3Jl
IHBhc3NpbmcgYWRkcmVzc2VzIHRvIGZpcm13YXJlLCBhbmQgZG1hX3VubWFwX3BhZ2Ugd2hl
biBpdCBpcyBkb25lLiBFLmcuOg0KPj4+DQo+Pj4NCj4+PiAgICAgY21kX2J1ZmZlciA9IGRt
YV9tYXBfcGFnZShkZXYsIHZpcnRfdG9fcGFnZShjbWQpLA0KPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNtZCAmIH5QQUdFX01BU0ssDQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmluZ19zaXplLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIERNQV9UT19ERVZJQ0UpOw0KPj4+DQo+Pj4NCj4+PiBKdWVyZ2VuLCBCb3JpcywN
Cj4+PiB3aGF0IGRvIHlvdSB0aGluaz8NCj4+DQo+PiBZZXMsIEkgdGhpbmsgdXNpbmcgdGhl
IERNQSBpbnRlcmZhY2UgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGhhbmRsZSB0aGF0Lg0KPj4N
Cj4+IEJUVywgSSBkaWQgYSBzaW1pbGFyIGZpeCBmb3IgdGhlIGRjZGJhcyBkcml2ZXIgcmVj
ZW50bHk6DQo+Pg0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMDMxODE1MDk1
MC4xNjg0My0xLWpncm9zc0BzdXNlLmNvbQ0KPiANCj4gSSBoaXQgc2ltaWxhciBpc3N1ZSwg
YW5kIHRoZSBwYXRjaCBiZWxvdyBtYWRlIGl0IHdvcmsgZm9yIG1lICh1Z2x5DQo+IHdvcmth
cm91bmQpLCBvciBhdCBsZWFzdCBzdG9wIGNvbXBsYWluaW5nLg0KPiANCj4gQnV0IG5vdGUg
b25lIG9mIHRob3NlIHBsYWNlcyBoYXZlIHRoaXMgY29tbWVudDoNCj4gDQo+IAkvKiBXZSBu
ZWVkIGFjdHVhbCBwaHlzaWNhbCBhZGRyZXNzIGluc3RlYWQgb2YgRE1BIGFkZHJlc3MsIHNp
bmNlDQo+IAkgKiBUcnVzdGVkIE9TIHJ1bm5pbmcgb24gQU1EIFNlY3VyZSBQcm9jZXNzb3Ig
d2lsbCBtYXAgdGhpcyByZWdpb24NCj4gCSAqLw0KPiANCj4gSSBndWVzcyBpdCBtZWFucyBB
TUQgU2VjdXJlIFByb2Nlc3NvciBieXBhc3NlcyBJT01NVS4uLg0KDQpJdCBzZWVtcyBub3Qg
dG8gYmUgYXR0YWNoZWQgdmlhIGFuIElPTU1VLCBzYW1lIGFzIGZvciB0aGUgRENEQkFTIGZp
eCwNCndoZXJlIHRoZSBhZGRyZXNzIGlzIHVzZWQgaW4gU01NIGhhbmRsZXIgcnVubmluZyBv
biB0aGUgbWFpbiBwcm9jZXNzb3IuDQoNCkl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byB1c2Ug
RE1BIG1hcHBpbmcgaW4geW91ciBjYXNlLCB0b28sIGFzIGxvbmcgYXMNCnRoZSByZWxhdGVk
IGRldmljZSBoYXMgdGhlIGNvcnJlY3QgRE1BIHNldHRpbmdzIG5vdCB1c2luZyBhbnkgSU9N
TVUNCnRyYW5zbGF0aW9ucy4NCg0KDQpKdWVyZ2VuDQo=
--------------rHe8xxYbkm2Z4cqfvU2PxKlH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------rHe8xxYbkm2Z4cqfvU2PxKlH--

--------------jIKTS0XSEgSD69M9L2V9hZIE--

--------------tnHr9OQoOKo2g0TtkaKgfTTc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL0sOgFAwAAAAAACgkQsN6d1ii/Ey8l
7Af/Yg4jv7yNwJKw4qOBLyaJdk3Hs3y+dMPn0UVOGjDMZ9/+E9Kguc7YyQfaN05I4BNTobOXSEdN
fIWuaGHO6onKJFc7RXFFjhXSakxXUSSuH99mp0Rh6l5GR+nDln6Eq/gQvLF3+hVlNiR7R9YTxzL1
aWjitXuEETU/JEFICMCBJ2LM8fg2s6GEVzc87v8gi52N1b9U5mDa/6EaAZkDzNgumdrrU5nlVKPt
A1gc6lbPfX5Ya7KwQHKmcNyzmqBpAGiuutXASURisLVU480YbPkHfIw6XOiVxH4u2LZXbD445moX
vPdomSk+QrZbPJc6VRsonF70eX+QA1LeJ1AHVZLVWA==
=mIAc
-----END PGP SIGNATURE-----

--------------tnHr9OQoOKo2g0TtkaKgfTTc--

