Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9546E8F75
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 19:43:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPWRA-0006ct-W4; Tue, 29 Oct 2019 18:41:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e2I5=YW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iPWR9-0006cX-26
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 18:41:47 +0000
X-Inumbo-ID: c221e93a-fa7b-11e9-beca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c221e93a-fa7b-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 18:41:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1A8320874;
 Tue, 29 Oct 2019 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572374505;
 bh=d1AWEWsgmhlCAMBVRnbOB0X78r+m5+gYRxB5UAeuxp0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ce3agdciamr1vurXsJ82ZMAT3HYUZMtbPvcU0sEDsOtKC3HudzXD+8isSjpp1A09N
 jr4ZkYbY+ZXdX/fUU+uiWbO2brkx5WSncJflVv+azEvxUdEPhUsXK2ZPbtD/WV0qdY
 V6sZTcxuXSbP65KC0+UH40XyLF/VfnbnM1hK3jLo=
Date: Tue, 29 Oct 2019 11:41:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
In-Reply-To: <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
Message-ID: <alpine.DEB.2.21.1910291141100.29150@sstabellini-ThinkPad-T480s>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
 <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
 <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyOSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI4LzEwLzIwMTkg
MjE6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIE1vbiwgMjggT2N0IDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+PiBIaSwKPiA+Pgo+ID4+IE9uIDI1LzEwLzIwMTkgMTE6
MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+PiBBbGwsCj4gPj4+Cj4gPj4+IHRoZSA0LjExLjMg
c3RhYmxlIHJlbGVhc2UgaXMgZHVlLiBJIGludGVuZCB0byB3YWl0IGZvciB0aGUgWFNBIGZpeGVz
Cj4gPj4+IGdvaW5nIHB1YmxpYyBvbiB0aGUgMzFzdCwgYnV0IG5vdCAobXVjaCkgbG9uZ2VyLiBQ
bGVhc2UgcG9pbnQgb3V0Cj4gPj4+IGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMgdGhhdCB5b3UgZmlu
ZCBtaXNzaW5nIGZyb20gdGhlIHJlc3BlY3RpdmUKPiA+Pj4gc3RhYmxlIHRyZWVzLiBJIGhhdmUg
dGhyZWUgb25lcyBxdWV1ZWQgd2hpY2ggaGF2ZW4ndCBwYXNzZWQgdGhlIHB1c2gKPiA+Pj4gZ2F0
ZSB0byB0aGUgbWFzdGVyIGJyYW5jaCB5ZXQ6Cj4gPj4+Cj4gPj4+IDkyNTdjMjE4ZTUJeDg2L3Z2
bXg6IEZpeCB0aGUgdXNlIG9mIFJEVFNDUCB3aGVuIGl0IGlzIGludGVyY2VwdGVkIGF0IEwwCj4g
Pj4+IDdlZWU5YzE2ZDYJeDg2L3RzYzogdXBkYXRlIHZjcHUgdGltZSBpbmZvIG9uIGd1ZXN0IFRT
QyBhZGp1c3RtZW50cwo+ID4+PiA5NjMzOTI5ODI0CXg4NjogZml4IG9mZi1ieS1vbmUgaW4gaXNf
eGVuX2ZpeGVkX21mbigpCj4gPj4KPiA+PiBXZSBkb24ndCBzZWVtIHRvIGhhdmUgYmFja3BvcnRl
ZCBwYXRjaGVzIGZvciBxdWl0ZSBhIHdoaWxlIG9uIEFybS4gU29tZSBvZiBteQo+ID4+IHBhdGNo
ZXMgaGF2ZSBiZWVuIG1hcmtlZCBhcyB0byBiZSBiYWNrcG9ydGVkIGZyb20gdGhlIGJlZ2lubmlu
ZyBbMV0uIEkgYW0KPiA+PiBzcGVjaWZpY2FsbHkgdGhpbmtpbmcgdG86Cj4gPj4gCQo+ID4+IGUw
NDgxOGI0NmQgeGVuL2FybTogdHJhcHM6IEF2b2lkIHVzaW5nIEJVR19PTigpIHRvIGNoZWNrIGd1
ZXN0IHN0YXRlIGluCj4gPj4gYWR2YW5jZV9wYygpCj4gCj4gVXJnaCwgSSBnYXZlIHRoZSBjb3Jy
ZWN0IHRpdGxlIGJ1dCB0aGUgd3JvbmcgY29tbWl0IHNoYTEuIEl0IHNob3VsZCBiZSAKPiAKPiA3
MjYxNWYyZTZiOThlODYxYzA4YWJiMWQyYjE5NDEyNjAxM2Q1NGZlCj4gCj4gPiAKPiA+IEkgaGF2
ZSBlMDQ4MThiNDZkLCBwbHVzIHRoZSBmb2xsb3dpbmcgbWFya2VkIGZvciBiYWNrcG9ydDoKPiA+
IAo+ID4gZTk4ZWRjY2I5NDRhODBkYjc4MmU1NTFmMzA5MDYyOGU2NmM3ZmI1MiB4ZW4vYXJtOiBT
Q1RMUl9FTDEgaXMgYSA2NC1iaXQgcmVnaXN0ZXIgb24gQXJtNjQKPiAKPiBUaGVyZSBhcmUgbW9y
ZSB0aGFuIHRoYXQgdG8gYmFja3BvcnQ6Cj4gCj4gMzBmNTA0N2IyYzRlNTc3NDM2YjUwNWJhNzYy
N2YzNGMzYmUwMjAxNCAgICB4ZW4vYXJtOiBnaWM6IE1ha2Ugc3VyZSB0aGUgbnVtYmVyIG9mIGlu
dGVycnVwdCBsaW5lcyBpcyB2YWxpZCBiZWZvcmUgdXNpbmcgaXQgIFs0LjExXQo+IDhhYTI3NjIz
NWI5M2VlYjRmODEwOTVjNjM4OTcwOTAwZTE5YjMxZTUgICAgeGVuL2FybTogaXJxOiBFbmQgY2xl
YW5seSBzcHVyaW91cyBpbnRlcnJ1cHQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBbNC4xMV0KPiBiNGRmNzNkZTQ5Mzk1NGM0NGYyNDBmNzg3NzljOWJkMzc4MmUxNTcyICAgIHhl
bi9hcm06IGdpYy12MjogZGVhY3RpdmF0ZSBpbnRlcnJ1cHRzIGR1cmluZyBpbml0aWFsaXphdGlv
biAgICAgICAgICAgICAgICAgICAgWzQuMTFdCj4gMDMyMmUwZGI1YjI5YTBkMWNlNGI0NTI4ODVl
MzQwMjNlM2E0YjAwZSAgICBhcm06IGdpYy12MzogZGVhY3RpdmF0ZSBpbnRlcnJ1cHRzIGR1cmlu
ZyBpbml0aWFsaXphdGlvbiAgICAgICAgICAgICAgICAgICAgICAgIFs0LjExXQo+IAo+IDViYTFj
NWQwNjQxY2Y2MzA4NmIzMDU4ZTU0N2ZjZDI4YzNjNGEwMTEgICAgeGVuL2FybTogbWVtYWNjZXNz
OiBJbml0aWFsaXplIGNvcnJlY3RseSAqYWNjZXNzIGluIF9fcDJtX2dldF9tZW1fYWNjZXNzICAg
ICAgICBbNC4xMl0KPiAwN2U0NGIzZDFiZTMyZmEyMTY1YzIzNjdhZTNlZjljNmM4YjM5ZTFlICAg
IHhlbi9hcm06IEltcGxlbWVudCB3b3JrYXJvdW5kIGZvciBDb3J0ZXggQS01NyBhbmQgQ29ydGV4
IEE3MiBBVCBzcGVjdWxhdGUgICAgICAgWzQuMTJdCj4gCj4gMDhlMjA1OWZhY2Q3OGQ1ZmZhZjIw
NmJhMDZhYzIwMTdjNGFkZWVkNCAgICB4ZW4vYXJtOiBzZXR1cDogQ2FsY3VsYXRlIGNvcnJlY3Rs
eSB0aGUgc2l6ZSBvZiBYZW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFs0LjExK10KPiA4
ZGJhOWE4MWU3YzYyYjhhN2RiZTAyM2ZmZmVjZDJlMTZjYzIwNDg2ICAgIHhlbi9hcm06IERvbid0
IHVzZSBfZW5kIGluIGlzX3hlbl9maXhlZF9tZm4oKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWzQuMTErXQo+IDY3MTg3ODc3OTc0MWIzOGM1ZjIzNjNhZGNlZWY4ZGUyY2UwYjM5
NDUgICAgeGVuL2FybTogcDJtOiBGcmVlIHRoZSBwMm0gZW50cnkgYWZ0ZXIgZmx1c2hpbmcgdGhl
IElPTU1VIFRMQnMgICAgICAgICAgICAgICAgICBbNC4xMStdCj4gN2Y0MjE3Y2M2MDU3NDg2NmNi
OTBkNjdkOTc1MDIyOGM2Yjg2YzkxZSAgICB4ZW4vYXJtOiB2c21jOiBUaGUgZnVuY3Rpb24gaWRl
bnRpZmllciBpcyBhbHdheXMgMzItYml0ICAgICAgICAgICAgICAgICAgICAgICAgIFs0LjExK10K
PiA2MTJkNDc2ZTc0YTMxNGJlNTE0ZWU2YTk3NDRlZWE4ZGIwOWQzMmU1ICAgIHhlbi9hcm02NDog
Q29ycmVjdGx5IGNvbXB1dGUgdGhlIHZpcnR1YWwgYWRkcmVzcyBpbiBtYWRkcl90b192aXJ0KCkg
ICAgICAgICAgICAgWzQuMTErXQo+IGY1MTAyN2JlMDY4ODU0MGFhYWI2MTUxM2IwNmE4NjkzYTM3
ZTRjMDAgICAgeGVuL2FybTogZml4IG5yX3BkeHMgY2FsY3VsYXRpb24gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbNC4xMStdCj4gYTE4OWVmMDI3ZGJiN2Ez
YzBkZmU1NjYxMzdmMDVjMDZkNjY4NWZiOSAgICB4ZW4vYXJtOiBtbTogRmx1c2ggdGhlIFRMQnMg
ZXZlbiBpZiBhIG1hcHBpbmcgZmFpbGVkIGluIGNyZWF0ZV94ZW5fZW50cmllcyAgICAgIFs0LjEx
K10KClRoZXkgYWxsIG1ha2Ugc2Vuc2UsIEkgZGlkIHRoZSBiYWNrcG9ydHMsIGJ1aWxkaW5nIGVh
Y2ggY29tbWl0CmluZGl2aWR1YWxseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
