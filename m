Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE965D3F9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:12:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLLZ-0007L7-Pg; Tue, 02 Jul 2019 16:09:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PGFi=U7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hiLLX-0007Kw-QA
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:09:31 +0000
X-Inumbo-ID: c32ae75a-9ce3-11e9-9c15-f7eab8ad562f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c32ae75a-9ce3-11e9-9c15-f7eab8ad562f;
 Tue, 02 Jul 2019 16:09:26 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iIBbrqBQso6y4OIlycD7Xw5YMT2Oh9huBpK7fw6GTVZrLmG7XHSasYWnrPa2n2w6d9kkRhT1bh
 3IBvEvLu4brlIfcSTSaFTNUe9bmINhqW+mtQg4Qr7q5rw2khDQJ9yV/UFYAzcNYHpDW+Jsq4Xp
 +aLJ689KnpR5r8z7EUVvJGy+9kQe83ryi3IfXa1M6MpnzWJ5opE9Sd+BSKYuTzw+wlAQHbmpPD
 i9n5rxEiy5qwiWGg4gpX1IsGl5TmoUKcuK8txAS39s9H9x6fGyLeVTSecKWMCLIyr9AP9wS9ux
 r1s=
X-SBRS: 2.7
X-MesageID: 2525460
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2525460"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23835.32310.866390.628085@mariner.uk.xensource.com>
Date: Tue, 2 Jul 2019 16:54:30 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1907020823390.14636@sstabellini-ThinkPad-T480s>
References: <20190702135327.26543-1-anthony.perard@citrix.com>
 <alpine.DEB.2.21.1907020823390.14636@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add Anthony as libxl maintainer
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIE1BSU5UQUlORVJTOiBBZGQg
QW50aG9ueSBhcyBsaWJ4bCBtYWludGFpbmVyIik6Cj4gT24gVHVlLCAyIEp1bCAyMDE5LCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IENyZWF0ZSBhIG5ldyBzZWN0aW9uIHdpdGggb25seSBsaWJ4
bC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KCj4gPiBJJ3ZlIGNyZWF0ZWQgYSBuZXcgc2VjdGlvbiBmb3Igb25seSBsaWJ4ZW5s
aWdodCBidXQgaWYgeW91IHdvdWxkCj4gPiBwcmVmZXIgdG8gYWRkIG1lIGludG8gVE9PTFNUQUNL
IGluc3RlYWQsIHRoYXQgbWlnaHQgYmUgb2suIEkganVzdAo+ID4gZG9uJ3QgaGF2ZSBtdWNoIGV4
cGVyaWVuY2Ugd2l0aCB0aGUgcmVzdCBvZiB0b29scy8uCgpJIGRvbid0IGhhdmUgYW4gb3Bpbmlv
biBhYm91dCB0aGlzLCBidXQgaWYgQW50aG9ueSBwcmVmZXJzIHRvIHN0aWNrCndpdGggbGlieGwg
KGV2ZW4gaWYgb25seSBmb3Igbm93KSB0aGF0IGlzIGZpbmUgYnkgbWUuCgpUaGFua3MsCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
