Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84B877B8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:45:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2Lt-0002f4-6s; Fri, 09 Aug 2019 10:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iEig=WF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hw2Ls-0002ex-16
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:42:28 +0000
X-Inumbo-ID: 5fa3f178-ba92-11e9-ba49-33769703c50c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fa3f178-ba92-11e9-ba49-33769703c50c;
 Fri, 09 Aug 2019 10:42:24 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u4e6jtzcNVN79cA/C4Xa16nYQdrG2ehW/kw34Np6tnau7KuGy0+rswEhxNWxq/dF5l9V+gnTCS
 4GzfIE3Hw6yli3PluSxpsRrG20HqoEO9ajadMrVktxQhT8rXIKDvywB17BsSyw5eAQPToP8jvM
 WyQ+fhAQPenlblQDc3a4eiFMCQce0I6hQj3w6D7FwQV8D6tuRvHUPrYnirxAvLT7jSnH0T+auu
 VMwGLOGH6Tn5z6kEIHbV4yAVbCECJklNVwcErO4uteG5b+WuAYRgrw1FEM7LIR2g8FQoFocKag
 2LQ=
X-SBRS: 2.7
X-MesageID: 4083640
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4083640"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23885.19951.531473.98515@mariner.uk.xensource.com>
Date: Fri, 9 Aug 2019 11:41:51 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20190809020137.27334-2-marmarek@invisiblethingslab.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
 <20190809020137.27334-2-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/2] tools/tests/cpu-policy: disable
 -Wformat-overflow
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
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSCAyLzJdIHRvb2xzL3Rl
c3RzL2NwdS1wb2xpY3k6IGRpc2FibGUgLVdmb3JtYXQtb3ZlcmZsb3ciKToKPiBHQ0M5IGNvbXBs
YWlucyBhYm91dCAiJS4xMnMiIGZvcm1hdCB3aXRoIGFuIGFyZ3VtZW50IGhhdmluZyBleGFjdGx5
IDEyCj4gYnl0ZXMgYW5kIG5vIHRlcm1pbmF0aW5nIG51bGwgY2hhcmFjdGVyLiBUaGlzIGlzIGlu
dGVudGlvbmFsCj4gY29uc3RydWN0LCBzbyBkaXNhYmxlIHRoZSB3YXJuaW5nLgoKSXMgdGhlcmUg
c29tZSBnb29kIHJlYXNvbiB0byBoYXZlIHRoaW5ncyBkb25lIHRoaXMgd2F5ID8KSVNUTSB0aGF0
IGEgbmljZXIgZml4IHdvdWxkIGJlIHRvIGNoYW5nZSAxMiB0byAxMywgZWFybGllci4KVGhhdCB3
YXkgd2Ugd291bGRuJ3QgbG9zZSBqdXN0aWZpZWQgLVdmb3JtYXQtb3ZlcmZsb3cgb3V0cHV0LgoK
SSBhcHByZWNpYXRlIHRoaXMgaXMgb25seSBhIHRlc3QgcHJvZ3JhbSBzbyBJJ20gYmlrZXNoZWRk
aW5nIHJhdGhlci4KCkFzIGFuIGFzaWRlLCBJIGhvcGUgdGhpcyBjb2RlIGlzIGNvbXBpbGVkIHdp
dGggLWZuby1zdHJpY3QtYWxpYXNpbmcsCmJlY2F1c2Ugb3RoZXJ3aXNlIGl0J3MgZGVmaW5pdGVs
eSB0eXBlLXB1bm5pbmcgaW4gYSBVQiB3YXkuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
