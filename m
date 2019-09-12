Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94415B1104
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Pvy-0002kj-Dy; Thu, 12 Sep 2019 14:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8Pvw-0002ke-Nx
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:18:52 +0000
X-Inumbo-ID: 3e9dba68-d568-11e9-b76c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e9dba68-d568-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568297931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oytOG3ZRJAnD00lLt5MSK+m7TPv8OZ3/wceNQXO143s=;
 b=VCEikm2ONHCH1tt65O8EOoaTPCZ5MKeo2PDb3wXBwcuqThYfwDCYaNvy
 B0q4EtRFW5aDbadVTl0OdBQeloFTjrqDgmY+ocI0bhuzRr7B5jKb9tJB9
 g0nGF0vo7r3m6LbHUJotp19UkLIQaVU5kFMaGxBuodKptD1PC4xyeIjGE g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +cR0w/+IfORuwwEGDTBLK2etCCrHRocChZ4oBWI9U/uqWQLR8zvz2UDz59UEDrYE+JHU0wOKDq
 w2LOZI7WgPdxnvy/Wth/gastvhgkdx1GWVRAiaQhbrI7QETtJt0JvJ2PSjyIYpHNOxTHGMW7Rw
 xXSuhq5H6favmnkO6AlhVCdUQpBpeMHE5SrjLsSApNvDusZgxCJdRoqGT1UTLo5TlFnqy5oRDs
 JKk89Eduru15+xV8l3Yc+ATHHeunPDDmw7MD7mm/3XchO9BKglZrKz4stNkkAl9NHeCCVFrpdn
 FRE=
X-SBRS: 2.7
X-MesageID: 5730120
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5730120"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 15:18:47 +0100
Message-ID: <20190912141847.639-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Update my MAINTAINERS entries
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TXkgQ2l0cml4IGVtYWlsIGFkZHJlc3Mgd2lsbCBleHBpcmUgc2hvcnRseS4KClNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KLS0tCiBNQUlOVEFJTkVSUyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTCmluZGV4IDI1MWJmZTIwMTYuLmI3ZjllNTI0YTIgMTAwNjQ0Ci0tLSBh
L01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC00NzMsNyArNDczLDcgQEAgRjoJdG9v
bHMvdGVzdHMvY3B1LXBvbGljeS8KIEY6CXRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci8KIAogWDg2
IEkvTyBFTVVMQVRJT04KLU06CVBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
CitNOglQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KIFM6CVN1cHBvcnRlZAogRjoJeGVuL2Fy
Y2gveDg2L2h2bS9lbXVsYXRlLmMKIEY6CXhlbi9hcmNoL3g4Ni9odm0vaW50ZXJjZXB0LmMKQEAg
LTUwNSw3ICs1MDUsNyBAQCBTOglNYWludGFpbmVkCiBGOgl4ZW4vYXJjaC94ODYvbW0vc2hhZG93
LwogCiBYODYgVklSSURJQU4gRU5MSUdIVEVOTUVOVFMKLU06CVBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+CitNOglQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KIFM6CVN1
cHBvcnRlZAogRjoJeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi8KIEY6CXhlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL3ZpcmlkaWFuLmgKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
