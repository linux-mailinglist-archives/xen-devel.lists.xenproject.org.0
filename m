Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F723697
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 14:55:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hShmN-0006Xg-DQ; Mon, 20 May 2019 12:52:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hShmM-0006Xb-8x
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 12:52:34 +0000
X-Inumbo-ID: 2197f70c-7afe-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2197f70c-7afe-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 12:52:32 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: p3UC4ndLJC/X1KNjhiZSoX56g+vhv62Tnb/kk23Lu3/ZozMqNIQphAybS1suhoWPPPaEdmESQR
 O1aCvi+XLU1MysU29vYL/qeOYnA5fXpEl8kHAP5OZnGlTZ3hoKPzAKIIGSarE4wPgvsKL0Z+G6
 nZmq9BBMyFx2/hDPgw9LV+/O0kSL9qyZFqH5kIiaCwTxzGwijXempypt7l0RgjGHChyMQxiQhS
 m4iYE9syX208b5kIwS9whQQNVuQwFfzLHuETeo/jD5doCNf5QAy4ZQzcYtVoIskN+IGrHeDeRE
 1vQ=
X-SBRS: 2.7
X-MesageID: 647318
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="647318"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.41705.670026.133324@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 13:51:53 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CE28F0B020000780023090E@prv1-mh.provo.novell.com>
References: <osstest-136385-mainreport@xen.org>
 <23778.33200.47146.497482@mariner.uk.xensource.com>
 <5CE28F0B020000780023090E@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC4xMS10ZXN0aW5nIHRlc3RdIDEzNjM4NTog
cmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gT24gMjAuMDUuMTkgYXQgMTI6MzAsIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPiB3cm90ZToKPiA+IG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cml0ZXMgKCJb
eGVuLTQuMTEtdGVzdGluZyB0ZXN0XSAxMzYzODU6IHJlZ3Jlc3Npb25zIC0gCj4gPj4gIHRlc3Qt
YW1kNjQtYW1kNjQteGwtcWVtdXQtZGViaWFuaHZtLWFtZDY0IDEwIGRlYmlhbi1odm0taW5zdGFs
bCBmYWlsIFJFR1IuIHZzLiAxMzU2ODMKPiA+PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1k
ZWJpYW5odm0taTM4Ni14c20gMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDEz
NTY4Mwo+ID4gCj4gPiBUaGVzZSBhcmUgYSBrbm93biBidWcuICBUaGUgRGViaWFuICJzdHJldGNo
IiAoInN0YWJsZSIpIGkzODYga2VybmVsCj4gPiBzaW1wbHkgZG9lcyBub3Qgd29yayB1bmRlciBY
ZW4gSFZNLiAgSSBkb24ndCB0aG5rIHRoaXMgaXMgYW55dGhpbmcgdG8KPiA+IGRvIHdpdGggdGhl
IDQuMTEgWGVuIGNvbW1pdHMgdW5kZXIgdGVzdCBoZXJlLiAgSXQgaXMgYXBwZWFyaW5nIGhlcmUg
aW4KPiA+IHRoaXMgZmxpZ2h0IGJlY2F1c2UgSSByZW9yZ2FuaXNlZCB0aGUgYW1kNjQvaTM4NiB0
ZXN0IGpvYnMuCj4gCj4gRGlkIHRoaXMgcmVvcmcgaW5jbHVkZSBhIGNoYW5nZSBpbiB0aGUgbmFt
aW5nIHNjaGVtZT8gSSBhc2sgYmVjYXVzZQo+IG9ubHkgdGhlIGxhdHRlciBvZiB0aGUgdHdvIGlu
Y2x1ZGVzICJpMzg2IiBpbiB0aGUgbmFtZSwgaS5lLiBieSB0aGUKPiBrbm93biB0byBtZSBuYW1p
bmcgbW9kZWwgdGhlIGZvcm1lciBvdWdodCB0byB1c2UgYSA2NC1iaXQgZ3Vlc3QuCgpZb3UgYXJl
IHJpZ2h0LiAgSHJycm0uICBJIHdpbGwgaW52ZXN0aWdhdGUgZnVydGhlci4KCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
