Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A423613F6B
	for <lists+xen-devel@lfdr.de>; Sun,  5 May 2019 14:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNGGR-0007KF-P3; Sun, 05 May 2019 12:29:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+Pe=TF=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hNGGQ-0007K2-43
 for xen-devel@lists.xenproject.org; Sun, 05 May 2019 12:29:06 +0000
X-Inumbo-ID: 57811a54-6f31-11e9-9ebe-fbdb03f32318
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57811a54-6f31-11e9-9ebe-fbdb03f32318;
 Sun, 05 May 2019 12:28:52 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hNGGA-0000PG-3Q; Sun, 05 May 2019 12:28:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hNGG9-0005OX-Mc; Sun, 05 May 2019 12:28:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hNGG9-0005aJ-LF; Sun, 05 May 2019 12:28:49 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135640-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd-again:host-install(5):fail:regression
 freebsd-master:build-amd64-xen-freebsd:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=90cdaa0665b339584f85be1ce3b5a4ae4db3a185
X-Osstest-Versions-That: freebsd=b58321507702a1125aed58ddc320b560b1bffc71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 May 2019 12:28:49 +0000
Subject: [Xen-devel] [freebsd-master test] 135640: regressions - FAIL
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

ZmxpZ2h0IDEzNTY0MCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1NjQwLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWlu
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKIGJ1
aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgIDUgaG9zdC1pbnN0YWxsKDUpICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEzNTIzMwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGZyZWVi
c2QgICAgICAgICAgICAgIDkwY2RhYTA2NjViMzM5NTg0Zjg1YmUxY2UzYjVhNGFlNGRiM2ExODUK
YmFzZWxpbmUgdmVyc2lvbjoKIGZyZWVic2QgICAgICAgICAgICAgIGI1ODMyMTUwNzcwMmExMTI1
YWVkNThkZGMzMjBiNTYwYjFiZmZjNzEKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNTIzMyAgMjAx
OS0wNC0yNCAwOToxOTowMyBaICAgMTEgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzUzMTcg
IDIwMTktMDQtMjYgMDk6MTk6MDYgWiAgICA5IGRheXMgICAgMyBhdHRlbXB0cwpUZXN0aW5nIHNh
bWUgc2luY2UgICAxMzU2NDAgIDIwMTktMDUtMDMgMDk6MTk6NTEgWiAgICAyIGRheXMgICAgMSBh
dHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBh
ZHJpYW4gPGFkcmlhbkBGcmVlQlNELm9yZz4KICBhZSA8YWVARnJlZUJTRC5vcmc+CiAgYW5kcmV3
IDxhbmRyZXdARnJlZUJTRC5vcmc+CiAgYXNvbWVycyA8YXNvbWVyc0BGcmVlQlNELm9yZz4KICBi
Y3JhbiA8YmNyYW5ARnJlZUJTRC5vcmc+CiAgYmRlIDxiZGVARnJlZUJTRC5vcmc+CiAgYnIgPGJy
QEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVlQlNELm9y
Zz4KICBkY2hhZ2luIDxkY2hhZ2luQEZyZWVCU0Qub3JnPgogIGRvdWdtIDxkb3VnbUBGcmVlQlNE
Lm9yZz4KICBlbWFzdGUgPGVtYXN0ZUBGcmVlQlNELm9yZz4KICBnYWxsYXRpbiA8Z2FsbGF0aW5A
RnJlZUJTRC5vcmc+CiAgZ2FuYm9sZCA8Z2FuYm9sZEBGcmVlQlNELm9yZz4KICBnamIgPGdqYkBG
cmVlQlNELm9yZz4KICBnb256byA8Z29uem9ARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxh
c2t5QEZyZWVCU0Qub3JnPgogIGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVC
U0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVl
QlNELm9yZz4KICBqb2hhbHVuIDxqb2hhbHVuQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5z
QEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGxldiA8bGV2QEZyZWVCU0Qu
b3JnPgogIGx1cG9ybCA8bHVwb3JsQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVlQlNE
Lm9yZz4KICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9y
Zz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBuZ2llIDxuZ2llQEZyZWVCU0Qub3JnPgogIHJn
cmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qu
b3JnPgogIHJ3YXRzb24gPHJ3YXRzb25ARnJlZUJTRC5vcmc+CiAgc2h1cmQgPHNodXJkQEZyZWVC
U0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVl
QlNELm9yZz4KICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KICB0eWNob24gPHR5Y2hvbkBG
cmVlQlNELm9yZz4KICB6ZWlzaW5nIDx6ZWlzaW5nQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxk
LWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdo
dCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9n
cwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJl
IGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBp
biBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3Nz
dGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3Rl
cgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5v
IHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgMjAwNiBsaW5lcyBsb25nLikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
