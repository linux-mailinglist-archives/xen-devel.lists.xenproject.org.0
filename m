Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D56BC9C9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:07:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClQ5-0004ka-PF; Tue, 24 Sep 2019 14:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClQ3-0004jy-Vx
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:03:56 +0000
X-Inumbo-ID: 1cace4b8-ded4-11e9-bf31-bc764e2007e4
Received: from mo6-p02-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5302::3])
 by localhost (Halon) with ESMTPS
 id 1cace4b8-ded4-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569333820;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=K+0umHwR3D9c/NmdH4VyiiVwrcCxMwHaL/ft2w21YVo=;
 b=dZoNy5gOe3DpUS0mt7U5dtnayLAtza8AaW9A7htAg2YiZ3p78aA+lphTPfrHnFW/Fx
 1DiKfzsh7uiWeRs9wkU4BZ8PYTuB/TOcetucHSD3laLWpqMXt6HlN/2cW5NDAHHSRrIZ
 Lpzm1Hb1AVbLSCT7G1ROOXlYWNLRDaCeQIt/ZHowXDX2eH8D/W4mSG1edXPNRVb83UlW
 dVVv0RT2yR1FhY+KOb83hWjHkMKVRiTUR8v0sYT8x3K6im2Xu+ZWtVVijsrvPcHDaQcU
 5Qr9wTguMOkoREVmE3K4WaiK8AUcgO0UOhPhYMeN+cco2Kht8QAGu2NUqzWG6HmhFwA6
 jpYw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+j/F"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OE3a1mo
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:03:36 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:03:19 +0200
Message-Id: <20190924140319.11303-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190924140319.11303-1-olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 8/8] docs: remove stale create example from
 xl.1
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWF5YmUgeG0gY3JlYXRlIGhhZCBhIGZlYXR1cmUgdG8gY3JlYXRlIGEgZG9tVSBiYXNlZCBvbiBh
IGNvbmZpZ3VyYXRpb24KZmlsZS4geGwgY3JlYXRlIHJlcXVpcmVzIHRoZSAnLWYnIG9wdGlvbiB0
byByZWZlciB0byBhIGZpbGUuClRoZXJlIGlzIG5vIGNvZGUgdG8gbG9vayBpbnRvIFhFTl9DT05G
SUdfRElSLCBzbyByZW1vdmUgdGhlIGV4YW1wbGUuCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmlu
ZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQogZG9jcy9tYW4veGwuMS5wb2QuaW4gfCA3IC0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hs
LjEucG9kLmluIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4KaW5kZXggZmIxNzE1MzYzNS4uYWE5MmRh
MmQyNyAxMDA2NDQKLS0tIGEvZG9jcy9tYW4veGwuMS5wb2QuaW4KKysrIGIvZG9jcy9tYW4veGwu
MS5wb2QuaW4KQEAgLTE3MSwxMyArMTcxLDYgQEAgQjxFWEFNUExFUz4KIAogPW92ZXIgNAogCi09
aXRlbSBJPHdpdGggY29uZmlnIGZpbGU+Ci0KLSAgeGwgY3JlYXRlIERlYmlhbkxlbm55Ci0KLVRo
aXMgY3JlYXRlcyBhIGRvbWFpbiB3aXRoIHRoZSBmaWxlIC9ldGMveGVuL0RlYmlhbkxlbm55LCBh
bmQgcmV0dXJucyBhcwotc29vbiBhcyBpdCBpcyBydW4uCi0KID1pdGVtIEk8d2l0aCBleHRyYSBw
YXJhbWV0ZXJzPgogCiAgIHhsIGNyZWF0ZSBodm0uY2ZnICdjcHVzPSIwLTMiOyBwY2k9WyIwMTow
NS4xIiwiMDE6MDUuMiJdJwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
