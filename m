Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAE30CEA
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:56:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWfAT-0003s8-AK; Fri, 31 May 2019 10:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWfAR-0003rw-NQ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:53:47 +0000
X-Inumbo-ID: 5bdcc3b2-8392-11e9-9e8d-23238e4c97db
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bdcc3b2-8392-11e9-9e8d-23238e4c97db;
 Fri, 31 May 2019 10:53:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86C03AD05;
 Fri, 31 May 2019 10:53:43 +0000 (UTC)
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1559267880-27863-1-git-send-email-chenbaodong@mxnavi.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7f141d76-c565-2b30-9b2d-48ebf95ac220@suse.com>
Date: Fri, 31 May 2019 12:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559267880-27863-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make keyhanler configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAwMzo1OCwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+IGtleWhhbmRsZXIgbWFp
bmx5IHVzZWQgZm9yIGRlYnVnIHVzYWdlIGJ5IGRldmVsb3BlcnMgd2hpY2ggY2FuIGR1bXAKPiB4
ZW4gbW9kdWxlKGVnLiB0aW1lciwgc2NoZWR1bGVyKSBzdGF0dXMgYXQgcnVudGltZSBieSBpbnB1
dAo+IGNoYXJhY3RlciBmcm9tIGNvbnNvbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBD
aGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZ2ljLmMg
ICAgICAgICAgIHwgIDIgKysKPiAgeGVuL2FyY2gveDg2L2FwaWMuYyAgICAgICAgICB8ICAyICsr
Cj4gIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgfCAgOSArKysrKysrKysKPiAgeGVuL2Nv
bW1vbi9NYWtlZmlsZSAgICAgICAgICB8ICAyICstCj4gIHhlbi9jb21tb24vY3B1cG9vbC5jICAg
ICAgICAgfCAgMiArKwo+ICB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICAgIHwgIDIgKysKPiAg
eGVuL2luY2x1ZGUveGVuL2tleWhhbmRsZXIuaCB8IDE0ICsrKysrKysrKysrKysrCj4gIHhlbi9p
bmNsdWRlL3hlbi9saWIuaCAgICAgICAgfCAgMiArKwo+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCAgICAgIHwgIDIgKysKPiAgOSBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNo
L2FybS9naWMuYwo+IGluZGV4IDZjYzdkZWMuLmZmZjg4YzUgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2dpYy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy5jCj4gQEAgLTM2MSw3ICszNjEs
OSBAQCBzdGF0aWMgdm9pZCBkb19zZ2koc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGVudW0g
Z2ljX3NnaSBzZ2kpCj4gICAgICAgICAgLyogTm90aGluZyB0byBkbywgd2lsbCBjaGVjayBmb3Ig
ZXZlbnRzIG9uIHJldHVybiBwYXRoICovCj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIEdJ
Q19TR0lfRFVNUF9TVEFURToKPiArI2lmZGVmIENPTkZJR19IQVNfS0VZSEFORExFUgo+ICAgICAg
ICAgIGR1bXBfZXhlY3N0YXRlKHJlZ3MpOwo+ICsjZW5kaWYKPiAgICAgICAgICBicmVhazsKPiAg
ICAgIGNhc2UgR0lDX1NHSV9DQUxMX0ZVTkNUSU9OOgo+ICAgICAgICAgIHNtcF9jYWxsX2Z1bmN0
aW9uX2ludGVycnVwdCgpOwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYXBpYy5jIGIveGVu
L2FyY2gveDg2L2FwaWMuYwo+IGluZGV4IGZhZmMwYmQuLmU1ZjAwNGEgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gveDg2L2FwaWMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiBAQCAtMTQx
MCw3ICsxNDEwLDkgQEAgdm9pZCBzcHVyaW91c19pbnRlcnJ1cHQoc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MpCj4gICAgICAgICAgYWNrX0FQSUNfaXJxKCk7Cj4gICAgICAgICAgaWYgKHRoaXNf
Y3B1KHN0YXRlX2R1bXBfcGVuZGluZykpIHsKPiAgICAgICAgICAgICAgdGhpc19jcHUoc3RhdGVf
ZHVtcF9wZW5kaW5nKSA9IGZhbHNlOwo+ICsjaWZkZWYgQ09ORklHX0hBU19LRVlIQU5ETEVSCj4g
ICAgICAgICAgICAgIGR1bXBfZXhlY3N0YXRlKHJlZ3MpOwo+ICsjZW5kaWYKPiAgICAgICAgICAg
ICAgcmV0dXJuOwo+ICAgICAgICAgIH0KPiAgICAgIH0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCj4gaW5kZXggYzgzODUwNi4uNDUwNTQxYyAx
MDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25m
aWcKPiBAQCAtMzY4LDQgKzM2OCwxMyBAQCBjb25maWcgRE9NMF9NRU0KPiAgCj4gIAkgIExlYXZl
IGVtcHR5IGlmIHlvdSBhcmUgbm90IHN1cmUgd2hhdCB0byBzcGVjaWZ5Lgo+ICAKPiArY29uZmln
IEhBU19LRVlIQU5ETEVSCgpBRkFJSyB0aGUgSEFTXyogY29uZmlnIG9wdGlvbnMgYXJlIG1lYW50
IHRvIGJlIHNlbGVjdGVkIGJ5IG90aGVyIG9wdGlvbnMKYW5kIG5vdCBiZSB1c2VyIHNlbGVjdGFi
bGUuCgpTbyBJIHRoaW5rIHlvdSBzaG91bGQgZHJvcCB0aGUgIkhBU18iIGFuZCBtYXliZSB1c2Ug
dGhlIHBsdXJhbCBhcyBEYXJpbwphbHJlYWR5IHN1Z2dlc3RlZCAoIktFWUhBTkRMRVJTIikuCgo+
ICsJYm9vbCAiRW5hYmxlL0Rpc2FibGUga2V5aGFuZGxlciIKPiArCWRlZmF1bHQgeQo+ICsJLS0t
aGVscC0tLQo+ICsJICBFbmFibGUgb3IgZGlzYWJsZSBrZXloYW5kbGVyIGZ1bmN0aW9uLgo+ICsJ
ICBrZXloYW5kbGVyIG1haW5seSB1c2VkIGZvciBkZWJ1ZyB1c2FnZSBieSBkZXZlbG9wZXJzIHdo
aWNoIGNhbiBkdW1wCj4gKwkgIHhlbiBtb2R1bGUoZWcuIHRpbWVyLCBzY2hlZHVsZXIpIHN0YXR1
cyBhdCBydW50aW1lIGJ5IGlucHV0IGNoYXJhY3Rlcgo+ICsJICBmcm9tIGNvbnNvbGUuCgpJJ2Qg
ZHJvcCB0aGUgImJ5IGRldmVsb3BlcnMiLiBJbiBjYXNlIG9mIGN1c3RvbWVyIHByb2JsZW1zIHdp
dGggWGVuCmhvc3RzIHRoZSBvdXRwdXQgb2Yga2V5aGFuZGxlcnMgaXMgcmVxdWVzdGVkIG9uIGEg
cmF0aGVyIHJlZ3VsYXIgYmFzZS4KCj4gKwo+ICBlbmRtZW51Cj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vTWFrZWZpbGUgYi94ZW4vY29tbW9uL01ha2VmaWxlCj4gaW5kZXggYmNhNDhlNi4uYzdi
Y2QyNiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCj4gKysrIGIveGVuL2NvbW1v
bi9NYWtlZmlsZQo+IEBAIC0xNiw3ICsxNiw3IEBAIG9iai15ICs9IGd1ZXN0Y29weS5vCj4gIG9i
ai1iaW4teSArPSBndW56aXAuaW5pdC5vCj4gIG9iai15ICs9IGlycS5vCj4gIG9iai15ICs9IGtl
cm5lbC5vCj4gLW9iai15ICs9IGtleWhhbmRsZXIubwo+ICtvYmotJChDT05GSUdfSEFTX0tFWUhB
TkRMRVIpICs9IGtleWhhbmRsZXIubwo+ICBvYmotJChDT05GSUdfS0VYRUMpICs9IGtleGVjLm8K
PiAgb2JqLSQoQ09ORklHX0tFWEVDKSArPSBraW1hZ2Uubwo+ICBvYmoteSArPSBsaWIubwo+IGRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdXBvb2wuYyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4g
aW5kZXggMzFhYzMyMy4uNzIxYTcyOSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2NwdXBvb2wu
Ywo+ICsrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4gQEAgLTY5OSw2ICs2OTksNyBAQCBpbnQg
Y3B1cG9vbF9kb19zeXNjdGwoc3RydWN0IHhlbl9zeXNjdGxfY3B1cG9vbF9vcCAqb3ApCj4gICAg
ICByZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICsjaWZkZWYgQ09ORklHX0hBU19LRVlIQU5ETEVSCj4g
IHZvaWQgZHVtcF9ydW5xKHVuc2lnbmVkIGNoYXIga2V5KQo+ICB7Cj4gICAgICB1bnNpZ25lZCBs
b25nICAgIGZsYWdzOwo+IEBAIC03MzAsNiArNzMxLDcgQEAgdm9pZCBkdW1wX3J1bnEodW5zaWdu
ZWQgY2hhciBrZXkpCj4gICAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7Cj4gICAgICBzcGlu
X3VubG9jaygmY3B1cG9vbF9sb2NrKTsKPiAgfQo+ICsjZW5kaWYKPiAgCj4gIHN0YXRpYyBpbnQg
Y3B1X2NhbGxiYWNrKAo+ICAgICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuZmIsIHVuc2lnbmVk
IGxvbmcgYWN0aW9uLCB2b2lkICpoY3B1KQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVk
dWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBpbmRleCA2NmYxZTI2Li42MTdjNDQ0IDEw
MDY0NAo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+ICsrKyBiL3hlbi9jb21tb24vc2No
ZWR1bGUuYwo+IEBAIC0xOTEzLDYgKzE5MTMsNyBAQCB2b2lkIHNjaGVkdWxlcl9mcmVlKHN0cnVj
dCBzY2hlZHVsZXIgKnNjaGVkKQo+ICAgICAgeGZyZWUoc2NoZWQpOwo+ICB9Cj4gIAo+ICsjaWZk
ZWYgQ09ORklHX0hBU19LRVlIQU5ETEVSCj4gIHZvaWQgc2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1
cG9vbCAqYykKPiAgewo+ICAgICAgdW5zaWduZWQgaW50ICAgICAgaTsKPiBAQCAtMTk0MSw2ICsx
OTQyLDcgQEAgdm9pZCBzY2hlZHVsZV9kdW1wKHN0cnVjdCBjcHVwb29sICpjKQo+ICAgICAgICAg
ICAgICBTQ0hFRF9PUChzY2hlZCwgZHVtcF9jcHVfc3RhdGUsIGkpOwo+ICAgICAgfQo+ICB9Cj4g
KyNlbmRpZgo+ICAKPiAgdm9pZCBzY2hlZF90aWNrX3N1c3BlbmQodm9pZCkKPiAgewo+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4va2V5aGFuZGxlci5oIGIveGVuL2luY2x1ZGUveGVuL2tl
eWhhbmRsZXIuaAo+IGluZGV4IDUxMzFlODYuLjEwNTBiODAgMTAwNjQ0Cj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2tleWhhbmRsZXIuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9rZXloYW5kbGVy
LmgKPiBAQCAtMjgsNiArMjgsNyBAQCBzdHJ1Y3QgY3B1X3VzZXJfcmVnczsKPiAgdHlwZWRlZiB2
b2lkIChpcnFfa2V5aGFuZGxlcl9mbl90KSh1bnNpZ25lZCBjaGFyIGtleSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7Cj4g
IAo+ICsjaWZkZWYgQ09ORklHX0hBU19LRVlIQU5ETEVSCj4gIC8qIEluaXRpYWxpemUga2V5dGFi
bGUgd2l0aCBkZWZhdWx0IGhhbmRsZXJzLiAqLwo+ICB2b2lkIGluaXRpYWxpemVfa2V5dGFibGUo
dm9pZCk7Cj4gIAo+IEBAIC00OCw0ICs0OSwxNyBAQCB2b2lkIHJlZ2lzdGVyX2lycV9rZXloYW5k
bGVyKHVuc2lnbmVkIGNoYXIga2V5LAo+ICAvKiBJbmplY3QgYSBrZXlwcmVzcyBpbnRvIHRoZSBr
ZXktaGFuZGxpbmcgc3Vic3lzdGVtLiAqLwo+ICBleHRlcm4gdm9pZCBoYW5kbGVfa2V5cHJlc3Mo
dW5zaWduZWQgY2hhciBrZXksIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsKPiAgCj4gKyNl
bHNlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpbml0aWFsaXplX2tleXRhYmxlKHZvaWQpIHt9Cj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCByZWdpc3Rlcl9rZXloYW5kbGVyKHVuc2lnbmVkIGNoYXIga2V5
LCBrZXloYW5kbGVyX2ZuX3QgKmZuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpkZXNjLCBib29sX3QgZGlhZ25vc3RpYykge30KPiArc3RhdGlj
IGlubGluZSB2b2lkIHJlZ2lzdGVyX2lycV9rZXloYW5kbGVyKHVuc2lnbmVkIGNoYXIga2V5LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXJxX2tleWhhbmRs
ZXJfZm5fdCAqZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpkZXNjLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbF90IGRpYWdub3N0aWMpIHt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQg
aGFuZGxlX2tleXByZXNzKHVuc2lnbmVkIGNoYXIga2V5LAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKSB7fQo+ICsjZW5kaWYK
PiArCj4gICNlbmRpZiAvKiBfX1hFTl9LRVlIQU5ETEVSX0hfXyAqLwo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vbGliLmggYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiBpbmRleCBlMGI3
YmNiLi44NzEwMzA1IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+IEBAIC0xNzEsOCArMTcxLDEwIEBAIGV4dGVybiB1bnNp
Z25lZCBpbnQgdGFpbnRlZDsKPiAgZXh0ZXJuIGNoYXIgKnByaW50X3RhaW50ZWQoY2hhciAqc3Ry
KTsKPiAgZXh0ZXJuIHZvaWQgYWRkX3RhaW50KHVuc2lnbmVkIGludCB0YWludCk7Cj4gIAo+ICsj
aWZkZWYgQ09ORklHX0hBU19LRVlIQU5ETEVSCj4gIHN0cnVjdCBjcHVfdXNlcl9yZWdzOwo+ICB2
b2lkIGR1bXBfZXhlY3N0YXRlKHN0cnVjdCBjcHVfdXNlcl9yZWdzICopOwo+ICsjZW5kaWYKPiAg
Cj4gIHZvaWQgaW5pdF9jb25zdHJ1Y3RvcnModm9pZCk7Cj4gIAo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gaW5kZXggNzQ4
YmIwZi4uYjgyY2RlZSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gQEAgLTk5NCw4ICs5OTQsMTAgQEAgaW50IGNw
dXBvb2xfYWRkX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBpbnQgcG9vbGlkKTsKPiAgdm9pZCBj
cHVwb29sX3JtX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKTsKPiAgaW50IGNwdXBvb2xfbW92ZV9k
b21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpOwo+ICBpbnQgY3B1cG9v
bF9kb19zeXNjdGwoc3RydWN0IHhlbl9zeXNjdGxfY3B1cG9vbF9vcCAqb3ApOwo+ICsjaWZkZWYg
Q09ORklHX0hBU19LRVlIQU5ETEVSCj4gIHZvaWQgc2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1cG9v
bCAqYyk7Cj4gIGV4dGVybiB2b2lkIGR1bXBfcnVucSh1bnNpZ25lZCBjaGFyIGtleSk7Cj4gKyNl
bmRpZgo+ICAKPiAgdm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNp
bmZvICpwaSk7CgpXaHkgc3RvcHBpbmcgaGFsZndheSBoZXJlPyBUaGVyZSBhcmUgbG90cyBvZiBv
dGhlciBrZXloYW5kbGVycyB3aGljaCBjYW4KYmUgcmVtb3ZlZCBmb3IgdGhlIGh5cGVydmlzb3Ig
aW4gY2FzZSB0aGVyZSBpcyBubyBjb2RlIGNhbGxpbmcgdGhlbS4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
