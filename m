Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3A28118
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 17:25:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTpVx-0004iv-IY; Thu, 23 May 2019 15:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTpVv-0004iq-GZ
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 15:20:15 +0000
X-Inumbo-ID: 41e480aa-7d6e-11e9-a003-fffdb7099758
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41e480aa-7d6e-11e9-a003-fffdb7099758;
 Thu, 23 May 2019 15:20:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: q0yHn35g4kWZsEdMOWaQevf75GZnuY92UhzOh7bTUAzTiiK345G3+Nou0EHVO8dh6biRvk3N4Y
 wsWz1aK9lu5/Cl59efPgQr2yEeToAVST0LsPg9KjFCIkRFx1VQxlvlE3BJPcG81/Es7n7ZuL1J
 g84VvqNDx471fCoILgn6nwcFu/XaxBbcHEm7dpeC8QZ8FFOj/bhReDAlW8R//Yu3Q9xu7i8bRD
 d9ulD/Q5hN9jE8W9ZhAc+HzoQ5KN+Wc3XjGg9rkcrWWlU2NG8VGrxgIsTONC643+kURZ1X1MMB
 /n0=
X-SBRS: 2.7
X-MesageID: 836735
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,503,1549947600"; 
   d="scan'208";a="836735"
Date: Thu, 23 May 2019 16:20:07 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190523152007.GH2373@zion.uk.xensource.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
 <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6NTc6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjA1LjE5IGF0IDIwOjEwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBEU0RUIGZvciBxZW11LXhlbiBsYWNrcyBfU1RBIG1ldGhvZCBvZiBQQ0kg
c2xvdCBvYmplY3QuIElmIF9TVEEgbWV0aG9kCj4gPiBkb2Vzbid0IGV4aXN0IHRoZW4gdGhlIHNs
b3QgaXMgYXNzdW1lZCB0byBiZSBhbHdheXMgcHJlc2VudCBhbmQgYWN0aXZlCj4gPiB3aGljaCBp
biBjb25qdW5jdGlvbiB3aXRoIF9FSjAgbWV0aG9kIG1ha2VzIGV2ZXJ5IGRldmljZSBlamVjdGFi
bGUgZm9yCj4gPiBhbiBPUyBldmVuIGlmIGl0J3Mgbm90IHRoZSBjYXNlLgo+ID4gCj4gPiBxZW11
LWt2bSBpcyBhYmxlIHRvIGR5bmFtaWNhbGx5IGFkZCBfRUowIG1ldGhvZCBvbmx5IHRvIHRob3Nl
IHNsb3RzCj4gPiB0aGF0IGVpdGhlciBoYXZlIGhvdHBsdWdnYWJsZSBkZXZpY2VzIG9yIGZyZWUg
Zm9yIFBDSSBwYXNzdGhyb3VnaC4KPiA+IEFzIFhlbiBsYWNrcyB0aGlzIGNhcGFiaWxpdHkgd2Ug
Y2Fubm90IHVzZSB0aGVpciB3YXkuCj4gPiAKPiA+IHFlbXUteGVuLXRyYWRpdGlvbmFsIERTRFQg
aGFzIF9TVEEgbWV0aG9kIHdoaWNoIG9ubHkgcmVwb3J0cyB0aGF0Cj4gPiB0aGUgc2xvdCBpcyBw
cmVzZW50IGlmIHRoZXJlIGlzIGEgUENJIGRldmljZXMgaG90cGx1Z2dlZCB0aGVyZS4KPiA+IFRo
aXMgaXMgZG9uZSB0aHJvdWdoIHF1ZXJ5aW5nIG9mIGl0cyBQQ0kgaG90cGx1ZyBjb250cm9sbGVy
Lgo+ID4gcWVtdS14ZW4gaGFzIHNpbWlsYXIgY2FwYWJpbGl0eSB0aGF0IHJlcG9ydHMgaWYgZGV2
aWNlIGlzICJob3RwbHVnZ2FibGUKPiA+IG9yIGFic2VudCIgd2hpY2ggd2UgY2FuIHVzZSB0byBh
Y2hpZXZlIHRoZSBzYW1lIHJlc3VsdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKCkphbiwgRkFPRCBzaW5jZSB5b3UncmUgdGhl
IG1haW50YWluZXIgSSdtIGV4cGVjdGluZyB5b3UgdG8gcHVzaCB0aGlzCnBhdGNoIHlvdXJzZWxm
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
