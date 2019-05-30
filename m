Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79812EE7A
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 05:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWC0i-0004CD-En; Thu, 30 May 2019 03:45:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+gVD=T6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hWC0h-0004C3-Gg
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 03:45:47 +0000
X-Inumbo-ID: 67c44591-828d-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67c44591-828d-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 03:45:45 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hWC0e-0007av-8f; Thu, 30 May 2019 03:45:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hWC0e-0006NZ-0V; Thu, 30 May 2019 03:45:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hWC0d-0005oa-Ur; Thu, 30 May 2019 03:45:43 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137052-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
X-Osstest-Versions-This: freebsd=bb6e388c895e7fd2611c1c49ed14ebd4f8a847e4
X-Osstest-Versions-That: freebsd=aab5f5a3bd55421fa6a8dbc05332a9b9fb49992c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2019 03:45:43 +0000
Subject: [Xen-devel] [freebsd-master test] 137052: regressions - FAIL
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

ZmxpZ2h0IDEzNzA1MiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MDUyLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzY5MDEKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICBiYjZlMzg4
Yzg5NWU3ZmQyNjExYzFjNDllZDE0ZWJkNGY4YTg0N2U0CmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICBhYWI1ZjVhM2JkNTU0MjFmYTZhOGRiYzA1MzMyYTliOWZiNDk5OTJj
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzY5MDEgIDIwMTktMDUtMjQgMTM6MzI6MDUgWiAgICA1
IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM3MDA1ICAyMDE5LTA1LTI3IDA5OjE5OjEyIFog
ICAgMiBkYXlzICAgIDIgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM3MDUyICAyMDE5
LTA1LTI5IDA5OjE5OjM1IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hv
IHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgMG1wIDwwbXBARnJlZUJTRC5vcmc+CiAg
YWRyaWFuIDxhZHJpYW5ARnJlZUJTRC5vcmc+CiAgYWUgPGFlQEZyZWVCU0Qub3JnPgogIGFuZHJl
dyA8YW5kcmV3QEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAg
Y2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRhbmZlIDxkYW5m
ZUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGRpbSA8ZGlt
QEZyZWVCU0Qub3JnPgogIGRvdWdtIDxkb3VnbUBGcmVlQlNELm9yZz4KICBlbWFzdGUgPGVtYXN0
ZUBGcmVlQlNELm9yZz4KICBnbGViaXVzIDxnbGViaXVzQEZyZWVCU0Qub3JnPgogIGpjaGFuZHJh
IDxqY2hhbmRyYUBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0
cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9yZz4KICBqb2hh
bHVuIDxqb2hhbHVuQEZyZWVCU0Qub3JnPgogIGtlbiA8a2VuQEZyZWVCU0Qub3JnPgogIGtldmFu
cyA8a2V2YW5zQEZyZWVCU0Qub3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGx1cG9ybCA8
bHVwb3JsQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVlQlNELm9yZz4KICBtYXJraiA8
bWFya2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbWNrdXNpY2sgPG1j
a3VzaWNrQEZyZWVCU0Qub3JnPgogIHBmZyA8cGZnQEZyZWVCU0Qub3JnPgogIHBrdWJhaiA8cGt1
YmFqQEZyZWVCU0Qub3JnPgogIHJncmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAgc2VmIDxz
ZWZARnJlZUJTRC5vcmc+CiAgc2pnIDxzamdARnJlZUJTRC5vcmc+CiAgdHJhc3ogPHRyYXN6QEZy
ZWVCU0Qub3JnPgogIHRzb29tZSA8dHNvb21lQEZyZWVCU0Qub3JnPgogIHR1ZXhlbiA8dHVleGVu
QEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1h
bWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFp
bCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpM
b2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVz
ZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWls
O2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZv
dW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9
c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgOTkw
IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
