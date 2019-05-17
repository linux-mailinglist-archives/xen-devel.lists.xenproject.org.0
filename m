Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03C21B38
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 18:14:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRfRd-00027R-1r; Fri, 17 May 2019 16:10:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRfRc-00027K-9X
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:10:52 +0000
X-Inumbo-ID: 56a5dd51-78be-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56a5dd51-78be-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 16:10:50 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: famv8vIoPsnOKwXmdlWDIEhBOt4cUXzX4+f54NPc23fAuwffW2raCf5zapUcOXvZCrUq5Z+WxL
 OvnxVL++brFYBNdFnSsQh9HX+6uL5RC1nnLFsA38pvuZFjAhjYmYO80gGJhP49umuplXBqyFpI
 9BJqsXEehd3N/AgHDdYiqJtajO4zHiyWMcaVLRXJUrDr4EFj53LdCD1OIdZwWLMiAWTo6ucC4Q
 pmljpkuuEHr0A0LTbPFkPpH92+R3Q+5aDDcpUU6mGyPpbOpwfRscsAuoBi3ewhp7+XkWW2y+a8
 OpY=
X-SBRS: 2.7
X-MesageID: 589638
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="589638"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23774.56553.445601.436491@mariner.uk.xensource.com>
Date: Fri, 17 May 2019 17:10:17 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
References: <osstest-135420-mainreport@xen.org>
 <23752.17186.527512.614163@mariner.uk.xensource.com>
 <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] qcom_scm: Incompatible pointer type build failure
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "david.brown@linaro.org" <david.brown@linaro.org>,
 "andy.gross@linaro.org" <andy.gross@linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoInFjb21fc2NtOiBJbmNvbXBhdGlibGUgcG9pbnRlciB0eXBl
IGJ1aWxkIGZhaWx1cmUiKToKPiBUaGFuayB5b3UgZm9yIHRoZSByZXBvcnQuCi4uLj4gCj4gT24g
MzAvMDQvMjAxOSAxMzo0NCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBvc3N0ZXN0IHNlcnZpY2Ug
b3duZXIgd3JpdGVzICgiW2xpbnV4LTQuMTkgdGVzdF0gMTM1NDIwOiByZWdyZXNzaW9ucyAtIEZB
SUwiKToKPiA+ICAgIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uYzogSW4gZnVuY3Rpb24gw6Li
gqzLnHFjb21fc2NtX2Fzc2lnbl9tZW3DouKCrOKEojoKPiA+ICAgIGRyaXZlcnMvZmlybXdhcmUv
cWNvbV9zY20uYzo0Njk6NDc6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2Ygw6LigqzLnGRt
YV9hbGxvY19jb2hlcmVudMOi4oKs4oSiIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBb
LVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KLi4uCj4gPiBJIHRoaW5rIHRoaXMg
YnVpbGQgZmFpbHVyZSBpcyBwcm9iYWJseSBhIHJlZ3Jlc3Npb247IHJhdGhlciBpdCBpcyBkdWUK
PiA+IHRvIHRoZSBzdHJldGNoIHVwZGF0ZSB3aGljaCBicmluZ3MgaW4gYSBuZXcgY29tcGlsZXIu
Cj4gCj4gVGhlIGJ1ZyBoYXMgYWx3YXlzIGJlZW4gcHJlc2VudCAoYW5kIHN0aWxsIHByZXNlbnQg
aW4gbWFzdGVyKSwgaXQgaXMgcG9zc2libGUgCj4gdGhlIGNvbXBpbGVyIGJlY2FtZSBzbWFydGVy
IHdpdGggdGhlIHVwZ3JhZGUgdG8gc3RyZXRjaC4KPiAKPiBUaGUgcHJvYmxlbSBpcyBzaW1pbGFy
IHRvIFsxXSBhbmQgaGFwcGVuIHdoZW4gdGhlIHNpemUgb2YgcGh5c19hZGRyX3QgaXMgCj4gZGlm
ZmVyZW50IHRvIGRtYV9hZGRyX3QuCj4gCj4gSSBoYXZlIENDZWQgdGhlIG1haW50YWluZXJzIG9m
IHRoaXMgZmlsZS4KClRoYXQgd2FzIHNldmVyYWwgd2Vla3MgYWdvIGFuZCBvc3N0ZXN0IGlzIHN0
aWxsIGJsb2NrZWQgb24gdGhpcy4KQ2FuIHlvdSBwbGVhc2UgYWR2aXNlIHdoYXQgQ09ORklHXyog
dG8gZGlzYWJsZSB0byB3b3JrIGFyb3VuZCB0aGlzID8KCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
