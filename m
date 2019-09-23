Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E45BC152
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 07:23:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCdFP-0008C1-4f; Tue, 24 Sep 2019 05:20:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XE+/=XS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCTKU-0006Js-PZ
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 18:44:58 +0000
X-Inumbo-ID: 3d4f4fe6-de32-11e9-a337-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d4f4fe6-de32-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 18:44:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 90020308624A;
 Mon, 23 Sep 2019 18:44:56 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7E81001B05;
 Mon, 23 Sep 2019 18:44:29 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-6-vsementsov@virtuozzo.com>
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
Message-ID: <ce58d998-cc75-9eae-1bab-7e1c7c3737d1@redhat.com>
Date: Mon, 23 Sep 2019 13:44:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-6-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 18:44:56 +0000 (UTC)
X-Mailman-Approved-At: Tue, 24 Sep 2019 05:20:20 +0000
Subject: Re: [Xen-devel] [RFC v2 5/9] net/net: fix local variable shadowing
 in net_client_init
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
PiBEb24ndCBzaGFkb3cgRXJyb3IgKmVycjogaXQncyBhIGJhZCB0aGluZy4gVGhpcyBwYXRjaCBh
bHNvIHNpbXBsaWZpZXMKPiBmb2xsb3dpbmcgRXJyb3IgcHJvcGFnYXRpb24gY29udmVyc2lvbi4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50
c292QHZpcnR1b3p6by5jb20+Cj4gLS0tCj4gIG5ldC9uZXQuYyB8IDYgKysrLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpDYW4gYmUgYXBwbGll
ZCBpbmRlcGVuZGVudGx5IG9mIHRoZSByZXN0IG9mIHRoaXMgc2VyaWVzLgoKPiAKPiBkaWZmIC0t
Z2l0IGEvbmV0L25ldC5jIGIvbmV0L25ldC5jCj4gaW5kZXggODRhYTZkOGQwMC4uNWZjNzI1MTFj
MSAxMDA2NDQKPiAtLS0gYS9uZXQvbmV0LmMKPiArKysgYi9uZXQvbmV0LmMKPiBAQCAtMTEyOCwx
MCArMTEyOCwxMCBAQCBzdGF0aWMgaW50IG5ldF9jbGllbnRfaW5pdChRZW11T3B0cyAqb3B0cywg
Ym9vbCBpc19uZXRkZXYsIEVycm9yICoqZXJycCkKPiAgCj4gICAgICAgICAgICAgIGlmIChzdWJz
dHJpbmdzWzFdKSB7Cj4gICAgICAgICAgICAgICAgICAvKiBVc2VyLXNwZWNpZmllZCBwcmVmaXgg
bGVuZ3RoLiAgKi8KPiAtICAgICAgICAgICAgICAgIGludCBlcnI7Cj4gKyAgICAgICAgICAgICAg
ICBpbnQgcmV0MjsKPiAgCj4gLSAgICAgICAgICAgICAgICBlcnIgPSBxZW11X3N0cnRvdWwoc3Vi
c3RyaW5nc1sxXSwgTlVMTCwgMTAsICZwcmVmaXhfbGVuKTsKPiAtICAgICAgICAgICAgICAgIGlm
IChlcnIpIHsKPiArICAgICAgICAgICAgICAgIHJldDIgPSBxZW11X3N0cnRvdWwoc3Vic3RyaW5n
c1sxXSwgTlVMTCwgMTAsICZwcmVmaXhfbGVuKTsKPiArICAgICAgICAgICAgICAgIGlmIChyZXQy
KSB7CgpJbiBmYWN0LCB5b3UgZG9uJ3QgbmVlZCByZXQyOyB5b3UgY291bGQganVzdDoKCmlmIChx
ZW11X3N0cnRvdWwoLi4uKSkgewoKYXQgd2hpY2ggcG9pbnQgeW91IGNvdWxkIHRoZW4gam9pbjoK
CmlmIChzdWJzdHJpbmdzWzFdICYmCiAgICBxZW11c19zdHJ0b3VsKC4uLikpIHsKCj4gICAgICAg
ICAgICAgICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCBRRVJSX0lOVkFMSURfUEFSQU1FVEVSX1ZB
TFVFLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlwdjYtcHJlZml4bGVuIiwg
ImEgbnVtYmVyIik7Cj4gICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gCgpFaXRoZXIg
d2F5LAoKUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgoKLS0gCkVy
aWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAg
ICAgICArMS05MTktMzAxLTMyMjYKVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQu
b3JnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
