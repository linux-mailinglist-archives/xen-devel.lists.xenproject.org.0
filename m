Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDDA84470
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 08:25:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvFLj-0007cS-KV; Wed, 07 Aug 2019 06:23:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvFLh-0007cN-FT
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 06:23:01 +0000
X-Inumbo-ID: cb780ad2-b8db-11e9-bc63-03d141af30a7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb780ad2-b8db-11e9-bc63-03d141af30a7;
 Wed, 07 Aug 2019 06:22:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96C7BAF1F;
 Wed,  7 Aug 2019 06:22:55 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
 <760df686-ef36-e400-4ef3-c51334694b68@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2bb1e2f-d600-bf30-8f55-38b86bd1100a@suse.com>
Date: Wed, 7 Aug 2019 08:22:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <760df686-ef36-e400-4ef3-c51334694b68@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAyMDo1MCwgT2xla3NhbmRyIHdyb3RlOgo+IE9uIDA1LjA4LjE5IDEzOjAy
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSSBjYW4ndAo+PiBzZWUgdGhvdWdoIGhvdyBhIHR5cGUt
c2FmZSAicmVhbGxvYyIgY291bGQgbG9vayBsaWtlLCBleGNlcHQgZm9yCj4+IGFycmF5cy4gSWYg
cmVzaXppbmcgYXJyYXlzIGlzIGFsbCB5b3UncmUgYWZ0ZXIsIEknZCBsaWtlIHRvCj4+IHJlY29t
bWVuZCB0byBnbyB0aGF0IHJvdXRlIHJhdGhlciB0aGVuIHRoZSBzdWdnZXN0ZWQgb25lIGhlcmUu
IElmCj4+IHJlc2l6aW5nIGFyYml0cmFyeSBvYmplY3RzIGlzIHRoZSBnb2FsLCB0aGVuIHdoYXQg
eW91IHN1Z2dlc3QgbWF5Cj4+IGJlIHRoZSBvbmx5IHJvdXRlLCBidXQgSSdkIHN0aWxsIGJlIG5v
dCBvdmVybHkgaGFwcHkgdG8gc2VlIHN1Y2gKPj4gYWRkZWQuCj4gCj4gTXkgbWFpbiBnb2FsIGlz
IHRvIGdldCAicG9ydGVkIiBmcm9tIExpbnV4ICJpb21tdV9md3NwZWMiIHN1cHBvcnQgKHhyZWFs
bG9jIHVzZXIpIGluIFsxXS4KPiAKPiBJIHRyaWVkIHRvIHJldGFpbiBjb2RlIGFzIG11Y2ggYXMg
cG9zc2libGUgd2hpbGUgcG9ydGluZy4gU28sIHRoaXMgcGF0Y2ggYWRkcyBhbG1vc3QgdGhlIHNh
bWUgdGhpbmcgd2hhdCB0aGUgcG9ydGVkIGNvZGUgZXhwZWN0cy4KPiAKPiBCdXQsIEkgd291bGQg
YmUgT0sgdG8gY29uc2lkZXIgbW9kaWZ5aW5nIGEgY29kZSBpbiBhIHdheSB0byByZXNpemUgYW4g
YXJyYXkgYXMgd2VsbCBhcyBhbnkgb3RoZXIgdmFyaWFudHMgaWYgcHJlc2VudC4KCkkndmUgbG9v
a2VkIGF0IHRoZSB1c2UgaW4gcGF0Y2ggNCwgYW5kIGl0IHJlYWxseSBpc24ndCBhbiBhcnJheQph
bGxvY2F0aW9uLiBFdmVuIGEgYmFzaWMgYWxsb2NhdGlvbiB3b3VsZCB1c2UgX3htYWxsb2MoKSBp
biB0aGlzCmNhc2UgKHlvdSdsbCBmaW5kIGV4YW1wbGVzIGluIHRoZSB0cmVlIGlmIHlvdSB3YW50
KS4gTmV2ZXJ0aGVsZXNzCkknZCBhcHByZWNpYXRlIGlmIHRoZSB0eXBlLXVuc2FmZSBfeHJlYWxs
b2MoKSBkaWRuJ3QgcmVtYWluIHRoZQpvbmx5IHJlLWFsbG9jYXRpb24gY29uc3RydWN0LCBhcyB0
byBhdm9pZGluZyBwZW9wbGUgdXNpbmcgaXQganVzdApiZWNhdXNlIHRoZXJlJ3Mgbm8gYmV0dGVy
IGFsdGVybmF0aXZlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
