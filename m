Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0F62FA4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 06:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkhjj-0004iU-Uv; Tue, 09 Jul 2019 04:28:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4U=VG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hkhji-0004iK-BL
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 04:28:14 +0000
X-Inumbo-ID: f687ad05-a201-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f687ad05-a201-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 04:28:12 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hkhjf-0001F8-3i; Tue, 09 Jul 2019 04:28:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hkhje-0007DO-PV; Tue, 09 Jul 2019 04:28:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hkhje-0003fq-Ob; Tue, 09 Jul 2019 04:28:10 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138824-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd-again:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=fca80533ae8f1eac79c39312bebc938d755808b9
X-Osstest-Versions-That: freebsd=14e63f898b16382f4577cfea211a7fb5ad7983e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jul 2019 04:28:10 +0000
Subject: [Xen-devel] [freebsd-master test] 138824: regressions - FAIL
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

ZmxpZ2h0IDEzODgyNCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4ODI0LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWlu
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzg1NDAKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICBmY2E4MDUz
M2FlOGYxZWFjNzljMzkzMTJiZWJjOTM4ZDc1NTgwOGI5CmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICAxNGU2M2Y4OThiMTYzODJmNDU3N2NmZWEyMTFhN2ZiNWFkNzk4M2U5
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzg1NDAgIDIwMTktMDYtMjYgMDk6MjM6MDYgWiAgIDEy
IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM4NjA2ICAyMDE5LTA2LTI4IDA5OjE5OjI4IFog
ICAxMCBkYXlzICAgIDUgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM4ODI0ICAyMDE5
LTA3LTA4IDA5OjE5OjMwIFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hv
IHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgYWxjIDxhbGNARnJlZUJTRC5vcmc+CiAg
YXJpY2hhcmRzb24gPGFyaWNoYXJkc29uQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNA
RnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5vcmc+CiAgYmNyYW4gPGJjcmFuQEZyZWVC
U0Qub3JnPgogIGJkcmV3ZXJ5IDxiZHJld2VyeUBGcmVlQlNELm9yZz4KICBiciA8YnJARnJlZUJT
RC5vcmc+CiAgY29nbmV0IDxjb2duZXRARnJlZUJTRC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3Jn
PgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+CiAgZGVzIDxkZXNARnJlZUJTRC5vcmc+
CiAgZGltIDxkaW1ARnJlZUJTRC5vcmc+CiAgZG91Z20gPGRvdWdtQEZyZWVCU0Qub3JnPgogIGVt
YXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGZzdSA8ZnN1QEZyZWVCU0Qub3JnPgogIGdhbmJv
bGQgPGdhbmJvbGRARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxhc2t5QEZyZWVCU0Qub3Jn
PgogIGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIGpoYiA8
amhiQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5zQEZyZWVCU0Qub3JnPgogIGtpYiA8a2li
QEZyZWVCU0Qub3JnPgogIGxhbmRvbmYgPGxhbmRvbmZARnJlZUJTRC5vcmc+CiAgbG9vcyA8bG9v
c0BGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9ybEBGcmVlQlNELm9yZz4KICBsd2hzdSA8bHdo
c3VARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9yZz4KICBtYXJjZWwgPG1hcmNl
bEBGcmVlQlNELm9yZz4KICBtYXJpdXMgPG1hcml1c0BGcmVlQlNELm9yZz4KICBtYXJraiA8bWFy
a2pARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbWNrdXNpY2sgPG1ja3Vz
aWNrQEZyZWVCU0Qub3JnPgogIG1ob3JuZSA8bWhvcm5lQEZyZWVCU0Qub3JnPgogIG1tIDxtbUBG
cmVlQlNELm9yZz4KICBucCA8bnBARnJlZUJTRC5vcmc+CiAgcGhpbGlwIDxwaGlsaXBARnJlZUJT
RC5vcmc+CiAgcmdyaW1lcyA8cmdyaW1lc0BGcmVlQlNELm9yZz4KICBybGliYnkgPHJsaWJieUBG
cmVlQlNELm9yZz4KICBybWFja2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+CiAgc2VhbmMgPHNl
YW5jQEZyZWVCU0Qub3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHRpamwgPHRpamxARnJl
ZUJTRC5vcmc+CiAgdHJhc3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHRzb29tZSA8dHNvb21lQEZy
ZWVCU0Qub3JnPgogIHZhbmd5emVuIDx2YW5neXplbkBGcmVlQlNELm9yZz4KICB2bWFmZmlvbmUg
PHZtYWZmaW9uZUBGcmVlQlNELm9yZz4KICB3YmxvY2sgPHdibG9ja0BGcmVlQlNELm9yZz4KICB6
ZWlzaW5nIDx6ZWlzaW5nQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2Qt
YWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQt
YW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21l
L2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAog
ICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBs
YW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNz
IGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9w
PW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsg
aXQgd291bGQgYmUgMjczNCBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
