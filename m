Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E71141626
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 06:40:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isgmZ-00058E-JX; Sat, 18 Jan 2020 05:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wm0G=3H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1isgmX-000589-Jz
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 05:36:25 +0000
X-Inumbo-ID: 6ad6d974-39b4-11ea-aecd-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ad6d974-39b4-11ea-aecd-bc764e2007e4;
 Sat, 18 Jan 2020 05:36:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1isgmA-0003AZ-VR; Sat, 18 Jan 2020 05:36:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1isgmA-0007Ei-EM; Sat, 18 Jan 2020 05:36:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1isgmA-0000aS-CD; Sat, 18 Jan 2020 05:36:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146186-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=302eb57b18d9ac70270c18a9a2a2630cba98f8ab
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Jan 2020 05:36:02 +0000
Subject: [Xen-devel] [ovmf test] 146186: regressions - FAIL
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

ZmxpZ2h0IDE0NjE4NiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYxODYvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgMzAyZWI1N2IxOGQ5YWM3MDI3MGMxOGE5YTJhMjYzMGNiYTk4ZjhhYgpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICAxMCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgMTAgZGF5cyAgIDQwIGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NjE4NiAgMjAyMC0wMS0xNyAwNzo1MDo1OSBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFhcm9uIExp
IDxhYXJvbi5saUBpbnRlbC5jb20+CiAgQWxiZWNraSwgTWF0ZXVzeiA8bWF0ZXVzei5hbGJlY2tp
QGludGVsLmNvbT4KICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4K
ICBBc2hpc2ggU2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CiAgQnJpYW4gUiBIYXVn
IDxicmlhbi5yLmhhdWdAaW50ZWwuY29tPgogIEVyaWMgRG9uZyA8ZXJpYy5kb25nQGludGVsLmNv
bT4KICBGYW4sIFpoaWp1WCA8emhpanV4LmZhbkBpbnRlbC5jb20+CiAgSGFvIEEgV3UgPGhhby5h
Lnd1QGludGVsLmNvbT4KICBKYXNvbiBWb2VseiA8amFzb24udm9lbHpAaW50ZWwuY29tPgogIEty
enlzenRvZiBLb2NoIDxrcnp5c3p0b2Yua29jaEBhcm0uY29tPgogIExhc3psbyBFcnNlayA8bGVy
c2VrQHJlZGhhdC5jb20+CiAgTGksIEFhcm9uIDxhYXJvbi5saUBpbnRlbC5jb20+CiAgTGltaW5n
IEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgTWF0ZXVzeiBBbGJlY2tpIDxtYXRldXN6LmFs
YmVja2lAaW50ZWwuY29tPgogIE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hhZWwuZC5raW5uZXlAaW50
ZWwuY29tPgogIE1pY2hhZWwgS3ViYWNraSA8bWljaGFlbC5hLmt1YmFja2lAaW50ZWwuY29tPgog
IFBhdmFuYS5LIDxwYXZhbmEua0BpbnRlbC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkPyA8
cGhpbG1kQHJlZGhhdC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkZSA8cGhpbG1kQHJlZGhh
dC5jb20+CiAgU2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgogIFNpeXVhbiwgRnUgPHNp
eXVhbi5mdUBpbnRlbC5jb20+CiAgU3VkaXB0byBQYXVsIDxzdWRpcHRvLnBhdWxAYXJtLmNvbT4K
ICBWaXRhbHkgQ2hlcHRzb3YgPHZpdDk2OTZAcHJvdG9ubWFpbC5jb20+CiAgVml0YWx5IENoZXB0
c292IHZpYSBHcm91cHMuSW8gPHZpdDk2OTY9cHJvdG9ubWFpbC5jb21AZ3JvdXBzLmlvPgogIFpo
aWd1YW5nIExpdSA8emhpZ3VhbmcubGl1QGludGVsLmNvbT4KICBaaGlqdS5GYW4gPHpoaWp1eC5m
YW5AaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
bWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFt
ZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQg
ICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11
dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAoKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1y
ZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hv
bWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxl
cywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBv
ZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFE
TUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1
c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA3MzcgbGluZXMgbG9uZy4pCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
