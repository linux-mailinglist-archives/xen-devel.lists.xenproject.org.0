Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A328F67F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 23:36:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyNLq-0002xw-VY; Thu, 15 Aug 2019 21:32:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H7zX=WL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hyNLq-0002xk-8V
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 21:32:06 +0000
X-Inumbo-ID: 20767e82-bfa4-11e9-b90c-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20767e82-bfa4-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 21:32:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hyNLo-0000de-LY; Thu, 15 Aug 2019 21:32:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hyNLo-0006PE-FY; Thu, 15 Aug 2019 21:32:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hyNLo-00053O-Ew; Thu, 15 Aug 2019 21:32:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140162-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-amd64-xsm:xen-build:fail:regression
X-Osstest-Versions-This: ovmf=48d8d4d80bb299af5422312d92b044cb10a2e790
X-Osstest-Versions-That: ovmf=f5892aa8d8bfbe8e6af5c9765faad8cfe877c334
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Aug 2019 21:32:04 +0000
Subject: [Xen-devel] [ovmf test] 140162: regressions - FAIL
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

ZmxpZ2h0IDE0MDE2MiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDAxNjIvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgIDYgeGVu
LWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MDE0NAoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIDQ4ZDhkNGQ4MGJiMjk5YWY1
NDIyMzEyZDkyYjA0NGNiMTBhMmU3OTAKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIGY1ODkyYWE4ZDhiZmJlOGU2YWY1Yzk3NjVmYWFkOGNmZTg3N2MzMzQKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDE0MDE0NCAgMjAxOS0wOC0xNSAwMTozOTozMyBaICAgIDAgZGF5cwpUZXN0
aW5nIHNhbWUgc2luY2UgICAxNDAxNjIgIDIwMTktMDgtMTUgMTI6NDk6NTIgWiAgICAwIGRheXMg
ICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVz
dDoKICBDaGFzZWwgQ2hpdSA8Y2hhc2VsLmNoaXVAaW50ZWwuY29tPgogIEVyaWMgSmluIDxlcmlj
LmppbkBpbnRlbC5jb20+CiAgSmlhbiBKIFdhbmcgPGppYW4uai53YW5nQGludGVsLmNvbT4KICBK
aW4sIEVyaWMgPGVyaWMuamluQGludGVsLmNvbT4KICBMZWlmIExpbmRob2xtIDxsZWlmLmxpbmRo
b2xtQGxpbmFyby5vcmc+CiAgTWljaGFlbCBEIEtpbm5leSA8bWljaGFlbC5kLmtpbm5leUBpbnRl
bC5jb20+CiAgU2VhbiBCcm9nYW4gPHNlYW4uYnJvZ2FuQG1pY3Jvc29mdC5jb20+CiAgU2hlbmds
ZWkgWmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBXYW5nIEZhbiA8ZmFuLndhbmdA
aW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0
LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1v
dm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBv
cnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUv
bG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywg
ZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBv
c3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7
aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hp
bmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAzMzQgbGluZXMgbG9uZy4pCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
