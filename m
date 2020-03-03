Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2D17731B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 10:51:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j949s-0006HV-Ag; Tue, 03 Mar 2020 09:48:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j949q-0006HQ-NZ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 09:48:10 +0000
X-Inumbo-ID: 1718c380-5d34-11ea-82f6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1718c380-5d34-11ea-82f6-bc764e2007e4;
 Tue, 03 Mar 2020 09:48:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1275DAD93;
 Tue,  3 Mar 2020 09:48:09 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200226131806.32444-1-aisaila@bitdefender.com>
 <e94a2335-cd08-339f-4fb0-9d1cb72b78d3@suse.com>
 <4d92a595-28d6-cf73-3d84-80ffcf970331@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71a5d12c-e886-4b6e-c954-d4a300bf0aab@suse.com>
Date: Tue, 3 Mar 2020 10:48:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4d92a595-28d6-cf73-3d84-80ffcf970331@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMDo0MywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDMuMDMuMjAyMCAxMTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2LjAyLjIw
MjAgMTQ6MTgsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gQEAgLTQ4NDAsNiAr
NDg0MSwxOSBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPj4+ICAgICAgICAgICBicmVhazsK
Pj4+ICAgICAgIH0KPj4+ICAgCj4+PiArICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF92aXNpYmls
aXR5Ogo+Pj4gKyAgICB7Cj4+PiArICAgICAgICB1aW50MTZfdCBpZHggPSBhLnUuc2V0X3Zpc2li
aWxpdHkuYWx0cDJtX2lkeDsKPj4KPj4gV2h5IGEgZml4ZWQgd2lkdGggdHlwZSAoYW5kIGV2ZW4g
b25lIGluZWZmaWNpZW50IHRvIGRlYWwgd2l0aCk/Cj4+IChPbmUgbWlnaHQgZXZlbiBhc2sgLSB3
aHkgYSBsb2NhbCB2YXJpYWJsZSBpbiB0aGUgZmlyc3QgcGxhY2UsCj4+IHdoZW4gaXQncyB1c2Vk
IC4uLgo+Pgo+Pj4gKyAgICAgICAgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkICkKPj4+ICsg
ICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4+PiArICAgICAgICBlbHNlIGlmICggIWFsdHAybV9h
Y3RpdmUoZCkgKQo+Pj4gKyAgICAgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7Cj4+PiArICAgICAg
ICBlbHNlCj4+PiArICAgICAgICAgICAgcmMgPSBwMm1fc2V0X2FsdHAybV92aWV3X3Zpc2liaWxp
dHkoZCwgaWR4LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGEudS5zZXRfdmlzaWJpbGl0eS52aXNpYmxlKTsKPj4KPj4gLi4uIGp1c3Qgb25jZSBo
ZXJlLikgVGhlIGZ1bmN0aW9uIHRha2VzICJ1bnNpZ25lZCBpbnQiIGluIGFueQo+PiBldmVudC4K
PiAKPiBTdXJlLCBJIGNhbiBoYXZlIHRoaXMgaWR4IGRyb3BwZWQgYW5kIHVzZSB0aGUgdmFsdWUg
aW4gdGhlIHN0cnVjdHVyZS4KPiBJIGhhZCB0aGF0IGluIHBsYWNlIHRvIGhhdmUgbGluZSBzaXpl
IHNtYWxsZXIgYW5kIHRoZSBjb2RlIGVhc3kgdG8gcmVhZC4KCkRyb3BwaW5nIHRoZSB2YXJpYWJs
ZSBpcyBzZWNvbmRhcnkgLSBpZiB5b3UgcHJlZmVyIHlvdSBrZWVwIGl0LCBzbwpiZSBpdC4gQnV0
IGlmIHlvdSBrZWVwIGl0LCBpdHMgdHlwZSBzaG91bGQgYnkgaW4gbGluZSB3aXRoCi4vQ09ESU5H
X1NUWUxFLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
