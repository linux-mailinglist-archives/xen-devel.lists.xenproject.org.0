Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977CFEAB4D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 09:07:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ5RO-00038C-Bj; Thu, 31 Oct 2019 08:04:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ5RM-000387-Rs
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 08:04:20 +0000
X-Inumbo-ID: 0aab73c6-fbb5-11e9-953e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aab73c6-fbb5-11e9-953e-12813bfff9fa;
 Thu, 31 Oct 2019 08:04:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B3D9AC40;
 Thu, 31 Oct 2019 08:04:19 +0000 (UTC)
To: "Zhang, JinwenX" <jinwenx.zhang@intel.com>
References: <14DE39AD90EE4549A78D07880F9625AE0B40724C@SHSMSX101.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <874e5df1-9f77-58c0-2669-cf468752dd18@suse.com>
Date: Thu, 31 Oct 2019 09:04:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <14DE39AD90EE4549A78D07880F9625AE0B40724C@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] Xen 4.13 rc1 can not boot up with new Domain0
 kernel(linux5.4.0-rc3)
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
Cc: Juergen Gross <jgross@suse.com>, Xudong Hao <xudong.hao@intel.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAwMzo0OCwgIFpoYW5nLCBKaW53ZW5YICB3cm90ZToKPiBCdWcgZGV0YWls
ZWQgZGVzY3JpcHRpb246Cj4gLS0tLS0tLS0tLS0tLS0tLQo+IENhbiBub3QgYm9vdCB1cCB4ZW4g
d2l0aCBuZXcgRG9tYWluMCBrZXJuZWwobGludXg1LjQuMC1yYzMpIAo+IAo+IEVudmlyb25tZW50
IDoKPiAtLS0tLS0tLS0tLS0tLS0tCj4gSFc6IENhc2NhZGUgTGFrZSBzZXJ2ZXIgCj4gWGVuOiBY
RU4gNC4xMy4wcmMxCj4gRG9tMDogTGludXggNS40LjAtcmMzCj4gCj4gUmVwcm9kdWNlIHN0ZXBz
Ogo+IC0tLS0tLS0tLS0tLS0tLS0KPiAxLiBpbnN0YWxsIFhlbiBhbmQgYnVpbGQgRG9tMCBrZXJu
ZWwoNS40LjAtcmMzKSAKPiAyLiByZXN0YXJ0IGhvc3Qgc2VydmVyKGNhbiBub3QgYm9vdCB1cCkK
PiAKPiBDdXJyZW50IHJlc3VsdDoKPiAtLS0tLS0tLS0tLS0tLS0tCj4gQ2FuIG5vdCBib290IHVw
IGhvc3QKClRoZSB3YXkgeW91IHdvcmQgdGhpbmdzLCB5b3Ugc2VlbSB0byBzdXNwZWN0IGFuIGlz
c3VlIGluIFhlbi4gVGhlCmxvZyB5b3UndmUgcHJvdmlkZWQgc3VnZ2VzdHMgYSBMaW51eCBrZXJu
ZWwgc2lkZSBpc3N1ZSB0aG91Z2guCkNvdWxkIHlvdSBjbGFyaWZ5IHRoYXQgaW5kZWVkIHRoaXMg
aXMgYW4gaXNzdWUgd2l0aCBYZW4gNC4xMyBSQzEsCmkuZS4gdGhhdCB0aGUgc2FtZSBpc3N1ZSBk
b2Vzbid0IG9jY3VyIHdpdGggb2xkZXIgWGVuLCBlLmcuCjQuMTIuMT8KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
