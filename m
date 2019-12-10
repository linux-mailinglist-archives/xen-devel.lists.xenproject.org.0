Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AD118CEF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:47:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehfO-0002g0-Bp; Tue, 10 Dec 2019 15:43:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iehfN-0002fv-4a
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:43:13 +0000
X-Inumbo-ID: c5837d88-1b63-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5837d88-1b63-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 15:43:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E34CCB2C4;
 Tue, 10 Dec 2019 15:43:10 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>, Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-2-liuwe@microsoft.com>
 <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
 <cbb42ea2e12a4731873ae74ed0668a3c@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66f2460e-8cb5-1866-32f1-6538092cb866@suse.com>
Date: Tue, 10 Dec 2019 16:43:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cbb42ea2e12a4731873ae74ed0668a3c@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxNjozNywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDEw
IERlY2VtYmVyIDIwMTkgMTU6MzQKPj4gVG86IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+IENjOiBX
ZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+
OyBBbmRyZXcKPj4gQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgTWljaGFlbCBL
ZWxsZXkKPj4gPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8
eGVuLQo+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIGZv
ci1uZXh0IDEvN10geDg2OiBpbXBvcnQgaHlwZXJ2LXRsZnMuaAo+PiBmcm9tIExpbnV4Cj4+Cj4+
IE9uIDI1LjEwLjIwMTkgMTE6MTYsIFdlaSBMaXUgd3JvdGU6Cj4+PiBUYWtlbiBmcm9tIExpbnV4
IGNvbW1pdCBiMmQ4YjE2N2UxNWJiNWVjMjY5MWQxMTE5YzAyNTYzMGEyNDdmNjQ5Lgo+Pj4KPj4+
IFRoaXMgaXMgYSBwcmlzdGluZSBjb3B5IGZyb20gTGludXguIEl0IGlzIG5vdCB1c2VkIHlldCBh
bmQgcHJvYmFibHkKPj4+IGRvZXNuJ3QgY29tcGlsZS4gQ2hhbmdlcyB0byBtYWtlIGl0IHdvcmsg
d2lsbCBjb21lIGxhdGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+Cj4+Cj4+IFRoaXMgY29taW5nIGZyb20gTGludXggYW5kIGFzc3VtaW5nIGF0
IGxlYXN0IGEgZmFpciBwYXJ0IG9mIGl0IGlzCj4+IGdvaW5nIHRvIGJlIHVzZWQsIGluIHByaW5j
aXBsZQo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBI
b3dldmVyLCB0aGVyZSBhcmUgbWFueSBzZWVtaW5nbHkgdW5uZWNlc3NhcnkgdXNlcyBvZiBfX3Bh
Y2tlZAo+PiBoZXJlLCB3aGljaCBJJ2QgcmF0aGVyIG5vdCBzZWUgZ28gaW4gYXQgYWxsIChpLmUu
IG5vdCBiZSBkcm9wcGVkCj4+IGxhdGVyIG9uLCBhbmQgdGhlbiBwb3RlbnRpYWxseSBtaXNzaW5n
IHNvbWUpLiBJIGZpbmQgLi4uCj4+Cj4+PiArdHlwZWRlZiBzdHJ1Y3QgX0hWX1JFRkVSRU5DRV9U
U0NfUEFHRSB7Cj4+PiArCV9fdTMyIHRzY19zZXF1ZW5jZTsKPj4+ICsJX191MzIgcmVzMTsKPj4+
ICsJX191NjQgdHNjX3NjYWxlOwo+Pj4gKwlfX3M2NCB0c2Nfb2Zmc2V0Owo+Pj4gK30gIF9fcGFj
a2VkIEhWX1JFRkVSRU5DRV9UU0NfUEFHRSwgKlBIVl9SRUZFUkVOQ0VfVFNDX1BBR0U7Cj4+Cj4g
Cj4gWW91IHJlYWxpc2UgdGhlcmUncyBhIGRlZmluaXRpb24gb2YgdGhpcyBpbiB0aGUgdmlyaWRp
YW4gY29kZSBhbHJlYWR5LCByaWdodD8KCkl0IGxvb2tlZCBmYW1pbGlhciwgYnV0IGl0IGRpZG4n
dCBvY2N1ciB0byBtZSB0byBwb2ludCB0aGlzIG91dC4KWWVzLCB0aGVyZSBsb29rcyB0byBiZSBy
b29tIGZvciBkZWR1cGxpY2F0aW9uLi4uCgpBY3R1YWxseSwgV2VpLCBvbmUgbW9yZSB0aGluZyBJ
IHdhcyBjdXJpb3VzIGFib3V0IC0gd2hhdCBpcyAidGxmcyIKYW4gYWNyb255bSBvZj8KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
