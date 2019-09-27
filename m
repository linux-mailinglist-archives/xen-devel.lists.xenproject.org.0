Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19EC0833
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:01:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrhT-0000q8-6W; Fri, 27 Sep 2019 14:58:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDrhS-0000q3-7s
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:58:26 +0000
X-Inumbo-ID: 4097ab00-e137-11e9-967c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4097ab00-e137-11e9-967c-12813bfff9fa;
 Fri, 27 Sep 2019 14:58:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B453AF55;
 Fri, 27 Sep 2019 14:58:23 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
Date: Fri, 27 Sep 2019 16:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23950.4274.238406.524438@mariner.uk.xensource.com>
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

T24gMjcuMDkuMTkgMTU6MzcsIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtQQVRDSCB2MSAxLzZdIGRvY3M6IGFkZCBmZWF0dXJlIGRvY3VtZW50IGZvciBY
ZW4gaHlwZXJ2aXNvciBzeXNmcy1saWtlIHN1cHBvcnQiKToKPj4gT24gMjcuMDkuMTkgMTI6Mzcs
IElhbiBKYWNrc29uIHdyb3RlOgo+Pj4gSSBndWVzcyB0aGF0IGtleXMgd2lsbCBiZSBjaG9zZW4g
ZnJvbSBzb21lIGxpbWl0ZWQgc2FmZSBjaGFyYWN0ZXIKPj4+IHNldCA/ICBXaGF0IGFib3V0IHZh
bHVlcyA/ICBNaWdodCB3ZSBjcmVhdGUgYSBrZXkgd2hvc2UgdmFsdWUgY29udGFpbnMKPj4+IGJp
bmFyeSBkYXRhID8KPj4KPj4gSSdkIGdvIHdpdGggIlstQS1aYS16MC05QF8uOigpXFtcXSMsO10q
IiBmb3Iga2V5cwo+IAo+IEkgdGhpbmsgdGhpcyBpcyBBU0NJSSBwcmludGluZyBjaGFyYWN0ZXJz
IHdpdGggdGhlIGV4Y2VwdGlvbiBvZgo+ICAgICEgIiBgICQgJSBeICYgKiA9ICsgeyB9ICcgfiA8
ID4gLyBcIHwKPiAKPiBJIHN0cnVnZ2xlIHRvIGZpbmQgYSBwcmluY2lwbGVkIGV4cGxhbmF0aW9u
IGZvciB0aGlzIHBhcnRpY3VsYXIKPiBleGNsdXNpb24gc2V0IChhcGFydCBmcm9tIC8pLCBjb25z
aWRlcmluZyB0aGF0IGZvbGxvd2luZyBhcmUKPiBpbmNsdWRlZDoKPiAgICAtIEAgXyAuIDogKCAp
IFsgXSAjICwgOwo+IAo+IENvdWxkIHdlIGJvcnJvdyBzb21lIGV4aXN0aW5nIHBlcm1pdHRlZCBj
aGFyYWN0ZXIgc2V0ID8gIElmIHdlIGFyZQo+IHBlcm1pdHRpbmcgc2hlbGwgbWV0YWNoYXJhY3Rl
cnMgd2h5IG5vdCBqdXN0IHBlcm1pdCBhbGwgcHJpbnRhYmxlCj4gQVNDSUkgZXhjZXB0IC8gPwoK
SG1tLCBtYXliZSB3ZSBzaG91bGQgYWxsb3cganVzdCB0aGUgIlBvc2l4IHBvcnRhYmxlIGZpbGUg
bmFtZSBjaGFyYWN0ZXIKc2V0Ij8gVGhhdCB3b3VsZCBiZSBbLS5fMC05QS1aYS16XS4gQW5kIHdl
IHNob3VsZCBleHBsaWNpdGx5IG5vdCBhbGxvdwp0aGUga2V5IG5hbWVzICIuIiBhbmQgIi4uIi4K
Cj4gCj4+IGFuZCBBU0NJSSBmb3IgdmFsdWVzLgo+IAo+IERvIHlvdSBtZWFuICJhbnkgNy1iaXQg
Ynl0ZSIsIG9yIG9jdGV0IHZhbHVlcyAzMi0xMjYgKDB4MjAtMHg3ZSkKPiBpbmNsdXNpdmUsIG9y
IHNvbWV0aGluZyBlbHNlID8KCjotKQoKQXMgSSdkIGxpa2UgdG8gc3VwcG9ydCBlLmcuIHRoZSAu
Y29uZmlnIGZpbGUgY29udGVudHMgb2YgdGhlIGh5cGVydmlzb3IKYnVpbGQgSSBndWVzcyBJIG5l
ZWQgKDB4MDEtMHhmZikgaW5jbHVzaXZlLCByaWdodD8KCj4gCj4+PiBXb3VsZCBpdCBiZSBwb3Nz
aWJsZSB0byBhZGQgYSBzY3JpcHQgdG8geGVuLmdpdCB3aGljaCBsaXN0cyB0aGUKPj4+IHhlbmh5
cGZzIGFuZCBjaGVja3MgdGhhdCBhbGwgdGhlIHBhdGhzIGFyZSBkb2N1bWVudGVkID8gIFdlIGNv
dWxkIGFkZAo+Pj4gYSBmZXcgY2FsbHMgdG8gdGhhdCB0byBvc3N0ZXN0Li4uCj4+Cj4+IEknZCBl
eHBlY3Qgc29tZSBwYXJ0cyB0byBiZSBkZXNjcmliZWQgcmF0aGVyIGdlbmVyaWNhbGx5IChhcyBj
YW4gYmUgc2Vlbgo+PiBpbiBwYXRjaCA2IGZvciB0aGUgcnVudGltZSBwYXJhbWV0ZXJzKS4gTWF5
YmUgSSBzaG91bGQgYWRkIHRoZSBlbnRyaWVzCj4+IHdpdGggd2lsZGNhcmRzIHRoZXJlLgo+IAo+
IFRoYXQgd291bGQgYmUgbmljZS4KCk9rYXksIHdpbGwgZG8uCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
