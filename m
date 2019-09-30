Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98031C1DAC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:11:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErge-0006q2-KV; Mon, 30 Sep 2019 09:09:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iErgc-0006px-VE
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:09:42 +0000
X-Inumbo-ID: 097d5b9c-e362-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 097d5b9c-e362-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 09:09:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59D28AE36;
 Mon, 30 Sep 2019 09:09:41 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
 <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
 <23950.10341.746130.616131@mariner.uk.xensource.com>
 <2fc42744-addb-d19e-1ddc-a507fd4ed254@suse.com>
 <f9d931a4-64b3-6aca-961a-f9fbf8fa030e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e47e43c1-0a13-0ec3-7ac8-46c61b7c9f06@suse.com>
Date: Mon, 30 Sep 2019 11:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f9d931a4-64b3-6aca-961a-f9fbf8fa030e@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMTA6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjA5LjIwMTkgMTA6
MTcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI3LjA5LjE5IDE3OjE5LCBJYW4gSmFja3Nv
biB3cm90ZToKPj4+IErDvHJnZW4gR3Jvw58gd3JpdGVzICgiUmU6IFtQQVRDSCB2MSAxLzZdIGRv
Y3M6IGFkZCBmZWF0dXJlIGRvY3VtZW50IGZvciBYZW4gaHlwZXJ2aXNvciBzeXNmcy1saWtlIHN1
cHBvcnQiKToKPj4+PiBPbiAyNy4wOS4xOSAxNTozNywgSWFuIEphY2tzb24gd3JvdGU6Cj4+Pj4+
IEkgdGhpbmsgdGhpcyBpcyBBU0NJSSBwcmludGluZyBjaGFyYWN0ZXJzIHdpdGggdGhlIGV4Y2Vw
dGlvbiBvZgo+Pj4+PiAgICAgICEgIiBgICQgJSBeICYgKiA9ICsgeyB9ICcgfiA8ID4gLyBcIHwK
Pj4+Pj4KPj4+Pj4gSSBzdHJ1Z2dsZSB0byBmaW5kIGEgcHJpbmNpcGxlZCBleHBsYW5hdGlvbiBm
b3IgdGhpcyBwYXJ0aWN1bGFyCj4+Pj4+IGV4Y2x1c2lvbiBzZXQgKGFwYXJ0IGZyb20gLyksIGNv
bnNpZGVyaW5nIHRoYXQgZm9sbG93aW5nIGFyZQo+Pj4+PiBpbmNsdWRlZDoKPj4+Pj4gICAgICAt
IEAgXyAuIDogKCApIFsgXSAjICwgOwo+Pj4+Pgo+Pj4+PiBDb3VsZCB3ZSBib3Jyb3cgc29tZSBl
eGlzdGluZyBwZXJtaXR0ZWQgY2hhcmFjdGVyIHNldCA/ICBJZiB3ZSBhcmUKPj4+Pj4gcGVybWl0
dGluZyBzaGVsbCBtZXRhY2hhcmFjdGVycyB3aHkgbm90IGp1c3QgcGVybWl0IGFsbCBwcmludGFi
bGUKPj4+Pj4gQVNDSUkgZXhjZXB0IC8gPwo+Pj4+Cj4+Pj4gSG1tLCBtYXliZSB3ZSBzaG91bGQg
YWxsb3cganVzdCB0aGUgIlBvc2l4IHBvcnRhYmxlIGZpbGUgbmFtZSBjaGFyYWN0ZXIKPj4+PiBz
ZXQiPyBUaGF0IHdvdWxkIGJlIFstLl8wLTlBLVphLXpdLiBBbmQgd2Ugc2hvdWxkIGV4cGxpY2l0
bHkgbm90IGFsbG93Cj4+Pj4gdGhlIGtleSBuYW1lcyAiLiIgYW5kICIuLiIuCj4+Pgo+Pj4gSSBh
Z3JlZSBhYm91dCAiLiIgYW5kICIuLiIuCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIHRoZSAiUG9zaXgg
cG9ydGFibGUgZmlsZSBuYW1lIGNoYXJhY3RlciBzZXQiIGlzIGEgdmVyeQo+Pj4gZ29vZCBndWlk
ZS4gIFBvc2l4IHdpbGwgYmUgcHJldHR5IHJlc3RyaWN0ZWQgdGhlcmUuICBXaGF0IGlzIHRoZSBs
ZWdhbAo+Pj4gc2V0IGluIGEgTGludXggc3lzZnMgZmlsZW5hbWUgPwo+Pgo+PiBFdmVyeXRoaW5n
IGJ1dCAiLyIgYW5kICJcMCIuCj4+Cj4+Pgo+Pj4+PiBEbyB5b3UgbWVhbiAiYW55IDctYml0IGJ5
dGUiLCBvciBvY3RldCB2YWx1ZXMgMzItMTI2ICgweDIwLTB4N2UpCj4+Pj4+IGluY2x1c2l2ZSwg
b3Igc29tZXRoaW5nIGVsc2UgPwo+Pj4+Cj4+Pj4gOi0pCj4+Pj4KPj4+PiBBcyBJJ2QgbGlrZSB0
byBzdXBwb3J0IGUuZy4gdGhlIC5jb25maWcgZmlsZSBjb250ZW50cyBvZiB0aGUgaHlwZXJ2aXNv
cgo+Pj4+IGJ1aWxkIEkgZ3Vlc3MgSSBuZWVkICgweDAxLTB4ZmYpIGluY2x1c2l2ZSwgcmlnaHQ/
Cj4+Pgo+Pj4gVGhlIC5jb25maWcgZmlsZSBJIGhhdmUgaGVyZSBkb2VzIG5vdCBzZWVtIHRvIGNv
bnRhaW4gYW55IGNvbnRyb2wKPj4+IGNoYXJhY3RlcnMuICBJZiBpdCBkaWQgc3VyZWx5IHRoYXQg
d291bGQgYmUgYSBidWc/ICBJZiB5b3Ugd2FudCB0aGlzCj4+PiB5b3Ugb2J2aW91c2x5IGRvIG5l
ZWQgdG8gcGVybWl0IG5ld2xpbmVzIGFuZCBzcGFjZXMgYW5kIHBlcmhhcHMgdGFicwo+Pj4gdG9v
Lgo+Pgo+PiAuY29uZmlnIGNhbiBjb250YWluIHVzZXIgc3VwcGxpZWQgc3RyaW5ncy4gV2hpbGUg
bm90IG1ha2luZyBtdWNoIHNlbnNlCj4+IHRvIGhhdmUgdW5wcmludGFibGUgY2hhcmFjdGVycyBp
biB0aGVyZSBJIGRvbid0IHNlZSBob3cgdG8gcHJldmVudCB0aGVtLgo+IAo+IERvZXMgLyBjYW4n
dCBrY29uZmlnIHJlamVjdCB0aGVtPwoKUmlnaHQgbm93IGl0IGRvZXNuJ3QuCgpJIHRlc3RlZCB0
aGF0IGJ5IG1hbnVhbGx5IG1vZGlmeWluZyBteSAuY29uZmlnIGFuZCB0aGVuIGRvaW5nIGEgbWFr
ZS4KVGhlICh3cm9uZykgLmNvbmZpZyB3YXMgYWNjZXB0ZWQgYW5kIHRoZSBoeXBlcnZpc29yIGJ1
aWx0IHdpdGggaXQuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
