Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88DA126374
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 14:27:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihvnO-0000kQ-GE; Thu, 19 Dec 2019 13:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihvnM-0000kL-CH
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 13:24:48 +0000
X-Inumbo-ID: e7de8dea-2262-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7de8dea-2262-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 13:24:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83484AE17;
 Thu, 19 Dec 2019 13:24:37 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191219120455.13357-1-pdurrant@amazon.com>
 <7afa5fe6-e293-a017-ce97-9aac00cc3691@citrix.com>
 <38c8b0ddf76b497893a5bd52150423c7@EX13D32EUC003.ant.amazon.com>
 <12d3bb9d-a075-6135-5925-87b9b72644df@citrix.com>
 <5bf5afe2cfa043b0b3e3b27011400668@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a481e609-a792-4f1c-9bd6-3e24a642c51e@suse.com>
Date: Thu, 19 Dec 2019 14:25:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5bf5afe2cfa043b0b3e3b27011400668@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/save: reserve HVM save record
 numbers that have been consumed...
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxNDoxNSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gRnJvbTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU2VudDogMTkgRGVjZW1iZXIg
MjAxOSAxMzowOAo+Pgo+PiBPbiAxOS8xMi8yMDE5IDEyOjM3LCBEdXJyYW50LCBQYXVsIHdyb3Rl
Ogo+Pj4+IEZyb206IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+
Pj4gU2VudDogMTkgRGVjZW1iZXIgMjAxOSAxMjoxNgo+Pj4+Cj4+Pj4gT24gMTkvMTIvMjAxOSAx
MjowNCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC14ODYvaHZtL3NhdmUuaAo+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14
ODYvaHZtL3NhdmUuaAo+Pj4+PiBAQCAtNjM5LDYgKzYzOSw4IEBAIHN0cnVjdCBodm1fbXNyIHsK
Pj4+Pj4KPj4+Pj4gICNkZWZpbmUgQ1BVX01TUl9DT0RFICAyMAo+Pj4+Pgo+Pj4+PiArLyogUmFu
Z2UgMjIgLSA0MCByZXNlcnZlZCBmb3IgQW1hem9uICovCj4+Pj4gV2hhdCBhYm91dCAyMSBhbmQg
MjI/wqAgQW5kIHdoZXJlIGRvZXMgdGhlIGFjdHVhbCBudW1iZXIgc3RvcCwgYmVjYXVzZQo+Pj4+
IGJhc2VkIG9uIHYxLCBpdHMgbm90IDQwLgo+Pj4+Cj4+PiBUaGUgcmFuZ2UgaXMgaW5jbHVzaXZl
IChtYXliZSB0aGF0J3Mgbm90IG9idmlvdXM/KS4gRm9yIHNvbWUgcmVhc29uIDIxCj4+IHdhcyBz
a2lwcGVkIGJ1dCB3aHkgZG8geW91IHNheSB0aGUgdG9wIGlzIG5vdCA0MD8gVGhhdCB3YXMgd2hh
dCBJIHNldAo+PiBIVk1fU0FWRV9DT0RFX01BWCB0byBpbiB2MS4KPj4KPj4gWW91IGFsc28gc2Fp
ZCB0aGF0IGluY2x1ZGVkIHByb3NwZWN0aXZlIGhlYWRyb29tLCB3aGljaCBkZWZpbml0ZWx5IGlz
bid0Cj4+IGZhaXIgdG8gcmVzZXJ2ZSBmb3IgQUJJIGJyZWFrYWdlIHJlYXNvbnMuCj4+Cj4+IFdo
aWNoIG51bWJlcnMgaGF2ZSBhY3R1YWxseSBiZWVuIGFsbG9jYXRlZD8KPj4KPiAKPiBUaGUgcHJv
YmxlbSBpcyB0aGF0IEkgZG9uJ3QgeWV0IGtub3cgZm9yIHN1cmUuIEkgaGF2ZSBkZWZpbml0ZWx5
IHNlZW4KPiBwYXRjaGVzIHVzaW5nIDIyIHRocnUgMzQuIEl0IGlzICpwcm9iYWJseSogc2FmZSB0
byByZXN0cmljdCB0byB0aGF0IGJ1dAo+IGRvZXMgaXQgcmVhbGx5IGNvc3QgdGhhdCBtdWNoIG1v
cmUgdG8gcmVzZXJ2ZSBzb21lIGV4dHJhIHNwYWNlIGp1c3QgaW4KPiBjYXNlPyBJLmUuIGlmIHNv
bWVvbmUgZWxzZSBhZGRzIDQxIHZzLiAzNSBpcyBpdCBnb2luZyB0byBtYWtlIG11Y2ggb2YgYQo+
IGRpZmZlcmVuY2U/CgpOb3QgX3RoYXQgbXVjaF8sIGJ1dCBzdGlsbCAtIGl0J3MgYSBib2RnZSwg
c28gbGV0J3MgdHJ5IHRvIGxpbWl0IGl0IGFzCm11Y2ggYXMgd2UgY2FuLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
