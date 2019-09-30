Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9BC1D9C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErVE-0005jj-SY; Mon, 30 Sep 2019 08:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iErVD-0005iv-4b
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:57:55 +0000
X-Inumbo-ID: 63947644-e360-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 63947644-e360-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 08:57:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E9FDADCC;
 Mon, 30 Sep 2019 08:57:53 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
 <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
 <23950.10341.746130.616131@mariner.uk.xensource.com>
 <2fc42744-addb-d19e-1ddc-a507fd4ed254@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9d931a4-64b3-6aca-961a-f9fbf8fa030e@suse.com>
Date: Mon, 30 Sep 2019 10:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2fc42744-addb-d19e-1ddc-a507fd4ed254@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMDoxNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNy4wOS4xOSAx
NzoxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IErDvHJnZW4gR3Jvw58gd3JpdGVzICgiUmU6IFtQ
QVRDSCB2MSAxLzZdIGRvY3M6IGFkZCBmZWF0dXJlIGRvY3VtZW50IGZvciBYZW4gaHlwZXJ2aXNv
ciBzeXNmcy1saWtlIHN1cHBvcnQiKToKPj4+IE9uIDI3LjA5LjE5IDE1OjM3LCBJYW4gSmFja3Nv
biB3cm90ZToKPj4+PiBJIHRoaW5rIHRoaXMgaXMgQVNDSUkgcHJpbnRpbmcgY2hhcmFjdGVycyB3
aXRoIHRoZSBleGNlcHRpb24gb2YKPj4+PiAgICAgISAiIGAgJCAlIF4gJiAqID0gKyB7IH0gJyB+
IDwgPiAvIFwgfAo+Pj4+Cj4+Pj4gSSBzdHJ1Z2dsZSB0byBmaW5kIGEgcHJpbmNpcGxlZCBleHBs
YW5hdGlvbiBmb3IgdGhpcyBwYXJ0aWN1bGFyCj4+Pj4gZXhjbHVzaW9uIHNldCAoYXBhcnQgZnJv
bSAvKSwgY29uc2lkZXJpbmcgdGhhdCBmb2xsb3dpbmcgYXJlCj4+Pj4gaW5jbHVkZWQ6Cj4+Pj4g
ICAgIC0gQCBfIC4gOiAoICkgWyBdICMgLCA7Cj4+Pj4KPj4+PiBDb3VsZCB3ZSBib3Jyb3cgc29t
ZSBleGlzdGluZyBwZXJtaXR0ZWQgY2hhcmFjdGVyIHNldCA/ICBJZiB3ZSBhcmUKPj4+PiBwZXJt
aXR0aW5nIHNoZWxsIG1ldGFjaGFyYWN0ZXJzIHdoeSBub3QganVzdCBwZXJtaXQgYWxsIHByaW50
YWJsZQo+Pj4+IEFTQ0lJIGV4Y2VwdCAvID8KPj4+Cj4+PiBIbW0sIG1heWJlIHdlIHNob3VsZCBh
bGxvdyBqdXN0IHRoZSAiUG9zaXggcG9ydGFibGUgZmlsZSBuYW1lIGNoYXJhY3Rlcgo+Pj4gc2V0
Ij8gVGhhdCB3b3VsZCBiZSBbLS5fMC05QS1aYS16XS4gQW5kIHdlIHNob3VsZCBleHBsaWNpdGx5
IG5vdCBhbGxvdwo+Pj4gdGhlIGtleSBuYW1lcyAiLiIgYW5kICIuLiIuCj4+Cj4+IEkgYWdyZWUg
YWJvdXQgIi4iIGFuZCAiLi4iLgo+Pgo+PiBJJ20gbm90IHN1cmUgdGhlICJQb3NpeCBwb3J0YWJs
ZSBmaWxlIG5hbWUgY2hhcmFjdGVyIHNldCIgaXMgYSB2ZXJ5Cj4+IGdvb2QgZ3VpZGUuICBQb3Np
eCB3aWxsIGJlIHByZXR0eSByZXN0cmljdGVkIHRoZXJlLiAgV2hhdCBpcyB0aGUgbGVnYWwKPj4g
c2V0IGluIGEgTGludXggc3lzZnMgZmlsZW5hbWUgPwo+IAo+IEV2ZXJ5dGhpbmcgYnV0ICIvIiBh
bmQgIlwwIi4KPiAKPj4KPj4+PiBEbyB5b3UgbWVhbiAiYW55IDctYml0IGJ5dGUiLCBvciBvY3Rl
dCB2YWx1ZXMgMzItMTI2ICgweDIwLTB4N2UpCj4+Pj4gaW5jbHVzaXZlLCBvciBzb21ldGhpbmcg
ZWxzZSA/Cj4+Pgo+Pj4gOi0pCj4+Pgo+Pj4gQXMgSSdkIGxpa2UgdG8gc3VwcG9ydCBlLmcuIHRo
ZSAuY29uZmlnIGZpbGUgY29udGVudHMgb2YgdGhlIGh5cGVydmlzb3IKPj4+IGJ1aWxkIEkgZ3Vl
c3MgSSBuZWVkICgweDAxLTB4ZmYpIGluY2x1c2l2ZSwgcmlnaHQ/Cj4+Cj4+IFRoZSAuY29uZmln
IGZpbGUgSSBoYXZlIGhlcmUgZG9lcyBub3Qgc2VlbSB0byBjb250YWluIGFueSBjb250cm9sCj4+
IGNoYXJhY3RlcnMuICBJZiBpdCBkaWQgc3VyZWx5IHRoYXQgd291bGQgYmUgYSBidWc/ICBJZiB5
b3Ugd2FudCB0aGlzCj4+IHlvdSBvYnZpb3VzbHkgZG8gbmVlZCB0byBwZXJtaXQgbmV3bGluZXMg
YW5kIHNwYWNlcyBhbmQgcGVyaGFwcyB0YWJzCj4+IHRvby4KPiAKPiAuY29uZmlnIGNhbiBjb250
YWluIHVzZXIgc3VwcGxpZWQgc3RyaW5ncy4gV2hpbGUgbm90IG1ha2luZyBtdWNoIHNlbnNlCj4g
dG8gaGF2ZSB1bnByaW50YWJsZSBjaGFyYWN0ZXJzIGluIHRoZXJlIEkgZG9uJ3Qgc2VlIGhvdyB0
byBwcmV2ZW50IHRoZW0uCgpEb2VzIC8gY2FuJ3Qga2NvbmZpZyByZWplY3QgdGhlbT8KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
