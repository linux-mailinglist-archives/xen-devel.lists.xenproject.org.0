Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38270EE8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 04:01:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpk4f-0005cw-En; Tue, 23 Jul 2019 01:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gYMO=VU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hpk4e-0005cm-95
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 01:58:40 +0000
X-Inumbo-ID: 6163abc8-aced-11e9-a013-5bc58836765f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6163abc8-aced-11e9-a013-5bc58836765f;
 Tue, 23 Jul 2019 01:58:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hpk4X-0004pB-5R; Tue, 23 Jul 2019 01:58:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hpk4W-0001vP-P7; Tue, 23 Jul 2019 01:58:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hpk4W-0007YF-OO; Tue, 23 Jul 2019 01:58:32 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139250-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=133ea4fff43567cfeae6c032ac202656c6108db3
X-Osstest-Versions-That: freebsd=37af220308d220ce946683e1a2e80b352fb9e856
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jul 2019 01:58:32 +0000
Subject: [Xen-devel] [freebsd-master test] 139250: all pass - PUSHED
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

ZmxpZ2h0IDEzOTI1MCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5MjUwLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMTMzZWE0ZmZmNDM1NjdjZmVhZTZj
MDMyYWMyMDI2NTZjNjEwOGRiMwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMzdhZjIyMDMwOGQyMjBjZTk0NjY4M2UxYTJlODBiMzUyZmI5ZTg1NgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5MTU5ICAyMDE5LTA3LTE5IDA5OjE5OjM4IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTI1MCAgMjAxOS0wNy0yMiAwOToxOTozNiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAg
YnJvb2tzIDxicm9va3NARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgZGlt
IDxkaW1ARnJlZUJTRC5vcmc+CiAgZG91Z20gPGRvdWdtQEZyZWVCU0Qub3JnPgogIGdhbmJvbGQg
PGdhbmJvbGRARnJlZUJTRC5vcmc+CiAgaWFuIDxpYW5ARnJlZUJTRC5vcmc+CiAgaW1wIDxpbXBA
RnJlZUJTRC5vcmc+CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAgamhpYmJpdHMgPGpoaWJiaXRz
QEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIG1hbnUgPG1hbnVARnJlZUJT
RC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3Jn
PgogIG1ja3VzaWNrIDxtY2t1c2lja0BGcmVlQlNELm9yZz4KICByZW5lIDxyZW5lQEZyZWVCU0Qu
b3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4t
ZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxv
Z3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25m
aWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRz
LCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3Rl
cgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoK
ClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJl
ZWJzZC5naXQKICAgMzdhZjIyMDMwOGQuLjEzM2VhNGZmZjQzICAxMzNlYTRmZmY0MzU2N2NmZWFl
NmMwMzJhYzIwMjY1NmM2MTA4ZGIzIC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
