Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31CA1A4E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 14:42:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Ji4-0008Lj-15; Thu, 29 Aug 2019 12:39:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8TN=WZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i3Ji2-0008Le-TB
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:39:26 +0000
X-Inumbo-ID: 085537ba-ca5a-11e9-ae65-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 085537ba-ca5a-11e9-ae65-12813bfff9fa;
 Thu, 29 Aug 2019 12:39:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50FC2AD31;
 Thu, 29 Aug 2019 12:39:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <f2e373ae-a327-bcdc-1c5c-b3351ae1ff4f@suse.com>
 <e163fa38-6a06-c422-4c23-7d5385590025@citrix.com>
 <8191ed37-760d-748a-c7c7-762dd331fa7c@suse.com>
 <8182fd34-c41a-46d5-d0db-51799c2d5052@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <07043e62-01bd-be2a-05a6-db8aacdea7d4@suse.com>
Date: Thu, 29 Aug 2019 14:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8182fd34-c41a-46d5-d0db-51799c2d5052@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: clear RDRAND CPUID bit on AMD family
 15h/16h
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMTkgMTQ6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjA4LjIwMTkgMTQ6
MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI5LjA4LjE5IDEzOjQyLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4gT24gMjkvMDgvMjAxOSAxMDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gSW5zcGlyZWQgYnkgTGludXggY29tbWl0IGM0OWEwYTgwMTM3YzdjYTdkNmNlZDRjODEyYzll
MDdhOTQ5ZjZmMjQ6Cj4+Pj4KPj4+PiAgICAgICBUaGVyZSBoYXZlIGJlZW4gcmVwb3J0cyBvZiBS
RFJBTkQgaXNzdWVzIGFmdGVyIHJlc3VtaW5nIGZyb20gc3VzcGVuZCBvbgo+Pj4+ICAgICAgIHNv
bWUgQU1EIGZhbWlseSAxNWggYW5kIGZhbWlseSAxNmggc3lzdGVtcy4gVGhpcyBpc3N1ZSBzdGVt
cyBmcm9tIGEgQklPUwo+Pj4+ICAgICAgIG5vdCBwZXJmb3JtaW5nIHRoZSBwcm9wZXIgc3RlcHMg
ZHVyaW5nIHJlc3VtZSB0byBlbnN1cmUgUkRSQU5EIGNvbnRpbnVlcwo+Pj4+ICAgICAgIHRvIGZ1
bmN0aW9uIHByb3Blcmx5Lgo+Pj4+Cj4+Pj4gICAgICAgVXBkYXRlIHRoZSBDUFUgaW5pdGlhbGl6
YXRpb24gdG8gY2xlYXIgdGhlIFJEUkFORCBDUFVJRCBiaXQgZm9yIGFueSBmYW1pbHkKPj4+PiAg
ICAgICAxNWggYW5kIDE2aCBwcm9jZXNzb3IgdGhhdCBzdXBwb3J0cyBSRFJBTkQuIElmIGl0IGlz
IGtub3duIHRoYXQgdGhlIGZhbWlseQo+Pj4+ICAgICAgIDE1aCBvciBmYW1pbHkgMTZoIHN5c3Rl
bSBkb2VzIG5vdCBoYXZlIGFuIFJEUkFORCByZXN1bWUgaXNzdWUgb3IgdGhhdCB0aGUKPj4+PiAg
ICAgICBzeXN0ZW0gd2lsbCBub3QgYmUgcGxhY2VkIGluIHN1c3BlbmQsIHRoZSAiY3B1aWQ9cmRy
YW5kIiBrZXJuZWwgcGFyYW1ldGVyCj4+Pj4gICAgICAgY2FuIGJlIHVzZWQgdG8gc3RvcCB0aGUg
Y2xlYXJpbmcgb2YgdGhlIFJEUkFORCBDUFVJRCBiaXQuCj4+Pj4KPj4+PiAgICAgICBOb3RlLCB0
aGF0IGNsZWFyaW5nIHRoZSBSRFJBTkQgQ1BVSUQgYml0IGRvZXMgbm90IHByZXZlbnQgYSBwcm9j
ZXNzb3IKPj4+PiAgICAgICB0aGF0IG5vcm1hbGx5IHN1cHBvcnRzIHRoZSBSRFJBTkQgaW5zdHJ1
Y3Rpb24gZnJvbSBleGVjdXRpbmcgaXQuIFNvIGFueQo+Pj4+ICAgICAgIGNvZGUgdGhhdCBkZXRl
cm1pbmVkIHRoZSBzdXBwb3J0IGJhc2VkIG9uIGZhbWlseSBhbmQgbW9kZWwgd29uJ3QgI1VELgo+
Pgo+PiBZZWFoLCBidXQgaXQgd2lsbCBubyBsb25nZXIgc2VlIHJhbmRvbSBudW1iZXJzIGFmdGVy
IHJlc3VtZS4KPiAKPiBUaGF0J3MgdGhlIGltcGxpY2F0aW9uOyBub3RlIHRoYXQgSSd2ZSB0YWtl
biB0aGUgdGV4dCBmcm9tIHRoZQo+IExpbnV4IGNvbW1pdC4KPiAKPj4+PiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gLS0tCj4+Pj4gU2xpZ2h0bHkg
UkZDLCBpbiBwYXJ0aWN1bGFyIGJlY2F1c2Ugb2YgdGhlIGNoYW5nZSB0byBwYXJzZV94ZW5fY3B1
aWQoKToKPj4+PiBBbHRlcm5hdGl2ZSBhcHByb2FjaCBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZS4K
Pj4+Cj4+PiBUaGlzIGlzc3VlIHdhcyBvbiBteSByYWRhciwgYnV0IEkgaGFkbid0IGdvdCBhcm91
bmQgdG8gc3RhcnRpbmcgYSBwYXRjaCB5ZXQuCj4+Pgo+Pj4gSSB3YXMgd29uZGVyaW5nIGlmIHdl
IGNvdWxkIHBlcmhhcHMgZGVmYXVsdCBpdCB0byB3aGV0aGVyIFMzIHdhcwo+Pj4gYXZhaWxhYmxl
LCBidXQgbG9va2luZyBhdCB0aGUgY29kZSB3aGljaCBwcmludHMgIkFDUEkgc2xlZXAgbW9kZXM6
IFMzIiwKPj4+IGl0IGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHJlbGF0ZWQgdG8gYW55IHJlYWwgQUNQ
SSBpbmZvcm1hdGlvbi4KPj4KPj4gV291bGRuJ3QgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGluaGli
aXQgc3VzcGVuZC9yZXN1bWUgaW5zdGVhZD8KPiAKPiBUaGF0J3MgYW4gYWx0ZXJuYXRpdmUgb3B0
aW9uLiBCdXQgaWYgYW55dGhpbmcgSSdkIHNlZSB1cyBwcm92aWRpbmcKPiBib3RoLCBub3QgdGhl
IG9uZSB5b3Ugc3VnZ2VzdCBpbnN0ZWFkIG9mIHdoYXQgdGhlIHBhdGNoIGhlcmUgZG9lcy4KPiAK
Pj4gSSdtIHF1aXRlIHN1cmUgYSBtYWNoaW5lIHJ1bm5pbmcgWGVuIGlzIHZlcnkgcmFyZWx5IHB1
dCB0byBTMy4KPiAKPiBJJ20gbm90IGF0IGFsbCBzdXJlIGFib3V0IHRoaXMuCgpTdXNwZW5kL3Jl
c3VtZSBpbiBYZW4gd2FzIGJyb2tlbiBmb3IgbW9yZSB0aGFuIDMgbW9udGhzIGluIHRoZSBsYXRl
IDQuMTIKZGV2ZWxvcG1lbnQgcGhhc2UgYW5kIG5vYm9keSBub3RpY2VkIGl0LiBPbmx5IHdoZW4g
SSBzdGFydGVkIG15IGNvcmUKc2NoZWR1bGluZyBzZXJpZXMgSSBjYW1lIGFjcm9zcyB0aGUgaXNz
dWUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
