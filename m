Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A83C1CDD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 10:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqs7-0002Kr-8f; Mon, 30 Sep 2019 08:17:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEqs5-0002Kk-2E
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:17:29 +0000
X-Inumbo-ID: bd817234-e35a-11e9-96cb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id bd817234-e35a-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 08:17:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3882EAC11;
 Mon, 30 Sep 2019 08:17:27 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
 <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
 <23950.10341.746130.616131@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2fc42744-addb-d19e-1ddc-a507fd4ed254@suse.com>
Date: Mon, 30 Sep 2019 10:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23950.10341.746130.616131@mariner.uk.xensource.com>
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
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTc6MTksIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtQQVRDSCB2MSAxLzZdIGRvY3M6IGFkZCBmZWF0dXJlIGRvY3VtZW50IGZvciBY
ZW4gaHlwZXJ2aXNvciBzeXNmcy1saWtlIHN1cHBvcnQiKToKPj4gT24gMjcuMDkuMTkgMTU6Mzcs
IElhbiBKYWNrc29uIHdyb3RlOgo+Pj4gSSB0aGluayB0aGlzIGlzIEFTQ0lJIHByaW50aW5nIGNo
YXJhY3RlcnMgd2l0aCB0aGUgZXhjZXB0aW9uIG9mCj4+PiAgICAgISAiIGAgJCAlIF4gJiAqID0g
KyB7IH0gJyB+IDwgPiAvIFwgfAo+Pj4KPj4+IEkgc3RydWdnbGUgdG8gZmluZCBhIHByaW5jaXBs
ZWQgZXhwbGFuYXRpb24gZm9yIHRoaXMgcGFydGljdWxhcgo+Pj4gZXhjbHVzaW9uIHNldCAoYXBh
cnQgZnJvbSAvKSwgY29uc2lkZXJpbmcgdGhhdCBmb2xsb3dpbmcgYXJlCj4+PiBpbmNsdWRlZDoK
Pj4+ICAgICAtIEAgXyAuIDogKCApIFsgXSAjICwgOwo+Pj4KPj4+IENvdWxkIHdlIGJvcnJvdyBz
b21lIGV4aXN0aW5nIHBlcm1pdHRlZCBjaGFyYWN0ZXIgc2V0ID8gIElmIHdlIGFyZQo+Pj4gcGVy
bWl0dGluZyBzaGVsbCBtZXRhY2hhcmFjdGVycyB3aHkgbm90IGp1c3QgcGVybWl0IGFsbCBwcmlu
dGFibGUKPj4+IEFTQ0lJIGV4Y2VwdCAvID8KPj4KPj4gSG1tLCBtYXliZSB3ZSBzaG91bGQgYWxs
b3cganVzdCB0aGUgIlBvc2l4IHBvcnRhYmxlIGZpbGUgbmFtZSBjaGFyYWN0ZXIKPj4gc2V0Ij8g
VGhhdCB3b3VsZCBiZSBbLS5fMC05QS1aYS16XS4gQW5kIHdlIHNob3VsZCBleHBsaWNpdGx5IG5v
dCBhbGxvdwo+PiB0aGUga2V5IG5hbWVzICIuIiBhbmQgIi4uIi4KPiAKPiBJIGFncmVlIGFib3V0
ICIuIiBhbmQgIi4uIi4KPiAKPiBJJ20gbm90IHN1cmUgdGhlICJQb3NpeCBwb3J0YWJsZSBmaWxl
IG5hbWUgY2hhcmFjdGVyIHNldCIgaXMgYSB2ZXJ5Cj4gZ29vZCBndWlkZS4gIFBvc2l4IHdpbGwg
YmUgcHJldHR5IHJlc3RyaWN0ZWQgdGhlcmUuICBXaGF0IGlzIHRoZSBsZWdhbAo+IHNldCBpbiBh
IExpbnV4IHN5c2ZzIGZpbGVuYW1lID8KCkV2ZXJ5dGhpbmcgYnV0ICIvIiBhbmQgIlwwIi4KCj4g
Cj4+PiBEbyB5b3UgbWVhbiAiYW55IDctYml0IGJ5dGUiLCBvciBvY3RldCB2YWx1ZXMgMzItMTI2
ICgweDIwLTB4N2UpCj4+PiBpbmNsdXNpdmUsIG9yIHNvbWV0aGluZyBlbHNlID8KPj4KPj4gOi0p
Cj4+Cj4+IEFzIEknZCBsaWtlIHRvIHN1cHBvcnQgZS5nLiB0aGUgLmNvbmZpZyBmaWxlIGNvbnRl
bnRzIG9mIHRoZSBoeXBlcnZpc29yCj4+IGJ1aWxkIEkgZ3Vlc3MgSSBuZWVkICgweDAxLTB4ZmYp
IGluY2x1c2l2ZSwgcmlnaHQ/Cj4gCj4gVGhlIC5jb25maWcgZmlsZSBJIGhhdmUgaGVyZSBkb2Vz
IG5vdCBzZWVtIHRvIGNvbnRhaW4gYW55IGNvbnRyb2wKPiBjaGFyYWN0ZXJzLiAgSWYgaXQgZGlk
IHN1cmVseSB0aGF0IHdvdWxkIGJlIGEgYnVnPyAgSWYgeW91IHdhbnQgdGhpcwo+IHlvdSBvYnZp
b3VzbHkgZG8gbmVlZCB0byBwZXJtaXQgbmV3bGluZXMgYW5kIHNwYWNlcyBhbmQgcGVyaGFwcyB0
YWJzCj4gdG9vLgoKLmNvbmZpZyBjYW4gY29udGFpbiB1c2VyIHN1cHBsaWVkIHN0cmluZ3MuIFdo
aWxlIG5vdCBtYWtpbmcgbXVjaCBzZW5zZQp0byBoYXZlIHVucHJpbnRhYmxlIGNoYXJhY3RlcnMg
aW4gdGhlcmUgSSBkb24ndCBzZWUgaG93IHRvIHByZXZlbnQgdGhlbS4KQW5kIEkgZ3Vlc3Mgd2Un
ZCB3YW50IHRvIHNlZSB0aGVtIGluIGNhc2Ugc3VjaCBhIHdlaXJkIC5jb25maWcgd2FzIHVzZWQK
KGFuZCBwcm9iYWJseSByZXN1bHRlZCBpbiBzdHJhbmdlIGJlaGF2aW9yKS4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
