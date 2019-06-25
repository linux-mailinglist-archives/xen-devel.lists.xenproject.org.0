Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6154CD7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 12:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfj3g-0000Vo-0y; Tue, 25 Jun 2019 10:52:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XKpQ=UY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hfj3e-0000Vj-Of
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 10:52:14 +0000
X-Inumbo-ID: 4762d99a-9737-11e9-9c15-ebaedd17e62a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4762d99a-9737-11e9-9c15-ebaedd17e62a;
 Tue, 25 Jun 2019 10:52:09 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3/dx9feWD6l2MnwmoewZDrlZUfdU3vAj7KzDi/BsC0vGridf2LPUjxCjQgxNQ9Q7vjA/8DLga9
 XzdowT/XTzdkIUdUKkl+eMdcPyF5YX/cvmO28mdq6pWow25JlwWr92QJfafhuVznvxHctx2ddE
 EplkI/jxsry6FNC5dqN4bVYr1ETj9q9BK8Q5JildZL6y2x79g4ys/C58rDfVcBnihAMsqwM6tB
 BSAWUuR68xCxnicWA6ZzOkAy1Y/KvxBbjiq9cVsV/UPyDw8Y50grk7FetE+wxqGBjVfG2ithyv
 y0E=
X-SBRS: 2.7
X-MesageID: 2199724
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2199724"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23825.64696.25926.318881@mariner.uk.xensource.com>
Date: Tue, 25 Jun 2019 11:51:36 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <23824.56583.488225.205300@mariner.uk.xensource.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
 <23824.56583.488225.205300@mariner.uk.xensource.com>
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
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBJYW4gSmFja3NvbiB3cml0ZXMgKCJSZTogW3hlbi00LjYt
dGVzdGluZyB0ZXN0XSAxMzgzMzM6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gSWFuIEphY2tz
b24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiByZWdyZXNzaW9u
cyAtIEZBSUwiKToKPiA+ID4gVGhlc2UgYWxsIGhhdmUgYHFlbXV0JyBpbiBjb21tb24uCi4uLgo+
IEknbSB0cnlpbmcgYSB0ZXN0IHdpdGggNC43J3MgdmVyc2lvbiBvZiBxZW11IHRyYWQuCgpUaGlz
IGRvZXMgbm90IHdvcmsuICA0LjcncyBxZW11IHRyYWQgZG9lc24ndCBidWlsZCBiZWNhdXNlIG9m
IHRvb2xzCmxpYnJhcnkgcmVvcmdhbmlzYXRpb24uICBSZXZlcnRpbmcgdGhvc2UgY2hhbmdlcyB0
byA0LjcgcHJvZHVjZXMgYQpxZW11IHRyYWQgdGhhdCBpcyBpZGVudGljYWwgdG8gNC42J3MuICBT
byB0aGUgcmVncmVzc2lvbiBpcyBub3QgaW4KcWVtdS4KCkkgc3VzcGVjdCBhIGZpcm13YXJlIG9y
IGh2bWxvYWRlciBwcm9ibGVtLgoKVGhpcyBpcyBibG9ja2luZyB1cyBnZXR0aW5nIGEgcHVzaCBm
b3IgdGhlIFhlbiA0Ljggc3RhYmxlIGJyYW5jaGVzOgoKV2Ugd2FudCB0byB0ZXN0IDQuNy0+NC44
IG1pZ3JhdGlvbiwgc28gd2UgbXVzdCBidWlsZCA0LjcgdG8gdGVzdCA0LjguCkJ1dCA0Ljcgc3Rh
YmxlIGRvZXMgbm90IGJ1aWxkIChvbiBzdHJldGNoKSBhbmQgYSBwdXNoIG9mIDQuNyBpcwpibG9j
a2VkIGJlY2F1c2U6CgpXZSB3YW50IHRvIHRlc3QgNC42LT40LjcgbWlncmF0aW9uLCBzbyB3ZSBt
dXN0IGJ1aWxkIDQuNiB0byB0ZXN0IDQuNy4KQnV0IDQuNiBzdGFibGUgZG9lcyBub3QgYnVpbGQg
KG9uIHN0cmV0Y2gpIGFuZCBhIHB1c2ggb2YgNC42IGlzCmJsb2NrZWQgYmVjYXVzZToKCjQuNiBz
dGFnaW5nIGRvZXMgbm90IGJvb3QgaHZtIGd1ZXN0cyB3aXRoIHFlbXUgdHJhZC4KCihUaGVyZSBt
YXkgYmUgb3RoZXIgcHJvYmxlbXMgdG9vLikKCklmIHdlIHdlcmUgdG8gZm9yY2UgcHVzaCA0LjYg
dGhlbiB0aG9zZSBtaWdyYXRpb24gdGVzdHMgb2YgNC42LT40LjcKdGhhdCB1c2UgcWVtdS10cmFk
IHdvdWxkIGZhaWwgYmVjYXVzZSBvZiB0aGUgc2FtZSBidWcuCgpXZSBjb3VsZCBjaG9vc2UgdG8g
Zm9yY2UgcHVzaCA0LjcgZGVzcGl0ZSBub3Qga25vd2luZyB3aGV0aGVyIDQuNi0+NC43Cm1pZ3Jh
dGlvbiBzdGlsbCB3b3Jrcy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
