Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A017C0E2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:50:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAEFk-0003mg-2J; Fri, 06 Mar 2020 14:47:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAEFi-0003mb-Hd
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:47:02 +0000
X-Inumbo-ID: 56843ae0-5fb9-11ea-a7fa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56843ae0-5fb9-11ea-a7fa-12813bfff9fa;
 Fri, 06 Mar 2020 14:47:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5FDCAF47;
 Fri,  6 Mar 2020 14:47:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
 <3c71c89f-28be-7752-b768-7d696fea0460@suse.com>
 <9621c0d8-ab29-b0ae-2cab-edfa711365d1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70fd4fbd-3d5b-56a9-9a92-db4251bf82c7@suse.com>
Date: Fri, 6 Mar 2020 15:47:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9621c0d8-ab29-b0ae-2cab-edfa711365d1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Backports to 4.13
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMy8yMDIw
IDE0OjExLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMDMuMjAyMCAxNDo1MiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IERlcGVuZGluZyBvbiB0aGUgdmlldyBvZiBvdGhlciBQViBzaGlt
IHVzYWJpbGl0eSBpc3N1ZXMsIDZkZDk1YjAyZWEyNwo+Pj4gYW5kIGY5ZGVlMWY5NDVlYiByZWdh
cmRpbmcgdnRzYyBtYWtlIGEgbGFyZ2UgZGlmZmVyZW5jZSBhbmQgc2hvdWxkIGJlCj4+PiBjb25z
aWRlcmVkLgo+PiBJJ3ZlIHF1ZXVlZCB0aGUgbGF0dGVyLCBidXQgdGhlIGZvcm1lciBkb2Vzbid0
IHJlYWxseSBsb29rIGxpa2UKPj4gYmFja3BvcnRpbmcgbWF0ZXJpYWwgdG8gbWUuCj4gCj4gSXQg
aXMgYSBmdW5jdGlvbmFsIHByZXJlcXVpc2l0ZS7CoCBUaGUgc3RhdHMgaW4gdGhlIGZvcm1lciBh
cmUgcHJvdGVjdGVkCj4gYnkgdGhlIGxvY2sgd2hpY2ggaXMgcmVtb3ZlZCBieSB0aGUgbGF0dGVy
LgoKTm90IHJlYWxseSwgbm8gLSB0aGUgc2FtZSBzdGF0cyBhbHNvIGdldCB1cGRhdGUgd2l0aG91
dCB0aGF0IGxvY2sKaW4gX2h2bV9yZHRzY19pbnRlcmNlcHQoKS4gUGx1cyBpbiB5b3VyIHBhdGNo
IGRlc2NyaXB0aW9uIHlvdQphbHNvIHN0YXRlIHRoaXM6ICIoY3VycmVudGx5IHRoZXkgbGVmdCB1
bnByb3RlY3RlZCBmb3IgSFZNIGRvbWFpbnMpIi4KSXQncyBkZWJ1Z2dpbmcgb25seSBjb2RlIHJl
YWxseSwgd2hpY2ggSSBkb24ndCB0aGluayBkb2VzIG11Y2ggaGFybQp3aGVuIGxlZnQgaW4uCgo+
IEFuIGFsdGVybmF0aXZlIChpbiB0aGVvcnkpIHdvdWxkIGJlIHRvIGNoYW5nZSB0aGUgc3RhdHMg
dG8gYXRvbWljNjRfdCdzLAo+IGV4Y2VwdCB0aGF0IHdlIGRvbid0IGhhdmUgYW55IG9mIHRoYXQg
aW5mcmFzdHJ1Y3R1cmUuwqAgR2l2ZW4gdGhhdCB3ZQo+IGFscmVhZHkgY29uc2lkZXJlZCBkZWxl
dGluZyB0aG9zZSBzdGF0cyBzZXZlcmFsIHllYXJzIGFnbyAoZHVlIHRvIGJlaW5nCj4gb2YgZHVi
aW91cyB1c2UgdG8gYmVnaW4gd2l0aCksIEkgdG9sZCBJZ29yIG5vdCB0byB3YXN0ZSB0aW1lIHRy
eWluZyB0bwo+IGZpeCBpdCBkaWZmZXJlbnRseS4KCkkgY2FuIGNlcnRhaW5seSBzZWUgdGhpcyBh
cyBvbmUgdmFsaWQgd2F5IHRvIGFwcHJvYWNoIHRoaXMuCgo+Pj4gMTg4ZjQ3OWRlNGI3IGFuZCAw
MDVkZTQ1Yzg4N2UgYXJlIGJvdGggY29yZSBzY2hlZHVsaW5nIGJ1Z2ZpeGVzIGFuZAo+Pj4gc2hv
dWxkIGJlIGNvbnNpZGVyZWQsIGV2ZW4gaWYgdGhleSBhcmUgYSBsaXR0bGUgdG9vIGZyZXNoIHJp
Z2h0IGF0IHRoZQo+Pj4gbW9tZW50Lgo+PiAiRnJlc2huZXNzIiBpcyBub3QgYW4gaXNzdWUgaW1v
LiBUaGV5J3ZlIHBhc3NlZCB0aGUgcHVzaCBnYXRlIG9uCj4+IG1hc3RlciwgYW5kIEkgd291bGRu
J3QgZ2V0IGFyb3VuZCB0byBhcHBseSB0aGVtIHJpZ2h0IGF3YXkgYW55d2F5Lgo+PiBXaXRoIHRo
ZXNlIGl0J3MganVzdCB0aGUgdHlwaWNhbCBzaXR1YXRpb24gZm9yIGZlYXR1cmVzIHRoYXQgYXJl
Cj4+IHN0aWxsICJleHBlcmltZW50YWwiIG9yIGFsaWtlIC0gSSdtIG5ldmVyIHJlYWxseSBjZXJ0
YWluIHdoZXRoZXIKPj4gaXQncyBiZXR0ZXIgdG8gcHVsbCBpbiBzdWNoIGZpeGVzIChhbmQgaGF2
ZSBtb3JlIGNvZGUgY2h1cm4pIG9yCj4+IHRvIGxlYXZlIHRoZW0gb3V0LiBBbmQgZXhwbGljaXQg
cmVxdWVzdCBsaWtlIHRoaXMgb25lIG9mIHlvdXJzCj4+IGhlbHBzIHRha2UgYSBkZWNpc2lvbi4K
PiAKPiBJbiB0aGlzIGNhc2UsIHRoZXkgYXJlIGNvbmNyZXRlIGJ1Z2ZpeGVzIHdoaWNoIHdlcmUg
ZGlzY292ZXJlZCwgYW5kCj4gY29uZmlybWVkIGZpeGVkLCBieSBYZW5TZXJ2ZXJzIHRlc3Rpbmcg
b24gYSA0LjEzIGJhc2UuCj4gCj4gTXkgbWFpbiBwdXJwb3NlIGluIGhpZ2hsaWdodGluZyB0aGVt
IGlzIHNpbXBseSB0aGF0IHRoZXkgZG9uJ3QgZ2V0Cj4gbWlzc2VkIGZvciA0LjEzLjEuwqAgQWZ0
ZXIgYWxsLCB0aGVyZSBhcmUgc3RpbGwgb3RoZXIgYmxvY2tpbmcgYnVncyB3aXRoCj4gY29yZSBz
Y2hlZHVsaW5nIGV2ZW4gb24gc3RhZ2luZy4KClRvIGJlIGhvbmVzdCwgdGhlbSBnZXR0aW5nIG1p
c3NlZCB3b3VsZG4ndCBiZSBhIHByb2JsZW0gYXMgbG9uZyBhcwp3ZSBkb24ndCBtZWFuIHRvIG1v
dmUgY29yZSBzY2hlZHVsaW5nIG91dCBvZiBpdHMgZXhwZXJpbWVudGFsIHN0YXRlCmZvciA0LjEz
LjEuIEJhY2twb3J0aW5nIHN1Y2ggZml4ZXMgcmVhbGx5IGlzIG9wdGlvbmFsLCBhbmQgSSdkCmxp
a2VseSBzdG9wIGRvaW5nIHNvIGlmIHRoZSB2b2x1bWUgaW5jcmVhc2VkIG1lYW5pbmdmdWxseS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
