Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D15611D2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 07:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358207.587278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6mmF-0007J2-0N; Thu, 30 Jun 2022 05:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358207.587278; Thu, 30 Jun 2022 05:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6mmE-0007H2-Tn; Thu, 30 Jun 2022 05:31:42 +0000
Received: by outflank-mailman (input) for mailman id 358207;
 Thu, 30 Jun 2022 05:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gQTH=XF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o6mmD-0007Gw-Hm
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 05:31:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaedd5f7-f835-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 07:31:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A91F821BE5;
 Thu, 30 Jun 2022 05:31:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BDBF13AB2;
 Thu, 30 Jun 2022 05:31:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zqzdFDs1vWKECgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Jun 2022 05:31:39 +0000
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
X-Inumbo-ID: eaedd5f7-f835-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656567099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ix2+59s8gFJZTK0LG6X0PrJ7Mwqo3WfIkEHQFE0T3MQ=;
	b=m0NNiCeHw9tKwUYI676C0aCpAeCw3JzW1mnFhjsVIDAndK8qd+ZfxXoc0DaJZRsm7u4Oma
	/jDD1ZgybZn1B9fEpTRV+yKCewzpZU6dFTQEhMKkYhkEmOWdaQp2obHiuxYQyfnYfT92dg
	Q+yaDZrkqORIY5gQMcZQKw7A3u1ceHM=
Message-ID: <60bf0e8a-1b58-4df4-fdcf-bcfeedd64e77@suse.com>
Date: Thu, 30 Jun 2022 07:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Reg. Tee init fail...
Content-Language: en-US
To: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
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
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zabseNiaGNi0VHpSQNVLpwLK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zabseNiaGNi0VHpSQNVLpwLK
Content-Type: multipart/mixed; boundary="------------7tnZdij7de3Bg8TOPOP4rBto";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Message-ID: <60bf0e8a-1b58-4df4-fdcf-bcfeedd64e77@suse.com>
Subject: Re: Reg. Tee init fail...
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
 <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>

--------------7tnZdij7de3Bg8TOPOP4rBto
Content-Type: multipart/mixed; boundary="------------ktqdLnGgMOFD2Tl6i6okk0GL"

--------------ktqdLnGgMOFD2Tl6i6okk0GL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDYuMjIgMDU6MzIsIFNLLCBTaXZhU2FuZ2VldGhhIChTaXZhIFNhbmdlZXRoYSkg
d3JvdGU6DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXQ0KPiANCj4gK3Rl
YW0NCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXks
IEp1bmUgMzAsIDIwMjIgMTozNCBBTQ0KPiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4NCj4gQ2M6IFNLLCBTaXZhU2FuZ2VldGhhIChTaXZhIFNhbmdlZXRoYSkgPFNpdmFT
YW5nZWV0aGEuU0tAYW1kLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQg
TWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgamdyb3NzQHN1c2UuY29tOyBib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbQ0KPiBTdWJqZWN0OiBSZTogUmVnLiBUZWUgaW5pdCBmYWls
Li4uDQo+IA0KPiBBZGRpbmcgSnVlcmdlbiBhbmQgQm9yaXMgYmVjYXVzZSB0aGlzIGlzIGEg
TGludXgveDg2IGlzc3VlLg0KPiANCj4gDQo+IEFzIHlvdSBjYW4gc2VlIGZyb20gdGhpcyBM
aW51eCBkcml2ZXI6DQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxpbnV4
JTJGbGF0ZXN0JTJGc291cmNlJTJGZHJpdmVycyUyRmNyeXB0byUyRmNjcCUyRnRlZS1kZXYu
YyUyM0wxMzImYW1wO2RhdGE9MDUlN0MwMSU3Q1NpdmFTYW5nZWV0aGEuU0slNDBhbWQuY29t
JTdDZTk2MmE5MDc3OTRmNDkxN2E4MGIwOGRhNWEwYTdiM2IlN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3OTIxMjk4MzE1ODI4MTA0JTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxD
SkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRh
PU54bU1VY2tpRFJHTHYzcUxKcmhaS0J0MnpOVHVvbUVacVlKZFY3NHRYeEElM0QmYW1wO3Jl
c2VydmVkPTANCj4gDQo+IExpbnV4IGFzIGRvbTAgb24geDg2IGlzIHRyeWluZyB0byBjb21t
dW5pY2F0ZSB3aXRoIGZpcm13YXJlIChURUUpLiBMaW51eCBpcyBjYWxsaW5nIF9fcGEgdG8g
cGFzcyBhIHBoeXNpY2FsIGFkZHJlc3MgdG8gZmlybXdhcmUuIEhvd2V2ZXIsIF9fcGEgcmV0
dXJucyBhICJmYWtlIiBhZGRyZXNzIG5vdCBhbiBtZm4uIEkgaW1hZ2luZSB0aGF0IGEgcXVp
Y2sgd29ya2Fyb3VuZCB3b3VsZCBiZSB0byBjYWxsICJ2aXJ0X3RvX21hY2hpbmUiIGluc3Rl
YWQgb2YgIl9fcGEiIGluIHRlZS1kZXYuYy4NCj4gDQo+IE5vcm1hbGx5LCBpZiB0aGlzIHdh
cyBhIGRldmljZSwgdGhlICJyaWdodCBmaXgiIHdvdWxkIGJlIHRvIHVzZSBzd2lvdGxiLXhl
bjp4ZW5fc3dpb3RsYl9tYXBfcGFnZSB0byBnZXQgYmFjayBhIHJlYWwgcGh5c2ljYWwgYWRk
cmVzcy4NCj4gDQo+IEhvd2V2ZXIsIHhlbl9zd2lvdGxiX21hcF9wYWdlIGlzIG1lYW50IHRv
IGJlIHVzZWQgYXMgcGFydCBvZiB0aGUgZG1hX29wcyBBUEkgYW5kIHRha2VzIGEgc3RydWN0
IGRldmljZSAqZGV2IGFzIGlucHV0IHBhcmFtZXRlci4gTWF5YmUgeGVuX3N3aW90bGJfbWFw
X3BhZ2UgY2FuIGJlIHVzZWQgZm9yIHRlZS1kZXYgYXMgd2VsbD8NCj4gDQo+IA0KPiBCYXNp
Y2FsbHkgdGVlLWRldiB3b3VsZCBuZWVkIHRvIGNhbGwgZG1hX21hcF9wYWdlIGJlZm9yZSBw
YXNzaW5nIGFkZHJlc3NlcyB0byBmaXJtd2FyZSwgYW5kIGRtYV91bm1hcF9wYWdlIHdoZW4g
aXQgaXMgZG9uZS4gRS5nLjoNCj4gDQo+IA0KPiAgICBjbWRfYnVmZmVyID0gZG1hX21hcF9w
YWdlKGRldiwgdmlydF90b19wYWdlKGNtZCksDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY21kICYgflBBR0VfTUFTSywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByaW5nX3NpemUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRE1BX1RPX0RF
VklDRSk7DQo+IA0KPiANCj4gSnVlcmdlbiwgQm9yaXMsDQo+IHdoYXQgZG8geW91IHRoaW5r
Pw0KDQpZZXMsIEkgdGhpbmsgdXNpbmcgdGhlIERNQSBpbnRlcmZhY2UgaXMgdGhlIGNvcnJl
Y3Qgd2F5IHRvIGhhbmRsZSB0aGF0Lg0KDQpCVFcsIEkgZGlkIGEgc2ltaWxhciBmaXggZm9y
IHRoZSBkY2RiYXMgZHJpdmVyIHJlY2VudGx5Og0KDQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjIwMzE4MTUwOTUwLjE2ODQzLTEtamdyb3NzQHN1c2UuY29tDQoNCg0KSnVlcmdl
bg0K
--------------ktqdLnGgMOFD2Tl6i6okk0GL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ktqdLnGgMOFD2Tl6i6okk0GL--

--------------7tnZdij7de3Bg8TOPOP4rBto--

--------------zabseNiaGNi0VHpSQNVLpwLK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK9NToFAwAAAAAACgkQsN6d1ii/Ey+l
7wgAmfZT7hc0WOdtSL7xUjwztPYLhFS9uBUK6ZA0sXbxbobLw4L5kkrro1XLulyAFGGjWsERLxoU
ugUaBn4GJWpNZo0RRV5sjVwbIdFNtuboe0j6TKYP7aOSmyxJgeTF1958rusl36bdX39/VLNoOzY4
V90ga/VJKqcHuaoOL8xoaQ7nBZ7Wt2O/7M/mEs3LcG9yEAVIeQVcWEqoLTf36N+QPSYAxvvrHSax
zYROokIDvftzXJHJqq7s22nG+WZtmFIPs0bZPBMNhNB+4kxDh+kUQFeFD251pbO5lgthfUd6NK6d
5tU2I0yRmjWsNbircU5m0jeKLKHPzJtm/ef6LJO7CQ==
=38U3
-----END PGP SIGNATURE-----

--------------zabseNiaGNi0VHpSQNVLpwLK--

