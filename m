Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34351C1E0C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEs0l-0000ty-I4; Mon, 30 Sep 2019 09:30:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEs0j-0000tt-Jn
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:30:29 +0000
X-Inumbo-ID: f058057e-e364-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f058057e-e364-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 09:30:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27A85B2A0;
 Mon, 30 Sep 2019 09:30:27 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
 <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
 <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
Date: Mon, 30 Sep 2019 11:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
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
 osstest service owner <osstest-admin@xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMTE6MTcsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBT
ZW50OiAzMCBTZXB0ZW1iZXIgMjAxOSAxMDowNwo+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIDxv
c3N0ZXN0LQo+PiBhZG1pbkB4ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2
ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQxOTkwOiByZWdyZXNzaW9ucyAtIEZBSUwKPj4KPj4g
T24gMzAuMDkuMjAxOSAxMDoxNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gSSBjYW4ndCBmaW5k
IGFueXRoaW5nIGNvbmNsdXNpdmUgaW4gdGhlIGxvZ3MsIGJ1dCBpdCBsb29rcyBsaWtlIGl0J3Mg
bWFpbmx5IEFNRCBoL3cgdGhhdCdzIHRoZQo+PiBwcm9ibGVtIGFuZCBvbiBhdCBsZWFzdCBvbmUg
b2YgdGhlIHRlc3QgZmFpbHVyZXMgSSBzZWUgbG90cyBvZiB0aGlzIGtpbmQgb2YgdGhpbmcgaW4g
dGhlIHNlcmlhbCBsb2c6Cj4+Pgo+Pj4gU2VwIDI5IDE3OjMzOjU1LjMxNjQyMiBbICAxNjkuODI4
NTYzXSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5LjgzMTc5OF0gSU9fUEFHRV9GQVVMVAo+
PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgw
IGZsYWdzPTB4MDAyMF0KPj4+IFNlcCAyOSAxNzozMzo1NS4zNzY1OTUgWyAgMTY5Ljg0MDQ4MV0g
QU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44NDM3MTZdIElPX1BBR0VfRkFVTFQKPj4gZGV2
aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFn
cz0weDAwMjBdCj4+PiBTZXAgMjkgMTc6MzM6NTUuMzg4NDY5IFsgIDE2OS44NTIzOThdIEFNRC1W
aTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODU1NjI3XSBJT19QQUdFX0ZBVUxUCj4+IGRldmljZT0w
MDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAwMDAwODAgZmxhZ3M9MHgw
MDIwXQo+Pj4gU2VwIDI5IDE3OjMzOjU1LjQwMDQ4NiBbICAxNjkuODY0MzExXSBBTUQtVmk6IEV2
ZW50IGxvZ2dlZCBbWyAgMTY5Ljg2NzU0MF0gSU9fUEFHRV9GQVVMVAo+PiBkZXZpY2U9MDA6MTMu
MSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0K
Pj4+IFNlcCAyOSAxNzozMzo1NS40MTI1NTkgWyAgMTY5Ljg3NjIyNF0gQU1ELVZpOiBFdmVudCBs
b2dnZWQgW1sgIDE2OS44Nzk0NThdIElPX1BBR0VfRkFVTFQKPj4gZGV2aWNlPTAwOjEzLjEgZG9t
YWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdCj4+Cj4g
Cj4gQWggeWVzLCB0aGV5IG1pZ2h0IGJlLiBTdGlsbCBub3QgZm91bmQgYW55dGhpbmcgdXNlZnVs
IGluIG90aGVyIGxvZ3MuCgpPbmUgY2FzZSB3YXMgZm9yIHN0dWItZG0sIGFub3RoZXIgb25lIGZv
ciBtaWdyYXRpb24uCgpJIGNvdWxkIGltYWdpbmUgaW5mby0+cGFzc3Rocm91Z2ggaXNuJ3QgaW5p
dGlhbGl6ZWQgcHJvcGVybHkgZm9yIHRoZQpzdHViZG9tIGNhc2UsIGFuZCBtYXliZSB0aGUgaW5m
b3JtYXRpb24gaXMgbWlzc2luZyBpbiB0aGUgbWlncmF0aW9uCnN0cmVhbSwgdG9vPwoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
