Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF914EE99
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:38:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXPO-0003Gm-Ru; Fri, 31 Jan 2020 14:36:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixXPM-0003Gg-Nm
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:36:32 +0000
X-Inumbo-ID: 12c5b06a-4437-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12c5b06a-4437-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 14:36:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2A6DB1F1;
 Fri, 31 Jan 2020 14:36:30 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger> <20200130122836.ccexm2c2j5i7umas@debian>
 <d57ce32a-fd0e-e98d-4e97-335963f946c7@suse.com>
 <20200131142045.xvbbq36lutkqzai7@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96f8ae00-5365-47f2-f04c-67b3ebd93daf@suse.com>
Date: Fri, 31 Jan 2020 15:36:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131142045.xvbbq36lutkqzai7@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxNToyMCwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEphbiAzMSwgMjAy
MCBhdCAwMzoxMjo1MFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMDEuMjAy
MCAxMzoyOCwgV2VpIExpdSB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDAxOjA4
OjA3UE0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4KPj4+Pj4gK30KPj4+Pj4g
Kwo+Pj4+PiAgLyoKPj4+Pj4gICAqIExvY2FsIHZhcmlhYmxlczoKPj4+Pj4gICAqIG1vZGU6IEMK
Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYv
eGVuLmxkcy5TCj4+Pj4+IGluZGV4IDk3ZjljMDc4OTEuLjhlMDJiNGM2NDggMTAwNjQ0Cj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3hl
bi5sZHMuUwo+Pj4+PiBAQCAtMzI5LDYgKzMyOSwxMCBAQCBTRUNUSU9OUwo+Pj4+PiAgICBlZmkg
PSAuOwo+Pj4+PiAgI2VuZGlmCj4+Pj4+ICAKPj4+Pj4gKyNpZmRlZiBDT05GSUdfSFlQRVJWX0dV
RVNUCj4+Pj4+ICsgIGh2X2hjYWxsX3BhZ2UgPSBBQlNPTFVURShfX2ZpeF94X3RvX3ZpcnQoMSkp
Owo+Pj4+Cj4+Pj4gSSBhc3N1bWUgdGhlcmUncyBubyB3YXkgdG8gdXNlIEZJWF9YX0hZUEVSVl9I
Q0FMTCBiZWNhdXNlIGl0J3MgYW4KPj4+PiBlbnVtPwo+Pj4+Cj4+Pgo+Pj4gWWVzLgo+Pj4KPj4+
IEFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJhdGUgYSBzeW1ib2wgZGlkbid0IHdvcmsgZWl0aGVyLgo+
Pgo+PiBJIGd1ZXNzIEkgbmVlZCBhbiBleHBsYW5hdGlvbiBoZXJlLiBBaXVpIHlvdSBkb24ndCBy
ZWFsbHkgbmVlZAo+PiB0aGUgZGVmaW5pdGlvbiB0byBiZSBpbiB0aGUgbGlua2VyIHNjcmlwdCwg
YW5kIGl0IGNvdWxkIGFzIHdlbGwKPj4gYmUgaW4gZS5nLiBhc3NlbWJseSBjb2RlLiBIb3cgZG9l
cyB0aGUgc2FtZSAuZXF1IGFwcHJvYWNoIG5vdAo+PiB3b3JrIGluIHRoaXMgY2FzZT8KPj4KPiAK
PiBJbiBjb21taXQgbWVzc2FnZToKPiAKPiBtbS5jOjU3MzY6NTogZXJyb3I6IGludmFsaWQgJ2Fz
bSc6IG9wZXJhbmQgaXMgbm90IGEgY29uZGl0aW9uIGNvZGUsCj4gaW52YWxpZCBvcGVyYW5kIGNv
ZGUgJ2MnCj4gICAgICAgICAgICAgICAgYXNtICggIi5lcXUgSFZfSENBTExfUEFHRSwgJWMwOyAu
Z2xvYmFsIEhWX0hDQUxMX1BBR0UiCgpCdXQgdGhpcyBsYWNrcyB0aGUgb3RoZXIgaGFsZiBvZiB0
aGUgYXNtKCkuCgo+IElTVFIgeW91IG9uY2UgbWVudGlvbmVkIGluIElSQyB0aGF0IHRoZXJlIGlz
IGEgd2F5IGFyb3VuZCB0aGlzICh3aXRoIGEKPiBuZXcgbW9kaWZpZXIgLyBxdWFsaWZpZXIpLCBi
dXQgSSBkb24ndCBoYXZlIHRoZSBsb2cgYW55bW9yZS4KCkFuZCBJIHRoaW5rIHdlIGRpZCBzYXkg
dGhhdCB3ZSBkaWRuJ3Qgd2FudCB0byBnbyB0b28gZmFyIHdpdGgKdXNpbmcgZ2NjIGludGVybmFs
cy4gSU9XIEkgdGhpbmsgdHJ5aW5nIGRpZmZlcmVudCBtb2RpZmllcnMgaXMKb3V0IG9mIHF1ZXN0
aW9uIG5vdyAoaXQgd2FzIC0lbjAgaWlyYyksIGJ1dCBnZXR0aW5nIHBhc3QgZ2NjCm5vdCByZWNv
Z25pemluZyB0aGUgY29uc3RhbnQgYXMgYmVpbmcgYSBjb25zdGFudCBtYXkgc3RpbGwgYmUKYSB2
aWFibGUgcm91dGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
