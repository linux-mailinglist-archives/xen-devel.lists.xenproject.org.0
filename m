Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0252198F
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 16:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRdTC-00078y-6H; Fri, 17 May 2019 14:04:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRdTA-00078t-OO
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 14:04:20 +0000
X-Inumbo-ID: a940c9a0-78ac-11e9-bd50-7f1e93ae4277
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a940c9a0-78ac-11e9-bd50-7f1e93ae4277;
 Fri, 17 May 2019 14:04:18 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: pubOIUjvK86JhHjly+kE93m7i8CqjI6DQk4MkzrZkCbRs4CE1YQCVvCkMPHam4t/nQgvNRj371
 N6g/cWP43nWGGB8YSP9y2I0ecIx8uKBlp9KrvJ4D1w4beszE+SEMULf2rbi/YSpIDzWiLrxamC
 8RLu5N5jUX6rDQ7elHSM0EtzOxtrDg4F0QWTJvPGYNGKCzdiy+CDDeK4+yHU5nPvXH1Qbm2gcc
 z2qtiOHhxWXPXGg6OAborCkQW0RAXVMuociNQKnMfL+YmmWkI4Ab60RiC5Qo4etB7GmzpIlQcG
 0g4=
X-SBRS: 2.7
X-MesageID: 571666
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="571666"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 15:03:35 +0100
Message-ID: <20190517140335.18141-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] installs: Disable cron
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHByZXNlbmNlIG9mIGNyb24gY2F1c2VzIGxlYWsgY2hlY2sgZmFpbHVyZXMsIHNpbmNlIGNy
b24gbWF5IHJ1bgpwcm9jZXNzZXMgdGhhdCB0aGUgbGVhayBjaGVja2VyIGRldGVjdHMuICBEaXNh
YmxlIGl0LCBzaW5jZSBub25lIG9mCm91ciBpbnN0YWxscyBsaXZlIGxvbmcgZW5vdWdoIGZvciB0
aGlzIHRvIG1hdHRlci4KCkRvIHRoaXMgaW4gaG9zdF9pbnN0YWxsX3Bvc3Rib290X2NvbXBsZXRl
IHNpbmNlIGl0IHNlZW1zIHRvIG1lIGxpa2Ugd2UKZG9uJ3Qgd2FudCB0aGlzIGluIGd1ZXN0cyBh
bnkgbW9yZSB0aGFuIHdlIHdhbnQgaXQgaW4gaG9zdHMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGQ4
N2I2Yzg5Li5lNTU0YWYzOCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysg
Yi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0zMDA2LDYgKzMwMDYsOCBAQCBzdWIgZ3Vlc3Rf
ZWRpdGNvbmZpZ19ub2NkICgkJCkgewogc3ViIGhvc3RfaW5zdGFsbF9wb3N0Ym9vdF9jb21wbGV0
ZSAoJCkgewogICAgIG15ICgkaG8pID0gQF87CiAgICAgdGFyZ2V0X2NvcmVfZHVtcF9zZXR1cCgk
aG8pOworICAgIHRhcmdldF9jbWRfcm9vdCgkaG8sICJ1cGRhdGUtcmMuZCBjcm9uIGRpc2FibGUi
KTsKKyAgICB0YXJnZXRfY21kX3Jvb3QoJGhvLCAic2VydmljZSBjcm9uIHN0b3AiKTsKICAgICB0
YXJnZXRfY21kX3Jvb3QoJGhvLCAidXBkYXRlLXJjLmQgb3NzdGVzdC1jb25maXJtLWJvb3RlZCBz
dGFydCA5OSAyIC4iKTsKICAgICB0YXJnZXRfaHR0cHNfbWl0bV9wcm94eV9zZXR1cCgkaG8pOwog
fQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
