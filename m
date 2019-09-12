Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F10B126C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:49:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8RIx-000337-F1; Thu, 12 Sep 2019 15:46:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8RIw-000332-Ci
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:46:42 +0000
X-Inumbo-ID: 834e4e14-d574-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 834e4e14-d574-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 15:46:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42F39AE86;
 Thu, 12 Sep 2019 15:46:40 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <f44f12f3-6449-8014-43e4-1f08100be251@suse.com>
 <20190912153147.nhxdrifqney752lc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c5ba0af-60bb-557b-9574-2dd6b95cef31@suse.com>
Date: Thu, 12 Sep 2019 17:46:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912153147.nhxdrifqney752lc@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 9/9] x86: PCID is unused when !PV
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTEsIDIwMTkgYXQgMDU6MjY6NDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRo
aXMgYWxsb3dzIGluIHBhcnRpY3VsYXIgc29tZSBzdHJlYW1saW5pbmcgb2YgdGhlIFRMQiBmbHVz
aGluZyBjb2RlCj4+IHBhdGhzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jCj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jCj4+IEBAIC0yNCw2ICsyNCwxMSBAQAo+PiAgI2Rl
ZmluZSBXUkFQX01BU0sgKDB4MDAwMDAzRkZVKQo+PiAgI2VuZGlmCj4+ICAKPj4gKyNpZm5kZWYg
Q09ORklHX1BWCj4+ICsjIHVuZGVmIFg4Nl9DUjRfUENJREUKPj4gKyMgZGVmaW5lIFg4Nl9DUjRf
UENJREUgMAo+PiArI2VuZGlmCj4gCj4gSSBoYXZlIHRvIGFkbWl0IEkgZmluZCBpdCBxdWl0ZSB1
Z2x5IHRvIGhhdmUgdG8gbWFzayBQQ0lEIGluIHN1Y2ggYQo+IHdheS4gUGxheWluZyB3aXRoIHRo
ZSBoYXJkd2FyZSBhcmNoaXRlY3R1cmUgZGVmaW5lcyBzZWVtcyBsaWtlIGFza2luZwo+IGZvciB0
cm91YmxlLiBJIHdvdWxkIGxpa2VseSBwcmVmZXIgdG8gc3ByaW5rbGUgSVNfRU5BQkxFRChDT05G
SUdfUFYpLAo+IHdoaWNoIHNob3VsZCBhY2hpZXZlIHRoZSBzYW1lIGNvbXBpbGUgdGltZSBzaG9y
dCBjaXJjdWl0aW5nLgoKV2VsbCwgeWVzLCB0aGlzIGlzbid0IGVudGlyZWx5IHdpdGhvdXQgcmlz
ay4gQnV0ICNpZmRlZi1hcnkKaXNuJ3QgZWl0aGVyLiBBbmQgdGhlIGFib3ZlIGZpdHMgdGhlIHRp
dGxlIG9mIHRoaXMgcGF0Y2gKcHJldHR5IHdlbGwuCgpBbmRyZXcgKGluIHBhcnRpY3VsYXIpIC0g
ZG8geW91IGhhdmUgYW55IHN0cm9uZyBwcmVmZXJlbmNlIGhlcmU/Cgo+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJv
Y2Vzc29yLmgKPj4gQEAgLTI4OSw3ICsyODksMTEgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nIGNyM19wYSh1bnNpZwo+PiAgCj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBjcjNf
cGNpZCh1bnNpZ25lZCBsb25nIGNyMykKPj4gIHsKPj4gKyNpZmRlZiBDT05GSUdfUFYKPj4gICAg
ICByZXR1cm4gY3IzICYgWDg2X0NSM19QQ0lEX01BU0s7Cj4+ICsjZWxzZQo+PiArICAgIHJldHVy
biAwOwo+PiArI2VuZGlmCj4gCj4gV29uJ3Q6Cj4gCj4gcmV0dXJuIElTX0VOQUJMRUQoQ09ORklH
X1BWKSA/IGNyMyAmIFg4Nl9DUjNfUENJRF9NQVNLIDogMDsKPiAKPiBBY2hpZXZlIHRoZSBzYW1l
PwoKWWVzLiBJIGNhbiBjZXJ0YWlubHkgc3dpdGNoIHRvIHRoYXQuCgo+PiBAQCAtMzAxLDggKzMw
NSwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVfY3I0KHVuc2lnbmVkIGxvCj4+ICB7Cj4+
ICAgICAgc3RydWN0IGNwdV9pbmZvICppbmZvID0gZ2V0X2NwdV9pbmZvKCk7Cj4+ICAKPj4gKyNp
ZmRlZiBDT05GSUdfUFYKPj4gICAgICAvKiBObyBnbG9iYWwgcGFnZXMgaW4gY2FzZSBvZiBQQ0lE
cyBlbmFibGVkISAqLwo+PiAgICAgIEFTU0VSVCghKHZhbCAmIFg4Nl9DUjRfUEdFKSB8fCAhKHZh
bCAmIFg4Nl9DUjRfUENJREUpKTsKPj4gKyNlbHNlCj4+ICsgICAgQVNTRVJUKCEodmFsICYgWDg2
X0NSNF9QQ0lERSkpOwo+IAo+IFRoYXQgYXNzZXJ0IHNlZW1zIHF1aXRlIHBvaW50bGVzcywgeW91
IGhhdmUgc2V0IFg4Nl9DUjRfUENJREUgdG8gMCwgc28KPiB0aGlzIGlzIG5ldmVyIGdvaW5nIHRv
IHRyaWdnZXI/CgpHb29kIHBvaW50LCB0aGlzIGlzIGEgbGVmdG92ZXIgZnJvbSB3aGVuIEkgc3Rh
cnRlZCB3aXRoIHRoZQojaWZkZWYtYXJ5IGFwcHJvYWNoLCBiZWZvcmUgaXQgYmVjYW1lIHRvbyBt
YW55IG9mIHRoZW0gZm9yCm15IHRhc3RlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
