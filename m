Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652610743
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:53:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmp9-0007WR-H0; Wed, 01 May 2019 10:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmp7-0007Vu-Qu
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:50:49 +0000
X-Inumbo-ID: fa56827c-6bfe-11e9-8132-0b4de3d8ebdd
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa56827c-6bfe-11e9-8132-0b4de3d8ebdd;
 Wed, 01 May 2019 10:50:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837391"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23753.31236.827372.481563@mariner.uk.xensource.com>
Date: Wed, 1 May 2019 11:50:44 +0100
To: "royger@FreeBSD.org" <royger@FreeBSD.org>
In-Reply-To: <osstest-135317-mainreport@xen.org>
References: <osstest-135317-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [freebsd-master test] 135317: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltmcmVlYnNkLW1hc3RlciB0ZXN0XSAxMzUz
MTc6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBh
bmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVu
Ogo+ICBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAg
ICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKCkkgZ3Vlc3MgdGhpcyBtdXN0IGJlIGEgaG9zdC1z
cGVjaWZpYyBGcmVlQlNEIGtlcm5lbCBidWcgPyAgUm9nZXIsIGFyZQp5b3UgaW52ZXN0aWdhdGlu
ZyA/CgpJIGRvbid0IHRoaW5rIHRoaXMgY2FuIGJlIGFueXRoaW5nIHRvIGRvIHdpdGggdGhlIG9z
c3Rlc3QgdXBncmFkZSB0bwptYWlubHkgdXNlIHN0cmV0Y2gsIHNpbmNlIHRoYXQgZG9lcyBub3Qg
YWZmZWN0IHRoZSBGcmVlQlNEIGZsaWdodHMKOi0pLgoKUmVnYXJkcywKSWFuLgoKQXByIDI2IDE1
OjM1OjU4LjQ4Nzk5NyB3cGFuaWM6IG10eF9sb2NrKCkgb2Ygc3BpbiBtdXRleCAobnVsbCkgQCAv
dXNyL2hvbWUvb3NzdGVzdC9idWlsZC4xMzUzMTcuYnVpbGQtYW1kNjQtZnJlZWJzZC9mcmVlYnNk
L3N5cy9rZXJuL3N1YnJfYnVzLmM6NjIwCkFwciAyNiAxNTozNTo1OC40ODgwNzcgY3B1aWQgPSAz
CkFwciAyNiAxNTozNTo1OC40OTk5ODMgdGltZSA9IDEKQXByIDI2IDE1OjM1OjU4LjUwMDAzOSBL
REI6IHN0YWNrIGJhY2t0cmFjZToKQXByIDI2IDE1OjM1OjU4LjUwMDA4NyBkYl90cmFjZV9zZWxm
X3dyYXBwZXIoKSBhdCBkYl90cmFjZV9zZWxmX3dyYXBwZXIrMHgyYi9mcmFtZSAweGZmZmZmZTAw
M2I5Njg3MTAKQXByIDI2IDE1OjM1OjU4LjUwMDE0MyB2cGFuaWMoKSBhdCB2cGFuaWMrMHgxOWQv
ZnJhbWUgMHhmZmZmZmUwMDNiOTY4NzYwCkFwciAyNiAxNTozNTo1OC41MTIwMDggcGFuaWMoKSBh
dCBwYW5pYysweDQzL2ZyYW1lIDB4ZmZmZmZlMDAzYjk2ODdjMApBcHIgMjYgMTU6MzU6NTguNTEy
MDcwIF9fbXR4X2xvY2tfZmxhZ3MoKSBhdCBfX210eF9sb2NrX2ZsYWdzKzB4MTQ1L2ZyYW1lIDB4
ZmZmZmZlMDAzYjk2ODgxMApBcHIgMjYgMTU6MzU6NTguNTIzOTkyIGRldmN0bF9xdWV1ZV9kYXRh
X2YoKSBhdCBkZXZjdGxfcXVldWVfZGF0YV9mKzB4NmEvZnJhbWUgMHhmZmZmZmUwMDNiOTY4ODQw
CkFwciAyNiAxNTozNTo1OC41MzU5NzAgZ19kZXZfdGFzdGUoKSBhdCBnX2Rldl90YXN0ZSsweDQ2
My9mcmFtZSAweGZmZmZmZTAwM2I5NjhhMDAKQXByIDI2IDE1OjM1OjU4LjUzNjAzNiBnX2xvYWRf
Y2xhc3MoKSBhdCBnX2xvYWRfY2xhc3MrMHgxYmMvZnJhbWUgMHhmZmZmZmUwMDNiOTY4YTMwCkFw
ciAyNiAxNTozNTo1OC41NDc5ODIgZ19ydW5fZXZlbnRzKCkgYXQgZ19ydW5fZXZlbnRzKzB4MTk3
L2ZyYW1lIDB4ZmZmZmZlMDAzYjk2OGE3MApBcHIgMjYgMTU6MzU6NTguNTQ4MDQ3IGZvcmtfZXhp
dCgpIGF0IGZvcmtfZXhpdCsweDg0L2ZyYW1lIDB4ZmZmZmZlMDAzYjk2OGFiMApBcHIgMjYgMTU6
MzU6NTguNTU5OTkxIGZvcmtfdHJhbXBvbGluZSgpIGF0IGZvcmtfdHJhbXBvbGluZSsweGUvZnJh
bWUgMHhmZmZmZmUwMDNiOTY4YWIwCkFwciAyNiAxNTozNTo1OC41NjAwNTcgLS0tIHRyYXAgMCwg
cmlwID0gMCwgcnNwID0gMCwgcmJwID0gMCAtLS0KQXByIDI2IDE1OjM1OjU4LjU3MTk5NyBLREI6
IGVudGVyOiBwYW5pYwpBcHIgMjYgMTU6MzU6NTguNTcyMDU2IFsgdGhyZWFkIHBpZCAxMyB0aWQg
MTAwMDI5IF0KQXByIDI2IDE1OjM1OjU4LjU3MjEwNCBTdG9wcGVkIGF0ICAgICAga2RiX2VudGVy
KzB4M2I6IG1vdnEgICAgJDAsa2RiX3doeQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
