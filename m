Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA11D162
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 23:38:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQf4K-0002Qa-67; Tue, 14 May 2019 21:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rBGB=TO=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hQf4J-0002QO-4B
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 21:34:39 +0000
X-Inumbo-ID: 11fbf0ce-7690-11e9-b785-07a7b0bf8f6e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11fbf0ce-7690-11e9-b785-07a7b0bf8f6e;
 Tue, 14 May 2019 21:34:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hQf4E-0006v7-2x; Tue, 14 May 2019 21:34:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hQf4D-0002gA-RK; Tue, 14 May 2019 21:34:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hQf4D-0006ql-Q4; Tue, 14 May 2019 21:34:33 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-136173-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=e45876ac9f0ee913fcc73cfa00e409a5a461dbfb
X-Osstest-Versions-That: freebsd=fbc304aae0efb87e60f17c0a42ca7c8286c24f1f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 May 2019 21:34:33 +0000
Subject: [Xen-devel] [freebsd-master test] 136173: all pass - PUSHED
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

ZmxpZ2h0IDEzNjE3MyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2MTczLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZTQ1ODc2YWM5ZjBlZTkxM2ZjYzcz
Y2ZhMDBlNDA5YTVhNDYxZGJmYgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgZmJjMzA0YWFlMGVmYjg3ZTYwZjE3YzBhNDJjYTdjODI4NmMyNGYxZgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM2MDAwICAyMDE5LTA1LTEwIDE0OjUwOjQ1IFogICAgNCBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNjE3MyAgMjAxOS0wNS0xMyAwOToxOTo1NCBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFlIDxhZUBGcmVlQlNELm9yZz4KICBiZHJld2VyeSA8YmRyZXdlcnlARnJlZUJTRC5vcmc+CiAg
YnIgPGJyQEZyZWVCU0Qub3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVl
QlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGRvdWdtIDxkb3VnbUBG
cmVlQlNELm9yZz4KICBnbGViaXVzIDxnbGViaXVzQEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZy
ZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVlQlNELm9yZz4KICBqb2hhbHVuIDxq
b2hhbHVuQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5zQEZyZWVCU0Qub3JnPgogIGx1cG9y
bCA8bHVwb3JsQEZyZWVCU0Qub3JnPgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAgbWFya2og
PG1hcmtqQEZyZWVCU0Qub3JnPgogIG1qZyA8bWpnQEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxy
bWFja2xlbUBGcmVlQlNELm9yZz4KICBzY2h3ZWlraCA8c2Nod2Vpa2hARnJlZUJTRC5vcmc+Cgpq
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
dAogICBmYmMzMDRhYWUwZS4uZTQ1ODc2YWM5ZjAgIGU0NTg3NmFjOWYwZWU5MTNmY2M3M2NmYTAw
ZTQwOWE1YTQ2MWRiZmIgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
