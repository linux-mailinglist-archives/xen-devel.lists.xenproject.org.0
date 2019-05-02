Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1214811373
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 08:41:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM5Me-0007Ir-Sc; Thu, 02 May 2019 06:38:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DatZ=TC=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hM5Md-0007If-5Y
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 06:38:39 +0000
X-Inumbo-ID: ea36a979-6ca4-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea36a979-6ca4-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 06:38:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hM5MZ-0007eY-Bf; Thu, 02 May 2019 06:38:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hM5MZ-00068e-3O; Thu, 02 May 2019 06:38:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hM5MZ-0004Yk-2k; Thu, 02 May 2019 06:38:35 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135458-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd-again:host-install(5):fail:regression
 freebsd-master:build-amd64-xen-freebsd:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=c2d2307dd81677e7c6a145e2f844b1ddac0712cb
X-Osstest-Versions-That: freebsd=b58321507702a1125aed58ddc320b560b1bffc71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 May 2019 06:38:35 +0000
Subject: [Xen-devel] [freebsd-master test] 135458: regressions - FAIL
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

ZmxpZ2h0IDEzNTQ1OCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1NDU4LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWlu
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKIGJ1
aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgIDUgaG9zdC1pbnN0YWxsKDUpICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEzNTIzMwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGZyZWVi
c2QgICAgICAgICAgICAgIGMyZDIzMDdkZDgxNjc3ZTdjNmExNDVlMmY4NDRiMWRkYWMwNzEyY2IK
YmFzZWxpbmUgdmVyc2lvbjoKIGZyZWVic2QgICAgICAgICAgICAgIGI1ODMyMTUwNzcwMmExMTI1
YWVkNThkZGMzMjBiNTYwYjFiZmZjNzEKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNTIzMyAgMjAx
OS0wNC0yNCAwOToxOTowMyBaICAgIDcgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzUzMTcg
IDIwMTktMDQtMjYgMDk6MTk6MDYgWiAgICA1IGRheXMgICAgMiBhdHRlbXB0cwpUZXN0aW5nIHNh
bWUgc2luY2UgICAxMzU0NTggIDIwMTktMDUtMDEgMDk6MTk6MjkgWiAgICAwIGRheXMgICAgMSBh
dHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBh
ZSA8YWVARnJlZUJTRC5vcmc+CiAgYXNvbWVycyA8YXNvbWVyc0BGcmVlQlNELm9yZz4KICBiY3Jh
biA8YmNyYW5ARnJlZUJTRC5vcmc+CiAgYmRlIDxiZGVARnJlZUJTRC5vcmc+CiAgYnIgPGJyQEZy
ZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVlQlNELm9yZz4K
ICBkY2hhZ2luIDxkY2hhZ2luQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qu
b3JnPgogIGdhbGxhdGluIDxnYWxsYXRpbkBGcmVlQlNELm9yZz4KICBnamIgPGdqYkBGcmVlQlNE
Lm9yZz4KICBnb256byA8Z29uem9ARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxhc2t5QEZy
ZWVCU0Qub3JnPgogIGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3Jn
PgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVlQlNELm9y
Zz4KICBqb2hhbHVuIDxqb2hhbHVuQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5zQEZyZWVC
U0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGxldiA8bGV2QEZyZWVCU0Qub3JnPgog
IGx1cG9ybCA8bHVwb3JsQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVlQlNELm9yZz4K
ICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBt
YXYgPG1hdkBGcmVlQlNELm9yZz4KICBuZ2llIDxuZ2llQEZyZWVCU0Qub3JnPgogIHJncmltZXMg
PHJncmltZXNARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qub3JnPgog
IHJ3YXRzb24gPHJ3YXRzb25ARnJlZUJTRC5vcmc+CiAgc2h1cmQgPHNodXJkQEZyZWVCU0Qub3Jn
PgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9y
Zz4KICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KICB0eWNob24gPHR5Y2hvbkBGcmVlQlNE
Lm9yZz4KICB6ZWlzaW5nIDx6ZWlzaW5nQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0
LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAg
IAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBv
c3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFn
ZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWls
YWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9s
b2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5l
cmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVz
dCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlz
aW9uIGxvZzsgaXQgd291bGQgYmUgMTYzMyBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
