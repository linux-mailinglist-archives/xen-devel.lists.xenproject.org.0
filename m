Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A873814A853
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 17:49:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7Wr-00083v-JB; Mon, 27 Jan 2020 16:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksAf=3Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iw7Wq-00083q-ES
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:46:24 +0000
X-Inumbo-ID: 8d05fa94-4124-11ea-aecd-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d05fa94-4124-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580143583;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dr00HbwTH/BYJoSnUX/6v7JtPUaKLAPuUsJGuhIgQR4=;
 b=KZ18mqmtR6NSPo8fKOGNBSV/tagv4oo7hnvx27GWotOjj8UHzSB6rTpA
 A5TrGFNoGzxHjL4tWNkx+t3lKLW1Q+k9/rjVpbez9/aodbZT4Hznk6OEU
 z2LDYAO1YfmWv6YkYqwSS0mbn0uE+vCgZeWuvYRR2RJsvvh1jfE6+yu4A I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s1fISvdi6KVDwSTfgqOwtL2AlR4cFW63No/yDOAV30NCm0GYQsJaocTNzxDgOZBCGEWNLt5AvQ
 cxD0bvpSzgpmlTRMYQlQf/Q7QDkOcJtONXzTuM8U4dAhDjgWaL4rNIiJx9epkA60mfypt6gOwc
 P/iVwjq46pmXps6EH0glRi1n6FzkI4raw06aDz4baeNzRVzqvlUYifXUhXujyH1LiH96grm34I
 0t6bL6lGiannezpuyFq+Wps6RJMG3zcUAGdrE/eVG/SGnr/H9k0bbzfWFe9ULzNcdg5adTDelZ
 4Ts=
X-SBRS: 2.7
X-MesageID: 11674520
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11674520"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 16:45:47 +0000
Message-ID: <20200127164547.5993-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] docs: Fix StudlyCaps in
 libxc-migration-stream.pandoc and xl.1.pod
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

JCBnaXQtZ3JlcCBsaWJ4ZW5jdHJsIHwgd2MgLWwKOTkKJCBnaXQtZ3JlcCBsaWJ4YyB8IHdjIC1s
CjIwNgokIGdpdC1ncmVwIGxpYnhlbmxpZ2h0IHwgd2MgLWwKNDgKJCBnaXQtZ3JlcCBsaWJ4bCB8
IHdjIC1sCjEzNDMzCiQgZ2l0LWdyZXAgTGliWGVuIHwgd2MgLWwKMgokCgpSZXBvcnRlZC1ieTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBkb2NzL21hbi94bC4xLnBvZC5p
biAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZG9jcy9zcGVjcy9saWJ4Yy1taWdyYXRpb24t
c3RyZWFtLnBhbmRvYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLjEucG9kLmluIGIvZG9jcy9t
YW4veGwuMS5wb2QuaW4KaW5kZXggZDRiNWU4ZTM2Mi4uMzNhZDJlYmQ3MSAxMDA2NDQKLS0tIGEv
ZG9jcy9tYW4veGwuMS5wb2QuaW4KKysrIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4KQEAgLTEsNiAr
MSw2IEBACiA9aGVhZDEgTkFNRQogCi14bCAtIFhlbiBtYW5hZ2VtZW50IHRvb2wsIGJhc2VkIG9u
IExpYlhlbmxpZ2h0Cit4bCAtIFhlbiBtYW5hZ2VtZW50IHRvb2wsIGJhc2VkIG9uIGxpYnhlbmxp
Z2h0CiAKID1oZWFkMSBTWU5PUFNJUwogCmRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL2xpYnhjLW1p
Z3JhdGlvbi1zdHJlYW0ucGFuZG9jIGIvZG9jcy9zcGVjcy9saWJ4Yy1taWdyYXRpb24tc3RyZWFt
LnBhbmRvYwppbmRleCBhN2E4YTA4OTM2Li44OTcwNWM5MjA3IDEwMDY0NAotLS0gYS9kb2NzL3Nw
ZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jCisrKyBiL2RvY3Mvc3BlY3MvbGlieGMt
bWlncmF0aW9uLXN0cmVhbS5wYW5kb2MKQEAgLTEsNCArMSw0IEBACi0lIExpYlhlbkN0cmwgRG9t
YWluIEltYWdlIEZvcm1hdAorJSBsaWJ4ZW5jdHJsIChsaWJ4YykgRG9tYWluIEltYWdlIEZvcm1h
dAogJSBEYXZpZCBWcmFiZWwgPDxkYXZpZC52cmFiZWxAY2l0cml4LmNvbT4+CiAgIEFuZHJldyBD
b29wZXIgPDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPj4KICAgV2VuIENvbmd5YW5nIDw8d2Vu
Y3lAY24uZnVqaXRzdS5jb20+PgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
