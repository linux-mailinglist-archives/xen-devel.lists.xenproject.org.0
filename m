Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338012FAB8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:44:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQ1E-0001W9-FV; Fri, 03 Jan 2020 16:41:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inQ1C-0001W4-9l
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:41:46 +0000
X-Inumbo-ID: e8613dee-2e47-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8613dee-2e47-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 16:41:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF0C2B1D4;
 Fri,  3 Jan 2020 16:41:35 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <20191217105901.68158-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2285ab6-8627-545b-eedc-61e3c9e46769@suse.com>
Date: Fri, 3 Jan 2020 17:42:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217105901.68158-3-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMjAxOSAxMTo1OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL0tj
b25maWcKPiArKysgYi94ZW4vS2NvbmZpZwo+IEBAIC00LDkgKzQsMjYgQEAKPiAgIwo+ICBtYWlu
bWVudSAiWGVuLyQoU1JDQVJDSCkgJChYRU5fRlVMTFZFUlNJT04pIENvbmZpZ3VyYXRpb24iCj4g
IAo+ICtzb3VyY2UgInNjcmlwdHMvS2NvbmZpZy5pbmNsdWRlIgo+ICsKPiAgY29uZmlnIEJST0tF
Tgo+ICAJYm9vbAo+ICAKPiArY29uZmlnIENDX0lTX0dDQwo+ICsJZGVmX2Jvb2wgJChzdWNjZXNz
LCQoQ0MpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAgLXEgZ2NjKQo+ICsKPiArY29uZmln
IEdDQ19WRVJTSU9OCj4gKwlpbnQKPiArCWRlZmF1bHQgJChzaGVsbCwkKEJBU0VESVIpL3Njcmlw
dHMvZ2NjLXZlcnNpb24uc2ggJChDQykpIGlmIENDX0lTX0dDQwo+ICsJZGVmYXVsdCAwCgpXaHkg
ImlmIiBhbmQgYSAybmQgImRlZmF1bHQiIGxpbmUgaGVyZSBidXQgLi4uCgo+ICtjb25maWcgQ0Nf
SVNfQ0xBTkcKPiArCWRlZl9ib29sICQoc3VjY2VzcywkKENDKSAtLXZlcnNpb24gfCBoZWFkIC1u
IDEgfCBncmVwIC1xIGNsYW5nKQo+ICsKPiArY29uZmlnIENMQU5HX1ZFUlNJT04KPiArCWludAo+
ICsJZGVmYXVsdCAkKHNoZWxsLCQoQkFTRURJUikvc2NyaXB0cy9jbGFuZy12ZXJzaW9uLnNoICQo
Q0MpKQoKLi4uIGp1c3QgYSBzaW5nbGUsIHVuY29uZGl0aW9uYWwgb25lIGhlcmU/IFdvdWxkbid0
IGJvdGggYmV0dGVyCmhhdmUgYSAiZGVwZW5kcyBvbiBDQ19JU18qIiBsaW5lIGluc3RlYWQ/IFRo
aXMgd291bGQgdGhlbiBhbHNvCnJlc3VsdCAoYWZhaWN0KSBpbiBubyBDT05GSUdfQ0xBTkdfVkVS
U0lPTiBpbiAuY29uZmlnIGlmIGJ1aWxkaW5nCndpdGggZ2NjIChhbmQgdmljZSB2ZXJzYSksIGlu
c3RlYWQgb2YgYSBib2d1cyBDT05GSUdfQ0xBTkdfVkVSU0lPTj0wLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
