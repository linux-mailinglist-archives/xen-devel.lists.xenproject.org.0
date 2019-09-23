Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C963BBE00
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 23:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCVv4-0002A0-TG; Mon, 23 Sep 2019 21:30:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XE+/=XS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCVv4-00029v-7x
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 21:30:54 +0000
X-Inumbo-ID: 6ba08d80-de49-11e9-9608-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 6ba08d80-de49-11e9-9608-12813bfff9fa;
 Mon, 23 Sep 2019 21:30:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E9323082B02;
 Mon, 23 Sep 2019 21:30:51 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7125D71C;
 Mon, 23 Sep 2019 21:30:02 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-7-vsementsov@virtuozzo.com>
 <57e97ed0-b1a1-d209-fc23-cf41ec467157@redhat.com>
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
Message-ID: <7cffb999-35e5-742e-7241-6da4777885bf@redhat.com>
Date: Mon, 23 Sep 2019 16:29:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <57e97ed0-b1a1-d209-fc23-cf41ec467157@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 23 Sep 2019 21:30:52 +0000 (UTC)
Subject: Re: [Xen-devel] [RFC v2 6/9] scripts: add coccinelle script to use
 auto propagated errp
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
Cc: stefanha@redhat.com, jan.kiszka@siemens.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com,
 hpoussin@reactos.org, anthony.perard@citrix.com, samuel.thibault@ens-lyon.org,
 balrogg@gmail.com, jasowang@redhat.com, lvivier@redhat.com,
 ehabkost@redhat.com, xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 ronniesahlberg@gmail.com, rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 crwulff@gmail.com, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, sheepdog@lists.wpkg.org,
 david@redhat.com, palmer@sifive.com, jcmvbkbc@gmail.com, den@openvz.org,
 hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 thuth@redhat.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 quintela@redhat.com, mdroth@linux.vnet.ibm.com, borntraeger@de.ibm.com,
 antonynpavlov@gmail.com, joel@jms.id.au, xen-devel@lists.xenproject.org,
 integration@gluster.org, lersek@redhat.com, Andrew.Baumann@microsoft.com,
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

T24gOS8yMy8xOSAzOjA1IFBNLCBFcmljIEJsYWtlIHdyb3RlOgoKPiBEb2VzIHJ1bm5pbmcgdGhp
cyBDb2NjaW5lbGxlIHNjcmlwdCAyIHRpbWVzIGluIGEgcm93IGFkZCBhIHNlY29uZAo+IEVSUlBf
RlVOQ1RJT05fQkVHSU4oKSBsaW5lPyAgV2Ugd2FudCBpdCB0byBiZSBpZGVtcG90ZW50IChubyBj
aGFuZ2VzIG9uCj4gYSBzZWNvbmQgcnVuKS4gIChBZG1pdHRlZGx5LCBJIGRpZCBub3QgYWN0dWFs
bHkgdGVzdCB0aGF0IHlldCkuICBBbHNvLCBJCj4gZG9uJ3Qga25vdyBpZiB0aGlzIGNhbiBiZSB0
d2Vha2VkIHRvIGF2b2lkIGFkZGluZyB0aGUgbGluZSB0byBhIGZ1bmN0aW9uCj4gd2l0aCBhbiBl
bXB0eSBib2R5LCBtYXliZToKPiAKPiAgZm4oLi4uLCBFcnJvciAqKmVycnAsIC4uLikKPiAgewo+
ICsgICAgRVJSUF9GVU5DVElPTl9CRUdJTigpOwo+ICAgICAgLi4uCj4gIH0KCkFsc28gdW50ZXN0
ZWQ6CgogZm4oLi4uLCBFcnJvciAqKmVycnAsIC4uLikKIHsKKAp8CiAgICAgRVJSUF9GVU5DVElP
Tl9CRUdJTigpOwogICAgIC4uLgp8CisgICAgRVJSUF9GVU5DVElPTl9CRUdJTigpCiAgICAgLi4u
CikKIH0KCgo+IE92ZXJhbGwsIHRoZSBzY3JpcHQgbWFrZXMgc2Vuc2UgaW4gbXkgcmVhZGluZyAo
YnV0IG5vIGlkZWEgaWYgaXQKPiBhY3R1YWxseSBjYXRjaGVzIGV2ZXJ5dGhpbmcgd2Ugd2FudCwg
b3IgaWYgaXQgbWlzc2VkIHNvbWV0aGluZykuCgpIYXZpbmcgc3BvdC1jaGVja2VkIDcsIGl0IGRl
ZmluaXRlbHkgbWlzc2VzIGNhc2VzIHdoZXJlIGl0IHdhcyBzdXBwb3NlZAp0byBhZGQgRVJSUF9G
VU5DVElPTl9CRUdJTigpLgoKLS0gCkVyaWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdp
bmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTktMzAxLTMyMjYKVmlydHVhbGl6YXRp
b246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
