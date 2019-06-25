Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680EC550B8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 15:48:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hflmK-0006Nt-GD; Tue, 25 Jun 2019 13:46:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XKpQ=UY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hflmI-0006Nk-BH
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 13:46:30 +0000
X-Inumbo-ID: a1d37725-974f-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1d37725-974f-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 13:46:28 +0000 (UTC)
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
IronPort-SDR: wdBHebGWuMI2i1NvUGG1I0ZcrWuJ+FlX1H6go8qVdwbKEvnDQapvnc8Amluzj1GCqGEPTDAlhW
 2VAnECqSMglkMhBHK/BCo4BOnm5NV/9rWQcSkvKZMWbILjQVE59AVCx0r4UKsq7YSqAoMqoEaJ
 2qBiuhFE2YvYo1OtucnkZYifv0h8qxa4NRrPGr3P86YPBsBNDucHMqA5woYn8S3ikwlVgCx5BT
 ZaodDHXnoJFbiUhOdFkBOMtbZbnlt9Nwb5L/tQ6VDwVYEN/Il/Ee6+Pss2PDw++fD8LDP+WTTi
 +LA=
X-SBRS: 2.7
X-MesageID: 2196164
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2196164"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23826.9614.731351.832085@mariner.uk.xensource.com>
Date: Tue, 25 Jun 2019 14:45:50 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190625133944.36588-1-roger.pau@citrix.com>
References: <20190625133944.36588-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] config: don't hardcode toolchain binaries
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSF0gY29uZmlnOiBkb24ndCBoYXJkY29kZSB0
b29sY2hhaW4gYmluYXJpZXMiKToKPiBDdXJyZW50bHkgdGhlIG5hbWVzIG9mIHRoZSBidWlsZCB0
b29sY2hhaW4gYmluYXJpZXMgYXJlIGhhcmRjb2RlZCBpbgo+IFN0ZEdOVS5taywgYW5kIHRoZSB2
YWx1ZXMgZnJvbSB0aGUgZW52aXJvbm1lbnQgYXJlIGlnbm9yZWQuCj4gCj4gU3dpdGNoIFN0ZEdO
VS5tayB0byB1c2UgJz89JyBpbnN0ZWFkIG9mICc9Jywgc28gdGhhdCB2YWx1ZXMgZnJvbSB0aGUK
PiBlbnZpcm9ubWVudCBhcmUgdXNlZCBpZiBwcmVzZW50LCBlbHNlIGRlZmF1bHQgdG8gdGhlIHZh
bHVlcyBwcm92aWRlZAo+IGJ5IHRoZSBjb25maWcgZmlsZS4KPiAKPiBUaGlzIGNoYW5nZSBmaXhl
cyB0aGUgZ2l0bGFiIENJIGxvb3AsIHRoYXQgd2FzIHJlbHlpbmcgb24gcGFzc2luZwo+IGN1c3Rv
bSB2YWx1ZXMgaW4gdGhlIGVudmlyb25tZW50IHZhcmlhYmxlcyBmb3IgdGhlIGNvbXBpbGVyIGFu
ZCB0aGUKPiBsaW5rZXIuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
