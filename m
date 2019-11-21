Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14981055DE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:43:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXoZk-0005sy-Kv; Thu, 21 Nov 2019 15:40:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXoZi-0005st-EH
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:40:54 +0000
X-Inumbo-ID: 4c6d65dc-0c75-11ea-a33b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c6d65dc-0c75-11ea-a33b-12813bfff9fa;
 Thu, 21 Nov 2019 15:40:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB11AB255;
 Thu, 21 Nov 2019 15:40:51 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49cd864c-8512-f772-8c94-30966ca3383f@suse.com>
Date: Thu, 21 Nov 2019 16:40:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNDozOSwgUmlzaGkgd3JvdGU6Cj4gVGhlIHJlYXNvbmluZyB0byBoYXZl
IEVBWCgweDA2aCkgZXhwb3NlZCB0byBEb20wIGlzIGZvciBUaGVybWFsIGFuZAo+IFBvd2VyIG1h
bmFnZW1lbnQuCgpJIHVuZGVyc3RhbmQgdGhpcy4KCj4gV2l0aG91dCBFQVgoMHgwNmgpIERvbTAg
aXMgdW5hYmxlIHRvIHNlbnNlIHByZXNlbmNlIG9mIENQVSBjb3JlCj4gdGVtcGVyYXR1cmUgb3Ig
ZG8gVGhlcm1hbCBtYW5hZ2VtZW50IC0gaW5jbHVkaW5nIGJ1dCBub3QgbGltaXRlZCB0bwo+IG9w
ZXJhdGluZyBGYW4gc3BlZWQuCgpCdXQgeW91IGRvbid0IHNlZW0gdG8gdW5kZXJzdGFuZCB0aGF0
IHRoaXMgaXMsIGZyb20gYSBsYXllcmluZwpwZXJzcGVjdGl2ZSwgbm90IERvbTAncyBqb2IuIChB
cyBwZXIgdGhlIG90aGVyIHJlcGx5IHNlbnQgYQptb21lbnQgYWdvLCBpdCBjYW4gYmUgbWFkZSB3
b3JrLCBidXQgaXQncyBub3QgYXMgc2ltcGxlIGFzIHlvdQphcHBlYXIgdG8gdGhpbmsuKSBJbiBw
cmluY2lwbGUgLSByZXBlYXRpbmcgdGhpcyBqdXN0IGFub3RoZXIKdGltZSAtIGl0J3MgWGVuJ3Mg
am9iIHRvIGhhbmRsZSB0aGlzLgoKPiBEb20wIGhhcyB0byByZWx5IG9uIG90aGVyIHBvc3NpYmxl
IHdheXMgc3VjaCBhcyBpcG1pIG9yIEJJT1Mgd2hpY2ggYXJlCj4gb3B0aW9uYWxseSBhdmFpbGFi
bGUuCj4gCj4gRnJvbSB0aGUgcGF0Y2ggZGVzY3JpcHRpb24KPiBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD03MmUwMzg0NTBkM2Q1ZGUxYTM5
ZjBjZmEyZDJiMGY5YjNkNDNjNmM2Cj4gaXQgc2VlbXMgdGhhdCB0aGUgY2hhbmdlIHdhcyBpbnRy
b2R1Y2VkIHRvIG5vdCBleHBvc2UgRUFYKDB4MDZoKSB0bwo+IHVucHJpdmlsZWdlZCBQViBndWVz
dHMgYnV0IG5vdGhpbmcgaXMgc2FpZCBmb3IgRG9tMCBpdHNlbGYuIEkgdGhpbmsKPiB5b3UgYWxy
ZWFkeSBtZW50aW9uZWQgdGhhdCB0aGUgZmxhZyBpcyBoaWQgZnJvbSBEb20wIGFzIHdlbGwKPiBp
bnRlbnRpb25hbGx5Lgo+IAo+IFNvIHVubGVzcyBoeXBlcnZpc29yIHdhbnRzIHRvIGRvIHRoZXJt
YWwgbWFuYWdlbWVudCBvZiB0aGUgQ1BVIGJvYXJkLAo+IGl0IHdvdWxkIGluaGliaXQgRG9tMCdz
IGFiaWxpdHkgdG8gZG8gdGhpcyBmdW5jdGlvbi4KPiAKPiBXaGF0IGlzIGFuIGFsdGVybmF0aXZl
IHdheSBmb3IgY29yZXRlbXAga2VybmVsIG1vZHVsZSB0byBkZXRlY3QKPiAiRFRIRVJNIiBwcm9j
ZXNzb3IgZmxhZyBhbmQvb3IgcHJvY2VlZCBmb3Igc2FmZSByZWFkaW5nIG9mIE1TUiB0byBkbwo+
IGZ1cnRoZXIgdGVtcGVyYXR1cmUgdmFsdWUgcmVhZHM/CgpJbnRyb2R1Y3Rpb24gb2YgYSBwcm9w
ZXIgaW50ZXJmYWNlIGJldHdlZW4gWGVuIGFuZCBEb20wIGJ5IHdoaWNoClhlbiBiZWNvbWVzIGF3
YXJlIG9mIHRoaXMgcGFydCBvZiBDUFUgbWFuYWdlbWVudCBnZXR0aW5nIGRlbGVnYXRlZAp0byBE
b20wLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
