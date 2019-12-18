Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D01246EC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:33:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYTx-0007rR-5i; Wed, 18 Dec 2019 12:31:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aLVj=2I=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1ihYTv-0007rM-4R
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:31:11 +0000
X-Inumbo-ID: 4535d9e8-2192-11ea-9069-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4535d9e8-2192-11ea-9069-12813bfff9fa;
 Wed, 18 Dec 2019 12:31:10 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MtwQm-1hpqvm2hsS-00uINP; Wed, 18 Dec 2019 13:31:06 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-4-philmd@redhat.com>
 <a4745134-47dc-ab8a-6009-69fcc9dfbb02@redhat.com>
 <46339299-e45b-79a3-5b45-f62fb5c7b26f@vivier.eu>
 <b629cd94-95e9-d351-6e80-23594c2b6245@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <53a50728-bb9c-cc12-f8f9-772212c8bb24@vivier.eu>
Date: Wed, 18 Dec 2019 13:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b629cd94-95e9-d351-6e80-23594c2b6245@redhat.com>
Content-Language: fr
X-Provags-ID: V03:K1:+xoPBD6VXrG2Cqi+lBl0RClNe9MmdG8QUIVqR4EgQ6v/VbcbF1d
 PJbztJQco7m2uU5Snle66avjwjLV3LMJacWFhwoCEke0KkWeoGmS+9iEGtwagDEqMDXTzMT
 rGKqdcmyr7P7VdB0g3qzPTmVIVoinpkvVRXqtrzXS0Zob3V1hq3l4lb0zvnEM5BLOy57Vwa
 i0WNwZ5mnoeTsVfYPKU+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2UIROFX/rNI=:xYEWcLx1RE2ehPrwhvP4N/
 b6YdXCUz0AQ0H9u+r7Utd6deuNGNUWTxavR2ImB0iL4i72ju1vlgrfGIm0R02L2JLzf1qlYkU
 0YsKF5k0Yw24AeA8SAOBhdxfbI4e4gMOxFt0Yspptt7WXB2zjAxEQpaz/IW2m+FL0aGOoDZbq
 jPIOxh/1a1TFtEIgPgtE1qO3DqIyuZr91bHgMnQqbBU2pnI1T1GKnq0AnhvDHzP3obzGWgl2N
 DJHF33NT5KcxV0DBo7cMncUYtc8aOz1q2tJPndamGwWeu45lvfjY7ijzDUev31gGy1Meof+ul
 4OUfpM86ZPV0nmie4u1u8rq/gjECj7t1uu34vBuDARlGCuCP19MHlh818ZzEw57NR87ZObdAi
 VAws6KJsUvaGoy3Uh1I/78tKrS51AZcSS/e6aeYMaaZj+2EcRWvuC62j67QOcWMdvUCOOauCv
 KedX9OHGRGxV4Vi7D77i7tKBzugAfMZGBawX+JQgzCvk1p9SaBGZ49TUdf7vY3LyzOQIgLvNr
 k4DAv9Pw8Sn5aY86z0ySL4DK+9zX4WVaiz0Jy/rEj5FLxB2mH6+f41eNettkZ6dpNH84q91AQ
 SIegLF/JnjJmU3chmUbJV1xOz6/fWO/Pn39cU6CIbwO/4Vvs6+k3PLRhjhzK1tZBYceI2Y22S
 mqMWGdGsZRDW2Ep9+C6k5UO2ApRxHSBDgZezY9LHKEs3Wy0LMU1Nk5rhuEn1Lo1Eyw4Akc+H1
 KImTF47OPMYfX/Dzcb7OASrbQsHIZJ2rAERW/Kzrj41jTr8dAt7gNJpsbxXDFop3u9c1+Cs98
 OrcZC0T8QZI0nd1Xl7uIdtg7tFuAUznrxvqr0Q3S1WXwDb7FXT4mUhkV1JPbEPTucvsWMYQzM
 kHHv1ZYo+26jGcgs6TytfI+UjVM+VEKF04vfHhvs8=
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 3/6] hw/pci-host/i440fx: Use
 size_t to iterate over ARRAY_SIZE()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMTgvMTIvMjAxOSDDoCAxMzowMSwgUGFvbG8gQm9uemluaSBhIMOpY3JpdMKgOgo+IE9uIDE4
LzEyLzE5IDEyOjU3LCBMYXVyZW50IFZpdmllciB3cm90ZToKPj4gTGUgMDkvMTIvMjAxOSDDoCAx
MTowNSwgVGhvbWFzIEh1dGggYSDDqWNyaXTCoDoKPj4+IE9uIDA5LzEyLzIwMTkgMTAuNDksIFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pj4+IFdlIGRvbid0IGVuZm9yY2UgdGhlIC1X
c2lnbi1jb252ZXJzaW9uIENQUEZMQUcsIGJ1dCBpdCBkb2Vzbid0IGh1cnQKPj4+PiB0byBhdm9p
ZCB0aGlzIHdhcm5pbmc6Cj4+Pj4KPj4+PiAgIHdhcm5pbmc6IGltcGxpY2l0IGNvbnZlcnNpb24g
Y2hhbmdlcyBzaWduZWRuZXNzOiAnaW50JyB0byAnc2l6ZV90JyAoYWthICd1bnNpZ25lZCBsb25n
JykgWy1Xc2lnbi1jb252ZXJzaW9uXQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+Pj4+IC0tLQo+Pj4+ICBody9wY2kt
aG9zdC9pNDQwZnguYyB8IDUgKystLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9p
NDQwZnguYyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCj4+Pj4gaW5kZXggZmJkYzU2MzU5OS4uMGNj
ODBiMjc2ZCAxMDA2NDQKPj4+PiAtLS0gYS9ody9wY2ktaG9zdC9pNDQwZnguYwo+Pj4+ICsrKyBi
L2h3L3BjaS1ob3N0L2k0NDBmeC5jCj4+Pj4gQEAgLTQxOSwxMiArNDE5LDExIEBAIG91dDoKPj4+
PiAgc3RhdGljIHZvaWQgaWdkX3B0X2k0NDBmeF9yZWFsaXplKFBDSURldmljZSAqcGNpX2Rldiwg
RXJyb3IgKiplcnJwKQo+Pj4+ICB7Cj4+Pj4gICAgICB1aW50MzJfdCB2YWwgPSAwOwo+Pj4+IC0g
ICAgaW50IGksIG51bTsKPj4+PiArICAgIHNpemVfdCBpOwo+Pj4+ICAgICAgaW50IHBvcywgbGVu
Owo+Pj4+ICAgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7Cj4+Pj4gIAo+Pj4+IC0gICAgbnVt
ID0gQVJSQVlfU0laRShpZ2RfaG9zdF9icmlkZ2VfaW5mb3MpOwo+Pj4+IC0gICAgZm9yIChpID0g
MDsgaSA8IG51bTsgaSsrKSB7Cj4+Pj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShp
Z2RfaG9zdF9icmlkZ2VfaW5mb3MpOyBpKyspIHsKPj4+PiAgICAgICAgICBwb3MgPSBpZ2RfaG9z
dF9icmlkZ2VfaW5mb3NbaV0ub2Zmc2V0Owo+Pj4+ICAgICAgICAgIGxlbiA9IGlnZF9ob3N0X2Jy
aWRnZV9pbmZvc1tpXS5sZW47Cj4+Pj4gICAgICAgICAgaG9zdF9wY2lfY29uZmlnX3JlYWQocG9z
LCBsZW4sICZ2YWwsICZsb2NhbF9lcnIpOwo+Pj4+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFRob21h
cyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgo+Pj4KPj4+Cj4+Cj4+IEFwcGxpZWQgdG8gbXkgdHJp
dmlhbC1wYXRjaGVzIGJyYW5jaC4KPiAKPiBObyBuZWVkIHRvLCBJJ3ZlIGFscmVhZHkgcXVldWVk
IHRoZSB3aG9sZSBzZXJpZXMuCj4gCgpvaywgSSd2ZSByZW1vdmVkIHRoZW0gZnJvbSBteSBxdWV1
ZS4KClRoYW5rcywKTGF1cmVudAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
