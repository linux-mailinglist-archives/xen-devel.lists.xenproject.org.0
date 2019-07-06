Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6461031
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 13:00:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjiMp-0003pt-AN; Sat, 06 Jul 2019 10:56:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjiMn-0003po-Dk
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 10:56:29 +0000
X-Inumbo-ID: b3e39583-9fdc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b3e39583-9fdc-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 10:56:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 037C828;
 Sat,  6 Jul 2019 03:56:27 -0700 (PDT)
Received: from [10.37.12.18] (unknown [10.37.12.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BA963F703;
 Sat,  6 Jul 2019 03:56:25 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>,
 Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
Date: Sat, 6 Jul 2019 11:56:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGVuaXMsCgpPbiA3LzYvMTkgMTE6MTkgQU0sIERlbmlzIE9icmV6a292IHdyb3RlOgo+IE9u
IDcvNS8xOSAxMTo0NyBQTSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4+IFNvLAo+Pgo+Pgo+Pj4g
SSBhbSBnb2luZyB0byB0cnkgdG8gZXhwb3NlIHRoZSB3aG9sZSBjcm9zc2JhciB0byB0aGUgZG9t
MCBieSBtYXBwaW5nIGl0Cj4+PiBpbnRvIGRvbTAgYW5kIGFmdGVyIHRoYXQgdG8gdW5tYXAgaXQg
YW5kIHJlc3RyaWN0IHRoZSB1c2Ugb2YgdGhlIGNvbnRyb2wKPj4+IHJlZ2lzdGVyIHZpYSByZWdp
c3Rlcl9tbWlvX2hhbmRsZXIuIERvbid0IGtub3cgd2hldGhlciB0aGlzIHdpbGwgd29yay4KPj4+
Cj4+Cj4+IEkgdHJpZWQgYW5kIHdyaXRlIG5vdyBub3cgdmlzaWJsZSBwcm9ncmVzczoKPj4gLS0t
IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvb21hcDUuYwo+PiBAQCAtMjMsNiArMjMsOCBAQAo+PiAgICNpbmNsdWRlIDx4ZW4v
dm1hcC5oPgo+PiAgICNpbmNsdWRlIDxhc20vaW8uaD4KPj4KPj4gKyNkZWZpbmUgT01BUDVfQ1RS
TF9DT1JFX01QVV9JUlEgMHgwMDAwMEE0OAo+PiArCj4+ICAgdm9pZCBvbWFwNV9pbml0X3NlY29u
ZGFyeSh2b2lkKTsKPj4gICBhc20gKAo+PiAgICAgICAgICAgIi50ZXh0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXG5cdCIKPj4gQEAgLTEyNCw2ICsxMjYsOCBAQCBzdGF0aWMgaW50IG9t
YXA1X3NwZWNpZmljX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCkKPj4gICAgICAgbWFwX21taW9f
cmVnaW9ucyhkLCBnYWRkcl90b19nZm4oT01BUDVfU1JBTV9QQSksIDMyLAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgIG1hZGRyX3RvX21mbihPTUFQNV9TUkFNX1BBKSk7Cj4+Cj4+ICsgICAgbWFw
X21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4oT01BUDVfQ1RSTF9DT1JFX01QVV9JUlEpLCAz
MDAsCj4+ICsgICAgICAgICAgICAgICAgICAgIG1hZGRyX3RvX21mbihPTUFQNV9DVFJMX0NPUkVf
TVBVX0lSUSkpOwo+PiAgICAgICByZXR1cm4gMDsKPj4gICB9Cj4+Cj4+Cj4gSSBjYW4gc2VlIHRo
ZXJlIGlzIGEgbWlzdGFrZSBpbiBPTUFQNV9DVFJMX0NPUkVfTVBVX0lSUSBhZGRyZXNzLCBzbywg
SQo+IHRyaWVkIHRoZSByaWdodCBhZGRyZXNzIGZvciB0aGUgTVBVIGNyb3NzYmFyIGNvdHJvbCBy
ZWdpc3RlcnMgYW5kIEkgYWxzbwo+IHRyaWVkIHRvIGV4cG9zZSB0aGUgd2hvbGUgY29udHJvbCBD
VFJMIHJlZ2lzdGVyIGJ1dCB1bnN1cnByaXNpbmdseQo+IGhhdmVuJ3Qgc3VjY2VlZGVkLgo+IAoK
VGhlIGNyb3NzYmFyIGlzIGRlc2NyaWJlZCBpbiB0aGUgRGV2aWNlLVRyZWUsIFhlbiBzaG91bGQg
YWxyZWFkeSBtYXAgdGhlIApjcm9zc2JhciBpbiBEb20wLgoKSSB3YXNuJ3QgYWJsZSB0byBmaW5k
IGFueSBjbHVlIGluIHRoZSBsb2cgKGZyb20geW91ciBmaXJzdCBlLW1haWwpIHRoYXQgCnRoZSBj
cm9zc2JhciBpcyBub3QgbWFwcGVkIHRvIERvbTAuIEFjdHVhbGx5LCBwZXIgdGhlIGxvZywgdGhl
IG1hcHBpbmcgCnNob3VsZCBoYXZlIGJlZW4gZG9uZToKCihYRU4pIGhhbmRsZSAvb2NwL2Nyb3Nz
YmFyQDRhMDAyYTQ4CihYRU4pIGR0X2lycV9udW1iZXI6IGRldj0vb2NwL2Nyb3NzYmFyQDRhMDAy
YTQ4CihYRU4pIC9vY3AvY3Jvc3NiYXJANGEwMDJhNDggcGFzc3Rocm91Z2ggPSAxIG5pcnEgPSAw
IG5hZGRyID0gMQooWEVOKSBEVDogKiogdHJhbnNsYXRpb24gZm9yIGRldmljZSAvb2NwL2Nyb3Nz
YmFyQDRhMDAyYTQ4ICoqCihYRU4pIERUOiBidXMgaXMgZGVmYXVsdCAobmE9MSwgbnM9MSkgb24g
L29jcAooWEVOKSBEVDogdHJhbnNsYXRpbmcgYWRkcmVzczo8Mz4gNGEwMDJhNDg8Mz4KKFhFTikg
RFQ6IHBhcmVudCBidXMgaXMgZGVmYXVsdCAobmE9MiwgbnM9Mikgb24gLwooWEVOKSBEVDogd2Fs
a2luZyByYW5nZXMuLi4KKFhFTikgRFQ6IGRlZmF1bHQgbWFwLCBjcD0wLCBzPWMwMDAwMDAwLCBk
YT00YTAwMmE0OAooWEVOKSBEVDogcGFyZW50IHRyYW5zbGF0aW9uIGZvcjo8Mz4gMDAwMDAwMDA8
Mz4gMDAwMDAwMDA8Mz4KKFhFTikgRFQ6IHdpdGggb2Zmc2V0OiA0YTAwMmE0OAooWEVOKSBEVDog
b25lIGxldmVsIHRyYW5zbGF0aW9uOjwzPiAwMDAwMDAwMDwzPiA0YTAwMmE0ODwzPgooWEVOKSBE
VDogcmVhY2hlZCByb290IG5vZGUKKFhFTikgICAtIE1NSU86IDAwNGEwMDJhNDggLSAwMDRhMDAy
Yjc4IFAyTVR5cGU9NQooWEVOKSBoYW5kbGUgL29jcC9kc3NANTgwMDAwMDAKKFhFTikgZHRfaXJx
X251bWJlcjogZGV2PS9vY3AvZHNzQDU4MDAwMDAwCihYRU4pIC9vY3AvZHNzQDU4MDAwMDAwIHBh
c3N0aHJvdWdoID0gMSBuaXJxID0gMCBuYWRkciA9IDUKKFhFTikgRFQ6ICoqIHRyYW5zbGF0aW9u
IGZvciBkZXZpY2UgL29jcC9kc3NANTgwMDAwMDAgKioKCkxvb2tpbmcgdG93YXJkcyB0aGUgZW5k
IG9mIHRoZSBsb2c6CgooWEVOKSB0cmFwcy5jOjE5OTg6ZDB2MCBIU1I9MHg5MzgwMDAwNyBwYz0w
eGMwMTJiZDVjIGd2YT0weGZhMjQzNDA0IApncGE9MHgwMDAwMDA0ODI0MzQwNAoKVGhpcyBtZWFu
cyBMaW51eCBpcyB0cnlpbmcgdG8gYWNjZXNzIHRoZSBhZGRyZXNzIDB4MDAwMDAwNDgyNDM0MDQg
d2hpY2ggCndhcyBub3QgbWFwcGVkIGluIHRoZSBzdGFnZS0yLiBUaGlzIGRvZXMgbm90IHNlZW0g
dG8gYmVsb25nIHRvIHRoZSAKY3Jvc3NiYXIgYnV0IFBSQ01fTVBVLiBUaGUgZnVuY3Rpb24gb21h
cDVfc3BlY2lmaWNfbWFwcGluZygpIHNob3VsZCBkbyAKdGhlIG1hcHBpbmcgZm9yIHlvdS4gSXMg
aXQgY2FsbGVkIGZvciB5b3VyIHBsYXRmb3JtPwoKT24gYSBzaWRlIG5vdGUsIEkgYW0gbm90IGNv
bnZpbmNlZCBleHBvc2luZyBkaXJlY3RseSAoaS5lIHdpdGhvdXQgCmVtdWxhdGlvbikgdGhlIGNy
b3NzYmFyIHRvIGRvbTAgd2lsbCBoZWxwIHVzLiBQZXIgdGhlIGxvZywgdGhlIFVBUlQgd2lsbCAK
YWxzbyB1c2UgdGhlIGNyb3NzYmFyOgoKKFhFTikgb21hcC11YXJ0OiBVbmFibGUgdG8gcmV0cmll
dmUgdGhlIElSUQooWEVOKSBVbmFibGUgdG8gaW5pdGlhbGl6ZSBkdHVhcnQ6IC0yMgooWEVOKSBC
YWQgY29uc29sZT0gb3B0aW9uICdkdHVhcnQnCgpTbyBYZW4gbmVlZHMgdG8gYmUgYWJsZSB0byBj
b250cm9sIGl0LiBUbyBtYWtlIHRoaW5ncyBlYXNpZXIsIGl0IHdvdWxkIApwcm9iYWJseSBiZXR0
ZXIgdG8gZmlyc3QgZm9jdXMgb24gZ2V0dGluZyBhIHNtYWxsIGNyb3NzYmFyIGRyaXZlciBpbiBY
ZW4gCmFuZCB2ZXJpZnkgeW91IGNhbiB1c2UgdGhlIFVBUlQgaW4gWGVuIChzdWNoIGFzIHJlY2Vp
dmluZyBjaGFyYWN0ZXJzKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
