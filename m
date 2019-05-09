Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C31889F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 13:00:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOgj6-0008Ly-3C; Thu, 09 May 2019 10:56:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOgj4-0008Lt-5b
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 10:56:34 +0000
X-Inumbo-ID: 18c0d302-7249-11e9-8018-af833c00a66a
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18c0d302-7249-11e9-8018-af833c00a66a;
 Thu, 09 May 2019 10:56:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB1D1AC2E;
 Thu,  9 May 2019 10:56:27 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
Date: Thu, 9 May 2019 12:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAxMjowNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA1LzkvMTkgNjoz
MiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDgvMDUvMjAxOSAxODoyNCwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDUvNi8xOSA3OjU2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IEluc3RlYWQgb2YgdXNpbmcgdGhlIFNDSEVEX09QKCkgbWFjcm8gdG8gY2FsbCB0aGUg
ZGlmZmVyZW50IHNjaGVkdWxlcgo+Pj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdy
YXBwZXJzIGZvciB0aGF0IHB1cnBvc2UuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gVGhpcyBzZWVtcyBsaWtlIGEgZ3JlYXQg
aWRlYS4gIE9uZSBtaW5vciBjb21tZW50Li4uCj4+Pgo+Pj4+ICtzdGF0aWMgaW5saW5lIGludCBz
Y2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4gK3sKPj4+PiArICAgIEFTU0VSVChz
LT5pbml0KTsKPj4+PiArICAgIHJldHVybiBzLT5pbml0KHMpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+
Pj4gK3sKPj4+PiArICAgIEFTU0VSVChzLT5kZWluaXQpOwo+Pj4+ICsgICAgcy0+ZGVpbml0KHMp
Owo+Pj4+ICt9Cj4+Pgo+Pj4gSSB0aGluayB0aGVzZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClz
LiAgVGhlc2UgYXJlbid0IGhvdCBwYXRocywgYW5kIGlmCj4+PiB3ZSBkbyBzb21laG93IGhpdCB0
aGlzIHNpdHVhdGlvbiBpbiBwcm9kdWN0aW9uLCAxKSBpdCdzIHNhZmVyIHRvCj4+PiBCVUdfT04o
KSB0aGFuIGRlcmVmZXJlbmNpbmcgTlVMTCwgYW5kIDIpIHlvdSdsbCBnZXQgYSBtb3JlIGhlbHBm
dWwgZXJyb3IKPj4+IG1lc3NhZ2UuCj4+Cj4+IE9ubHkgZm9yIHRob3NlIDIgaW5zdGFuY2VzIGFi
b3ZlPyBPciB3b3VsZCB5b3UgbGlrZSBCVUdfT04oKSBpbnN0ZWFkIG9mCj4+IEFTU0VSVCgpIGlu
IHRoZSBvdGhlciBhZGRlZCBpbmxpbmVzLCB0b28gKG1heWJlIG5vdCBmb3IgcGlja19jcHUsIGJ1
dAo+PiBlLmcuIHRoZSBvbmVzIGluIGZyZWVfKikgPwo+IAo+IFdoeSBub3QgZm9yIHBpY2tfY3B1
KCk/ICBJdCdzIHRoZSBzYW1lIGJhc2ljIGxvZ2ljIC0tIGluIHByb2R1Y3Rpb24sIGlmCj4gaXQg
KmlzKiBOVUxMLCB0aGVuIHlvdSdsbCBlaXRoZXIgY3Jhc2ggd2l0aCBhIHNlZ2ZhdWx0LCBvciBz
dGFydAo+IGV4ZWN1dGluZyBhbiBleHBsb2l0LiAgTXVjaCBiZXR0ZXIgdG8gQlVHX09OKCkuCgpw
aWNrX2NwdSBpcyBjYWxsZWQgcmF0aGVyIG9mdGVuLCBzbyBtYXliZSB3ZSBzaG91bGQgYXZvaWQg
YWRkaXRpb25hbAp0ZXN0cy4KCkhtbSwgdGhpbmtpbmcgbW9yZSBhYm91dCBpdDogd2h5IGRvbid0
IHdlIGp1c3QgZHJvcCB0aG9zZSBBU1NFUlQvQlVHX09OCmZvciBtYW5kYXRvcnkgZnVuY3Rpb25z
IGFuZCB0ZXN0IHRoZW0gd2hlbiBkb2luZyB0aGUgZ2xvYmFsX2luaXQoKSBsb29wCm92ZXIgYWxs
IHNjaGVkdWxlcnMuIFdlIGNvdWxkIGp1c3QgcmVqZWN0IHNjaGVkdWxlcnMgd2l0aCBtaXNzaW5n
CmZ1bmN0aW9ucy4KCj4gQXMgZm9yIHRoZSBgQVNTRVJUKCFkYXRhKWAsIGluc3RhbmNlcywgSSB0
aGluayBpdCdzIHRoZSByZXZlcnNlOiBJZgo+IGBkYXRhYCB0dXJucyBvdXQgdG8gYmUgbm9uLW51
bGwsIHRoZW4geW91J2xsIGxlYWsgbWVtb3J5LCBidXQgb3RoZXJ3aXNlCj4ga2VlcCB3b3JraW5n
IHVudGlsIHlvdSBydW4gb3V0LiAgSWYgeW91IG1ha2UgdGhvc2UgQlVHX09OKClzLCB0aGVuCj4g
ZXZlcnl0aGluZyBzdG9wcyBpbW1lZGlhdGVseS4gIEkgdGhpbmsgQVNTRVJUKCkgaXMgdGhlIHJp
Z2h0IHRoaW5nIGluCj4gdGhvc2UgY2FzZXMuCgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
