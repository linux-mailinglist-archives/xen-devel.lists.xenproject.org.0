Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAB0151509
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 05:38:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iypvg-0000pl-RG; Tue, 04 Feb 2020 04:35:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JqNd=3Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iypvf-0000pc-AU
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 04:35:15 +0000
X-Inumbo-ID: b981964e-4707-11ea-8ecb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b981964e-4707-11ea-8ecb-12813bfff9fa;
 Tue, 04 Feb 2020 04:35:09 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iypvY-0005OI-Bq; Tue, 04 Feb 2020 04:35:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iypvY-0000ZX-2L; Tue, 04 Feb 2020 04:35:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iypvY-0001do-1h; Tue, 04 Feb 2020 04:35:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146709-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=eafd990f2606431d45cf0bbdbfee6d5959628de7
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Feb 2020 04:35:08 +0000
Subject: [Xen-devel] [ovmf test] 146709: regressions - FAIL
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

ZmxpZ2h0IDE0NjcwOSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY3MDkvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgZWFmZDk5MGYyNjA2NDMxZDQ1Y2YwYmJkYmZlZTZkNTk1OTYyOGRlNwpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICAyNyBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgMjcgZGF5cyAgMTAwIGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NjYzNCAgMjAyMC0wMi0wMSAwMTo1NDoyMyBaICAgIDMgZGF5cyAgIDExIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFhcm9uIExp
IDxhYXJvbi5saUBpbnRlbC5jb20+CiAgQWxiZWNraSwgTWF0ZXVzeiA8bWF0ZXVzei5hbGJlY2tp
QGludGVsLmNvbT4KICBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
ICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICBBc2hpc2ggU2lu
Z2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CiAgQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50
ZWwuY29tPgogIEJyaWFuIFIgSGF1ZyA8YnJpYW4uci5oYXVnQGludGVsLmNvbT4KICBFcmljIERv
bmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1eC5mYW5AaW50ZWwu
Y29tPgogIEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgSmFzb24gVm9lbHogPGphc29u
LnZvZWx6QGludGVsLmNvbT4KICBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdAaW50ZWwuY29tPgog
IEtyenlzenRvZiBLb2NoIDxrcnp5c3p0b2Yua29jaEBhcm0uY29tPgogIExhc3psbyBFcnNlayA8
bGVyc2VrQHJlZGhhdC5jb20+CiAgTGVpZiBMaW5kaG9sbSA8bGVpZi5saW5kaG9sbUBsaW5hcm8u
b3JnPgogIExpLCBBYXJvbiA8YWFyb24ubGlAaW50ZWwuY29tPgogIExpbWluZyBHYW8gPGxpbWlu
Zy5nYW9AaW50ZWwuY29tPgogIE1hdGV1c3ogQWxiZWNraSA8bWF0ZXVzei5hbGJlY2tpQGludGVs
LmNvbT4KICBNaWNoYWVsIEQgS2lubmV5IDxtaWNoYWVsLmQua2lubmV5QGludGVsLmNvbT4KICBN
aWNoYWVsIEt1YmFja2kgPG1pY2hhZWwuYS5rdWJhY2tpQGludGVsLmNvbT4KICBQYXZhbmEuSyA8
cGF2YW5hLmtAaW50ZWwuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZD8gPHBoaWxtZEByZWRo
YXQuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29tPgogIFNp
eXVhbiBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBTaXl1YW4sIEZ1IDxzaXl1YW4uZnVAaW50
ZWwuY29tPgogIFN1ZGlwdG8gUGF1bCA8c3VkaXB0by5wYXVsQGFybS5jb20+CiAgVml0YWx5IENo
ZXB0c292IDx2aXQ5Njk2QHByb3Rvbm1haWwuY29tPgogIFZpdGFseSBDaGVwdHNvdiB2aWEgR3Jv
dXBzLklvIDx2aXQ5Njk2PXByb3Rvbm1haWwuY29tQGdyb3Vwcy5pbz4KICBXZWk2IFh1IDx3ZWk2
Lnh1QGludGVsLmNvbT4KICBYdSwgV2VpNiA8d2VpNi54dUBpbnRlbC5jb20+CiAgWmhpZ3Vhbmcg
TGl1IDx6aGlndWFuZy5saXVAaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRl
bC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
YnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZv
cHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAg
ICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYt
YW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1m
bGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dz
L2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMu
IGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
L29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rl
c3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1t
YXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4K
CihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDE3ODAgbGluZXMgbG9uZy4pCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
