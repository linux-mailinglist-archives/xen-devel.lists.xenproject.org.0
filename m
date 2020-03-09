Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD87817E446
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 17:06:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBKsg-0001L6-4E; Mon, 09 Mar 2020 16:03:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBKse-0001L1-MO
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 16:03:48 +0000
X-Inumbo-ID: 8e836e78-621f-11ea-ac59-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e836e78-621f-11ea-ac59-12813bfff9fa;
 Mon, 09 Mar 2020 16:03:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5BECAD6C;
 Mon,  9 Mar 2020 16:03:45 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
 <CABfawhnqPqa7BjnNTqv+x7CJrpN9VSrQMycfkPQYgHVLy9u-gA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d86ba8d-8d53-38e1-4d70-bfb53809e98d@suse.com>
Date: Mon, 9 Mar 2020 17:03:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnqPqa7BjnNTqv+x7CJrpN9VSrQMycfkPQYgHVLy9u-gA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxNjo1MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgTWFy
IDksIDIwMjAgYXQgNTo0OSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL21lbV9hY2Nlc3MuaAo+PiArKysgYi94ZW4v
aW5jbHVkZS9hc20tYXJtL21lbV9hY2Nlc3MuaAo+PiBAQCAtMTcsOSArMTcsMTEgQEAKPj4gICNp
Zm5kZWYgX0FTTV9BUk1fTUVNX0FDQ0VTU19ICj4+ICAjZGVmaW5lIF9BU01fQVJNX01FTV9BQ0NF
U1NfSAo+Pgo+PiArc3RydWN0IHZtX2V2ZW50X3N0Owo+PiArCj4+ICBzdGF0aWMgaW5saW5lCj4+
ICBib29sIHAybV9tZW1fYWNjZXNzX2VtdWxhdGVfY2hlY2soc3RydWN0IHZjcHUgKnYsCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgdm1fZXZlbnRfcmVzcG9uc2Vf
dCAqcnNwKQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCB2bV9ldmVudF9zdCAqcnNwKQo+PiAgewo+PiAgICAgIC8qIE5vdCBzdXBwb3J0ZWQgb24gQVJN
LiAqLwo+PiAgICAgIHJldHVybiBmYWxzZTsKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
ZW1fYWNjZXNzLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fYWNjZXNzLmgKPj4g
QEAgLTI2LDYgKzI2LDggQEAKPj4gICNpZm5kZWYgX19BU01fWDg2X01FTV9BQ0NFU1NfSF9fCj4+
ICAjZGVmaW5lIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXwo+Pgo+PiArc3RydWN0IHZtX2V2ZW50
X3N0Owo+IAo+IFdvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBkZWZpbmUgdGhpcyBpbiB4
ZW4vbWVtX2FjY2Vzcy5oIGluc3RlYWQKPiBvZiBoYXZpbmcgdG8gZG8gaXQgaW4gYm90aCBhc20g
dmVyc2lvbnM/IE5vdGhpbmcgZGlyZWN0bHkgaW5jbHVkZXMKPiBhc20vbWVtX2FjY2Vzcy5oLCBh
bGwgdXNlcnMgaW5jbHVkZSB4ZW4vbWVtX2FjY2Vzcy5oCgpJZiB0aGF0J3Mgd2hhdCB5b3UgcHJl
ZmVyIC0gSSBjYW4gY2VydGFpbmx5IGRvIHNvLiBJdCdsbCBsb29rIGEKbGl0dGxlIG9kZCB0aGVu
LCBhcyB0aGUgZm9yd2FyZCBkZWNsYXJhdGlvbiBoYXMgdG8gY29tZSBhaGVhZCBvZgoKI2luY2x1
ZGUgPGFzbS9tZW1fYWNjZXNzLmg+CgpKdXN0IGxldCBtZSBrbm93IGlmIHlvdSByZWFsbHkgcHJl
ZmVyIGl0IHRoYXQgd2F5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
