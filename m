Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F85AD446
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 09:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7EVa-0007OR-K0; Mon, 09 Sep 2019 07:54:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+u6x=XE=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1i7EVZ-0007O6-FL
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 07:54:45 +0000
X-Inumbo-ID: 1523b216-d2d7-11e9-978d-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1523b216-d2d7-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 07:54:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FD6B18CB8EA;
 Mon,  9 Sep 2019 07:54:42 +0000 (UTC)
Received: from [10.36.116.173] (ovpn-116-173.ams2.redhat.com [10.36.116.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A24FA10013D9;
 Mon,  9 Sep 2019 07:54:38 +0000 (UTC)
To: Souptick Joarder <jrdr.linux@gmail.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, sashal@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 akpm@linux-foundation.org, osalvador@suse.com, mhocko@suse.com,
 pasha.tatashin@soleen.com, dan.j.williams@intel.com,
 richard.weiyang@gmail.com, cai@lca.pw
References: <cover.1567889743.git.jrdr.linux@gmail.com>
 <9afe6c5a18158f3884a6b302ac2c772f3da49ccc.1567889743.git.jrdr.linux@gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <36e4a98c-29da-9319-ccb1-a90f378250c6@redhat.com>
Date: Mon, 9 Sep 2019 09:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9afe6c5a18158f3884a6b302ac2c772f3da49ccc.1567889743.git.jrdr.linux@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 09 Sep 2019 07:54:42 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH 3/3] mm/memory_hotplug.c: Remove
 __online_page_set_limits()
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
Cc: xen-devel@lists.xenproject.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDkuMTkgMjM6NDcsIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gQXMgYm90aCB0aGUg
Y2FsbGVycyBvZiB0aGlzIGR1bW15IF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygpCj4gaXMgcmVt
b3ZlZCwgdGhpcyBjYW4gYmUgcmVtb3ZlZCBwZXJtYW5lbnRseS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiAtLS0KPiAgaW5jbHVk
ZS9saW51eC9tZW1vcnlfaG90cGx1Zy5oIHwgMSAtCj4gIG1tL21lbW9yeV9ob3RwbHVnLmMgICAg
ICAgICAgICB8IDUgLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmggYi9pbmNsdWRlL2xp
bnV4L21lbW9yeV9ob3RwbHVnLmgKPiBpbmRleCBmNDZlYTcxLi44ZWUzYTJhIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgv
bWVtb3J5X2hvdHBsdWcuaAo+IEBAIC0xMDUsNyArMTA1LDYgQEAgZXh0ZXJuIHVuc2lnbmVkIGxv
bmcgX19vZmZsaW5lX2lzb2xhdGVkX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAo+ICBl
eHRlcm4gaW50IHNldF9vbmxpbmVfcGFnZV9jYWxsYmFjayhvbmxpbmVfcGFnZV9jYWxsYmFja190
IGNhbGxiYWNrKTsKPiAgZXh0ZXJuIGludCByZXN0b3JlX29ubGluZV9wYWdlX2NhbGxiYWNrKG9u
bGluZV9wYWdlX2NhbGxiYWNrX3QgY2FsbGJhY2spOwo+ICAKPiAtZXh0ZXJuIHZvaWQgX19vbmxp
bmVfcGFnZV9zZXRfbGltaXRzKHN0cnVjdCBwYWdlICpwYWdlKTsKPiAgZXh0ZXJuIHZvaWQgX19v
bmxpbmVfcGFnZV9pbmNyZW1lbnRfY291bnRlcnMoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+ICBleHRl
cm4gdm9pZCBfX29ubGluZV9wYWdlX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+ICAKPiBkaWZm
IC0tZ2l0IGEvbW0vbWVtb3J5X2hvdHBsdWcuYyBiL21tL21lbW9yeV9ob3RwbHVnLmMKPiBpbmRl
eCBjNzNmMDk5Li5kYzAxMThmIDEwMDY0NAo+IC0tLSBhL21tL21lbW9yeV9ob3RwbHVnLmMKPiAr
KysgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCj4gQEAgLTYwNCwxMSArNjA0LDYgQEAgaW50IHJlc3Rv
cmVfb25saW5lX3BhZ2VfY2FsbGJhY2sob25saW5lX3BhZ2VfY2FsbGJhY2tfdCBjYWxsYmFjaykK
PiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChyZXN0b3JlX29ubGluZV9wYWdlX2NhbGxiYWNrKTsK
PiAgCj4gLXZvaWQgX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKHN0cnVjdCBwYWdlICpwYWdlKQo+
IC17Cj4gLX0KPiAtRVhQT1JUX1NZTUJPTF9HUEwoX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKTsK
PiAtCj4gIHZvaWQgX19vbmxpbmVfcGFnZV9pbmNyZW1lbnRfY291bnRlcnMoc3RydWN0IHBhZ2Ug
KnBhZ2UpCj4gIHsKPiAgCWFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQocGFnZSwgMSk7Cj4gClJl
dmlld2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KCi0tIAoKVGhh
bmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
