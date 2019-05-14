Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708A1C82F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:07:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWAa-0005EQ-8H; Tue, 14 May 2019 12:04:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQWAY-0005E9-C5
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:04:30 +0000
X-Inumbo-ID: 6cbf6fce-7640-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6cbf6fce-7640-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:04:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 06:04:28 -0600
Message-Id: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 06:04:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZ1bmN0aW9uIHBhc3NlcyAwIGFzICJhbGxvYyIgYXJndW1lbnQgdG8gYWRkcl90b19kbWFf
cGFnZV9tYWRkcigpLApzbyAtRU5PTUVNIHNpbXBseSBtYWtlcyBubyBzZW5zZSAoYW5kIGl0cyB1
c2Ugd2FzIHByb2JhYmx5IHNpbXBseSBhCmNvcHktYW5kLXBhc3RlIGVmZmVjdCBvcmlnaW5hdGlu
ZyBhdCBpbnRlbF9pb21tdV9tYXBfcGFnZSgpKS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCkBAIC0xODcw
LDcgKzE4NzAsNyBAQCBzdGF0aWMgaW50IGludGVsX2lvbW11X2xvb2t1cF9wYWdlKHN0cnVjCiAg
ICAgaWYgKCAhcGdfbWFkZHIgKQogICAgIHsKICAgICAgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNo
Lm1hcHBpbmdfbG9jayk7Ci0gICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAgICByZXR1cm4g
LUVOT0VOVDsKICAgICB9CiAKICAgICBwYWdlID0gbWFwX3Z0ZF9kb21haW5fcGFnZShwZ19tYWRk
cik7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
