Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8B35F26
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:25:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWo7-0006NV-F4; Wed, 05 Jun 2019 14:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONy6=UE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hYWo6-0006NQ-2b
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:22:26 +0000
X-Inumbo-ID: 556ff008-879d-11e9-9229-972b202e8042
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 556ff008-879d-11e9-9229-972b202e8042;
 Wed, 05 Jun 2019 14:22:23 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tW5zENX45nLP9nyTMoz6pqLrao4980aE7ozHmpLja6il62xfwoYQuAEjM1oZ3uTern/v3p59dP
 55ZyhyQwbAIfctnAtFD0v16L59IdsysDBnd/ZpQoHyDFYSs5KaNW0vc3hX7ncc4Gw0qCahin20
 eS6kkBym3hfm7UIMNjLSQwLz5EiyxYwJdOLxELOnbtn+cmZGOIBV+lW9Ezj+juPeVCBA/1KJ11
 lV7+fLbusAHnlB8V2KVWRIci0ReS2C1+7bHhS99FL793YLcqkWEfg5gd+x056pUVSf+ceOEMLn
 LZE=
X-SBRS: 2.7
X-MesageID: 1353936
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1353936"
Date: Wed, 5 Jun 2019 15:22:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190605142219.GK2126@perard.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-10-anthony.perard@citrix.com>
 <23798.44724.367137.714833@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23798.44724.367137.714833@mariner.uk.xensource.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 9/9] libxl_disk: Implement missing timeout
 for libxl_cdrom_insert
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDY6NDc6MzJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDkvOV0gbGlieGxfZGlzazogSW1w
bGVtZW50IG1pc3NpbmcgdGltZW91dCBmb3IgbGlieGxfY2Ryb21faW5zZXJ0Iik6Cj4gPiBTaW5j
ZSB0aGUgcHJldmlvdXMgcGF0Y2ggImxpYnhsX2Rpc2s6IFVzZSBldl9xbXAgaW4gbGlieGxfY2Ry
b21faW5zZXJ0IiwKPiA+IHRoZXJlIGFyZSBubyBraW5kIG9mIHRpbWVvdXQgYW55bW9yZSwgYWRk
IG9uZSBiYWNrLgo+IAo+IEhybS4gIFRoZSBwYXRjaCBpdHNlbGYgbG9va3MgZ29vZCwgc28KPiAK
PiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCj4g
QnV0IEkgd29uZGVyIGlmIHRoaXMgY291bGQgc29tZWhvdyBiZSBwbGFjZWQgZWFybGllciB0byBw
cmVzZXJ2ZQo+IGJpc2VjdGFiaWxpdHkuCgpJIHRoaW5rIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRv
IHBsYWNlIHRoZSBwYXRjaCByaWdodCBhZnRlciAibGlieGxfZGlzazoKQ3V0IGxpYnhsX2Nkcm9t
X2luc2VydCBpbnRvIHN0ZXBzIiwgZXZlbiB0aG91Z2ggdGhlIHRpbWVvdXQgd2lsbCBuZXZlcgpn
ZXQgYSBjaGFuY2UgdG8gYWN0dWFsbHkgZmlyZS4gKEJlZm9yZSAiVXNlIGV2X3FtcCAuLi4iLCBl
dmVyeXRoaW5nIGlzCnN5bmNocm9ub3VzLikKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
