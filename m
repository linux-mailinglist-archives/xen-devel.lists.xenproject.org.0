Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BBAD828
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:43:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7I1P-0001jm-UX; Mon, 09 Sep 2019 11:39:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7I1P-0001jh-3N
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:39:51 +0000
X-Inumbo-ID: 8806ebc6-d2f6-11e9-ac0a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8806ebc6-d2f6-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:39:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B453B623;
 Mon,  9 Sep 2019 11:39:49 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <68db6d1a-6498-30a6-6604-a568056dd1e0@suse.com>
 <d6419b76-7864-5d45-1ddd-8c84ae4e3271@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3142866-ec53-bd2c-0672-99923c421aad@suse.com>
Date: Mon, 9 Sep 2019 13:39:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d6419b76-7864-5d45-1ddd-8c84ae4e3271@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86emul: fix test harness and fuzzer
 build dependencies
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMzowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wOS8yMDE5
IDE1OjA5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQ29tbWl0IGZkMzVmMzJiNGIgKCJ0b29scy94
ODZlbXVsOiBVc2Ugc3RydWN0IGNwdWlkX3BvbGljeSBpbiB0aGUKPj4gdXNlcnNwYWNlIHRlc3Qg
aGFybmVzc2VzIikgZGlkbid0IGFjY291bnQgZm9yIHRoZSBkZXBlbmRlbmNpZXMgb2YKPj4gY3B1
aWQtYXV0b2dlbi5oIHRvIHBvdGVudGlhbGx5IGNoYW5nZSBiZXR3ZWVuIGluY3JlbWVudGFsIGJ1
aWxkcy4gSW4KPj4gcGFydGljdWxhciB0aGUgaGFybmVzcyBoYXMgYSAicnVuIiBnb2FsIHdoaWNo
IGlzIHN1cHBvc2VkIHRvIGJlIHVzYWJsZQo+PiBpbmRlcGVuZGVudGx5IG9mIHRoZSByZXN0IG9m
IHRoZSB0b29scyBzdWItdHJlZSBidWlsZGluZywgYW5kIGJvdGggdGhlCj4+IGhhcm5lc3MgYW5k
IHRoZSBmdXp6ZXIgY29kZSBhcmUgYWxzbyBzdXBwb3NlZCB0byBiZSBidWlsZGFibGUKPj4gaW5k
ZXBlbmRlbnRseS4gVGhlcmVmb3JlIGEgcmUtYnVpbGQgb2YgdGhlIGdlbmVyYXRlZCBoZWFkZXIg
bmVlZHMgdG8gYmUKPj4gdHJpZ2dlcmVkIGZpcnN0LCB3aGljaCBpcyBhY2hpZXZlZCBieSBpbnRy
b2R1Y2luZyBhIG5ldyB0b3AtbGV2ZWwgdGFyZ2V0Cj4+IHBhdHRlcm4gKGZvciBqdXN0IHRoZSAi
cnVuIiBwYXJ0IGZvciBub3cpLgo+Pgo+PiBGdXJ0aGVyIGNwdWlkLm8gZGlkIG5vdCBoYXZlIGFu
eSBkZXBlbmRlbmNpZXMgYWRkZWQgZm9yIGl0Lgo+Pgo+PiBGaW5hbGx5LCB3aGlsZSBhdCBpdCwg
YWRkIGEgInJ1biIgdGFyZ2V0IHRvIHRoZSBjcHUtcG9saWN5IHRlc3QgaGFybmVzcy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFja2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSWFuLAoKeW91
IGhhZCBiZWVuIHBhcnRpY3VsYXJseSB1bmhhcHB5IGFib3V0IHRoZSB2MiBhcHByb2FjaC4gV2hp
bGUKbm90IHN0cmljdGx5IHJlcXVpcmVkIGZvciBjb21taXR0aW5nLCBJJ2Qgc3RpbGwgcHJlZmVy
IHRvIGhhdmUKeW91ciBhZ3JlZW1lbnQgd2l0aCB0aGlzIGFwcHJvYWNoIChvciwgb2YgY291cnNl
LCBzdWdnZXN0aW9ucwpmb3IgaW1wcm92ZW1lbnQpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
