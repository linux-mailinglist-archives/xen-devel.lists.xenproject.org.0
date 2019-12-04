Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4687112759
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:29:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQwR-0001qt-DJ; Wed, 04 Dec 2019 09:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fd9d=Z2=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1icQwQ-0001qi-FR
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:27:26 +0000
X-Inumbo-ID: 476f94f8-1678-11ea-a0d2-bc764e2007e4
Received: from know-smtprelay-omc-3.server.virginmedia.net (unknown
 [80.0.253.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 476f94f8-1678-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 09:27:24 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.47.84.47]) by cmsmtp with ESMTPA
 id cQwNilTndMk4gcQwNiUugq; Wed, 04 Dec 2019 09:27:23 +0000
X-Originating-IP: [82.47.84.47]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=Rfa+9Wlv c=1 sm=1 tr=0 a=0bfgdX8EJi0Cr9X0x0jFDA==:117
 a=0bfgdX8EJi0Cr9X0x0jFDA==:17 a=xqWC_Br6kY4A:10 a=pxVhFHJ0LMsA:10
 a=GfapET-l_dkBDNbsHL0A:9
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id BE59115941C;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id gZQ54oq4ddN2; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk [192.168.1.5])
 by dingwall.me.uk (Postfix) with ESMTP id 8521F159413;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 7FF5F140E15; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
From: james-xen@dingwall.me.uk
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Dec 2019 09:27:35 +0000
Message-Id: <20191204092739.18177-1-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMwp32QxQOJTLzY+MwLbkx+8ze7848ZeIpY21eg5iEbuT67dRWEDzBIZz+j+umI7w76y5rxBfu856CrHgxa/YOXRtUSORrITzE+v19eq5q76WJKpaTjQ
 /Pgitv451uww3oLLDbyDux7EtEXLFuyAuTfMdUyvcFYX3wXP/A6B+BWqqvQWxWnL2mo1qNVEPEoe2F8xZOStrT5vwPvGiyidTC1kPgtVHfQGxKC9V4F2jW/Z
 dVDu2Hl5Z/wcpKyVSwziTxnfUeiMinxW83EYh/C2+40=
Subject: [Xen-devel] [PATCH 0/4] xenstore domain: improve logging
 capabilities
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
Cc: wei.liu2@citrix.com, ian.jackson@eu.citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpXaGVuIHhlbnN0b3JlIGlzIHJ1biBhcyBhIGRvbWFpbiB0aGVyZSBpcyBubyB3YXkgdG8g
Z2V0IGxvZyBtZXNzYWdlcyBmcm9tIHRoZQpwcm9jZXNzLiAgVGhpcyBzbWFsbCBzZXJpZXMgYWRk
cyBhIG5ldyAtLXRyYWNlLXN5c2xvZyBvcHRpb24gd2hpY2ggd2lsbCBjb3B5CnRyYWNlKCkgYW5k
IHhwcmludGYoKSBtZXNzYWdlcyB0byBzeXNsb2csIGluIHRoZSBNaW5pT1MgY2FzZSB0aGlzIGRp
cmVjdHMgdG8KdGhlIGtlcm5lbCBwcmludGsoKS4gIFdoZW4gaXQgaXMgZW5hYmxlZCBpbiB0aGUg
eGVuc3RvcmUgZG9tYWluIG1lc3NhZ2VzIGFyZQpyZWNvcmRlZCBvbiB0aGUgaHlwZXJ2aXNvciBj
b25zb2xlIGFjY29yZGluZyB0byB0aGUgZ3Vlc3RfbG9nbHZsLgoKQSBuZXcgeGVuc3RvcmUgY29u
dHJvbCBpcyBhbHNvIGFkZGVkIHNvIHRoYXQgdGhlIGZ1bmN0aW9uYWxpdHkgY2FuIGJlIHRvZ2ds
ZWQKZHluYW1pY2FsbHkgYXQgcnVudGltZS4KCkkgdGhpbmsgdGhlcmUgaXMgcG9zc2libHkgc29t
ZSByb29tIGZvciBmdXJ0aGVyIGVuaGFuY2VtZW50cyBzbyB0aGF0IGl0IGlzCm1vcmUgZWFzaWx5
IHBvc3NpYmxlIHRvIGxvZyBhdCBkaWZmZXJlbnQgcHJpb3JpdGllcyByYXRoZXIgdGhhbiBhIHNp
bXBsZQp0cmFjZSgpID0gTE9HX0RFQlVHLCB4cHJpbnRmKCkgPSBMT0dfRVJSLiAgUGVyaGFwcyB0
aGUgYWRkaXRpb24gb2Ygc29tZQptb3JlIG1hY3JvcyBzaW1pbGFyIHRvIGVwcmludGYgY291bGQg
YmUgdXNlZnVsIHRvby4gIElmIHN1Y2ggY2hhbmdlIHdvdWxkCmJlIGNvbnNpZGVyZWQgdXNlZnVs
IHRoZW4gc29tZSBndWlkYW5jZSBvbiB0aGUgbW9zdCBhcHByb3ByaWF0ZSBkaXJlY3Rpb24KdG8g
dGFrZSB3b3VsZCBiZSBoZWxwZnVsLgoKVGhlIHNlcmllcyBpcyBiYXNlZCBvbiA0LjExLjMgYnV0
IEkgY2FuIHJlYmFzZSBpdCB0byBtYXN0ZXIuCgpKYW1lcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
