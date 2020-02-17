Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F866161407
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 14:56:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3gqX-00067B-Cf; Mon, 17 Feb 2020 13:54:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j3gqV-000676-Gb
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 13:53:59 +0000
X-Inumbo-ID: f1939296-518c-11ea-bfec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1939296-518c-11ea-bfec-12813bfff9fa;
 Mon, 17 Feb 2020 13:53:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0E38BAFA8;
 Mon, 17 Feb 2020 13:53:57 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E38023B.8090306@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4824cb1a-c920-e2be-c603-185c0bfdb66e@suse.com>
Date: Mon, 17 Feb 2020 14:53:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5E38023B.8090306@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMjoyMSwgV2VpIFh1IHdyb3RlOgo+IFBhcnNlIHRoZSBBQ1BJIFNQQ1Ig
dGFibGUgYW5kIGluaXRpYWxpemUgdGhlIDE2NTUwIGNvbXBhdGlibGUgc2VyaWFsIHBvcnQKPiBm
b3IgQVJNIG9ubHkuIEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQgb25lIFVBUlQgb24gQVJNLiBT
b21lIGZpZWxkcwo+IHdoaWNoIHdlIGRvIG5vdCBjYXJlIHlldCBvbiBBUk0gYXJlIGlnbm9yZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KPiAKPiAt
LS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gYWRkcmVzcyB0aGUgY29kZSBzdHlsZSBjb21tZW50cyBm
cm9tIEphbgo+IC0gdXNlIGNvbnRhaW5lcl9vZiB0byBkbyBjYXN0Cj4gLSBsaXN0IGFsbCBmaWVs
ZHMgd2UgaWdub3JlZAo+IC0gY2hlY2sgdGhlIGNvbnNvbGUgcmVkaXJlY3Rpb24gaXMgZGlzYWJs
ZWQgb3Igbm90IGJlZm9yZSBpbml0IHRoZSB1YXJ0Cj4gLSBpbml0IHRoZSB1YXJ0IGlvX3NpemUg
YW5kIHdpZHRoIHZpYSBzcGNyLT5zZXJpYWxfcG9ydAo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBp
bXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gLSByZW1vdmUgdGhlIHNwY3IgaW5pdGlhbGl6YXRpb24K
PiAtIGFkZCBjb21tZW50cyBmb3IgdGhlIHVhcnQgaW5pdGlhbGl6YXRpb24gYW5kIGNvbmZpZ3Vy
YXRpb24KPiAtIGFkanVzdCB0aGUgY29kZSBzdHlsZSBpc3N1ZQo+IC0gbGltaXQgdGhlIGNvZGUg
b25seSBidWlsdCBvbiBBQ1BJIGFuZCBBUk0KPiAtLS0KPiAgeGVuL2RyaXZlcnMvY2hhci9uczE2
NTUwLmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBp
bmRleCBhYTg3YzU3Li43NDFiNTEwIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMx
NjU1MC5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAtMTYyMCw2ICsx
NjIwLDgxIEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwgREVWSUNF
X1NFUklBTCkKPiAgRFRfREVWSUNFX0VORAo+IAo+ICAjZW5kaWYgLyogSEFTX0RFVklDRV9UUkVF
ICovCj4gKwo+ICsjaWYgZGVmaW5lZChDT05GSUdfQUNQSSkgJiYgZGVmaW5lZChDT05GSUdfQVJN
KQo+ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4KPiArCj4gK3N0YXRpYyBpbnQgX19pbml0IG5zMTY1
NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAqZGF0YSkKPiArewo+ICsgICAgc3RydWN0IGFj
cGlfdGFibGVfaGVhZGVyICp0YWJsZTsKPiArICAgIHN0cnVjdCBhY3BpX3RhYmxlX3NwY3IgKnNw
Y3I7Cj4gKyAgICBhY3BpX3N0YXR1cyBzdGF0dXM7Cj4gKyAgICAvKgo+ICsgICAgICogU2FtZSBh
cyB0aGUgRFQgcGFydC4KPiArICAgICAqIE9ubHkgc3VwcG9ydCBvbmUgVUFSVCBvbiBBUk0gd2hp
Y2ggaGFwcGVuIHRvIGJlIG5zMTY1NTBfY29tWzBdLgo+ICsgICAgICovCj4gKyAgICBzdHJ1Y3Qg
bnMxNjU1MCAqdWFydCA9ICZuczE2NTUwX2NvbVswXTsKPiArCj4gKyAgICBzdGF0dXMgPSBhY3Bp
X2dldF90YWJsZShBQ1BJX1NJR19TUENSLCAwLCAmdGFibGUpOwo+ICsgICAgaWYgKCBBQ1BJX0ZB
SUxVUkUoc3RhdHVzKSApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWls
ZWQgdG8gZ2V0IFNQQ1IgdGFibGVcbiIpOwo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsg
ICAgfQo+ICsKPiArICAgIHNwY3IgPSBjb250YWluZXJfb2YodGFibGUsIHN0cnVjdCBhY3BpX3Rh
YmxlX3NwY3IsIGhlYWRlcik7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFRoZSBzZXJpYWwgcG9y
dCBhZGRyZXNzIG1heSBiZSAwIGZvciBleGFtcGxlCj4gKyAgICAgKiBpZiB0aGUgY29uc29sZSBy
ZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4KPiArICAgICAqLwo+ICsgICAgaWYgKCB1bmxpa2VseSgh
c3Bjci0+c2VyaWFsX3BvcnQuYWRkcmVzcykgKQo+ICsgICAgewo+ICsgICAgICAgIHByaW50aygi
bnMxNjU1MDogdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3MgaXMgaW52YWxpZFxuIik7CgpJcyB6ZXJv
IHJlYWxseSBhbiBpbnZhbGlkIGFkZHJlc3MsIG9yIGlzIGl0IHJhdGhlciBhIHByb3BlcgppbmRp
Y2F0b3Igb2YgdGhlcmUgbm90IGJlaW5nIGFueSBkZXZpY2U/Cgo+ICsgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ICsgICAgfQo+ICsKPiArICAgIG5zMTY1NTBfaW5pdF9jb21tb24odWFydCk7Cj4g
Kwo+ICsgICAgLyoKPiArICAgICAqIFRoZSBiYXVkIHJhdGUgaXMgcHJlLWNvbmZpZ3VyZWQgYnkg
dGhlIGZpcm13YXJlLgoKQnV0IHRoaXMgaXNuJ3QgdGhlIHNhbWUgYXMgQkFVRF9BVVRPLCBpcyBp
dD8gSWYgZmlybXdhcmUgcHJlLWNvbmZpZ3VyZXMKdGhlIGJhdWQgcmF0ZSwgaXNuJ3QgaXQgdGhp
cyBzdHJ1Y3R1cmUgd2hpY2ggaXQgd291bGQgdXNlIHRvIGNvbW11bmljYXRlCnRoZSBpbmZvcm1h
dGlvbj8KCj4gKyAgICAgKiBBbmQgY3VycmVudGx5IHRoZSBBQ1BJIHBhcnQgaXMgb25seSB0YXJn
ZXRpbmcgQVJNIHNvIHRoZSBmb2xsb3dpbmcKPiArICAgICAqIGZpZWxkcyBwY19pbnRlcnJ1cHQs
IHBjaV9kZXZpY2VfaWQsIHBjaV92ZW5kb3JfaWQsIHBjaV9idXMsIHBjaV9kZXZpY2UsCj4gKyAg
ICAgKiBwY2lfZnVuY3Rpb24sIHBjaV9mbGFncywgcGNpX3NlZ21lbnQgYW5kIGZsb3dfY29udHJv
bCB3aGljaCB3ZSBkbyBub3QKPiArICAgICAqIGNhcmUgeWV0IGFyZSBpZ25vcmVkLgoKSG93IGNv
bWUgZmxvdyBjb250cm9sIGlzIG9mIG5vIGludGVyZXN0PwoKSSdkIGFsc28gZ3JvdXAgYWxsIHRo
ZSBwY2lfKiBmaWVsZHMgaW50byBhIHNpbXBsZSAiYW5kIGFsbCBQQ0kgcmVsYXRlZApvbmVzIi4K
Cj4gKyAgICAgKi8KPiArICAgIHVhcnQtPmJhdWQgPSBCQVVEX0FVVE87Cj4gKyAgICB1YXJ0LT5k
YXRhX2JpdHMgPSA4Owo+ICsgICAgdWFydC0+cGFyaXR5ID0gc3Bjci0+cGFyaXR5Owo+ICsgICAg
dWFydC0+c3RvcF9iaXRzID0gc3Bjci0+c3RvcF9iaXRzOwo+ICsgICAgdWFydC0+aW9fYmFzZSA9
IHNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3M7Cj4gKyAgICB1YXJ0LT5pb19zaXplID0gc3Bjci0+
c2VyaWFsX3BvcnQuYml0X3dpZHRoOwoKT25jZSBhZ2FpbjogWW91IHNob3VsZCBub3QgaWdub3Jl
IHRoZSBHQVMgYWRkcmVzcyBzcGFjZSBpbmRpY2F0b3IuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
