Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A62FE18
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 16:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWMEQ-0006Gt-Dm; Thu, 30 May 2019 14:40:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y5PY=T6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hWMEP-0006Go-3w
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 14:40:37 +0000
X-Inumbo-ID: e12cfd84-82e8-11e9-97bc-b3f9fec7e378
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e12cfd84-82e8-11e9-97bc-b3f9fec7e378;
 Thu, 30 May 2019 14:40:33 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: fbM3AIIHlbKWoiWnOvhxMECio7Vx5Pmk2K84B+05+qVWyENW0Jo4m7hSBtmtl2xbZTvk33o3kQ
 /IphFc84WbnQCVT0OOkBxwrZ4JTXsVKr5MpqKujvT4eE4DSph0gLygHRe6jYG/y1VcTzMLnTt6
 wOPk5exiTw1O29ZdWTKtq+qlym5k/a1fi73aTSejFGHiLJsdDmGXg5qRET3ODphAJCC3OYVI7K
 7WEzess+cefd5oSopzSPiXz0aXVu4CSTBnyYLtwOdhnSi4WM+PGxdbyMVmqV6DUAAVq6Sv3qNC
 cCo=
X-SBRS: 2.7
X-MesageID: 1084444
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,531,1549947600"; 
   d="scan'208";a="1084444"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 May 2019 16:40:28 +0200
Message-ID: <20190530144028.54203-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] automation: fix typo in comment
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDYzogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
YXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZSBiL2F1dG9tYXRpb24vc2NyaXB0cy9jb250
YWluZXJpemUKaW5kZXggYTc4MDliMzAxMC4uNDc0NTMwZjk0NSAxMDA3NTUKLS0tIGEvYXV0b21h
dGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFp
bmVyaXplCkBAIC0yNiw3ICsyNiw3IEBAIGNhc2UgIl8ke0NPTlRBSU5FUn0iIGluCiAgICAgX3hl
bmlhbCkgQ09OVEFJTkVSPSIke0JBU0V9L3VidW50dTp4ZW5pYWwiIDs7CiBlc2FjCiAKLSMgVXNl
IHRoaXMgdmFyaWFibGUgdG8gY29udHJvbCB3aGVodGVyIHJvb3Qgc2hvdWxkIGJlIHVzZWQKKyMg
VXNlIHRoaXMgdmFyaWFibGUgdG8gY29udHJvbCB3aGV0aGVyIHJvb3Qgc2hvdWxkIGJlIHVzZWQK
IGNhc2UgIl8ke0NPTlRBSU5FUl9VSUQwfSIgaW4KICAgICBfMSkgICB1c2VyYXJnPSA7OwogICAg
IF8wfF8pIHVzZXJhcmc9Ii11ICQoaWQgLXUpIiA7OwotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
