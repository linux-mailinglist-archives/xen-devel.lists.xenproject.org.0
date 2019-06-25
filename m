Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CB558A6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 22:21:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfrt7-000602-8I; Tue, 25 Jun 2019 20:17:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HbZU=UY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfrt5-0005zx-96
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 20:17:55 +0000
X-Inumbo-ID: 4e222160-9786-11e9-9100-f754e449dd11
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4e222160-9786-11e9-9100-f754e449dd11;
 Tue, 25 Jun 2019 20:17:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BC4B2B;
 Tue, 25 Jun 2019 13:17:50 -0700 (PDT)
Received: from [10.37.8.215] (unknown [10.37.8.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4924D3F71E;
 Tue, 25 Jun 2019 13:17:44 -0700 (PDT)
To: Rich Persaud <persaur@gmail.com>, Lars Kurth <lars.kurth@citrix.com>
References: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
 <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
 <FDD05784-1F9E-4654-8E79-3D432C571D4C@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8eff1449-3e65-ed1c-6359-342a3df34d62@arm.com>
Date: Tue, 25 Jun 2019 21:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <FDD05784-1F9E-4654-8E79-3D432C571D4C@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen Project Community Call June 27th (instead of
 July 4th): @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian Woods <brian.woods@amd.com>, "Natarajan, Janakarajan" <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUmljaCwKCk9uIDYvMjUvMTkgODozOCBQTSwgUmljaCBQZXJzYXVkIHdyb3RlOgo+PiBPbiBK
dW4gMjUsIDIwMTksIGF0IDEyOjM2LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+
IHdyb3RlOgo+Pgo+PiBIaSBhbGw6Cj4+IHBsZWFzZSBhZGQgeW91ciBhZ2VuZGEgaXRlbXMuIEkg
aGFkIG9ubHkgT05FIHNlcmllcyB3aGljaCB3YXMgaGlnaGxpZ2h0ZWQgYXMgbmVlZGluZyBhdHRl
bnRpb24gZnJvbSBvdGhlcnMuIElzIHRoaXMgc2VyaW91c2x5IHRoZSBvbmx5IG9uZT8KPiAKPiBQ
cm9wb3NlZCBhZ2VuZGEgaXRlbTogaW4gdGhlIGFic2VuY2Ugb2YgSmlyYSB0aWNrZXRzLCB3b3Vs
ZCBpdCBiZSB1c2VmdWwgdG8gaGF2ZSBhIGxpc3QgKGUuZy4gZ2VuZXJhdGVkIGJ5IGEgc2NyaXB0
KSB3aXRoIHRoZSBsaWZlY3ljbGUgc3RhdHVzIG9mIGFsbCBvdXRzdGFuZGluZyBwYXRjaCBzZXJp
ZXMsIGUuZy4KPiAKPiBNRVRBREFUQQo+IAo+IC0gYnVnIGZpeCAvIGltcHJvdmVtZW50IC8gcmVm
YWN0b3IgLyBjbGVhbnVwIC8gbmV3IGZlYXR1cmUKPiAtIGltcGFjdGVkIFhlbiBzdWJzeXN0ZW1z
L2NvbXBvbmVudHMvZmVhdHVyZXMKPiAtIHRhcmdldGVkIHZlcnNpb24gb2YgWGVuCj4gLSBjb250
cmlidXRpbmcgcGVyc29uL29yZwo+IC0gcmVsZXZhbmNlIG9mIHBhdGNoIHNlcmllcyB0byB0aGUg
Z29hbHMgc2V0IGJ5IFJNIGZvciB0aGUgbmV4dCBYZW4gcmVsZWFzZQo+IC0gcmVsYXRlZCBwYXRj
aCBzZXJpZXMgKHdpdGggYmVsb3cgc3RhdHVzIGluZm8pCj4gCj4gU1RBVFVTOgo+IAo+IC0gcGF0
Y2ggc2VyaWVzIHZlcnNpb24KPiAtIGRhdGUgb2YgcGF0Y2ggc2VyaWVzIHYxCj4gLSBubyByZXNw
b25zZXMgcmVjZWl2ZWQgKyBwaW5nIGNvdW50ICsgZGF5cyBzaW5jZSBzdWJtaXNzaW9uICsgZGF5
cyBzaW5jZSBwaW5nCj4gLSByZXZpZXdlZCB3aXRoIG9iamVjdGlvbnMKPiAtIHJldmlld2VkIHdp
dGhvdXQgb2JqZWN0aW9ucywgYXdhaXRpbmcgYWNrCj4gLSBhY2tlZCwgYXdhaXRpbmcgbWVyZ2UK
PiAKPiAgRnJvbSBzdWNoIGEgc3VtbWFyeSwgcGF0Y2ggc2VyaWVzIGNvdWxkIGJlIHByaW9yaXRp
emVkIGZvciByZXZpZXcvdHJpYWdlIGluIHRoZSBjb21tdW5pdHkgY2FsbCwgYmFzZWQgb24gdW5p
Zm9ybSBjcml0ZXJpYSBhbmQgcHJvamVjdC13aWRlIGNvbnRleHQuCgpXaGlsZSBJIHRoaW5rIHJh
aXNpbmcgYXdhcmVuZXNzIG9mIHRoZSBzdHVjayBzZXJpZXMgaXMgYSBnb29kIGlkZWEuIEkgCnN0
aWxsIGhhdmUgc29tZSBjb25jZXJuIHJlZ2FyZGluZyB0aGUgcHJpb3JpdGl6YXRpb24uIFdobyBp
cyBnb2luZyB0byAKY29uc3VtZSB0aGUgcmVzdWx0IG9mIHRoZSBkaXNjdXNzaW9uPyBJcyBpdCB0
aGUgbWFpbnRhaW5lcnM/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
