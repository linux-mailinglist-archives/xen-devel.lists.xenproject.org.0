Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B29108102
	for <lists+xen-devel@lfdr.de>; Sun, 24 Nov 2019 00:24:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYeim-0007eX-5Y; Sat, 23 Nov 2019 23:21:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyTH=ZP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iYeik-0007eS-M3
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 23:21:42 +0000
X-Inumbo-ID: feaac5d6-0e47-11ea-b08b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id feaac5d6-0e47-11ea-b08b-bc764e2007e4;
 Sat, 23 Nov 2019 23:21:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iYeie-0007p1-4N; Sat, 23 Nov 2019 23:21:36 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iYeid-0003jR-Qr; Sat, 23 Nov 2019 23:21:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iYeid-0006i4-Q7; Sat, 23 Nov 2019 23:21:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144269-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: examine:examine-rochester0:reboot:fail:nonblocking
 examine:examine-fiano1:hosts-allocate:starved:nonblocking
 examine:examine-albana0:hosts-allocate:starved:nonblocking
 examine:examine-rimava1:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe1:hosts-allocate:starved:nonblocking
 examine:examine-pinot0:hosts-allocate:starved:nonblocking
 examine:examine-huxelrebe0:hosts-allocate:starved:nonblocking
 examine:examine-elbling1:hosts-allocate:starved:nonblocking
 examine:examine-debina1:hosts-allocate:starved:nonblocking
 examine:examine-pinot1:hosts-allocate:starved:nonblocking
 examine:examine-italia0:hosts-allocate:starved:nonblocking
 examine:examine-albana1:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay0:hosts-allocate:starved:nonblocking
 examine:examine-cubietruck-metzinger:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-godello1:hosts-allocate:starved:nonblocking
 examine:examine-baroque0:hosts-allocate:starved:nonblocking
 examine:examine-fiano0:hosts-allocate:starved:nonblocking
 examine:examine-chardonnay1:hosts-allocate:starved:nonblocking
 examine:examine-cubietruck-gleizes:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=143068
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 Nov 2019 23:21:35 +0000
Subject: [Xen-devel] [examine test] 144269: tolerable trouble:
 fail/pass/starved
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZmxpZ2h0IDE0NDI2OSBleGFtaW5lIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQyNjkvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJl
Z3Jlc3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9j
a2luZzoKIGV4YW1pbmUtcm9jaGVzdGVyMCAgICAgICAgICAgIDggcmVib290ICAgICAgICAgICAg
ICAgICAgZmFpbCBibG9ja2VkIGluIDE0MzA2OAogZXhhbWluZS1maWFubzEgICAgICAgICAgICAg
ICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1h
bGJhbmEwICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2
ZWQgIG4vYQogZXhhbWluZS1yaW1hdmExICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAg
ICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1nb2RlbGxvMCAgICAgICAgICAgICAg
MiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1odXhl
bHJlYmUxICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQg
IG4vYQogZXhhbWluZS1waW5vdDAgICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAg
ICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1odXhlbHJlYmUwICAgICAgICAgICAgMiBo
b3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1lbGJsaW5n
MSAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4v
YQogZXhhbWluZS1kZWJpbmExICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAg
ICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1waW5vdDEgICAgICAgICAgICAgICAgMiBob3N0
cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1pdGFsaWEwICAg
ICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQog
ZXhhbWluZS1hbGJhbmExICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAg
ICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1kZWJpbmEwICAgICAgICAgICAgICAgMiBob3N0cy1h
bGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1jaGFyZG9ubmF5MCAg
ICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhh
bWluZS1jdWJpZXRydWNrLW1ldHppbmdlciAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAg
IHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1lbGJsaW5nMCAgICAgICAgICAgICAgMiBob3N0cy1hbGxv
Y2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1nb2RlbGxvMSAgICAgICAg
ICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWlu
ZS1iYXJvcXVlMCAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0
YXJ2ZWQgIG4vYQogZXhhbWluZS1maWFubzAgICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0
ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1jaGFyZG9ubmF5MSAgICAgICAg
ICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2ZWQgIG4vYQogZXhhbWluZS1j
dWJpZXRydWNrLWdsZWl6ZXMgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgIHN0YXJ2
ZWQgIG4vYQoKYmFzZWxpbmUgdmVyc2lvbjoKIGZsaWdodCAgICAgICAgICAgICAgIDE0MzA2OAoK
am9iczoKIGV4YW1pbmUtYWxiYW5hMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGFydmVkIAogZXhhbWluZS1hbGJhbmExICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ2ZWQgCiBleGFtaW5lLWJhcm9xdWUwICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUt
YXJuZGFsZS1ibHVld2F0ZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogZXhhbWluZS1jdWJpZXRydWNrLWJyYXF1ZSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWNoYXJkb25uYXkwICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtY2hhcmRvbm5heTEgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydmVkIAogZXhhbWluZS1k
ZWJpbmEwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ2
ZWQgCiBleGFtaW5lLWRlYmluYTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtZWxibGluZzAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdGFydmVkIAogZXhhbWluZS1lbGJsaW5nMSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ2ZWQgCiBleGFtaW5lLWZp
YW5vMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZl
ZCAKIGV4YW1pbmUtZmlhbm8xICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGFydmVkIAogZXhhbWluZS1jdWJpZXRydWNrLWdsZWl6ZXMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXJ2ZWQgCiBleGFtaW5lLWdvZGVsbG8wICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtZ29k
ZWxsbzEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydmVk
IAogZXhhbWluZS1odXhlbHJlYmUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0YXJ2ZWQgCiBleGFtaW5lLWh1eGVscmViZTEgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtaXRhbGlhMCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydmVkIAogZXhhbWluZS1hcm5k
YWxlLWxha2VzaWRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBleGFtaW5lLWxheHRvbjAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGV4YW1pbmUtbGF4dG9uMSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1hcm5kYWxlLW1ldHJvY2VudHJl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWN1Ymll
dHJ1Y2stbWV0emluZ2VyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAK
IGV4YW1pbmUtY3ViaWV0cnVjay1waWNhc3NvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogZXhhbWluZS1waW5vdDAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXJ2ZWQgCiBleGFtaW5lLXBpbm90MSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtcmltYXZh
MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydmVkIAog
ZXhhbWluZS1yb2NoZXN0ZXIwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZhaWwgICAgCiBleGFtaW5lLXJvY2hlc3RlcjEgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtYXJuZGFsZS13ZXN0ZmllbGQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQt
ZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9n
cy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRj
LiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0
ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9
bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaCBub3QgYXBw
bGljYWJsZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
