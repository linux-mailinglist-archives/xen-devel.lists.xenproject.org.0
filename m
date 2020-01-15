Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2213C8DD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:11:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlDb-0002VZ-V4; Wed, 15 Jan 2020 16:08:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoij=3E=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1irlDa-0002VU-Ah
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:08:30 +0000
X-Inumbo-ID: 4311c32c-37b1-11ea-859a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4311c32c-37b1-11ea-859a-12813bfff9fa;
 Wed, 15 Jan 2020 16:08:26 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1irlDV-00056z-E5; Wed, 15 Jan 2020 16:08:25 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1irlDV-0002GN-4X; Wed, 15 Jan 2020 16:08:25 +0000
Date: Wed, 15 Jan 2020 16:08:22 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200115160822.qpvsjp7vti75eno2@debian>
References: <39b51904-37d8-f0c0-2ad3-6a0dd7df59d7@suse.com>
 <b68451ec-6594-d4a4-1227-fa3026608122@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b68451ec-6594-d4a4-1227-fa3026608122@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86: refine link time stub area related
 assertion
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDI6MzY6MjRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wMS8yMDIwIDEwOjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IFdoaWxl
IGl0IGhhcyBiZWVuIG1lIHRvIGludHJvZHVjZSB0aGlzLCB0aGUgdXNlIG9mIHwgdGhlcmUgaGFz
IGJlY29tZQo+ID4gKGFuZCBwZXJoYXBzIHdhcyBmcm9tIHRoZSB2ZXJ5IGJlZ2lubmluZykgbWlz
bGVhZGluZy4gUmF0aGVyIHRoYW4KPiA+IGF2b2lkaW5nIHRoZSByaWdodCBzaWRlIG9mIGl0IHdo
ZW4gbGlua2luZyB0aGUgeGVuLmVmaSBpbnRlcm1lZGlhdGUgZmlsZQo+ID4gYXQgYSBkaWZmZXJl
bnQgYmFzZSBhZGRyZXNzLCBtYWtlIHRoZSBleHByZXNzaW9uIGNvcGUgd2l0aCB0aGF0IGNhc2Us
Cj4gPiB0aHVzIHZlcmlmeWluZyBwbGFjZW1lbnQgb24gZXZlcnkgc3RlcC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IGFzIHRoaXMgaXMgc2lt
cGx5IGEKPiByZWFycmFuZ2luZywgYnV0Li4uCj4gCj4gPgo+ID4gLS0tIGEveGVuL2FyY2gveDg2
L3hlbi5sZHMuUwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gQEAgLTM1MSw4
ICszNTEsOCBAQCBTRUNUSU9OUwo+ID4gICAgLmNvbW1lbnQgMCA6IHsgKiguY29tbWVudCkgfQo+
ID4gIH0KPiA+ICAKPiA+IC1BU1NFUlQoX19pbWFnZV9iYXNlX18gPiBYRU5fVklSVF9TVEFSVCB8
Cj4gPiAtICAgICAgIF9fMk1fcndkYXRhX2VuZCA8PSBYRU5fVklSVF9FTkQgLSBOUl9DUFVTICog
UEFHRV9TSVpFLAo+ID4gK0FTU0VSVChfXzJNX3J3ZGF0YV9lbmQgPD0gWEVOX1ZJUlRfRU5EIC0g
WEVOX1ZJUlRfU1RBUlQgKyBfX1hFTl9WSVJUX1NUQVJUIC0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5SX0NQVVMgKiBQQUdFX1NJWkUsCj4gCj4gLi4uIGRvZXNuJ3QgdGhpcyB3YW50
IGEgc3R1YnNfcGVyX3BhZ2UgdGVybT/CoCBXZSBkb24ndCBoYXZlIDRrIHBlciBjcHUuCj4gCj4g
V2VpOiBGWUksIGlmIHlvdSBkbyBpbnRyb2R1Y2UgZXhlY3V0YWJsZSBmaXhtYXAgZW50cmllcywg
dGhpcyBBU1NFUlQoKQo+IHdhbnRzIGFkanVzdGluZyBieSBOUl9YX0ZJWE1BUCAqIFBBR0VfU0la
RSBhcyB3ZWxsLgoKSXQgaXMgYSBiaXQgcHJvYmxlbWF0aWMgdG8gZG8gdGhhdCBpZiBOUl9YX0ZJ
WE1BUCBpcyBjYWxjdWxhdGVkIGZyb20gdGhlCmxhc3QgZW51bSBlbGVtZW50IChzZWUgRklYQURE
Ul9TSVpFKQoKSSBjYW4gZXhwb3NlIGEgY29uc3RhbnQgZm9yIHRoZSBsYXJnZXN0IHBvc3NpYmxl
IG51bWJlcnMgb2YgZXhlY3V0YWJsZQpmaXhlZCBtYXBwaW5ncyB0byBwdXQgaW4gdGhlIEFTU0VS
VC4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
