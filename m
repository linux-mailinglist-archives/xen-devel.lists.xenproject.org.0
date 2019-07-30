Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4887A708
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 13:34:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQLz-00016y-JM; Tue, 30 Jul 2019 11:31:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oneA=V3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hsQLy-00016t-6E
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:31:38 +0000
X-Inumbo-ID: 95d97420-b2bd-11e9-ad21-bb343a75f158
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95d97420-b2bd-11e9-ad21-bb343a75f158;
 Tue, 30 Jul 2019 11:31:34 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8M8rAe8dwilCuPEo0+kBY6Lb4WIIASbFBWI1WXkzxdTCtGQpKtvI9593SAaUtldzZAX9dkIyfN
 2Q86MNL0UprYQpDxqDG44te7lbj1s/oLl5NBaikB9OEMpqk84r8OFMh9ISCXggqL9+abpNQ/Nv
 ItH83h9jiYQvBPnXxE1qnmu0/vK6I0glHNkttxwHC8cRO96EFb7unc6wL9mygTLb0TLBCyK5K1
 /l7VSJz9gK1rHEFpAOBsKAERkgDDt3d/a9zH2lW76uE+5MCyJOioVWI2Z3If7cYJRAtP7OP/LG
 zss=
X-SBRS: 2.7
X-MesageID: 3618049
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3618049"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23872.10866.30445.536510@mariner.uk.xensource.com>
Date: Tue, 30 Jul 2019 12:30:58 +0100
To: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <DA30FA07-2D81-47C4-8A53-DAABF14B6749@xenproject.org>
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
 <DA30FA07-2D81-47C4-8A53-DAABF14B6749@xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC] XCP-ng subproject proposal
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <lambert.olivier@gmail.com>,
 Committers <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1JGQ10gWENQLW5nIHN1YnByb2pl
Y3QgcHJvcG9zYWwiKToKPiBIaSBldmVyeW9uZSwKPiAKPiBhZGRpbmcgY29tbWl0dGVycywgd2hv
IHdvdWxkIG5lZWQgdG8gdm90ZSBmb3Igb3IgYWdhaW5zdCB0aGUgcHJvcG9zYWwuIFRoZSB0aXRs
ZSBwcm9iYWJseSBkb2VzIG5vdCBuZWVkIGFuIFJGQywgd2hpY2ggaXMgd2h5IG5vLW9uZSBsb29r
ZWQgYXQgaXQgc28gZmFyCj4gCj4gSSB0aGluayB0aGlzIGlzIGEgZ3JlYXQgaWRlYSBhbmQgSSB3
b3VsZCB3YW50IHRvIHdlbGNvbWUgWENQLW5nIGludG8gdGhlIHByb2plY3Q6IHdpdGggdGhpcyBp
biBtaW5kLCBJIHZvdGUgKzEKCisxIGZyb20gbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
