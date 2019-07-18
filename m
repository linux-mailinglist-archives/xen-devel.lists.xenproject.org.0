Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAC6D61E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 22:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoDQc-0003wK-5C; Thu, 18 Jul 2019 20:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoDQa-0003wF-Ix
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 20:55:00 +0000
X-Inumbo-ID: 4b83f2c4-a99e-11e9-8bd2-43a470537ce7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b83f2c4-a99e-11e9-8bd2-43a470537ce7;
 Thu, 18 Jul 2019 20:54:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XbKKKUbUmxmuW35wu3GMYA4GAK1zdfwmCBgBW+Zt+bwiQymrWeSdpOVLq7QHk7QFyV4GYt24af
 tGcPvcNf1WjwEvCOEL3x6CM90YZYMEfegTkdCxejXL/hy79zk2wyH1shj+7S4pnngz1m75ZZ8a
 jCPvaoQb/+oM5gq41YFsF/hOY3U/yzVkFH2iWiCGhumksq4GqYUUkFjX8YEE7YYoqIZDFzH3/u
 CVTGf0+vP7yvdSFo7zAPVHmOYFvhSaqe4SNU1jxQu6VGlTRmcVLRQ45eCgx5YUlX8pkq2LZL09
 RsU=
X-SBRS: 2.7
X-MesageID: 3258413
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,279,1559534400"; 
   d="scan'208";a="3258413"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH 3/3] xen/trace: Adjust types in function declarations
Thread-Index: AQHVPYtF1jNFw8apNkiPKus14juDfKbQuXiA
Date: Thu, 18 Jul 2019 20:54:51 +0000
Message-ID: <D3904976-F8BE-4531-AD99-DA10A9637772@citrix.com>
References: <20190718170716.22544-1-andrew.cooper3@citrix.com>
 <20190718170716.22544-4-andrew.cooper3@citrix.com>
In-Reply-To: <20190718170716.22544-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <DEE0F8ECCEF50C40A18B415A47879E14@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] xen/trace: Adjust types in function
 declarations
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIEp1bCAxOCwgMjAxOSwgYXQgNjowNyBQTSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gVXNlIHVpbnQzMl90IGNvbnNpc3RlbnRseSBm
b3IgJ2V2ZW50JywgYm9vbCBjb25zaXN0ZW50bHkgZm9yICdjeWNsZXMnLAo+IGFuZCB1bnNpZ25l
ZCBpbnQgY29uc2lzdGVudGx5IGZvciAnZXh0cmEnCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
