Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891E26F20
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 21:55:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTXH3-0005gh-4E; Wed, 22 May 2019 19:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qm9s=TW=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hTXH1-0005gV-Fe
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 19:51:39 +0000
X-Inumbo-ID: ff9fe35e-7cca-11e9-b206-3fd01b89d158
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff9fe35e-7cca-11e9-b206-3fd01b89d158;
 Wed, 22 May 2019 19:51:32 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hTXGs-0000jJ-Au; Wed, 22 May 2019 19:51:30 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hTXGr-0006tG-I8; Wed, 22 May 2019 19:51:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hTXGr-0004fs-FW; Wed, 22 May 2019 19:51:29 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-136606-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=cb9788efd6dd2c8377e001d8a85c722ba926f6cf
X-Osstest-Versions-That: freebsd=35c027f3215c305ddf9814e895b7f4c880521eb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 May 2019 19:51:29 +0000
Subject: [Xen-devel] [freebsd-master test] 136606: all pass - PUSHED
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

ZmxpZ2h0IDEzNjYwNiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2NjA2LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgY2I5Nzg4ZWZkNmRkMmM4Mzc3ZTAw
MWQ4YTg1YzcyMmJhOTI2ZjZjZgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMzVjMDI3ZjMyMTVjMzA1ZGRmOTgxNGU4OTViN2Y0Yzg4MDUyMWViOAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM2NDQ3ICAyMDE5LTA1LTE3IDE0OjEwOjA3IFogICAgNSBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNjYwNiAgMjAxOS0wNS0yMCAwOToyNToyMiBaICAgIDIgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFsbGFuanVkZSA8YWxsYW5qdWRlQEZyZWVCU0Qub3JnPgogIGJyZCA8YnJkQEZyZWVCU0Qub3Jn
PgogIEJyaWFuIEJlaGxlbmRvcmYgPGJlaGxlbmRvcmYxQGxsbmwuZ292PgogIGJyb29rcyA8YnJv
b2tzQEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGRjaGFnaW4gPGRjaGFn
aW5ARnJlZUJTRC5vcmc+CiAgZGltIDxkaW1ARnJlZUJTRC5vcmc+CiAgZG91Z20gPGRvdWdtQEZy
ZWVCU0Qub3JnPgogIGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3Jn
PgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVlQlNELm9y
Zz4KICBqb2hhbHVuIDxqb2hhbHVuQEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3Jn
PgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgog
IG1lbGlmYXJvIDxtZWxpZmFyb0BGcmVlQlNELm9yZz4KICBQYXZlbCBCb2xkaW4gPGJvbGRpbi5w
YXZlbEBnbWFpbC5jb20+CiAgcmdyaW1lcyA8cmdyaW1lc0BGcmVlQlNELm9yZz4KICBzY290dGwg
PHNjb3R0bEBGcmVlQlNELm9yZz4KICBzamcgPHNqZ0BGcmVlQlNELm9yZz4KICBzdGV2ZWsgPHN0
ZXZla0BGcmVlQlNELm9yZz4KICB0cmFzeiA8dHJhc3pARnJlZUJTRC5vcmc+CiAgdHVleGVuIDx0
dWV4ZW5ARnJlZUJTRC5vcmc+CiAgdm1hZmZpb25lIDx2bWFmZmlvbmVARnJlZUJTRC5vcmc+Cgpq
b2JzOgogYnVpbGQtYW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNk
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1y
ZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hv
bWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxl
cywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBv
ZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFE
TUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGlu
ZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdp
dAogICAzNWMwMjdmMzIxNS4uY2I5Nzg4ZWZkNmQgIGNiOTc4OGVmZDZkZDJjODM3N2UwMDFkOGE4
NWM3MjJiYTkyNmY2Y2YgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
