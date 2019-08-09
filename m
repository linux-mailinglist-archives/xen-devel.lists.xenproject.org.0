Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F380F87EB4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw7CB-00007I-FV; Fri, 09 Aug 2019 15:52:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw7C9-00007D-Ub
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:52:45 +0000
X-Inumbo-ID: b9a942ec-babd-11e9-9e92-9b24fc01839b
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9a942ec-babd-11e9-9e92-9b24fc01839b;
 Fri, 09 Aug 2019 15:52:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6586BB03C;
 Fri,  9 Aug 2019 15:52:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <20190809123927.29751-1-andrew.cooper3@citrix.com>
 <cf80bbdd-bddb-fb8f-f49b-1ef205422f67@suse.com>
 <eb6e00a0-2937-953e-a57b-c46ab45dfd5a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2aed27f4-4af2-7e5f-c075-3e4d66dd44e9@suse.com>
Date: Fri, 9 Aug 2019 17:52:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb6e00a0-2937-953e-a57b-c46ab45dfd5a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/2] x86/desc: Drop __HYPERVISOR_CS32
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNzozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDEzOjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDkuMDguMjAxOSAxNDozOSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFhlbiwgYmVpbmcgNjRiaXQgb25seSB0aGVzZSBkYXlzLCBoYXMg
bm8gdXNlIGZvciBhIDMyYml0IFJpbmcgMCBjb2RlCj4+PiBzZWdtZW50Lgo+Pj4KPj4+IERlbGV0
ZSBfX0hZUEVSVklTT1JfQ1MzMiBhbmQgcmVtb3ZlIGl0IGZyb20gdGhlIEdEVHMuwqAgQWxzbyBk
ZWxldGUKPj4+IF9fSFlQRVJWSVNPUl9DUzY0IGFuZCB1c2UgX19IWVBFUlZJU09SX0NTIHVuaWZv
cm1seS4KPj4KPj4gTG9uZywgbG9uZyBhZ28gd2UndmUgYmVlbiBjb25zaWRlcmluZyBkb2luZyB0
aGlzLiBBZ3JlZWQsCj4+IG5vdGhpbmcgaGFzIHN1cmZhY2VkIHRvIGFjdHVhbGx5IHVzZSBpdCwg
YnV0IEkgd291bGRuJ3QKPj4gc3Vic2NyaWJlIHRvICJoYXMgbm8gdXNlIjogV2Ugd2lsbCBuZWVk
IGl0IGlmIHdlIGV2ZXIgd2FudAo+PiB0byBiZSBhYmxlIHRvIHJ1biBvbiAzMi1iaXQgRUZJIF9h
bmRfIGludm9rZSBydW50aW1lCj4+IHNlcnZpY2VzIHRoZXJlLiBCYWNrIHRoZW4gdGhyb3VnaCB0
aGUgY29uc2lkZXJhdGlvbiBhZ2FpbnN0Cj4+IGRyb3BwaW5nIGl0IHdhcyB0aGF0IHdlIG1heSB3
YW50IHRvIGludm9rZSAzMi1iaXQgQklPUwo+PiBzZXJ2aWNlcyAoUENJLCBWR0EpIGZyb20gdGhl
IGh5cGVydmlzb3IuCj4gCj4gSSBoYWRuJ3QgcmVhbGlzZWQgdGhlc2UgaGFkIGV2ZW4gYmVlbiBj
b25zaWRlcmVkIGluIHRoZSBwYXN0LsKgIEkgZG9uJ3QKPiB0aGluayBlaXRoZXIgb2YgdGhlc2Ug
YXJlIGxpa2VseSB0byBoYXBwZW4gbm93Lgo+IAo+IEFzIGZvciB0aGUgdGV4dCwgWGVuIHJlYWxs
eSBkb2VzIGhhdmUgbm8gdXNlcnMgb2YgYSAzMmJpdCBSMCBjb2RlCj4gc2VnbWVudCwgYW5kIHRo
ZSBzdGF0ZW1lbnQgZG9lcyBub3QgcHJlY2x1ZGUgdGhlIGZhY3QgdGhhdCB0aGVyZSBtYXkgYmUK
PiBsZWdpdGltYXRlIHVzZXMgZm9yIENTMzIuCj4gCj4gV291bGQgeW91IGJlIGhhcHBpZXIgd2l0
aCAiZGF5cywgYW5kIGRvZXMgbm90IHVzZSBhIDMyYml0IFJpbmcgMCBjb2RlCj4gc2VnbWVudC4i
ID8KClllcywgImRvZXMgbm90IHVzZSIgaXMgZGVmaW5pdGVseSBtb3JlIGNvcnJlY3QgaW1vLCBh
cyB3b3VsZCBiZQoiaGFzIG5vIHVzZXIiIChub3RlIHRoZSBleHRyYSAiciIgY29tcGFyZWQgdG8g
eW91ciBvcmlnaW5hbCB0ZXh0Owp5b3VyIHJlcGx5IG1ha2VzIG1lIHdvbmRlciB3aGV0aGVyIGl0
IHdhcyBzaW1wbHkgYSB0eXBvKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
