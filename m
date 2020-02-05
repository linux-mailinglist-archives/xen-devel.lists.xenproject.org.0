Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EF152806
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:07:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izGbV-00053T-AW; Wed, 05 Feb 2020 09:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AtEH=3Z=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1izGbT-00053O-Ml
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:04:11 +0000
X-Inumbo-ID: 774fbea0-47f6-11ea-8396-bc764e2007e4
Received: from mail1.bemta26.messagelabs.com (unknown [85.158.142.3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 774fbea0-47f6-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1580893447; i=@ts.fujitsu.com;
 bh=lX+2pWHGgbo6NuQU7UCjs/SfwBNXjYBgNwStunL/jJ8=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type;
 b=A112pUlYMrPvQRgA/3I0b4npg2k0ghQ8UriZUz2RPC4+qsxMaPNWGqUAiSWs4EttP
 0BMLzSBzDzBbG934a47VTSL8wobJKwYhufx+ceIv+OrNlP+gQbGrHdYkgNmISO4LYH
 01++2yJWPsLv6helYGoca6GGiZBtXxxV9AiAXG2fxN+Z8gk0Fpf2aLYyKWP4lhA7DK
 jvinFsWTuH0CR88Qb2KDbcvMwCL37WtvqVlcEJdotTp4pEb++p5uJ1mi+bXdMJNpCL
 cpQiPy2dqZjPdHnNVbvhU1740W4YgoKjS/xFPKuuegX0fo3Yr+AieMiHgEpedJ9COo
 7tcvSLPk6IVZA==
Received: from [100.113.2.175] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 51/F9-11864-7058A3E5;
 Wed, 05 Feb 2020 09:04:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxVZe91Sr
 OYMsPZovVm6azWcy5aWTxfctkJgdmj9eTJzB6HP5whcVj/ZarLAHMUayZeUn5FQmsGcdePmIr
 2CVUMfn4YtYGxmn8XYxcHEICsxkl/lx4yw7hrGCUWDL3DVsXIycHm4CBxK5Xh5hBbBEBM4m+x
 jfsIDazQKXE4tarLCC2sECwxKamXWBxFgFViTcT97OC2LwChhKT5q4F6+UUsJG4euoh1IJ2Ro
 lfVw8yQxQJSpyc+YQFYqi2xLKFr5khbD2JG1OnsE1g5J2FpGwWkrJZSMoWMDKvYrRMKspMzyj
 JTczM0TU0MNA1NDTWNQayzPQSq3QT9VJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBIZpS
 yJy1g/Hj2vd6hxglOZiURHkvFVjFCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgTWwCygkWpaanV
 qRl5gDjBSYtwcGjJMJ7ByTNW1yQmFucmQ6ROsWoKCXOm9gMlBAASWSU5sG1wWL0EqOslDAvIw
 MDgxBPQWpRbmYJqvwrRnEORiVhXnaQKTyZeSVw018BLWYCWiztbQGyuCQRISXVwFSS0PJtjuq
 3J4EH5++UueyxMkDCkqkrQMX3snTHAgV7pXfBE8JL1/Vc4FPomS56Z60Ax+M2roes8zlWHl4j
 +nh5WiRbYbbSlF71hw2Vs2uVwooNs7xK+lJPTxafxGzFNcfFN5Mp6PfZh5Wil83vKBrMiwque
 s/6cOoug+sNUtXVt2ZnrZJaPieuReLltU9XxBTqX9TInebvnyHWYKaa87v6/AH7XTWfti9NE3
 h/MsXNuWSK7qSOHPGlVk7Pb1zZWBBit+VQ2LeH5qYmWy4ZLoovUjQXSI4qSliQufNZ4cuO/eZ
 THlmsO/neO4pnhrTLuUVbtyiEaPif5a1h/7+qr/DLwR1bgq9rXftVVGKqocRSnJFoqMVcVJwI
 AO6bK01MAwAA
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-26.tower-232.messagelabs.com!1580893446!1904217!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28313 invoked from network); 5 Feb 2020 09:04:07 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-26.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Feb 2020 09:04:07 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 015946pJ019365;
 Wed, 5 Feb 2020 09:04:06 GMT
Received: from amur.mch.fsc.net (amur.mch.fsc.net [10.172.102.28])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 09B6D5900214;
 Wed,  5 Feb 2020 10:03:58 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Date: Wed, 05 Feb 2020 10:03:57 +0100
Message-ID: <2063375.Nye48AXmgY@amur.mch.fsc.net>
In-Reply-To: <2c7f8172-b2c9-4831-f91d-d5b83a668527@suse.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
 <2c7f8172-b2c9-4831-f91d-d5b83a668527@suse.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gRGllbnN0YWcsIDQuIEZlYnJ1YXIgMjAyMCwgMTU6MTg6NTMgQ0VUIHNjaHJpZWIgSsO8cmdl
biBHcm/DnzoKPiBPbiAwNC4wMi4yMCAxNTowNywgRGlldG1hciBIYWhuIHdyb3RlOgo+ID4gQW0g
RnJlaXRhZywgMzEuIEphbnVhciAyMDIwLCAyMjo1OToxOSBDRVQgc2NocmllYiBJZ29yIERydXpo
aW5pbjoKPiA+PiBPbiAzMC8wMS8yMDIwIDEzOjAzLCBEaWV0bWFyIEhhaG4gd3JvdGU6Cj4gPj4+
IEhpLAo+ID4+Pgo+ID4+PiB3ZSB1c2UgU0xFUzEyIHdpdGgga2VybmVsLWRlZmF1bHQtNC4xMi4x
NC05NS40NS4xLng4Nl82NCBhbmQKPiA+Pj4geGVuLTQuMTEuM18wMi0yLjIwLjEueDg2XzY0Cj4g
Pj4+Cj4gPj4+IFRoZSBkdW1wIGtlcm5lbCBkb2Vzbid0IHN0YXJ0IGFmdGVyICJlY2hvIGMgPiAv
cHJvYy9zeXNycV90cmlnZ2VyIi4KPiA+Pj4gTGFzdCBtZXNzYWdlcyBvbiBjb25zb2xlIGFyZToK
PiA+Pj4gWyAgMzg1LjcxNzUzMl0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4
Y2VwdGlvbgo+ID4+PiBbICAzODUuNzM0NTY1XSBLZXJuZWwgT2Zmc2V0OiBkaXNhYmxlZAo+ID4+
PiAoWEVOKSBIYXJkd2FyZSBEb20wIGNyYXNoZWQ6IEV4ZWN1dGluZyBrZXhlYyBpbWFnZSBvbiBj
cHU1OAo+ID4+PiAoWEVOKSBTaG90IGRvd24gYWxsIENQVXMKPiA+Pj4KPiA+Pj4gQWZ0ZXIgYSBz
aG9ydCB0aW1lIGEgcmVib290IGlzIGluaXRpYXRlZC4KPiA+Pj4gV2l0aG91dCB4ZW4gdGhlIGtk
dW1wIHdvcmtzLgo+ID4+Pgo+ID4+PiBXZSBzZWUgdGhpcyBiZWhhdmlvdXIgb25seSBvbiBuZXdl
ciBoYXJkd2FyZSwgZm9yIGV4YW1wbGUgYSBzZXJ2ZXIgd2l0aAo+ID4+PiBJbnRlbChSKSBYZW9u
KFIpIEdvbGQgNjI0MiBDUFUgQCAyLjgwR0h6Cj4gPj4+Cj4gPj4+IEkgYnVpbHQgdGhlIGZyZXNo
IHJlbGVhc2VkIHhlbi00LjEzIG15c2VsZiBhbmQgdHJpZWQgaXQgYnV0IHRoaXMgZG9lc24ndCBo
ZWxwLgo+ID4+Pgo+ID4+PiBJIHRyaWVkIHgyYXBpYz1vZmYgb24gdGhlIHhlbiBzaWRlIGFuZCBu
b3gyYXBpYyBvbiB0aGUgbGludXggc2lkZSBidXQgbm8gc3VjY2Vzcy4KPiA+Pgo+ID4+IFN0YXJ0
aW5nIGZyb20gWGVuIDQuMTIgd2Uga2VlcCBJT01NVSBlbmFibGVkIGR1cmluZyBrZXhlYyB0cmFu
c2l0aW9uCj4gPj4gd2hpY2ggcmVzb2x2ZWQgdGhlIHByb2JsZW0geW91J3JlIGRlc2NyaWJpbmcu
IEJ1dCB5b3UgYWxzbyBuZWVkIHRvIG1ha2UKPiA+PiBzdXJlIElPTU1VIGlzIGVuYWJsZWQgaW4g
eW91ciBrZXhlYyBrZXJuZWwgKHdoaWNoIEkgdGhpbmsgaXMgbm93IHRoZQo+ID4+IGRlZmF1bHQg
Zm9yIG1vc3QgZGlzdHJvcykuIFlvdSBjYW4gc3RpbGwgdHJ5IHRvIHdvcmthcm91bmQgdGhlIGlz
c3VlCj4gPj4geW91J3JlIHNlZWluZyBvbiA0LjExIGJ5IHVzaW5nICJpb21tdT1kb20wLXBhc3N0
aG91Z2giIFhlbiBvcHRpb24uCj4gPiAKPiA+IEkgYWRkZWQgImlvbW11PWRvbTAtcGFzc3Rocm91
Z2giIHRvIHRoZSB4ZW4tNC4xMSBjb21tYW5kIGxpbmUgYnV0IG5vIHN1Y2Nlc3MuCj4gPiBGdXJ0
aGVyIEkgYWRkZWQgZWFybHlwcmludGs9Li4uIHRvIHRoZSB0aGUga2R1bXAga2VybmVsIGFuZCBJ
IGNvdWxkIHNlZSB0aGUKPiA+IGR1bXAga2VybmVsIHN0YXJ0ZWQgYW5kIG9ubHkgb25lIG1lc3Nh
Z2UgZnJvbSBleHRyYWN0X2tlcm5lbCgpCj4gPiB3YXMgcHJpbnRlZC4gVGhlbiB0aGUgcmVib290
IGZvbGxvd2VkLgo+IAo+IFdoaWNoIG1lc3NhZ2U/Cj4gCj4gQW55IGNoYW5jZSB5b3UgY2FuIGJ1
aWxkIHRoZSBrZHVtcCBrZXJuZWwgd2l0aCBDT05GSUdfWDg2X1ZFUkJPU0VfQk9PVFVQCj4gZW5h
YmxlZD8KClllcyBpdCdzIHN3aXRjaGVkIG9uLiBUaGUgTWVzc2FnZSBpcyBmcm9tIHRoZSBmaXJz
dCBkZWJ1ZyBtZXNzYWdlIGluCmV4dHJhY3Rfa2VybmVsKCkgLSBkZWJ1Z19wdXRhZGRyKGlucHV0
X2RhdGEpOgoiaW5wdXRfZGF0YTogMHgiCkJ1dCBub3QgYWxsIG9mIHRoZSB0ZXh0IGlzIHNlZW4h
CklmIEkgdW50ZXJzdGFuZCB0aGUgZWFybHlfc2VyaWFsX2luaXQgY29kZSBpbiBhcmNoL3g4Ni9i
b290L2Vhcmx5X3NlcmlhbF9jb25zb2xlLmMKY29ycmVjdGx5IHRoZSBzZXJpYWwgbGluZSB3b3Jr
cyB3aXRoIHBvbGxpbmcgKG5vIGludGVycnVwdHMpLCBzbyBpdCBzZWVtcyB0aGUKcmVib290IGlz
IGluaXRpYXRlZCBiZWZvcmUgdGhlIGNvbXBsZXRlIG1lc3NhZ2UgaXMgcHJpbnRlZC4KCldpdGgg
YW4gb2xkZXIgU0xFUzExU1A0IHN5c3RlbSAoeGVuLTQuNC40IGFuZCBsaW51eC0zLjAuMTA3KSB0
aGUga2R1bXAgd29ya3MuCgpEaWV0bWFyLgoKPiAKPiAKPiBKdWVyZ2VuCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
