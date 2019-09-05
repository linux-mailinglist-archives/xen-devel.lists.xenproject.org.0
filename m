Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189DA9C41
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mXQ-000438-I1; Thu, 05 Sep 2019 07:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5mXP-000431-7I
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:50:39 +0000
X-Inumbo-ID: d9ca59ae-cfb1-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9ca59ae-cfb1-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 07:50:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D1C3B601;
 Thu,  5 Sep 2019 07:50:37 +0000 (UTC)
To: Rich Persaud <persaur@gmail.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbee4b0d-6ca7-d2d8-4933-7602e4840d9c@suse.com>
Date: Thu, 5 Sep 2019 09:50:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
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

T24gMDUuMDkuMjAxOSAwOTo0MSwgUmljaCBQZXJzYXVkIHdyb3RlOgo+IElmIFhlbiBjb21tdW5p
dHkgY2FsbCB0b3BpY3MgYXJlIGxpbWl0ZWQgdG8gZXNjYWxhdGlvbnMgb2YgeGVuLWRldmVsIHRo
cmVhZHMsIHRoZW4gYSBuZXcgdGhyZWFkIGNhbiBiZSBjcmVhdGVkIGZvciB0aGlzIHRvcGljLiBY
ZW4gY29tbXVuaXR5IGNhbGxzIGhhdmUgYWxzbyBwcm92aWRlZCByZWFsLXRpbWUsIGludGVyYWN0
aXZlIGZlZWRiYWNrIG9uIGNhbmRpZGF0ZSBwcm9wb3NhbHMsIGFsb25nIHdpdGggZ3VpZGFuY2Ug
b24gYXJlYXMgd2hpY2ggbmVlZCBkb2N1bWVudGF0aW9uIGJlZm9yZSBhIGZvcm1hbCBwcm9wb3Nh
bCBpcyBtYWRlIHRvIHhlbi1kZXZlbC4gICBTdWNoIGFnZW5kYSBpdGVtcyBhcmUgdHlwaWNhbGx5
IGNvdmVyZWQgYWZ0ZXIgYWxsIHNlcmllcyBhbmQgcHJpb3JpdHkgdG9waWNzIGhhdmUgYmVlbiBh
ZGRyZXNzZWQuCgpJJ2xsIGNlcnRhaW5seSBsaXN0ZW4gdG8gd2hhdCBvdGhlcnMgdGhpbmssIGJ1
dCBJIGhhdmUgdG8gY29uZmVzcyB0aGF0Cm9uIHN1Y2ggcHJpb3IgaW5zdGFuY2VzIEkgd2FzIGFs
cmVhZHkgb24gdGhlIGVkZ2Ugb2YgcmVxdWVzdGluZyB0aGF0CnRpbWUgbm90IGJlIHNwZW50IGlu
IHN1Y2ggYSB3YXkuIFBsZWFzZSByZWNhbGwgdGhhdCBjYWxscywgb3RoZXIgdGhhbgptYWlscywg
dGFrZSBldmVyeWJvZHkncyB0aW1lLCBhbmQgZXhhY3RseSBhdCB0aGUgc2FtZSB0aW1lLiBUaGVy
ZWZvcmUKbXkgcGVyc29uYWwgb3BpbmlvbiBpcyB0aGF0IHRvcGljcyBvbiBjYWxscyBzaG91bGQg
YmUgbGltaXRlZCB0byBpdGVtcwp3aGljaCBjYW5ub3QgYmUgcmVzb2x2ZWQgYnkgb3RoZXIgbWVh
bnMsIG9yIHdoaWNoIGFyZSBjZXJ0YWluIHRvIG5lZWQKKGFsbW9zdCkgZXZlcnlib2R5J3MgYXR0
ZW50aW9uIHJpZ2h0IGF3YXkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
