Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D72298E2
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 15:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUABu-0007QF-3C; Fri, 24 May 2019 13:24:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oV0n=TY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hUABs-0007PT-4C
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 13:24:56 +0000
X-Inumbo-ID: 51af65e2-7e27-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51af65e2-7e27-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 13:24:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hUABp-0004We-AO; Fri, 24 May 2019 13:24:53 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hUABo-0005Jp-Vv; Fri, 24 May 2019 13:24:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hUABo-0006OC-VG; Fri, 24 May 2019 13:24:52 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-136827-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
 freebsd-master:build-amd64-freebsd-again:freebsd-build:fail:regression
X-Osstest-Versions-This: freebsd=d4527f36d52a6b83a203b54ce67bb9d441bd1c96
X-Osstest-Versions-That: freebsd=cb9788efd6dd2c8377e001d8a85c722ba926f6cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 May 2019 13:24:52 +0000
Subject: [Xen-devel] [freebsd-master test] 136827: regressions - FAIL
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

ZmxpZ2h0IDEzNjgyNyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2ODI3LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzY2MDYKIGJ1
aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgIDcgZnJlZWJzZC1idWlsZCAgICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEzNjYwNgoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIGZyZWVi
c2QgICAgICAgICAgICAgIGQ0NTI3ZjM2ZDUyYTZiODNhMjAzYjU0Y2U2N2JiOWQ0NDFiZDFjOTYK
YmFzZWxpbmUgdmVyc2lvbjoKIGZyZWVic2QgICAgICAgICAgICAgIGNiOTc4OGVmZDZkZDJjODM3
N2UwMDFkOGE4NWM3MjJiYTkyNmY2Y2YKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNjYwNiAgMjAx
OS0wNS0yMCAwOToyNToyMiBaICAgIDQgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzY4Mjcg
IDIwMTktMDUtMjIgMTk6NTI6MzAgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3Bs
ZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBhZHJpYW4gPGFkcmlhbkBGcmVl
QlNELm9yZz4KICBhbGxhbmp1ZGUgPGFsbGFuanVkZUBGcmVlQlNELm9yZz4KICBhc29tZXJzIDxh
c29tZXJzQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJ6IDxiekBGcmVl
QlNELm9yZz4KICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBkY2hhZ2luIDxkY2hhZ2luQEZyZWVC
U0Qub3JnPgogIGRvdWdtIDxkb3VnbUBGcmVlQlNELm9yZz4KICBlbWFzdGUgPGVtYXN0ZUBGcmVl
QlNELm9yZz4KICBnYWxsYXRpbiA8Z2FsbGF0aW5ARnJlZUJTRC5vcmc+CiAgaWFuIDxpYW5ARnJl
ZUJTRC5vcmc+CiAgamhpYmJpdHMgPGpoaWJiaXRzQEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZy
ZWVCU0Qub3JnPgogIGx1cG9ybCA8bHVwb3JsQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBG
cmVlQlNELm9yZz4KICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVl
QlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtY2t1c2ljayA8bWNrdXNpY2tARnJl
ZUJTRC5vcmc+CiAgbW0gPG1tQEZyZWVCU0Qub3JnPgogIG5naWUgPG5naWVARnJlZUJTRC5vcmc+
CiAgc29ib21heCA8c29ib21heEBGcmVlQlNELm9yZz4KICBzdGV2ZWsgPHN0ZXZla0BGcmVlQlNE
Lm9yZz4KICB0cmFzeiA8dHJhc3pARnJlZUJTRC5vcmc+CiAgemVpc2luZyA8emVpc2luZ0BGcmVl
QlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQt
eGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAg
CgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywg
Y29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVw
b3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1t
YXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9
YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1h
cnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDExNjcgbGlu
ZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
