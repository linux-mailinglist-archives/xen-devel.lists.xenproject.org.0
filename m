Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A320165B12
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:04:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ifF-0006wz-MY; Thu, 20 Feb 2020 10:02:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4ifE-0006ws-04
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:02:36 +0000
X-Inumbo-ID: 1e461678-53c8-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e461678-53c8-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 10:02:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4ifC-00050s-Ki; Thu, 20 Feb 2020 10:02:34 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4ifC-00022L-CT; Thu, 20 Feb 2020 10:02:34 +0000
Date: Thu, 20 Feb 2020 00:51:23 +0000
From: Wei Liu <wl@xen.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200220005123.wtas2zrii4zgf3rz@debian>
References: <cover.1582143896.git.linux@eikelenboom.it>
 <a5d34e806a0798e411b405625d1ef74db998fc85.1582143896.git.linux@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5d34e806a0798e411b405625d1ef74db998fc85.1582143896.git.linux@eikelenboom.it>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/3] tools/xentop: Remove dead code
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDk6MzE6MzFQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlr
ZWxlbmJvb20uaXQ+Cj4gLS0tCgpJIHdpbGwgYWRkIHRoZSBmb2xsb3dpbmcgY29tbWl0IG1lc3Nh
Z2U6CgpUaGUgdmFyaWFibGUgZnJlZWFsYmVfbWIgd2FzIG5ldmVyIHJlYWxseSB1c2VkLiBEZWxl
dGUgaXQgYW5kIHRoZSBjb2RlCmFzc29jaWF0ZWQgd2l0aCBpdC4KCkFja2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgoKPiAgdG9vbHMveGVuc3RhdC94ZW50b3AveGVudG9wLmMgfCAxMCArKy0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0YXQveGVudG9wL3hlbnRvcC5jIGIvdG9vbHMv
eGVuc3RhdC94ZW50b3AveGVudG9wLmMKPiBpbmRleCAxM2I2MTJmMjZkLi5iYmI1ZDQ3Yjc2IDEw
MDY0NAo+IC0tLSBhL3Rvb2xzL3hlbnN0YXQveGVudG9wL3hlbnRvcC5jCj4gKysrIGIvdG9vbHMv
eGVuc3RhdC94ZW50b3AveGVudG9wLmMKPiBAQCAtOTQzLDcgKzk0Myw2IEBAIHZvaWQgZG9fc3Vt
bWFyeSh2b2lkKQo+ICAJICAgICAgICAgY3Jhc2ggPSAwLCBkeWluZyA9IDAsIHNodXRkb3duID0g
MDsKPiAgCXVuc2lnbmVkIGksIG51bV9kb21haW5zID0gMDsKPiAgCXVuc2lnbmVkIGxvbmcgbG9u
ZyB1c2VkID0gMDsKPiAtCWxvbmcgZnJlZWFibGVfbWIgPSAwOwo+ICAJeGVuc3RhdF9kb21haW4g
KmRvbWFpbjsKPiAgCXRpbWVfdCBjdXJ0Owo+ICAKPiBAQCAtOTcwLDE3ICs5NjksMTIgQEAgdm9p
ZCBkb19zdW1tYXJ5KHZvaWQpCj4gIAkgICAgICBudW1fZG9tYWlucywgcnVuLCBibG9jaywgcGF1
c2UsIGNyYXNoLCBkeWluZywgc2h1dGRvd24pOwo+ICAKPiAgCXVzZWQgPSB4ZW5zdGF0X25vZGVf
dG90X21lbShjdXJfbm9kZSkteGVuc3RhdF9ub2RlX2ZyZWVfbWVtKGN1cl9ub2RlKTsKPiAtCWZy
ZWVhYmxlX21iID0gMDsKPiAgCj4gIAkvKiBEdW1wIG5vZGUgbWVtb3J5IGFuZCBjcHUgaW5mb3Jt
YXRpb24gKi8KPiAtCWlmICggZnJlZWFibGVfbWIgPD0gMCApCj4gLQkgICAgIHByaW50KCJNZW06
ICVsbHVrIHRvdGFsLCAlbGx1ayB1c2VkLCAlbGx1ayBmcmVlICAgICIsCj4gKwlwcmludCgiTWVt
OiAlbGx1ayB0b3RhbCwgJWxsdWsgdXNlZCwgJWxsdWsgZnJlZSAgICAiLAo+ICAJICAgICAgeGVu
c3RhdF9ub2RlX3RvdF9tZW0oY3VyX25vZGUpLzEwMjQsIHVzZWQvMTAyNCwKPiAgCSAgICAgIHhl
bnN0YXRfbm9kZV9mcmVlX21lbShjdXJfbm9kZSkvMTAyNCk7Cj4gLQllbHNlCj4gLQkgICAgIHBy
aW50KCJNZW06ICVsbHVrIHRvdGFsLCAlbGx1ayB1c2VkLCAlbGx1ayBmcmVlLCAlbGRrIGZyZWVh
YmxlLCAiLAo+IC0JICAgICAgeGVuc3RhdF9ub2RlX3RvdF9tZW0oY3VyX25vZGUpLzEwMjQsIHVz
ZWQvMTAyNCwKPiAtCSAgICAgIHhlbnN0YXRfbm9kZV9mcmVlX21lbShjdXJfbm9kZSkvMTAyNCwg
ZnJlZWFibGVfbWIqMTAyNCk7Cj4gKwo+ICAJcHJpbnQoIkNQVXM6ICV1IEAgJWxsdU1IelxuIiwK
PiAgCSAgICAgIHhlbnN0YXRfbm9kZV9udW1fY3B1cyhjdXJfbm9kZSksCj4gIAkgICAgICB4ZW5z
dGF0X25vZGVfY3B1X2h6KGN1cl9ub2RlKS8xMDAwMDAwKTsKPiAtLSAKPiAyLjIwLjEKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
