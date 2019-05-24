Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925F295F8
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 12:38:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU7YJ-0001JC-9S; Fri, 24 May 2019 10:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWwb=TY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hU7YH-0001J7-Pj
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 10:35:53 +0000
X-Inumbo-ID: b2ff3a22-7e0f-11e9-a3ed-ebdcdde8c0eb
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2ff3a22-7e0f-11e9-a3ed-ebdcdde8c0eb;
 Fri, 24 May 2019 10:35:50 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: RDiKEj9fSAcUnpBEu2GqIbJWybQfHPzHj/dlfKFh7yV2zkPHQ4Io9Sn/uRzfb9S6ZsVxYOXRZ2
 JR4b2bYn/CpP9mltgcnwUiF7+Em5sZjFgxWqW9OqXt/buOwa+cYV+2MFnGOH/mVogn1Kus4guk
 1S35v/8tj1paY+zm050+abnnD7U1fW7/pakvHm26qG2Iw9zSkcfhzhXvVbVGUlSs6pLVjYAYxw
 JFHoxB6Xi5SilYyXMuMcTEVOnurXGr/qliTeLOQl3ld2zNWvYzYK50TFsRw7ALPmInarAhPL8L
 gw4=
X-SBRS: 2.7
X-MesageID: 853306
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,506,1549947600"; 
   d="scan'208";a="853306"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23783.51430.17717.790266@mariner.uk.xensource.com>
Date: Fri, 24 May 2019 11:35:18 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190524095727.su3wxkxgovfxpyne@Air-de-Roger>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-5-roger.pau@citrix.com>
 <23782.28680.411030.121451@mariner.uk.xensource.com>
 <20190524095727.su3wxkxgovfxpyne@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 4/6] osstest: introduce a helper to get the
 svn revision of a git commit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggNC82XSBvc3N0
ZXN0OiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gZ2V0IHRoZSBzdm4gcmV2aXNpb24gb2YgYSBnaXQg
Y29tbWl0Iik6Cj4gT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MDM6NTJBTSArMDEwMCwgSWFu
IEphY2tzb24gd3JvdGU6Cj4gPiBnaXQgbm90ZXMgaGF2ZSBzb21lIGRpZmZlcmVudCB3YXkgb2Yg
dHJhdmVsbGluZyB0aGFuIGNvbW1pdHMsIGRvbid0Cj4gPiB0aGV5ID8gIFdoZXJlIGlzIHRoaXMg
Z2l0IG5vdGUgY29taW5nIGZyb20gYW5kIGhvdyBkbyB3ZSBrbm93IGl0IGlzCj4gPiB0aGUgcmln
aHQgbm90ZSwgSVlTV0lNID8KPiAKPiBJJ20gbm90IGFuIGV4cGVydCBvbiB0aGlzLCBidXQgSSB0
aGluayBub3RlcyBhcmUgYWx3YXlzIHN0b3JlZCBpbiBhCj4gc2VwYXJhdGUgYnJhbmNoIG9uIHRo
ZSBzYW1lIHJlcG8/IEluIHRoZSBGcmVlQlNEIGNhc2UgYXQgbGVhc3QgaXQncwo+IGdpdC9yZWZz
L25vdGVzLgoKT0ssIHNvIHdoYXQgYXJlIGdpdCdzIHJ1bGVzIGZvciB3aGVyZSBpdCBmZXRjaGVz
IG5vdGVzIGZyb20gPyAgV2hpY2gKbm90ZXMgZG9lcyBpdCBsb29rIGF0ID8gIChEbyB5b3UgdW5k
ZXJzdGFuZCB3aHkgSSBhbSBhc2tpbmcgdGhlc2UKcXVlc3Rpb25zPykKCj4gPiBBc2lkZSBmcm9t
IHRoYXQsIHBsZWFzZSBicmVhayB0aGUgcmVmYWN0b3JpbmcgKGluIHRoaXMgY2FzZSwgdGhlCj4g
PiBicmVha2luZyBvdXQgb2YgcmVwb19nZXRfcmVhbHVybCkgaW50byBhIHNlcGFyYXRlIE5GQyBw
YXRjaC4KPiAKPiBTdXJlIQoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
