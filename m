Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7F6AB7DF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506735.779868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5nD-0000bD-Fe; Mon, 06 Mar 2023 08:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506735.779868; Mon, 06 Mar 2023 08:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5nD-0000YN-Cj; Mon, 06 Mar 2023 08:01:59 +0000
Received: by outflank-mailman (input) for mailman id 506735;
 Mon, 06 Mar 2023 08:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5nC-0008Tb-1O
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:01:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29cc29f0-bbf5-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 09:01:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B5CB61FDAE;
 Mon,  6 Mar 2023 08:01:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 400A313A66;
 Mon,  6 Mar 2023 08:01:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VxcoDvOdBWQeOAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 08:01:55 +0000
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
X-Inumbo-ID: 29cc29f0-bbf5-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678089715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYIv9v2rzxnDllNLdDDZhG3DvkurNa3CwLoXMNLu1N8=;
	b=dbCRFDRODXxGGO8zEMaG0nfcxyTOfl1nuMkkw9P7y/Ro7OpR0JimQJPqdhmDS1uwUl0AUI
	twXltov8JJyLAn+c0fXUtVWlEoiNNX/uA8ulNsCBlGc+IPLQZPqWgK91w0g3HcrU9Z5rHA
	JcJfvuBVcNgoJddd9QU2bsdUFH8GN3g=
Message-ID: <662c5584-d43c-8e2b-442d-48839f0ebf4c@suse.com>
Date: Mon, 6 Mar 2023 09:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Christian Lindig <christian.lindig@cloud.com>
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-2-jgross@suse.com>
 <40bb78bc-c406-f18d-f1a5-ce3a0a448a67@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <40bb78bc-c406-f18d-f1a5-ce3a0a448a67@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SjL1AhAMOlfcWqXLmEKbaZGn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SjL1AhAMOlfcWqXLmEKbaZGn
Content-Type: multipart/mixed; boundary="------------UUPD74gH0fsoj2gpVnHc0PML";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Christian Lindig <christian.lindig@cloud.com>
Message-ID: <662c5584-d43c-8e2b-442d-48839f0ebf4c@suse.com>
Subject: Re: [PATCH v3 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-2-jgross@suse.com>
 <40bb78bc-c406-f18d-f1a5-ce3a0a448a67@suse.com>
In-Reply-To: <40bb78bc-c406-f18d-f1a5-ce3a0a448a67@suse.com>

--------------UUPD74gH0fsoj2gpVnHc0PML
Content-Type: multipart/mixed; boundary="------------ayNFgutFUCpB1KBgp0WlWma2"

--------------ayNFgutFUCpB1KBgp0WlWma2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjMgMDg6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDIz
IDA4OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gYmV0dGVyIHJl
ZmxlY3QgdGhlIGNvbnRlbnRzIG9mIHRoZSBoZWFkZXIgYW5kIHRvIG1ha2UgaXQNCj4+IG1v
cmUgYXBwcm9wcmlhdGUgdG8gdXNlIGl0IGZvciBkaWZmZXJlbnQgcnVudGltZSBlbnZpcm9u
bWVudHMgbGlrZQ0KPj4gcHJvZ3JhbXMsIGxpYnJhcmllcywgYW5kIGZpcm13YXJlLCByZW5h
bWUgdGhlIGxpYnMuaCBpbmNsdWRlIGZpbGUgdG8NCj4+IGNvbW1vbi1tYWNyb3MuaC4gQWRk
aXRpb25hbGx5IGFkZCBhIGNvbW1lbnQgcG9pbnRpbmcgb3V0IHRoZSBuZWVkIHRvIGJlDQo+
PiBzZWxmLWNvbnRhaW5lZC4NCj4+DQo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiBBY2tlZC1ieTogTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiAjIHRvb2xz
L3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPiANCj4gSnVzdCBhcyBhIGdlbmVyYWwg
cmVtYXJrOiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gc3RyaXZlIHRvIGtlZXANCj4g
c3VjaCBzY29wZSByZXN0cmljdGlvbiBpZGVudGlmaWVycyBzaG9ydCBhcyBwb3NzaWJsZSB3
aXRob3V0IGJlY29taW5nDQo+IGFtYmlndW91cy4gV2l0aCB0aGlzIC4uLg0KPiANCj4+IC0t
LQ0KPj4gICB0b29scy9jb25zb2xlL2RhZW1vbi9pby5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvZnV6ei9jcHUtcG9saWN5L2FmbC1wb2xpY3ktZnV6
emVyLmMgICAgICAgICB8ICAyICstDQo+PiAgIC4uLi9pbmNsdWRlL3hlbi10b29scy97bGli
cy5oID0+IGNvbW1vbi1tYWNyb3MuaH0gfCAxNSArKysrKysrKysrKystLS0NCj4+ICAgdG9v
bHMvbGlicy9jYWxsL2J1ZmZlci5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
DQo+PiAgIHRvb2xzL2xpYnMvY3RybC94Y19wbS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQ0KPj4gICB0b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5oICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L2xp
bnV4LmMgICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIHRvb2xzL2xpYnMvZ250dGFi
L2ZyZWVic2QuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB0b29scy9s
aWJzL2dudHRhYi9saW51eC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+
ICAgdG9vbHMvbGlicy9ndWVzdC94Z19jb3JlX2FybS5jICAgICAgICAgICAgICAgICAgICB8
ICAyICstDQo+PiAgIHRvb2xzL2xpYnMvZ3Vlc3QveGdfY3B1aWRfeDg2LmMgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQ0KPj4gICB0b29scy9saWJzL2d1ZXN0L3hnX2RvbV9hcm0uYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvbGlicy9ndWVzdC94Z19k
b21fYnppbWFnZWxvYWRlci5jICAgICAgICAgICB8ICAyICstDQo+PiAgIHRvb2xzL2xpYnMv
Z3Vlc3QveGdfZG9tX3g4Ni5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB0
b29scy9saWJzL2d1ZXN0L3hnX3NyX2NvbW1vbi5jICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0NCj4+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oICAgICAgICAgICAg
ICAgICB8ICAyICstDQo+PiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfcHNyLmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB0b29scy9saWJzL3N0YXQveGVuc3RhdF9s
aW51eC5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvbWlzYy94ZW4t
YWNjZXNzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIHRvb2xz
L21pc2MveGVuLWNwdWlkLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0K
Pj4gICB0b29scy9taXNjL3hlbi1kaWFnLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0NCj4+ICAgdG9vbHMvbWlzYy94ZW4taHB0b29sLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstDQo+PiAgIHRvb2xzL21pc2MveGVuLWxpdmVwYXRjaC5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB0b29scy9taXNjL3hlbi1tZm5k
dW1wLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvbWlz
Yy94ZW5wbS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAg
IHRvb2xzL29jYW1sL2xpYnMvbW1hcC94ZW5tbWFwX3N0dWJzLmMgICAgICAgICAgICAgfCAg
MiArLQ0KPj4gICB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgICAgICAg
ICAgICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5j
ICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kv
dGVzdC1jcHUtcG9saWN5LmMgICAgICAgICAgfCAgMiArLQ0KPj4gICB0b29scy90ZXN0cy9w
YWdpbmctbWVtcG9vbC90ZXN0LXBhZ2luZy1tZW1wb29sLmMgIHwgIDIgKy0NCj4+ICAgdG9v
bHMvdGVzdHMvcmVzb3VyY2UvdGVzdC1yZXNvdXJjZS5jICAgICAgICAgICAgICB8ICAyICst
DQo+PiAgIHRvb2xzL3Rlc3RzL3RzeC90ZXN0LXRzeC5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQ0KPj4gICB0b29scy90ZXN0cy92aHBldC9lbXVsLmggICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4
Ni1lbXVsYXRlLmggICAgICAgICAgICB8ICAyICstDQo+PiAgIHRvb2xzL3Rlc3RzL3hlbnN0
b3JlL3Rlc3QteGVuc3RvcmUuYyAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB0b29scy94
ZW5zdG9yZS91dGlscy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+
ICAgdG9vbHMveGVudHJhY2UvYW5hbHl6ZS5oICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstDQo+PiAgIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQ0KPj4gICB4ZW4vbGliL3g4Ni9wcml2YXRlLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgMzkgZmlsZXMgY2hhbmdlZCwgNTAg
aW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pDQo+PiAgIHJlbmFtZSB0b29scy9pbmNs
dWRlL3hlbi10b29scy97bGlicy5oID0+IGNvbW1vbi1tYWNyb3MuaH0gKDgyJSkNCj4gDQo+
IC4uLiBkaWZmc3RhdCwgdG9vbHMvcHl0aG9uLyB3b3VsZCBiZSBzdWZmaWNpZW50IGhlcmUg
aW1vLiAoQXMgbm90ZWQNCj4gZWFybGllciwgSSBjb25zaWRlciB0aGUgbWFya2VyIHVubmVj
ZXNzYXJ5IGhlcmUsIGp1c3QgbGlrZQ0KPiBDaHJpc3RpYW4ncyBpc24ndCBzY29wZSByZXN0
cmljdGVkIHRvIHRvb2xzL29jYW1sLy4gV2hpbGUgSSBhY2NlcHQNCj4gdGhhdCB2aWV3cyBt
YXkgZGlmZmVyIGhlcmUsIEkgdGhpbmsgaXQgd291bGQgYmUgaGVscGZ1bCBpZiB3aXRoaW4g
YQ0KPiBwYXRjaCBvcHRpb25hbCBzY29wZSByZXN0cmljdGlvbnMgd2VyZSBhbGwgcHJlc2Vu
dCBvciBhbGwgYWJzZW50Ow0KPiBvbmVzIHRydWx5IHJlc3RyaWN0aW5nIHNjb3BlIGFyZSBk
aWZmZXJlbnQgb2YgY291cnNlLikNCg0KSG1tLCByaWdodC4gSW4gY2FzZSBJIG5lZWQgdG8g
cmVzZW5kIEknbGwgZHJvcCB0aGUgcmVzdHJpY3Rpb24uDQoNCg0KSnVlcmdlbg0K
--------------ayNFgutFUCpB1KBgp0WlWma2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ayNFgutFUCpB1KBgp0WlWma2--

--------------UUPD74gH0fsoj2gpVnHc0PML--

--------------SjL1AhAMOlfcWqXLmEKbaZGn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQFnfIFAwAAAAAACgkQsN6d1ii/Ey9D
3Af/WxTkQibAQdwUR+f0wxoWFc2tLJ6C3coWMA6chwrMJbsxmkpCePscr6D0DPCCi4QEP/VI734N
0AbDctyqUNWV6ImIGF61+vzYyxKXQbingidl8eKKoHiTEeXQwYGr8RiA5s9zTxGGZgtf5mQGnxIa
9iRWU2rBd0MtiZm5BC0UAM5LkF8tvI1bJ0b9RQEgWrYozWzDUv+FPXm8AkKRmrCdp9CsYN2WuWNQ
lb5ueIY9ujSRAeu6gZbhTjRAvc8Bi3iPepcF7l8HMn0IilmaldqzoWDOT2yueD5ZxsosoLdeQRZQ
02AIH9FEv/oyaohqZdwj5D3vluQ2vLsGWLl6k5Zfjg==
=sIfp
-----END PGP SIGNATURE-----

--------------SjL1AhAMOlfcWqXLmEKbaZGn--

