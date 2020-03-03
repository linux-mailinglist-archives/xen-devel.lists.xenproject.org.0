Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577D177BAB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:14:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9A8V-00019A-9O; Tue, 03 Mar 2020 16:11:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9A8T-000195-Jh
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:11:09 +0000
X-Inumbo-ID: 9783e470-5d69-11ea-a1af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9783e470-5d69-11ea-a1af-12813bfff9fa;
 Tue, 03 Mar 2020 16:11:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93DB1AF36;
 Tue,  3 Mar 2020 16:11:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
 <20200228123116.GW24458@Air-de-Roger.citrite.net>
 <134bacfe-4651-1959-8f5d-2e5d07ea4c27@suse.com>
Message-ID: <2479d83e-3440-485c-b99d-c2de0f5ffe1e@suse.com>
Date: Tue, 3 Mar 2020 17:11:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <134bacfe-4651-1959-8f5d-2e5d07ea4c27@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] AMD/IOMMU: without XT,
 x2APIC needs to be forced into physical mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxNzowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMDIuMjAyMCAx
MzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gRnJpLCBGZWIgMjgsIDIwMjAgYXQg
MDE6MTI6MDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvZ2VuYXBpYy94MmFwaWMuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGlj
LmMKPj4+IEBAIC0yMzYsMTIgKzIzNiwyMSBAQCBjb25zdCBzdHJ1Y3QgZ2VuYXBpYyAqX19pbml0
IGFwaWNfeDJhcGljCj4+PiAgICAgICAgICB4MmFwaWNfcGh5cyA9ICFpb21tdV9pbnRyZW1hcCB8
fAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAoYWNwaV9nYmxfRkFEVC5mbGFncyAmIEFDUElf
RkFEVF9BUElDX1BIWVNJQ0FMKTsKPj4+ICAgICAgfQo+Pj4gLSAgICBlbHNlIGlmICggIXgyYXBp
Y19waHlzICYmICFpb21tdV9pbnRyZW1hcCApCj4+PiAtICAgIHsKPj4+IC0gICAgICAgIHByaW50
aygiV0FSTklORzogeDJBUElDIGNsdXN0ZXIgbW9kZSBpcyBub3Qgc3VwcG9ydGVkIHdpdGhvdXQg
aW50ZXJydXB0IHJlbWFwcGluZ1xuIgo+Pj4gLSAgICAgICAgICAgICAgICJ4MkFQSUM6IGZvcmNp
bmcgcGh5cyBtb2RlXG4iKTsKPj4+IC0gICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsKPj4+IC0g
ICAgfQo+Pj4gKyAgICBlbHNlIGlmICggIXgyYXBpY19waHlzICkKPj4+ICsgICAgICAgIHN3aXRj
aCAoIGlvbW11X2ludHJlbWFwICkKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgIGNhc2UgaW9t
bXVfaW50cmVtYXBfb2ZmOgo+Pj4gKyAgICAgICAgY2FzZSBpb21tdV9pbnRyZW1hcF9yZXN0cmlj
dGVkOgo+Pj4gKyAgICAgICAgICAgIHByaW50aygiV0FSTklORzogeDJBUElDIGNsdXN0ZXIgbW9k
ZSBpcyBub3Qgc3VwcG9ydGVkICVzIGludGVycnVwdCByZW1hcHBpbmdcbiIKPj4+ICsgICAgICAg
ICAgICAgICAgICAgIngyQVBJQzogZm9yY2luZyBwaHlzIG1vZGVcbiIsCj4+PiArICAgICAgICAg
ICAgICAgICAgIGlvbW11X2ludHJlbWFwID09IGlvbW11X2ludHJlbWFwX29mZiA/ICJ3aXRob3V0
Igo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiAid2l0aCByZXN0cmljdGVkIik7Cj4+PiArICAgICAgICAgICAgeDJhcGljX3BoeXMg
PSB0cnVlOwo+Pgo+PiBJIHRoaW5rIHlvdSBhbHNvIG5lZWQgdG8gZml4dXAgdGhlIHVzYWdlIG9m
IGlvbW11X2ludHJlbWFwIGluIF9fY3B1X3VwCj4+IHNvIHRoYXQgQ1BVcyB3aXRoIEFQSUMgSURz
ID4gMjU1IGFyZSBub3QgYnJvdWdodCB1cCB3aGVuIGluCj4+IGlvbW11X2ludHJlbWFwX3Jlc3Ry
aWN0ZWQgbW9kZS4KPiAKPiBJJ3ZlIGxvb2tlZCBhcm91bmQgc29tZSAoZmluZGluZyBpbmRpY2F0
aW9ucyB0aGF0LCBhcyBvbmUgd291bGQKPiBzdXNwZWN0LCBicm9hZGNhc3RpbmcgaXMgYWxzbyBz
dXBwb3J0ZWQgZm9yIElPLUFQSUMgYmFzZWQKPiBpbnRlcnJ1cHRzLCBhbmQgdGhlbiBieSBpbXBs
aWNhdGlvbiBhbHNvIGZvciBNU0kpIGFuZCB0aGVuIGFsc28KPiB0aG91Z2h0IGFib3V0IHRoaXMg
c29tZSBtb3JlLiBJIHRoaW5rIHRoZSBjb3JuZXIgY2FzZSBoZXJlCj4gcmVzb2x2ZXMgbGlrZSB0
aGlzOiBXaGV0aGVyIDB4ZmYgbWVhbnMgImJyb2FkY2FzdCIgZXhjbHVzaXZlbHkKPiBkZXBlbmRz
IG9uIHRoZSBsb2NhbCBBUElDLiBIZW5jZSBpbiB4MkFQSUMgbW9kZSwgZXZlbiB3aXRob3V0Cj4g
WFQsIDB4ZmYgZG9lcyBub3QgbWVhbiAiYnJvYWRjYXN0IiwgYW5kIGhlbmNlIHRoZSBjb2RlIGlu
Cj4gX19jcHVfdXAoKSBpcyBmaW5lIGFzIGlzLiBJbiB0aGlzIHNldHVwIHRoZXJlIHNpbXBseSBp
cyBubyB3YXkKPiB0byBlbmNvZGUgYnJvYWRjYXN0IGF0IHRoZSBJTy1BUElDIG9yIE1TSSBsZXZl
bDsgbHVja2lseSB3ZQo+IGFsc28gZG9uJ3QgdXNlIHRoaXMgbW9kZS4KCkknbSB0YWxraW5nIHJ1
YmJpc2ggLSB5ZXMsIHRoZSBjb2RlIG5lZWRzIGFkanVzdGluZyBhcyB5b3UgYW5kIEkKZmlyc3Qg
dGhvdWdodC4gQWxsIHRoYXQgSSdtIG5vdyBzdXJlIGFib3V0IGlzIHRoYXQgdGhlIGFkanVzdG1l
bnQKZG9lc24ndCBuZWVkIHRvIGJlIG1vcmUgY29tcGxpY2F0ZWQuIEknbGwgbWFrZSBhIHBhdGNo
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
