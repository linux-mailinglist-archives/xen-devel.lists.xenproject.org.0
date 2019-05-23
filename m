Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7827A4E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:22:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkpQ-0003bM-VL; Thu, 23 May 2019 10:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wok1=TX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hTkpP-0003YV-Ib
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:20:03 +0000
X-Inumbo-ID: 507947d8-7d44-11e9-a527-2b481141cca1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 507947d8-7d44-11e9-a527-2b481141cca1;
 Thu, 23 May 2019 10:19:57 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: pUVkGr1KGyYFvrWyT/r66qtU3wHx7H+HDYBRn1EbvMwxcGMNA4cMtP7YUTXnvXIWPt9f8vjFuY
 eOQTXKz47OI02CuczVz2qgrlwr7Gl02M+rvrioFJybz4RWnYHwAzDDfZ4njt977Jj+4HBTL4l1
 H6VRws7zbx9ogYAuci3kL0RShF1/j3b2yMOfR9ywJPu4SVDlPlszpoxAXCCF7GCrUdoG64t1Dc
 AeemIvoqUMNFxizLVoXsH1ujl2WS008NzApDIgok8lJ5wuAN82iLIZqEPY/jJcZd6XB3jqg0Z2
 Fd0=
X-SBRS: 2.7
X-MesageID: 828361
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="828361"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23782.29612.522998.536824@mariner.uk.xensource.com>
Date: Thu, 23 May 2019 11:19:24 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190220170001.32614-6-roger.pau@citrix.com>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-6-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 5/6] osstest: introduce a script to build a
 FreeBSD package repository
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCA1LzZdIG9zc3Rlc3Q6
IGludHJvZHVjZSBhIHNjcmlwdCB0byBidWlsZCBhIEZyZWVCU0QgcGFja2FnZSByZXBvc2l0b3J5
Iik6Cj4gVGhlIGJ1aWxkaW5nIG9mIHRoZSBiaW5hcnkgcGFja2FnZXMgaXRzZWxmIGlzIGRvbmUg
d2l0aCB0aGUgcG91ZHJpZXJlCj4gdG9vbCwgdGhhdCBnaXZlbiBhIHNldCBvZiBwb3J0IG5hbWVz
IGdlbmVyYXRlcyBhIGJpbmFyeSBwYWNrYWdlCj4gcmVwb3NpdG9yeSB3aXRoIHRoZSByZXF1ZXN0
ZWQgcGFja2FnZXMgYW5kIGFsbCBpdCdzIGRlcGVuZGVuY2llcy4KLi4uCj4gIGFwLWNvbW1vbiAg
ICAgICAgICAgICAgICAgfCAgIDYgKysKPiAgYXAtZmV0Y2gtdmVyc2lvbiAgICAgICAgICB8ICAx
OSArKystLQo+ICBjci1kYWlseS1icmFuY2ggICAgICAgICAgIHwgIDU3ICsrKysrKysrKy0tLS0t
LQoKSSB3YW50IHRvIHRhbGsgc2VwYXJhdGVseSBhYm91dCB0aGUgY3ItZGFpbHktYnJhbmNoIGFu
ZCByZWxhdGVkCnRoaW5ncy4KCkFsc28sIHBhdGNoZXMgbGlrZSB0aGlzIGFyZSB1c3VhbGx5IG1v
cmUgY29udmVuaWVudGx5IHNwbGl0IHVwLiAgVGhhdAp3YXkgSSBjYW4gYWNrIHRoZSBsZXNzIGRp
ZmZpY3VsdCBwYXJ0cyBzZXBhcmF0ZWx5LgoKPiAgdHMtZnJlZWJzZC1idWlsZC1wYWNrYWdlcyB8
IDE0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBzZy1ydW4tam9i
ICAgICAgICAgICAgICAgIHwgICA5ICsrLQo+ICBtYWtlLWZyZWVic2QtZmxpZ2h0ICAgICAgIHwg
ICA4ICsrLQoKQXQgdGhlIHZlcnkgbGVhc3Qgc3BsaXQgdGhlc2UgdGhyZWUgb3V0LiAgQnV0IG1h
eWJlIHlvdSB3YW50IHRvIHNwbGl0CnRoZW0gaW50byB0d28gb3IgdGhyZWUuCgpJJ2xsIHJlYWQg
dGhlc2Ugbm93Li4uCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
