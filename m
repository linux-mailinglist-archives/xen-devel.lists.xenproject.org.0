Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A64DBED6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 06:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291370.494474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUj8U-0006gY-DC; Thu, 17 Mar 2022 05:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291370.494474; Thu, 17 Mar 2022 05:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUj8U-0006eY-9O; Thu, 17 Mar 2022 05:57:22 +0000
Received: by outflank-mailman (input) for mailman id 291370;
 Thu, 17 Mar 2022 05:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUj8S-0006eS-GS
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 05:57:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1af76e5f-a5b7-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 06:57:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7ADB21108;
 Thu, 17 Mar 2022 05:57:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7101913ACB;
 Thu, 17 Mar 2022 05:57:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tm16Gb7NMmISRQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Mar 2022 05:57:18 +0000
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
X-Inumbo-ID: 1af76e5f-a5b7-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647496638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VizSblfrjmFLn02MdaRQgXPBqZBpwRj89jy2v8VdHGM=;
	b=DdzduMDoqdk+TSYQTQDfV9r6tFQ/+nk/HxZrXWAGIz321cYGJT510LtrExYfS1ZUhd5T+w
	vERZb2X0MiKw4+rgHs79NmKyMv/PL/bjQSFEbwpJirY7542u5A+ibrs9QoYS1WA/64+5qY
	F6PLbfF03itOqAQCRkCGU3FGnSOZ81k=
Message-ID: <772301b5-f398-7b90-d8a2-9838a13077b1@suse.com>
Date: Thu, 17 Mar 2022 06:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] tools/xenstore: add documentation for extended watch
 command
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-4-jgross@suse.com>
 <6D6D470C-C6A6-440D-B70D-C9737853D050@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6D6D470C-C6A6-440D-B70D-C9737853D050@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a5PMFBS0XtKkS5NKQK1tmFDE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a5PMFBS0XtKkS5NKQK1tmFDE
Content-Type: multipart/mixed; boundary="------------5v3cmZA2rUNkMIr6f2RYwb0S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <772301b5-f398-7b90-d8a2-9838a13077b1@suse.com>
Subject: Re: [PATCH 3/3] tools/xenstore: add documentation for extended watch
 command
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-4-jgross@suse.com>
 <6D6D470C-C6A6-440D-B70D-C9737853D050@arm.com>
In-Reply-To: <6D6D470C-C6A6-440D-B70D-C9737853D050@arm.com>

--------------5v3cmZA2rUNkMIr6f2RYwb0S
Content-Type: multipart/mixed; boundary="------------0ckPro94yWcvpa55C02uTjoS"

--------------0ckPro94yWcvpa55C02uTjoS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjIgMTk6MTYsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDE2IE1hciAyMDIyLCBhdCAxNjoxMCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgYW4gZXh0ZW5zaW9uIG9m
IHRoZSBXQVRDSCBjb21tYW5kIHVzZWQgdG8gbGltaXQNCj4+IHRoZSBzY29wZSBvZiB3YXRj
aGVkIHBhdGhzLiBBZGRpdGlvbmFsbHkgaXQgZW5hYmxlcyB0byByZWNlaXZlIG1vcmUNCj4+
IGluZm9ybWF0aW9uIGluIHRoZSBldmVudHMgcmVsYXRlZCB0byBzcGVjaWFsIHdhdGNoZXMg
KEBpbnRyb2R1Y2VEb21haW4NCj4+IG9yIEByZWxlYXNlRG9tYWluKS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+
IGRvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dCB8ICAxICsNCj4+IGRvY3MvbWlzYy94ZW5z
dG9yZS50eHQgICAgICB8IDE2ICsrKysrKysrKysrKystLS0NCj4+IDIgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0IGIvZG9jcy9taXNjL3hlbnN0b3JlLXJp
bmcudHh0DQo+PiBpbmRleCAwY2I3MmEzZTM1Li5lYWE2ZDBhMWEzIDEwMDY0NA0KPj4gLS0t
IGEvZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0DQo+PiArKysgYi9kb2NzL21pc2MveGVu
c3RvcmUtcmluZy50eHQNCj4+IEBAIC03MCw2ICs3MCw3IEBAIE1hc2sgICAgRGVzY3JpcHRp
b24NCj4+IDIgICAgICAgQ29ubmVjdGlvbiBlcnJvciBpbmRpY2F0b3IgKHNlZSBjb25uZWN0
aW9uIGVycm9yIGZlYXR1cmUgYmVsb3cpDQo+PiA0ICAgICAgIEdFVF9GRUFUVVJFIGFuZCBT
RVRfRkVBVFVSRSBYZW5zdG9yZSB3aXJlIGNvbW1hbmRzIGFyZSBhdmFpbGFibGUNCj4+IDgg
ICAgICAgR0VUX1FVT1RBIGFuZCBTRVRfUVVPVEEgWGVuc3RvcmUgd2lyZSBjb21tYW5kcyBh
cmUgYXZhaWxhYmxlDQo+PiArMTYgICAgICBXQVRDSCBjYW4gdGFrZSBhIHRoaXJkIHBhcmFt
ZXRlciBsaW1pdGluZyBpdHMgc2NvcGUNCj4+DQo+PiBUaGUgIkNvbm5lY3Rpb24gc3RhdGUi
IGZpZWxkIGlzIHVzZWQgdG8gcmVxdWVzdCBhIHJpbmcgY2xvc2UgYW5kIHJlY29ubmVjdC4N
Cj4+IFRoZSAiQ29ubmVjdGlvbiBzdGF0ZSIgZmllbGQgb25seSBjb250YWlucyB2YWxpZCBk
YXRhIGlmIHRoZSBzZXJ2ZXIgaGFzDQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0
b3JlLnR4dCBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+IGluZGV4IGRkNzVhODEzMjgu
LmY4NmM2ZDk3NTcgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+
PiArKysgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+PiBAQCAtMTg4LDcgKzE4OCw3IEBA
IFNFVF9QRVJNUwkJPHBhdGg+fDxwZXJtLWFzLXN0cmluZz58Kz8NCj4+DQo+PiAtLS0tLS0t
LS0tIFdhdGNoZXMgLS0tLS0tLS0tLQ0KPj4NCj4+IC1XQVRDSAkJCTx3cGF0aD58PHRva2Vu
Pnw/DQo+PiArV0FUQ0gJCQk8d3BhdGg+fDx0b2tlbj58WzxkZXB0aD58XT8NCj4+IAlBZGRz
IGEgd2F0Y2guDQo+Pg0KPj4gCVdoZW4gYSA8cGF0aD4gaXMgbW9kaWZpZWQgKGluY2x1ZGlu
ZyBwYXRoIGNyZWF0aW9uLCByZW1vdmFsLA0KPj4gQEAgLTE5OSw3ICsxOTksMTEgQEAgV0FU
Q0gJCQk8d3BhdGg+fDx0b2tlbj58Pw0KPj4gCW1hdGNoaW5nIHdhdGNoIHJlc3VsdHMgaW4g
YSBXQVRDSF9FVkVOVCBtZXNzYWdlIChzZWUgYmVsb3cpLg0KPj4NCj4+IAlUaGUgZXZlbnQn
cyBwYXRoIG1hdGNoZXMgdGhlIHdhdGNoJ3MgPHdwYXRoPiBpZiBpdCBpcyBhbiBjaGlsZA0K
Pj4gLQlvZiA8d3BhdGg+Lg0KPj4gKwlvZiA8d3BhdGg+LiBUaGlzIG1hdGNoIGNhbiBiZSBs
aW1pdGVkIGJ5IHNwZWNpZnlpbmcgPGRlcHRoPiAoYQ0KPj4gKwlkZWNpbWFsIHZhbHVlIG9m
IDAgb3IgbGFyZ2VyKTogaXQgZGVub3RlcyB0aGUgZGlyZWN0b3J5IGxldmVscw0KPj4gKwli
ZWxvdyA8d3BhdGg+IHRvIGNvbnNpZGVyIGZvciBhIG1hdGNoICgiMCIgd291bGQgbm90IG1h
dGNoIGZvcg0KPj4gKwlhIGNoaWxkIG9mIDx3cGF0aD4sICIxIiB3b3VsZCBtYXRjaCBvbmx5
IGZvciBhIGRpcmVjdCBjaGlsZCwNCj4+ICsJZXRjLikuDQo+Pg0KPj4gCTx3cGF0aD4gY2Fu
IGJlIGEgPHBhdGg+IHRvIHdhdGNoIG9yIEA8d3NwZWNpYWw+LiAgSW4gdGhlDQo+PiAJbGF0
dGVyIGNhc2UgPHdzcGVjaWFsPiBtYXkgaGF2ZSBhbnkgc3ludGF4IGJ1dCBpdCBtYXRjaGVz
DQo+PiBAQCAtMjEwLDcgKzIxNCwxMyBAQCBXQVRDSAkJCTx3cGF0aD58PHRva2VuPnw/DQo+
PiAJCQkJc2h1dGRvd24sIGFuZCBhbHNvIG9uIFJFTEVBU0UNCj4+IAkJCQlhbmQgZG9tYWlu
IGRlc3RydWN0aW9uDQo+PiAJPHdzcGVjaWFsPiBldmVudHMgYXJlIHNlbnQgdG8gcHJpdmls
ZWdlZCBjYWxsZXJzIG9yIGV4cGxpY2l0bHkNCj4+IC0JdmlhIFNFVF9QRVJNUyBlbmFibGVk
IGRvbWFpbnMgb25seS4NCj4+ICsJdmlhIFNFVF9QRVJNUyBlbmFibGVkIGRvbWFpbnMgb25s
eS4gVGhlIHNlbWFudGljcyBmb3IgYQ0KPj4gKwlzcGVjaWZpY2F0aW9uIG9mIDxkZXB0aD4g
ZGlmZmVyIGZvciBnZW5lcmF0aW5nIDx3c3BlY2lhbD4NCj4gDQo+IFR5cG86IHMvZGlmZmVy
L2RpZmZlcnMvPw0KDQpJIHRoaW5rICJzZW1hbnRpY3MiIGlzIGEgcGx1cmFsIHdvcmQsIGJ1
dCBJJ3ZlIGZvdW5kIHNvbWUgcmVmZXJlbmNlcw0KdGhhdCBpdCBpcyBvZnRlbiB1c2VkIHdp
dGggYSBzaW5ndWxhciB2ZXJiLiBJdCBzZWVtcyBib3RoIHZhcmlhbnRzIGFyZQ0KaW4gdXNl
Lg0KDQo+IEnigJltIG5vdCBhbiBFbmdsaXNoIG5hdGl2ZSBzcGVha2VyIHNvIGFwb2xvZ2ll
cyBpZiB0aGVyZSBpcyBubyBtaXN0YWtlLg0KDQpNZSBuZWl0aGVyLiBBbnkgYWR2aWNlIGZy
b20gYSBuYXRpdmUgRW5nbGlzaCBzcGVha2VyPw0KDQoNCkp1ZXJnZW4NCg==
--------------0ckPro94yWcvpa55C02uTjoS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0ckPro94yWcvpa55C02uTjoS--

--------------5v3cmZA2rUNkMIr6f2RYwb0S--

--------------a5PMFBS0XtKkS5NKQK1tmFDE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIyzb0FAwAAAAAACgkQsN6d1ii/Ey/R
pwf9GHOkmEbyGNJIAhnyhDivevJzLAM3balCa/kfiNJujCpqd5zgRlUGvzPQk0AIE0xEB4G5ZNkB
Hna3OHBWGDhlx+jEuZOh1+mEsdNhOoF76GsqXedBYDWId+zyV7sI8oX1TzrFi2brbo3PzDeVDEva
5Lchwug49/L+cMkvqJ1ojo+gibv7OH51do5O8ObcX8NFV+HI630tZu6/SU5WFPsaGhPX3KG4E6nC
55Wpd+yYyEFLjIpTGY8PVQZv9w5AYrGvHaj0LQeqbMrFWaXg8JraEWTt9QXEl0/fK04fQyL2PAIU
xBcVtiSf5r/tqgOVHP27vnOwG0GbBSDgz9O/w8LOaA==
=Co9X
-----END PGP SIGNATURE-----

--------------a5PMFBS0XtKkS5NKQK1tmFDE--

