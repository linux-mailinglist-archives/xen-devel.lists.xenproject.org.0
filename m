Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8DA864E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 18:02:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Xg7-0000oS-7t; Wed, 04 Sep 2019 15:58:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Xg5-0000oD-9t
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 15:58:37 +0000
X-Inumbo-ID: da46675e-cf2c-11e9-abbb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da46675e-cf2c-11e9-abbb-12813bfff9fa;
 Wed, 04 Sep 2019 15:58:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D9A3AC90;
 Wed,  4 Sep 2019 15:58:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <050de29e-5a10-8b4a-44f1-0241f4b33ee2@suse.com>
 <53d3e1ed-93c4-56de-dbb8-2517feaa93bb@suse.com>
 <ad4fd583-ae60-d1ba-961a-75a7c385ea7c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d6c8a3f-7fab-b38c-6c4e-1e1db5a9192a@suse.com>
Date: Wed, 4 Sep 2019 17:58:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad4fd583-ae60-d1ba-961a-75a7c385ea7c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] VT-d: avoid PCI device lookup
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
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNzo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8wOS8yMDE5
IDE0OjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmgKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmgKPj4gQEAgLTUzMCw2ICs1MzAsNyBAQCBzdHJ1Y3QgaW50ZWxfaW9tbXUgewo+PiAgICAgIHN0
cnVjdCBpcl9jdHJsIGlyX2N0cmw7Cj4+ICAgICAgc3RydWN0IGlvbW11X2ZsdXNoIGZsdXNoOwo+
PiAgICAgIHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZDsKPj4gKyAgICBub2RlaWRfdCBub2Rl
Owo+PiAgfTsKPiAKPiBDYW4gSSB0YWxrIHlvdSBpbnRvIHB1dHRpbmcgdGhpcyBpbnRvICJzdHJ1
Y3QgaW9tbXUiIGltbWVkaWF0ZWx5PwoKT2YgY291cnNlLiBJdCdzIHRoaXMgd2F5IHNpbXBseSBi
ZWNhdXNlIEkgZm9yZ290IC4uLgoKPiBJdCB3aWxsIGNvbGxpZGUgZmFyIGxlc3Mgd2l0aMKgIHRo
ZSBzZXJpZXMgSSd2ZSBnb3QgdGhhdCBmb2xkcyBhbGwgb2YKPiB0aGVzZSByZWR1bmRhbnQgc3Ry
dWN0cyB0b2dldGhlci4KPiAKPiB+QW5kcmV3Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
eGVuLWRldmVsLzE1NTA4NjI4MDYtMzAyMzYtMS1naXQtc2VuZC1lbWFpbC1hbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tLwoKLi4uIHRoYXQgdGhpcyBpcyBhbGwgSW50ZWwtc3BlY2lmaWM7IHdpdGhv
dXQgZnVydGhlciBjaGVja2luZwpJIGRpZCBpbXBseSB0aGF0IHN0cnVjdCBpb21tdSBpcyBzb21l
IGdlbmVyaWMgYWJzdHJhY3Rpb24gdGhhdAp3YXMgYWxyZWFkeSBicm9rZW4gb3V0LiBBbmQgSSBk
aWRuJ3Qgd2FudCB0byBmaWRkbGUgd2l0aCBub24tClZULWQgY29kZSBoZXJlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
