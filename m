Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F50E1E43
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHhK-0001IH-88; Wed, 23 Oct 2019 14:33:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNHhI-0001IC-Pb
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:33:12 +0000
X-Inumbo-ID: 0774237e-f5a2-11e9-9481-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0774237e-f5a2-11e9-9481-12813bfff9fa;
 Wed, 23 Oct 2019 14:33:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 810FFB48D;
 Wed, 23 Oct 2019 14:33:06 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <20191016105303.21948-1-julien.grall@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1e4414c-d42c-3db1-d3ab-3dc3f921f79c@suse.com>
Date: Wed, 23 Oct 2019 16:33:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016105303.21948-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTAuMjAxOSAxMjo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHZpcnRfdG9fbWFkZHIo
KSBpcyB1c2luZyB0aGUgaGFyZHdhcmUgcGFnZS10YWJsZSB3YWxrIGluc3RydWN0aW9ucyB0bwo+
IHRyYW5zbGF0ZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBwaHlzaWNhbCBhZGRyZXNzLiBUaGUgZnVu
Y3Rpb24gc2hvdWxkCj4gb25seSBiZSBjYWxsZWQgb24gdmlydHVhbCBhZGRyZXNzIG1hcHBlZC4K
PiAKPiBfZW5kIHBvaW50cyBwYXN0IHRoZSBlbmQgb2YgWGVuIGJpbmFyeSBhbmQgbWF5IG5vdCBi
ZSBtYXBwZWQgd2hlbiB0aGUKPiBiaW5hcnkgc2l6ZSBpcyBwYWdlLWFsaWduZWQuIFRoaXMgbWVh
bnMgdmlydF90b19tYWRkcigpIHdpbGwgbm90IGJlIGFibGUKPiB0byBkbyB0aGUgdHJhbnNsYXRp
b24gYW5kIHRoZXJlZm9yZSBjcmFzaCBYZW4uCj4gCj4gTm90ZSB0aGVyZSBpcyBhbHNvIGFuIG9m
Zi1ieS1vbmUgaXNzdWUgaW4gdGhpcyBjb2RlLCBidXQgdGhlIHBhbmljIHdpbGwKPiB0cnVtcCB0
aGF0Lgo+IAo+IEJvdGggaXNzdWVzIGNhbiBiZSBmaXhlZCBieSB1c2luZyBfZW5kIC0gMSBpbiB0
aGUgY2hlY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gCj4gLS0tCj4gCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6
IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IAo+
IHg4NiBzZWVtcyB0byBiZSBhZmZlY3RlZCBieSB0aGUgb2ZmLWJ5LW9uZSBpc3N1ZS4gSmFuLCBB
bmRyZXc/CgpJbmRlZWQuIEknbSBpbiB0aGUgcHJvY2VzcyBvZiBtYWtpbmcgYSBwYXRjaC4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
