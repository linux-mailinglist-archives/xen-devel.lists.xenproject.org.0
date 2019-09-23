Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A20BC15A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 07:24:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCdFP-0008C8-Du; Tue, 24 Sep 2019 05:20:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XE+/=XS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCUJu-0002R2-Cz
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 19:48:26 +0000
X-Inumbo-ID: 19c4a6a8-de3b-11e9-978d-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19c4a6a8-de3b-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 19:48:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB77730833C1;
 Mon, 23 Sep 2019 19:48:21 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50FBB6017E;
 Mon, 23 Sep 2019 19:47:28 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
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
Message-ID: <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
Date: Mon, 23 Sep 2019 14:47:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 23 Sep 2019 19:48:22 +0000 (UTC)
X-Mailman-Approved-At: Tue, 24 Sep 2019 05:20:20 +0000
Subject: Re: [Xen-devel] [RFC v2 0/9] error: auto propagated local_err
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
PiBIaSBhbGwhCj4gCj4gSGVyZSBpcyBhIHByb3Bvc2FsIG9mIGF1dG8gcHJvcGFnYXRpb24gZm9y
IGxvY2FsX2VyciwgdG8gbm90IGNhbGwKPiBlcnJvcl9wcm9wYWdhdGUgb24gZXZlcnkgZXhpdCBw
b2ludCwgd2hlbiB3ZSBkZWFsIHdpdGggbG9jYWxfZXJyLgo+IAo+IEl0IGFsc28gZml4ZXMgdHdv
IGlzc3VlczoKPiAxLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9mYXRhbCAmIGVycm9yX2FwcGVuZF9o
aW50OiB1c2VyIGNhbid0IHNlZSB0aGVzZQo+IGhpbnRzLCBiZWNhdXNlIGV4aXQoKSBoYXBwZW5z
IGluIGVycm9yX3NldGcgZWFybGllciB0aGFuIGhpbnQgaXMKPiBhcHBlbmRlZC4gW1JlcG9ydGVk
IGJ5IEdyZWcgS3Vyel0KPiAKPiAyLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9hYm9ydCAmIGVycm9y
X3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwCj4gZXJyb3JfYWJvcnQgYnkgbG9jYWxfZXJyK2Vycm9y
X3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwKPiByZWZlciB0byBlcnJvcl9wcm9w
YWdhdGUgYW5kIG5vdCB0byB0aGUgcGxhY2Ugd2hlcmUgZXJyb3IgaGFwcGVuZWQuCj4gKHRoZSBt
YWNybyBpdHNlbGYgZG9uJ3QgZml4IHRoZSBpc3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5dIGRy
b3AgYWxsCgpkb2Vzbid0Cgo+IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgcGF0dGVybiwgd2hp
Y2ggd2lsbCBkZWZpbml0ZWx5IGZpeCB0aGUgaXNzdWUpCj4gW1JlcG9ydGVkIGJ5IEtldmluIFdv
bGZdCj4gCj4gSXQncyBzdGlsbCBhbiBSRkMsIGR1ZSB0byB0aGUgZm9sbG93aW5nIHJlYXNvbnM6
Cj4gCj4gMS4gSSdtIG5ldyB0byBjb2NjaW5lbGxhLCBzbyBJIGZhaWxlZCB0byBkbyB0aGUgZm9s
bG93aW5nIHBhdHRlcm46Cj4gCj4gIDwuLi4KPiAtIGdvdG8gb3V0Owo+ICsgcmV0dXJuOwo+ICAu
Li4+Cj4gLSBvdXQ6Cj4gLSBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKQo+IAo+IFNv
LCBoZXJlIGlzIGNvbXBpbGF0aW9uIGZpeCAwOC4uIFdobyBjYW4gaGVscCB3aXRoIGl0PyBJZiBu
b2JvZHksIDA4IGlzCj4gdG8gYmUgbWVyZ2VkIHRvIDA3IGJ5IGhhbmQuCgpJJ20gbm90IHN1cmUg
ZWl0aGVyOyBidXQgSSBhZ3JlZSB0aGF0IGlmIHdlIGNhbid0IGZpZ3VyZSBvdXQgaG93IHRvIG1h
a2UKQ29jY2luZWxsZSBkbyBxdWl0ZSB3aGF0IHdlIHdhbnQsIHRoYXQgd2UgYXJlIGJldHRlciBv
ZmYgc3F1YXNoaW5nIGluCmNvbXBpbGUgZml4ZXMuCgpBbHNvLCB3aGlsZSBJIGxpa2UgQ29jY2lu
ZWxsZSBmb3IgYXV0b21hdGluZyB0aGUgY29udmVyc2lvbiwgaXQncyBoYXJkZXIKdG8gZ2V0IGV2
ZXJ5b25lIHRvIHJ1biBpdDsgaXQgd291bGQgYmUgbmljZSBpZiB3ZSBjb3VsZCBhbHNvIGZpZ3Vy
ZSBvdXQKYSBwYXRjaCB0byBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgdGhhdCBmb3IgYW55IGluc3Rh
bmNlIG9mICdFcnJvcgoqKmVycnApXG57XG4nIG5vdCBmb2xsb3dlZCBieSBlaXRoZXIgfSBvciB0
aGUgbmV3IG1hY3JvLCB3ZSBmbGFnIHRoYXQgYXMKYSBjaGVja3BhdGNoIHdhcm5pbmcgb3IgZXJy
b3IuCgo+IAo+IDIuIFF1ZXN0aW9uIGFib3V0IHVzaW5nIG5ldyBtYWNybyBpbiBlbXB0eSBzdHVi
IGZ1bmN0aW9ucyAtIHNlZSAwOQoKSXQgd291bGQgYmUgbmljZSBpZiB3ZSBjb3VsZCBleGVtcHQg
ZW1wdHkgZnVuY3Rpb25zIC0gbm8gbmVlZCB0byB1c2UgdGhlCm1hY3JvIGlmIHRoZXJlIGlzIG5v
IGZ1bmN0aW9uIGJvZHkgb3RoZXJ3aXNlLiAgSSdtIG5vdCBzdXJlIGlmCkNvY2NpbmVsbGUgY2Fu
IGRvIHRoYXQgZmlsdGVyaW5nIGR1cmluZyB0aGUgY29udmVyc2lvbiwgb3IgaWYgd2UgY2xlYW4K
dXAgYnkgaGFuZCBhZnRlciB0aGUgZmFjdC4KCj4gCj4gMy4gV2hhdCB0byBkbyB3aXRoIGh1Z2Ug
YXV0by1nZW5lcmF0ZWQgY29tbWl0IDA3PyBTaG91bGQgSSBzcGxpdCBpdAo+IHBlci1tYWludGFp
bmVyIG9yIHBlci1zdWJzeXN0ZW0sIG9yIGxlYXZlIGl0IGFzLWlzPwoKSXQncyBiaWcuIEknZCBz
cGxpdCBpdCBpbnRvIG11bHRpcGxlIHBhdGNoZXMgKGFuZCByZWR1Y2UgdGhlIGNjIC0gZXhjZXB0
CmZvciB0aGUgY292ZXIgbGV0dGVyLCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyBjYW4gYmUgbGlt
aXRlZCB0byB0aGUKYWN0dWFsIG1haW50YWluZXIvc3Vic3lzdGVtIGFmZmVjdGVkIHJhdGhlciB0
aGFuIGV2ZXJ5b25lIGludm9sdmVkCmFueXdoZXJlIGVsc2UgaW4gdGhlIHNlcmllcy4gV2l0aCB0
aGUgY3VycmVudCBsYXJnZSBjYywgYW55b25lIHRoYXQKcmVwbGllcyBnZXRzIHNldmVyYWwgbWFp
bCBib3VuY2VzIGFib3V0ICJ0b28gbWFueSByZWNpcGllbnRzIikuICBJdCBtYXkKYmUgZWFzaWVy
IHRvIHNwbGl0IGFsb25nIGRpcmVjdG9yeSBib3VuZGFyaWVzIHRoYW4gYnkgbWFpbnRhaW5lcgpi
b3VuZGFyaWVzLiAgTWFya3VzIGhhcyBhcHBsaWVkIGxhcmdlIHRyZWUtd2lkZSBDb2NjaW5lbGxl
IGNsZWFudXBzCmJlZm9yZSwgbWF5YmUgaGUgaGFzIHNvbWUgYWR2aWNlLgoKPiAKPiA0LiBBbHNv
LCBjaGVja3BhdGNoIGhhcyBzb21lIGNvbXBsYWlucyBhYm91dCAwNyBwYXRjaDoKPiAgIC0gdXNp
bmcgdGFicy4uIChobW0gZXhhY3RseSBzdHVicyBmdW5jdGlvbnMuLikKPiAgIC0gZW1wdHkgaWZz
Cj4gICBBZ2FpbiwgSSBkb24ndCBzZWUgYW55IHdheXMgdG8gZml4IGl0IG90aGVyIHRoYXQgYnkg
aGFuZCBhbmQgbWVyZ2UgdG8KPiAgIDA3Li4KCkhhbmQgY2xlYW51cHMgZm9yIGZvcm1hdHRpbmcg
b3IgY29tcGlsYXRpb24gZml4ZXMgdG8gQ29jY2luZWxsZSdzIHdvcmsKaXMgbm90IGFuIHVuY29t
bW9uIGlzc3VlIGFmdGVyIGxhcmdlIHBhdGNoZXM7IHRoYW5rZnVsbHkgaXQncyBhbHNvIG5vdAp2
ZXJ5IGRpZmZpY3VsdCAoYW5kIHN1cnByaXNpbmdseSBuZWVkZWQgaW4gdmVyeSBmZXcgcGxhY2Vz
IGNvbXBhcmVkIHRvCmhvdyBtdWNoIGFjdHVhbGx5IGdldHMgdG91Y2hlZCkuCgo+IAo+ID09PT09
PT09PT09PT09PT09PQo+IAo+IEFsc28sIGlmIHdlIGRlY2lkZSwgdGhhdCB0aGlzIGFsbCBpcyB0
b28gaHVnZSwgaGVyZSBpcyBwbGFuIEI6Cj4gCj4gMS4gYXBwbHkgMDEKPiAyLiBmaXggb25seSBm
dW5jdGlvbnMgdGhhdCBkb24ndCB1c2UgbG9jYWxfZXJyIGFuZCB1c2UKPiBlcnJvcl9hcHBlbmRf
aGludCwgYnkganVzdCBpbnZvY2F0aW9uIG9mIG5ldyBtYWNybyBhdCBmdW5jdGlvbiBzdGFydCAt
Cj4gaXQgd2lsbCBzdWJzdGl0dXRlIEdyZWcncyBzZXJpZXMgd2l0aCBubyBwYWluLgo+IDNbb3B0
aW9uYWxdLiBEbyBmdWxsIHVwZGF0ZSBmb3Igc29tZSBzdWJzeXN0ZW1zLCBmb3IgZXhhbXBsZSwg
b25seSBmb3IKPiBibG9jayogYW5kIG5iZCoKCkV2ZW4gaWYgd2UgZ28gd2l0aCBwbGFuIEIsIGl0
J3Mgc3RpbGwgd29ydGggY2hlY2tpbmcgaW4gYSBDb2NjaW5lbGxlCnNjcmlwdCB0aGF0IHdlIGNh
biBwZXJpb2RpY2FsbHkgcnVuIHRvIG1ha2Ugc3VyZSB3ZSBhcmVuJ3QgbWlzc2luZyBvdXQKb24g
dGhlIHVzZSBvZiB0aGUgbWFjcm8gd2hlcmUgaXQgaXMgbmVlZGVkLgoKPiAKPiBWbGFkaW1pciBT
ZW1lbnRzb3YtT2dpZXZza2l5ICg5KToKPiAgIGVycm9yOiBhdXRvIHByb3BhZ2F0ZWQgbG9jYWxf
ZXJyCj4gICBxYXBpL2Vycm9yOiBhZGQgKEVycm9yICoqZXJycCkgY2xlYW5pbmcgQVBJcwo+ICAg
ZXJycDogcmVuYW1lIGVycnAgdG8gZXJycF9pbiB3aGVyZSBpdCBpcyBJTi1hcmd1bWVudAo+ICAg
aHcvY29yZS9sb2FkZXItZml0OiBmaXggZnJlZWluZyBlcnJwIGluIGZpdF9sb2FkX2ZkdAo+ICAg
bmV0L25ldDogZml4IGxvY2FsIHZhcmlhYmxlIHNoYWRvd2luZyBpbiBuZXRfY2xpZW50X2luaXQK
PiAgIHNjcmlwdHM6IGFkZCBjb2NjaW5lbGxlIHNjcmlwdCB0byB1c2UgYXV0byBwcm9wYWdhdGVk
IGVycnAKPiAgIFVzZSBhdXRvLXByb3BhZ2F0ZWQgZXJycAo+ICAgZml4LWNvbXBpbGF0aW9uOiBl
bXB0eSBnb3RvCj4gICBmaXgtY29tcGlsYXRpb246IGluY2x1ZGVzCj4gCj4gIGluY2x1ZGUvaHcv
cGNpLWhvc3Qvc3BhcHIuaCAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIGluY2x1ZGUvbW9u
aXRvci9obXAuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBpbmNsdWRlL3Fh
cGkvZXJyb3IuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNjEgKysrKy0KPiAgdGFyZ2V0
L3BwYy9rdm1fcHBjLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKPiAgdGFyZ2V0
L3MzOTB4L2NwdV9tb2RlbHMuaCAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKPiAgdWkvdm5j
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCgo+ICB2bC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KPiAgc2Ny
aXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpIHwgIDgyICsrKysrKysK
PiAgMzE5IGZpbGVzIGNoYW5nZWQsIDI3MjkgaW5zZXJ0aW9ucygrKSwgNDI0NSBkZWxldGlvbnMo
LSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0
ZWQtZXJycC5jb2NjaQoKVGhlIGRpZmZzdGF0IGlzIGh1Z2UsIGJ1dCBwcm9taXNpbmcuCgotLSAK
RXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAg
ICAgICAgICsxLTkxOS0zMDEtMzIyNgpWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmly
dC5vcmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
