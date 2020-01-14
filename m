Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC613B1F1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 19:21:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQlK-0006KS-Uh; Tue, 14 Jan 2020 18:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26Li=3D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1irQlJ-0006KN-7r
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 18:17:57 +0000
X-Inumbo-ID: 2e945228-36fa-11ea-8420-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e945228-36fa-11ea-8420-12813bfff9fa;
 Tue, 14 Jan 2020 18:17:54 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1irQlF-0001TB-I5; Tue, 14 Jan 2020 18:17:53 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1irQlF-00088q-75; Tue, 14 Jan 2020 18:17:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1irQlF-0002wI-6U; Tue, 14 Jan 2020 18:17:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146072-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: ovmf=4cca7923992a13f6b753782f469ee944da2db796
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Jan 2020 18:17:53 +0000
Subject: [Xen-devel] [ovmf test] 146072: regressions - trouble:
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

ZmxpZ2h0IDE0NjA3MiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYwNzIvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQ1NzY3CgpUZXN0cyB3aGlj
aCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1pMzg2
LXhsLXFlbXV1LW92bWYtYW1kNjQgIDIgaG9zdHMtYWxsb2NhdGUgICAgICAgICAgICAgIHN0YXJ2
ZWQgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAgICAgICAg
ICAgNGNjYTc5MjM5OTJhMTNmNmI3NTM3ODJmNDY5ZWU5NDRkYTJkYjc5NgpiYXNlbGluZSB2ZXJz
aW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJiOTBkMzY3
ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4IDAwOjM5
OjA5IFogICAgNiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0wMS0wOCAw
Mjo1MDoyMCBaICAgIDYgZGF5cyAgIDM2IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDE0
NjA3MiAgMjAyMC0wMS0xNCAxMjozOTowNyBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
UGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFsYmVja2ksIE1hdGV1
c3ogPG1hdGV1c3ouYWxiZWNraUBpbnRlbC5jb20+CiAgQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVz
aGV1dmVsQGxpbmFyby5vcmc+CiAgQXNoaXNoIFNpbmdoYWwgPGFzaGlzaHNpbmdoYUBudmlkaWEu
Y29tPgogIEVyaWMgRG9uZyA8ZXJpYy5kb25nQGludGVsLmNvbT4KICBGYW4sIFpoaWp1WCA8emhp
anV4LmZhbkBpbnRlbC5jb20+CiAgSGFvIEEgV3UgPGhhby5hLnd1QGludGVsLmNvbT4KICBKYXNv
biBWb2VseiA8amFzb24udm9lbHpAaW50ZWwuY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJl
ZGhhdC5jb20+CiAgTWF0ZXVzeiBBbGJlY2tpIDxtYXRldXN6LmFsYmVja2lAaW50ZWwuY29tPgog
IE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hhZWwuZC5raW5uZXlAaW50ZWwuY29tPgogIFBhdmFuYS5L
IDxwYXZhbmEua0BpbnRlbC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkPyA8cGhpbG1kQHJl
ZGhhdC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkZSA8cGhpbG1kQHJlZGhhdC5jb20+CiAg
U2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgogIFNpeXVhbiwgRnUgPHNpeXVhbi5mdUBp
bnRlbC5jb20+CiAgVml0YWx5IENoZXB0c292IDx2aXQ5Njk2QHByb3Rvbm1haWwuY29tPgogIFZp
dGFseSBDaGVwdHNvdiB2aWEgR3JvdXBzLklvIDx2aXQ5Njk2PXByb3Rvbm1haWwuY29tQGdyb3Vw
cy5pbz4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFt
ZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1k
NjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0
LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAg
ICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGFydmVkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1s
YWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9n
cy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBo
dHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0
aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1S
RUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29k
ZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3Nz
dGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3
b3VsZCBiZSA1NzMgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
