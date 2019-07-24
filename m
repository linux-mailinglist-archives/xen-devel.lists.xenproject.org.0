Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14772D5D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:24:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFL2-0001ot-K0; Wed, 24 Jul 2019 11:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqFL1-0001oo-5l
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:21:39 +0000
X-Inumbo-ID: 31c781f0-ae05-11e9-b12a-bb248f7e04c0
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31c781f0-ae05-11e9-b12a-bb248f7e04c0;
 Wed, 24 Jul 2019 11:21:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7D60AE89;
 Wed, 24 Jul 2019 11:21:32 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190723182530.24087-1-jgross@suse.com>
 <20190723182530.24087-3-jgross@suse.com>
 <0530cd8f-5b00-ae08-15e2-10266ca5dbb8@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4c1f0bfb-5067-fb66-2614-47940743a1e8@suse.com>
Date: Wed, 24 Jul 2019 13:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0530cd8f-5b00-ae08-15e2-10266ca5dbb8@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMTkgMTI6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjA3LjIwMTkgMjA6
MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRvZGF5IHRoZXJlIGFyZSB0d28gc2NlbmFyaW9z
IHdoaWNoIGFyZSBwaW5uaW5nIHZjcHVzIHRlbXBvcmFyaWx5IHRvCj4+IGEgc2luZ2xlIHBoeXNp
Y2FsIGNwdToKPj4KPj4gLSB3YWl0X2V2ZW50KCkgaGFuZGxpbmcKPj4gLSB2Y3B1X3Bpbl9vdmVy
cmlkZSgpIGhhbmRsaW5nCj4+Cj4+IEVhY2ggb2YgdGhvc2UgY2FzZXMgYXJlIGhhbmRsZWQgaW5k
ZXBlbmRlbnRseSB0b2RheSB1c2luZyB0aGVpciBvd24KPj4gdGVtcG9yYXJ5IGNwdW1hc2sgdG8g
c2F2ZSB0aGUgb2xkIGFmZmluaXR5IHNldHRpbmdzLgo+Pgo+PiBUaGUgdHdvIGNhc2VzIGNhbiBi
ZSBjb21iaW5lZCBhcyB0aGUgZmlyc3QgY2FzZSB3aWxsIG9ubHkgcGluIGEgdmNwdSB0bwo+PiB0
aGUgcGh5c2ljYWwgY3B1IGl0IGlzIGFscmVhZHkgcnVubmluZyBvbiwgd2hpbGUgdmNwdV9waW5f
b3ZlcnJpZGUoKSBpcwo+PiBhbGxvd2VkIHRvIGZhaWwuCj4+Cj4+IFNvIG1lcmdlIHRoZSB0d28g
dGVtcG9yYXJ5IHBpbm5pbmcgc2NlbmFyaW9zIGJ5IG9ubHkgdXNpbmcgb25lIGNwdW1hc2sKPj4g
YW5kIGEgcGVyLXZjcHUgYml0bWFzayBmb3Igc3BlY2lmeWluZyB3aGljaCBvZiB0aGUgc2NlbmFy
aW9zIGlzCj4+IGN1cnJlbnRseSBhY3RpdmUgKHRoZXkgYXJlIGFsbG93ZWQgdG8gbmVzdCkuCj4g
Cj4gSG1tLCAibmVzdCIgdG8gbWUgbWVhbnMgTElGTy1saWtlIGJlaGF2aW9yLCBidXQgdGhlIGxv
Z2ljIGlzIG1vcmUgcmVsYXhlZAo+IGFmYWljdC4KCk9rYXksIHdpbGwgcmVwaHJhc2UuCgo+IAo+
PiBAQCAtMTI2Nyw3ICsxMjg0LDggQEAgcmV0X3QgZG9fc2NoZWRfb3AoaW50IGNtZCwgWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4+ICAgICAgICAgICBpZiAoIGNvcHlfZnJvbV9n
dWVzdCgmc2NoZWRfcGluX292ZXJyaWRlLCBhcmcsIDEpICkKPj4gICAgICAgICAgICAgICBicmVh
azsKPj4gICAgCj4+IC0gICAgICAgIHJldCA9IHZjcHVfcGluX292ZXJyaWRlKGN1cnJlbnQsIHNj
aGVkX3Bpbl9vdmVycmlkZS5wY3B1KTsKPj4gKyAgICAgICAgY3B1ID0gc2NoZWRfcGluX292ZXJy
aWRlLnBjcHUgPCAwID8gTlJfQ1BVUyA6IHNjaGVkX3Bpbl9vdmVycmlkZS5wY3B1Owo+IAo+IEkg
ZG9uJ3QgdGhpbmsgeW91IG1lYW4gdGhlIGNhbGxlciB0byBhY2hpZXZlIHRoZSBzYW1lIGVmZmVj
dCBieSBib3RoCj4gcGFzc2luZyBpbiBhIG5lZ2F0aXZlIHZhbHVlIG9yIE5SX0NQVVMgLSBpdCBz
aG91bGQgcmVtYWluIHRvIGJlIGp1c3QKPiBuZWdhdGl2ZSB2YWx1ZXMgd2hpY2ggY2xlYXIgdGhl
IG92ZXJyaWRlLgoKT2theS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
