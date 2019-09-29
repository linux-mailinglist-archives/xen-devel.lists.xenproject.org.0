Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8BC1407
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 11:06:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEV5b-0003n5-6O; Sun, 29 Sep 2019 09:01:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEV5Z-0003n0-RY
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 09:01:57 +0000
X-Inumbo-ID: c9bcdc0a-e297-11e9-96ae-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id c9bcdc0a-e297-11e9-96ae-12813bfff9fa;
 Sun, 29 Sep 2019 09:01:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21E6128;
 Sun, 29 Sep 2019 02:01:56 -0700 (PDT)
Received: from [10.37.8.142] (unknown [10.37.8.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 549103F739;
 Sun, 29 Sep 2019 02:01:54 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <88d6b97e-1f19-56ff-1a35-901ce3102e78@suse.com>
 <20190903141545.5n4uk2khgbtvewgz@Air-de-Roger>
 <10cc7a4e-2c3b-c672-313c-d6c11874eac0@suse.com>
 <20190903155540.a4oafrrunhmxjlf6@Air-de-Roger>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f8aaac76-e3aa-c728-20fd-538e6e2c9350@arm.com>
Date: Sun, 29 Sep 2019 10:01:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903155540.a4oafrrunhmxjlf6@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ns16550: make PCI device hiding uniform
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzMvMTkgNDo1NSBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUs
IFNlcCAwMywgMjAxOSBhdCAwNToxMzozOFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4g
T24gMDMuMDkuMjAxOSAxNjoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+PiBPbiBUdWUs
IFNlcCAwMywgMjAxOSBhdCAwMzo1ODowOFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJz
L2NoYXIvbnMxNjU1MC5jCj4+Pj4gQEAgLTc2MywyMyArNzYzLDE2IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBuczE2NTUwX2luaXRfcG9zdGlycSgKPj4+PiAgICNpZmRlZiBDT05GSUdfSEFTX1BDSQo+
Pj4+ICAgICAgIGlmICggdWFydC0+YmFyIHx8IHVhcnQtPnBzX2JkZl9lbmFibGUgKQo+Pj4+ICAg
ICAgIHsKPj4+PiAtICAgICAgICBpZiAoICF1YXJ0LT5wYXJhbSApCj4+Pj4gLSAgICAgICAgICAg
IHBjaV9oaWRlX2RldmljZSgwLCB1YXJ0LT5wc19iZGZbMF0sIFBDSV9ERVZGTih1YXJ0LT5wc19i
ZGZbMV0sCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5wc19iZGZbMl0p
KTsKPj4+PiAtICAgICAgICBlbHNlCj4+Pj4gLSAgICAgICAgewo+Pj4+IC0gICAgICAgICAgICBp
ZiAoIHVhcnQtPnBhcmFtLT5tbWlvICYmCj4+Pj4gLSAgICAgICAgICAgICAgICAgcmFuZ2VzZXRf
YWRkX3JhbmdlKG1taW9fcm9fcmFuZ2VzLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1YXJ0LT5pb19iYXNlLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1YXJ0LT5pb19iYXNlICsgdWFydC0+aW9fc2l6ZSAtIDEpICkKPj4+PiAtICAg
ICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiRXJyb3Igd2hpbGUgYWRkaW5nIE1NSU8g
cmFuZ2Ugb2YgZGV2aWNlIHRvIG1taW9fcm9fcmFuZ2VzXG4iKTsKPj4+PiArICAgICAgICBpZiAo
IHVhcnQtPnBhcmFtICYmIHVhcnQtPnBhcmFtLT5tbWlvICYmCj4+Pj4gKyAgICAgICAgICAgICBy
YW5nZXNldF9hZGRfcmFuZ2UobW1pb19yb19yYW5nZXMsIHVhcnQtPmlvX2Jhc2UsCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydC0+aW9fYmFzZSArIHVhcnQtPmlvX3Np
emUgLSAxKSApCj4+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiRXJyb3Igd2hp
bGUgYWRkaW5nIE1NSU8gcmFuZ2Ugb2YgZGV2aWNlIHRvIG1taW9fcm9fcmFuZ2VzXG4iKTsKPj4+
PiAgIAo+Pj4+IC0gICAgICAgICAgICBpZiAoIHBjaV9yb19kZXZpY2UoMCwgdWFydC0+cHNfYmRm
WzBdLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0RFVkZOKHVhcnQt
PnBzX2JkZlsxXSwgdWFydC0+cHNfYmRmWzJdKSkgKQo+Pj4+IC0gICAgICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19JTkZPICJDb3VsZCBub3QgbWFyayBjb25maWcgc3BhY2Ugb2YgJTAyeDolMDJ4
LiV1IHJlYWQtb25seS5cbiIsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVhcnQtPnBzX2JkZlswXSwgdWFydC0+cHNfYmRmWzFdLAo+Pj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5wc19iZGZbMl0pOwo+Pj4+IC0gICAgICAgIH0K
Pj4+PiArICAgICAgICBpZiAoIHBjaV9yb19kZXZpY2UoMCwgdWFydC0+cHNfYmRmWzBdLAo+Pj4K
Pj4+IERvbid0IHlvdSBuZWVkIHRvIGdhdGUgdGhlIGNhbGwgdG8gcGNpX3JvX2RldmljZSB3aXRo
Cj4+PiB1YXJ0LT5wc19iZGZfZW5hYmxlPwo+Pgo+PiBObywgd2Ugd2FudCB0aGlzIGZvciBib3Ro
IHRoZSBwYXJzZV9wY2koKSBhbmQgdGhlIHBjaV91YXJ0X2NvbmZpZygpCj4+IGNhc2UsIHdoaWNo
IGlzIHdoYXQgdGhlIHN1cnJvdW5kaW5nIGlmKCkgKHZpc2libGUgaW4gY29udGV4dCBhYm92ZSkK
Pj4gY2hlY2tzLiAoTm90ZSBhbHNvIHRoYXQgcHJldmlvdXNseSB0aGVyZSB3YXMgbm8gc3VjaCBj
aGVjayBlaXRoZXIsCj4+IHNvIGlmIGFueXRoaW5nIGl0IHdvdWxkIGJlIGFuIG9ydGhvZ29uYWwg
Y2hhbmdlIGFueXdheS4pCj4gCj4gQWNrLCBJIGZpbmQgaXQgd3JvbmcgdGhhdCBwY2lfdWFydF9j
b25maWcgc2V0cyB0aGUgcHNfYmRmIGJ1dCBub3QKPiBwc19iZGZfZW5hYmxlLiBGcm9tIHRoZSBk
ZXNjcmlwdGlvbiBvZiB0aGUgcHNfYmRmX2VuYWJsZSBmaWVsZCBpdAo+IHNlZW1zIGxpa2UgcHNf
YmRmIGlzIG9ubHkgdmFsaWQgaWYgcHNfYmRmX2VuYWJsZSBpcyB0cnVlLCBidXQgdGhhdAo+IGRv
ZXNuJ3Qgc2VlbSB0byBtYXRjaCBwY2lfdWFydF9jb25maWcuCj4gCj4gVGhlIGNoYW5nZSBsb29r
cyBmaW5lIHRvIG1lIGJhc2VkIG9uIHdoYXQgd2FzIGRvbmUgYmVmb3JlLCBoZW5jZToKPiAKPiBS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
