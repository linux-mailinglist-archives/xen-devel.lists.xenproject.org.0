Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B487A47
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw47D-0003jM-LV; Fri, 09 Aug 2019 12:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw47C-0003jH-Md
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:35:26 +0000
X-Inumbo-ID: 2819797a-baa2-11e9-98c3-2fcb4bf464af
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2819797a-baa2-11e9-98c3-2fcb4bf464af;
 Fri, 09 Aug 2019 12:35:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7047AF27;
 Fri,  9 Aug 2019 12:35:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <5c94e6ba-acd0-ac20-bbf0-187a2e3d0988@suse.com>
 <098d70da-041a-d77c-3200-53b3692fa301@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86a3b532-2fc4-d98f-5111-cb938a83714f@suse.com>
Date: Fri, 9 Aug 2019 14:35:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <098d70da-041a-d77c-3200-53b3692fa301@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86: define a few selector values
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxMzo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDExOjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9k
ZXNjLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kZXNjLmgKPj4gQEAgLTM2LDYgKzM2
LDEwIEBACj4+ICDCoCNkZWZpbmUgTERUX0VOVFJZIChUU1NfRU5UUlkgKyAyKQo+PiAgwqAjZGVm
aW5lIFBFUl9DUFVfR0RUX0VOVFJZIChMRFRfRU5UUlkgKyAyKQo+PiAgIAo+PiArI2RlZmluZSBU
U1NfU0VMRUNUT1LCoMKgwqDCoMKgwqDCoMKgIChUU1NfRU5UUlkgPDwgMykKPj4gKyNkZWZpbmUg
TERUX1NFTEVDVE9SwqDCoMKgwqDCoMKgwqDCoCAoTERUX0VOVFJZIDw8IDMpCj4+ICsjZGVmaW5l
IFBFUl9DUFVfR0RUX1NFTEVDVE9SIChQRVJfQ1BVX0dEVF9FTlRSWSA8PCAzKQo+IAo+IFRoaW5r
aW5nIGFib3V0IGl0LCBub3cgd291bGQgYmUgYW4gZXhjZWxsZW50IHRpbWUgdG8gcmVtb3ZlIHRo
ZSBHRFQKPiBpbmZpeCBmcm9tIFBFUl9DUFVfR0RUX3tFTlRSWSxTRUxFQ1RPUn0uCj4gCj4gTG9v
a2luZyBhdCB0aGUgcmVzdWx0aW5nIGRpZmYsIHRoZXJlIGFyZSBvbmx5IDMgZXh0cmEgaHVua3Mg
b24gdG9wIG9mCj4gdGhpcyBwYXRjaCB0byBwZXJmb3JtIHRoZSByZW5hbWUuCj4gCj4gUHJlZmVy
YWJseSB3aXRoIHRoaXMgZG9uZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCkknbSBva2F5IHdpdGggZHJvcHBpbmcgaXQgZnJvbSB0aGUg
bmV3IHNlbGVjdG9yIGNvbnN0YW50LApzaW5jZSAic2VsZWN0b3IiIGNhbid0IHJlYWxseSBiZSBt
aXN0YWtlbi4gRm9yICJlbnRyeSIgdGhvdWdoCkkgdGhpbmsgdGhpcyBpc24ndCBjbGVhciBlbm91
Z2ggd2l0aG91dCAiR0RUIi4gKFRoaXMgaXMgbGVzcwpmb3IgYSBwcm9ibGVtIHdpdGggVFNTX0VO
VFJZIGFuZCBMRFRfRU5UUlksIGFzIHRoZWlyIHByZWZpeGVzCm1ha2UgY2xlYXIgdGhlc2UgYXJl
IEdEVCBlbnRpdGllcy4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
