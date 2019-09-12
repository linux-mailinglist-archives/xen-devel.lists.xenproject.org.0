Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C2B0FFD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:31:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8P8v-0005n4-2z; Thu, 12 Sep 2019 13:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8P8t-0005mr-79
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:28:11 +0000
X-Inumbo-ID: 29a28f78-d561-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29a28f78-d561-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 13:28:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B8A6B647;
 Thu, 12 Sep 2019 13:28:09 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-4-paul.durrant@citrix.com>
 <7cd00313-8d28-708b-23b1-4f6b0ff89cdf@suse.com>
 <db42dfe903484b948cd82ad5d2a46844@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9db1e764-e19e-a3fc-7d51-515d5625682f@suse.com>
Date: Thu, 12 Sep 2019 15:28:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db42dfe903484b948cd82ad5d2a46844@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, DavidScott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 IanJackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNToxOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE0OjA0Cj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPgo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPjsgQ2hyaXN0aWFuIExpbmRpZwo+PiA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRy
aXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEph
Y2tzb24KPj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPj4gPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+OyBEYXZpZFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+OyBUaW0gKFhlbi5v
cmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUKPj4gPHdsQHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjkgMy82XSBzeXNjdGwgLyBsaWJ4bDogcmVwb3J0IHdoZXRoZXIgSU9NTVUvSEFQ
IHBhZ2UgdGFibGUgc2hhcmluZyBpcyBzdXBwb3J0ZWQKPj4KPj4gT24gMTIuMDkuMjAxOSAxMzox
NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3N5c2N0bC5jCj4+
PiArKysgYi94ZW4vYXJjaC9hcm0vc3lzY3RsLmMKPj4+IEBAIC0xNSw2ICsxNSw5IEBACj4+PiAg
dm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkKPj4+
ICB7Cj4+PiAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSB8
IFhFTl9TWVNDVExfUEhZU0NBUF9oYXA7Cj4+PiArCj4+PiArICAgIGlmICggaW9tbXVfZW5hYmxl
ZCAmJiBpb21tdV9oYXBfcHRfc2hhcmUgKQo+Pj4gKyAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8
PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOwo+Pj4gIH0KPj4KPj4gSSB0
aGluayB0aGlzIHNob3VsZCBiZSBkb25lIGluIGNvbW1vbiBjb2RlLgo+Pgo+Pj4gLS0tIGEveGVu
L2FyY2gveDg2L3N5c2N0bC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPj4+IEBA
IC0xNjQsNyArMTY0LDEyIEBAIHZvaWQgYXJjaF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0
bF9waHlzaW5mbyAqcGkpCj4+PiAgICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfUFYpICkKPj4+
ICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX3B2Owo+Pj4g
ICAgICBpZiAoIGh2bV9oYXBfc3VwcG9ydGVkKCkgKQo+Pj4gKyAgICB7Cj4+PiAgICAgICAgICBw
aS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9oYXA7Cj4+PiArCj4+PiArICAg
ICAgICBpZiAoIGlvbW11X2VuYWJsZWQgJiYgaW9tbXVfaGFwX3B0X3NoYXJlICkKPj4+ICsgICAg
ICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBf
cHRfc2hhcmU7Cj4+PiArICAgIH0KPj4+ICB9Cj4+Cj4+IEFuZCBpZiBpdCdzIGltcG9ydGFudCB0
byBub3QgaGF2ZSB0aGUgYml0IHNldCB3aGVuICFodm1faGFwX3N1cHBvcnRlZCgpLAo+IAo+IC4u
LmFuZCB0aGF0J3Mgd2hhdCBpdOKAmXMgbm90IGluIGNvbW1vbiBjb2RlLi4uIHRoZXJlIGlzIG5v
IGh2bV9oYXBfc3VwcG9ydGVkKCkgZm9yIEFybQo+IAo+PiB0aGVuIGlvbW11X2hhcF9wdF9zaGFy
ZSBzaG91bGQgYmUgY2xlYXJlZCBpbiBfX2luaXQgY29kZSBpbiB0aGlzIGNhc2UuCj4gCj4gVGhh
dCB3b3VsZCBoYXZlIGJlZW4gYW4gYWx0ZXJuYXRpdmUgYXBwcm9hY2ggaWYgeW91J2Qgbm90IHdh
bnRlZAo+IGl0ICNkZWZpbmVkIGluIHBhdGNoICM1LiAoWWVzIGl0J3MgYSBsYXRlciBwYXRjaCBp
biB0aGUgc2VyaWVzLAo+IGJ1dCB0aGlzIG9uZSBpcyBsYXRlciBjaHJvbm9sb2dpY2FsbHkgYW5k
IEkgZGlkbid0IHdhbnQgdG8KPiBpbnZhbGlkYXRlIHRoZSBvdGhlciBwYXRjaC4pCj4gSSBjb3Vs
ZCBwZXJoYXBzIGltcGxlbWVudCBodm1faGFwX3N1cHBvcnRlZCgpIGZvciBBcm0/CgpXZWxsLCBp
bXBsZW1lbnRpbmcgaXQgZm9yIEFybSBpcyBhbiBvcHRpb24gKGF0IHdoaWNoIHBvaW50ClhFTl9T
WVNDVExfUEhZU0NBUF9oYXAgY291bGQgYWxzbyBtb3ZlIHRvIGNvbW1vbiBjb2RlKS4gQnV0CnBl
cnNvbmFsbHkgSSdkIGFkdmlzZSBhZ2FpbnN0IHByb3ZpZGluZyBtb3JlIHN0dWJzIHRoYW4KbmVj
ZXNzYXJ5IG9uIEFybS4gSSBtYXkgbm90IHVuZGVyc3RhbmQgeW91ciByZW1hcmsgcmVnYXJkaW5n
CnBhdGNoIDU6IFRoZXJlJ3Mgbm8gcHJvYmxlbSB3aXRoIGlvbW11X2hhcF9wdF9zaGFyZSBub3cg
YmVpbmcKYSAjZGVmaW5lIG9uIEFybSAtIHdoZXRoZXIgdGhlIHN5c3RlbSBpcyBIVk0gY2FwYWJs
ZSBpcyBhbgp4ODYgc3BlY2lmaWMgZGVjaXNpb24gYW55d2F5LCBhbmQgaGVuY2UgdGhlIGNsZWFy
aW5nIG9mIHRoZQpmbGFnIGNvdWxkIG9jY3VyIGUuZy4gaW4gaHZtX2VuYWJsZSgpIHdoZW4gaXQg
YmFpbHMgZWFybHkuCkFuZCBidHcuLCB3aXRoICFDT05GSUdfSFZNIGl0IGNvdWxkIGJlIGEgI2Rl
ZmluZSBvbiB4ODYgYXMKd2VsbCwganVzdCB0byAiZmFsc2UiIHRoZW4uCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
