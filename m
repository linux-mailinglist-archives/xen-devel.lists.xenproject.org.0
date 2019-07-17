Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A676C6C000
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 19:00:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnnFW-0006CX-O1; Wed, 17 Jul 2019 16:57:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVrS=VO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hnnFV-0006CS-94
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:57:49 +0000
X-Inumbo-ID: 00e2fb73-a8b4-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 00e2fb73-a8b4-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 16:57:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FiT9Lxn358tuIfvC931Qcr/nceTLIGrgGPy8ms771V5vIgyfVCYaT34e6BDiX0zt9eNbfzOWZi
 h1LYNEnnVLw/+BCG7f1S64HqYCiUbDHRG8SomsCcl47NC99/RNFHu63+02lwZqWjMEtVE7XA/L
 lZrMVQ3K/0xUt+LFE5nw84xMFa0nWF/ru4kdEU+rl2hYIylBuWuFM6Phvu4EiF5fPAXP6bMPp1
 Fx2YhB0pK+3DNJ+PVHjMgOZocAUgGwgPtz5sLpJavKHOw5oJNWvnRJGSW4Qp4o/gJ70xx/PI9J
 Kg0=
X-SBRS: 2.7
X-MesageID: 3121604
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,275,1559534400"; 
   d="scan'208";a="3121604"
Date: Wed, 17 Jul 2019 17:57:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190717165744.GA2842@perard.uk.xensource.com>
References: <ef1133c1-6e6e-c80f-168d-2bebb0df23d5@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef1133c1-6e6e-c80f-168d-2bebb0df23d5@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] Design session notes: Build system gripe session
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDI6Mjc6MjdQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPciB1c2UgQW5kcm9pZCdzIGJ1aWxkIHN5c3RlbT8KCkkgbmV2ZXIgd29ya2VkIHdp
dGggQU9TUCdzIHNvdXJjZXMsIGJ1dCBhZnRlciByZWFkaW5nCmh0dHBzOi8vZWxpbnV4Lm9yZy9B
bmRyb2lkX0J1aWxkX1N5c3RlbQp0aGUgYnVpbGQgc3lzdGVtIHNlZW1zIHF1aXRlIGhlbHBmdWwu
CgpJZiB3ZSBjYW4gZG8gdGhlIGZvbGxvd2luZyB0byBidWlsZCBsaWJ4bCwgSSB0aGluayB3ZSBj
b3VsZCBsaXZlIHdpdGggYQpzaW1pbGFyIGJ1aWxkIHN5c3RlbToKICAgIG1ha2UgbGlieGwKb3IK
ICAgIC4gYnVpbGQvZW52c2V0dXAuc2gKICAgIGNkIHRvb2xzL2xpYnhsCiAgICBtbWEKClJpZ2h0
IG5vdywgYnVpbGRpbmcganVzdCBsaWJ4bCBpcyBjb21wbGljYXRlZCwgb25lIG5lZWRzIHRvIGZp
Z3VyZSBvdXQKYWxsIHRoZSBkZXBlbmRlbmNpZXMgb3IgYnVpbGQgYWxsIHRvb2xzLy4KCkJ1dCBJ
IGRvbid0IGtub3cgaG93IC4vY29uZmlndXJlIHdvdWxkIHdvcmsgd2l0aCB0aGF0LCBvciBpZiBp
dCBpcwpuZWVkZWQuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
