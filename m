Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6AF06AA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 21:09:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS55s-00081j-UQ; Tue, 05 Nov 2019 20:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS55r-00081e-VQ
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 20:06:23 +0000
X-Inumbo-ID: bcfccdc6-0007-11ea-984a-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcfccdc6-0007-11ea-984a-bc764e2007e4;
 Tue, 05 Nov 2019 20:06:23 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N17gy-1hmfXe20jK-012WjJ; Tue, 05 Nov 2019 21:06:08 +0100
To: qemu-devel@nongnu.org
References: <157298160814.27285.16893877491189017648@37313f22b938>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <73852c81-87b7-e5f5-4041-d24f078cc7fa@vivier.eu>
Date: Tue, 5 Nov 2019 21:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157298160814.27285.16893877491189017648@37313f22b938>
Content-Language: fr
X-Provags-ID: V03:K1:3p1JZ1CwkuZlQUVF2ZmymEw1T4zz/u7V1caPHmFar31XUmlLtq7
 YjwS9uav+xCsjx+b3Ng1gd+keqfgZjUdWCiF0RLTWp1e/VRAizyPnx7RvphliNf/uAkqYNA
 fZPU/z7w61dFGB1bBj0csFP+labC/5M34s8jVWkOwhnPW5b0NHtr8g4OElKdUe81YePqVwQ
 5agErePOn8xRNocGnSJcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U80NqDDOsac=:rsApD5Nc3vJdDoGd4n2gRu
 IAknK0VlapT0e4qa3/ahDgoSgX8UjtI95dzHiI8ybs1BvTNRBS5Qcj7R/nHegDTKIMPfxIdnF
 TmLH48GwxFzBf0C7nhXLkV9WRMgqW30u7VjMIWdCpVMDe4qcr6hWqdQFsOi6qH7SDBhu/EsfN
 sW2WwrMyVQs1yjeZ8MGq6LYggRv4+z0inruzdaMyRK3EbJUGgul6Yco0woTKgWl2WQuhnchwR
 4+OITfU5TM3DMU1Y9nXYw6a0s83bcEkDQz7rYC/bCWYkBl+1aetRrmJ1+LYNvYbeERjaEHocD
 PVkSAtCwdSpUdCPrWdI/pRAN9/P5+oTa13XR2XlxNtmh8+1ykq+s7ai6zE0O6FLc0EVXexzR2
 LCZ+hqYMGQCFuBz6Ut+NA1S3ya9J9VH0kTYzjRn4O99gBemK8h5FUhkEDmHcsBOdhRgpT5imQ
 EPTl7OT1A6ZTivIzntrSCumsF9EGkPD82Dym/dHCFQnVWzsEpT8Gz2doG/Syjl0RYJ2lxzDed
 ayxfTfR8X+lX2QiA8MjuXSH+bcuLrqSK8+x+pUp3feMVmOSdrSzl6feKixgrsl21kSwxHwZJe
 oN7Nr+KVpbqq5hQqGmRLbueNs/DYhW7Lp92ZKvOdgdRmX6m/ptA8H2tMyPsw2CDBDZGQkwWyE
 AoBiC5VNiBecaw/jYd9XD4JxC3l63nlPpOpqmZ6j+Qx9c/F/Jetj47vN55V1zivCNYXVogp8Z
 os46/gDJkaYZ6ogZHphDlul/KuDYTUuEiEEVavZ5jBicjY8wovOzJsFOVvqBVxEhyd51AN2bH
 3f1p3uLKdeOx3A5EwJ/LQDbPrfz3IiMcmg87CjAc7PD/W5U5x8OvhYwjxGPruqz6MPSYsyX9G
 Wee5gkWnZJiQW/iCZVWQ==
Subject: Re: [Xen-devel] [PULL v2 0/3] Trivial branch patches
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, ehabkost@redhat.com,
 paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, chouteau@adacore.com,
 xen-devel@lists.xenproject.org, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 anthony.perard@citrix.com, marcandre.lureau@redhat.com,
 david@gibson.dropbear.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMDUvMTEvMjAxOSDDoCAyMDoyMCwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgYSDDqWNyaXTCoDoK
PiBQYXRjaGV3IFVSTDogaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzIwMTkxMTA1MTc1MDEwLjI1
OTEtMS1sYXVyZW50QHZpdmllci5ldS8KPiAKPiAKPiAKPiBIaSwKPiAKPiBUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgo+IG1vcmUgaW5mb3JtYXRpb246Cj4gCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BVTEwg
djIgMC8zXSBUcml2aWFsIGJyYW5jaCBwYXRjaGVzCj4gVHlwZTogc2VyaWVzCj4gTWVzc2FnZS1p
ZDogMjAxOTExMDUxNzUwMTAuMjU5MS0xLWxhdXJlbnRAdml2aWVyLmV1Cj4gCj4gPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQo+ICMhL2Jpbi9iYXNoCj4gZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rl
di9udWxsIHx8IGV4aXQgMAo+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
PiBnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKPiBnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCj4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1t
YWlsYmFjayBiYXNlLi4KPiA9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQo+IAo+IFN3aXRjaGVkIHRv
IGEgbmV3IGJyYW5jaCAndGVzdCcKPiA0OWE1NWY3IGdsb2JhbDogU3F1YXNoICd0aGUgdGhlJwo+
IGMwYjU1MTMgaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogRml4IDgtYml0IGFjY2Vzc2VzCj4g
ZWI0MzM5NSBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRp
bmcgdG8gUG5QIHJlZ2lzdGVycwo+IAo+ID09PSBPVVRQVVQgQkVHSU4gPT09Cj4gMS8zIENoZWNr
aW5nIGNvbW1pdCBlYjQzMzk1YmY4ZjEgKGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lk
IGNyYXNoIHdoZW4gd3JpdGluZyB0byBQblAgcmVnaXN0ZXJzKQo+IDIvMyBDaGVja2luZyBjb21t
aXQgYzBiNTUxM2Y5NzFhIChody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXggOC1iaXQgYWNj
ZXNzZXMpCj4gMy8zIENoZWNraW5nIGNvbW1pdCA0OWE1NWY3ZmViMTkgKGdsb2JhbDogU3F1YXNo
ICd0aGUgdGhlJykKPiBFUlJPUjogZG8gbm90IHVzZSBDOTkgLy8gY29tbWVudHMKPiAjMjY6IEZJ
TEU6IGRpc2FzL2xpYnZpeGwvdml4bC9pbnZhbHNldC5oOjEwNToKPiArICAvLyBOb3RlIHRoYXQg
dGhpcyBkb2VzIG5vdCBtZWFuIHRoZSBiYWNraW5nIHN0b3JhZ2UgaXMgZW1wdHk6IGl0IGNhbiBz
dGlsbAoKQXMgcmVwb3J0ZWQgYnkgRGF2aWQgR2lsYmVydCwgdGhpcyBpcyBhIGZhbHNlIHBvc2l0
aXZlIGFzIHRoaXMgZmlsZSBpcyBhCkMrKyBmaWxlLgoKVGhhbmtzLApMQXVyZW50CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
