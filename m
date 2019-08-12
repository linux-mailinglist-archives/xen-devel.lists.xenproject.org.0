Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEC8A0AE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBBj-0006kD-Ih; Mon, 12 Aug 2019 14:20:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bBZR=WI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hxBBi-0006k2-1F
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:20:42 +0000
X-Inumbo-ID: 5cd14982-bd0c-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5cd14982-bd0c-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:20:40 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxBBe-0007Vn-5M; Mon, 12 Aug 2019 14:20:38 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxBBd-0004Oh-Of; Mon, 12 Aug 2019 14:20:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hxBBd-00070l-O0; Mon, 12 Aug 2019 14:20:37 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139987-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:<job
 status>:broken:regression
 freebsd-master:build-amd64-freebsd:host-install(5):broken:regression
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=57f16e900dfc21dc7ed636d71e4e19b0a43da1d0
X-Osstest-Versions-That: freebsd=d3d0bd153cf3e76effd2e9e8c66a847d1c5defe3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Aug 2019 14:20:37 +0000
Subject: [Xen-devel] [freebsd-master test] 139987: trouble: blocked/broken
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

ZmxpZ2h0IDEzOTk4NyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5OTg3LwoKRmFpbHVyZXMgYW5kIHBy
b2JsZW1zIHdpdGggdGVzdHMgOi0oCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWls
ZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAg
YnJva2VuCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICA1IGhvc3QtaW5zdGFsbCg1KSAg
ICAgICAgYnJva2VuIFJFR1IuIHZzLiAxMzk4NjEKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2Vl
ZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAx
IGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiBidWlsZC1hbWQ2NC14
ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAg
bi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAg
NTdmMTZlOTAwZGZjMjFkYzdlZDYzNmQ3MWU0ZTE5YjBhNDNkYTFkMApiYXNlbGluZSB2ZXJzaW9u
OgogZnJlZWJzZCAgICAgICAgICAgICAgZDNkMGJkMTUzY2YzZTc2ZWZmZDJlOWU4YzY2YTg0N2Qx
YzVkZWZlMwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM5ODYxICAyMDE5LTA4LTA5IDA5OjIwOjAy
IFogICAgMyBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzOTk4NyAgMjAxOS0wOC0xMiAwOToy
MDozMSBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJl
dmlzaW9ucyB1bmRlciB0ZXN0OgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYXZv
cyA8YXZvc0BGcmVlQlNELm9yZz4KICBiZHJhZ29uIDxiZHJhZ29uQEZyZWVCU0Qub3JnPgogIGJy
b29rcyA8YnJvb2tzQEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGN5IDxj
eUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGlhbiA8aWFu
QEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0
c0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBtYW51IDxtYW51QEZyZWVC
U0Qub3JnPgogIG5naWUgPG5naWVARnJlZUJTRC5vcmc+CiAgdHNvb21lIDx0c29vbWVARnJlZUJT
RC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0LXhl
bi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcK
bG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNv
bmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9y
dHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFz
dGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5
Cgpicm9rZW4tam9iIGJ1aWxkLWFtZDY0LWZyZWVic2QgYnJva2VuCmJyb2tlbi1zdGVwIGJ1aWxk
LWFtZDY0LWZyZWVic2QgaG9zdC1pbnN0YWxsKDUpCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lv
biBsb2c7IGl0IHdvdWxkIGJlIDM0NiBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
