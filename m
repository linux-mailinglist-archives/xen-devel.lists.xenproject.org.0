Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68017E1BB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 14:56:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBIpV-0004x4-IZ; Mon, 09 Mar 2020 13:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBIpT-0004wz-LP
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 13:52:23 +0000
X-Inumbo-ID: 3387b584-620d-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3387b584-620d-11ea-b74d-bc764e2007e4;
 Mon, 09 Mar 2020 13:52:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED756AEF6;
 Mon,  9 Mar 2020 13:52:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
 <22a7eb01-deb6-4b05-28b4-6e24a3869636@suse.com>
 <1485d0a8-6b55-f7f5-b0f0-a85f63bf4555@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8eb2a625-fcd5-6c4b-a601-1c59b0d8f465@suse.com>
Date: Mon, 9 Mar 2020 14:52:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1485d0a8-6b55-f7f5-b0f0-a85f63bf4555@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/9] x86/HVM: reduce domain.h include
 dependencies
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxNDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wMy8yMDIw
IDEyOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQg
YnkgdGhlIGhlYWRlciBpdHNlbGYuIFB1dCB0aGUgb25lcyBuZWVkZWQKPj4gaW50byB3aGljaGV2
ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkgbmVlZCB0aGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSGF2aW5nIGF0dGVtcHRlZCB0byBj
b21waWxlIHRoaXMgbXlzZWxmLCB5b3UncmUgYXQgYSBtaW5pbXVtIG1pc3NpbmcKPiBGbGFzaywg
dmlyaWRpYW4sIGdlbmVyYWwgSFZNIChiZWNhdXNlIEkgY2FuJ3Qgc3BvdCBhbnkgb3RoZXIgd2F5
IGRtLmMKPiB3b3VsZG4ndCBiZSBjb21waWxlZCksIHhlbiBndWVzdCBhbmQgc2hpbS4KCkkgYWRt
aXQgSSBmb3Jnb3QgdG8gdHJ5IGFuIFhTTS9GbGFzayBidWlsZCwgYnV0IEknbSBwcmV0dHkgcHV6
emxlZCBieQp0aGUgb3RoZXIgaXRlbXMgeW91IGxpc3QuIEluIGZhY3QgYmVmb3JlIHN1Ym1pdHRp
bmcgSSB0cmllZCB0aGUgc2VyaWVzCm9uIGEgcGxhaW4gc3RhZ2luZyB0cmVlIHRvIGV4Y2x1ZGUg
dGhlcmUgYmVpbmcgZGVwZW5kZW5jaWVzIG9uIG90aGVyCnBhdGNoZXMgSSBoYXZlIGluIG15IHRy
eS4gKEkgbm93IHJlYWxpemUgSSBhbHNvIG1lYW50IHRvIGNoZWNrIHRoZQpjbGFuZyBidWlsZCBi
ZWZvcmUgc2VuZGluZy4pCgo+IFRoZSB2bV9ldmVudCBmYWlsdXJlcyBJIHByZXN1bWUgaXMgZHVl
IHRvIGEgZGVwZW5kZW5jeSBvbiB5b3VyIHNpbmdsZXRvbgo+IHBhdGNoZXMuCgpBcyBwZXIgYWJv
dmUsIHRoaW5ncyBkbyBidWlsZCBmaW5lIGZvciBtZSB3aXRob3V0IHRoZXNlLiBJbiBmYWN0IHRo
ZQpvcmRlciB0aGUgcGF0Y2hlcyBnb3QgY3JlYXRlZCB3YXMgc3VjaCB0aGF0IHRoZSBtZW0tYWNj
ZXNzIGFuZCB2bS1ldmVudApvbmVzIGdvdCBhZGRlZCBsYXN0LgoKPsKgIE9UT0gsCj4gCj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9tc3IuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKPj4gQEAg
LTI4LDYgKzI4LDggQEAKPj4gICNpbmNsdWRlIDxhc20vbXNyLmg+Cj4+ICAjaW5jbHVkZSA8YXNt
L3NldHVwLmg+Cj4+ICAKPj4gKyNpbmNsdWRlIDxwdWJsaWMvaHZtL3BhcmFtcy5oPgo+IAo+IFdo
YXQgZmFpbGVkIHRvIGNvbXBpbGUgaGVyZT/CoCBJIGNhbid0IHNwb3QgYW55dGhpbmcgaW4gbXNy
LmMgd2hpY2ggdXNlcwo+IHRoZSBwYXJhbXMuCgojZGVmaW5lIHZpcmlkaWFuX2ZlYXR1cmVfbWFz
ayhkKSBcCiAgICAoaGFzX2h2bV9wYXJhbXMoZCkgPyAoZCktPmFyY2guaHZtLnBhcmFtc1tIVk1f
UEFSQU1fVklSSURJQU5dIDogMCkKCiNkZWZpbmUgaXNfdmlyaWRpYW5fZG9tYWluKGQpIFwKICAg
IChpc19odm1fZG9tYWluKGQpICYmICh2aXJpZGlhbl9mZWF0dXJlX21hc2soZCkgJiBIVk1QVl9i
YXNlX2ZyZXEpKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
