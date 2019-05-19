Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC38B2295A
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 00:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSUQn-0007Vo-Ln; Sun, 19 May 2019 22:37:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XwFn=TT=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hSUQm-0007Vc-Vi
 for xen-devel@lists.xenproject.org; Sun, 19 May 2019 22:37:25 +0000
X-Inumbo-ID: a7a5ff80-7a86-11e9-b382-2fa9d781e5eb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7a5ff80-7a86-11e9-b382-2fa9d781e5eb;
 Sun, 19 May 2019 22:37:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hSUQd-0003Wv-B5; Sun, 19 May 2019 22:37:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hSUQc-00006q-V5; Sun, 19 May 2019 22:37:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hSUQc-0004x5-UJ; Sun, 19 May 2019 22:37:14 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-136447-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=35c027f3215c305ddf9814e895b7f4c880521eb8
X-Osstest-Versions-That: freebsd=5834f8720468762959497218a313013802c5499d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 May 2019 22:37:14 +0000
Subject: [Xen-devel] [freebsd-master test] 136447: all pass - PUSHED
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

ZmxpZ2h0IDEzNjQ0NyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2NDQ3LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMzVjMDI3ZjMyMTVjMzA1ZGRmOTgx
NGU4OTViN2Y0Yzg4MDUyMWViOApiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNTgzNGY4NzIwNDY4NzYyOTU5NDk3MjE4YTMxMzAxMzgwMmM1NDk5ZAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM2Mjk3ICAyMDE5LTA1LTE1IDA5OjE5OjM4IFogICAgNCBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNjQ0NyAgMjAxOS0wNS0xNyAxNDoxMDowNyBaICAgIDIgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3JnPgogIGFudG9pbmUgPGFudG9pbmVARnJlZUJTRC5v
cmc+CiAgYmNyIDxiY3JARnJlZUJTRC5vcmc+CiAgYnJkIDxicmRARnJlZUJTRC5vcmc+CiAgYnJv
b2tzIDxicm9va3NARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgY3kgPGN5
QEZyZWVCU0Qub3JnPgogIGhycyA8aHJzQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0
c0BGcmVlQlNELm9yZz4KICBqb2hhbHVuIDxqb2hhbHVuQEZyZWVCU0Qub3JnPgogIGtldmFucyA8
a2V2YW5zQEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGtwIDxrcEBGcmVl
QlNELm9yZz4KICBtYXJraiA8bWFya2pARnJlZUJTRC5vcmc+CiAgcmxpYmJ5IDxybGliYnlARnJl
ZUJTRC5vcmc+CiAgcm9iZXJ0byA8cm9iZXJ0b0BGcmVlQlNELm9yZz4KICB0cmFzeiA8dHJhc3pA
RnJlZUJTRC5vcmc+CiAgdHljaG9uIDx0eWNob25ARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQt
YW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0
IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dz
CmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUg
YXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGlu
IGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0
ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVy
CgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6
CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICA1ODM0Zjg3
MjA0Ni4uMzVjMDI3ZjMyMTUgIDM1YzAyN2YzMjE1YzMwNWRkZjk4MTRlODk1YjdmNGM4ODA1MjFl
YjggLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
