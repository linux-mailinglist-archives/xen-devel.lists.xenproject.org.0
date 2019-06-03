Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429F32D05
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 11:38:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjMK-0002f1-Ki; Mon, 03 Jun 2019 09:34:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXjMJ-0002ew-M3
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:34:27 +0000
X-Inumbo-ID: c7339212-85e2-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c7339212-85e2-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 09:34:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 03:34:25 -0600
Message-Id: <5CF4E99E02000078002347D5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 03:34:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Anthony Perard" <anthony.perard@citrix.com>,
 "osstest service owner" <osstest-admin@xenproject.org>
References: <osstest-137100-mainreport@xen.org>
In-Reply-To: <osstest-137100-mainreport@xen.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 137100:
 regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAxLjA2LjE5IGF0IDEwOjQzLCA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz4g
d3JvdGU6Cj4gZmxpZ2h0IDEzNzEwMCBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyByZWFsIFty
ZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8x
MzcxMDAvIAo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3Vj
Y2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3Qg
YmUgcnVuOgo+ICBidWlsZC1hcm02NC1wdm9wcyAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAg
ICAgICAgICAgICAgICAgYnJva2VuICBpbiAxMzQ1MDQKPiAgYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbiAgaW4gMTM0NTA0
Cj4gIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAg
ICAgICAgICBicm9rZW4gIGluIDEzNDUwNAo+ICBidWlsZC1hcm02NC14c20gICAgICAgICAgICA0
IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4gaW4gMTM0NTA0IFJFR1IuIHZzLiAxMjU1NzUKPiAgYnVp
bGQtYXJtNjQgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgYnJva2VuIGluIDEzNDUw
NCBSRUdSLiB2cy4gMTI1NTc1Cj4gIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgIDQgaG9zdC1p
bnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+ICB0ZXN0LWFybTY0
LWFybTY0LXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1Iu
IHZzLiAxMjU1NzUKPiAgdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgNyB4ZW4tYm9vdCAg
ICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI1NTc1Cj4gIHRlc3QtYXJtNjQtYXJtNjQt
eGwtY3JlZGl0MiAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEy
NTU3NQo+ICB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgICA3IHhlbi1ib290ICAgICAgICAg
ICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1NzUKCldoYXQgaXMgdGhlIHNpdHVhdGlvbiBoZXJl
PyBXaGVuIGNhbiB3ZSBleHBlY3QgdG8gYmUgYWJsZSB0byBnZXQKNC4xMS4yIG91dCB0aGUgZG9v
cj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
