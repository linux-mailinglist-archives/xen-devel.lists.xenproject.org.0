Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C85BF89
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhxzu-00070t-I6; Mon, 01 Jul 2019 15:13:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVlo=U6=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hhxzs-00070o-Mp
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:13:36 +0000
X-Inumbo-ID: cb2485b8-9c12-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb2485b8-9c12-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 15:13:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 AD5DB3074B6F; Mon,  1 Jul 2019 18:13:33 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8DA64306E4AC;
 Mon,  1 Jul 2019 18:13:33 +0300 (EEST)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Jan Beulich <JBeulich@suse.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <b7379982-20d5-3e2f-0957-e038bb08b5cf@bitdefender.com>
Date: Mon, 1 Jul 2019 18:13:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xLzE5IDU6NDUgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+IAo+IAo+
IE9uIDAxLjA3LjIwMTkgMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4wNi4x
OSBhdCAxMzo0OSwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+IFRoaXMgcGF0
Y2ggYWltcyB0byBoYXZlIG1lbSBhY2Nlc3Mgdm0gZXZlbnRzIHNlbnQgZnJvbSB0aGUgZW11bGF0
b3IuCj4+PiBUaGlzIGlzIHVzZWZ1bCB3aGVyZSB3ZSB3YW50IHRvIG9ubHkgZW11bGF0ZSBhIHBh
Z2Ugd2FsayB3aXRob3V0Cj4+PiBjaGVja2luZyB0aGUgRVBULCBidXQgd2Ugc3RpbGwgd2FudCB0
byBjaGVjayB0aGUgRVBUIHdoZW4gZW11bGF0aW5nCj4+PiB0aGUgaW5zdHJ1Y3Rpb24gdGhhdCBj
YXVzZWQgdGhlIHBhZ2Ugd2Fsay4gSW4gdGhpcyBjYXNlLCB0aGUgb3JpZ2luYWwKPj4+IEVQVCBm
YXVsdCBpcyBjYXVzZWQgYnkgdGhlIHdhbGsgdHJ5aW5nIHRvIHNldCB0aGUgYWNjZXNzZWQgb3Ig
ZGlydHkKPj4+IGJpdHMsIGJ1dCBleGVjdXRpbmcgdGhlIGluc3RydWN0aW9uIGl0c2VsZiBtaWdo
dCBhbHNvIGNhdXNlIGFuIEVQVAo+Pj4gZmF1bHQgaWYgcGVybWl0dGVkIHRvIHJ1biwgYW5kIHRo
aXMgc2Vjb25kIGZhdWx0IHNob3VsZCBub3QgYmUgbG9zdC4KPj4KPj4gSSdtIGFmcmFpZCBJIHN0
aWxsIGNhbid0IHRyYW5zbGF0ZSB0aGlzIGludG8gd2hhdCBleGFjdGx5IGlzIHdhbnRlZCBhbmQK
Pj4gd2h5LiBXaGlsZSB0eXBpY2FsbHkgd2UgZG9uJ3QgdXNlIGV4YW1wbGVzIHRvIGRlbW9uc3Ry
YXRlIHRoYXQgaXMKPj4gd2FudGVkIGluIGNvbW1pdCBtZXNzYWdlcywgSSB0aGluayB0aGlzIGlz
IGEgcmF0aGVyIGdvb2QgY2FuZGlkYXRlCj4+IGZvciBhY3R1YWxseSB1c2luZyBzdWNoIGFuIGFw
cHJvYWNoLiBUaGlzIG1heSB0aGVuIC4uLgo+Pgo+Pj4gV2UgdXNlIGh2bWVtdWxfbWFwX2xpbmVh
cl9hZGRyKCkgdG8gaW50ZXJjZXB0IHIvdyBhY2Nlc3MgYW5kCj4+PiBfX2h2bV9jb3B5KCkgdG8g
aW50ZXJjZXB0IGV4ZWMgYWNjZXNzLgo+Pj4KPj4+IEZpcnN0IHdlIHRyeSB0byBzZW5kIGEgdm0g
ZXZlbnQgYW5kIGlmIHRoZSBldmVudCBpcyBzZW50IHRoZW4gZW11bGF0aW9uCj4+PiByZXR1cm5z
IFg4NkVNVUxfUkVUUlkgaW4gb3JkZXIgdG8gc3RvcCBlbXVsYXRpb24gb24gaW5zdHJ1Y3Rpb25z
IHRoYXQKPj4+IHVzZSBhY2Nlc3MgcHJvdGVjdGVkIHBhZ2VzLiBJZiB0aGUgZXZlbnQgaXMgbm90
IHNlbnQgdGhlbiB0aGUKPj4+IGVtdWxhdGlvbiBnb2VzIG9uIGFzIGV4cGVjdGVkLgo+Pgo+PiAu
Li4gYWxzbyBoZWxwIHVuZGVyc3RhbmRpbmcgdGhpcyBwYXJ0LCB3aGljaCBJIGNvbnRpbnVlIHRv
IGJlIGNvbmZ1c2VkCj4+IGJ5LCB0b28uCgpTaW1wbHkgcHV0LCB0aGUgaW50cm9zcGVjdGlvbiBh
Z2VudCB3YW50cyB0byB0cmVhdCBhbGwgQS9EIGJpdCB3cml0ZXMgYXMgCmJlbmlnbi4gUmVjZWl2
aW5nIHZtX2V2ZW50cyBhYm91dCB0aGVtIGlzIGEgYmlnIHBlc3NpbWl6YXRpb24sIGFuZCB3ZSAK
d2FudCB0byBvcHRpbWl6ZS4KCldlJ2QgbGlrZSB0byBmaWx0ZXIgdGhlc2UgZXZlbnRzIG91dC4K
ClRvIHRoaXMgZW5kLCB3ZSdyZSBjdXJyZW50bHkgKGluIHRoZSBwcmVzZW50IGluY2FybmF0aW9u
IG9mIHRoZSBYZW4gCmNvZGUpIGZ1bGx5IGVtdWxhdGluZyB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQ
IHdoZW4gdGhlIGhhcmR3YXJlIHNlZXMgYW4gCkVQVCBmYXVsdCB3aXRoIG5wZmVjLmtpbmQgIT0g
bnBmZWNfa2luZF93aXRoX2dsYS4gVGhpcyBpcywgaG93ZXZlciwgCmluY29ycmVjdCwgYmVjYXVz
ZSB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQIG1pZ2h0IGxlZ2l0aW1hdGVseSBjYXVzZSBhbiAKRVBU
IGZhdWx0IG9mIGl0cyBvd24gKHdoaWxlIGFjY2Vzc2luZyBhIF9kaWZmZXJlbnRfIHBhZ2UgZnJv
bSB0aGUgCm9yaWdpbmFsIG9uZSwgd2hlcmUgQS9EIHdlcmUgc2V0KS4KCldlJ3ZlIHRyaWVkIHRv
IHNvbHZlIHRoaXMgYnkgYWN0dWFsbHkgd3JpdGluZyB0aGUgQS9EIGJpdHMgYW5kIHJldHVybmlu
ZyAKZnJvbSBwMm1fbWVtX2FjY2Vzc19jaGVjaygpLCBob3dldmVyIHRoYXQgaGFzIGxlZCB0byBh
IHNsaWdodGx5IApwaGlsb3NvcGhpY2FsIGRpc2N1c3Npb24gYWJvdXQgdGhlIHByb3BlciB3YXkg
dG8gYWNoaWV2ZSBvdXIgZ29hbHMgd2hpbGUgCnRha2luZyBpbnRvIGFjY291bnQgc3BlY3VsYXRp
dmUgc2V0dGluZyBvZiB0aGVzZSBiaXRzLiBUaGUgaXNzdWVzIHJhaXNlZCAKaGF2ZSBub3QgYmVl
biBzYXRpc2ZhY3RvcmlseSBhbnN3ZXJlZCBpbiBhbiBhdXRob3JpdGF0aXZlIG1hbm5lciB0byB0
aGlzIApkYXkuCgpTbyB0aGUgb25seSBvcHRpb24gd2Ugc2VlbSB0byBoYXZlIGxlZnQgYXQgdGhp
cyBwb2ludCBpcyB0byBwZXJmb3JtIHRoZSAKd2hvbGUgZW11bGF0aW9uLCBfd2hpbGVfIGlnbm9y
aW5nIEVQVCByZXN0cmljdGlvbnMgZm9yIHRoZSB3YWxrIHBhcnQsIAphbmQgdGFraW5nIHRoZW0g
aW50byBhY2NvdW50IGZvciB0aGUgImFjdHVhbCIgZW11bGF0aW5nIG9mIHRoZSAKaW5zdHJ1Y3Rp
b24gQCBSSVAuCgpJZiB3ZSdyZSBzZW5kaW5nIG91dCBhIHZtX2V2ZW50LCB0aGVuIHdlIGRvbid0
IHdhbnQgdGhlIGVtdWxhdGlvbiB0byAKY29tcGxldGUgLSBzaW5jZSBpbiB0aGF0IGNhc2Ugd2Ug
d29uJ3QgYmUgYWJsZSB0byB2ZXRvIHdoYXRldmVyIGlzIApkb2luZy4gVGhhdCB3b3VsZCBtZWFu
IHRoYXQgd2UgY2FuJ3QgYWN0dWFsbHkgcHJldmVudCBhbnkgbWFsaWNpb3VzIAphY3Rpdml0eSB0
aGF0IGhhcHBlbnMgaGVyZSwgaW5zdGVhZCB3ZSdkIG9ubHkgYmUgYWJsZSB0byByZXBvcnQgb24g
aXQuCgpTbyB3aGVuIHdlIHNlZSBhICJzZW5kLXZtX2V2ZW50IiBjYXNlIHdoaWxlIGVtdWxhdGlu
Zywgd2UgbmVlZCB0byBkbyB0d28gCnRoaW5nczoKCjEuIHNlbmQgdGhlIGV2ZW50IG91dDsKMi4g
X2Rvbid0XyBjb21wbGV0ZSB0aGUgZW11bGF0aW9uIChyZXR1cm4gWDg2RU1VTF9SRVRSWSkuCgpX
aGVuIDIuIGhhcHBlbnMsIHdlJ2xsIGhpdCBodm1fdm1fZXZlbnRfZG9fcmVzdW1lKCkgYWdhaW4g
X2FmdGVyXyB0aGUgCmludHJvc3BlY3Rpb24gYWdlbnQgdHJlYXRzIHRoZSBldmVudCBhbmQgcmVz
dW1lcyB0aGUgZ3Vlc3QuIFRoZXJlLCB0aGUgCmluc3RydWN0aW9uIGF0IFJJUCB3aWxsIGJlIGZ1
bGx5IGVtdWxhdGVkICh3aXRoIHRoZSBFUFQgaWdub3JlZCkgaWYgdGhlIAppbnRyb3NwZWN0aW9u
IGFwcGxpY2F0aW9uIGFsbG93cyBpdCwgYW5kIHRoZSBndWVzdCB3aWxsIGNvbnRpbnVlIHRvIHJ1
biAKcGFzdCB0aGUgaW5zdHJ1Y3Rpb24uCgpUaGF0J3Mgb3VyIHBsYW4sIGFueXdheS4gSG9wZWZ1
bGx5IHdlJ3JlIG5vdCBnb2luZyBpbiBhIHdyb25nIGRpcmVjdGlvbiAKYWJvdXQgaXQgKGFsbCBo
ZWxwIGlzIHZlcnkgbXVjaCBhcHByZWNpYXRlZCkuCgpJIGhvcGUgdGhpcyBoYXMgbWFkZSB0aGlu
ZyBjbGVhcmVyLiBXZSdyZSBub3QgYWZ0ZXIgYW55dGhpbmcgb3V0IG9mIHRoZSAKb3JkaW5hcnkg
b3IgZml0dGluZyBhIG5pY2hlIGNhc2UgLSB3ZSBqdXN0IHdhbnQgdG8gZmlsdGVyIG91dCB2bV9l
dmVudHMgCmNhdXNlZCBieSBwYWdlIHdhbGtzIGluIGEgbWFubmVyIHRoYXQgcmVtYWlucyBzYWZl
IGZvciB0aGUgZ3Vlc3QgT1MgdXNlci4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
