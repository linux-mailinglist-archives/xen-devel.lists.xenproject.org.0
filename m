Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E6169252
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2020 00:37:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5eHo-0003BF-2a; Sat, 22 Feb 2020 23:34:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jYGW=4K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j5eHm-0003BA-PG
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 23:34:14 +0000
X-Inumbo-ID: d1da0050-55cb-11ea-898c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1da0050-55cb-11ea-898c-12813bfff9fa;
 Sat, 22 Feb 2020 23:34:07 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j5eHf-0007hN-4y; Sat, 22 Feb 2020 23:34:07 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j5eHe-0008QF-OR; Sat, 22 Feb 2020 23:34:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j5eHe-0002Ps-Np; Sat, 22 Feb 2020 23:34:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-147395-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 22 Feb 2020 23:34:06 +0000
Subject: [Xen-devel] [ovmf test] 147395: regressions - FAIL
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

ZmxpZ2h0IDE0NzM5NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDczOTUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQ1NzY3CiB0ZXN0LWFtZDY0
LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgMWQzMjE1ZmQyNGY0N2VhYTQ4Nzc1NDJhNTliNGJiZjVhZmMwY2ZlOApiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICA0NSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgNDUgZGF5cyAgMTI5IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NzM5NSAgMjAyMC0wMi0yMSAxMDowMToyMCBaICAgIDEgZGF5cyAgICAxIGF0dGVtcHRz
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
ZWwgS3ViYWNraSA8bWljaGFlbC5hLmt1YmFja2lAaW50ZWwuY29tPgogIE5pY2hvbGFzIEFybW91
ciA8bmljaG9sYXMuYXJtb3VyQGludGVsLmNvbT4KICBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwu
Y29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZD8gPHBoaWxtZEByZWRoYXQuY29tPgogIFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxkZXZlbEBlZGsyLmdyb3Vwcy5pbz4KICBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQHJlZGhhdC5jb20+CiAgUGllcnJlIEdvbmRvaXMgPHBpZXJyZS5nb25kb2lzQGFybS5j
b20+CiAgUmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgogIFNhbWkgTXVqYXdhciA8c2FtaS5tdWph
d2FyQGFybS5jb20+CiAgU2VhbiBCcm9nYW4gPHNlYW4uYnJvZ2FuQG1pY3Jvc29mdC5jb20+CiAg
U2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgogIFNpeXVhbiwgRnUgPHNpeXVhbi5mdUBp
bnRlbC5jb20+CiAgU3RhciBaZW5nIDxzdGFyLnplbmdAaW50ZWwuY29tPgogIFN0ZXZlbiA8c3Rl
dmVuLnNoaUBpbnRlbC5jb20+CiAgU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+CiAg
U3VkaXB0byBQYXVsIDxzdWRpcHRvLnBhdWxAYXJtLmNvbT4KICBWaXRhbHkgQ2hlcHRzb3YgPHZp
dDk2OTZAcHJvdG9ubWFpbC5jb20+CiAgVml0YWx5IENoZXB0c292IHZpYSBHcm91cHMuSW8gPHZp
dDk2OTY9cHJvdG9ubWFpbC5jb21AZ3JvdXBzLmlvPgogIFdlaTYgWHUgPHdlaTYueHVAaW50ZWwu
Y29tPgogIFd1IEppYXhpbiA8amlheGluLnd1QGludGVsLmNvbT4KICBYdSwgV2VpNiA8d2VpNi54
dUBpbnRlbC5jb20+CiAgWmVuZywgU3RhciA8c3Rhci56ZW5nQGludGVsLmNvbT4KICBaaGljaGFv
IEdhbyA8emhpY2hhby5nYW9AaW50ZWwuY29tPgogIFpoaWd1YW5nIExpdSA8emhpZ3VhbmcubGl1
QGludGVsLmNvbT4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1
aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
ZmFpbCAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAg
ICAgICAgICAgICAgICBmYWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3Qu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hv
bWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0
CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4
cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlz
IGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5l
c3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
P3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9n
OyBpdCB3b3VsZCBiZSA1NzM4IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
