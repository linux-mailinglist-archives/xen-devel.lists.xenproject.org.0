Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994EC3CCE0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagkW-000398-J2; Tue, 11 Jun 2019 13:23:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hagkU-000393-OB
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 13:23:38 +0000
X-Inumbo-ID: 1d7427e2-8c4c-11e9-b123-e7a045f2eaa8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d7427e2-8c4c-11e9-b123-e7a045f2eaa8;
 Tue, 11 Jun 2019 13:23:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 07:23:34 -0600
Message-Id: <5CFFAB4F02000078002370E2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 07:23:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp>
In-Reply-To: <20190611124604.GB22930@gao-cwp>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 09/10] microcode: remove
 microcode_update_lock
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDE0OjQ2LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBXZWQsIEp1biAwNSwgMjAxOSBhdCAwODo1Mzo0NkFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+Pj4gQEAgLTMwNyw4ICszMDMsNyBAQCBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29kZShjb25z
dCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKPj4+ICAKPj4+ICAgICAgbWNfaW50ZWwg
PSBwYXRjaC0+bWNfaW50ZWw7Cj4+PiAgCj4+PiAtICAgIC8qIHNlcmlhbGl6ZSBhY2Nlc3MgdG8g
dGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5ICovCj4+PiAtICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsKPj4+ICsgICAgQlVHX09OKGxvY2Fs
X2lycV9pc19lbmFibGVkKCkpOwo+Pj4gIAo+Pj4gICAgICAvKgo+Pj4gICAgICAgKiBXcml0ZWJh
Y2sgYW5kIGludmFsaWRhdGUgY2FjaGVzIGJlZm9yZSB1cGRhdGluZyBtaWNyb2NvZGUgdG8gYXZv
aWQKPj4KPj5UaGlua2luZyBhYm91dCBpdCAtIHdoYXQgaGFwcGVucyBpZiB3ZSBoaXQgYW4gTk1J
IG9yICNNQyBoZXJlPwo+PndhdGNoZG9nX2Rpc2FibGUoKSwgYSBjYWxsIHRvIHdoaWNoIHlvdSBh
ZGQgaW4gYW4gZWFybGllciBwYXRjaCwKPj5kb2Vzbid0IHJlYWxseSBzdXBwcmVzcyB0aGUgZ2Vu
ZXJhdGlvbiBvZiBOTUlzLCBpdCBvbmx5IHRlbGxzIHRoZQo+PmhhbmRsZXIgbm90IHRvIGxvb2sg
YXQgdGhlIGFjY3VtdWxhdGVkIHN0YXRpc3RpY3MuCj4gCj4gSSB0aGluayB0aGV5IHNob3VsZCBi
ZSBzdXBwcmVzc2VkLiBBc2hvaywgY291bGQgeW91IGNvbmZpcm0gaXQ/Cj4gCj4gSSB3aWxsIGZp
Z3VyZSBvdXQgaG93IHRvIHN1cHByZXNzIHRoZW0gaW4gWGVuLgoKV2VsbCwgYWZhaWsgc3VwcHJl
c3NpbmcgI01DIGlzIGltcG9zc2libGUuIENSNC5NQ0UgY2xlYXIgbGVhZHMKdG8gaW1tZWRpYXRl
IHNodXRkb3duIGluIGNhc2Ugb2YgYSBtYWNoaW5lIGNoZWNrLCB1bmxlc3MgSSdtCm1pc3Rha2Vu
LiBUaGUgd2F0Y2hkb2cgTk1JLCBvdG9oLCBjb3VsZCBvZiBjb3Vyc2UgYmUgInByb3Blcmx5Igpk
aXNhYmxlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
