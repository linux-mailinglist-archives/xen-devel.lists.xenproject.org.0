Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC3A9BB2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:23:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5m3X-0000NL-JH; Thu, 05 Sep 2019 07:19:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5m3V-0000NG-MQ
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:19:45 +0000
X-Inumbo-ID: 88bf4910-cfad-11e9-abc0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88bf4910-cfad-11e9-abc0-12813bfff9fa;
 Thu, 05 Sep 2019 07:19:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B154AF1D;
 Thu,  5 Sep 2019 07:19:42 +0000 (UTC)
To: Rich Persaud <persaur@gmail.com>, Lars Kurth <lars.kurth@citrix.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
Date: Thu, 5 Sep 2019 09:19:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
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
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, openxt@googlegroups.com,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, james.mckenzie@bromium.com,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAwNDozMiwgUmljaCBQZXJzYXVkIHdyb3RlOgo+IEFnZW5kYSBpdGVtOiAg
RG9tYWluIG5hbWUgc2VydmljZSBmb3IgbmVzdGVkIHZpcnQgYW5kIGRpc2FnZ3JlZ2F0aW9uIAo+
IAo+ICh0ZXh0IGJhc2VkIG9uIGRyYWZ0IGJ5IERhbmllbCBTbWl0aCwgd2hvIHdpbGwgc3BlYWsg
dG8gdGhpcyBhZ2VuZGEgaXRlbSkKPiAKPiBJZiBhIGZ1dHVyZSwgbWluaW1hbCAiTDAgWGVuIiBo
eXBlcnZpc29yIGNhbiBiZSBvcHRpbWl6ZWQgZm9yIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBpbiBn
cmVlbmZpZWxkIGRlcGxveW1lbnRzIChpLmUuIG5vIHJlcXVpcmVtZW50IHRvIG1haW50YWluIGV4
aXN0aW5nIGh5cGVydmlzb3ItZ3Vlc3QgaW50ZXJmYWNlcyksIHRoZW4gUFYgZHJpdmVyIG1lY2hh
bmlzbXMgb3RoZXIgdGhhbiBncmFudHMsIGV2ZW50cyBhbmQgeGVuc3RvcmUgY291bGQgYmUgY29u
c2lkZXJlZC4gIFRoaXMgd2FzIGRpc2N1c3NlZCBpbiBhIFhlbiBTdW1taXQgMjAxOSBkZXNpZ24g
c2Vzc2lvbjoKPiBodHRwczovL2xpc3RzLmd0Lm5ldC94ZW4vZGV2ZWwvNTYwOTczCj4gCj4gRm9y
IHNvbWUgT3BlblhUIHVzZSBjYXNlcywgd2UgYXJlIGluIHRoZSBwcm9jZXNzIG9mIGZ1cnRoZXIg
ZGlzYWdncmVnYXRpbmcgdGhlIHBsYXRmb3JtLiAgV2UgbmVlZCBhIG5hbWUgc2VydmljZSB0byBl
bmFibGUgdGhlIGRpc2FnZ3JlZ2F0ZWQgc2VydmljZSBkb21haW5zIHRvIGRpc2NvdmVyIHRoZSBv
dGhlciBzZXJ2aWNlIGRvbWFpbnMgd2l0aCB3aGljaCB0aGV5IG5lZWQgdG8gY29tbXVuaWNhdGUu
ICBYZW5zdG9yZSBpcyBub3Qgc3VmZmljaWVudCwgYXMgd2Ugd291bGQgbGlrZSB0byB1c2UgRmxh
c2sgdG8gY29udHJvbCB0aGUgZGF0YSBmbG93LCBhcyB3ZWxsIGFzIGFwcGx5aW5nIG1hbmRhdG9y
eSBhY2Nlc3MgY29udHJvbCB0byBzZXJ2aWNlIGNhbGxzLiAKPiAKPiBXZSBhcmUgcmVhY2hpbmcg
b3V0IHRvIHRoZSBYZW4gQ29tbXVuaXR5IHRvIGVsaWNpdCBpbnB1dCBvbiBhcHByb2FjaGVzLCBz
dWNoIHRoYXQgd2UgbWlnaHQgYmUgYWJsZSB0byBzdWJtaXQgYW4gdXBzdHJlYW0gUkZDIGJhc2Vk
IG9uIG91ciBlYXJseSB3b3JrOgo+IAo+IC0gRm9yIGEgY29tbXVuaWNhdGlvbiBjaGFubmVsIHdl
IGFyZSBsb29raW5nIHRvIGxldmVyYWdlIEFyZ28sIHdoaWNoIGlzIGN1cnJlbnRseSBpbiBleHBl
cmltZW50YWwgc3RhdHVzLiBJdHMgcHJlZGVjZXNzb3IgKHY0dikgaXMgYWxyZWFkeSBiZWluZyB1
c2VkIGluIGEgc2ltaWxhciBmYXNoaW9uIGJ5IEJyb21pdW0gdVhlbiAoaHR0cHM6Ly9naXRodWIu
Y29tL29wZW54dC91eGVuKSwgd2hpY2ggZnVuY3Rpb25zIHdlbGwgYWNyb3NzIG5lc3RlZCBoeXBl
cnZpc29ycy4gIHVYZW4gdjR2IGluY2x1ZGVzIGEgbWVjaGFuaXNtIHRvIGNvbnRyb2wgaW5mb3Jt
YXRpb24gZmxvdy4KPiAKPiAtIEFuIG9wZW4gcXVlc3Rpb24gaXMgaG93IHRvIGFkZHJlc3MgdGhl
IGRvbWFpbnMuIFhlbiBkb21haW4gaWRzIGFyZSByZXVzZWQgYW5kIGhhdmUgbm8gZ3VhcmFudGVl
IGZvciB1bmlxdWVuZXNzLiAgVVVJRHMgYXJlIGF2YWlsYWJsZSBhbmQgY2FuIHByb3ZpZGUgYmV0
dGVyIGd1YXJhbnRlZXMgZm9yIHVuaXF1ZW5lc3MuIEFub3RoZXIgYXBwcm9hY2ggaXMgdG8gdXNl
IHRoZSBuYW1lIHN0cmluZyB3aGljaCBhbGxvd3MgdGhlIGFiaWxpdHkgZm9yIHB1bmN0dWF0aW9u
IGNoYXJhY3RlcnMsIGVnLiA6IG9yIC8sIHRvIGNyZWF0ZSBuYW1lc3BhY2VkIG5hbWVzIGZvciB0
aGUgZG9tYWlucy4KCkZvcmdpdmUgbWUgYXNraW5nLCBidXQgd2h5IGlzIHRoaXMgcHV0IHVwIGFz
IGFuIGFnZW5kYSBpdGVtIGhlcmU/CklNTyB0aGlzIGlzIHRoZSBraW5kIG9mIHRoaW5nIHdoZXJl
IHlvdSB3b3VsZCBzZW5kIGEgcHJvcG9zYWwgYW5kCnJlcXVlc3QgZmVlZGJhY2sgYnkgZW1haWwg
Zmlyc3QsIGFuZCBwdXQgaXQgdXAgYXMgYW4gYWdlbmRhIGl0ZW0KaGVyZSBvbmx5IGlmIGl0IGdv
dCBzdGFsbGVkIHRoZXJlLiAoQXBvbG9naWVzIGlmIEkndmUgb3Zlcmxvb2tlZApzdWNoIGEgc3Rh
bGxlZCB0aHJlYWQuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
