Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C208D8BAC7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 15:52:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXBZ-0005lY-5m; Tue, 13 Aug 2019 13:50:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxXBX-0005lT-LX
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 13:49:59 +0000
X-Inumbo-ID: 3b68d4f8-bdd1-11e9-a05f-83833fdff891
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3b68d4f8-bdd1-11e9-a05f-83833fdff891;
 Tue, 13 Aug 2019 13:49:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E563344;
 Tue, 13 Aug 2019 06:49:55 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1655B3F694;
 Tue, 13 Aug 2019 06:49:53 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-6-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <90352292-9218-e682-dd8a-4cf66c0d5c60@arm.com>
Date: Tue, 13 Aug 2019 14:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564763985-20312-6-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 5/6] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gOC8yLzE5IDU6MzkgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdy
b3RlOgo+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0Bl
cGFtLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgbmV3IGlvbW11X2FkZF9kdF9kZXZpY2UgQVBJ
IGZvciBhZGRpbmcgRFQgZGV2aWNlCj4gdG8gdGhlIElPTU1VIHVzaW5nIGdlbmVyaWMgSU9NTVUg
RFQgYmluZGluZyBbMV0gYW5kIHByZXZpb3VzbHkKPiBhZGRlZCAiaW9tbXVfZndzcGVjIiBzdXBw
b3J0Lgo+IAo+IE5ldyBmdW5jdGlvbiBwYXJzZXMgdGhlIERUIGJpbmRpbmcsIHByZXBhcmVzICJk
ZXYtPmlvbW11X2Z3c3BlYyIKPiB3aXRoIGNvcnJlY3QgaW5mb3JtYXRpb24gYW5kIGNhbGxzIHRo
ZSBJT01NVSBkcml2ZXIgdXNpbmcgImFkZF9kZXZpY2UiCj4gY2FsbGJhY2sgdG8gcmVnaXN0ZXIg
bmV3IERUIGRldmljZS4KPiBUaGUgSU9NTVUgZHJpdmVyJ3MgcmVzcG9uc2liaWxpdHkgaXMgdG8g
Y2hlY2sgd2hldGhlciAiZGV2LT5pb21tdV9md3NwZWMiCj4gaXMgaW5pdGlhbGl6ZWQgYW5kIG1h
cmsgdGhhdCBkZXZpY2UgYXMgcHJvdGVjdGVkLgo+IAo+IFRoZSBhZGRpdGlvbmFsIGJlbmVmaXQg
aGVyZSBpcyB0byBhdm9pZCB0byBnbyB0aHJvdWdoIHRoZSB3aG9sZSBEVAo+IG11bHRpcGxlIHRp
bWVzIGluIElPTU1VIGRyaXZlciB0cnlpbmcgdG8gbG9jYXRlIG1hc3RlciBkZXZpY2VzIHdoaWNo
Cj4gYmVsb25nIHRvIGVhY2ggSU9NTVUgZGV2aWNlIGJlaW5nIHByb2JlZC4KPiAKPiBUaGUgdXBj
b21pbmcgSVBNTVUgZHJpdmVyIHdpbGwgaGF2ZSAiYWRkX2RldmljZSIgY2FsbGJhY2sgaW1wbGVt
ZW50ZWQuCj4gCj4gSSBob3BlLCB0aGlzIHBhdGNoIHdvbid0IGJyZWFrIFNNTVUgZHJpdmVyJ3Mg
ZnVuY3Rpb25hbGl0eSwKPiB3aGljaCBkb2Vzbid0IGhhdmUgdGhpcyBjYWxsYmFjayBpbXBsZW1l
bnRlZC4KClRoZSBsYXN0IHR3byBzZW50ZW5jZSBkb2VzIG5vdCByZWFsbHkgYmVsb25nIHRvIHRo
ZSBjb21taXQgbWVzc2FnZS4gU28gSSAKdGhpbmsgdGhleSBzaG91bGQgZ28gYWZ0ZXIgLS0tLgoK
QW55d2F5LCB0aGUgb25seSBjb25jZXJuIGZvciB0aGUgU01NVSBpcyB0byBub3QgYnJlYWsgdGhl
IG9sZCBiaW5kaW5ncy4gCk5ldyBiaW5kaW5ncyBhcmUgbm90IHN1cHBvcnRlZCwgc28gaXQgZG9l
cyBub3QgbWF0dGVyIHdoZXRoZXIgdGhleSBhcmUgCmJyb2tlbiBvciBub3QuIE9uY2UgdGhpcyBz
ZXJpZXMgaXMgbWVyZ2VkLCB3ZSBjYW4gaGF2ZSBhIGxvb2sgaG93IG5ldyAKYmluZGluZ3MgZm9y
IHRoZSBTTU1VIGNhbiBiZSBzdXBwb3J0ZWQuCgo+IAo+IFsxXSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvaW9tbXUudHh0
Cj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNo
Y2hlbmtvQGVwYW0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAg
ICAgICAgfCAxMiArKysrKysrKysrCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9t
bXUuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIHhlbi9p
bmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgICAgIHwgIDMgKysrCj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDYwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggZDk4MzY3Ny4u
ZDY3ZjdkNCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTI0MSw2ICsxMjQxLDE4IEBAIHN0
YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGR0
X2RldmljZV9ub2RlICpkZXYsCj4gICAgICAgdTY0IGFkZHIsIHNpemU7Cj4gICAgICAgYm9vbCBu
ZWVkX21hcHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNzdGhyb3VnaChkZXYpOwo+ICAgCj4gKyAg
ICBpZiAoIGR0X3BhcnNlX3BoYW5kbGUoZGV2LCAiaW9tbXVzIiwgMCkgKQoKSSBkb24ndCBwYXJ0
aWN1bGFybHkgbGlrZSB0aGlzIGNoZWNrLiBkdF9wYXJzZV9waGFuZGxlIGlzIG5vbi10cml2aWFs
IHRvIApleGVjdXRlLgoKVEJILCB3aGF0IHdlIHNob3VsZCBkbyBpcyB0cnlpbmcgdG8gY2FsbCBp
b21tdV9hZGRfZHRfZGV2aWNlIGlmIElPTU1VIGlzIAplbmFibGVkLiBXZSBjYW4gdGhlbiByZXR1
cm4gYSByZWNvZ25pemFibGUgdmFsdWUgdG8gdGVsbCB0aGUgZGV2aWNlIGlzIApub3QgcHJvdGVj
dGVkLgoKPiArICAgIHsKPiArICAgICAgICBkdF9kcHJpbnRrKCIlcyBhZGQgdG8gaW9tbXVcbiIs
IGR0X25vZGVfZnVsbF9uYW1lKGRldikpOwo+ICsgICAgICAgIHJlcyA9IGlvbW11X2FkZF9kdF9k
ZXZpY2UoZGV2KTsKPiArICAgICAgICBpZiAoIHJlcyApCj4gKyAgICAgICAgewo+ICsgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUiAiRmFpbGVkIHRvIGFkZCAlcyB0byB0aGUgSU9NTVVcbiIs
Cj4gKyAgICAgICAgICAgICAgICAgICBkdF9ub2RlX2Z1bGxfbmFtZShkZXYpKTsKPiArICAgICAg
ICAgICAgcmV0dXJuIHJlczsKPiArICAgICAgICB9Cj4gKyAgICB9Cj4gKwo+ICAgICAgIG5pcnEg
PSBkdF9udW1iZXJfb2ZfaXJxKGRldik7Cj4gICAgICAgbmFkZHIgPSBkdF9udW1iZXJfb2ZfYWRk
cmVzcyhkZXYpOwo+ICAgCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPiBpbmRleCAz
MTk1OTE5Li4xOTUxNmFmIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPiBA
QCAtMTEzLDMgKzExMyw0OCBAQCBpbnQgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKHN0
cnVjdCBkb21haW4gKmQpCj4gICB2b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11X2h3ZG9tX2lu
aXQoc3RydWN0IGRvbWFpbiAqZCkKPiAgIHsKPiAgIH0KPiArCj4gK2ludCBfX2luaXQgaW9tbXVf
YWRkX2R0X2RldmljZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQo+ICt7Cj4gKyAgICBjb25z
dCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMgPSBpb21tdV9nZXRfb3BzKCk7Cj4gKyAgICBzdHJ1Y3Qg
ZHRfcGhhbmRsZV9hcmdzIGlvbW11X3NwZWM7Cj4gKyAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBk
dF90b19kZXYobnApOwo+ICsgICAgaW50IHJjID0gMSwgaW5kZXggPSAwOwo+ICsKPiArICAgIGlm
ICggIWlvbW11X2VuYWJsZWQgfHwgIW9wcyB8fCAhb3BzLT5hZGRfZGV2aWNlICkKPiArICAgICAg
ICByZXR1cm4gMDsKCldoaWxlIEkgYWdyZWUgdGhhdCAhaW9tbXVfZW5hYmxlZCBzaG91bGQgcmV0
dXJuIDAsIGZvciB0aGUgdHdvIG90aGVycyBJIAphbSBub3QgZW50aXJlbHkgc3VyZSB0aGlzIGlz
IHRoZSByaWdodCB0aGluZyB0byBkby4KCiFvcHMgaXMgZGVmaW5pdGVseSBhbiBlcnJvciBiZWNh
dXNlIGlmIHlvdSBoYXZlIHRoZSBJT01NVSBlbmFibGVkIHRoZW4gCnlvdSBzaG91bGQgaGF2ZSBv
cHMgaW5zdGFsbGVkLgoKIW9wcy0+YWRkX2RldmljZSBtZWFucyB0aGF0IHlvdSB3aWxsIG5vdCBi
ZSBhYmxlIHRvIGFkZCBhbnkgZGV2aWNlIHVzaW5nIAp0aGUgbmV3IGJpbmRpbmdzLiBJT1csIHRo
ZSBkZXZpY2Ugd2lsbCBiZSB1bnVzYWJsZSBsYXRlciBvbmUgYXMgbW9zdCAKbGlrZWx5IHRoZSBJ
T01NVSB3YXMgY29uZmlndXJlZCB0byBkZW55IGFueSB0cmFuc2FjdGlvbi4gVGhlcmVmb3JlLCB0
aGlzIApzaG91bGQgcmV0dXJuIGFuIGVycm9yLgoKPiArCj4gKyAgICBpZiAoIGRldl9pb21tdV9m
d3NwZWNfZ2V0KGRldikgKQo+ICsgICAgICAgIHJldHVybiAtRUVYSVNUOwo+ICsKPiArICAgIC8q
IEFjY29yZGluZyB0byB0aGUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L2lvbW11LnR4dCAqLwoKVGhpcyBmaWxlIGRvZXMgbm90IGV4aXN0IGluIFhlbiwgc28gTGludXgg
c2hvdWxkIGF0IGxlYXN0IGJlIG1lbnRpb25lZCAKaW4gdGhlIGNvbW1lbnQuCgo+ICsgICAgd2hp
bGUgKCAhZHRfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MobnAsICJpb21tdXMiLCAiI2lvbW11LWNl
bGxzIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4LCAm
aW9tbXVfc3BlYykgKQo+ICsgICAgewo+ICsgICAgICAgIGlmICggIWR0X2RldmljZV9pc19hdmFp
bGFibGUoaW9tbXVfc3BlYy5ucCkgKQo+ICsgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAg
ICAgcmMgPSBpb21tdV9md3NwZWNfaW5pdChkZXYsICZpb21tdV9zcGVjLm5wLT5kZXYpOwo+ICsg
ICAgICAgIGlmICggcmMgKQo+ICsgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICAgcmMg
PSBpb21tdV9md3NwZWNfYWRkX2lkcyhkZXYsIGlvbW11X3NwZWMuYXJncywgMSk7CgpIZXJlIHlv
dSBhc3N1bWUgdGhhdCB0aGVyZSB3aWxsIGF0IGxlYXN0IGFsd2F5cyBiZSBvbmUgY2VsbHMgYW5k
IHRoZSAKZmlyc3QgY2VsbCBpcyB0aGUgSURzLiBGb3IgYSBmaXJzdCwgI2lvbW11LWNlbGxzIG1h
eSBiZSAwIChhbmQgdGhlcmVmb3JlIApubyBjZWxscykgd2hlbiB0aGUgbWFzdGVyIElPTU1VIGRl
dmljZSBjYW5ub3QgYmUgY29uZmlndXJlZC4KCkZ1cnRoZXJtb3JlLCB0aGUgY29udGVudCBvZiB0
aGUgI2lvbW11LWNlbGxzIGRlcGVuZHMgb24gdGhlIGRyaXZlci4gVGhpcyAKaXMgd2h5IExpbnV4
IHByb3ZpZGVzIGEgY2FsbGJhY2sgb2ZfeGxhdGUgdG8gbGV0IHRoZSBkcml2ZXIgZGVjaWRlIGhv
dyAKdG8gaW50ZXJwcmV0IGl0LgoKRm9yIGluc3RhbmNlLCB0aGUgU01NVSBjYW4gc3VwcG9ydCBl
aXRoZXIgMSBvciAyIGNlbGxzLiBJdCBhbHNvIG1heSBuZWVkIAp0byBsb29rLXVwIGZvciBvdGhl
ciBwcm9wZXJ0aWVzIGluIHRoZSBub2RlIChlLmcgc3RyZWFtLW1hdGNoLW1hc2spLgoKU28gSSB0
aGluayB3ZSBhbHNvIHdhbnQgdG8gcHJvdmlkZSB0aGUgb2ZfeGxhdGUgaW4gWGVuLgoKPiArICAg
ICAgICBpZiAoIHJjICkKPiArICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgIGluZGV4
Kys7Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIEFkZCBEVCBkZXZpY2UgdG8gdGhl
IElPTU1VIGlmIGxhdHRlciBpcyBwcmVzZW50IGFuZCBhdmFpbGFibGUuCj4gKyAgICAgKiBUaGUg
SU9NTVUgZHJpdmVyJ3MgcmVzcG9uc2liaWxpdHkgaXMgdG8gY2hlY2sgd2hldGhlciBkZXYtPmlv
bW11X2Z3c3BlYwo+ICsgICAgICogZmllbGQgaXMgaW5pdGlhbGl6ZWQgYW5kIG1hcmsgdGhhdCBk
ZXZpY2UgYXMgcHJvdGVjdGVkLgo+ICsgICAgICovCj4gKyAgICBpZiAoICFyYyApCj4gKyAgICAg
ICAgcmMgPSBvcHMtPmFkZF9kZXZpY2UoMCwgZGV2KTsKPiArCj4gKyAgICBpZiAoIHJjIDwgMCAp
Cj4gKyAgICAgICAgaW9tbXVfZndzcGVjX2ZyZWUoZGV2KTsKPiArCj4gKyAgICByZXR1cm4gcmMg
PCAwID8gcmMgOiAwOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9t
bXUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaAo+IGluZGV4IDE4NTNiZDkuLjA2YjA3
ZmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCj4gQEAgLTI4LDYgKzI4LDkgQEAgc3RydWN0IGFyY2hf
aW9tbXUKPiAgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X2dldF9vcHModm9pZCk7Cj4g
ICB2b2lkIGlvbW11X3NldF9vcHMoY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzKTsKPiAgIAo+
ICsvKiBoZWxwZXIgdG8gYWRkIERUIGRldmljZSB0byB0aGUgSU9NTVUgKi8KPiAraW50IGlvbW11
X2FkZF9kdF9kZXZpY2Uoc3RydWN0IGR0X2RldmljZV9ub2RlICpucCk7Cj4gKwo+ICAgLyogbWFw
cGluZyBoZWxwZXJzICovCj4gICBpbnQgX19tdXN0X2NoZWNrIGFybV9pb21tdV9tYXBfcGFnZShz
dHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sIG1mbl90IG1mbiwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncywKPiAKCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
