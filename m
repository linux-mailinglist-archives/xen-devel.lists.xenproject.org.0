Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5146A1270
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 09:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Ee2-0003fA-L4; Thu, 29 Aug 2019 07:14:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Ee1-0003f4-2B
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 07:14:57 +0000
X-Inumbo-ID: b39f7bf4-ca2c-11e9-ae5c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b39f7bf4-ca2c-11e9-ae5c-12813bfff9fa;
 Thu, 29 Aug 2019 07:14:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9E63AEAE;
 Thu, 29 Aug 2019 07:14:54 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-2-git-send-email-chao.gao@intel.com>
 <af707ba6-c606-0ec1-97aa-bb8f8bbdac3b@suse.com>
 <20190829071521.GA12650@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60fc7674-0839-f4a9-5928-26d1dc0e36b9@suse.com>
Date: Thu, 29 Aug 2019 09:14:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829071521.GA12650@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 01/15] microcode/intel: extend
 microcode_update_match()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAwOToxNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIw
MTkgYXQgMDU6MTI6MzRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjA4LjIw
MTkgMDM6MjUsIENoYW8gR2FvIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29k
ZV9pbnRlbC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKPj4+IEBA
IC0xMzQsMTQgKzEzNCwzOSBAQCBzdGF0aWMgaW50IGNvbGxlY3RfY3B1X2luZm8odW5zaWduZWQg
aW50IGNwdV9udW0sIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKQo+Pj4gICAgICByZXR1cm4g
MDsKPj4+ICB9Cj4+PiAgCj4+PiAtc3RhdGljIGlubGluZSBpbnQgbWljcm9jb2RlX3VwZGF0ZV9t
YXRjaCgKPj4+IC0gICAgdW5zaWduZWQgaW50IGNwdV9udW0sIGNvbnN0IHN0cnVjdCBtaWNyb2Nv
ZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsCj4+PiAtICAgIGludCBzaWcsIGludCBwZikKPj4+
ICsvKiBDaGVjayBhbiB1cGRhdGUgYWdhaW5zdCB0aGUgQ1BVIHNpZ25hdHVyZSBhbmQgY3VycmVu
dCB1cGRhdGUgcmV2aXNpb24gKi8KPj4+ICtzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVz
dWx0IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4+PiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2Nv
ZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsIHVuc2lnbmVkIGludCBjcHUpCj4+PiAgewo+Pj4g
LSAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVjb2RlX2NwdV9pbmZv
LCBjcHVfbnVtKTsKPj4+IC0KPj4+IC0gICAgcmV0dXJuIChzaWdtYXRjaChzaWcsIHVjaS0+Y3B1
X3NpZy5zaWcsIHBmLCB1Y2ktPmNwdV9zaWcucGYpICYmCj4+PiAtICAgICAgICAgICAgKG1jX2hl
YWRlci0+cmV2ID4gdWNpLT5jcHVfc2lnLnJldikpOwo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0
ZW5kZWRfc2lndGFibGUgKmV4dF9oZWFkZXI7Cj4+PiArICAgIGNvbnN0IHN0cnVjdCBleHRlbmRl
ZF9zaWduYXR1cmUgKmV4dF9zaWc7Cj4+PiArICAgIHVuc2lnbmVkIGludCBpOwo+Pj4gKyAgICBz
dHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBjcHUp
Owo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgc2lnID0gdWNpLT5jcHVfc2lnLnNpZzsKPj4+ICsgICAg
dW5zaWduZWQgaW50IHBmID0gdWNpLT5jcHVfc2lnLnBmOwo+Pj4gKyAgICB1bnNpZ25lZCBpbnQg
cmV2ID0gdWNpLT5jcHVfc2lnLnJldjsKPj4+ICsgICAgdW5zaWduZWQgbG9uZyBkYXRhX3NpemUg
PSBnZXRfZGF0YXNpemUobWNfaGVhZGVyKTsKPj4+ICsgICAgY29uc3Qgdm9pZCAqZW5kID0gKGNv
bnN0IHZvaWQgKiltY19oZWFkZXIgKyBnZXRfdG90YWxzaXplKG1jX2hlYWRlcik7Cj4+PiArCj4+
PiArICAgIGlmICggc2lnbWF0Y2goc2lnLCBtY19oZWFkZXItPnNpZywgcGYsIG1jX2hlYWRlci0+
cGYpICkKPj4+ICsgICAgICAgIHJldHVybiAobWNfaGVhZGVyLT5yZXYgPiByZXYpID8gTkVXX1VD
T0RFIDogT0xEX1VDT0RFOwo+Pgo+PiBEaWRuJ3QgeW91IGxvc2UgYSByYW5nZSBjaGVjayBhZ2Fp
bnN0ICJlbmQiIGFoZWFkIG9mIHRoaXMgaWYoKT8KPj4gZ2V0X3RvdGFsc2l6ZSgpIGFuZCBnZXRf
ZGF0YXNpemUoKSBhaXVpIGFsc28gd291bGQgbmVlZCB0byBsaXZlCj4+IGFmdGVyIGEgcmFuZ2Ug
Y2hlY2ssIGp1c3QgYSBzaXplb2YoKSAoaS5lLiBNQ19IRUFERVJfU0laRSkgYmFzZWQKPj4gb25l
LiBUaGlzIHdvdWxkIGFsc28gYWZmZWN0IHRoZSBjYWxsZXIgYXMgaXQgc2VlbXMuCj4gCj4gSSB0
aGluayBtaWNyb2NvZGVfc2FuaXR5X2NoZWNrKCkgaXMgZm9yIHRoaXMgcHVycG9zZS4gV2UgY2Fu
IGRvCj4gc2FuaXR5IGNoZWNrIGJlZm9yZSB0aGUgaWYoKS4gUGVyaGFwcywgd2UgY2FuIGp1c3Qg
YWRkIGFuIGFzc2VydGlvbgo+IHRoYXQgc2FuaXR5IGNoZWNrIHdvbid0IGZhaWwuIEJlY2F1c2Ug
d2hlbmV2ZXIgc2FuaXR5IGNoZWNrIGZhaWxlZAo+IHdoZW4gcGFzaW5nIGFuIHVjb2RlIGJsb2Is
IHdlIGp1c3QgZHJvcCB0aGUgdWNvZGU7IHdlIHdvbid0IHBhc3MgYW4KPiBicm9rZW4gdWNvZGUg
dG8gdGhpcyBmdW5jdGlvbi4KCldlbGwgLSB0aGF0J3MgdGhlIG1haW4gcXVlc3Rpb24uIFRoZSBw
dXJwb3NlIG9mIHRoaXMgcGF0Y2gsIGFmdGVyIGFsbCwKaXMgKGFpdWkpIHRvIGFsbG93IGNhbGxp
bmcgdGhlIGZ1bmN0aW9uIGluIG1vcmUgY2FzZXMuIElmIGFsbCBjYWxsZXJzCmFyZSBpbmRlZWQg
c3VwcG9zZWQgdG8gY2hlY2sgdGhlIGJhc2ljIHByb3BlcnRpZXMsIHRoZW4geWVzLCBhbiBBU1NF
UlQoKQp3b3VsZCBiZSBmaW5lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
