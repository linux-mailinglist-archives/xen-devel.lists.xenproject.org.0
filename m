Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8225BC155
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 07:23:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCdFP-0008CE-Nz; Tue, 24 Sep 2019 05:20:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XE+/=XS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCUUa-0003CE-3a
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 19:59:28 +0000
X-Inumbo-ID: a5374c08-de3c-11e9-b76c-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5374c08-de3c-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 19:59:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9320D8A1C8C;
 Mon, 23 Sep 2019 19:59:24 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 321B26017E;
 Mon, 23 Sep 2019 19:58:11 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <b345e88b-f426-5bcc-cf2f-4774d5b98bcb@redhat.com>
Date: Mon, 23 Sep 2019 14:58:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-2-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Mon, 23 Sep 2019 19:59:26 +0000 (UTC)
X-Mailman-Approved-At: Tue, 24 Sep 2019 05:20:20 +0000
Subject: Re: [Xen-devel] [RFC v2 1/9] error: auto propagated local_err
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
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 berto@igalia.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, samuel.thibault@ens-lyon.org, philmd@redhat.com,
 green@moxielogic.com, lvivier@redhat.com, ehabkost@redhat.com,
 xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, ronniesahlberg@gmail.com,
 jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 crwulff@gmail.com, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, sheepdog@lists.wpkg.org,
 david@redhat.com, palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com,
 den@openvz.org, hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, ari@tuxera.com,
 quintela@redhat.com, mdroth@linux.vnet.ibm.com, lersek@redhat.com,
 borntraeger@de.ibm.com, antonynpavlov@gmail.com, dillaman@redhat.com,
 joel@jms.id.au, xen-devel@lists.xenproject.org, integration@gluster.org,
 balrogg@gmail.com, rjones@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, mst@redhat.com,
 mark.cave-ayland@ilande.co.uk, v.maffione@gmail.com, marex@denx.de,
 armbru@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it,
 rizzo@iet.unipi.it, david@gibson.dropbear.id.au, akrowiak@linux.ibm.com,
 berrange@redhat.com, xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com,
 wencongyang2@huawei.com, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yMy8xOSAxMToxMiBBTSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToK
PiBIZXJlIGlzIGludHJvZHVjZWQgRVJSUF9GVU5DVElPTl9CRUdJTiBtYWNybywgdG8gYmUgdXNl
ZCBhdCBzdGFydCBvZgo+IGFueSBmdW5jdGlvbiB3aXRoIGVycnAgcGFyYW1ldGVyLgo+IAo+IEl0
IGhhcyB0aHJlZSBnb2FsczoKPiAKPiAxLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9mYXRhbCAmIGVy
cm9yX2FwcGVuZF9oaW50OiB1c2VyIGNhbid0IHNlZSB0aGVzZQo+IGhpbnRzLCBiZWNhdXNlIGV4
aXQoKSBoYXBwZW5zIGluIGVycm9yX3NldGcgZWFybGllciB0aGFuIGhpbnQgaXMKPiBhcHBlbmRl
ZC4gW1JlcG9ydGVkIGJ5IEdyZWcgS3Vyel0KPiAKPiAyLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9h
Ym9ydCAmIGVycm9yX3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwCj4gZXJyb3JfYWJvcnQgYnkgbG9j
YWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwKPiByZWZlciB0
byBlcnJvcl9wcm9wYWdhdGUgYW5kIG5vdCB0byB0aGUgcGxhY2Ugd2hlcmUgZXJyb3IgaGFwcGVu
ZWQuCj4gKHRoZSBtYWNybyBpdHNlbGYgZG9uJ3QgZml4IHRoZSBpc3N1ZSwgYnV0IGl0IGFsbG93
cyB0byBbMy5dIGRyb3AgYWxsCgpkb2Vzbid0Cgo+IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUg
cGF0dGVybiwgd2hpY2ggd2lsbCBkZWZpbml0ZWx5IGZpeCB0aGUgaXNzdWUpCj4gW1JlcG9ydGVk
IGJ5IEtldmluIFdvbGZdCj4gCj4gMy4gRHJvcCBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlIHBh
dHRlcm4sIHdoaWNoIGlzIHVzZWQgdG8gd29ya2Fyb3VuZAo+IHZvaWQgZnVuY3Rpb25zIHdpdGgg
ZXJycCBwYXJhbWV0ZXIsIHdoZW4gY2FsbGVyIHdhbnRzIHRvIGtub3cgcmVzdWx0aW5nCj4gc3Rh
dHVzLiAoTm90ZTogYWN0dWFsbHkgdGhlc2UgZnVuY3Rpb25zIHNob3VsZCBiZSBtZXJlbHkgdXBk
YXRlZCB0bwoKTWF5YmU6CgpzL3Nob3VsZC9jb3VsZC8KCj4gcmV0dXJuIGludCBlcnJvciBjb2Rl
KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2Vt
ZW50c292QHZpcnR1b3p6by5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvcWFwaS9lcnJvci5oIHwgMzcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MzcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FhcGkvZXJyb3IuaCBi
L2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gaW5kZXggM2Y5NTE0MWEwMS4uZjZmNGZhMGZhYyAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+ICsrKyBiL2luY2x1ZGUvcWFwaS9lcnJv
ci5oCj4gQEAgLTMyMiw2ICszMjIsNDMgQEAgdm9pZCBlcnJvcl9zZXRfaW50ZXJuYWwoRXJyb3Ig
KiplcnJwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvckNsYXNzIGVycl9jbGFzcywg
Y29uc3QgY2hhciAqZm10LCAuLi4pCj4gICAgICBHQ0NfRk1UX0FUVFIoNiwgNyk7Cj4gIAo+ICt0
eXBlZGVmIHN0cnVjdCBFcnJvclByb3BhZ2F0b3Igewo+ICsgICAgRXJyb3IgKmxvY2FsX2VycjsK
PiArICAgIEVycm9yICoqZXJycDsKPiArfSBFcnJvclByb3BhZ2F0b3I7Cj4gKwo+ICtzdGF0aWMg
aW5saW5lIHZvaWQgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKEVycm9yUHJvcGFnYXRvciAqcHJv
cCkKPiArewo+ICsgICAgZXJyb3JfcHJvcGFnYXRlKHByb3AtPmVycnAsIHByb3AtPmxvY2FsX2Vy
cik7Cj4gK30KPiArCj4gK0dfREVGSU5FX0FVVE9fQ0xFQU5VUF9DTEVBUl9GVU5DKEVycm9yUHJv
cGFnYXRvciwgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKTsKPiArCj4gKy8qCj4gKyAqIEVSUlBf
RlVOQ1RJT05fQkVHSU4KPiArICoKPiArICogVGhpcyBtYWNybyBNVVNUIGJlIHRoZSBmaXJzdCBs
aW5lIG9mIEVBQ0ggZnVuY3Rpb24gd2l0aCBFcnJvciAqKmVycnAKPiArICogcGFyYW1ldGVyLgoK
TWF5YmUgcy9FQUNIIGZ1bmN0aW9uL0FOWSBub24tZW1wdHkgZnVuY3Rpb24vIChhbGxvd2luZyBv
dXIgc3R1YgpmdW5jdGlvbnMgdG8gYmUgZXhlbXB0aW9ucykuCgo+ICsgKgo+ICsgKiBJZiBlcnJw
IGlzIE5VTEwgb3IgcG9pbnRzIHRvIGVycm9yX2ZhdGFsLCBpdCBpcyByZXdyaXR0ZW4gdG8gcG9p
bnQgdG8KCnMvdG8vdG8gYS8KCj4gKyAqIGxvY2FsIEVycm9yIG9iamVjdCwgd2hpY2ggd2lsbCBi
ZSBhdXRvbWF0aWNhbGx5IHByb3BhZ2F0ZWQgdG8gb3JpZ2luYWwKCnMvdG8vdG8gdGhlLwoKPiAr
ICogZXJycCBvbiBmdW5jdGlvbiBleGl0IChzZWUgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKS4K
PiArICoKPiArICogQWZ0ZXIgaW52b2NhdGlvbiBvZiB0aGlzIG1hY3JvIGl0IGlzIGFsd2F5cyBz
YWZlIHRvIGRlcmVmZXJlbmNlIGVycnAKPiArICogKGFzIGl0J3Mgbm90IE5VTEwgYW55bW9yZSkg
YW5kIHRvIGFwcGVuZCBoaW50IChieSBlcnJvcl9hcHBlbmRfaGludCkKCnMvYXBwZW5kIGhpbnQv
YXBwZW5kIGhpbnRzLwoKPiArICogKGFzLCBpZiBpdCB3YXMgZXJyb3JfZmF0YWwsIHdlIHN3YXBw
ZWQgaXQgYnkgbG9jYWxfZXJyb3IgdG8gYmUKCnMvYnkgbG9jYWxfZXJyb3Ivd2l0aCBhIGxvY2Fs
IGVycm9yLwoKPiArICogcHJvcGFnYXRlZCBvbiBjbGVhbnVwKS4KPiArICoKPiArICogTm90ZTog
d2UgZG9uJ3Qgd3JhcCBlcnJvcl9hYm9ydCBjYXNlLCBhcyB3ZSB3YW50IHJlc3VsdGluZyBjb3Jl
ZHVtcAo+ICsgKiB0byBwb2ludCB0byB0aGUgcGxhY2Ugd2hlcmUgdGhlIGVycm9yIGhhcHBlbmVk
LCBub3QgdG8gZXJyb3JfcHJvcGFnYXRlLgoKcy93cmFwL3dyYXAgdGhlLwoKPiArICovCj4gKyNk
ZWZpbmUgRVJSUF9GVU5DVElPTl9CRUdJTigpIFwKPiArZ19hdXRvKEVycm9yUHJvcGFnYXRvcikg
X19hdXRvX2VycnBfcHJvcCA9IHsuZXJycCA9IGVycnB9OyBcCj4gK0Vycm9yICoqX19sb2NhbF9l
cnJwX3VudXNlZCBfX2F0dHJpYnV0ZV9fICgodW51c2VkKSkgPSBcCj4gKyAgICAoZXJycCA9IChl
cnJwID09IE5VTEwgfHwgKmVycnAgPT0gZXJyb3JfZmF0YWwgPyBcCj4gKyAgICAgICAgICAgICAm
X19hdXRvX2VycnBfcHJvcC5sb2NhbF9lcnIgOiBlcnJwKSkKCkknbSBub3Qgc29sZCBvbiB3aHkg
d2UgbmVlZCB0aGUgZHVtbXkgZGVjbGFyYXRpb24gKHllYWgsIEkga25vdyBpdCdzIHNvCnRoYXQg
eW91IGRvbid0IGhhdmUgdG8gZmlnaHQgdGhlIGJhdHRsZSBvZiBtaXhpbmcgZGVjbGFyYXRpb25z
IGFuZApzdGF0ZW1lbnRzIC0gYnV0IHRoaXMgaXMgaW4gYSBtYWNybyBjYWxsIHdob3NlIHVzYWdl
IExPT0tTIGxpa2UgYQpzdGF0ZW1lbnQgcmF0aGVyIHRoYW4gYSBkZWNsYXJhdGlvbiwgc28gd2Un
cmUgYWxyZWFkeSBvbiBmdXp6eSBncm91bmQpLgpXZSBjb3VsZCBtYWtlIHRoaXMgbWFjcm8gZXhw
YW5zaW9uIG9uZSBsaW5lIHNob3J0ZXIgYW5kIHN0aWxsIGJlCmNvcnJlY3QsIGJ1dCBJJ20gbm90
IGdvaW5nIHRvIGluc2lzdCAod2UnbGwgc2VlIHdoYXQgY29uc2Vuc3VzIGlzLAphbmQvb3Igd2hh
dCBNYXJrdXMgc2F5cykuCgo+ICsKPiArCj4gIC8qCj4gICAqIFNwZWNpYWwgZXJyb3IgZGVzdGlu
YXRpb24gdG8gYWJvcnQgb24gZXJyb3IuCj4gICAqIFNlZSBlcnJvcl9zZXRnKCkgYW5kIGVycm9y
X3Byb3BhZ2F0ZSgpIGZvciBkZXRhaWxzLgo+IAoKLS0gCkVyaWMgQmxha2UsIFByaW5jaXBhbCBT
b2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTktMzAxLTMyMjYK
VmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
