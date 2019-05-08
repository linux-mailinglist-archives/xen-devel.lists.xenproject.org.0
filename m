Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB8176AE
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 13:21:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOKZf-0004cD-MC; Wed, 08 May 2019 11:17:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AgcW=TI=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hOKZe-0004bz-Ag
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 11:17:22 +0000
X-Inumbo-ID: d77d0d32-7182-11e9-91a5-3b08cfcf8a8e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d77d0d32-7182-11e9-91a5-3b08cfcf8a8e;
 Wed, 08 May 2019 11:17:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hOKZX-0001EO-9J; Wed, 08 May 2019 11:17:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hOKZW-0007pv-Qo; Wed, 08 May 2019 11:17:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hOKZW-0000wW-QC; Wed, 08 May 2019 11:17:14 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135810-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd-again:host-install(5):fail:regression
 freebsd-master:build-amd64-xen-freebsd:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=9e9048e3c2972678df95b6318ceaff6a245ee2e2
X-Osstest-Versions-That: freebsd=b58321507702a1125aed58ddc320b560b1bffc71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 May 2019 11:17:14 +0000
Subject: [Xen-devel] [freebsd-master test] 135810: regressions - FAIL
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

ZmxpZ2h0IDEzNTgxMCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1ODEwLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWlu
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKIGJ1
aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgIDUgaG9zdC1pbnN0YWxsKDUpICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEzNTIzMwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGZyZWVi
c2QgICAgICAgICAgICAgIDllOTA0OGUzYzI5NzI2NzhkZjk1YjYzMThjZWFmZjZhMjQ1ZWUyZTIK
YmFzZWxpbmUgdmVyc2lvbjoKIGZyZWVic2QgICAgICAgICAgICAgIGI1ODMyMTUwNzcwMmExMTI1
YWVkNThkZGMzMjBiNTYwYjFiZmZjNzEKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNTIzMyAgMjAx
OS0wNC0yNCAwOToxOTowMyBaICAgMTQgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzUzMTcg
IDIwMTktMDQtMjYgMDk6MTk6MDYgWiAgIDEyIGRheXMgICAgNCBhdHRlbXB0cwpUZXN0aW5nIHNh
bWUgc2luY2UgICAxMzU4MTAgIDIwMTktMDUtMDYgMDk6MTk6NDkgWiAgICAyIGRheXMgICAgMSBh
dHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBh
ZHJpYW4gPGFkcmlhbkBGcmVlQlNELm9yZz4KICBhZSA8YWVARnJlZUJTRC5vcmc+CiAgYW5kcmV3
IDxhbmRyZXdARnJlZUJTRC5vcmc+CiAgYXNvbWVycyA8YXNvbWVyc0BGcmVlQlNELm9yZz4KICBi
Y3JhbiA8YmNyYW5ARnJlZUJTRC5vcmc+CiAgYmRlIDxiZGVARnJlZUJTRC5vcmc+CiAgYnIgPGJy
QEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGNzIDxjc0BGcmVlQlNELm9y
Zz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZGNoYWdpbiA8ZGNoYWdpbkBGcmVlQlNELm9yZz4K
ICBkb3VnbSA8ZG91Z21ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+
CiAgZ2FsbGF0aW4gPGdhbGxhdGluQEZyZWVCU0Qub3JnPgogIGdhbmJvbGQgPGdhbmJvbGRARnJl
ZUJTRC5vcmc+CiAgZ2piIDxnamJARnJlZUJTRC5vcmc+CiAgZ29uem8gPGdvbnpvQEZyZWVCU0Qu
b3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNE
Lm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBq
aGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAgam9oYWx1biA8am9oYWx1bkBGcmVlQlNE
Lm9yZz4KICBrZXZhbnMgPGtldmFuc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9y
Zz4KICBsZXYgPGxldkBGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9ybEBGcmVlQlNELm9yZz4K
ICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9yZz4KICBt
YXJraiA8bWFya2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbWNrdXNp
Y2sgPG1ja3VzaWNrQEZyZWVCU0Qub3JnPgogIG1qZyA8bWpnQEZyZWVCU0Qub3JnPgogIG1tYWN5
IDxtbWFjeUBGcmVlQlNELm9yZz4KICBuZ2llIDxuZ2llQEZyZWVCU0Qub3JnPgogIHJncmltZXMg
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
aW9uIGxvZzsgaXQgd291bGQgYmUgMjYyNSBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
