Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DED5E5F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 11:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJwM0-0005np-7U; Mon, 14 Oct 2019 09:09:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iJwLy-0005nY-7w
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 09:09:22 +0000
X-Inumbo-ID: 4aea7209-ee62-11e9-9375-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aea7209-ee62-11e9-9375-12813bfff9fa;
 Mon, 14 Oct 2019 09:09:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C447DB64B;
 Mon, 14 Oct 2019 09:09:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Oct 2019 11:09:08 +0200
Message-Id: <20191014090910.9701-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/2] xen/netback: bug fix and cleanup
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, "# 3 . 12" <stable@vger.kernel.org>,
 Paul Durrant <paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIGJ1Z2ZpeCAocGF0Y2ggMSkgSSBzdHVtYmxlZCBvdmVyIHdoaWxlIGRvaW5nIGEgY2xlYW51
cCAocGF0Y2ggMikKb2YgdGhlIHhlbi1uZXRiYWNrIGluaXQvZGVpbml0IGNvZGUuCgpKdWVyZ2Vu
IEdyb3NzICgyKToKICB4ZW4vbmV0YmFjazogZml4IGVycm9yIHBhdGggb2YgeGVudmlmX2Nvbm5l
Y3RfZGF0YSgpCiAgeGVuL25ldGJhY2s6IGNsZWFudXAgaW5pdCBhbmQgZGVpbml0IGNvZGUKCiBk
cml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyB8IDExNSArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA2
MSBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
