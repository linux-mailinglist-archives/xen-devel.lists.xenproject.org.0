Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48D14209F
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 23:58:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itJRi-0000Kk-6M; Sun, 19 Jan 2020 22:53:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4S1E=3I=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1itJRg-0000Kf-Oi
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 22:53:28 +0000
X-Inumbo-ID: 7d95abca-3b0e-11ea-b8f3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d95abca-3b0e-11ea-b8f3-12813bfff9fa;
 Sun, 19 Jan 2020 22:53:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itJRY-00048d-OX; Sun, 19 Jan 2020 22:53:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itJRY-00027O-C7; Sun, 19 Jan 2020 22:53:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1itJRY-0001Hu-BT; Sun, 19 Jan 2020 22:53:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146274-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=5cd3d4bc43e543caf5f78baaacced8aaf04c1d91
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Jan 2020 22:53:20 +0000
Subject: [Xen-devel] [ovmf test] 146274: regressions - FAIL
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

ZmxpZ2h0IDE0NjI3NCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYyNzQvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgNWNkM2Q0YmM0M2U1NDNjYWY1Zjc4YmFhYWNjZWQ4YWFmMDRjMWQ5MQpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICAxMSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgMTEgZGF5cyAgIDQ0IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NjI1OSAgMjAyMC0wMS0xOSAxMjoyNzozMyBaICAgIDAgZGF5cyAgICAyIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFhcm9uIExp
IDxhYXJvbi5saUBpbnRlbC5jb20+CiAgQWxiZWNraSwgTWF0ZXVzeiA8bWF0ZXVzei5hbGJlY2tp
QGludGVsLmNvbT4KICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4K
ICBBc2hpc2ggU2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CiAgQm9iIEZlbmcgPGJv
Yi5jLmZlbmdAaW50ZWwuY29tPgogIEJyaWFuIFIgSGF1ZyA8YnJpYW4uci5oYXVnQGludGVsLmNv
bT4KICBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1
eC5mYW5AaW50ZWwuY29tPgogIEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgSmFzb24g
Vm9lbHogPGphc29uLnZvZWx6QGludGVsLmNvbT4KICBLcnp5c3p0b2YgS29jaCA8a3J6eXN6dG9m
LmtvY2hAYXJtLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIExlaWYg
TGluZGhvbG0gPGxlaWYubGluZGhvbG1AbGluYXJvLm9yZz4KICBMaSwgQWFyb24gPGFhcm9uLmxp
QGludGVsLmNvbT4KICBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICBNYXRldXN6
IEFsYmVja2kgPG1hdGV1c3ouYWxiZWNraUBpbnRlbC5jb20+CiAgTWljaGFlbCBEIEtpbm5leSA8
bWljaGFlbC5kLmtpbm5leUBpbnRlbC5jb20+CiAgTWljaGFlbCBLdWJhY2tpIDxtaWNoYWVsLmEu
a3ViYWNraUBpbnRlbC5jb20+CiAgUGF2YW5hLksgPHBhdmFuYS5rQGludGVsLmNvbT4KICBQaGls
aXBwZSBNYXRoaWV1LURhdWQ/IDxwaGlsbWRAcmVkaGF0LmNvbT4KICBQaGlsaXBwZSBNYXRoaWV1
LURhdWRlIDxwaGlsbWRAcmVkaGF0LmNvbT4KICBTaXl1YW4gRnUgPHNpeXVhbi5mdUBpbnRlbC5j
b20+CiAgU2l5dWFuLCBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBTdWRpcHRvIFBhdWwgPHN1
ZGlwdG8ucGF1bEBhcm0uY29tPgogIFZpdGFseSBDaGVwdHNvdiA8dml0OTY5NkBwcm90b25tYWls
LmNvbT4KICBWaXRhbHkgQ2hlcHRzb3YgdmlhIEdyb3Vwcy5JbyA8dml0OTY5Nj1wcm90b25tYWls
LmNvbUBncm91cHMuaW8+CiAgV2VpNiBYdSA8d2VpNi54dUBpbnRlbC5jb20+CiAgWHUsIFdlaTYg
PHdlaTYueHVAaW50ZWwuY29tPgogIFpoaWd1YW5nIExpdSA8emhpZ3VhbmcubGl1QGludGVsLmNv
bT4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0
LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFt
ZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAK
IHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAg
ICAgICBmYWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9p
bWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRw
Oi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9u
IG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFE
TUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBj
YW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVz
dC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3Vs
ZCBiZSAxMTE5IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
