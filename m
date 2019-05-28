Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A398B2C1E3
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 10:57:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVXsc-00044c-HE; Tue, 28 May 2019 08:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ae6p=T4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hVXsb-00044M-Af
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 08:54:45 +0000
X-Inumbo-ID: 39ce23e2-8126-11e9-946b-afe817a775a3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ce23e2-8126-11e9-946b-afe817a775a3;
 Tue, 28 May 2019 08:54:39 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hVXsT-0003Hw-P9; Tue, 28 May 2019 08:54:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hVXsT-0004gf-IZ; Tue, 28 May 2019 08:54:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hVXsT-0003df-Hx; Tue, 28 May 2019 08:54:37 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137005-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:xen-build-freebsd:fail:regression
X-Osstest-Versions-This: freebsd=3b821c79f1cbc2774b46caa95df3b05b9ae6514f
X-Osstest-Versions-That: freebsd=aab5f5a3bd55421fa6a8dbc05332a9b9fb49992c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 May 2019 08:54:37 +0000
Subject: [Xen-devel] [freebsd-master test] 137005: regressions - FAIL
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

ZmxpZ2h0IDEzNzAwNSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MDA1LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA3IHhlbi1idWlsZC1mcmVlYnNkICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzY5MDEKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICAzYjgyMWM3
OWYxY2JjMjc3NGI0NmNhYTk1ZGYzYjA1YjlhZTY1MTRmCmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICBhYWI1ZjVhM2JkNTU0MjFmYTZhOGRiYzA1MzMyYTliOWZiNDk5OTJj
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzY5MDEgIDIwMTktMDUtMjQgMTM6MzI6MDUgWiAgICAz
IGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM3MDA1ICAyMDE5LTA1LTI3IDA5OjE5OjEyIFog
ICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25z
IHVuZGVyIHRlc3Q6CiAgMG1wIDwwbXBARnJlZUJTRC5vcmc+CiAgYWUgPGFlQEZyZWVCU0Qub3Jn
PgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+
CiAgZGFuZmUgPGRhbmZlQEZyZWVCU0Qub3JnPgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5v
cmc+CiAgZGltIDxkaW1ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+
CiAgamNoYW5kcmEgPGpjaGFuZHJhQEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3Jn
PgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVlQlNELm9yZz4KICBrZW4gPGtlbkBGcmVlQlNELm9y
Zz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9ybEBGcmVlQlNELm9yZz4K
ICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgog
IG1ja3VzaWNrIDxtY2t1c2lja0BGcmVlQlNELm9yZz4KICBwa3ViYWogPHBrdWJhakBGcmVlQlNE
Lm9yZz4KICByZ3JpbWVzIDxyZ3JpbWVzQEZyZWVCU0Qub3JnPgogIHNlZiA8c2VmQEZyZWVCU0Qu
b3JnPgogIHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4K
ICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNk
LWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9t
ZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQK
ICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhw
bGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMg
YXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9Ymxv
YjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVz
cyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/
cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7
IGl0IHdvdWxkIGJlIDU4NyBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
