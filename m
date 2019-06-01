Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B373211D
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2019 01:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXD3F-0001O5-If; Sat, 01 Jun 2019 23:04:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qMpa=UA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hXD3D-0001Nt-TW
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 23:04:35 +0000
X-Inumbo-ID: 9e9f12f6-84c1-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e9f12f6-84c1-11e9-8980-bc764e045a96;
 Sat, 01 Jun 2019 23:04:34 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hXD3A-0004Ln-4z; Sat, 01 Jun 2019 23:04:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hXD39-000188-SF; Sat, 01 Jun 2019 23:04:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hXD39-0001Kl-Rh; Sat, 01 Jun 2019 23:04:31 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137107-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
X-Osstest-Versions-This: freebsd=11c242c7312a2c5301e5fe9a8bf4ddf0f372a226
X-Osstest-Versions-That: freebsd=aab5f5a3bd55421fa6a8dbc05332a9b9fb49992c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Jun 2019 23:04:31 +0000
Subject: [Xen-devel] [freebsd-master test] 137107: regressions - FAIL
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

ZmxpZ2h0IDEzNzEwNyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MTA3LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzY5MDEKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICAxMWMyNDJj
NzMxMmEyYzUzMDFlNWZlOWE4YmY0ZGRmMGYzNzJhMjI2CmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICBhYWI1ZjVhM2JkNTU0MjFmYTZhOGRiYzA1MzMyYTliOWZiNDk5OTJj
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzY5MDEgIDIwMTktMDUtMjQgMTM6MzI6MDUgWiAgICA4
IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAgMTM3MDA1ICAyMDE5LTA1LTI3IDA5OjE5OjEyIFog
ICAgNSBkYXlzICAgIDMgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM3MTA3ICAyMDE5
LTA1LTMxIDA5OjE5OjM2IFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hv
IHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgMG1wIDwwbXBARnJlZUJTRC5vcmc+CiAg
YWRyaWFuIDxhZHJpYW5ARnJlZUJTRC5vcmc+CiAgYWUgPGFlQEZyZWVCU0Qub3JnPgogIGFsbGFu
anVkZSA8YWxsYW5qdWRlQEZyZWVCU0Qub3JnPgogIGFuZHJldyA8YW5kcmV3QEZyZWVCU0Qub3Jn
PgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5vcmc+
CiAgYnIgPGJyQEZyZWVCU0Qub3JnPgogIGJyb29rcyA8YnJvb2tzQEZyZWVCU0Qub3JnPgogIGNh
cmxhdmlsbGEgPGNhcmxhdmlsbGFARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+
CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGRhbmZlIDxkYW5mZUBGcmVlQlNELm9yZz4KICBkY2hh
Z2luIDxkY2hhZ2luQEZyZWVCU0Qub3JnPgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+
CiAgZGltIDxkaW1ARnJlZUJTRC5vcmc+CiAgZG91Z20gPGRvdWdtQEZyZWVCU0Qub3JnPgogIGVt
YXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGVyaiA8ZXJqQEZyZWVCU0Qub3JnPgogIGdqYiA8
Z2piQEZyZWVCU0Qub3JnPgogIGdsZWJpdXMgPGdsZWJpdXNARnJlZUJTRC5vcmc+CiAgamNoYW5k
cmEgPGpjaGFuZHJhQEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJi
aXRzIDxqaGliYml0c0BGcmVlQlNELm9yZz4KICBqa2ltIDxqa2ltQEZyZWVCU0Qub3JnPgogIGpv
aGFsdW4gPGpvaGFsdW5ARnJlZUJTRC5vcmc+CiAga2VuIDxrZW5ARnJlZUJTRC5vcmc+CiAga2V2
YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAgbHVwb3Js
IDxsdXBvcmxARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hcmtq
IDxtYXJrakBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtY2t1c2ljayA8
bWNrdXNpY2tARnJlZUJTRC5vcmc+CiAgbXcgPG13QEZyZWVCU0Qub3JnPgogIG5wIDxucEBGcmVl
QlNELm9yZz4KICBwZmcgPHBmZ0BGcmVlQlNELm9yZz4KICBwa3ViYWogPHBrdWJhakBGcmVlQlNE
Lm9yZz4KICByZ3JpbWVzIDxyZ3JpbWVzQEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxybWFja2xl
bUBGcmVlQlNELm9yZz4KICBycG9rYWxhIDxycG9rYWxhQEZyZWVCU0Qub3JnPgogIHNlZiA8c2Vm
QEZyZWVCU0Qub3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVl
QlNELm9yZz4KICB0c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB0dWV4ZW4gPHR1ZXhlbkBG
cmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1k
NjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwg
ICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9n
cywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2Ug
cmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDto
Yj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0
O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3Vu
ZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1
bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDIwNjcg
bGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
