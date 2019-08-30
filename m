Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF1FA40A5
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2019 00:46:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3paQ-0008FB-Q1; Fri, 30 Aug 2019 22:41:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9aD=W2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i3paP-0008F6-3p
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 22:41:41 +0000
X-Inumbo-ID: 512f9bb0-cb77-11e9-ae90-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 512f9bb0-cb77-11e9-ae90-12813bfff9fa;
 Fri, 30 Aug 2019 22:41:34 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i3paF-00027U-IG; Fri, 30 Aug 2019 22:41:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i3paF-0004zJ-8u; Fri, 30 Aug 2019 22:41:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i3paF-0003pg-88; Fri, 30 Aug 2019 22:41:31 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-140831-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=32e0aaee87996d207cd719c68dcdb0a5df7e44f6
X-Osstest-Versions-That: freebsd=76040af020521b535a066e8df91e224b14ce284f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2019 22:41:31 +0000
Subject: [Xen-devel] [freebsd-master test] 140831: all pass - PUSHED
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

ZmxpZ2h0IDE0MDgzMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwODMxLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMzJlMGFhZWU4Nzk5NmQyMDdjZDcx
OWM2OGRjZGIwYTVkZjdlNDRmNgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNzYwNDBhZjAyMDUyMWI1MzVhMDY2ZThkZjkxZTIyNGIxNGNlMjg0ZgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTQwNzQ2ICAyMDE5LTA4LTI4IDA5OjE5OjUzIFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0MDgzMSAgMjAxOS0wOC0zMCAwOToxOTozNiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+CiAg
ZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZ2xlYml1cyA8Z2xlYml1c0BGcmVlQlNELm9y
Zz4KICBqZ2ggPGpnaEBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBrYXJl
bHMgPGthcmVsc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBtYXJraiA8
bWFya2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbWpnIDxtamdARnJl
ZUJTRC5vcmc+CiAgbnAgPG5wQEZyZWVCU0Qub3JnPgogIFJ5YW4gTW9lbGxlciA8cnlhbkBmcmVx
bGFicy5jb20+CiAgdHJhc3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHl1cmlwdiA8eXVyaXB2QEZy
ZWVCU0Qub3JnPgogIHplaXNpbmcgPHplaXNpbmdARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQt
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
CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICA3NjA0MGFm
MDIwNS4uMzJlMGFhZWU4NzkgIDMyZTBhYWVlODc5OTZkMjA3Y2Q3MTljNjhkY2RiMGE1ZGY3ZTQ0
ZjYgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
