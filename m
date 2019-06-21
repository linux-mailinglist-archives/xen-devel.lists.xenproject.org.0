Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A064ED47
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 18:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heMYI-0003m5-CQ; Fri, 21 Jun 2019 16:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heMYG-0003lO-4m
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 16:38:12 +0000
X-Inumbo-ID: f2f8cabe-9442-11e9-aa48-5f900c5eda0c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2f8cabe-9442-11e9-aa48-5f900c5eda0c;
 Fri, 21 Jun 2019 16:38:08 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EHtcf7I7avADNLkw+He6dqQ8+ZInn0cRswCgF8ccetNugoRtsDehc1eKeMFRhu9KKKlF6SeRc3
 UJ/YZrylHlmsOw5u/SdU8Jq8pKJI0wcwfWReBqi0cwf9vbyvnAuGt6xL51hh0sm+C0nqfPYoWq
 BGiA/OPlchH6HzGyg/uQtRbwFLnVM3wJaDqY9z7RS2KKSOmPNS/piJWvCxhOVIK1Sh+lG/YG2j
 UX/RtFn61ZblqlHuYssy4LwmRSkhomXzjsOGda/mN15yLcORklgooJZKyy8JCQzcWZceOFkUbt
 YSY=
X-SBRS: 2.7
X-MesageID: 2061818
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,401,1557201600"; 
   d="scan'208";a="2061818"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 18:37:59 +0200
Message-ID: <20190621163802.29808-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] misc improvements
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpGb2xsb3dpbmcgcGF0Y2hlcyBhcmUgdGhlIGdlbmVyYWwgaW1wcm92ZW1lbnRzIHRo
YXQgY2FtZSBvdXQgb2YgbXkKYXR0ZW1wdCB0byBhZGQgTExEIDggc3VwcG9ydC4KCkkndmUgbm93
IHB1dCBvbiBob2xkIHRoZSBhZGRpdGlvbiBvZiBMTEQgOCBzdXBwb3J0LCBzaW5jZSBhY2NvcmRp
bmcgdG8KTExEIGRvY3VtZW50YXRpb24gaXQgc2hvdWxkIG1pbWljIEdOVSBsZCBiZWhhdmlvdXIs
IGJ1dCB0aGF0J3MgY2xlYXJseQpub3QgdGhlIGNhc2Ugd2l0aCBvcnBoYW4gc2VjdGlvbnMgaW4g
bGlua2VyIHNjcmlwdHMuIFVudGlsIHRoaXMgaXMKcmVzb2x2ZWQsIGVpdGhlciBieSBmaXhpbmcg
TExEIDggYmVoYXZpb3Igb3IgdXBkYXRpbmcgdGhlIGRvY3VtZW50YXRpb24sCkkgZG9uJ3QgZm9y
ZXNlZSBMTEQgOCBzdXBwb3J0IGluIFhlbi4KClJvZ2VyIFBhdSBNb25uZSAoMyk6CiAgeDg2L2xp
bmtlcjogdXNlIERFQ0xfU0VDVElPTiB1bmlmb3JtbHkKICB4ODY6IGNoZWNrIGZvciBtdWx0aWJv
b3R7MSwyfSBoZWFkZXIgcHJlc2VuY2UKICB4ODYvbGlua2VyOiBhZGQgYSByZWxvYyBzZWN0aW9u
IHRvIEVMRiBiaW5hcnkKCiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgIHwgIDcgKysrKysrLQogeGVu
L2FyY2gveDg2L3hlbi5sZHMuUyB8IDEyICsrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTEx
NykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
