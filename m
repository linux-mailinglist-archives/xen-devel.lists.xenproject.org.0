Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DABCB5FE3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 11:13:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAVyL-00043L-VP; Wed, 18 Sep 2019 09:10:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAVyK-0003zq-CW
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:10:00 +0000
X-Inumbo-ID: 16eda1f0-d9f4-11e9-962a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16eda1f0-d9f4-11e9-962a-12813bfff9fa;
 Wed, 18 Sep 2019 09:09:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8420ABE9;
 Wed, 18 Sep 2019 09:09:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <fc21565a-3cb1-4547-09a2-fc908a51e526@suse.com>
 <9318cb16-a159-df4b-3886-6636d8f3b763@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a7f7fe6-cba6-6e1e-87e5-217aded6513f@suse.com>
Date: Wed, 18 Sep 2019 11:10:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9318cb16-a159-df4b-3886-6636d8f3b763@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 8/9] x86/CPUID: drop INVPCID dependency
 on PCID
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAyMTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8wOS8yMDE5
IDA3OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gUENJRCB2YWxpZGx5IGRlcGVuZHMgb24gTE0s
IGFzIGl0IGNhbiBiZSBlbmFibGVkIGluIExvbmcgTW9kZSBvbmx5Lgo+PiBJTlZQQ0lELCBvdG9o
LCBjYW4gYmUgdXNlZCBub3Qgb25seSB3aXRob3V0IFBDSUQgZW5hYmxlZCwgYnV0IGFsc28KPj4g
b3V0c2lkZSBvZiBMb25nIE1vZGUgYWx0b2dldGhlci4gSW4gYm90aCBjYXNlcyBpdHMgZnVuY3Rp
b25hbGl0eSBpcwo+PiBzaW1wbHkgcmVzdHJpY3RlZCB0byBQQ0lEIDAsIHdoaWNoIGlzIHNvcnQg
b2YgZXhwZWN0ZWQgYXMgbm8gb3RoZXIgUENJRAo+PiBjYW4gYmUgYWN0aXZhdGVkIHRoZXJlLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4KPj4g
LS0tIGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQo+PiArKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlk
LnB5Cj4+IEBAIC0yMTgsMTAgKzIxOCw2IEBAIGRlZiBjcnVuY2hfbnVtYmVycyhzdGF0ZSk6Cj4+
ICAgICAgICAgICMKPj4gICAgICAgICAgIyBTU0U0XzI6IFtQT1BDTlRdCj4+ICAKPj4gLSAgICAg
ICAgIyBUaGUgSU5WUENJRCBpbnN0cnVjdGlvbiBkZXBlbmRzIG9uIFBDSUQgaW5mcmFzdHJ1Y3R1
cmUgYmVpbmcKPj4gLSAgICAgICAgIyBhdmFpbGFibGUuCj4+IC0gICAgICAgIFBDSUQ6IFtJTlZQ
Q0lEXSwKPiAKPiBJIHRha2UgaXQgeW91IGhhdmVuJ3QgdHJpZWQgcnVubmluZyBhIHNoYWRvdyBn
dWVzdCB3aXRoIHRoaXMgY2hhbmdlIGluCj4gcGxhY2UuCj4gCj4gRm9yICFFUFQsIHdlIGNsZWFy
IEVOQUJMRV9JTlZQQ0lEIHNvIHRoZSBpbnN0cnVjdGlvbiB3aWxsICNVRCB3aXRoaW4gdGhlCj4g
Z3Vlc3QuCj4gCj4gV2UgY291bGQgaW4gcHJpbmNpcGxlIGFsbG93IHRoZSB1c2Ugb2YgSU5WUENJ
RCB3aXRoIHNoYWRvdyBndWVzdHMsIGJ1dAo+IHRoYXQgd291bGQgaW52b2x2ZSB0ZWFjaGluZyBY
ZW4gaG93IHRvIGNvcGUgd2l0aCBWTUVYSVRfUkVBU09OX0lOVlBDSUQKPiAod2hpY2ggaXMgcHJl
ZGljYXRlZCBvbiBJTlZMUEcgZXhpdGluZykgYW5kIHdpcmUgdGhlIGZsdXNoIGJhY2sgaW50byB0
aGUKPiBzaGFkb3cgbG9naWMuCj4gCj4gUGVyaGFwcyB0aGUgY29tbWVudCBjb3VsZCBiZSBhIGxp
dHRsZSBjbGVhcmVyLCBidXQgaXQgaXMgbm8gYWNjaWRlbnQKPiB0aGF0IGRlcGVuZGVuY3kgaXMg
aW4gcGxhY2UuCgpJJ20gYWZyYWlkIEkgZG9uJ3QgZm9sbG93OiBCb3RoIGZlYXR1cmVzIGFyZSBt
YXJrZWQgSCBpbiB0aGUKcHVibGljIGhlYWRlciwgc28gSSBkb24ndCBzZWUgaG93IHNoYWRvdyBt
b2RlIGNvbnNpZGVyYXRpb25zCmFwcGx5IGhlcmUgYXQgYWxsLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
