Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F706167A13
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:02:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j556a-0005Hu-Rk; Fri, 21 Feb 2020 10:00:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wNFe=4J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j556Y-0005Dc-QX
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:00:18 +0000
X-Inumbo-ID: f5bf9034-5490-11ea-8614-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5bf9034-5490-11ea-8614-12813bfff9fa;
 Fri, 21 Feb 2020 10:00:16 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j556V-0007RI-O6; Fri, 21 Feb 2020 10:00:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j556V-000523-AM; Fri, 21 Feb 2020 10:00:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j556V-00027p-9e; Fri, 21 Feb 2020 10:00:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-147305-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=0997352ddb4761c49dfedf6fef46b4cd15f6c9bf
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Feb 2020 10:00:15 +0000
Subject: [Xen-devel] [ovmf test] 147305: regressions - FAIL
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

ZmxpZ2h0IDE0NzMwNSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDczMDUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQ1NzY3CiB0ZXN0LWFtZDY0
LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgMDk5NzM1MmRkYjQ3NjFjNDlkZmVkZjZmZWY0NmI0Y2QxNWY2YzliZgpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICA0NCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgNDQgZGF5cyAgMTI4IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NzMwNSAgMjAyMC0wMi0xOSAxNToxNjo0MSBaICAgIDEgZGF5cyAgICAxIGF0dGVtcHRz
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
Z21haWwuY29tPgogIEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgSGVpbnJpY2ggU2No
dWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgogIEhlbmcgTHVvIDxoZW5nLmx1b0BpbnRlbC5j
b20+CiAgSmFzb24gVm9lbHogPGphc29uLnZvZWx6QGludGVsLmNvbT4KICBKZWZmIEJyYXNlbiA8
amJyYXNlbkBudmlkaWEuY29tPgogIEppYW4gSiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+
CiAgSmlheGluIFd1IDxqaWF4aW4ud3VAaW50ZWwuY29tPgogIEtpbm5leSwgTWljaGFlbCBEIDxt
aWNoYWVsLmQua2lubmV5QGludGVsLmNvbT4KICBLcnp5c3p0b2YgS29jaCA8a3J6eXN6dG9mLmtv
Y2hAYXJtLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIExlaWYgTGlu
ZGhvbG0gPGxlaWYubGluZGhvbG1AbGluYXJvLm9yZz4KICBMaSwgQWFyb24gPGFhcm9uLmxpQGlu
dGVsLmNvbT4KICBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICBMaXUsIFpoaWd1
YW5nIDx6aGlndWFuZy5saXVAaW50ZWwuY29tPgogIE1hdGV1c3ogQWxiZWNraSA8bWF0ZXVzei5h
bGJlY2tpQGludGVsLmNvbT4KICBNYXR0aGV3IENhcmxzb24gPG1hY2FybEBtaWNyb3NvZnQuY29t
PgogIE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hhZWwuZC5raW5uZXlAaW50ZWwuY29tPgogIE1pY2hh
ZWwgS3ViYWNraSA8bWljaGFlbC5hLmt1YmFja2lAaW50ZWwuY29tPgogIFBhdmFuYS5LIDxwYXZh
bmEua0BpbnRlbC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkPyA8cGhpbG1kQHJlZGhhdC5j
b20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkZSA8cGhpbG1kQHJlZGhhdC5jb20+CiAgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPGRldmVsQGVkazIuZ3JvdXBzLmlvPgogIFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KICBQaWVycmUgR29uZG9pcyA8cGllcnJlLmdv
bmRvaXNAYXJtLmNvbT4KICBSYXkgTmkgPHJheS5uaUBpbnRlbC5jb20+CiAgU2FtaSBNdWphd2Fy
IDxzYW1pLm11amF3YXJAYXJtLmNvbT4KICBTZWFuIEJyb2dhbiA8c2Vhbi5icm9nYW5AbWljcm9z
b2Z0LmNvbT4KICBTaXl1YW4gRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+CiAgU2l5dWFuLCBGdSA8
c2l5dWFuLmZ1QGludGVsLmNvbT4KICBTdGFyIFplbmcgPHN0YXIuemVuZ0BpbnRlbC5jb20+CiAg
U3RldmVuIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KICBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGlu
dGVsLmNvbT4KICBTdWRpcHRvIFBhdWwgPHN1ZGlwdG8ucGF1bEBhcm0uY29tPgogIFZpdGFseSBD
aGVwdHNvdiA8dml0OTY5NkBwcm90b25tYWlsLmNvbT4KICBWaXRhbHkgQ2hlcHRzb3YgdmlhIEdy
b3Vwcy5JbyA8dml0OTY5Nj1wcm90b25tYWlsLmNvbUBncm91cHMuaW8+CiAgV2VpNiBYdSA8d2Vp
Ni54dUBpbnRlbC5jb20+CiAgV3UgSmlheGluIDxqaWF4aW4ud3VAaW50ZWwuY29tPgogIFh1LCBX
ZWk2IDx3ZWk2Lnh1QGludGVsLmNvbT4KICBaZW5nLCBTdGFyIDxzdGFyLnplbmdAaW50ZWwuY29t
PgogIFpoaWNoYW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+CiAgWmhpZ3VhbmcgTGl1IDx6
aGlndWFuZy5saXVAaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5jb20+
Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
aTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1p
Mzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQg
b24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MK
aW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBh
dmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4g
Z2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rl
c3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIK
ClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyBy
ZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDU2NTYgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
