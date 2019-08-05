Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7482000
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:22:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huelw-0005Yd-8c; Mon, 05 Aug 2019 15:19:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dpjS=WB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1huelu-0005YY-LV
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 15:19:38 +0000
X-Inumbo-ID: 6fb25c15-b794-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fb25c15-b794-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 15:19:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rUi7RQb92Bt7MmNqVX1zn6fuH5JjoKbL6F9infIgQiI4DU+8KDKokMk+DnUTz/vQzvS2Rd+tkJ
 ngNSI6LtrVQd4rLrEN1N4V5DQb3riMM3DUCxZh5Ib1nrcKgjBJZ+cLtZYw2aJ94c4boQCpHc7S
 Kb/cChGhf+Gb8tGW1eMiA81AsZH9tyvmkHF4NrUTSZ0BJmM3+Za+jCt2UmrXnC3j/KBQpIb2tf
 ajpCXxH0Ad1e5gssdlr7KMNm/rwW6m12E1Dl3UkTJSncT4Y70PCHWIpVP8yuychkEfMFqOVUzh
 g6E=
X-SBRS: 2.7
X-MesageID: 3869929
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3869929"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23880.18663.729437.866196@mariner.uk.xensource.com>
Date: Mon, 5 Aug 2019 16:19:03 +0100
To: Rich Persaud <persaur@gmail.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <B92482B8-3A93-4085-9A6A-26D457261076@gmail.com>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190723205929.GK3433@reaktio.net>
 <CAMmSBy_0KsjQ_e7S=nVxCEuowtEjfMOZ9Rf_DgHcgM6am3vCdQ@mail.gmail.com>
 <B92482B8-3A93-4085-9A6A-26D457261076@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roman Shaposhnik <roman@zededa.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>, Anthony
 Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+PiAibGlieGw6IGZpeCBwY2kgZGV2aWNlIHJlLWFzc2lnbmluZyBhZnRlciBkb21haW4gcmVi
b290IjoKPiA+PiBjb21taXQgIGMxOTQzNGQ5Mjg0ZTkzZTZmOWFhZWM5YTcwZjVmMzYxYWRiZmFi
YTYKClRoYW5rcyBhbGwuICBJIHB1c2hlZCB0aGlzIHRvIHN0YWdpbmctNC4xMiB0b2RheS4KClRo
ZXJlIGFyZSBhIGNvdXBsZSBvZiBvdGhlciB0aGluZ3MgdGhhdCBJIHNheSBpbiBnaXQgbG9nIHRo
YXQgbWlnaHQKd2FycmFudCBhIGJhY2twb3J0LCBhbmQgZm9yIHdoaWNoIEknbSBob3BpbmcgSSBn
ZXQgcmVwbGllcyBxdWlja2x5LgoKUmVnYXJkcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
