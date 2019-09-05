Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5CBA9C9D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:09:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mmb-00061y-JQ; Thu, 05 Sep 2019 08:06:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5mma-00061t-Ko
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:06:20 +0000
X-Inumbo-ID: 0aa6f800-cfb4-11e9-abc1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aa6f800-cfb4-11e9-abc1-12813bfff9fa;
 Thu, 05 Sep 2019 08:06:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3650DAD05;
 Thu,  5 Sep 2019 08:06:18 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <fbee4b0d-6ca7-d2d8-4933-7602e4840d9c@suse.com>
 <EC6DDB1D-BAFF-4079-BBD9-837383A5E3A5@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <92a15d9c-31f4-6bd3-51fd-3499f98186b8@suse.com>
Date: Thu, 5 Sep 2019 10:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <EC6DDB1D-BAFF-4079-BBD9-837383A5E3A5@citrix.com>
Content-Language: de-DE
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
 MattSpencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Tamas KLengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 JanakarajanNatarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger PauMonne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTA6MDAsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g77u/T24gMDUvMDkv
MjAxOSwgMDg6NTAsICJKYW4gQmV1bGljaCIgPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiAK
PiAgICAgIE9uIDA1LjA5LjIwMTkgMDk6NDEsIFJpY2ggUGVyc2F1ZCB3cm90ZToKPiAgICAgID4g
SWYgWGVuIGNvbW11bml0eSBjYWxsIHRvcGljcyBhcmUgbGltaXRlZCB0byBlc2NhbGF0aW9ucyBv
ZiB4ZW4tZGV2ZWwgdGhyZWFkcywgdGhlbiBhIG5ldyB0aHJlYWQgY2FuIGJlIGNyZWF0ZWQgZm9y
IHRoaXMgdG9waWMuIFhlbiBjb21tdW5pdHkgY2FsbHMgaGF2ZSBhbHNvIHByb3ZpZGVkIHJlYWwt
dGltZSwgaW50ZXJhY3RpdmUgZmVlZGJhY2sgb24gY2FuZGlkYXRlIHByb3Bvc2FscywgYWxvbmcg
d2l0aCBndWlkYW5jZSBvbiBhcmVhcyB3aGljaCBuZWVkIGRvY3VtZW50YXRpb24gYmVmb3JlIGEg
Zm9ybWFsIHByb3Bvc2FsIGlzIG1hZGUgdG8geGVuLWRldmVsLiAgIFN1Y2ggYWdlbmRhIGl0ZW1z
IGFyZSB0eXBpY2FsbHkgY292ZXJlZCBhZnRlciBhbGwgc2VyaWVzIGFuZCBwcmlvcml0eSB0b3Bp
Y3MgaGF2ZSBiZWVuIGFkZHJlc3NlZC4KPiAgICAgIAo+ICAgICAgSSdsbCBjZXJ0YWlubHkgbGlz
dGVuIHRvIHdoYXQgb3RoZXJzIHRoaW5rLCBidXQgSSBoYXZlIHRvIGNvbmZlc3MgdGhhdAo+ICAg
ICAgb24gc3VjaCBwcmlvciBpbnN0YW5jZXMgSSB3YXMgYWxyZWFkeSBvbiB0aGUgZWRnZSBvZiBy
ZXF1ZXN0aW5nIHRoYXQKPiAgICAgIHRpbWUgbm90IGJlIHNwZW50IGluIHN1Y2ggYSB3YXkuIFBs
ZWFzZSByZWNhbGwgdGhhdCBjYWxscywgb3RoZXIgdGhhbgo+ICAgICAgbWFpbHMsIHRha2UgZXZl
cnlib2R5J3MgdGltZSwgYW5kIGV4YWN0bHkgYXQgdGhlIHNhbWUgdGltZS4gVGhlcmVmb3JlCj4g
ICAgICBteSBwZXJzb25hbCBvcGluaW9uIGlzIHRoYXQgdG9waWNzIG9uIGNhbGxzIHNob3VsZCBi
ZSBsaW1pdGVkIHRvIGl0ZW1zCj4gICAgICB3aGljaCBjYW5ub3QgYmUgcmVzb2x2ZWQgYnkgb3Ro
ZXIgbWVhbnMsIG9yIHdoaWNoIGFyZSBjZXJ0YWluIHRvIG5lZWQKPiAgICAgIChhbG1vc3QpIGV2
ZXJ5Ym9keSdzIGF0dGVudGlvbiByaWdodCBhd2F5Lgo+ICAgICAgCj4gSSBkaXNhZ3JlZSB3aXRo
IHlvdSBvbiB0aGlzIG9uZS4KPiAKPiBTbyB5ZXMsIGl0IGlzIHRydWUgdGhhdCBhIGNhbGwgY29z
dHMgZXZlcnlvbmUgdGltZS4gQnV0IGl0J3MgYSBmaXhlZCBjb3N0IG9uY2UgcGVyIG1vbnRoCj4g
KiAgU29tZXRoaW5nIGV4cGVyaW1lbnRhbCBjb3VsZCBiZSBwb3N0ZWQgb24gdGhlIGxpc3QgYW5k
IGl0IG1heSB0YWtlIGV2ZXJ5b25lIG1vcmUgdGltZSB0byByZWFkIGFuZCByZXNwb25kIHRoYW4g
YSA1IG1pbnV0ZSBlYXJseSBkaXNjdXNzaW9uIG9uIHRoZSBjYWxsCj4gKiBBbHNvLCBvZiBjb3Vy
c2UgZXZlcnlvbmUgaGFzIHRoZSBvcHRpb24gdG8gZHJvcCBvdXQgb3Igbm90IGF0dGVuZCBhIGNh
bGwgYmFzZWQgb24gdGhlIGFnZW5kYQo+ICogSWYgd2UgaGFkIG1vcmUgdXJnZW50IHN0dWZmIHRv
IGRpc2N1c3MgYWxsIHRoZSB0aW1lIGFuZCB3ZSB3b3VsZCBoYXZlIHRvIGRpc3BsYWNlIHVyZ2Vu
dCBkaXNjdXNzaW9ucyB0byBjb3ZlciBkaXNjdXNzaW9ucyB3aGljaCBjYW4gd2FpdCwgSSBtYXkg
YWdyZWUgd2l0aCB5b3UsIGJ1dCB0aGlzIGlzIG5vdCBjdXJyZW50bHkgdGhlIGNhc2UKPiAKPiBJ
IHdpbGwgbG9vayBhdCB0aGUgYWdlbmRhIHRob3VnaCBhbmQgcmUtc3RydWN0dXJlIGl0IGluIHN1
Y2ggYSB3YXkgdGhhdCB0aGlzIGlzIGNsZWFyCj4gCj4gSU1QT1JUQU5UOiBJIGhhZCBhIGZldyBh
ZGRpdGlvbnMgdG8gdGhlIGFnZW5kYSwgYnV0IGRvIG5vdCBrbm93IFdITyBhZGRlZCB0aGVzZS4g
SSBiZWxpZXZlIG9uZSB3YXMgSnVlcmdlbi4gV2hvIGFkZGVkIHRoZSBpdGVtcyByZWxhdGVkIHRv
IE1BIFlvdW5ncyBwYXRjaGVzPyBBbmQgaWYgeW91IGFkZCBzZXJpZXMgdG8gZGlzY3VzcyBjYW4g
eW91IHBsZWFzZSBhZGQgVVJMcyBvciBtZXNzYWdlIElEcwoKRG9uZS4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
