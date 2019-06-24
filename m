Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FFA50DEA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 16:27:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfPtm-0005Pm-Nv; Mon, 24 Jun 2019 14:24:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BtIA=UX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hfPtk-0005Ph-AY
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 14:24:44 +0000
X-Inumbo-ID: cd46c596-968b-11e9-b96e-479c11f399a4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd46c596-968b-11e9-b96e-479c11f399a4;
 Mon, 24 Jun 2019 14:24:40 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Zv6ql8nQ7XAEaxqW7iClPeF+oiq9HbZV3J8B4x+vQed8sm8UYasZOMUJOPWRByhjCp9XUNPwqo
 vjYC0uwKap+HvmY27xToF0kZj+J8chnOA7KPYD9FRk0FULOO02/sAokMk8ClRFy/1P/QZylGX7
 pcFC9wPSptueB9F03lena+KEuhwDb4s1kw3pKDRJ19tP3DlC3WshtMAJ27X4dpcHPLgx7bmlR1
 Pnc6tGGUNw44PgRR1FTyAC9oGLCXfuCa3nwR7CuZUd8fsKy6hutmNnOETgdUmbe4hjN7ZER1fG
 xLo=
X-SBRS: 2.7
X-MesageID: 2143886
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2143886"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23824.56583.488225.205300@mariner.uk.xensource.com>
Date: Mon, 24 Jun 2019 15:24:07 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <23824.56091.124052.340656@mariner.uk.xensource.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.6-testing test] 138333: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBJYW4gSmFja3NvbiB3cml0ZXMgKCJSZTogW3hlbi00LjYt
dGVzdGluZyB0ZXN0XSAxMzgzMzM6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gVGhlc2UgYWxs
IGhhdmUgYHFlbXV0JyBpbiBjb21tb24uCj4gCj4gSSBzdGlsbCB0aGluayB0aGlzIGlzIHRydWUg
KGxhcmdlbHkgYXQgbGVhc3QpLgo+IAo+ID4gIFRoZSBjb3JyZXNwb25kaW5nIHRlc3RzIGluIFhl
biA0LjcKPiA+IGFyZSBhbGwgY29tcGxldGV5IGJyb2tlbiByZWdhcmRsZXNzIG9mIHRoZSBxZW11
IHZlcnNpb24uLi4KPiAKPiBCdXQgdGhpcyBpcyB3cm9uZy4KCkknbSB0cnlpbmcgYSB0ZXN0IHdp
dGggNC43J3MgdmVyc2lvbiBvZiBxZW11IHRyYWQuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
