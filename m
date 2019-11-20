Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10510384D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 12:12:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXNqq-00083o-R8; Wed, 20 Nov 2019 11:08:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXNqp-00083f-C6
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 11:08:47 +0000
X-Inumbo-ID: 1e94181c-0b86-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e94181c-0b86-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 11:08:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9DFF9B1CC4;
 Wed, 20 Nov 2019 11:08:42 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
 <20191120100627.GP72134@Air-de-Roger>
 <c823656633fc4cde9fb232809c31c8a2@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a821dd08-3afb-350d-dded-26b7e07df4b1@suse.com>
Date: Wed, 20 Nov 2019 12:08:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c823656633fc4cde9fb232809c31c8a2@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] grant table size
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAxMTo0OSwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiBGcm9tOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gU2VudDogMjAgTm92ZW1iZXIg
MjAxOSAxMTowNgo+Pgo+PiBEbyB5b3UgaGF2ZSBpbiBtaW5kIHRvIHNpZ25hbCB0aGlzIHNvbWVo
b3cgdG8gZ3Vlc3RzLCBvciB0aGUKPj4gZXhwZWN0YXRpb24gaXMgdGhhdCB0aGUgZ3Vlc3Qgd2ls
bCBoYXZlIHRvIHBvbGwgR05UVEFCT1BfcXVlcnlfc2l6ZQo+PiBhbmQgYXQgc29tZSBwb2ludCB0
aGUgc2l6ZSB3aWxsIGluY3JlYXNlPwo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlIGd1ZXN0IG5lZWQg
Y2FyZSB1bnRpbCBpdHMgZ3JhbnQgdGFibGUgZ3Jvd3MgdG8gdGhlCj4gbWF4LiBBdCB0aGF0IHBv
aW50LCByYXRoZXIgdGhhbiBnaXZpbmcgdXAsIHRoZSBndWVzdCB3b3VsZCByZS1xdWVyeQo+IHRo
ZSBtYXggdmFsdWUgdG8gc2VlIGlmIHRoZXJlIGlzIG5vdyBtb3JlIGhlYWRyb29tIGFuZCB0aGVu
IHJlLXNpemUKPiBpdHMgaW50ZXJuYWwgZGF0YSBzdHJ1Y3R1cmVzIGFjY29yZGluZ2x5LgoKSWYg
d2UgY29uc2lkZXIgZHluYW1pYyBhZGp1c3RtZW50cywgd2hhdCBhYm91dCBzaHJpbmtpbmcgb2Yg
dGhlCnRhYmxlPyBUaGlzIHdvdWxkIG9mIGNvdXJzZSByZXF1aXJlIHNvbWUgZm9ybSBvZiBndWVz
dCBjb25zZW50LApidXQgaXQgd291bGQgYmUgbmljZSBpZiB0aGUgb3B0aW9uIHdvdWxkIGF0IGxl
YXN0IGJlIGFjY291bnRlZApmb3Igd2hlbiB3b3JraW5nIG91dCBob3cgYWxsIG9mIHRoaXMgc2hv
dWxkIGJlaGF2ZSwgZXZlbiBpZiB0aGUKY2FzZSBtYXkgbm90IGdldCBoYW5kbGVkIHJpZ2h0IG5v
dy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
