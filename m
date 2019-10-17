Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67797DB150
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7tA-0005Bs-9s; Thu, 17 Oct 2019 15:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yLKJ=YK=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1iL7t9-0005Bn-3j
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:40:31 +0000
X-Inumbo-ID: 724d6500-f0f4-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 724d6500-f0f4-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 15:40:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C38CEC05975D;
 Thu, 17 Oct 2019 15:40:28 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7DB55D713;
 Thu, 17 Oct 2019 15:40:18 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-3-philmd@redhat.com>
 <1e8c724b-8846-255a-eace-6bf135471566@redhat.com>
 <1e1bffc6-a7cc-5beb-3f9f-da8e644c8d4b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <2c9215bc-8b8e-3419-cef7-62e91139fcca@redhat.com>
Date: Thu, 17 Oct 2019 17:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e1bffc6-a7cc-5beb-3f9f-da8e644c8d4b@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 17 Oct 2019 15:40:28 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH 02/32] hw/i386/pc: Move kvm_i8259_init()
 declaration to sysemu/kvm.h
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMTAvMjAxOSAxNy4zMSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gT24g
MTAvMTcvMTkgNTowNCBQTSwgVGhvbWFzIEh1dGggd3JvdGU6Cj4+IE9uIDE1LzEwLzIwMTkgMTgu
MjYsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pj4gTW92ZSB0aGUgS1ZNLXJlbGF0
ZWQgY2FsbCB0byAic3lzZW11L2t2bS5oIi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+IMKgIGluY2x1
ZGUvaHcvaTM4Ni9wYy5oIHwgMSAtCj4+PiDCoCBpbmNsdWRlL3N5c2VtdS9rdm0uaCB8IDEgKwo+
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9w
Yy5oCj4+PiBpbmRleCA2ZGY0ZjRiNmZiLi4wOWU3NGU3NzY0IDEwMDY0NAo+Pj4gLS0tIGEvaW5j
bHVkZS9ody9pMzg2L3BjLmgKPj4+ICsrKyBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCj4+PiBAQCAt
MTU4LDcgKzE1OCw2IEBAIHR5cGVkZWYgc3RydWN0IFBDTWFjaGluZUNsYXNzIHsKPj4+IMKgIMKg
IGV4dGVybiBEZXZpY2VTdGF0ZSAqaXNhX3BpYzsKPj4+IMKgIHFlbXVfaXJxICppODI1OV9pbml0
KElTQUJ1cyAqYnVzLCBxZW11X2lycSBwYXJlbnRfaXJxKTsKPj4+IC1xZW11X2lycSAqa3ZtX2k4
MjU5X2luaXQoSVNBQnVzICpidXMpOwo+Pj4gwqAgaW50IHBpY19yZWFkX2lycShEZXZpY2VTdGF0
ZSAqZCk7Cj4+PiDCoCBpbnQgcGljX2dldF9vdXRwdXQoRGV2aWNlU3RhdGUgKmQpOwo+Pj4gwqAg
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3lzZW11L2t2bS5oIGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgK
Pj4+IGluZGV4IDlkMTQzMjgyYmMuLmRhOGFhOWY1YTggMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRl
L3N5c2VtdS9rdm0uaAo+Pj4gKysrIGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgKPj4+IEBAIC01MTMs
NiArNTEzLDcgQEAgdm9pZCBrdm1faXJxY2hpcF9zZXRfcWVtdWlycV9nc2koS1ZNU3RhdGUgKnMs
Cj4+PiBxZW11X2lycSBpcnEsIGludCBnc2kpOwo+Pj4gwqAgdm9pZCBrdm1fcGNfZ3NpX2hhbmRs
ZXIodm9pZCAqb3BhcXVlLCBpbnQgbiwgaW50IGxldmVsKTsKPj4+IMKgIHZvaWQga3ZtX3BjX3Nl
dHVwX2lycV9yb3V0aW5nKGJvb2wgcGNpX2VuYWJsZWQpOwo+Pj4gwqAgdm9pZCBrdm1faW5pdF9p
cnFfcm91dGluZyhLVk1TdGF0ZSAqcyk7Cj4+PiArcWVtdV9pcnEgKmt2bV9pODI1OV9pbml0KElT
QUJ1cyAqYnVzKTsKPj4KPj4gV2h5PyBUaGUgZnVuY3Rpb24gaXMgZGVmaW5lZCBpbiBody9pMzg2
L2t2bS8gLSBzbyBtb3ZpbmcgaXRzIHByb3RvdHlwZQo+PiB0byBhIGdlbmVyaWMgaGVhZGVyIHNv
dW5kcyB3cm9uZyB0byBtZS4KPiAKPiBUaGlzIGZ1bmN0aW9uIGlzIGRlY2xhcmVkIHdoZW4gY29t
cGlsaW5nIHdpdGhvdXQgS1ZNLCBhbmQgaXMgYXZhaWxhYmxlCj4gb24gdGhlIEFscGhhL0hQUEEv
TUlQUyB3aGljaCBkb24ndCBoYXZlIGl0LgoKU29ycnksIEkgZmFpbGVkIHRvIHBhcnNlIHlvdXIg
bGFzdCBzZW50ZW5jZS4gSXQncyBvbmx5IHVzZWQgYnkgaHcvaTM4Ngpjb2RlIGFzIGZhciBhcyBJ
IGNhbiBzZWUuCgo+IFlvdSdkIHJhdGhlciBtb3ZlIHRoZSBrdm1fcGNfKiBkZWNsYXJhdGlvbnMg
dG8gaHcvaTM4Ni9rdm0vPwoKTWF5YmUsIGJ1dCB0aGF0J3MgY2VydGFpbmx5IHNvbWV0aGluZyBm
b3IgYSBkaWZmZXJlbnQgcGF0Y2ggc2VyaWVzLgoKVGhpcyBzZXJpZXMgaGVyZSBzaG91bGQgZm9j
dXMgb24gd2hhdCB5b3UndmUgbWVudGlvbmVkIGluIHRoZSBjb3ZlcgpsZXR0ZXIsIEkgdGhpbmsu
IEl0J3MgYWxyZWFkeSBiaWcgZW5vdWdoLgoKIFRob21hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
