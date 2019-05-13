Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1E1B448
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:45:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ8Pl-0005Ku-CF; Mon, 13 May 2019 10:42:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQ8Pk-0005Km-20
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:42:36 +0000
X-Inumbo-ID: d03755a4-756b-11e9-8e9a-97b84082e56e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d03755a4-756b-11e9-8e9a-97b84082e56e;
 Mon, 13 May 2019 10:42:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 04:42:32 -0600
Message-Id: <5CD94A13020000780022E0DC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 04:42:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
 <2e22e48d-455f-9ec2-018d-497c5f57e524@citrix.com>
In-Reply-To: <2e22e48d-455f-9ec2-018d-497c5f57e524@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/mm: free_page_type() is PV-only
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDEyOjMzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzEwLzE5IDM6MTIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMjY0MCwx
MSArMjYzOSwxMSBAQCBpbnQgZnJlZV9wYWdlX3R5cGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnCj4+
ICAgICAgICAgIC8qIEEgcGFnZSB0YWJsZSBpcyBkaXJ0aWVkIHdoZW4gaXRzIHR5cGUgY291bnQg
YmVjb21lcyB6ZXJvLiAqLwo+PiAgICAgICAgICBwYWdpbmdfbWFya19kaXJ0eShvd25lciwgcGFn
ZV90b19tZm4ocGFnZSkpOwo+PiAgCj4+IC0gICAgICAgIEFTU0VSVCghc2hhZG93X21vZGVfcmVm
Y291bnRzKG93bmVyKSk7Cj4+ICsgICAgICAgIEFTU0VSVChzaGFkb3dfbW9kZV9lbmFibGVkKG93
bmVyKSk7Cj4+ICsgICAgICAgIEFTU0VSVCghcGFnaW5nX21vZGVfcmVmY291bnRzKG93bmVyKSk7
Cj4+ICsgICAgICAgIEFTU0VSVCghcGFnaW5nX21vZGVfdHJhbnNsYXRlKG93bmVyKSk7Cj4gCj4g
SW4gdGhlIGNvbnRleHQgb2YgbXkgcGF0Y2ggdG8gQ09ESU5HX1NUWUxFIGFib3V0IHRoZSB1c2Ug
b2YgQVNTRVJUcywKPiB0aGlua2luZyBhYm91dCBBU1NFUlQgdnMgQlVHX09OIHZzIHNvbWV0aGlu
ZyBlbHNlIGhlcmUuICBJIGd1ZXNzIGluIHRoaXMKPiBjYXNlOgo+IAo+IDEuIFBWIGd1ZXN0cyBj
YW4ndCBiZSBpbiB0cmFuc2xhdGUgbW9kZQo+IDIuIElmIHRoYXQgZXZlciBjaGFuZ2VkLCB3ZSdk
IHByb2JhYmx5IHRyaXAgb3ZlciB0aGUgQVNTRVJUKCkgd2hpbGUKPiBkZWJ1Z2dpbmcKPiAKPiBT
byBJIGd1ZXNzIEFTU0VSVCgpIGlzIHByb2JhYmx5IGZpbmUuCgpSaWdodCwgaW4gb3RoZXIgKG1v
cmUgbGlrZWx5IHRvIGJlIFt3cm9uZ2x5XSBleHBvc2VkIHRvIGFjdHVhbApleGVjdXRpb24pIGNh
c2VzIEknZCBwcm9iYWJseSBub3QgaGF2ZSB1c2VkIHBsYWluIEFTU0VSVCgpCmhlcmUuCgo+IFJl
dmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpUaGFu
a3MuCgo+IFNvIGRvZXMgdGhhdCBtZWFuLCB0aG91Z2gsIHRoYXQgU0hBUkVEX00yUF9FTlRSWSAm
IGZyaWVuZHMgYXJlIGVudGlyZWx5Cj4gdmVzdGlnYWwgbm93LCBhbmQgY2FuIGJlIHJlbW92ZWQ/
CgpObywgaXQncyBwb2ludGxlc3MgdG8gdXNlIGhlcmUgb25seSBiZWNhdXNlIHRoZXJlJ3Mgbm8g
TTJQCnRyYW5zbGF0aW9uIGRvbmUgaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UsIGR1ZSB0byB0aGUg
Y29kZQpiZWluZyBQViBvbmx5LiBJbiBjb2RlIHBhdGhzIHJlYWNoYWJsZSBmb3IgSFZNIHRoZXNl
Cm91Z2h0IHRvIHN0aWxsIGJlIG5lY2Vzc2FyeS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
