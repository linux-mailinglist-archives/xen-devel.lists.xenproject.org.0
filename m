Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13830D86
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 13:50:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWg1o-0000Kq-Th; Fri, 31 May 2019 11:48:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWg1n-0000Kj-Nj
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:48:55 +0000
X-Inumbo-ID: 1022422e-839a-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1022422e-839a-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 11:48:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 845C9AD4E;
 Fri, 31 May 2019 11:48:52 +0000 (UTC)
To: Nadav Amit <namit@vmware.com>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>
References: <20190531063645.4697-1-namit@vmware.com>
 <20190531063645.4697-5-namit@vmware.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a847ee9c-4faf-c8b4-43bb-cc30e0980796@suse.com>
Date: Fri, 31 May 2019 13:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531063645.4697-5-namit@vmware.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH v2 04/12] x86/mm/tlb: Flush remote and
 local TLBs concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Dave Hansen <dave.hansen@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAwODozNiwgTmFkYXYgQW1pdCB3cm90ZToKPiBUbyBpbXByb3ZlIFRMQiBz
aG9vdGRvd24gcGVyZm9ybWFuY2UsIGZsdXNoIHRoZSByZW1vdGUgYW5kIGxvY2FsIFRMQnMKPiBj
b25jdXJyZW50bHkuIEludHJvZHVjZSBmbHVzaF90bGJfbXVsdGkoKSB0aGF0IGRvZXMgc28uIFRo
ZSBjdXJyZW50Cj4gZmx1c2hfdGxiX290aGVycygpIGludGVyZmFjZSBpcyBrZXB0LCBzaW5jZSBw
YXJhdmlydHVhbCBpbnRlcmZhY2VzIG5lZWQKPiB0byBiZSBhZGFwdGVkIGZpcnN0IGJlZm9yZSBp
dCBjYW4gYmUgcmVtb3ZlZC4gVGhpcyBpcyBsZWZ0IGZvciBmdXR1cmUKPiB3b3JrLiBJbiBzdWNo
IFBWIGVudmlyb25tZW50cywgVExCIGZsdXNoZXMgYXJlIG5vdCBwZXJmb3JtZWQsIGF0IHRoaXMK
PiB0aW1lLCBjb25jdXJyZW50bHkuCj4gCj4gQWRkIGEgc3RhdGljIGtleSB0byB0ZWxsIHdoZXRo
ZXIgdGhpcyBuZXcgaW50ZXJmYWNlIGlzIHN1cHBvcnRlZC4KPiAKPiBDYzogIksuIFkuIFNyaW5p
dmFzYW4iIDxreXNAbWljcm9zb2Z0LmNvbT4KPiBDYzogSGFpeWFuZyBaaGFuZyA8aGFpeWFuZ3pA
bWljcm9zb2Z0LmNvbT4KPiBDYzogU3RlcGhlbiBIZW1taW5nZXIgPHN0aGVtbWluQG1pY3Jvc29m
dC5jb20+Cj4gQ2M6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0By
ZWRoYXQuY29tPgo+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiBDYzogeDg2
QGtlcm5lbC5vcmcKPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENjOiBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IENjOiBEYXZlIEhhbnNlbiA8ZGF2
ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+IENjOiBBbmR5IEx1dG9taXJza2kgPGx1dG9Aa2Vy
bmVsLm9yZz4KPiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IENj
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENjOiBsaW51
eC1oeXBlcnZAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKPiBDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKPiBDYzog
a3ZtQHZnZXIua2VybmVsLm9yZwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPgo+IC0tLQo+ICBh
cmNoL3g4Ni9oeXBlcnYvbW11LmMgICAgICAgICAgICAgICAgIHwgIDIgKwo+ICBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS9wYXJhdmlydC5oICAgICAgIHwgIDggKysrCj4gIGFyY2gveDg2L2luY2x1ZGUv
YXNtL3BhcmF2aXJ0X3R5cGVzLmggfCAgNiArKwo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJm
bHVzaC5oICAgICAgIHwgIDYgKysKPiAgYXJjaC94ODYva2VybmVsL2t2bS5jICAgICAgICAgICAg
ICAgICB8ICAxICsKPiAgYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAgICB8ICAz
ICsKPiAgYXJjaC94ODYvbW0vdGxiLmMgICAgICAgICAgICAgICAgICAgICB8IDgwICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLQo+ICBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgICAgICAgICAgICAg
ICAgIHwgIDIgKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9oeXBlcnYvbW11LmMgYi9hcmNoL3g4
Ni9oeXBlcnYvbW11LmMKPiBpbmRleCBlNjVkN2ZlNjQ4OWYuLmNhMjhiNDAwYzg3YyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3g4Ni9oeXBlcnYvbW11LmMKPiArKysgYi9hcmNoL3g4Ni9oeXBlcnYvbW11
LmMKPiBAQCAtMjMzLDQgKzIzMyw2IEBAIHZvaWQgaHlwZXJ2X3NldHVwX21tdV9vcHModm9pZCkK
PiAgCXByX2luZm8oIlVzaW5nIGh5cGVyY2FsbCBmb3IgcmVtb3RlIFRMQiBmbHVzaFxuIik7Cj4g
IAlwdl9vcHMubW11LmZsdXNoX3RsYl9vdGhlcnMgPSBoeXBlcnZfZmx1c2hfdGxiX290aGVyczsK
PiAgCXB2X29wcy5tbXUudGxiX3JlbW92ZV90YWJsZSA9IHRsYl9yZW1vdmVfdGFibGU7Cj4gKwo+
ICsJc3RhdGljX2tleV9kaXNhYmxlKCZmbHVzaF90bGJfbXVsdGlfZW5hYmxlZC5rZXkpOwo+ICB9
Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggYi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wYXJhdmlydC5oCj4gaW5kZXggYzI1YzM4YTA1YzFjLi4xOTJiZTcyNTQ0
NTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaAo+ICsrKyBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgKPiBAQCAtNDcsNiArNDcsOCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgc2xvd19kb3duX2lvKHZvaWQpCj4gICNlbmRpZgo+ICB9Cj4gIAo+ICtE
RUNMQVJFX1NUQVRJQ19LRVlfVFJVRShmbHVzaF90bGJfbXVsdGlfZW5hYmxlZCk7Cj4gKwo+ICBz
dGF0aWMgaW5saW5lIHZvaWQgX19mbHVzaF90bGIodm9pZCkKPiAgewo+ICAJUFZPUF9WQ0FMTDAo
bW11LmZsdXNoX3RsYl91c2VyKTsKPiBAQCAtNjIsNiArNjQsMTIgQEAgc3RhdGljIGlubGluZSB2
b2lkIF9fZmx1c2hfdGxiX29uZV91c2VyKHVuc2lnbmVkIGxvbmcgYWRkcikKPiAgCVBWT1BfVkNB
TEwxKG1tdS5mbHVzaF90bGJfb25lX3VzZXIsIGFkZHIpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgZmx1c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAo+
ICsJCQkJICAgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKQo+ICt7Cj4gKwlQVk9Q
X1ZDQUxMMihtbXUuZmx1c2hfdGxiX211bHRpLCBjcHVtYXNrLCBpbmZvKTsKPiArfQo+ICsKPiAg
c3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3RydWN0IGNwdW1hc2sg
KmNwdW1hc2ssCj4gIAkJCQkgICAgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKQo+
ICB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmgg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oCj4gaW5kZXggOTQ2ZjhmMWYx
ZWZjLi4zYTE1NmU2M2M1N2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFy
YXZpcnRfdHlwZXMuaAo+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVz
LmgKPiBAQCAtMjExLDYgKzIxMSwxMiBAQCBzdHJ1Y3QgcHZfbW11X29wcyB7Cj4gIAl2b2lkICgq
Zmx1c2hfdGxiX3VzZXIpKHZvaWQpOwo+ICAJdm9pZCAoKmZsdXNoX3RsYl9rZXJuZWwpKHZvaWQp
Owo+ICAJdm9pZCAoKmZsdXNoX3RsYl9vbmVfdXNlcikodW5zaWduZWQgbG9uZyBhZGRyKTsKPiAr
CS8qCj4gKwkgKiBmbHVzaF90bGJfbXVsdGkoKSBpcyB0aGUgcHJlZmVycmVkIGludGVyZmFjZS4g
V2hlbiBpdCBpcyB1c2VkLAo+ICsJICogZmx1c2hfdGxiX290aGVycygpIHNob3VsZCByZXR1cm4g
ZmFsc2UuCgpEaWRuJ3QgeW91IHdhbnQgdG8gcmVtb3ZlL2NoYW5nZSB0aGlzIGNvbW1lbnQ/CgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
