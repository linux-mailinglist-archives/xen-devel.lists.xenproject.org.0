Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DEA1E5C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 17:07:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Lye-0004vB-Ou; Thu, 29 Aug 2019 15:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Lyd-0004v6-D8
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:04:43 +0000
X-Inumbo-ID: 53cf36d2-ca6e-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53cf36d2-ca6e-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 15:04:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8AD86AF11;
 Thu, 29 Aug 2019 15:04:40 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190822140210.24749-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93e0dae4-7e6a-2f04-2886-203685b6ad28@suse.com>
Date: Thu, 29 Aug 2019 17:04:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822140210.24749-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: Add mem access rights to NPT
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDguMjAxOSAxNjowMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gVGhp
cyBwYXRjaCBhZGRzIGFjY2VzcyBjb250cm9sIGZvciBOUFQgbW9kZS4KPiAKPiBUaGUgYWNjZXNz
IHJpZ2h0cyBhcmUgc3RvcmVkIGluIHRoZSBOUFQgcDJtIHRhYmxlIDU2OjUzLgoKV2h5IHN0YXJ0
aW5nIGZyb20gYml0IDUzPyBJIGNhbid0IHNlZW0gdG8gZmluZCBhbnkgdXNlIG9mIGJpdCA1Mi4K
Cj4gVGhlIGJpdHMgYXJlIGZyZWUgYWZ0ZXIgY2xlYXJpbmcgdGhlIElPTU1VIGZsYWdzIFsxXS4K
PiAKPiBNb2RpZnkgcDJtX3R5cGVfdG9fZmxhZ3MoKSB0byBhY2NlcHQgYW5kIGludGVycHJldCBh
biBhY2Nlc3MgdmFsdWUsCj4gcGFyYWxsZWwgdG8gdGhlIGVwdCBjb2RlLgo+IAo+IEFkZCBhIHNl
dF9kZWZhdWx0X2FjY2VzcygpIG1ldGhvZCB0byB0aGUgcDJtLXB0IGFuZCBwMm0tZXB0IHZlcnNp
b25zCj4gb2YgdGhlIHAybSByYXRoZXIgdGhhbiBzZXR0aW5nIGl0IGRpcmVjdGx5LCB0byBkZWFs
IHdpdGggZGlmZmVyZW50Cj4gZGVmYXVsdCBwZXJtaXR0ZWQgYWNjZXNzIHZhbHVlcy4KCkkgdGhp
bmsgdGhpcyB3b3VsZCBiZXR0ZXIgYmUgYSBzZXBhcmF0ZSBjaGFuZ2UuCgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0tcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwo+IEBA
IC02MywxMCArNjMsMTMgQEAKPiAgI2RlZmluZSBuZWVkc19yZWNhbGMobGV2ZWwsIGVudCkgX25l
ZWRzX3JlY2FsYyhsZXZlbCMjZV9nZXRfZmxhZ3MoZW50KSkKPiAgI2RlZmluZSB2YWxpZF9yZWNh
bGMobGV2ZWwsIGVudCkgKCEobGV2ZWwjI2VfZ2V0X2ZsYWdzKGVudCkgJiBfUEFHRV9BQ0NFU1NF
RCkpCj4gIAo+ICsjZGVmaW5lIF9QQUdFX0FDQ0VTU19CSVRTICAoMHgxZTAwKSAvKiBtZW1fYWNj
ZXNzIHJpZ2h0cyAxNjoxMyAqLwoKSSBndWVzcyB0aGlzIGlzIHRvbyBkaXNjb25uZWN0ZWQgZnJv
bSB0aGUgdHdvIHBhZ2UuaCBoZWFkZXJzIHdoZXJlCnRoZSBjb3JyZWxhdGlvbiBiZXR3ZWVuIGJp
dCBwb3NpdGlvbnMgZ2V0cyBleHBsYWluZWQsIHNvIEkgZ3Vlc3MKeW91IHdhbnQgdG8gZXh0ZW5k
IHRoZSBjb21tZW50IGFuZCBlaXRoZXIgcmVmZXIgdGhlcmUsIG9yIHJlcGxpY2F0ZQpzb21lIG9m
IGl0IHRvIG1ha2UgdW5kZXJzdGFuZGFibGUgd2h5IDE2OjEzIG1hdGNoZXMgNTY6NTMuCgpJJ20g
YWxzbyBjb25jZXJuZWQgaG93IGVhc3kgaXQnbGwgYmUgZm9yIHNvbWVvbmUgdG8gZmluZCB0aGlz
CmRlZmluaXRpb24gd2hlbiB3YW50aW5nIHRvIHVzZSBvdGhlciBvZiB0aGUgYXZhaWxhYmxlIGJp
dHMuCgo+IEBAIC0xMDQsOCArMTEyLDMyIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHAybV90eXBl
X3RvX2ZsYWdzKGNvbnN0IHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCj4gICAgICAgICAgICAgIGZs
YWdzIHw9IF9QQUdFX1BXVDsKPiAgICAgICAgICAgICAgQVNTRVJUKCFsZXZlbCk7Cj4gICAgICAg
ICAgfQo+IC0gICAgICAgIHJldHVybiBmbGFncyB8IFAyTV9CQVNFX0ZMQUdTIHwgX1BBR0VfUENE
Owo+ICsgICAgICAgIGZsYWdzIHw9IFAyTV9CQVNFX0ZMQUdTIHwgX1BBR0VfUENEOwo+ICsgICAg
ICAgIGJyZWFrOwo+ICAgICAgfQo+ICsKPiArICAgIHN3aXRjaCAoIGFjY2VzcyApCj4gKyAgICB7
Cj4gKyAgICBjYXNlIHAybV9hY2Nlc3NfcjoKPiArICAgICAgICBmbGFncyB8PSBfUEFHRV9OWF9C
SVQ7Cj4gKyAgICAgICAgZmxhZ3MgJj0gfl9QQUdFX1JXOwo+ICsgICAgICAgIGJyZWFrOwo+ICsg
ICAgY2FzZSBwMm1fYWNjZXNzX3J3Ogo+ICsgICAgICAgIGZsYWdzIHw9IF9QQUdFX05YX0JJVDsK
PiArICAgICAgICBicmVhazsKPiArICAgIGNhc2UgcDJtX2FjY2Vzc19yeDoKPiArICAgIGNhc2Ug
cDJtX2FjY2Vzc19yeDJydzoKPiArICAgICAgICBmbGFncyAmPSB+KF9QQUdFX05YX0JJVCB8IF9Q
QUdFX1JXKTsKPiArICAgICAgICBicmVhazsKPiArICAgIGNhc2UgcDJtX2FjY2Vzc194Ogo+ICsg
ICAgICAgIGZsYWdzICY9IH5fUEFHRV9SVzsKPiArICAgICAgICBicmVhazsKCkkgY2FuJ3Qgc2Vl
bSB0byBiZSBhYmxlIHRvIGZvbGxvdyB5b3UgaGVyZS4gSW4gZmFjdCBJIGRvbid0IHNlZQpob3cg
eW91IHdvdWxkIGJlIGFibGUgdG8gZXhwcmVzcyBleGVjdXRlLW9ubHkgd2l0aCBOUFQuIElmIHRo
aXMKaXMgcmVhbGx5IG5lZWRlZCBmb3Igc29tZSByZWFzb24sIHRoZW4gYSBqdXN0aWZ5aW5nIGNv
bW1lbnQKc2hvdWxkIGJlIGFkZGVkLgoKPiBAQCAtMTUyLDYgKzE4NCwxNyBAQCBwMm1fZnJlZV9l
bnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBsMV9wZ2VudHJ5X3QgKnAybV9lbnRyeSwgaW50
IHBhZ2Vfb3JkZXIpCj4gICAgICBwMm1fZnJlZV9wdHAocDJtLCBsMWVfZ2V0X3BhZ2UoKnAybV9l
bnRyeSkpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBwMm1fc2V0X2FjY2VzcyhpbnRwdGVfdCAq
ZW50cnksIHAybV9hY2Nlc3NfdCBhY2Nlc3MpCj4gK3sKPiArICAgICplbnRyeSB8PSBwdXRfcHRl
X2ZsYWdzKChnZXRfcHRlX2ZsYWdzKCplbnRyeSkgJiB+X1BBR0VfQUNDRVNTX0JJVFMpIHwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChNQVNLX0lOU1IoYWNjZXNzLCBfUEFHRV9BQ0NF
U1NfQklUUykpKTsKPiArfQo+ICsKPiArc3RhdGljIHAybV9hY2Nlc3NfdCBwMm1fZ2V0X2FjY2Vz
cyhpbnRwdGVfdCBlbnRyeSkKPiArewo+ICsgICAgcmV0dXJuIChwMm1fYWNjZXNzX3QpKE1BU0tf
RVhUUihnZXRfcHRlX2ZsYWdzKGVudHJ5KSwgX1BBR0VfQUNDRVNTX0JJVFMpKTsKCklzIHRoZSBj
YXN0IHJlYWxseSBuZWVkZWQgaGVyZT8KCj4gQEAgLTIyNiw2ICsyNjksNyBAQCBwMm1fbmV4dF9s
ZXZlbChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB2b2lkICoqdGFibGUsCj4gICAgICAgICAgewo+
ICAgICAgICAgICAgICBuZXdfZW50cnkgPSBsMWVfZnJvbV9wZm4ocGZuIHwgKGkgPDwgKChsZXZl
bCAtIDEpICogUEFHRVRBQkxFX09SREVSKSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmbGFncyk7Cj4gKyAgICAgICAgICAgIHAybV9zZXRfYWNjZXNzKCZuZXdfZW50
cnkubDEsIHAybS0+ZGVmYXVsdF9hY2Nlc3MpOwo+ICAgICAgICAgICAgICByYyA9IHAybS0+d3Jp
dGVfcDJtX2VudHJ5KHAybSwgZ2ZuLCBsMV9lbnRyeSArIGksIG5ld19lbnRyeSwgbGV2ZWwpOwo+
ICAgICAgICAgICAgICBpZiAoIHJjICkKPiAgICAgICAgICAgICAgewo+IEBAIC0yMzcsNiArMjgx
LDcgQEAgcDJtX25leHRfbGV2ZWwoc3RydWN0IHAybV9kb21haW4gKnAybSwgdm9pZCAqKnRhYmxl
LAo+ICAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKGwxX2VudHJ5KTsKPiAgCj4gICAgICAgICAg
bmV3X2VudHJ5ID0gbDFlX2Zyb21fbWZuKG1mbiwgUDJNX0JBU0VfRkxBR1MgfCBfUEFHRV9SVyk7
Cj4gKyAgICAgICAgcDJtX3NldF9hY2Nlc3MoJm5ld19lbnRyeS5sMSwgcDJtLT5kZWZhdWx0X2Fj
Y2Vzcyk7Cj4gICAgICAgICAgcmMgPSBwMm0tPndyaXRlX3AybV9lbnRyeShwMm0sIGdmbiwgcDJt
X2VudHJ5LCBuZXdfZW50cnksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
ZXZlbCArIDEpOwo+ICAgICAgICAgIGlmICggcmMgKQoKSXMgaXQgcmVhbGx5IGludGVuZGVkIHRv
IGluc2VydCB0aGUgYWNjZXNzIGJpdHMgYWxzbyBpbnRvIG5vbi1sZWFmCmVudHJpZXMgKHdoaWNo
IG1heSBiZSB3aGF0IGlzIGJlaW5nIHByb2Nlc3NlZCBoZXJlKT8gKE1heSBhbHNvCmFwcGx5IGZ1
cnRoZXIgZG93bi4pCgo+IEBAIC00NzQsNiArNTIwLDMyIEBAIGludCBwMm1fcHRfaGFuZGxlX2Rl
ZmVycmVkX2NoYW5nZXModWludDY0X3QgZ3BhKQo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+
ICtzdGF0aWMgaW50IHAybV9wdF9jaGVja19hY2Nlc3MocDJtX2FjY2Vzc190IHAybWEpCj4gK3sK
PiArICAgIHN3aXRjaCAoIHAybWEgKQo+ICsgICAgewo+ICsgICAgY2FzZSBwMm1fYWNjZXNzX246
Cj4gKyAgICBjYXNlIHAybV9hY2Nlc3NfdzoKPiArICAgIGNhc2UgcDJtX2FjY2Vzc193eDoKPiAr
ICAgIGNhc2UgcDJtX2FjY2Vzc19uMnJ3eDoKPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKCkkn
bSBub3QgY29udmluY2VkIEVJTlZBTCBpcyBhcHByb3ByaWF0ZSBoZXJlIC0gdGhlIGFyZ3VtZW50
IGlzbid0CmludmFsaWQsIGl0J3MganVzdCB0aGF0IHRoZXJlJ3Mgbm8gd2F5IHRvIHJlcHJlc2Vu
dCBpdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
