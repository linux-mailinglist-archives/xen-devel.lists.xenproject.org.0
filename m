Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E085F0280
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 17:21:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS1Xa-0004Qt-V0; Tue, 05 Nov 2019 16:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS1XZ-0004Qo-3m
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 16:18:45 +0000
X-Inumbo-ID: ef8be29c-ffe7-11e9-9631-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef8be29c-ffe7-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 16:18:43 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mg6mG-1i0yBE2gX8-00hgHY; Tue, 05 Nov 2019 17:18:30 +0100
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <157296887817.27285.13935693519835086344@37313f22b938>
 <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
 <20191105160345.GB2781@work-vm>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <03e06992-c72c-c7ab-7553-5804dbdf5cf3@vivier.eu>
Date: Tue, 5 Nov 2019 17:18:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105160345.GB2781@work-vm>
Content-Language: fr
X-Provags-ID: V03:K1:lMkQVh7xGc8+nadLHkeSmGELI7w53PQxSSktQ/A2fIs0TqH97BW
 C5jPCbs4Nx/N+X7Q6B3pyKk38TJAuHbfJ/t56bWKWOoAaRHpsXH7CosWg9LXucx0vRginzN
 QXqGXI/HTwXzqfD+CHBZo3rtU3Z2Vh22MzsEsTPmzB5p7FG9WrHMWXuckXKDhdiif+ULo29
 6fb9Rqqpxd2I3ZaXZz7hQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fzF2xgGrYGs=:GC1jA5lcB+NpVBHnYlbJHH
 jKgbXv0SKUBFxDEFWtiNrhrRUCxLD5aEZETqv0BC75rxnfDTQPwkUXsOKabNMcTEZfwBzt8o2
 jcmlI/hRQKEQolDnhkbYkbN0IsTN6nk/zCHAwVtFe8VoevbRodGlYpXI584s/+1l0iSOQHkOv
 ZVsffxX4BE+ogPTL0wwTjlTLqtLogy2Nc2wZz7b14EETNC6jx6lMbvt7hk0+zhe7RXePTBBSt
 0lAk+NmQbJe5eE2Z6pzIba4NJWNw7ODRi8zPuOzkH0SqWkp3doth21YvIsGco0GtwzCL1hE+E
 peQ2Bk7sJkl755fAozJ7j+b+sojmYhzhVQmx1FrNsWbX6gz8Lnm1lzaJVggO7SGuvj/gai6EU
 CPYcGYhfHbmCIshk52epyz1R5gjPMLzxBo7mES0PMwYmfZPBwLsnN2of2ls/Iu76FldzAA8Tq
 tFaYuOsOR+zFchJxz4voYKGOw6SGUAVfJqn2MVnCwAuhkW4ADvTbsUh8flxyvi+7FwhTXYSmw
 gtSBtFvrpdvXyUyJUcdDMQ9vUxNjsaXNKZECQDZloQQg0uSNjp3HGrJjxMzRmQzo9rpxzu+kN
 lIbHP9rLrXEYUbN3eqV7TnKypbpNK0opj64+FLai5hFeA3t7ecY7crIKBqg+czRPjNZ7qoeNh
 D8A29xFyeSGjvs5rE1+vEYKLF0tbGbEyT/yt8mnnW2B9XGr41WUjThP9G/13wgytzYEyEFvGg
 j7CFcTA87A8YfLD8Q5EJ8WSUnFQz8NwP3l4Ij1+Azq7ue8CHwKEF8cR7xoi1govgAOlmjihjV
 KTciA8sFZH0aCOgZsEy95zzR6PiviYOKfqz0BdcoEofoO/xoFK+I+B+0SiWT2XPIySi0o7RaZ
 v34ZKtb5XB81unlS1jxprBBbizZH8CfXxy/jwOGP0=
Subject: Re: [Xen-devel] [PULL 0/4] Trivial branch patches
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, berrange@redhat.com,
 ehabkost@redhat.com, paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, qemu-devel@nongnu.org, chouteau@adacore.com,
 Greg Kurz <groug@kaod.org>, marcandre.lureau@redhat.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, crosa@redhat.com, anthony.perard@citrix.com, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMDUvMTEvMjAxOSDDoCAxNzowMywgRHIuIERhdmlkIEFsYW4gR2lsYmVydCBhIMOpY3JpdMKg
Ogo+ICogTGF1cmVudCBWaXZpZXIgKGxhdXJlbnRAdml2aWVyLmV1KSB3cm90ZToKPj4gR3JlZywg
RGF2ZSwKPj4KPj4gY291bGQgeW91IGZpeCB0aGF0Pwo+Pgo+PiBUaGFua3MsCj4+IExhdXJlbnQK
Pj4KPj4gTGUgMDUvMTEvMjAxOSDDoCAxNjo0OCwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgYSDDqWNy
aXTCoDoKPj4+IFBhdGNoZXcgVVJMOiBodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAxOTExMDUx
NDQyNDcuMTAzMDEtMS1sYXVyZW50QHZpdmllci5ldS8KPj4+Cj4+Pgo+Pj4KPj4+IEhpLAo+Pj4K
Pj4+IFRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMu
IFNlZSBvdXRwdXQgYmVsb3cgZm9yCj4+PiBtb3JlIGluZm9ybWF0aW9uOgo+Pj4KPj4+IFN1Ympl
Y3Q6IFtQVUxMIDAvNF0gVHJpdmlhbCBicmFuY2ggcGF0Y2hlcwo+Pj4gVHlwZTogc2VyaWVzCj4+
PiBNZXNzYWdlLWlkOiAyMDE5MTEwNTE0NDI0Ny4xMDMwMS0xLWxhdXJlbnRAdml2aWVyLmV1Cj4+
Pgo+Pj4gPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQo+Pj4gIyEvYmluL2Jhc2gKPj4+IGdpdCBy
ZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKPj4+IGdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZWxpbWl0IDAKPj4+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQo+Pj4gZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQo+Pj4g
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPj4+ID09PSBURVNUIFND
UklQVCBFTkQgPT09Cj4+Pgo+Pj4gU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo+Pj4g
ODVhYzQ1MyBnbG9iYWw6IFNxdWFzaCAndGhlIHRoZScKPj4+IDlkZDdkYTQgcW9tOiBGaXggZXJy
b3IgbWVzc2FnZSBpbiBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkKPj4+IDJiNzZiNDUgaHcv
bWlzYy9ncmxpYl9haGJfYXBiX3BucDogRml4IDgtYml0IGFjY2Vzc2VzCj4+PiBiZGRjZmQ5IGh3
L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdoZW4gd3JpdGluZyB0byBQblAg
cmVnaXN0ZXJzCj4+Pgo+Pj4gPT09IE9VVFBVVCBCRUdJTiA9PT0KPj4+IDEvNCBDaGVja2luZyBj
b21taXQgYmRkY2ZkOWI2YjI0IChody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFz
aCB3aGVuIHdyaXRpbmcgdG8gUG5QIHJlZ2lzdGVycykKPj4+IDIvNCBDaGVja2luZyBjb21taXQg
MmI3NmI0NTFmOWI3IChody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXggOC1iaXQgYWNjZXNz
ZXMpCj4+PiAzLzQgQ2hlY2tpbmcgY29tbWl0IDlkZDdkYTQyMWJmYiAocW9tOiBGaXggZXJyb3Ig
bWVzc2FnZSBpbiBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkpCj4+PiBXQVJOSU5HOiBsaW5l
IG92ZXIgODAgY2hhcmFjdGVycwo+Pj4gIzMxOiBGSUxFOiBxb20vb2JqZWN0LmM6MTEwOToKPj4+
ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgImF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBwcm9w
ZXJ0eSAnJXMnIHRvIG9iamVjdCAodHlwZSAnJXMnKSIsCj4+Pgo+Pj4gV0FSTklORzogbGluZSBv
dmVyIDgwIGNoYXJhY3RlcnMKPj4+ICM0MzogRklMRTogcW9tL29iamVjdC5jOjExNDE6Cj4+PiAr
ICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJhdHRlbXB0IHRvIGFkZCBkdXBsaWNhdGUgcHJvcGVy
dHkgJyVzJyB0byBjbGFzcyAodHlwZSAnJXMnKSIsCj4+Pgo+Pj4gdG90YWw6IDAgZXJyb3JzLCAy
IHdhcm5pbmdzLCAyMiBsaW5lcyBjaGVja2VkCj4+Pgo+Pj4gUGF0Y2ggMy80IGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKPj4+IGFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQo+Pj4gQ0hF
Q0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPj4+IDQvNCBDaGVja2luZyBjb21taXQgODVhYzQ1M2Qx
NTIwIChnbG9iYWw6IFNxdWFzaCAndGhlIHRoZScpCj4+PiBFUlJPUjogZG8gbm90IHVzZSBDOTkg
Ly8gY29tbWVudHMKPj4+ICMyNjogRklMRTogZGlzYXMvbGlidml4bC92aXhsL2ludmFsc2V0Lmg6
MTA1Ogo+Pj4gKyAgLy8gTm90ZSB0aGF0IHRoaXMgZG9lcyBub3QgbWVhbiB0aGUgYmFja2luZyBz
dG9yYWdlIGlzIGVtcHR5OiBpdCBjYW4gc3RpbGwKPiAKPiBUaGF0IG9uZSBpcyBhIGZhbHNlIHBv
c2l0aXZlOyBsaWJ2aXhsIGlzIHdyaXR0ZW4gaW4gQysrICEKCk9LLCB0aGFuayB5b3UuCgpMYXVy
ZW50CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
