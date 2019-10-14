Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2BD6800
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 19:08:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3lM-0008CG-Jy; Mon, 14 Oct 2019 17:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=laoO=YH=redhat.com=jsnow@srs-us1.protection.inumbo.net>)
 id 1iK3lK-0008CB-IY
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 17:04:02 +0000
X-Inumbo-ID: 9ed48ad8-eea4-11e9-9384-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ed48ad8-eea4-11e9-9384-12813bfff9fa;
 Mon, 14 Oct 2019 17:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7318C80167A;
 Mon, 14 Oct 2019 17:04:01 +0000 (UTC)
Received: from [10.18.17.152] (dhcp-17-152.bos.redhat.com [10.18.17.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E03C25DC1E;
 Mon, 14 Oct 2019 17:03:45 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191014142246.4538-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <11ede8ff-3914-153c-a46a-41034d431d57@redhat.com>
Date: Mon, 14 Oct 2019 13:03:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 17:04:01 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH 00/20] hw: Clean up hw/i386 headers (and few
 alpha/hppa)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8xNC8xOSAxMDoyMiBBTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4g
VGhpcyBpcyBhIGZvbGxvdy11cCBvZiBNYXJrdXMncyBjbGVhbnVwIHNlcmllczoKPiBUYW1lIGEg
ZmV3ICJ0b3VjaCB0aGlzLCByZWNvbXBpbGUgdGhlIHdvcmxkIgo+IGh0dHBzOi8vd3d3Lm1haWwt
YXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3JnL21zZzYzNTc0OC5odG1sCj4gCj4gVGhp
cyBwYXJ0IGlzIG1vc3RseSByZXN0cmljdGVkIHRvIFg4NiwgYnV0IHNpbmNlIHNvbWUgZmlsZSBm
cm9tIHRoZQo+IEFscGhhL1BBLVJJU0MgbWFjaGluZXMgaW5jbHVkZSAiaHcvaTM4Ni9wYy5oIiBJ
IGhhZCB0byBmaXggdGhlbQo+IHRvby4KPiAKPiBFdmVudHVhbGx5IEknbGwgc3VjY2VlZCBhdCBy
ZW1vdmluZyBody9pMzg2LyBkZXBlbmRlbmN5IG9uIG5vbi1YODYKPiBwbGF0Zm9ybXMgKFF1ZXN0
IEkgc3RhcnRlZCAyIHllYXJzIGFnby4uLikuCj4gCj4gUmVnYXJkcywKPiAKPiBQaGlsLgo+IAo+
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgyMCk6Cj4gICB2bDogQWRkIG1pc3NpbmcgImh3L2Jv
YXJkcy5oIiBpbmNsdWRlCj4gICBody9zb3V0aGJyaWRnZS9pY2g5OiBSZW1vdmVkIHVudXNlZCBo
ZWFkZXJzCj4gICBody9pbnB1dC9wY2tiZDogUmVtb3ZlIHVudXNlZCAiaHcvaTM4Ni9wYy5oIiBo
ZWFkZXIKPiAgIGh3L2kzODYvaW9hcGljX2ludGVybmFsOiBSZW1vdmUgdW51c2VkICJody9pMzg2
L2lvYXBpYy5oIiBoZWFkZXIKPiAgIGh3L3RpbWVyOiBSZW1vdmUgdW51c2VkICJ1aS9jb25zb2xl
LmgiIGhlYWRlcgo+ICAgaHcvdXNiL2Rldi1zdG9yYWdlOiBSZW1vdmUgdW51c2VkICJ1aS9jb25z
b2xlLmgiIGhlYWRlcgo+ICAgaHcvaTM4Ni9pbnRlbF9pb21tdTogUmVtb3ZlIHVudXNlZCBpbmNs
dWRlcwo+ICAgaHcveGVuL3hlbl9wdF9sb2FkX3JvbTogUmVtb3ZlIHVudXNlZCBpbmNsdWRlcwo+
ICAgaHcvYWxwaGEvYWxwaGFfc3lzOiBSZW1vdmUgdW51c2VkICJody9pZGUuaCIgaGVhZGVyCj4g
ICBody9hbHBoYS9kcDI2NDogSW5jbHVkZSAibmV0L25ldC5oIgo+ICAgaHcvaHBwYS9tYWNoaW5l
OiBJbmNsdWRlICJuZXQvbmV0LmgiCj4gICBody9hY3BpL2NwdV9ob3RwbHVnOiBJbmNsdWRlICJo
dy9wY2kvcGNpLmgiCj4gICBody90aW1lci9ocGV0OiBJbmNsdWRlICJleGVjL2FkZHJlc3Mtc3Bh
Y2VzLmgiCj4gICBody9wY2ktaG9zdC9xMzU6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIKPiAgIGh3
L2kyYy9zbWJ1c19pY2g5OiBJbmNsdWRlICJxZW11L3JhbmdlLmgiCj4gICBody9wY2ktaG9zdC9w
aWl4OiBJbmNsdWRlICJxZW11L3JhbmdlLmgiCj4gICBody9hY3BpOiBJbmNsdWRlICJody9tZW0v
bnZkaW1tLmgiCj4gICBody9pMzg2OiBJbmNsdWRlICJody9tZW0vbnZkaW1tLmgiCj4gICBody9w
Y2ktaG9zdC9xMzU6IFJlbW92ZSB1bnVzZWQgaW5jbHVkZXMKPiAgIGh3L2kzODYvcGM6IENsZWFu
IHVwIGluY2x1ZGVzCj4gCj4gIGh3L2FjcGkvY3B1X2hvdHBsdWcuYyAgICAgICAgICAgICB8ICAx
ICsKPiAgaHcvYWNwaS9pY2g5LmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvYWNw
aS9waWl4NC5jICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBody9hbHBoYS9hbHBoYV9zeXMu
aCAgICAgICAgICAgICAgfCAgMSAtCj4gIGh3L2FscGhhL2RwMjY0LmMgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgaHcvaHBwYS9tYWNoaW5lLmMgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBo
dy9pMmMvc21idXNfaWNoOS5jICAgICAgICAgICAgICAgfCAgMSArCj4gIGh3L2kzODYvYWNwaS1i
dWlsZC5jICAgICAgICAgICAgICB8ICAxICsKPiAgaHcvaTM4Ni9wYy5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwo+ICBody9pMzg2L3BjX3BpaXguYyAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIGh3L2kzODYvcGNfcTM1LmMgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgaHcvaW5wdXQv
cGNrYmQuYyAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBody9pc2EvbHBjX2ljaDkuYyAgICAg
ICAgICAgICAgICAgfCAgMiAtLQo+ICBody9wY2ktaG9zdC9waWl4LmMgICAgICAgICAgICAgICAg
fCAgMSArCj4gIGh3L3BjaS1ob3N0L3EzNS5jICAgICAgICAgICAgICAgICB8ICAxICsKPiAgaHcv
dGltZXIvaHBldC5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvdGltZXIvdHdsOTIy
MzAuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICBody91c2IvZGV2LXN0b3JhZ2UuYyAgICAgICAg
ICAgICAgfCAgMSAtCj4gIGh3L3hlbi94ZW5fcHRfbG9hZF9yb20uYyAgICAgICAgICB8ICA0IC0t
LS0KPiAgaW5jbHVkZS9ody9pMzg2L2ljaDkuaCAgICAgICAgICAgIHwgIDEgLQo+ICBpbmNsdWRl
L2h3L2kzODYvaW50ZWxfaW9tbXUuaCAgICAgfCAgNCAtLS0tCj4gIGluY2x1ZGUvaHcvaTM4Ni9p
b2FwaWNfaW50ZXJuYWwuaCB8ICAxIC0KPiAgaW5jbHVkZS9ody9pMzg2L3BjLmggICAgICAgICAg
ICAgIHwgMTIgKysrLS0tLS0tLS0tCj4gIGluY2x1ZGUvaHcvcGNpLWhvc3QvcTM1LmggICAgICAg
ICB8ICA4ICstLS0tLS0tCj4gIHZsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgMjUgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0p
Cj4gCgpBY2tlZC1ieTogSm9obiBTbm93IDxqc25vd0ByZWRoYXQuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
