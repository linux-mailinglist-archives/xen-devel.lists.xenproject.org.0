Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B874FBC29F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 09:28:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCfDU-0001a2-4Z; Tue, 24 Sep 2019 07:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCfDS-0001Zt-Gj
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 07:26:30 +0000
X-Inumbo-ID: 9fbad6c2-de9c-11e9-960d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9fbad6c2-de9c-11e9-960d-12813bfff9fa;
 Tue, 24 Sep 2019 07:26:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D5BEAF43;
 Tue, 24 Sep 2019 07:26:28 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
 <e75f5253-df1d-2d47-6724-df06d1a33448@suse.com>
 <8571e4db-d3dc-6a58-8711-2947c97f8953@oracle.com>
 <12a5fc3c-8ded-21f9-3cb6-ea7caa8d585a@suse.com>
 <e19a7889-31a4-42bc-0b88-596e62ab7e8a@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26f13318-cfa4-0a26-a610-2976278fede5@suse.com>
Date: Tue, 24 Sep 2019 09:26:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e19a7889-31a4-42bc-0b88-596e62ab7e8a@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAwMDoyOSwgSm9lIEppbiB3cm90ZToKPiBPbiA5LzIwLzE5IDE6MjggQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOS4wOS4yMDE5IDIzOjM4LCBKb2UgSmluIHdyb3Rl
Ogo+Pj4gT24gOS8xOS8xOSAzOjI0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBXaGF0J3MK
Pj4+PiBzdGlsbCBtaXNzaW5nIGlzIHRoZSBmdXJ0aGVyIHVwZGF0aW5nIG9mIHBpcnFfZHBjaS0+
Z21zaS5kZXN0X3ZjcHVfaWQKPj4+PiAoYXMgZXhwbGFpbmVkIGJlZm9yZSwgc3RpbGwgdmlzaWJs
ZSBpbiBjb250ZXh0IGFib3ZlKS4KPj4+Pgo+Pj4KPj4+ICA0MjIKPj4+ICA0MjMgICAgICAgICBk
ZXN0X3ZjcHVfaWQgPSBodm1fZ2lycV9kZXN0XzJfdmNwdV9pZChkLCBkZXN0LCBkZXN0X21vZGUp
Owo+Pj4gIDQyNCAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQgPSBkZXN0X3Zj
cHVfaWQ7Cj4+Pgo+Pj4gZGVzdF92Y3B1X2lkIHVwZGF0ZWQgbGF0ZXIgYnkgYWJvdmUgY29kZSwg
ZG8gSSBtaXNzZWQgc29tZXRoaW5nPwo+Pgo+PiBUaGlzIHBpZWNlIG9mIGNvZGUKPj4KPj4gICAg
ICAgICBpZiAoIGlvbW11X2ludHBvc3QgKQo+PiAgICAgICAgIHsKPj4gICAgICAgICAgICAgaWYg
KCBkZWxpdmVyeV9tb2RlID09IGRlc3RfTG93ZXN0UHJpbyApCj4+ICAgICAgICAgICAgICAgICB2
Y3B1ID0gdmVjdG9yX2hhc2hpbmdfZGVzdChkLCBkZXN0LCBkZXN0X21vZGUsCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ3ZlYyk7
Cj4+ICAgICAgICAgICAgIGlmICggdmNwdSApCj4+ICAgICAgICAgICAgICAgICBwaXJxX2RwY2kt
Pmdtc2kucG9zdGVkID0gdHJ1ZTsKPj4gICAgICAgICB9Cj4+Cj4+IHVwZGF0ZXMgdGhlIHZDUFUg
dG8gYmUgZGVsaXZlcmVkIHRvLiBSaWdodCBub3csIHdoZW4gdGhlICJwb3N0ZWQiCj4+IGZsYWcg
aXMgc2V0LCB0aGUgZGVzdF92Y3B1X2lkIGZpZWxkIGlzIHVudXNlZCAoYXMgZmFyIGFzIEkgd2Fz
Cj4+IGFibGUgdG8gdGVsbCksIGFuZCBoZW5jZSBkaWRuJ3QgbmVlZCBzZXR0aW5nLiBUaGUgd2F5
IHlvdSBpbnRlbmQKPj4gdG8gY2hhbmdlIHRoaW5ncywgeW91IHdhbnQgdG8gdXNlIHRoZSBmaWVs
ZCBhbHNvIGluIHRoZSAicG9zdGVkIgo+PiBjYXNlLCBhbmQgaGVuY2UgeW91IGFsc28gc2hvdWxk
IHVwZGF0ZSBpdCBpbiB0aGUgY29kZSBwYXRoIGFib3ZlLgo+Pgo+PiBCdXQgcGxlYXNlIGRvdWJs
ZSBjaGVjayBhbGwgb2YgdGhpcy4KPiAKPiBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uCj4g
Cj4gSSBkaWQgbm90IGZvdW5kIGFueSBvdGhlciBwb3NzaWJsZSBjb25kaXRpb25zIHdoaWNoIG1h
eSBsZWFkIGludmFsaWQKPiBzZXR0aW5nLCBzZWVtcyAoIGRlc3RfdmNwdV9pZCA+PTAgJiYgcGly
cV9kcGNpLT5nbXNpLnBvc3RlZCApIGlzIGVub3VnaD8KCkkgdGhvdWdodCB3ZSBoYWQgc2V0dGxl
ZCBvbiB0aGlzIHNpZGUgb2YgdGhpbmdzIGEgbnVtYmVyIG9mIHJvdW5kdHJpcHMKYWdvLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
