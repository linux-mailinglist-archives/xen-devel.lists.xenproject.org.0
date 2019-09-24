Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65ACBC9C2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClPc-0004cP-Tp; Tue, 24 Sep 2019 14:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClPa-0004cK-3q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:03:26 +0000
X-Inumbo-ID: 121a6ef8-ded4-11e9-bf31-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by localhost (Halon) with ESMTPS
 id 121a6ef8-ded4-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569333802;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=LJJquhL4UHX0XsfDk2WOduUhegpn0gdP3/4DhgIoaE0=;
 b=TbX6eIfXVakWxqeetO7oQdKTH11M3vL9IVWR6dtLKGp7XtCUDXxBAqFWVt2N8OEDty
 S4zALfzx1uIPv73fXeYYYFUQ22V0oW90xxTSYLwliuBg+ZLF06j0+CAqwFMImWn1d5Zd
 Uz0zkBOHryZu3DIoSLw9BmQIawu6VvwCgfUz/WBJMswUJVBrp6Cf08zF1VPhGwPV3vPs
 YY6F213eW4jMqH+3501kofkGaf3XuLe5rUvR9uSJHU/FHVlf7+CF2obmZL3TDnaXjrbu
 DuUO1MtOsb0wugmwYROLn0IT1IODSlgHPLzgybsyibMdO09JmtHtchJPYgP6bH6l/lyW
 f6aw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+j/F"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OE3M1md
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:03:22 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:03:11 +0200
Message-Id: <20190924140319.11303-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [RESEND v1 0/8] tools, doc and stubdom fixes
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
Cc: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVzZW5kaW5nIGR1ZSB0byBsYWNrIG9mIHJlc3BvbnNlcy4KCk9sYWYKCk9sYWYgSGVyaW5nICg4
KToKICBzdHViZG9tL3Z0cG06IGluY2x1ZGUgc3RkaW8uaCBmb3IgZGVjbGFyYXRpb24gb2YgcHJp
bnRmCiAgdG9vbHM6IG1vdmUgc2NyaXB0cyBmcm9tIGV0YyB0byBsaWJleGVjCiAgVXNlIFhFTl9T
Q1JJUFRfRElSIHRvIHJlZmVyIHRvIC9ldGMveGVuL3NjcmlwdHMKICBSZW1vdmUgdG9vbHMvZXhh
bXBsZXMvUkVBRE1FLmluY29tcGF0aWJpbGl0aWVzCiAgdG9vbHM6IHJlbW92ZSBlbXB0eSB4bC5j
b25mCiAgUmVtb3ZlIHRvb2xzL2V4YW1wbGVzL2NwdXBvb2wKICBkb2NzOiBzdWJzdGl0dXRlIFhF
Tl9DT05GSUdfRElSIGluIHhsLmNvbmYuNQogIGRvY3M6IHJlbW92ZSBzdGFsZSBjcmVhdGUgZXhh
bXBsZSBmcm9tIHhsLjEKCiAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrCiBkb2NzL2NvbmZpZ3VyZS5hYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzICsrCiAuLi5yYXRpb24uNS5wb2QgPT4geGwtZGlzay1jb25maWd1
cmF0aW9uLjUucG9kLmlufSB8ICAyICstCiAuLi5pb24uNS5wb2QgPT4geGwtbmV0d29yay1jb25m
aWd1cmF0aW9uLjUucG9kLmlufSB8ICA0ICstCiBkb2NzL21hbi94bC4xLnBvZC5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDExICstLS0tLQogZG9jcy9tYW4ve3hsLmNvbmYuNS5w
b2QgPT4geGwuY29uZi41LnBvZC5pbn0gICAgICAgfCAgOCArKy0tCiBkb2NzL21pc2MvYmxvY2st
c2NyaXB0cy50eHQgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBtNC9wYXRocy5tNCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBzdHViZG9tL3Z0
cG0vdnRwbWJsay5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHRvb2xzL2V4
YW1wbGVzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgLS0KIHRvb2xz
L2V4YW1wbGVzL1JFQURNRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLQogdG9v
bHMvZXhhbXBsZXMvUkVBRE1FLmluY29tcGF0aWJpbGl0aWVzICAgICAgICAgICAgfCAzOCAtLS0t
LS0tLS0tLS0tLS0tLS0tCiB0b29scy9leGFtcGxlcy9jcHVwb29sICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDE3IC0tLS0tLS0tLQogdG9vbHMvZXhhbXBsZXMveGwuY29uZiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA0NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB0b29scy94
bC94bF9jbWR0YWJsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAxNSBm
aWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMjMgZGVsZXRpb25zKC0pCiByZW5hbWUg
ZG9jcy9tYW4ve3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZCA9PiB4bC1kaXNrLWNvbmZpZ3Vy
YXRpb24uNS5wb2QuaW59ICg5OSUpCiByZW5hbWUgZG9jcy9tYW4ve3hsLW5ldHdvcmstY29uZmln
dXJhdGlvbi41LnBvZCA9PiB4bC1uZXR3b3JrLWNvbmZpZ3VyYXRpb24uNS5wb2QuaW59ICg5OCUp
CiByZW5hbWUgZG9jcy9tYW4ve3hsLmNvbmYuNS5wb2QgPT4geGwuY29uZi41LnBvZC5pbn0gKDk2
JSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9leGFtcGxlcy9SRUFETUUuaW5jb21wYXRpYmls
aXRpZXMKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9leGFtcGxlcy9jcHVwb29sCiBkZWxldGUg
bW9kZSAxMDA2NDQgdG9vbHMvZXhhbXBsZXMveGwuY29uZgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
