Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A2160D5
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 11:25:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNwJB-0007bL-5w; Tue, 07 May 2019 09:22:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNwJ9-0007bG-UY
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 09:22:43 +0000
X-Inumbo-ID: a5eb6306-70a9-11e9-ac9b-1b2c04510996
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5eb6306-70a9-11e9-ac9b-1b2c04510996;
 Tue, 07 May 2019 09:22:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 03:22:34 -0600
Message-Id: <5CD14E58020000780022C677@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 03:22:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1557159106-32381-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1557159106-32381-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/boot: Print the CPU model string
 alongside the Family/Model/Stepping info
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDE4OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTMwMywxMyArMzAzLDE4IEBAIHZvaWQgX19pbml0IGVhcmx5X2NwdV9pbml0KHZv
aWQpCj4gIAljLT54ODZfY2FwYWJpbGl0eVtjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfRlBVKV0g
PSBlZHg7Cj4gIAljLT54ODZfY2FwYWJpbGl0eVtjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfU1NF
MyldID0gZWN4Owo+ICAKPiArCWMtPmV4dGVuZGVkX2NwdWlkX2xldmVsID0gY3B1aWRfZWF4KDB4
ODAwMDAwMDApOwo+ICsJaWYgKChjLT5leHRlbmRlZF9jcHVpZF9sZXZlbCA+PiAxNikgIT0gMHg4
MDAwKQo+ICsJCWMtPmV4dGVuZGVkX2NwdWlkX2xldmVsID0gMDsKPiArCj4gIAlwcmludGsoWEVO
TE9HX0lORk8KPiAgCSAgICAgICAiQ1BVIFZlbmRvcjogJXMsIEZhbWlseSAldSAoJSN4KSwgTW9k
ZWwgJXUgKCUjeCksIFN0ZXBwaW5nICV1IChyYXcgJTA4eClcbiIsCj4gIAkgICAgICAgeDg2X2Nw
dWlkX3ZlbmRvcl90b19zdHIoYy0+eDg2X3ZlbmRvciksIGMtPng4NiwgYy0+eDg2LAo+ICAJICAg
ICAgIGMtPng4Nl9tb2RlbCwgYy0+eDg2X21vZGVsLCBjLT54ODZfbWFzaywgZWF4KTsKPiArCWlm
IChnZXRfbW9kZWxfbmFtZShjKSkKPiArCQlwcmludGsoWEVOTE9HX0lORk8gIkNQVSBNb2RlbDog
ICUuNDhzXG4iLCBjLT54ODZfbW9kZWxfaWQpOwoKQWZhaWNzIHRoZSBmdW5jdGlvbiBkb2Vzbid0
IHJldHVybiBmYWxzZSB3aGVuIHRoZSB0aHJlZSBsZWF2ZXMgYXJlCmFsbCB6ZXJvLiBJbiB0aGlz
IGNhc2UgdGhlIGxpbmUgc2hvdWxkIGltbyBub3QgYmUgbG9nZ2VkLgoKRnVydGhlcm1vcmUgdGhp
cyBleHRyYSBsaW5lIGlzIHJlZHVuZGFudCB3aXRoIHByaW50X2NwdV9pbmZvKCkgYXMKd2VsbCBh
cyBhZ2FpbnN0IHRoZSBpZGVhIG9mIHRoZSAiY3B1aW5mbyIgY29tbWFuZCBsaW5lIG9wdGlvbgoo
aW50ZW5kZWQgdG8gYmUgdXNlZCB0byBsb2cgbm9uLWVzc2VudGlhbCBkZXRhaWxzKS4gSSdkIGNl
cnRhaW5seQpwcmVmZXIgdGhlIGV4dHJhIGxpbmUgdG8gYmUgcXVhbGlmaWVkIGJ5IGFuIG9wdF9j
cHVfaW5mbyBjaGVjaywKYnV0IEkgd29uJ3QgaW5zaXN0LiBJbiBhbnkgZXZlbnQgSSdkIGxpa2Ug
dG8gYXNrIHRob3VnaCB0aGF0IHRoZQpyZWR1bmRhbmN5IGJlIGFkZHJlc3NlZC4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
