Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5599BC15B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 07:24:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCdFQ-0008Cm-1z; Tue, 24 Sep 2019 05:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XE+/=XS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCUbK-0003yM-Vg
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 20:06:27 +0000
X-Inumbo-ID: 9ecec796-de3d-11e9-978d-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ecec796-de3d-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 20:06:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06205307CDE7;
 Mon, 23 Sep 2019 20:06:24 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 630F819D70;
 Mon, 23 Sep 2019 20:05:50 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-7-vsementsov@virtuozzo.com>
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
Message-ID: <57e97ed0-b1a1-d209-fc23-cf41ec467157@redhat.com>
Date: Mon, 23 Sep 2019 15:05:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-7-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 20:06:24 +0000 (UTC)
X-Mailman-Approved-At: Tue, 24 Sep 2019 05:20:20 +0000
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
PiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292
QHZpcnR1b3p6by5jb20+Cj4gLS0tCj4gIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0
ZWQtZXJycC5jb2NjaSB8IDgyICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDgyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29jY2luZWxs
ZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQo+IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2Nv
Y2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUv
YXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjFhM2YwMDZmMGIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc2NyaXB0cy9j
b2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpCj4gQEAgLTAsMCArMSw4MiBAQAo+
ICtAQAo+ICtpZGVudGlmaWVyIGZuOwo+ICtpZGVudGlmaWVyIGxvY2FsX2VycjsKPiArQEAKPiAr
Cj4gKyBmbiguLi4sIEVycm9yICoqZXJycCkKPiArIHsKPiArKyAgICBFUlJQX0ZVTkNUSU9OX0JF
R0lOKCk7Cj4gKyB9CgpUaGlzIGRvZXNuJ3QgY2F0Y2ggZnVuY3Rpb25zIHdoZXJlIEVycm9yICoq
ZXJycCBpcyBub3QgdGhlIGxhc3QKcGFyYW1ldGVyLiAgU29tZSBleGFtcGxlcyAoc29tZSBvZiB3
aGljaCBtYXkgbmVlZCBpbmRlcGVuZGVudCB0d2Vha2luZwppbiB0aGVpciBvd24gcmlnaHQgZm9y
IGJlaW5nIGluY29uc2lzdGVudCwgYWx0aG91Z2ggd2UgRE8gd2FudCBlcnJwIHRvCmFwcGVhciBi
ZWZvcmUgYW55ICdmb3JtYXQsIC4uLicgYXJndW1lbnRzKToKCmJsb2NrL3NzaC5jOnNmdHBfZXJy
b3Jfc2V0ZyhFcnJvciAqKmVycnAsIEJEUlZTU0hTdGF0ZSAqcywgY29uc3QgY2hhcgoqZnMsIC4u
LikKZXhlYy5jOnN0YXRpYyB2b2lkIHJhbV9ibG9ja19hZGQoUkFNQmxvY2sgKm5ld19ibG9jaywg
RXJyb3IgKiplcnJwLCBib29sCnNoYXJlZCkKCkRvZXMgcnVubmluZyB0aGlzIENvY2NpbmVsbGUg
c2NyaXB0IDIgdGltZXMgaW4gYSByb3cgYWRkIGEgc2Vjb25kCkVSUlBfRlVOQ1RJT05fQkVHSU4o
KSBsaW5lPyAgV2Ugd2FudCBpdCB0byBiZSBpZGVtcG90ZW50IChubyBjaGFuZ2VzIG9uCmEgc2Vj
b25kIHJ1bikuICAoQWRtaXR0ZWRseSwgSSBkaWQgbm90IGFjdHVhbGx5IHRlc3QgdGhhdCB5ZXQp
LiAgQWxzbywgSQpkb24ndCBrbm93IGlmIHRoaXMgY2FuIGJlIHR3ZWFrZWQgdG8gYXZvaWQgYWRk
aW5nIHRoZSBsaW5lIHRvIGEgZnVuY3Rpb24Kd2l0aCBhbiBlbXB0eSBib2R5LCBtYXliZToKCiBm
biguLi4sIEVycm9yICoqZXJycCwgLi4uKQogeworICAgIEVSUlBfRlVOQ1RJT05fQkVHSU4oKTsK
ICAgICAuLi4KIH0KCnRvIG9ubHkgYWRkIGl0IHRvIGEgZnVuY3Rpb24gdGhhdCBhbHJlYWR5IGhh
cyBhIGJvZHkgKHRoYW5rcyB0byB0aGUgLi4uKQotIGJ1dCBJJ20gZnV6enkgZW5vdWdoIG9uIENv
Y2NpbmVsbGUgdGhhdCBJIG1heSBiZSBzYXlpbmcgc29tZXRoaW5nCnRvdGFsbHkgd3JvbmcuCgo+
ICsKPiArQHJ1bGUxQAo+ICtpZGVudGlmaWVyIGZuOwo+ICtpZGVudGlmaWVyIGxvY2FsX2VycjsK
PiArQEAKPiArCj4gKyBmbiguLi4sIEVycm9yICoqZXJycCkKPiArIHsKPiArICAgICA8Li4uCj4g
Ky0gICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7Cj4gKyAgICAgLi4uPgo+ICsgfQo+ICsKPiAr
QEAKPiAraWRlbnRpZmllciBydWxlMS5mbjsKPiAraWRlbnRpZmllciBydWxlMS5sb2NhbF9lcnI7
Cj4gK2lkZW50aWZpZXIgb3V0Owo+ICtAQAo+ICsKPiArIGZuKC4uLikKPiArIHsKPiArICAgICA8
Li4uCj4gKy0gICAgZ290byBvdXQ7Cj4gKysgICAgcmV0dXJuOwo+ICsgICAgIC4uLj4KPiArLSBv
dXQ6Cj4gKy0gICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7Cj4gKyB9Cj4gKwo+
ICtAQAo+ICtpZGVudGlmaWVyIHJ1bGUxLmZuOwo+ICtpZGVudGlmaWVyIHJ1bGUxLmxvY2FsX2Vy
cjsKPiArQEAKPiArCj4gKyBmbiguLi4pCj4gKyB7Cj4gKyAgICAgPC4uLgo+ICsoCj4gKy0gICAg
ZXJyb3JfZnJlZShsb2NhbF9lcnIpOwo+ICstICAgIGxvY2FsX2VyciA9IE5VTEw7Cj4gKysgICAg
ZXJyb3JfZnJlZV9lcnJwKGVycnApOwo+ICt8Cj4gKy0gICAgZXJyb3JfZnJlZShsb2NhbF9lcnIp
Owo+ICsrICAgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsKPiArfAo+ICstICAgIGVycm9yX3JlcG9y
dF9lcnIobG9jYWxfZXJyKTsKPiArKyAgICBlcnJvcl9yZXBvcnRfZXJycChlcnJwKTsKPiArfAo+
ICstICAgIHdhcm5fcmVwb3J0X2Vycihsb2NhbF9lcnIpOwo+ICsrICAgIHdhcm5fcmVwb3J0X2Vy
cnAoZXJycCk7Cj4gK3wKPiArLSAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsK
PiArKQo+ICsgICAgIC4uLj4KPiArIH0KPiArCj4gK0BACj4gK2lkZW50aWZpZXIgcnVsZTEuZm47
Cj4gK2lkZW50aWZpZXIgcnVsZTEubG9jYWxfZXJyOwo+ICtAQAo+ICsKPiArIGZuKC4uLikKPiAr
IHsKPiArICAgICA8Li4uCj4gKygKPiArLSAgICAmbG9jYWxfZXJyCj4gKysgICAgZXJycAo+ICt8
Cj4gKy0gICAgbG9jYWxfZXJyCj4gKysgICAgKmVycnAKPiArKQo+ICsgICAgIC4uLj4KPiArIH0K
PiAKCk92ZXJhbGwsIHRoZSBzY3JpcHQgbWFrZXMgc2Vuc2UgaW4gbXkgcmVhZGluZyAoYnV0IG5v
IGlkZWEgaWYgaXQKYWN0dWFsbHkgY2F0Y2hlcyBldmVyeXRoaW5nIHdlIHdhbnQsIG9yIGlmIGl0
IG1pc3NlZCBzb21ldGhpbmcpLiAgQXQgYW55CnJhdGUsIG9uY2UgcGF0Y2ggNyBpcyBzcGxpdCBp
bnRvIG1vcmUgbWFuYWdlYWJsZSBjaHVua3MsIHdlIGNhbgpkZWZpbml0ZWx5IHNwb3QtY2hlY2sg
cmVzdWx0cyB0byBtYWtlIHN1cmUgdGhleSBhbGwgbG9vayByZWFzb25hYmxlLgoKLS0gCkVyaWMg
Qmxha2UsIFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAg
ICArMS05MTktMzAxLTMyMjYKVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3Jn
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
