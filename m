Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316F1489F9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 15:39:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv04N-00020O-Nw; Fri, 24 Jan 2020 14:36:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li/E=3N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iv04L-00020J-Vq
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 14:36:22 +0000
X-Inumbo-ID: d9edb286-3eb6-11ea-8e9a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9edb286-3eb6-11ea-8e9a-bc764e2007e4;
 Fri, 24 Jan 2020 14:36:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iv044-0002ya-Fm; Fri, 24 Jan 2020 14:36:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iv044-0003tx-8E; Fri, 24 Jan 2020 14:36:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iv044-0003GL-7J; Fri, 24 Jan 2020 14:36:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146468-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=9a1f14ad721bbcd833ec5108944c44a502392f03
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Jan 2020 14:36:04 +0000
Subject: [Xen-devel] [ovmf test] 146468: regressions - FAIL
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

ZmxpZ2h0IDE0NjQ2OCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY0NjgvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgOWExZjE0YWQ3MjFiYmNkODMzZWM1MTA4OTQ0YzQ0YTUwMjM5MmYwMwpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICAxNiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgMTYgZGF5cyAgIDYwIGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NjM0NiAgMjAyMC0wMS0yMSAwNDozMToyNyBaICAgIDMgZGF5cyAgIDEyIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFhcm9uIExp
IDxhYXJvbi5saUBpbnRlbC5jb20+CiAgQWxiZWNraSwgTWF0ZXVzeiA8bWF0ZXVzei5hbGJlY2tp
QGludGVsLmNvbT4KICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4K
ICBBc2hpc2ggU2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CiAgQm9iIEZlbmcgPGJv
Yi5jLmZlbmdAaW50ZWwuY29tPgogIEJyaWFuIFIgSGF1ZyA8YnJpYW4uci5oYXVnQGludGVsLmNv
bT4KICBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1
eC5mYW5AaW50ZWwuY29tPgogIEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgSmFzb24g
Vm9lbHogPGphc29uLnZvZWx6QGludGVsLmNvbT4KICBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdA
aW50ZWwuY29tPgogIEtyenlzenRvZiBLb2NoIDxrcnp5c3p0b2Yua29jaEBhcm0uY29tPgogIExh
c3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CiAgTGVpZiBMaW5kaG9sbSA8bGVpZi5saW5k
aG9sbUBsaW5hcm8ub3JnPgogIExpLCBBYXJvbiA8YWFyb24ubGlAaW50ZWwuY29tPgogIExpbWlu
ZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogIE1hdGV1c3ogQWxiZWNraSA8bWF0ZXVzei5h
bGJlY2tpQGludGVsLmNvbT4KICBNaWNoYWVsIEQgS2lubmV5IDxtaWNoYWVsLmQua2lubmV5QGlu
dGVsLmNvbT4KICBNaWNoYWVsIEt1YmFja2kgPG1pY2hhZWwuYS5rdWJhY2tpQGludGVsLmNvbT4K
ICBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZD8g
PHBoaWxtZEByZWRoYXQuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZGUgPHBoaWxtZEByZWRo
YXQuY29tPgogIFNpeXVhbiBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBTaXl1YW4sIEZ1IDxz
aXl1YW4uZnVAaW50ZWwuY29tPgogIFN1ZGlwdG8gUGF1bCA8c3VkaXB0by5wYXVsQGFybS5jb20+
CiAgVml0YWx5IENoZXB0c292IDx2aXQ5Njk2QHByb3Rvbm1haWwuY29tPgogIFZpdGFseSBDaGVw
dHNvdiB2aWEgR3JvdXBzLklvIDx2aXQ5Njk2PXByb3Rvbm1haWwuY29tQGdyb3Vwcy5pbz4KICBX
ZWk2IFh1IDx3ZWk2Lnh1QGludGVsLmNvbT4KICBYdSwgV2VpNiA8d2VpNi54dUBpbnRlbC5jb20+
CiAgWmhpZ3VhbmcgTGl1IDx6aGlndWFuZy5saXVAaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhp
anV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmly
dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1h
bWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhs
LXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dz
OiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmln
IGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywg
YW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtm
PVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpO
b3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDExNjQgbGluZXMgbG9u
Zy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
