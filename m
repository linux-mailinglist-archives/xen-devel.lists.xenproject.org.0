Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC416484B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:17:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4R4o-0001uS-6O; Wed, 19 Feb 2020 15:15:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v64B=4H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j4R4n-0001uM-DN
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:15:49 +0000
X-Inumbo-ID: b1f80866-532a-11ea-839f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f80866-532a-11ea-839f-12813bfff9fa;
 Wed, 19 Feb 2020 15:15:42 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j4R4g-00088r-Jl; Wed, 19 Feb 2020 15:15:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j4R4f-0004F4-WE; Wed, 19 Feb 2020 15:15:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j4R4f-0006df-Vh; Wed, 19 Feb 2020 15:15:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-147229-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=f1d78c489a39971b5aac5d2fc8a39bfa925c3c5d
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Feb 2020 15:15:41 +0000
Subject: [Xen-devel] [ovmf test] 147229: regressions - FAIL
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

ZmxpZ2h0IDE0NzIyOSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDcyMjkvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQ1NzY3CiB0ZXN0LWFtZDY0
LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgZjFkNzhjNDg5YTM5OTcxYjVhYWM1ZDJmYzhhMzliZmE5MjVjM2M1ZApiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICA0MiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgNDIgZGF5cyAgMTI3IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NzA5MyAgMjAyMC0wMi0xNSAxNjoxOToxNyBaICAgIDMgZGF5cyAgICAzIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFhcm9uIExp
IDxhYXJvbi5saUBpbnRlbC5jb20+CiAgQWxiZWNraSwgTWF0ZXVzeiA8bWF0ZXVzei5hbGJlY2tp
QGludGVsLmNvbT4KICBBbW9sIE4gU3VrZXJrYXIgPGFtb2wubi5zdWtlcmthckBpbnRlbC5jb20+
CiAgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQW50b2luZSBD
b2V1ciA8Y29ldXJAZ214LmZyPgogIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5h
cm8ub3JnPgogIEFzaGlzaCBTaW5naGFsIDxhc2hpc2hzaW5naGFAbnZpZGlhLmNvbT4KICBCb2Ig
RmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgQnJldCBCYXJrZWxldyA8YnJiYXJrZWxAbWlj
cm9zb2Z0LmNvbT4KICBCcmlhbiBSIEhhdWcgPGJyaWFuLnIuaGF1Z0BpbnRlbC5jb20+CiAgQ2hh
c2VsIENoaXUgPGNoYXNlbC5jaGl1QGludGVsLmNvbT4KICBEYW5kYW4gQmkgPGRhbmRhbi5iaUBp
bnRlbC5jb20+CiAgRXJpYyBEb25nIDxlcmljLmRvbmdAaW50ZWwuY29tPgogIEZhbiwgWmhpanVY
IDx6aGlqdXguZmFuQGludGVsLmNvbT4KICBGZWxpeCBQb2x5dWRvdiA8ZmVsaXhwQGFtaS5jb20+
CiAgR3VvIERvbmcgPGd1by5kb25nQGludGVsLmNvbT4KICBHdW9NaW5KIDxuZXdleHBsb3JlcmpA
Z21haWwuY29tPgogIEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgSGVuZyBMdW8gPGhl
bmcubHVvQGludGVsLmNvbT4KICBKYXNvbiBWb2VseiA8amFzb24udm9lbHpAaW50ZWwuY29tPgog
IEplZmYgQnJhc2VuIDxqYnJhc2VuQG52aWRpYS5jb20+CiAgSmlhbiBKIFdhbmcgPGppYW4uai53
YW5nQGludGVsLmNvbT4KICBLaW5uZXksIE1pY2hhZWwgRCA8bWljaGFlbC5kLmtpbm5leUBpbnRl
bC5jb20+CiAgS3J6eXN6dG9mIEtvY2ggPGtyenlzenRvZi5rb2NoQGFybS5jb20+CiAgTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBMZWlmIExpbmRob2xtIDxsZWlmLmxpbmRob2xt
QGxpbmFyby5vcmc+CiAgTGksIEFhcm9uIDxhYXJvbi5saUBpbnRlbC5jb20+CiAgTGltaW5nIEdh
byA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgTGl1LCBaaGlndWFuZyA8emhpZ3VhbmcubGl1QGlu
dGVsLmNvbT4KICBNYXRldXN6IEFsYmVja2kgPG1hdGV1c3ouYWxiZWNraUBpbnRlbC5jb20+CiAg
TWF0dGhldyBDYXJsc29uIDxtYWNhcmxAbWljcm9zb2Z0LmNvbT4KICBNaWNoYWVsIEQgS2lubmV5
IDxtaWNoYWVsLmQua2lubmV5QGludGVsLmNvbT4KICBNaWNoYWVsIEt1YmFja2kgPG1pY2hhZWwu
YS5rdWJhY2tpQGludGVsLmNvbT4KICBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwuY29tPgogIFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZD8gPHBoaWxtZEByZWRoYXQuY29tPgogIFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxk
ZXZlbEBlZGsyLmdyb3Vwcy5pbz4KICBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJl
ZGhhdC5jb20+CiAgUGllcnJlIEdvbmRvaXMgPHBpZXJyZS5nb25kb2lzQGFybS5jb20+CiAgUmF5
IE5pIDxyYXkubmlAaW50ZWwuY29tPgogIFNhbWkgTXVqYXdhciA8c2FtaS5tdWphd2FyQGFybS5j
b20+CiAgU2VhbiBCcm9nYW4gPHNlYW4uYnJvZ2FuQG1pY3Jvc29mdC5jb20+CiAgU2l5dWFuIEZ1
IDxzaXl1YW4uZnVAaW50ZWwuY29tPgogIFNpeXVhbiwgRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+
CiAgU3RldmVuIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KICBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hp
QGludGVsLmNvbT4KICBTdWRpcHRvIFBhdWwgPHN1ZGlwdG8ucGF1bEBhcm0uY29tPgogIFZpdGFs
eSBDaGVwdHNvdiA8dml0OTY5NkBwcm90b25tYWlsLmNvbT4KICBWaXRhbHkgQ2hlcHRzb3Ygdmlh
IEdyb3Vwcy5JbyA8dml0OTY5Nj1wcm90b25tYWlsLmNvbUBncm91cHMuaW8+CiAgV2VpNiBYdSA8
d2VpNi54dUBpbnRlbC5jb20+CiAgWHUsIFdlaTYgPHdlaTYueHVAaW50ZWwuY29tPgogIFpoaWNo
YW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+CiAgWmhpZ3VhbmcgTGl1IDx6aGlndWFuZy5s
aXVAaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgog
YnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3Bz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRl
c3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAg
ICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVz
dC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAv
aG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUg
YXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoK
RXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwg
aXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9
YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFy
bmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBs
b2c7IGl0IHdvdWxkIGJlIDUzMTcgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
