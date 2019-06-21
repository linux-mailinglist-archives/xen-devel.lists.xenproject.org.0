Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324CF4EA83
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKS4-00088x-Tb; Fri, 21 Jun 2019 14:23:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKS3-00088s-Uu
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:23:39 +0000
X-Inumbo-ID: 27cff6c6-9430-11e9-89f2-675f51a7cccc
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27cff6c6-9430-11e9-89f2-675f51a7cccc;
 Fri, 21 Jun 2019 14:23:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C2XC06Wc/xYuTpVbCmliAhxlx+rI6AWrX/21f8Lkj9SvzfBsKJAwd22oJrA98c5/dNatxCLOmF
 7yrvkJHWN5PFujXGibFoIzRk6AK287FNh2DjwsLWt8eOICd+JJhh7eg8cXt1tzFyI/+5//viq/
 D5KF5lnrjDtgvUzGtDoUHcwbhRruwaJnMHiqXnpyjyqOxJcG88DAcuY91MZacWbOnsnGgpO1QR
 PqCwAxga9NEwYDFBqsmz0yD/ILJ8z6t7Y1vljSEMqk4RkXUQsh9WdpfQAoNRepHqb1idmSeO1E
 Eqg=
X-SBRS: 2.7
X-MesageID: 2085585
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2085585"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:50 +0100
Message-ID: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 0/8] mg-repro-* improvements
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmaXhlcyBidWdzIEkgZm91bmQgdHJ5aW5nIHRvIHVzZSB0aGUgbGFzdCB2ZXJzaW9uIG9m
IHRoaXMgc2VyaWVzLgpUaGlzIHZlcnNpb24gaGFzIGJlZW4gdXNlZCBzdWNjZXNzZnVsbHkuCgpJ
YW4gSmFja3NvbiAoOCk6CiAgbWctdHJhbnNpZW50LXRhc2s6IE5ldyB1dGlsaXR5CiAgbWctdHJh
bnNpZW50LXRhc2s6IFB1dCB0aGUgb3duZCBmZCBvbiBhIGhpZ2ggZmQsIHNheSwgMTE0CiAgbWct
cmVwcm8tc2V0dXA6IERvIGFsbCBidWlsZHMgaW4gdGhlaXIgb3duIHRhc2tzLCByZWdhcmRsZXNz
CiAgbWctcmVwcm8tc2V0dXA6IERvIG5vdCBpbXBseSB0aGF0IGEgLS1yZWJ1aWxkIG5lZWRzIGEg
K1RSRUUKICBtZy1yZXByby1zZXR1cDogSW50cm9kdWNlIGBzdGF0aWN0YXNrJyB2YXJpYWJsZQog
IG1nLXJlcHJvLXNldHVwOiBOZXcgbW9kZSAtLWF1dG9hbGxvYwogIG1nLXJlcHJvLXNldHVwOiBh
Y3R1YWxseSBhY2NlcHQgLS1yZWJ1aWxkIC1yVkFSPVZBTFVFCiAgbWctcmVwcm8tc2V0dXA6IERv
IG5vdCB3cm9uZ2x5IHJlamVjdCBtdWx0aXBsZSAtLXJlYnVpbGQKCiBjcy1hZGp1c3QtZmxpZ2h0
ICAgICAgICB8ICAyICstCiBtZy1yZXByby1zZXR1cCAgICAgICAgICB8IDUzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIG1nLXRyYW5zaWVudC10YXNr
ICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRjbC9Kb2JEQi1F
eGVjdXRpdmUudGNsIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspLCAx
NyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSBtZy10cmFuc2llbnQtdGFzawoKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
