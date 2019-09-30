Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D272C1DAB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEreK-0006id-64; Mon, 30 Sep 2019 09:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEreI-0006iY-0j
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:07:18 +0000
X-Inumbo-ID: b228c020-e361-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b228c020-e361-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 09:07:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A40F6B15C;
 Mon, 30 Sep 2019 09:07:14 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
Date: Mon, 30 Sep 2019 11:07:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMDoxNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEkgY2FuJ3QgZmluZCBh
bnl0aGluZyBjb25jbHVzaXZlIGluIHRoZSBsb2dzLCBidXQgaXQgbG9va3MgbGlrZSBpdCdzIG1h
aW5seSBBTUQgaC93IHRoYXQncyB0aGUgcHJvYmxlbSBhbmQgb24gYXQgbGVhc3Qgb25lIG9mIHRo
ZSB0ZXN0IGZhaWx1cmVzIEkgc2VlIGxvdHMgb2YgdGhpcyBraW5kIG9mIHRoaW5nIGluIHRoZSBz
ZXJpYWwgbG9nOgo+IAo+IFNlcCAyOSAxNzozMzo1NS4zMTY0MjIgWyAgMTY5LjgyODU2M10gQU1E
LVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44MzE3OThdIElPX1BBR0VfRkFVTFQgZGV2aWNlPTAw
OjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAw
MjBdCj4gU2VwIDI5IDE3OjMzOjU1LjM3NjU5NSBbICAxNjkuODQwNDgxXSBBTUQtVmk6IEV2ZW50
IGxvZ2dlZCBbWyAgMTY5Ljg0MzcxNl0gSU9fUEFHRV9GQVVMVCBkZXZpY2U9MDA6MTMuMSBkb21h
aW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0KPiBTZXAg
MjkgMTc6MzM6NTUuMzg4NDY5IFsgIDE2OS44NTIzOThdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtb
ICAxNjkuODU1NjI3XSBJT19QQUdFX0ZBVUxUIGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYg
YWRkcmVzcz0weDAwMDAwMDAwMDAwMDAwODAgZmxhZ3M9MHgwMDIwXQo+IFNlcCAyOSAxNzozMzo1
NS40MDA0ODYgWyAgMTY5Ljg2NDMxMV0gQU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44Njc1
NDBdIElPX1BBR0VfRkFVTFQgZGV2aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4
MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdCj4gU2VwIDI5IDE3OjMzOjU1LjQxMjU1OSBb
ICAxNjkuODc2MjI0XSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg3OTQ1OF0gSU9fUEFH
RV9GQVVMVCBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAw
MDAwMDgwIGZsYWdzPTB4MDAyMF0KCkJ1dCB0aGVzZSBhcmUgYmFyZSBtZXRhbCBMaW51eCBtZXNz
YWdlcywgYXJlbid0IHRoZXk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
