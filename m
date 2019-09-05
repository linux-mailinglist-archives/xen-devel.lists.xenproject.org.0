Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79724A9C62
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:57:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mb8-0004GF-B7; Thu, 05 Sep 2019 07:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5mb6-0004Fu-Kc
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:54:28 +0000
X-Inumbo-ID: 60bfba80-cfb2-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60bfba80-cfb2-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 07:54:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E3AEB6BE;
 Thu,  5 Sep 2019 07:54:24 +0000 (UTC)
To: Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <88eebf89-875c-6255-8cd4-ee8369a9fa56@suse.com>
Date: Thu, 5 Sep 2019 09:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, John Ji <john.ji@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMDk6NDEsIFJpY2ggUGVyc2F1ZCB3cm90ZToKPj4gT24gU2VwIDUsIDIwMTks
IGF0IDAzOjE5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pgo+Pj4g
T24gMDUuMDkuMjAxOSAwNDozMiwgUmljaCBQZXJzYXVkIHdyb3RlOgo+Pj4gQWdlbmRhIGl0ZW06
ICBEb21haW4gbmFtZSBzZXJ2aWNlIGZvciBuZXN0ZWQgdmlydCBhbmQgZGlzYWdncmVnYXRpb24K
Pj4+Cj4+PiAodGV4dCBiYXNlZCBvbiBkcmFmdCBieSBEYW5pZWwgU21pdGgsIHdobyB3aWxsIHNw
ZWFrIHRvIHRoaXMgYWdlbmRhIGl0ZW0pCj4+Pgo+Pj4gSWYgYSBmdXR1cmUsIG1pbmltYWwgIkww
IFhlbiIgaHlwZXJ2aXNvciBjYW4gYmUgb3B0aW1pemVkIGZvciBuZXN0ZWQgdmlydHVhbGl6YXRp
b24gaW4gZ3JlZW5maWVsZCBkZXBsb3ltZW50cyAoaS5lLiBubyByZXF1aXJlbWVudCB0byBtYWlu
dGFpbiBleGlzdGluZyBoeXBlcnZpc29yLWd1ZXN0IGludGVyZmFjZXMpLCB0aGVuIFBWIGRyaXZl
ciBtZWNoYW5pc21zIG90aGVyIHRoYW4gZ3JhbnRzLCBldmVudHMgYW5kIHhlbnN0b3JlIGNvdWxk
IGJlIGNvbnNpZGVyZWQuICBUaGlzIHdhcyBkaXNjdXNzZWQgaW4gYSBYZW4gU3VtbWl0IDIwMTkg
ZGVzaWduIHNlc3Npb246Cj4+PiBodHRwczovL2xpc3RzLmd0Lm5ldC94ZW4vZGV2ZWwvNTYwOTcz
Cj4+Pgo+Pj4gRm9yIHNvbWUgT3BlblhUIHVzZSBjYXNlcywgd2UgYXJlIGluIHRoZSBwcm9jZXNz
IG9mIGZ1cnRoZXIgZGlzYWdncmVnYXRpbmcgdGhlIHBsYXRmb3JtLiAgV2UgbmVlZCBhIG5hbWUg
c2VydmljZSB0byBlbmFibGUgdGhlIGRpc2FnZ3JlZ2F0ZWQgc2VydmljZSBkb21haW5zIHRvIGRp
c2NvdmVyIHRoZSBvdGhlciBzZXJ2aWNlIGRvbWFpbnMgd2l0aCB3aGljaCB0aGV5IG5lZWQgdG8g
Y29tbXVuaWNhdGUuICBYZW5zdG9yZSBpcyBub3Qgc3VmZmljaWVudCwgYXMgd2Ugd291bGQgbGlr
ZSB0byB1c2UgRmxhc2sgdG8gY29udHJvbCB0aGUgZGF0YSBmbG93LCBhcyB3ZWxsIGFzIGFwcGx5
aW5nIG1hbmRhdG9yeSBhY2Nlc3MgY29udHJvbCB0byBzZXJ2aWNlIGNhbGxzLgo+Pj4KPj4+IFdl
IGFyZSByZWFjaGluZyBvdXQgdG8gdGhlIFhlbiBDb21tdW5pdHkgdG8gZWxpY2l0IGlucHV0IG9u
IGFwcHJvYWNoZXMsIHN1Y2ggdGhhdCB3ZSBtaWdodCBiZSBhYmxlIHRvIHN1Ym1pdCBhbiB1cHN0
cmVhbSBSRkMgYmFzZWQgb24gb3VyIGVhcmx5IHdvcms6Cj4+Pgo+Pj4gLSBGb3IgYSBjb21tdW5p
Y2F0aW9uIGNoYW5uZWwgd2UgYXJlIGxvb2tpbmcgdG8gbGV2ZXJhZ2UgQXJnbywgd2hpY2ggaXMg
Y3VycmVudGx5IGluIGV4cGVyaW1lbnRhbCBzdGF0dXMuIEl0cyBwcmVkZWNlc3NvciAodjR2KSBp
cyBhbHJlYWR5IGJlaW5nIHVzZWQgaW4gYSBzaW1pbGFyIGZhc2hpb24gYnkgQnJvbWl1bSB1WGVu
IChodHRwczovL2dpdGh1Yi5jb20vb3Blbnh0L3V4ZW4pLCB3aGljaCBmdW5jdGlvbnMgd2VsbCBh
Y3Jvc3MgbmVzdGVkIGh5cGVydmlzb3JzLiAgdVhlbiB2NHYgaW5jbHVkZXMgYSBtZWNoYW5pc20g
dG8gY29udHJvbCBpbmZvcm1hdGlvbiBmbG93Lgo+Pj4KPj4+IC0gQW4gb3BlbiBxdWVzdGlvbiBp
cyBob3cgdG8gYWRkcmVzcyB0aGUgZG9tYWlucy4gWGVuIGRvbWFpbiBpZHMgYXJlIHJldXNlZCBh
bmQgaGF2ZSBubyBndWFyYW50ZWUgZm9yIHVuaXF1ZW5lc3MuICBVVUlEcyBhcmUgYXZhaWxhYmxl
IGFuZCBjYW4gcHJvdmlkZSBiZXR0ZXIgZ3VhcmFudGVlcyBmb3IgdW5pcXVlbmVzcy4gQW5vdGhl
ciBhcHByb2FjaCBpcyB0byB1c2UgdGhlIG5hbWUgc3RyaW5nIHdoaWNoIGFsbG93cyB0aGUgYWJp
bGl0eSBmb3IgcHVuY3R1YXRpb24gY2hhcmFjdGVycywgZWcuIDogb3IgLywgdG8gY3JlYXRlIG5h
bWVzcGFjZWQgbmFtZXMgZm9yIHRoZSBkb21haW5zLgo+Pgo+PiBGb3JnaXZlIG1lIGFza2luZywg
YnV0IHdoeSBpcyB0aGlzIHB1dCB1cCBhcyBhbiBhZ2VuZGEgaXRlbSBoZXJlPwo+PiBJTU8gdGhp
cyBpcyB0aGUga2luZCBvZiB0aGluZyB3aGVyZSB5b3Ugd291bGQgc2VuZCBhIHByb3Bvc2FsIGFu
ZAo+PiByZXF1ZXN0IGZlZWRiYWNrIGJ5IGVtYWlsIGZpcnN0LCBhbmQgcHV0IGl0IHVwIGFzIGFu
IGFnZW5kYSBpdGVtCj4+IGhlcmUgb25seSBpZiBpdCBnb3Qgc3RhbGxlZCB0aGVyZS4gKEFwb2xv
Z2llcyBpZiBJJ3ZlIG92ZXJsb29rZWQKPj4gc3VjaCBhIHN0YWxsZWQgdGhyZWFkLikKPiAKPiBJ
ZiBYZW4gY29tbXVuaXR5IGNhbGwgdG9waWNzIGFyZSBsaW1pdGVkIHRvIGVzY2FsYXRpb25zIG9m
IHhlbi1kZXZlbCB0aHJlYWRzLCB0aGVuIGEgbmV3IHRocmVhZCBjYW4gYmUgY3JlYXRlZCBmb3Ig
dGhpcyB0b3BpYy4gWGVuIGNvbW11bml0eSBjYWxscyBoYXZlIGFsc28gcHJvdmlkZWQgcmVhbC10
aW1lLCBpbnRlcmFjdGl2ZSBmZWVkYmFjayBvbiBjYW5kaWRhdGUgcHJvcG9zYWxzLCBhbG9uZyB3
aXRoIGd1aWRhbmNlIG9uIGFyZWFzIHdoaWNoIG5lZWQgZG9jdW1lbnRhdGlvbiBiZWZvcmUgYSBm
b3JtYWwgcHJvcG9zYWwgaXMgbWFkZSB0byB4ZW4tZGV2ZWwuICAgU3VjaCBhZ2VuZGEgaXRlbXMg
YXJlIHR5cGljYWxseSBjb3ZlcmVkIGFmdGVyIGFsbCBzZXJpZXMgYW5kIHByaW9yaXR5IHRvcGlj
cyBoYXZlIGJlZW4gYWRkcmVzc2VkLgoKSSBraW5kIG9mIGFncmVlIHdpdGggSmFuLCBidXQgSSBj
YW4gc2VlIHlvdXIgcG9pbnQuCgpNeSBhcHByb2FjaCB0byBhZGRyZXNzIHNvbWV0aGluZyBsaWtl
IHRoYXQgd291bGQgYmUgdG8gc2VuZCBhIHBhdGNoCmFkZGluZyB0aGUgaGlnaCBsZXZlbCBmZWF0
dXJlIGRvY3VtZW50IHRvIGUuZy4gZG9jcy9mZWF0dXJlcy4gVGhpcwpjYW4gYmUgYWNjb21wYW5p
ZWQgYnkgYSByb3VnaCBSRkMgaW1wbGVtZW50YXRpb24sIGJ1dCB0aGF0IHdvdWxkbid0CmJlIHJl
cXVpcmVkLiBCeSBzZW5kaW5nIGEgZmlyc3QgcGF0Y2ggeW91IHNob3cgc29tZSBjb21taXRtZW50
IHRvIHRoZQp0b3BpYywgYnV0IHlvdSBkb24ndCBoYXZlIHRvIGludmVzdCB0b28gbXVjaCB0aW1l
IGluIGNhc2UgdGhlIGlkZWEgaXMKcmVqZWN0ZWQuIEFuZCB3aXRoIGEgcGF0Y2ggeW91IGF1dG9t
YXRpY2FsbHkgcmVxdWVzdCBzb21lIGZlZWRiYWNrLgpUaGUgZmVhdHVyZSBkb2N1bWVudCB3b3Vs
ZCBvbmx5IGJlIGNvbW1pdHRlZCB3aXRoIHRoZSBjb2RlLCBvZiBjb3Vyc2UuCgoKSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
