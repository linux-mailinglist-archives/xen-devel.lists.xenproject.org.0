Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A895B1527A3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 09:50:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izGKF-0003Bv-9h; Wed, 05 Feb 2020 08:46:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izGKD-0003Bq-4u
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 08:46:21 +0000
X-Inumbo-ID: fa0fff60-47f3-11ea-90a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa0fff60-47f3-11ea-90a2-12813bfff9fa;
 Wed, 05 Feb 2020 08:46:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F18D9ADAB;
 Wed,  5 Feb 2020 08:46:17 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
Date: Wed, 5 Feb 2020 09:46:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204173455.22020-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxODozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEltcG9ydCB0aGUg
ZnVuY3Rpb25zIGFuZCBpdCdzIGRlcGVuZGVuY2llcy4gQmFzZWQgb24gTGludXggNS41LCBjb21t
aXQKPiBpZCBkNTIyNmZhNmRiYWUwNTY5ZWU0M2VjZmMwOGJkY2Q2NzcwZmM0NzU1Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhh
bmtzIGZvciBnb2luZyB0aGlzIHJvdXRlOyB0d28gcmVtYXJrcyAvIHJlcXVlc3RzOgoKPiAtLS0g
YS94ZW4vY29tbW9uL2JpdG1hcC5jCj4gKysrIGIveGVuL2NvbW1vbi9iaXRtYXAuYwo+IEBAIC0y
MTIsNiArMjEyLDQ3IEBAIGludCBfX2JpdG1hcF93ZWlnaHQoY29uc3QgdW5zaWduZWQgbG9uZyAq
Yml0bWFwLCBpbnQgYml0cykKPiAgI2VuZGlmCj4gIEVYUE9SVF9TWU1CT0woX19iaXRtYXBfd2Vp
Z2h0KTsKPiAgCj4gK3ZvaWQgX19iaXRtYXBfc2V0KHVuc2lnbmVkIGxvbmcgKm1hcCwgdW5zaWdu
ZWQgaW50IHN0YXJ0LCBpbnQgbGVuKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25nICpwID0gbWFwICsg
QklUX1dPUkQoc3RhcnQpOwo+ICsJY29uc3QgdW5zaWduZWQgaW50IHNpemUgPSBzdGFydCArIGxl
bjsKPiArCWludCBiaXRzX3RvX3NldCA9IEJJVFNfUEVSX0xPTkcgLSAoc3RhcnQgJSBCSVRTX1BF
Ul9MT05HKTsKPiArCXVuc2lnbmVkIGxvbmcgbWFza190b19zZXQgPSBCSVRNQVBfRklSU1RfV09S
RF9NQVNLKHN0YXJ0KTsKPiArCj4gKwl3aGlsZSAobGVuIC0gYml0c190b19zZXQgPj0gMCkgewo+
ICsJCSpwIHw9IG1hc2tfdG9fc2V0Owo+ICsJCWxlbiAtPSBiaXRzX3RvX3NldDsKPiArCQliaXRz
X3RvX3NldCA9IEJJVFNfUEVSX0xPTkc7Cj4gKwkJbWFza190b19zZXQgPSB+MFVMOwo+ICsJCXAr
KzsKPiArCX0KPiArCWlmIChsZW4pIHsKPiArCQltYXNrX3RvX3NldCAmPSBCSVRNQVBfTEFTVF9X
T1JEX01BU0soc2l6ZSk7Cj4gKwkJKnAgfD0gbWFza190b19zZXQ7Cj4gKwl9Cj4gK30KPiArRVhQ
T1JUX1NZTUJPTChfX2JpdG1hcF9zZXQpOwo+ICsKPiArdm9pZCBfX2JpdG1hcF9jbGVhcih1bnNp
Z25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwgaW50IGxlbikKPiArewo+ICsJdW5z
aWduZWQgbG9uZyAqcCA9IG1hcCArIEJJVF9XT1JEKHN0YXJ0KTsKPiArCWNvbnN0IHVuc2lnbmVk
IGludCBzaXplID0gc3RhcnQgKyBsZW47Cj4gKwlpbnQgYml0c190b19jbGVhciA9IEJJVFNfUEVS
X0xPTkcgLSAoc3RhcnQgJSBCSVRTX1BFUl9MT05HKTsKPiArCXVuc2lnbmVkIGxvbmcgbWFza190
b19jbGVhciA9IEJJVE1BUF9GSVJTVF9XT1JEX01BU0soc3RhcnQpOwo+ICsKPiArCXdoaWxlIChs
ZW4gLSBiaXRzX3RvX2NsZWFyID49IDApIHsKPiArCQkqcCAmPSB+bWFza190b19jbGVhcjsKPiAr
CQlsZW4gLT0gYml0c190b19jbGVhcjsKPiArCQliaXRzX3RvX2NsZWFyID0gQklUU19QRVJfTE9O
RzsKPiArCQltYXNrX3RvX2NsZWFyID0gfjBVTDsKPiArCQlwKys7Cj4gKwl9Cj4gKwlpZiAobGVu
KSB7Cj4gKwkJbWFza190b19jbGVhciAmPSBCSVRNQVBfTEFTVF9XT1JEX01BU0soc2l6ZSk7Cj4g
KwkJKnAgJj0gfm1hc2tfdG9fY2xlYXI7Cj4gKwl9Cj4gK30KPiArRVhQT1JUX1NZTUJPTChfX2Jp
dG1hcF9jbGVhcik7CgpEZXNwaXRlIGFsbCB0aGUgb3RoZXIgRVhQT1JUX1NZTUJPTCgpIGluIHRo
aXMgZmlsZSwgcGVyc29uYWxseSBJCndvdWxkIHN1Z2dlc3QgdG8gcmVmcmFpbiBmcm9tIGFkZGlu
ZyBtb3JlLiBCdXQgSSdtIG5vdCBnb2luZyB0bwppbnNpc3QgKHVudGlsIHN1Y2ggdGltZSB0aGF0
IHRoZXkgYWxsIGdldCBjbGVhbmVkIHVwKS4KCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9i
aXRvcHMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYml0b3BzLmgKPiBAQCAtNDgwLDQg
KzQ4MCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGZscyh1bnNpZ25lZCBpbnQgeCkKPiAgI2RlZmlu
ZSBod2VpZ2h0MTYoeCkgZ2VuZXJpY19od2VpZ2h0MTYoeCkKPiAgI2RlZmluZSBod2VpZ2h0OCh4
KSBnZW5lcmljX2h3ZWlnaHQ4KHgpCj4gIAo+ICsjZGVmaW5lIEJJVF9XT1JEKG5yKSAoKG5yKSAv
IEJJVFNfUEVSX0xPTkcpCgpBdCBmaXJzdCBJIHRob3VnaHQgLSB3aHkgZm9yIHg4NiBvbmx5PyBU
aGVuIEkgbm90aWNlZCBBcm0gaGFzIGFuCmFsbW9zdCBpZGVudGljYWwgI2RlZmluZSBhbHJlYWR5
LiBXaGljaCBpbiB0dXJuIG1hZGUgbWUgbG9vayBhdApMaW51eCwgd2hlcmUgdGhhdCAjZGVmaW5l
IGxpdmVzIGluIGEgY29tbW9uIGhlYWRlci4gSSB0aGluayB5b3UKd2FudCB0byBtb3ZlIHRoZSBB
cm0gb25lLiBPciB3YWl0LCBubyAtIEFybSdzIGlzbid0IGV2ZW4KY29tcGF0aWJsZSB3aXRoIHRo
ZSBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGZ1bmN0aW9ucyB5b3UgYWRkLgpUaGlzIGRlZmluaXRl
bHkgbmVlZHMgdGFraW5nIGNhcmUgb2YsIHBlcmhhcHMgYnkgd2F5IG9mIGlnbm9yaW5nCm15IHJl
cXVlc3QgdG8gZ28gdGhpcyByb3V0ZSAoYXMgZ2V0dGluZyB0b28gaW52b2x2ZWQpLgoKPiBAQCAt
MjI3LDYgKzIyOSw0MiBAQCBzdGF0aWMgaW5saW5lIGludCBiaXRtYXBfd2VpZ2h0KGNvbnN0IHVu
c2lnbmVkIGxvbmcgKnNyYywgaW50IG5iaXRzKQo+ICAJcmV0dXJuIF9fYml0bWFwX3dlaWdodChz
cmMsIG5iaXRzKTsKPiAgfQo+ICAKPiArI2lmZGVmIF9fTElUVExFX0VORElBTgo+ICsjZGVmaW5l
IEJJVE1BUF9NRU1fQUxJR05NRU5UIDgKPiArI2Vsc2UKPiArI2RlZmluZSBCSVRNQVBfTUVNX0FM
SUdOTUVOVCAoOCAqIHNpemVvZih1bnNpZ25lZCBsb25nKSkKPiArI2VuZGlmCgpGb3IgX19MSVRU
TEVfRU5ESUFOIHRvIGJlIGNvbnNpc3RlbnRseSBkZWZpbmVkIChvciBub3QpLCBkb24ndAp5b3Ug
bmVlZCB0byBpbmNsdWRlIDxhc20vYnl0ZW9yZGVyLmg+IGhlcmU/CgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
