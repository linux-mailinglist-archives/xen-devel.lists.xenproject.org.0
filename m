Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF611E460
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:13:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkjE-0004sA-3k; Fri, 13 Dec 2019 13:11:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifkjB-0004s5-VB
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:11:29 +0000
X-Inumbo-ID: 12c5603c-1daa-11ea-8ef8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12c5603c-1daa-11ea-8ef8-12813bfff9fa;
 Fri, 13 Dec 2019 13:11:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23B97AFA7;
 Fri, 13 Dec 2019 13:11:28 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
Date: Fri, 13 Dec 2019 14:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTM6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbnRhaW5pbmcgc3RpbGwg
aW4gZmxpZ2h0IERNQSB3YXMgaW50cm9kdWNlZCB0byB3b3JrIGFyb3VuZCBjZXJ0YWluCj4gZGV2
aWNlcyAvIHN5c3RlbXMgaGFuZ2luZyBoYXJkIHVwb24gaGl0dGluZyBhbiBJT01NVSBmYXVsdC4g
UGFzc2luZwo+IHRocm91Z2ggKHN1Y2gpIGRldmljZXMgKG9uIHN1Y2ggc3lzdGVtcykgaXMgaW5o
ZXJlbnRseSBpbnNlY3VyZSAoYXMKPiBndWVzdHMgY291bGQgZWFzaWx5IGFycmFuZ2UgZm9yIElP
TU1VIGZhdWx0cyB0byBvY2N1cikuIERlZmF1bHRpbmcgdG8KPiBhIG1vZGUgd2hlcmUgYWRtaW5z
IG1heSBub3QgZXZlbiBiZWNvbWUgYXdhcmUgb2YgaXNzdWVzIHdpdGggZGV2aWNlcyBjYW4KPiBi
ZSBjb25zaWRlcmVkIHVuZGVzaXJhYmxlLiBUaGVyZWZvcmUgY29udmVydCB0aGlzIG1vZGUgb2Yg
b3BlcmF0aW9uIHRvCj4gYW4gb3B0aW9uYWwgb25lLCBub3Qgb25lIGVuYWJsZWQgYnkgZGVmYXVs
dC4KPiAKPiBUaGlzIGludm9sdmVzIHJlc3VycmVjdGluZyBjb2RlIGNvbW1pdCBlYTM4ODY3ODMx
ZGEgKCJ4ODYgLyBpb21tdTogc2V0Cj4gdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlIHF1YXJhbnRp
bmUgZG9tYWluIikgZGlkIHJlbW92ZSwgaW4gYSBzbGlnaHRseQo+IGV4dGVuZGVkIGFuZCBhYnN0
cmFjdGVkIGZhc2hpb24uIEhlcmUsIGluc3RlYWQgb2YgcmVpbnRyb2R1Y2luZyBhIHByZXR0eQo+
IHBvaW50bGVzcyB1c2Ugb2YgImdvdG8iIGluIGRvbWFpbl9jb250ZXh0X3VubWFwKCksIGFuZCBp
bnN0ZWFkIG9mIG1ha2luZwo+IHRoZSBmdW5jdGlvbiAoYXQgbGVhc3QgdGVtcG9yYXJpbHkpIGlu
Y29uc2lzdGVudCwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkKPiBhbmQgcmVwbGFjZSB0aGUgb3RoZXIg
c2ltaWxhcmx5IHBvaW50bGVzcyAiZ290byIgYXMgd2VsbC4KPiAKPiBJbiBvcmRlciB0byBrZXkg
dGhlIHJlLWluc3RhdGVkIGJ5cGFzc2VzIG9mZiBvZiB0aGVyZSAobm90KSBiZWluZyBhIHJvb3QK
PiBwYWdlIHRhYmxlIHRoaXMgZnVydGhlciByZXF1aXJlcyBtb3ZpbmcgdGhlIGFsbG9jYXRlX2Rv
bWFpbl9yZXNvdXJjZXMoKQo+IGludm9jYXRpb24gZnJvbSByZWFzc2lnbl9kZXZpY2UoKSB0byBh
bWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpIChvcgo+IGVsc2UgcmVhc3NpZ25fZGV2aWNl
KCkgd291bGQgYWxsb2NhdGUgYSByb290IHBhZ2UgdGFibGUgYW55d2F5KTsgdGhpcyBpcwo+IGJl
bmlnbiB0byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUgbGF0dGVyIGZ1bmN0aW9uLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBBcyBm
YXIgYXMgNC4xMyBpcyBjb25jZXJuZWQsIEkgZ3Vlc3MgaWYgd2UgY2FuJ3QgY29tZSB0byBhbiBh
Z3JlZW1lbnQKPiBoZXJlLCB0aGUgb25seSBvdGhlciBvcHRpb24gaXMgdG8gcmV2ZXJ0IGVhMzg4
Njc4MzFkYSBmcm9tIHRoZSBicmFuY2gsCj4gZm9yIGhhdmluZyBiZWVuIGNvbW1pdHRlZCBwcmVt
YXR1cmVseSAoSSdtIG5vdCBzbyBtdWNoIHdvcnJpZWQgYWJvdXQgdGhlCj4gbWFzdGVyIGJyYW5j
aCwgd2hlcmUgd2UgaGF2ZSBhbXBsZSB0aW1lIHVudGlsIDQuMTQpLiBXaGF0IEkgc3VyZWx5IHdh
bnQKPiB0byBzZWUgdXMgYXZvaWQgaXMgYSBiYWNrIGFuZCBmb3J0aCBpbiBiZWhhdmlvciBvZiBy
ZWxlYXNlZCB2ZXJzaW9ucy4KPiAoTm90ZSB0aGF0IDQuMTIuMiBpcyBzaW1pbGFybHkgYmxvY2tl
ZCBvbiBhIGRlY2lzaW9uIGVpdGhlciB3YXkgaGVyZS4pCgpJJ20gbm90IHJlYWxseSBzdXJlIHdl
IHJlYWxseSBuZWVkIHRvIHJldmVydCBlYTM4ODY3ODMxZGEgYmVmb3JlIHRoZQo0LjEzIHJlbGVh
c2UuIEl0IG1pZ2h0IG5vdCBiZSBvcHRpbWFsLCBidXQgSSdtIHF1aXRlIHN1cmUgdGhlIG51bWJl
ciBvZgpjYXNlcyB3aGVyZSB0aGlzIGNvdWxkIGJlIGFuIGlzc3VlIGlzIHJhdGhlciBzbWFsbCBh
bHJlYWR5LCBhbmQgSSB0ZW5kCnRvIGFncmVlIHdpdGggUGF1bCB0aGF0IGFkbWlucyB3aG8gcmVh
bGx5IGNhcmUgd2lsbCBtb3JlIGxpa2VseSB3YW50IHRvCnNlbGVjdCB0aGUgb3B0aW9uIHdoZXJl
IHRoZSBzeXN0ZW0gd2lsbCAianVzdCB3b3JrIi4gSU1PIHRoZSAibm90aWNlYWJsZQpmYWlsdXJl
IiBpcyBzb21ldGhpbmcgd2hpY2ggd2lsbCBiZSBzZWxlY3RlZCBtb3N0bHkgYnkgZGV2ZWxvcGVy
cy4gQnV0CkknbSBub3QgYW4gZXhwZXJ0IGluIHRoYXQgYXJlYSwgc28gSSBkb24ndCB3YW50IHRv
IGluZmx1ZW5jZSB0aGUKZGVjaXNpb24gcmVnYXJkaW5nIHRoZSB0byBiZSBzZWxlY3RlZCBkZWZh
dWx0IHRvbyBtdWNoLgoKSW4gY2FzZSB3ZSBoYXZlIGEgc3VjY2Vzc2Z1bCBPU1N0ZXN0IHJ1biBz
b29uIEkgcGxhbm5lZCB0byBkbyB0aGUKcmVsZWFzZSB3aXRob3V0IHRoaXMgcGF0Y2guCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
