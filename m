Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E814664C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 12:06:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuaHM-0007kc-2N; Thu, 23 Jan 2020 11:04:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuaHK-0007kX-Cj
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 11:04:02 +0000
X-Inumbo-ID: 0aab9db2-3dd0-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aab9db2-3dd0-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 11:03:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6820CB00D;
 Thu, 23 Jan 2020 11:03:52 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
Date: Thu, 23 Jan 2020 12:04:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122202343.5703-2-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/7] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiBUaGlzIGFsbG93cyB1cyB0byBz
ZXQgYXNpZGUgc29tZSBhZGRyZXNzIHNwYWNlIGZvciBleGVjdXRhYmxlIG1hcHBpbmcuCj4gVGhp
cyBmaXhlZCBtYXAgcmFuZ2Ugc3RhcnRzIGZyb20gWEVOX1ZJUlRfRU5EIHNvIHRoYXQgaXQgaXMg
d2l0aGluIHJlYWNoCj4gb2YgdGhlIC50ZXh0IHNlY3Rpb24uCj4gCj4gU2hpZnQgdGhlIHBlcmNw
dSBzdHViIHJhbmdlIGFuZCBsaXZlcGF0Y2ggcmFuZ2UgYWNjb3JkaW5nbHkuCgpIbW0sIHRoZSBs
aXZlcGF0Y2ggcmFuZ2UgZ2V0cyBzaHJ1bmssIG5vdCBzaGlmdGVkLCBidXQgeWVzLiBJcyB0aGVy
ZQphIHBhcnRpY3VsYXIgcmVhc29uIHdoeSB5b3UgbW92ZSB0aGUgc3R1YnMgYXJlYSBkb3duPyBJ
dCBsb29rcyBhcyBpZgp0aGUgcGF0Y2ggd291bGQgYmUgc21hbGxlciBvdmVyYWxsIGlmIHlvdSBk
aWRuJ3QuIChQb3NzaWJseSBkb3duCnRoZSByb2FkIHRoZSBzdHVicyBhcmVhIGNvdWxkIGJlIG1h
ZGUgcGFydCBvZiB0aGUgRklYQUREUl9YIHJhbmdlCmFueXdheS4pCgo+IEBAIC01NzYzLDYgKzU3
NjUsMTMgQEAgdm9pZCBfX3NldF9maXhtYXAoCj4gICAgICBtYXBfcGFnZXNfdG9feGVuKF9fZml4
X3RvX3ZpcnQoaWR4KSwgX21mbihtZm4pLCAxLCBmbGFncyk7Cj4gIH0KPiAgCj4gK3ZvaWQgX19z
ZXRfZml4bWFwX3goCj4gKyAgICBlbnVtIGZpeGVkX2FkZHJlc3Nlc194IGlkeCwgdW5zaWduZWQg
bG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gK3sKPiArICAgIEJVR19PTihpZHggPj0g
X19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzX3gpOwoKQWxzbyBjaGVjayBmb3IgRklYX1hfUkVTRVJW
RUQ/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgKPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2ZpeG1hcC5oCj4gQEAgLTE1LDYgKzE1LDkgQEAKPiAgI2luY2x1ZGUgPGFz
bS9wYWdlLmg+Cj4gIAo+ICAjZGVmaW5lIEZJWEFERFJfVE9QIChWTUFQX1ZJUlRfRU5EIC0gUEFH
RV9TSVpFKQo+ICsjZGVmaW5lIEZJWEFERFJfWF9UT1AgKFhFTl9WSVJUX0VORCAtIFBBR0VfU0la
RSkKPiArLyogVGhpcyBjb25zdGFudCBpcyBkZXJpdmVkIGZyb20gZW51bSBmaXhlZF9hZGRyZXNz
ZXNfeCBiZWxvdyAqLwo+ICsjZGVmaW5lIE1BWF9GSVhBRERSX1hfU0laRSAoMiA8PCBQQUdFX1NI
SUZUKQoKSWYgdGhpcyBjYW4ndCBiZSBwcm9wZXJseSBkZXJpdmVkLCB0aGVuIGEgQlVJTERfQlVH
X09OKCkgaXMgbmVlZGVkLgpCdXQgZGlkbid0IHdlIGRpc2N1c3Mgb24gaXJjIGFscmVhZHkgcG9z
c2libGUgYXBwcm9hY2hlcyBvZiBob3cgdG8KZGVyaXZlIGl0IGZyb20gdGhlIGVudW0/IERpZCBu
b25lIG9mIHRoaXMgd29yaz8KCj4gQEAgLTg5LDYgKzkyLDMxIEBAIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyB2aXJ0X3RvX2ZpeChjb25zdCB1bnNpZ25lZCBsb25nIHZhZGRyKQo+ICAgICAg
cmV0dXJuIF9fdmlydF90b19maXgodmFkZHIpOwo+ICB9Cj4gIAo+ICtlbnVtIGZpeGVkX2FkZHJl
c3Nlc194IHsKPiArICAgIC8qIEluZGV4IDAgaXMgcmVzZXJ2ZWQgc2luY2UgZml4X3hfdG9fdmly
dCgwKSA9PSBGSVhBRERSX1hfVE9QLiAqLwo+ICsgICAgRklYX1hfUkVTRVJWRUQsCj4gKyNpZmRl
ZiBDT05GSUdfSFlQRVJWX0dVRVNUCj4gKyAgICBGSVhfWF9IWVBFUlZfSENBTEwsCj4gKyNlbmRp
Zgo+ICsgICAgX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzX3gKPiArfTsKPiArCj4gKyNkZWZpbmUg
RklYQUREUl9YX1NJWkUgIChfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXNfeCA8PCBQQUdFX1NISUZU
KQo+ICsjZGVmaW5lIEZJWEFERFJfWF9TVEFSVCAoRklYQUREUl9YX1RPUCAtIEZJWEFERFJfWF9T
SVpFKQo+ICsKPiArZXh0ZXJuIHZvaWQgX19zZXRfZml4bWFwX3goCj4gKyAgICBlbnVtIGZpeGVk
X2FkZHJlc3Nlc194IGlkeCwgdW5zaWduZWQgbG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgZmxhZ3Mp
Owo+ICsKPiArI2RlZmluZSBzZXRfZml4bWFwX3goaWR4LCBwaHlzKSBcCj4gKyAgICBfX3NldF9m
aXhtYXBfeChpZHgsIChwaHlzKT4+UEFHRV9TSElGVCwgUEFHRV9IWVBFUlZJU09SX1JYIHwgTUFQ
X1NNQUxMX1BBR0VTKQoKQ2FuJ3QgX19zZXRfZml4bWFwKCkgYmUgdXNlZCBoZXJlLCBtYWtpbmcg
aXRzIGltcGxlbWVudGF0aW9uIGRlcml2ZQp3aGljaCBvbmUgaXMgbWVhbiBmcm9tIHdoZXRoZXIg
X1BBR0VfTlggaXMgc2V0IGluIHRoZSBwYXNzZWQgaW4gZmxhZ3M/CgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
