Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942DE7C924
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 18:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrjU-0003JH-7b; Wed, 31 Jul 2019 16:45:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWEJ=V4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsrjS-0003JC-IY
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:45:42 +0000
X-Inumbo-ID: a12a46d8-b3b2-11e9-b1b8-43b0d81510c4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a12a46d8-b3b2-11e9-b1b8-43b0d81510c4;
 Wed, 31 Jul 2019 16:45:40 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JQ6qj36lxBJHr0fzQ7RVk1rW9NPVvvXOmyEXw1SBMMKWdvDkaAo8+e10UPxg09Lsef8GecMpiG
 Y2WDu+hELdkyjeVQQy1b2mGJgTXD9CJp/YUI76Xm80tzwKoyTfybigp1LFihk4/QAvBFQ85Vm3
 woENs4HFzgBwd6b8xYBJr5HSishJPSOQ6AdXmO+yy1lh81QxUFD+FWo3pyi4Gw4mvLTBjK0OZc
 ZBXntRi0/2/x5RdGDkqCCCywBNBo97D6xdNiAR+xnSiAQp011eJ5bRC0844eHoDkITvrv8Hjua
 umI=
X-SBRS: 2.7
X-MesageID: 3796624
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,330,1559534400"; 
   d="scan'208";a="3796624"
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
Date: Wed, 31 Jul 2019 17:45:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDcvMjAxOSAxNzoyNCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gVGhlcmUgYXJl
IGNvZGluZyBzdHlsZSBydWxlcyB0aGF0IGFyZSB3aWRlbHkgYWNjZXB0ZWQgYnkgY29tbXVuaXR5
LAo+IGJ1dCBuZXdlciB3ZXJlIGZvcm1hbGl6ZWQgaW4gdGhlIGRvY3VtZW50LiBOb3RhYmxlIGV4
YW1wbGUgaXMgdGhlCj4gcXVlc3Rpb24gb24gaG93IGZ1bmN0aW9uIGFyZ3VtZW50cyBhbmQgcGFy
YW1ldGVycyBzaG91bGQgYmUgaW5kZW50ZWQKPiB3aGVuIHRoZXkgZG8gbm90IGZpdCBpbnRvIG9u
ZSBsaW5lLgo+Cj4gVGhpcyBxdWVzdGlvbiB3YXMgcmFpc2VkIG11bHRpcGxlIHRpbWVzIGxhdGVs
eSwgbW9zdGx5IGJlY2F1c2Ugb2YKPiBvbmdvaW5nIGVmZm9ydHMgdG8gY3JlYXRlIFhlbiBjb2Rp
bmcgc3R5bGUgZm9ybWF0dGluZyB0b29sIGFuZCBiZWNhdXNlCj4gb2YgbmV3IGNvbW11bml0eSBt
ZW1iZXJzLCB3aG8gYXJlIG5vdCBhd2FyZSBvZiBzdWNoIHVud3JpdHRlbiBydWxlcy4KPgo+IEFj
dHVhbGx5LCB0aGlzIHJ1bGUgaXMgYWxyZWFkeSBpbXBsaWNpdGx5IGRlZmluZWQgaW4gdGhlIGRv
Y3VtZW50IGJ5Cj4gZGVmaW5pbmcgZW1hY3MgY29kaW5nIHN0eWxlOiAnYy1maWxlLXN0eWxlOiAi
QlNEIicuIEluIHRoaXMgbW9kZSBlbWFjcwo+IGxpbmVzIHVwIGZ1bmN0aW9uIGFyZ3VtZW50cyB1
bmRlciB0aGUgZmlyc3QgYXJndW1lbnQuIE5hdHVyYWxseSwgbW9zdAo+IG9mIFhlbiBjb2RlIGlz
IHdyaXR0ZW4gaW4gdGhpcyBzdHlsZS4KPgo+IFNvLCBsZXRzIHN0YXRlIHRoZSBvYnZpb3VzIGFu
ZCBmaXggdGhpcyBydWxlIGV4cGxpY2l0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIg
QmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4gLS0tCj4gIENPRElOR19TVFlM
RSB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvQ09ESU5HX1NUWUxFIGIvQ09ESU5HX1NUWUxFCj4gaW5kZXggNmNj
NWI3NzRjZi4uNjQ3OTIxNWExNSAxMDA2NDQKPiAtLS0gYS9DT0RJTkdfU1RZTEUKPiArKysgYi9D
T0RJTkdfU1RZTEUKPiBAQCAtNTMsNiArNTMsMjAgQEAgTGluZSBMZW5ndGgKPiAgTGluZXMgc2hv
dWxkIGJlIGxlc3MgdGhhbiA4MCBjaGFyYWN0ZXJzIGluIGxlbmd0aC4gIExvbmcgbGluZXMgc2hv
dWxkCj4gIGJlIHNwbGl0IGF0IHNlbnNpYmxlIHBsYWNlcyBhbmQgdGhlIHRyYWlsaW5nIHBvcnRp
b25zIGluZGVudGVkLgo+ICAKPiArRm9yIG11bHRpbGluZSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBh
bmQgY2FsbCBlYWNoIG5ldyBsaW5lIHNob3VsZCBiZQo+ICthbGlnbmVkIHdpdGggdGhlIGZpcnN0
IHRoZSBwYXJhbWV0ZXIgb3IgYXJndW1lbnQuIGUuZy46Cj4gKwo+ICt2b2lkIG15X2Z1bmN0aW9u
X3dpdGhfbG9uZ19uYW1lKHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lICpzdHJ1Y3QxLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1l
ICpzdHJ1Y3QyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBsZW5n
dGh5X3N0cnVjdF9uYW1lICpzdHJ1Y3QzKTsKPiArCj4gK29yCj4gKwo+ICtmdW5jdGlvbl93aXRo
X3NvX21hbnlfcGFyYW1zKHdvcmR5X3BhcmFtZXRlcjEsIHdvcmR5X3BhcmFtZXRlcjIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgd29yZHlfcGFyYW1ldGVyMywgd29yZHlfcGFyYW1l
dGVyNCk7Cj4gKwo+ICtUaGUgc2FtZSBhcHBsaWVzIGZvciBtYWNyb3MuCgpGb3IgdmVyeSB3b3Jk
eSBmdW5jdGlvbnMsIG9yIG9uZXMgd2l0aCBzaWxseSBxdWFudGl0aWVzIG9mIHBhcmFtZXRlcnMs
CnRoZSBmb2xsb3dpbmcgaXMgYWxzbyBhY2NlcHRhYmxlCgp2b2lkIG15X2Z1bmN0aW9uX3dpdGhf
bG9uZ19hbmRfc2lsbHlfbmFtZSgKwqDCoMKgIHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lICpz
dHJ1Y3QxLCB1bnNpZ25lZCBpbnQgd29tYmxlLCB1bnNpZ25lZAppbnQgd2hhdHNpdCwKwqDCoMKg
IHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lICpzdHJ1Y3QyLCBib29sIHllcywgYm9vbCBubywg
Ym9vbCBtYXliZSwKwqDCoMKgIGJvb2wgZmlsZV9ub3RfZm91bmQsIHN0cnVjdCBsZW5ndGh5X3N0
cnVjdF9uYW1lICpzdHJ1Y3QzLCBzdHJ1Y3QKbGVuZ3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0NCk7
Cgp3aGljaCB5b3Ugd2lsbCBmaW5kIGluIGEgZmV3IHBsYWNlcyB0aHJvdWdob3V0IHRoZSBjb2Rl
LCBiZWNhdXNlIHRoZQphYm92ZSBkb2Vzbid0IHdhc3RlIGVub3VnaCB2ZXJ0aWNhbCBzcGFjZSB0
byBmaXQgc2V2ZXJhbCBmdW5jdGlvbnMgaW4sCmFuZCBwdXNoIGFsbCB0aGUgcmVsZXZhbnQgZGV0
YWlscyB0byB0aGUgUkhTLgoKUGVyIHRoZSBhYm92ZSBydWxlcywgdGhlIHJlc3VsdCB3b3VsZCBi
ZSB0aGlzOgoKdm9pZCBteV9mdW5jdGlvbl93aXRoX2xvbmdfYW5kX3NpbGx5X25hbWUoc3RydWN0
IGxlbmd0aHlfc3RydWN0X25hbWUKKnN0cnVjdDEsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dW5zaWduZWQgaW50IHdvbWJsZSwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgd2hhdHNpdCwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1
Y3RfbmFtZQoqc3RydWN0MiwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHllcywgYm9v
bCBubywgYm9vbCBtYXliZSwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGZpbGVfbm90
X2ZvdW5kLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9u
YW1lCipzdHJ1Y3QzLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsZW5ndGh5X3N0
cnVjdF9uYW1lCipzdHJ1Y3Q0KTsKCk9mIGNvdXJzZSwgdGhpcyBpcyBhbHNvIGEgc2lnbiB0aGF0
IG1heWJlIHRoZSBmdW5jdGlvbiBzaWduYXR1cmUgd2FudHMKY2hhbmdpbmcgYW55d2F5LCBidXQg
dGhhdCBtYXkgbm90IGJlIHBvc3NpYmxlL3NlbnNpYmxlIGF0IHRoZSB0aW1lLgoKQXMgd2l0aCBl
dmVyeXRoaW5nLCB0aGUgY29kaW5nIHN0eWxlIGlzIGEgc2V0IG9mIGd1aWRlbGluZXMgd2hpY2gg
YXJlCmFwcGxpY2FibGUgdG8gOTglIG9mIGNhc2VzLCBidXQgdGhlcmUgYXJlIGNhc2VzIHdoZXJl
IGFyZW4ndAphcHByb3ByaWF0ZSwgYW5kIGNvbW1vbiBzZW5zZSBpcyB0aGUgb25seSByZWFzb25h
YmxlIGRlY2lkaW5nIGZhY3Rvci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
