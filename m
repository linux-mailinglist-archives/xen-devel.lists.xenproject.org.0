Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC350DAD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 16:18:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfPkC-0004VE-9x; Mon, 24 Jun 2019 14:14:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BtIA=UX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hfPkA-0004V9-UZ
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 14:14:50 +0000
X-Inumbo-ID: 6b4f07b4-968a-11e9-b3da-7f95b43e9200
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b4f07b4-968a-11e9-b3da-7f95b43e9200;
 Mon, 24 Jun 2019 14:14:46 +0000 (UTC)
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
IronPort-SDR: ebl4rl9Y4jC2WyuQAsqGZkcPdmZEOjKlZ7OTfCkajiLMRfapQEhOfyCC7nb3FRzeBCwaBZr3lr
 YwntGkAYbdLzPduc8KEusYCOqRrxk+vNvKhEXMO8pEi1sE7s527TCLxeZCeGf5KHgE9q62AAgs
 OtXYGvcqdTWWmA55Kt39cegFKwAakzDIWqJslaU5HyEevOs6Tvk3czm8DKAHxSMhXvVEF9q/u7
 A01+R7DaAefh6KA/sBYxhuok2rAXf2sIs43+qRnuUSa5sCTtE/oxTbZjrm4SbhFfzX9tRCb5AO
 kMU=
X-SBRS: 2.7
X-MesageID: 2155339
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2155339"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23824.55987.139222.778619@mariner.uk.xensource.com>
Date: Mon, 24 Jun 2019 15:14:11 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-138333-mainreport@xen.org>
References: <osstest-138333-mainreport@xen.org>
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

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4
MzMzOiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM4MzMzIHhlbi00LjYtdGVzdGlu
ZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMzgzMzMvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNv
dWxkIG5vdCBiZSBydW46Cj4gIHRlc3QtYW1kNjQtYW1kNjQtbWlncnVwZ3JhZGUgMjIgZ3Vlc3Qt
bWlncmF0ZS9zcmNfaG9zdC9kc3RfaG9zdCBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKLi4uCj4gIHRl
c3QtYW1kNjQtaTM4Ni1taWdydXBncmFkZSAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9o
b3N0IGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LWRl
Ymlhbmh2bS1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTI3Nzky
Cj4gIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNt
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2
NC1pMzg2LXhsLXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbSAxMCBkZWJpYW4taHZt
LWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtaTM4Ni1xZW11dC1y
aGVsNmh2bS1hbWQgMTAgcmVkaGF0LWluc3RhbGwgICAgIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+
ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXQtZGViaWFuaHZtLWFtZDY0IDEwIGRlYmlhbi1odm0t
aW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2NC1pMzg2LXFlbXV0LXJo
ZWw2aHZtLWludGVsIDEwIHJlZGhhdC1pbnN0YWxsICAgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4g
IHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQtd2luNy1hbWQ2NCAxMCB3aW5kb3dzLWluc3RhbGwg
IGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXdzMTYt
YW1kNjQgMTAgd2luZG93cy1pbnN0YWxsICBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1h
bWQ2NC1pMzg2LXhsLXFlbXV0LXdpbjctYW1kNjQgMTAgd2luZG93cy1pbnN0YWxsICAgZmFpbCBS
RUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dC13czE2LWFtZDY0IDEw
IHdpbmRvd3MtaW5zdGFsbCAgIGZhaWwgUkVHUi4gdnMuIDEyNzc5MgoKVGhlc2UgYWxsIGhhdmUg
YHFlbXV0JyBpbiBjb21tb24uICBUaGUgY29ycmVzcG9uZGluZyB0ZXN0cyBpbiBYZW4gNC43CmFy
ZSBhbGwgY29tcGxldGV5IGJyb2tlbiByZWdhcmRsZXNzIG9mIHRoZSBxZW11IHZlcnNpb24uLi4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
