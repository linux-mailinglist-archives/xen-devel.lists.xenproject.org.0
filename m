Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB13CC06E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQLV-0001EV-9R; Fri, 04 Oct 2019 16:22:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4TJI=X5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iGQLU-0001EQ-7U
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:22:20 +0000
X-Inumbo-ID: 200dc6da-e6c3-11e9-9bee-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 200dc6da-e6c3-11e9-9bee-bc764e2007e4;
 Fri, 04 Oct 2019 16:22:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iGQLL-00083l-Or; Fri, 04 Oct 2019 16:22:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iGQLL-000358-Fc; Fri, 04 Oct 2019 16:22:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iGQLL-0005e0-F2; Fri, 04 Oct 2019 16:22:11 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-142264-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=0fa527773261d89c4c296d620bd626a835418faa
X-Osstest-Versions-That: freebsd=14aef6dfca96006e52b8fb920bde7c612ba58b79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Oct 2019 16:22:11 +0000
Subject: [Xen-devel] [freebsd-master test] 142264: regressions - trouble:
 blocked/fail
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

ZmxpZ2h0IDE0MjI2NCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQyMjY0LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDE1MDEKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgMGZhNTI3NzczMjYxZDg5YzRjMjk2ZDYyMGJkNjI2YTgz
NTQxOGZhYQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgMTRhZWY2ZGZj
YTk2MDA2ZTUyYjhmYjkyMGJkZTdjNjEyYmE1OGI3OQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
NTAxICAyMDE5LTA5LTIwIDA5OjE5OjUxIFogICAxNCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDE0MTcwMSAgMjAxOS0wOS0yMyAwOToxOTo0MSBaICAgMTEgZGF5cyAgICA1IGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDE0MjI2NCAgMjAxOS0xMC0wNCAwOToyMTozMSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFs
bGFuanVkZSA8YWxsYW5qdWRlQEZyZWVCU0Qub3JnPgogIGFuZHJldyA8YW5kcmV3QEZyZWVCU0Qu
b3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5v
cmc+CiAgYmFwdCA8YmFwdEBGcmVlQlNELm9yZz4KICBicm9va3MgPGJyb29rc0BGcmVlQlNELm9y
Zz4KICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBjcGVyY2l2YSA8Y3BlcmNpdmFARnJlZUJTRC5v
cmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRhYiA8ZGFiQEZyZWVCU0Qub3JnPgogIGRhaWNo
aSA8ZGFpY2hpQEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8
ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGVyaiA8ZXJqQEZyZWVCU0Qub3JnPgogIGdhbGxhdGluIDxn
YWxsYXRpbkBGcmVlQlNELm9yZz4KICBnamIgPGdqYkBGcmVlQlNELm9yZz4KICBnbGViaXVzIDxn
bGViaXVzQEZyZWVCU0Qub3JnPgogIGdvbnpvIDxnb256b0BGcmVlQlNELm9yZz4KICBncmVtYm8g
PGdyZW1ib0BGcmVlQlNELm9yZz4KICBocnMgPGhyc0BGcmVlQlNELm9yZz4KICBoc2VsYXNreSA8
aHNlbGFza3lARnJlZUJTRC5vcmc+CiAgaWFuIDxpYW5ARnJlZUJTRC5vcmc+CiAgaW1wIDxpbXBA
RnJlZUJTRC5vcmc+CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAgamhpYmJpdHMgPGpoaWJiaXRz
QEZyZWVCU0Qub3JnPgogIGppbGxlcyA8amlsbGVzQEZyZWVCU0Qub3JnPgogIGpraW0gPGpraW1A
RnJlZUJTRC5vcmc+CiAganRsIDxqdGxARnJlZUJTRC5vcmc+CiAga2FrdHVzIDxrYWt0dXNARnJl
ZUJTRC5vcmc+CiAga2FuIDxrYW5ARnJlZUJTRC5vcmc+CiAga2FyZWxzIDxrYXJlbHNARnJlZUJT
RC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5v
cmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+
CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIG1j
a3VzaWNrIDxtY2t1c2lja0BGcmVlQlNELm9yZz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNELm9y
Zz4KICBtamcgPG1qZ0BGcmVlQlNELm9yZz4KICBtbSA8bW1ARnJlZUJTRC5vcmc+CiAgbW1hY3kg
PG1tYWN5QEZyZWVCU0Qub3JnPgogIG9saXZpZXIgPG9saXZpZXJARnJlZUJTRC5vcmc+CiAgUGlv
dHIgUGlldHJ1c3pld3NraSA8cGlvdHIucGlldHJ1c3pld3NraUBpbnRlbC5jb20+CiAgcmF5IDxy
YXlARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qub3JnPgogIHJveWdl
ciA8cm95Z2VyQEZyZWVCU0Qub3JnPgogIHJycyA8cnJzQEZyZWVCU0Qub3JnPgogIHJzdG9uZSA8
cnN0b25lQEZyZWVCU0Qub3JnPgogIHNjaHdlaWtoIDxzY2h3ZWlraEBGcmVlQlNELm9yZz4KICBz
ZWYgPHNlZkBGcmVlQlNELm9yZz4KICBzamcgPHNqZ0BGcmVlQlNELm9yZz4KICB0aWpsIDx0aWps
QEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB0c29vbWUgPHRzb29t
ZUBGcmVlQlNELm9yZz4KICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KICB2YW5neXplbiA8
dmFuZ3l6ZW5ARnJlZUJTRC5vcmc+CiAgdm1hZmZpb25lIDx2bWFmZmlvbmVARnJlZUJTRC5vcmc+
CiAgeXVyaXB2IDx5dXJpcHZARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJz
ZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBidWls
ZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmFpbCAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
OyBpdCB3b3VsZCBiZSA0OTIxIGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
