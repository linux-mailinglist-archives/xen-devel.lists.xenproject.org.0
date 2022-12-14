Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3964CD0C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 16:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462358.720535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Tge-0004Gd-KX; Wed, 14 Dec 2022 15:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462358.720535; Wed, 14 Dec 2022 15:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Tge-0004Cy-HO; Wed, 14 Dec 2022 15:28:48 +0000
Received: by outflank-mailman (input) for mailman id 462358;
 Wed, 14 Dec 2022 15:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5Tgd-0004Cs-Ao
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 15:28:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff68d799-7bc3-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 16:28:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0A9B21E5F;
 Wed, 14 Dec 2022 15:28:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A26731333E;
 Wed, 14 Dec 2022 15:28:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Nv9iJqzrmWOJSQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 15:28:44 +0000
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
X-Inumbo-ID: ff68d799-7bc3-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671031724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EvhfgL5DHeKPFJqizBygrm/mxuiC1yOz8RGaBFd+sMg=;
	b=XxXPznrlxJoQ5ST5gsP0gO9cJro9CIwabCCTeqqWlamKA3oBuuVbypOeJxD3VsH3Ngt/Fw
	GE4+A2Zo9+Rr3SiMYYR+p6ybSGGKTRM1BqKL+ddHQzH3090S894RY2RBmjJoRCrL2BBKgn
	kMj/kUtYattRjXXhe4VElgkcn8bpkIs=
Message-ID: <97149e94-0c3e-52fc-2da9-cacb9fdde9c2@suse.com>
Date: Wed, 14 Dec 2022 16:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
 <20221207002138.qulrlav3z3heozk4@vireshk-i7>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Virtio-disk updates for latest Xen ?
In-Reply-To: <20221207002138.qulrlav3z3heozk4@vireshk-i7>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G04LyaDo7F0D0dqTHHjFD2k0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G04LyaDo7F0D0dqTHHjFD2k0
Content-Type: multipart/mixed; boundary="------------a3EuGedoNt8k700eH21q4gx0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org
Message-ID: <97149e94-0c3e-52fc-2da9-cacb9fdde9c2@suse.com>
Subject: Re: Virtio-disk updates for latest Xen ?
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
 <20221207002138.qulrlav3z3heozk4@vireshk-i7>
In-Reply-To: <20221207002138.qulrlav3z3heozk4@vireshk-i7>

--------------a3EuGedoNt8k700eH21q4gx0
Content-Type: multipart/mixed; boundary="------------cvA6tuk8N9jXg5F4V0S1h08L"

--------------cvA6tuk8N9jXg5F4V0S1h08L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTIuMjIgMDE6MjEsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gK2xpc3QNCj4gDQo+
IE9uIDA2LTEyLTIyLCAxMzo0MCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+PiBP
biBUdWUsIERlYyA2LCAyMDIyIGF0IDE6MTUgUE0gVmlyZXNoIEt1bWFyIDx2aXJlc2gua3Vt
YXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gSGkgT2xla3NhbmRyLA0KPj4gSGVsbG8gVmly
ZXNoDQo+Pj4NCj4+PiBJIGZvdW5kIHRoYXQgbXkgcnVzdCBjb3VudGVycGFydCBbMV0gb2Yg
dmlydGlvLWRpc2sgcmVwb3NpdG9yeSBicm9rZQ0KPj4+IHdpdGggdGhpcyBjb21taXQ6DQo+
Pj4NCj4+PiBjb21taXQgM2E5NjAxM2EzZTE3ICgidG9vbHMveGVuc3RvcmU6IHJlZHVjZSBu
dW1iZXIgb2Ygd2F0Y2ggZXZlbnRzIikNCj4+Pg0KPj4+IEFuZCBzbyB3YXMgd29uZGVyaW5n
IGlmIHlvdSBoYXZlIGFscmVhZHkgZml4ZWQgdGhhdCBmb3INCj4+PiB2aXJ0aW8tZGlzayBv
ciBub3QuIEFuZCBJIGNhbiBqdXN0IGNvcHkgd2hhdCB5b3UgaGF2ZSBjaGFuZ2VkIDopDQo+
Pj4NCj4+DQo+PiBJbnRlcmVzdGluZywgSSBhbSBub3QgYXdhcmUgb2YgdGhhdCBpc3N1ZS4g
SSBoYXZlbid0IHRyaWVkIHZpcnRpby1kaXNrIHdpdGgNCj4+IHJlY2VudCAobGF0ZXN0KSBY
ZW4sIEkgd2FzIG1vc3RseSBwbGF5aW5nIHdpdGggUWVtdSBiYWNrZW5kcy4gVGhhbmtzIGZv
cg0KPj4gbGV0dGluZyBtZSBrbm93LCBJIHdpbGwgcmUtY2hlY2sgb25jZSBJIGhhdmUgYWNj
ZXNzIHRvIG15IGhhcmR3YXJlIGFnYWluLg0KPiANCj4gSG1tLCBtb3ZlZCBhIGxpdHRsZSBj
bG9zZXIgOikNCj4gDQo+IFdlIGxvb2sgYXQgdGhlIHdhdGNoIGV2ZW50cyBoZXJlIFsyXSBv
bmUgYnkgb25lIGFuZCB3YWl0IGZvciB0aGUNCj4gZGlyZWN0b3J5IG9uZSB0byBjb21lICgi
YmFja2VuZC9kaXNrIiBpbiB5b3VyIGNhc2UgSSB0aGluaywgaXQgaXMNCj4gImJhY2tlbmQv
dmlydGlvIiB3aXRoIG15IGxhdGVzdCBwYXRjaGVzKS4gVGhpcyBpcyB0aGUgc2Vjb25kIGRp
cmVjdG9yeQ0KPiBldmVudCB3aGljaCB1c2VkIHRvIGNvbWUgYWZ0ZXIgdGhlIGRpcmVjdG9y
eSBpcyBmaW5hbGl6ZWQuDQo+IA0KPiBFYXJsaWVyIHRoZSBldmVudHMgd2VyZSByZWFkIGZv
ciBmb2xsb3dpbmcgcGF0aHM6DQo+IA0KPiAiYmFja2VuZC92aXJ0aW8iDQo+ICJiYWNrZW5k
L3ZpcnRpby8xLzAiDQo+ICJiYWNrZW5kL3ZpcnRpby8xIg0KPiAiYmFja2VuZC92aXJ0aW8i
DQo+IA0KPiBhbmQgb24gdGhlIGxhc3QgZXZlbnQsIHdlIHVzZWQgdG8gZ28gYWhlYWQgYW5k
IGxvb2sgYXQgdGhlIGRpcmVjdG9yeQ0KPiB0byBmaW5kIHRoZSBGRSBkb21pZC4NCj4gDQo+
IFdpdGggdGhlIG5ldyBjaGFuZ2VzLCB0aGUgZXZlbnRzIEkgYW0gZ2V0dGluZyBhcmU6DQo+
IA0KPiBbc3JjL3hzLnJzOjE2NF0gJm5hbWUgPSAiYmFja2VuZC92aXJ0aW8iDQo+IFtzcmMv
eHMucnM6MTY0XSAmbmFtZSA9ICJiYWNrZW5kL3ZpcnRpby8xLzAiDQo+IFtzcmMveHMucnM6
MTY0XSAmbmFtZSA9ICJiYWNrZW5kL3ZpcnRpby8xLzAvZnJvbnRlbmQiDQo+IFtzcmMveHMu
cnM6MTY0XSAmbmFtZSA9ICJiYWNrZW5kL3ZpcnRpby8xLzAvZnJvbnRlbmQtaWQiDQo+IFtz
cmMveHMucnM6MTY0XSAmbmFtZSA9ICJiYWNrZW5kL3ZpcnRpby8xLzAvb25saW5lIg0KPiBb
c3JjL3hzLnJzOjE2NF0gJm5hbWUgPSAiYmFja2VuZC92aXJ0aW8vMS8wL3N0YXRlIg0KPiBb
c3JjL3hzLnJzOjE2NF0gJm5hbWUgPSAiYmFja2VuZC92aXJ0aW8vMS8wL2lycSINCj4gW3Ny
Yy94cy5yczoxNjRdICZuYW1lID0gImJhY2tlbmQvdmlydGlvLzEvMC9iYXNlIg0KPiBbc3Jj
L3hzLnJzOjE2NF0gJm5hbWUgPSAiYmFja2VuZC92aXJ0aW8vMS8wL3R5cGUiDQo+IFtzcmMv
eHMucnM6MTY0XSAmbmFtZSA9ICJiYWNrZW5kL3ZpcnRpby8xLzAvdHJhbnNwb3J0Ig0KPiAN
Cj4gSGVyZSB0aGUgc2Vjb25kIGV2ZW50IGZvciAiYmFja2VuZC92aXJ0aW8iIG5ldmVyIGNv
bWVzIGFuZCBzbyB3ZSBmYWlsLg0KDQpZZXMsIHRoaXMgaXMgYnkgZGVzaWduLg0KDQpOb3Rl
IHRoYXQgYWxsIFhlbnN0b3JlIGVudHJpZXMgZm9yIGEgZGV2aWNlIGFyZSB3cml0dGVuIHZp
YSBhIHRyYW5zYWN0aW9uLA0Kc28gdGhlcmUgc2hvdWxkIGJlIG5vIHdheSB5b3UgY2FuIHNl
ZSBhbnkgb2YgdGhlIGJhY2tlbmQgbm9kZXMgbWlzc2luZyB3aGVuDQpyZWNlaXZpbmcgYSB3
YXRjaCBmb3IgImJhY2tlbmQvdmlydGlvLzEvMCIgZHVlIHRvIGNyZWF0aW9uIG9mIHRoZSBk
ZXZpY2UuDQoNCkluIGZ1dHVyZSB3ZSBhcmUgZXZlbiBwbGFubmluZyB0byBzdXBwb3J0IHNl
dHRpbmcgdXAgWGVuc3RvcmUgd2F0Y2hlcyBmb3INCmEgbGltaXRlZCBwYXRoIGRlcHRoLCBy
ZXN1bHRpbmcgaW4gb25seSB0aGUgImJhY2tlbmQvdmlydGlvIiwgImJhY2tlbmQvdmlydGlv
LzEiDQphbmQgImJhY2tlbmQvdmlydGlvLzEvMCIgd2F0Y2ggZXZlbnRzIGJlaW5nIHNlbnQg
KHRoaXMgZXhhbXBsZSBpcyBmb3IgdGhlDQprZXJuZWwsIHdoaWNoIHdpbGwgdXNlIHRoZSBs
YXN0IGV2ZW50IHRvIGV4dHJhY3QgYWxsIHRoZSBuZWVkZWQgaW5mb3JtYXRpb24NCmZyb20g
dGhlIHJlcG9ydGVkIHBhdGgpLg0KDQoNCkp1ZXJnZW4NCg==
--------------cvA6tuk8N9jXg5F4V0S1h08L
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cvA6tuk8N9jXg5F4V0S1h08L--

--------------a3EuGedoNt8k700eH21q4gx0--

--------------G04LyaDo7F0D0dqTHHjFD2k0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZ66wFAwAAAAAACgkQsN6d1ii/Ey/q
KAf+NsBaY9x0dm1iH475DULej6h3yNMzbA+UKgboiYrnpUqOJY3VjEZqzc8Bk+jJ/pUSl6MrewRO
wd0Rz8TcXew7QwQ196GKNUoqZKUcU1hyK2Tlaa5SYwWo0631i/c9tgpABZszK0+fvnm0TjGJXeBv
XiayTFDfFn/h4WPYgKajTVokasmVyk9GsW9pB5Gp6p+ps5/WTKo8j5vieplnS9JMvEf1Tb210C71
+6ioA/JZ1ehUqE5Um3oBFmb4fdm861KAQWkWLkZ+RxN3ISt12veMFb0BMNGge/1pHRp/BQkPA4Nb
yl4u6E+O4n1eDbhZuabQJR/C5G15X+iOtKq12ZfGyw==
=F5dH
-----END PGP SIGNATURE-----

--------------G04LyaDo7F0D0dqTHHjFD2k0--

