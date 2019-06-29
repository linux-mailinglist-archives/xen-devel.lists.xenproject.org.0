Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53385A9B2
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jun 2019 10:52:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hh930-00010o-Hh; Sat, 29 Jun 2019 08:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qbs8=U4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hh92z-00010Z-1r
 for xen-devel@lists.xenproject.org; Sat, 29 Jun 2019 08:49:25 +0000
X-Inumbo-ID: c933e2f0-9a4a-11e9-a511-a345374accd1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c933e2f0-9a4a-11e9-a511-a345374accd1;
 Sat, 29 Jun 2019 08:49:20 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hh92s-0001uO-Ic; Sat, 29 Jun 2019 08:49:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hh92s-0004KR-3K; Sat, 29 Jun 2019 08:49:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hh92s-0004zo-2g; Sat, 29 Jun 2019 08:49:18 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138606-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
X-Osstest-Versions-This: freebsd=5fdffd8987d7c831ea25fb622b64927cdc960ad2
X-Osstest-Versions-That: freebsd=14e63f898b16382f4577cfea211a7fb5ad7983e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Jun 2019 08:49:18 +0000
Subject: [Xen-devel] [freebsd-master test] 138606: regressions - FAIL
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

ZmxpZ2h0IDEzODYwNiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4NjA2LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzg1NDAKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICA1ZmRmZmQ4
OTg3ZDdjODMxZWEyNWZiNjIyYjY0OTI3Y2RjOTYwYWQyCmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICAxNGU2M2Y4OThiMTYzODJmNDU3N2NmZWEyMTFhN2ZiNWFkNzk4M2U5
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzg1NDAgIDIwMTktMDYtMjYgMDk6MjM6MDYgWiAgICAy
IGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM4NjA2ICAyMDE5LTA2LTI4IDA5OjE5OjI4IFog
ICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25z
IHVuZGVyIHRlc3Q6CiAgYWxjIDxhbGNARnJlZUJTRC5vcmc+CiAgYXJpY2hhcmRzb24gPGFyaWNo
YXJkc29uQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYXZn
IDxhdmdARnJlZUJTRC5vcmc+CiAgYmNyYW4gPGJjcmFuQEZyZWVCU0Qub3JnPgogIGJyIDxickBG
cmVlQlNELm9yZz4KICBjb2duZXQgPGNvZ25ldEBGcmVlQlNELm9yZz4KICBjeSA8Y3lARnJlZUJT
RC5vcmc+CiAgZGVscGhpaiA8ZGVscGhpakBGcmVlQlNELm9yZz4KICBkb3VnbSA8ZG91Z21ARnJl
ZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxh
c2t5QEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5z
QEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVl
QlNELm9yZz4KICBtYXJpdXMgPG1hcml1c0BGcmVlQlNELm9yZz4KICBtYXJraiA8bWFya2pARnJl
ZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbWhvcm5lIDxtaG9ybmVARnJlZUJT
RC5vcmc+CiAgbnAgPG5wQEZyZWVCU0Qub3JnPgogIHJncmltZXMgPHJncmltZXNARnJlZUJTRC5v
cmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qub3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qu
b3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4t
ZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKCgot
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
Ck5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgNzIzIGxpbmVzIGxv
bmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
