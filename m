Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C523417F51A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 11:33:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBcAT-0003KM-Um; Tue, 10 Mar 2020 10:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBcAS-0003KG-At
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 10:31:20 +0000
X-Inumbo-ID: 47a1356a-62ba-11ea-9fd2-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47a1356a-62ba-11ea-9fd2-bc764e2007e4;
 Tue, 10 Mar 2020 10:31:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01C75B066;
 Tue, 10 Mar 2020 10:31:19 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5DEC@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12464780-0ce3-0331-9f78-b026025607fb@suse.com>
Date: Tue, 10 Mar 2020 11:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5DEC@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwNjozMCwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDc6
MDkgUE0KPj4KPj4gQ29udGFpbmluZyBzdGlsbCBpbiBmbGlnaHQgRE1BIHdhcyBpbnRyb2R1Y2Vk
IHRvIHdvcmsgYXJvdW5kIGNlcnRhaW4KPj4gZGV2aWNlcyAvIHN5c3RlbXMgaGFuZ2luZyBoYXJk
IHVwb24gaGl0dGluZyBhICJub3QtcHJlc2VudCIgSU9NTVUgZmF1bHQuCj4+IFBhc3NpbmcgdGhy
b3VnaCAoc3VjaCkgZGV2aWNlcyAob24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGluc2Vj
dXJlCj4+IChhcyBndWVzdHMgY291bGQgZWFzaWx5IGFycmFuZ2UgZm9yIElPTU1VIGZhdWx0cyBv
ZiBhbnkga2luZCB0byBvY2N1cikuCj4+IERlZmF1bHRpbmcgdG8gYSBtb2RlIHdoZXJlIGFkbWlu
cyBtYXkgbm90IGV2ZW4gYmVjb21lIGF3YXJlIG9mIGlzc3Vlcwo+PiB3aXRoIGRldmljZXMgY2Fu
IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFibGUuIFRoZXJlZm9yZSBjb252ZXJ0IHRoaXMgbW9kZQo+
PiBvZiBvcGVyYXRpb24gdG8gYW4gb3B0aW9uYWwgb25lLCBub3Qgb25lIGVuYWJsZWQgYnkgZGVm
YXVsdC4KPiAKPiBIZXJlIGlzIGFub3RoZXIgdGhvdWdodC4gVGhlIHdob2xlIHBvaW50IG9mIHF1
YXJhbnRpbmUgaXMgdG8gY29udGFpbgo+IHRoZSBkZXZpY2UgYWZ0ZXIgaXQgaXMgZGVhc3NpZ25l
ZCBmcm9tIHVudHJ1c3RlZCBndWVzdC4KCkknZCBxdWVzdGlvbiB0aGUgInVudHJ1c3RlZCIgaGVy
ZS4gQXNzaWduaW5nIGRldmljZXMgdG8gdW50cnVzdGVkCmd1ZXN0cyBpcyBwcm9ibGVtYXRpYyBh
bnl3YXksIHVubGVzcyB5b3UncmUgdGhlIGRldmljZSBtYW51ZmFjdHVyZXIKYW5kIGRldmljZSBm
aXJtd2FyZSB3cml0ZXIsIGFuZCBoZW5jZSB5b3UgY2FuIGd1YXJhbnRlZSB0aGUgZGV2aWNlCnRv
IG5vdCBvZmZlciBhbnkgYmFja2Rvb3JzIG9yIGFsaWtlLiBUaGVyZWZvcmUgSSB2aWV3IHF1YXJh
bnRpbmluZwptb3JlIGFzIGEgcHJvdGVjdGlvbiBvZiB0aGUgaG9zdCBhZ2FpbnN0IGJhZCBkZXZp
Y2UgYmVoYXZpb3IsIGFuZApsZXNzIGFnYWluc3QgbWFsaWNpb3VzIGd1ZXN0IGJlaGF2aW9yICh3
aGlsZSB0aGUgZHJpdmVyIGluIHRoZQpndWVzdCBzdXJlbHkgaGFzIHNvbWUgaW5mbHVlbmNlLCBj
b25zaWRlciB0aGUgZ3Vlc3QgZ2V0dGluZyBjcmFzaGVkCmFuZCBldmVuIGEgd2VsbC1iZWhhdmVk
IGRyaXZlciBoZW5jZSBub3QgZ2V0dGluZyBhbnkgY2hhbmNlIHRvCnNpbGVuY2UgdGhlIGRldmlj
ZSkuCgpKYW4KCj4gSG93ZXZlciwgdGhlCj4gcGFzc3Rocm91Z2ggb2Ygc3VjaCBkZXZpY2UgaXMg
YWxyZWFkeSBpbnNlY3VyZSwgYXMgeW91IG1lbnRpb25lZC4gCj4gVGhlbiB3aHkgZG8gd2UgY2Fy
ZSBhYm91dCBtYWtpbmcgZGVhc3NpZ25tZW50IG9mIHN1Y2ggZGV2aWNlCj4gc2VjdXJlIHdpdGhv
dXQgZG9pbmcgYW55dGhpbmcgdG8gc2VjdXJlIGl0IHdoZW4gaXQgaXMgYXNzaWduZWQgYW5kIGJl
aW5nCj4gdXNlZCBieSB1bnRydXN0ZWQgZ3Vlc3Q/IEkgZmVlbCB0aGF0IG9uZSBzaG91bGQgc2lt
cGx5IHB1dCBzdWNoIGRldmljZQo+IG91dCBvZiB0aGUgcXVhcmFudGluZSBsaXN0IGluIHRoZSBm
aXJzdCBwbGFjZSwgaS5lLiBzZXQgcXVhcmFudGluZT1mYWxzZSBhbmQKPiB0aGVuIHVzZSB0b29s
IHRvIHF1YXJhbnRpbmUgYSB3aGl0ZWxpc3Qgb2YgZGV2aWNlcyBieSBza2lwcGluZyB0aGUgYmFk
IG9uZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
