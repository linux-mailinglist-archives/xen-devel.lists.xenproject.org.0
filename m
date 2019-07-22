Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978670474
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:49:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpaVm-0001wK-QP; Mon, 22 Jul 2019 15:46:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpaVl-0001wF-4M
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:46:01 +0000
X-Inumbo-ID: cb657796-ac97-11e9-b7ad-7f89531b4d9e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb657796-ac97-11e9-b7ad-7f89531b4d9e;
 Mon, 22 Jul 2019 15:45:56 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YS0JACkc1xe+TWd6wLIoWNGm5hlhYOAXRuhRvFH+wBaSRyZE4Y7AGS50PzBxzp/OrRpcLf+Ebv
 Q8tmpHMksKKX1fS+oPLCaf7J5koNI6ZIP/mRYk/zf3b5RYgxKMxZ8AWyoHD/fevVv6eKNfT3MU
 cz1BlrD/OLP/DToPqrloln03n80kgIBGZ10tc4Nqjxjc6130/PcIWWwNO/9ZjWVzFzdsd3MxBL
 KabgdLq5KDcJPtOa9FOR8k8hXebpaKQtaNd2AkS2pCB2eqQwMOOHWeSpALMau6r19W1lmZ50yH
 DmY=
X-SBRS: 2.7
X-MesageID: 3268059
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3268059"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 22 Jul 2019 17:45:52 +0200
Message-ID: <20190722154552.73458-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/iommu: add comment regarding setting of
 need_sync
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
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhcmlmeSB3aHkgcmVsYXhlZCBoYXJkd2FyZSBkb21haW5zIGRvbid0IG5lZWQgaW9tbXUgcGFn
ZS10YWJsZQpzeW5jaW5nLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgot
LS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwppbmRleCA3OWVjNjcx
OWY1Li5mOGMzYmY1M2JkIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAgLTE4NSw2ICsxODUs
MTAgQEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpk
KQogICAgIHJlZ2lzdGVyX2tleWhhbmRsZXIoJ28nLCAmaW9tbXVfZHVtcF9wMm1fdGFibGUsICJk
dW1wIGlvbW11IHAybSB0YWJsZSIsIDApOwogCiAgICAgaGQtPnN0YXR1cyA9IElPTU1VX1NUQVRV
U19pbml0aWFsaXppbmc7CisgICAgLyoKKyAgICAgKiBOQjogcmVsYXhlZCBodyBkb21haW5zIGRv
bid0IG5lZWQgc3luYyBiZWNhdXNlIGFsbCByYW0gaXMgYWxyZWFkeQorICAgICAqIG1hcHBlZCBp
biB0aGUgaW9tbXUgcGFnZSB0YWJsZXMuCisgICAgICovCiAgICAgaGQtPm5lZWRfc3luYyA9IGlv
bW11X2h3ZG9tX3N0cmljdCAmJiAhaW9tbXVfdXNlX2hhcF9wdChkKTsKICAgICBpZiAoIG5lZWRf
aW9tbXVfcHRfc3luYyhkKSApCiAgICAgewotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
