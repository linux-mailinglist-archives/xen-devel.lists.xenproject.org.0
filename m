Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAE132B3
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:02:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXd-000826-OU; Fri, 03 May 2019 17:00:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXc-00081a-Ab
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:08 +0000
X-Inumbo-ID: e766dca4-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e766dca4-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085340"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:53 +0100
Message-ID: <20190503165957.5960-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 07/11] mg-repro-setup: Allow arguments
 to badusage
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBleGlzdGluZyBjYWxsIHNpdGVzLgoKU2lnbmVkLW9m
Zi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWctcmVw
cm8tc2V0dXAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNldHVwCmluZGV4
IGI0MWJmNDc4Li5kNjNlMjliNiAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAKKysrIGIvbWct
cmVwcm8tc2V0dXAKQEAgLTQ2LDcgKzQ2LDcgQEAgRU5ECiAKIH0KIAotYmFkdXNhZ2UgKCkgeyBl
Y2hvID4mMiAiYmFkIHVzYWdlIjsgdXNhZ2UgPiYyOyBleGl0IDEyNjsgfQorYmFkdXNhZ2UgKCkg
eyBlY2hvID4mMiAiYmFkIHVzYWdlJCoiOyB1c2FnZSA+JjI7IGV4aXQgMTI2OyB9CiAKIHNldCAt
ZSAtbyBwb3NpeAogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
