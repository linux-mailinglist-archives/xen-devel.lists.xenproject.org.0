Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AC37599
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 15:46:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYsfh-0002Zj-W7; Thu, 06 Jun 2019 13:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MvxL=UF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYsfg-0002Ze-ME
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 13:43:12 +0000
X-Inumbo-ID: 04c46138-8861-11e9-86e9-67d139448044
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04c46138-8861-11e9-86e9-67d139448044;
 Thu, 06 Jun 2019 13:43:09 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zfQ3veswxQS4UePnzlDyGGn/OG0E65FepnmggwiwW3DWYIPRzD9b26BHzHS7Ag2migCZCAtYzh
 8jTJRI1xsJ7MvMa0ppo83UoXW1ejwnBEeRnKCrIZaioizkGPBnJKZfGKS04YvbbOYFfe70I+or
 UE7dwrrZQ04TlY5H6sxyqK36hIknPjl1roprzMhXUTP9zEHvpvb16cEXgLhFZb7XfPcNGEgdMj
 6xBgUf9Nk4mxjn/yQQEcTSVc3em/1J4lAG9vEOYJzoPVTxI61zkA2DcufjdfLUsxA6L2g2GfeZ
 oRQ=
X-SBRS: -0.9
X-MesageID: 1404049
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1404049"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23801.6220.124866.690504@mariner.uk.xensource.com>
Date: Thu, 6 Jun 2019 14:42:36 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-137274-mainreport@xen.org>
References: <osstest-137274-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-unstable test] 137274: regressions - FAIL
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

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tdW5zdGFibGUgdGVzdF0gMTM3Mjc0
OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM3Mjc0IHhlbi11bnN0YWJsZSByZWFs
IFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xMzcyNzQvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBz
dWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5v
dCBiZSBydW46Cj4gIHRlc3QtYXJtNjQtYXJtNjQtZXhhbWluZSAgICAxMSBleGFtaW5lLXNlcmlh
bC9ib290bG9hZGVyIGZhaWwgUkVHUi4gdnMuIDEzNzAzMwo+IAoKVGhpcyBpcyBleHBlY3RlZC4K
Cj4gdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKPiAgeGVuICAgICAgICAgICAgICAgICAg
ODQ0YWEwYTEzZDM0ZTlhMzQxYTgzNzQxMTlkMmVkNjdkNGRjZDZiYgo+IGJhc2VsaW5lIHZlcnNp
b246Cj4gIHhlbiAgICAgICAgICAgICAgICAgIDgxNjQ2Y2VhODI2ZmEzMjI4MzFmZmZiNDNmODFl
N2UwODY2ZGMxMjQKCkZvcmNlIHB1c2hlZC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
