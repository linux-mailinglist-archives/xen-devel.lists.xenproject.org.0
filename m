Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8397C1EC5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:18:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsjP-0004sw-7b; Mon, 30 Sep 2019 10:16:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEsjN-0004sq-Ts
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:16:37 +0000
X-Inumbo-ID: 62b0a6ca-e36b-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 62b0a6ca-e36b-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:16:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7DC2BAF19;
 Mon, 30 Sep 2019 10:16:36 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
 <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
 <23950.10341.746130.616131@mariner.uk.xensource.com>
 <2fc42744-addb-d19e-1ddc-a507fd4ed254@suse.com>
 <f9d931a4-64b3-6aca-961a-f9fbf8fa030e@suse.com>
 <e47e43c1-0a13-0ec3-7ac8-46c61b7c9f06@suse.com>
 <23953.54239.532571.783220@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <89984149-ed06-775d-c99c-2772705cbc0e@suse.com>
Date: Mon, 30 Sep 2019 12:16:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23953.54239.532571.783220@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/6] docs: add feature document for Xen
 hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMTI6MDcsIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtQQVRDSCB2MSAxLzZdIGRvY3M6IGFkZCBmZWF0dXJlIGRvY3VtZW50IGZvciBY
ZW4gaHlwZXJ2aXNvciBzeXNmcy1saWtlIHN1cHBvcnQiKToKPj4gT24gMzAuMDkuMTkgMTA6NTcs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMzAuMDkuMjAxOSAxMDoxNywgSsO8cmdlbiBHcm/D
nyB3cm90ZToKPj4+PiAuY29uZmlnIGNhbiBjb250YWluIHVzZXIgc3VwcGxpZWQgc3RyaW5ncy4g
V2hpbGUgbm90IG1ha2luZyBtdWNoIHNlbnNlCj4+Pj4gdG8gaGF2ZSB1bnByaW50YWJsZSBjaGFy
YWN0ZXJzIGluIHRoZXJlIEkgZG9uJ3Qgc2VlIGhvdyB0byBwcmV2ZW50IHRoZW0uCj4+Pgo+Pj4g
RG9lcyAvIGNhbid0IGtjb25maWcgcmVqZWN0IHRoZW0/Cj4+Cj4+IFJpZ2h0IG5vdyBpdCBkb2Vz
bid0Lgo+Pgo+PiBJIHRlc3RlZCB0aGF0IGJ5IG1hbnVhbGx5IG1vZGlmeWluZyBteSAuY29uZmln
IGFuZCB0aGVuIGRvaW5nIGEgbWFrZS4KPj4gVGhlICh3cm9uZykgLmNvbmZpZyB3YXMgYWNjZXB0
ZWQgYW5kIHRoZSBoeXBlcnZpc29yIGJ1aWx0IHdpdGggaXQuCj4gCj4gVXJnaC4KPiAKPiBJIHRo
aW5rIHRoYXQgZWl0aGVyCj4gCj4gKEEpIHRoaXMgbmVlZHMgdG8gYmUgcHJldmVudGVkIHNvbWVo
b3csIG9yCgpEaWZmaWN1bHQsIGFzIHdlIGluaGVyaXQga2NvbmZpZyBmcm9tIHRoZSBMaW51eCBr
ZXJuZWwuCgo+IChCKSB5b3VyIHVzZXJsYW5kIHRvb2xzLCBhdCB0aGUgdmVyeSBsZWFzdCwgbmVl
ZCBzb3VwaW5nIHVwIHNvIHRoYXQKPiB0aGV5IChpKSBieSBkZWZhdWx0IGRvIG5vdCByaXNrIHNw
YW1taW5nIHRoZSB1c2VyJ3MgdGVybWluYWwgd2l0aAo+IGJpbmFyeSBnaWJiZXJpc2ggd2hpY2gg
c29tZW9uZSBzdG9yZWQgaW4geGVuaHlwZnMgKGlpKSBjYW4gYmUgdXNlZCB0bwo+IHJlbGlhYmx5
IGV4dHJhY3QgYW55IGJpbmFyeSBvYmplY3RzIHdoaWNoIGhhdmUgYmVlbiBzdG9yZWQuCj4gCj4g
SSB0aGluayAoQikoaSkgbmVjZXNzYXJpbHkgaW52b2x2ZXMgc29tZSBraW5kIG9mIHF1b3Rpbmcg
c2NoZW1lIDotLy4KPiAoQikoaWkpIG1lYW5zIHRoZSBxdW90aW5nIG5lZWRzIHRvIGJlIHR1cm4t
b2ZmLWFibGUuCgpZZXMsIHRoaXMgc2VlbXMgdG8gYmUgYSBzZW5zaWJsZSB0aGluZyB0byBkby4K
CgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
