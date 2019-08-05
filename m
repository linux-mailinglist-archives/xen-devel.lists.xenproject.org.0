Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A22817C4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:01:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huahH-0000NS-39; Mon, 05 Aug 2019 10:58:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dpjS=WB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1huahF-0000NN-I0
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 10:58:33 +0000
X-Inumbo-ID: f6724125-b76f-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f6724125-b76f-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 10:58:31 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PDvl+wqKHvMqZ+Nz2U5VAx++doUWgRibWTPrms0IHAOuiR4ZOl3X40WZvmNsDEtY3m51ovpcIm
 waYKFYuyjx4evpeAJDu4jaKSu2z5ZFsG7eIAiGrkrQHTVuJ9eTCpSk4WNVPvI074AWC0xEq0GQ
 Kk8RQnWsAg1dcHpi9Nd1eFwE9UnNIi8LWNm/a+ur4as6l6jFgsBe+nFgDUUWJCdYQn8fYQJ5FO
 /1IZ1PeKLT+2tQXEb2eP/6LDkRh/y44YgLHvrmCBuUOzSRZKVdfa6jQ6n6ByX45+nLhrGFiSL3
 dBc=
X-SBRS: 2.7
X-MesageID: 3981893
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,349,1559534400"; 
   d="scan'208";a="3981893"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23880.2998.754926.767647@mariner.uk.xensource.com>
Date: Mon, 5 Aug 2019 11:57:58 +0100
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20190405171342.10902-1-george.dunlap@citrix.com>
References: <20190405171342.10902-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH RFC 1/2] scripts: Add script to do the
 repetitive bits of the release process
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuICBUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLiAgU29ycnkgYWJvdXQgdGhlIGRlbGF5
IHRvIHRoZQpyZXZpZXcuICBJIGZvdW5kIGl0LCB1bnNlbnQsIHdoaWxlIHJlY292ZXJpbmcgYSBj
cmFzaGVkIG1haWxyZWFkZXIKc2Vzc2lvbi4uLgoKR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFU
Q0ggUkZDIDEvMl0gc2NyaXB0czogQWRkIHNjcmlwdCB0byBkbyB0aGUgcmVwZXRpdGl2ZSBiaXRz
IG9mIHRoZSByZWxlYXNlIHByb2Nlc3MiKToKPiBXaXRoIHRoaXMgc2NyaXB0LCBvbmNlIHRoZSBt
YWluIGNoZWNrcyBhcmUgb3V0IG9mIHRoZSB3YXksIGRvaW5nIGEKPiByZWxlYXNlIChlaXRoZXIg
YW4gUkMgb3IgdGhlIGZpbmFsIHJlbGVhc2UpIHNob3VsZCBtb3N0bHkgYmUgYSBtYXR0ZXIKPiBv
ZiBleGVjdXRpbmcgYSBzZXF1ZW5jZSBvZiA0IGNvbW1hbmRzIGdpdmVuIGJ5IHRoZSBgaGVscGAg
ZnVuY3Rpb24gaW4KPiB0aGlzIHNjcmlwdC4KClNjcmlwdCBpcyBtaXNzaW5nIHNldCAtZS4gIEkn
bSBnZW5lcmFsbHkgbm90IGhhcHB5IHdpdGggdGhlIHx8IGZhaWwKcGF0dGVybiwgZXhjZXB0IGZv
ciBpbXByb3ZpbmcgZXJyb3IgbWVzc2FnZXMuICBJdCBtYWtlcyBpdCBmYXIgdG9vCmVhc3kgdG8g
YWNjaWRlbnRhbGx5IG1pc3MgYW4gZXJyb3IgY2hlY2suICBZb3VyIHNjcmlwdCBoYXMgYXQgbGVh
c3QgYQpmZXcgbWlzc2luZyBlcnJvciBjaGVja3MgYW5kIEkgZG9uJ3Qgd2FudCB0byByZWFkIGl0
IGFuZCB0cnkgdG8gc3BvdAp0aGVtIGFsbC4gIENhbiB5b3UgY2hhbmdlIHRoaXMgPwoKPiArIyMj
Cj4gKyMgR2VvcmdlJ3MgYmFzaCBsaWJyYXJ5IGNvcmUKPiArIyMjCgpZb3UndmUgY2xvbmVkIChh
bmQgcHJlc3VtYWJseSBub3QgaGFja2VkKSBzb21lIHBlcnNvbmFsIGxpYnJhcnkgb2YKeW91ciBv
d24gPyAgV2hhdCdzIHdyb25nIHdpdGggZ2V0b3B0KDEpIGVnCiAgIGV2YWwgIiQoZ2V0b3B0IC1z
IGJhc2ggLi4uICIkQCIpIgpTZWUgL3Vzci9zaGFyZS9kb2MvdXRpbC1saW51eC9leGFtcGxlcy9n
ZXRvcHQtcGFyc2UuYmFzaC4KCkFsdGhvdWdoLCBpdCdzIG5vdCBjbGVhciB0byBtZSB0aGF0IGEg
ZnVsbC1ibG93biBvcHRpb24gcGFyc2VyIGlzCmEgYmV0dGVyIGFwcHJvYWNoIHRoYW4KICB2YXIx
PURFRkFVTFQxCiAgdmFyMj1ERUZBVUxUMgogIGZvciB4IGluICIkQCI7IGRvIGV2YWwgIiR4Ijsg
ZG9uZQpmb3IgdGhpcyBzY3JpcHQsIHNpbmNlIGl0IHdpbGwgaGF2ZSBmZXcgdXNlcnMuCgo+ICtm
dW5jdGlvbiBjbWRsaW5lKCkKCkkgdGhpbmsgdGhlIGtleXdvcmQgYGZ1bmN0aW9uJyBoZXJlIGlz
IHVuaWRpb21hdGljIHNoZWxsLiAgKEkgdGhpbmsgdGhlCmJyYWNlIHBsYWNlIGlzIHRvbyBidXQg
SSBkb24ndCB3YW50IHRvIHF1aWJibGUgYWJvdXQgc3R5bGUuKQoKKyAgICBpbmZvIFJ1bm5pbmcg
IiR7YXJnc1swXX0iCisgICAgIiR7YXJnc1swXX0iICIke2FyZ3NbQF06MX0iIHx8IGV4aXQgMQoK
WW91IHNob3VsZCBwcm9iYWJseSBuYW1lc3BhY2UgdGhlc2Ugd2l0aCBhbiBhcHByb3ByaWF0ZSBw
cmVmaXgsIHJhdGhlcgp0aGFuIGV4cG9zaW5nIGV2ZXJ5IGludGVybmFsIGZ1bmN0aW9uIGFzIGEg
dG9wbGV2ZWwgdmVyYi4KCj4gK2Z1bmN0aW9uIHhlbi1tYWtlLXByZWZpeC1jb25maWcoKSB7Cj4g
KyAgICAkYXJnX3BhcnNlCj4gKwo+ICsgICAgIyBUT0RPOiBQaW5nIGRyYWxsLnVrLnhlbnNvdXJj
ZS5jb20gdG8gc2VlIGlmIHdlIGNhbiByZWFjaCBpdD8KPiArICAgIAo+ICsgICAgZGVmYXVsdCBj
YWNoZV9wcmVmaXggImdpdDovL2RyYWxsLnVrLnhlbnNvdXJjZS5jb206OTQxOS8iIDsgJGRlZmF1
bHRfcG9zdAo+ICsKPiArICAgIHBlcmwgLW5lICJpZigvXihbQS1aX10rX1VSTCkgXD89IChnaXQu
KikvKSB7IHByaW50IFwiXCQxID89ICR7Y2FjaGVfcHJlZml4fVwkMlxuXCI7IH0iIENvbmZpZy5t
ayA+PiAuY29uZmlnIHx8IGZhaWwgIkdlbmVyYXRpbmcgLmNvbmZpZyIKPiArICAgIGNhdCAuY29u
ZmlnCj4gK30KCk1heWJlIHdlIGNhbiBleHBlY3QgdGhlIGNhbGxlciB0byBoYXZlIHRoaXMgaW4g
dGhlaXIgZ2xvYmFsIGdpdApjb25maWcuICBJIGRvIHRoaXM6CgptYXJpbmVyOn4+IGdpdC1jb25m
aWcgLWwgfCBncmVwIGluc3RlYWQKdXJsLmdpdDovL2dpdC1jYWNoZS54cy5jaXRyaXRlLm5ldDo5
NDE5L2dpdDovLy5pbnN0ZWFkb2Y9Z2l0Oi8vCnVybC5naXQ6Ly9naXQtY2FjaGUueHMuY2l0cml0
ZS5uZXQ6OTQxOS8uaW5zdGVhZG9mPWdpdDovL2dpdC1jYWNoZS54cy5jaXRyaXRlLm5ldDo5NDE5
Lwp1cmwuZ2l0Oi8vZHJhbGw6OTQxOS9odHRwOi8vLmluc3RlYWRvZj1naXQ6Ly9kcmFsbDo5NDE5
L2h0dHA6Ly8KdXJsLmdpdDovL2RyYWxsOjk0MTkvaHR0cHM6Ly8uaW5zdGVhZG9mPWdpdDovL2Ry
YWxsOjk0MTkvaHR0cHM6Ly8KdXJsLmdpdDovL2RyYWxsOjk0MTkvZ2l0Oi8vLmluc3RlYWRvZj1n
aXQ6Ly9kcmFsbDo5NDE5L2dpdDovLwptYXJpbmVyOn4+Cgo+ICtmdW5jdGlvbiBzZXQtdGRpcigp
IHsKPiArICAgIGlmIFtbIC16ICIkdGRpciIgfHwgISAtZSAiJHRkaXIiIF1dIDsgdGhlbgo+ICsJ
aW5mbyAiJHRkaXIgZG9lc24ndCBleGlzdCwgdXNpbmcgL3RtcCIKPiArCXRkaXI9Ii90bXAiCj4g
KyAgICBmaQoKSXQgaXMgbm90IE9LIHRvIHVzZSAvdG1wLyR2LCBiZWNhdXNlIG9mIHRtcGZpbGUg
cmFjZXMuICBJZiB5b3UgZG9uJ3QKd2FudCB0byB1c2Ugc29tZXdoZXJlIGluIH4gdGhlbiB5b3Ug
bmVlZCB0byBtZXNzIHdpdGggbWt0ZW1wLgoKPiArZnVuY3Rpb24gdGFnKCkgewo+ICsgICAgJGFy
Z19wYXJzZQoKT3ZlcmFsbCBJIGFtIHN1cnByaXNlZCBhdCBob3cgbXVjaCBjb2RlIHRoZXJlIGlz
IGluIHRoaXMgc2NyaXB0LiAgSXQKc2VlbXMgbXVjaCBsb25nZXIgdGhhbiB0aGUgY3VycmVudCBy
dW5lcyBpbiB0aGUgcmVsZWFzZSBjaGVja2xpc3QuCgo+ICsgICAgaWYgW1sgLW4gIiRjIiBdXSA7
IHRoZW4KPiArCWluZm8gIkNoZWNraW5nIG91dCBjb21taXQgJGMiCj4gKwlnaXQgY2hlY2tvdXQg
JGMgfHwgZmFpbAo+ICsgICAgZWxzZQo+ICsJbG9jYWwgcQo+ICsJZ2l0IGNoZWNrb3V0IHN0YWJs
ZS0keCB8fCBmYWlsICJDb3VsZG4ndCBjaGVjayBvdXQgc3RhYmxlIGJyYW5jaCIKPiArCWdpdCBt
ZXJnZSB8fCBmYWlsICJNZXJnZSIKClN1cmVseSB3ZSByYXJlbHkgd2FudCB0byBkbyB0aGlzLCBh
bmQgbmV2ZXIgYXV0b21hdGljYWxseS4KCj4gKwlnaXQgbG9nIC1uIDEwCj4gKwlyZWFkIC1wICJF
bnRlciB0byBjb250aW51ZSwgYW55dGhpbmcgZWxzZSB0byBxdWl0OiAiIHEKCkJldHRlciB0byBh
c2sgZm9yIGEgInkiLiAgcmVhZCBtaWdodCByZXR1cm4gIiIgZHVlIHRvIGVvZi4KCj4gKyAgICBj
dnMgY2kgLW0gJHYgfHwgZmFpbCAiY3ZzIGNoZWNraW4iCj4gKwo+ICsgICAgc3NoIG1haWwueGVu
cHJvamVjdC5vcmcgImNkIC9kYXRhL2Rvd25sb2Fkcy54ZW5wcm9qZWN0Lm9yZy94ZW4ub3JnICYm
IGN2cyAtcSB1cCAtZCIgfHwgZmFpbCAiRGVwbG95aW5nIHRhcmJhbGwiCgpTaG91bGQgc3VyZWx5
IHJlYWQgICBzc2ggZG93bmxvYWRzLnhlbnByb2plY3Qub3JnICAgYW5kIHRoZW4gaXQgc2hvdWxk
CmJlIGEgdmFyaWFibGUuICBBbHNvIHRoZSBzY3JpcHRsZXQgY291bGQgYmUgZm9ybWF0dGVkIGFj
cm9zcwptdWx0aXBsZSBsaW5lcyAoYW5kIHN0YXJ0IHdpdGggc2V0IC1lLCByYXRoZXIgdGhhbiB1
c2luZyAmJikuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
