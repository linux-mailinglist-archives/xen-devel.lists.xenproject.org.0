Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA136318
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 20:06:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYaG5-0004b7-9D; Wed, 05 Jun 2019 18:03:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgCu=UE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYaG3-0004b1-UR
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 18:03:31 +0000
X-Inumbo-ID: 39777551-87bc-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39777551-87bc-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 18:03:30 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0D7gyA2g+lEnALW/ExRFa9ZK4P11BSLJH0b6ZymKCD+rfHODP7qOEBhzyPMEawwQSbFh7eLROP
 0ey9V23xtbZEC1jPHnPCfv1wQ4VOr8lkfXfm2zgGEVrL40ynKFl4wrVLl5JLgd4OMCs8pGQ+sz
 7CGGPDaadCm5/sK7mUpLzv0HD4Y4zy9TavRCKlG3plvMA1TY1KWJmAkI8zD5ti5WyVR9kAjO4K
 AKo22HSSeK/KEwTJxvBjfFZIEkG0sxSh3npmatzxN+7k7+Ad0jiYlz22lxmwVOk7rlZfMhs9B+
 4ek=
X-SBRS: 2.7
X-MesageID: 1371130
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1371130"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23800.977.195291.114635@mariner.uk.xensource.com>
Date: Wed, 5 Jun 2019 19:02:57 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CF10F1C0200007800233FA8@prv1-mh.provo.novell.com>
References: <osstest-137065-mainreport@xen.org>
 <23793.2095.866136.936682@mariner.uk.xensource.com>
 <5CF10F1C0200007800233FA8@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.7-testing test] 137065: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tNC43LXRlc3RpbmcgdGVz
dF0gMTM3MDY1OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBUaGUgb25lIHlvdSd2ZSBwaWNrZWQg
bG9va3MgdG8gYmUgYSAiZmFpbCBuZXZlciBwYXNzIiBvbmUsIHNvIGlzIHBlcmhhcHMKPiBub3Qg
aWRlYWwuIEkndmUgbG9va2VkIGF0IGEgY291cGxlIG90aGVyIG9uZXMsIGFuZCBpbiBwYXJ0aWN1
bGFyIHdoZW4gdGhlCj4gZ3Vlc3RzIGFyZSBzdXBwb3NlZGx5IDY0LWJpdCBJIG5vdGljZSB0d28g
dGhpbmdzCj4gLSB0aGV5IGxvb2sgdG8gYmUgYnVzeSBsb29waW5nIG9uIHZDUFUgMCwKPiAtIHRo
ZSBWTUNTL1ZNQ0IgZHVtcHMgc3VnZ2VzdCB0aGV5J3ZlIG5ldmVyIGxlZnQgZWFybHkgYm9vdCAo
aS5lLgo+ICAgYXJlIHN0aWxsIGluIDMyLWJpdCBtb2RlIHdpdGggcGFnaW5nIHN0aWxsIGRpc2Fi
bGVkKSwgYW5kIG1heSB3ZWxsIHN0aWxsCj4gICBiZSBzaXR0aW5nIGluc2lkZSB0aGUgYm9vdCBs
b2FkZXIuCj4gSSdtIG5vdCBhdCBhbGwgY2VydGFpbiB0aG91Z2ggaWYgdGhpcyBoZWxwcyBpbiBh
bnkgd2F5LgoKSSBoYXZlIG5vdCB5ZXQgbWFuYWdlZCB0byBtYWtlIG11Y2ggcHJvZ3Jlc3Mgd2l0
aCB0aGlzLiAgSW4gbXkgbW9zdApyZWNlbnQgYXR0ZW1wdCBJIGJhY2twb3J0ZWQgYWxsIG9mIHRo
ZSBidWlsZCBmaXhlcyBvbnRvIHRoZQpsYXN0LXdvcmtpbmcgWGVuIHJldmlzaW9uLgoKVGhlIGJy
YW5jaCBJIGJ1aWx0IGFuZCB0ZXN0ZWQgd2FzIHRoaXM6CiAgaXdqQG9zc3Rlc3QudGVzdC1sYWI6
eGVuLmdpdC90LjQ3CgpBbmQgaXQgZmFpbGVkOgogIGZsaWdodCAxMzcyNTUgeGVuLXVuc3RhYmxl
IHBsYXkgW3BsYXldCiAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVz
dC9sb2dzLzEzNzI1NS8KCkkgdGhpbmsgdGhlIG1vc3QgbGlrZWx5IGN1bHByaXQgaXMgdGhlIE9W
TUYvc2VhYmlvcyBjaGFuZ2VzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
