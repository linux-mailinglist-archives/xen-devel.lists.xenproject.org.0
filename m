Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D0BD702
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:15:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyeI-0008D1-TR; Wed, 25 Sep 2019 04:11:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aeME=XT=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCml7-00075t-CP
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:29:45 +0000
X-Inumbo-ID: 21dabbe8-dee0-11e9-bf31-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 21dabbe8-dee0-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:29:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E0637C069B4B;
 Tue, 24 Sep 2019 15:29:40 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D57860BFB;
 Tue, 24 Sep 2019 15:28:53 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
 <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
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
Message-ID: <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
Date: Tue, 24 Sep 2019 10:28:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 24 Sep 2019 15:29:43 +0000 (UTC)
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:11:29 +0000
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
Cc: "stefanha@redhat.com" <stefanha@redhat.com>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
 "berto@igalia.com" <berto@igalia.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "hpoussin@reactos.org" <hpoussin@reactos.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "green@moxielogic.com" <green@moxielogic.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "pl@kamp.de" <pl@kamp.de>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "crwulff@gmail.com" <crwulff@gmail.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "michael@walle.cc" <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 "david@redhat.com" <david@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "hare@suse.com" <hare@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "namei.unix@gmail.com" <namei.unix@gmail.com>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "amit@kernel.org" <amit@kernel.org>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>,
 "clg@kaod.org" <clg@kaod.org>, "shorne@gmail.com" <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "ari@tuxera.com" <ari@tuxera.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>,
 "dillaman@redhat.com" <dillaman@redhat.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 "balrogg@gmail.com" <balrogg@gmail.com>,
 "rjones@redhat.com" <rjones@redhat.com>,
 "Andrew.Baumann@microsoft.com" <Andrew.Baumann@microsoft.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "walling@linux.ibm.com" <walling@linux.ibm.com>,
 Denis Lunev <den@virtuozzo.com>, "mst@redhat.com" <mst@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "v.maffione@gmail.com" <v.maffione@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "pavel.dovgaluk@ispras.ru" <pavel.dovgaluk@ispras.ru>,
 "g.lettieri@iet.unipi.it" <g.lettieri@iet.unipi.it>,
 "rizzo@iet.unipi.it" <rizzo@iet.unipi.it>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNC8xOSA5OjEyIEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgoK
Pj4+IDMuIFdoYXQgdG8gZG8gd2l0aCBodWdlIGF1dG8tZ2VuZXJhdGVkIGNvbW1pdCAwNz8gU2hv
dWxkIEkgc3BsaXQgaXQKPj4+IHBlci1tYWludGFpbmVyIG9yIHBlci1zdWJzeXN0ZW0sIG9yIGxl
YXZlIGl0IGFzLWlzPwo+Pgo+PiBJdCdzIGJpZy4gSSdkIHNwbGl0IGl0IGludG8gbXVsdGlwbGUg
cGF0Y2hlcyAoYW5kIHJlZHVjZSB0aGUgY2MgLSBleGNlcHQKPj4gZm9yIHRoZSBjb3ZlciBsZXR0
ZXIsIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGNhbiBiZSBsaW1pdGVkIHRvIHRoZQo+PiBhY3R1
YWwgbWFpbnRhaW5lci9zdWJzeXN0ZW0gYWZmZWN0ZWQgcmF0aGVyIHRoYW4gZXZlcnlvbmUgaW52
b2x2ZWQKPj4gYW55d2hlcmUgZWxzZSBpbiB0aGUgc2VyaWVzLiBXaXRoIHRoZSBjdXJyZW50IGxh
cmdlIGNjLCBhbnlvbmUgdGhhdAo+PiByZXBsaWVzIGdldHMgc2V2ZXJhbCBtYWlsIGJvdW5jZXMg
YWJvdXQgInRvbyBtYW55IHJlY2lwaWVudHMiKS4gIEl0IG1heQo+PiBiZSBlYXNpZXIgdG8gc3Bs
aXQgYWxvbmcgZGlyZWN0b3J5IGJvdW5kYXJpZXMgdGhhbiBieSBtYWludGFpbmVyCj4+IGJvdW5k
YXJpZXMuICBNYXJrdXMgaGFzIGFwcGxpZWQgbGFyZ2UgdHJlZS13aWRlIENvY2NpbmVsbGUgY2xl
YW51cHMKPj4gYmVmb3JlLCBtYXliZSBoZSBoYXMgc29tZSBhZHZpY2UuCj4gCj4gCj4gSWYgc3Bs
aXQgYnkgc3Vic3lzdGVtIGl0IHdvdWxkIGJlIDIwMCsgcGF0Y2hlczoKPiBnaXQgZGlmZiAtLW5h
bWUtb25seSB8IHdoaWxlIHJlYWQgZjsgZG8gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtZiAk
ZiAtLXN1YnN5c3RlbSAtLW5vLXJvbGVzdGF0cyAyPi9kZXYvbnVsbCB8IGdyZXAgLXYgQCB8IGhl
YWQgLTE7IGRvbmUgfCBzb3J0IHwgdW5pcSB8IHdjIC1sCj4gMjA1Cj4gCj4gCj4gVHJ5IHRvIGxv
b2sgYXQgbGFyZ2VyIHN1YnN5c3RlbToKPiBnaXQgZGlmZiAtLW5hbWUtb25seSB8IHdoaWxlIHJl
YWQgZjsgZG8gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtZiAkZiAtLXN1YnN5c3RlbSAtLW5v
LXJvbGVzdGF0cyAyPi9kZXYvbnVsbCB8IGdyZXAgLXYgQCB8IHRhaWwgLTIgfCBoZWFkIC0xOyBk
b25lIHwgc29ydCB8IHVuaXEgfCB3YyAtbAo+IDEzOQo+IAo+IHN0aWxsIHRvbyBtYW55Li4gT3Ig
aXMgaXQgT0s/CgpIbW0gLSB0aGF0IGJlY29tZXMgYSB0cmFkZW9mZiBpbiBsZW5ndGggb2YgdGhl
IHNlcmllcyAod2hlcmUgaW5kaXZpZHVhbApwYXRjaGVzIG1heSBiZSByZXZpZXdlZCBmYXN0LCBi
dXQgd2hlcmUgdGhlIG92ZXJhbGwgcHJvY2VzcyBtYXkgYmUKYm9nZ2VkIGRvd24gYnkgc2hlZXIg
bGVuZ3RoKSwgdnMuIGxlbmd0aCBvZiBpbmRpdmlkdWFsIGVtYWlscyAod2hlcmUgdGhlCmVtYWls
IGl0c2VsZiBpcyBkYXVudGluZywgYnV0IGFzIHRoZSByZXZpZXcgaXMgbWVjaGFuaWNhbCBhbmQg
ZG9uZSBieQphdXRvbWF0aW9uLCBpdCBiZWNvbWVzIGEgbWF0dGVyIG9mIHNwb3QtY2hlY2tpbmcg
aWYgd2UgdHJ1c3QgdGhhdCB0aGUKYXV0b21hdGlvbiB3YXMgZG9uZSBjb3JyZWN0bHkpLiAgWW91
IGNhbiBwcm9iYWJseSBncm91cCBpdCBpbiBmZXdlcgpwYXRjaGVzLCBieSBqb2luaW5nIHNtYWxs
ZXIgcGF0Y2hlcyBhY3Jvc3MgYSBjb3VwbGUgb2Ygc3Vic3lzdGVtcy4gIEl0J3MKYW4gYXJ0IGZv
cm0sIHRoZXJlJ3MgcHJvYmFibHkgc2V2ZXJhbCB3YXlzIHRvIGRvIGl0IHRoYXQgd291bGQgd29y
aywgYW5kCml0IGNvbWVzIGRvd24gdG8gYSBqdWRnbWVudCBjYWxsIG9uIGhvdyBtdWNoIHdvcmsg
eW91IHdhbnQgdG8gZG8gdG8gdHJ5CmFuZCByZWR1Y2Ugb3RoZXIncyB3b3JrIGluIHJldmlld2lu
ZyBpdC4gIE1heWJlIGV2ZW4gYW4gb2ZmLWhhbmQgc3BsaXQKb2YgZ2F0aGVyaW5nIGZpbGVzIHVu
dGlsIHlvdSByZWFjaCBhYm91dCA1MDAgb3Igc28gbGluZXMgcGVyIGRpZmYuICBJCndpc2ggSSBo
YWQgZWFzaWVyIGFkdmljZSBvbiBob3cgdG8gdGFja2xlIHRoaXMgc29ydCBvZiBwcm9qZWN0IGlu
IHRoZQp3YXkgdGhhdCB3aWxsIGdldCB0aGUgZmFzdGVzdCByZXNwb25zZSB0aW1lLgoKCj4+PiAg
IHZsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArLQo+
Pj4gICBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgfCAgODIg
KysrKysrKwo+Pj4gICAzMTkgZmlsZXMgY2hhbmdlZCwgMjcyOSBpbnNlcnRpb25zKCspLCA0MjQ1
IGRlbGV0aW9ucygtKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2NjaW5lbGxl
L2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpCj4+Cj4+IFRoZSBkaWZmc3RhdCBpcyBodWdlLCBi
dXQgcHJvbWlzaW5nLgoKV2UgYWxzbyBsZWFybmVkIGluIHJldmlld3Mgb2YgNy85IHRoYXQgdGhl
IGRpZmZzdGF0IGhlcmUgaXMgbWlzbGVhZGluZywKdGhlIG51bWJlciBvZiBpbnNlcnRpb25zIHdp
bGwgZGVmaW5pdGVseSBiZSBpbmNyZWFzaW5nIG9uY2UgdGhlCkNvY2NpbmVsbGUgc2NyaXB0IGlz
IGZpeGVkIHRvIGluc2VydCB0aGUgbWFjcm8gaW4gbW9yZSBmdW5jdGlvbnMsIGJ1dApob3BlZnVs
bHkgaXQncyBzdGlsbCBhIG5ldCByZWR1Y3Rpb24gaW4gb3ZlcmFsbCBsaW5lcy4KCi0tIApFcmlj
IEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhhdCwgSW5jLiAgICAgICAg
ICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0Lm9y
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
