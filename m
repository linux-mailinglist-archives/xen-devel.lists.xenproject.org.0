Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C060F01
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 06:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjchv-0007Ju-94; Sat, 06 Jul 2019 04:53:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j5Tn=VD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hjcht-0007Jl-EI
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 04:53:53 +0000
X-Inumbo-ID: 09be5ae4-9faa-11e9-bb4a-ebb59628dd47
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09be5ae4-9faa-11e9-bb4a-ebb59628dd47;
 Sat, 06 Jul 2019 04:53:47 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hjchk-0000cD-Ek; Sat, 06 Jul 2019 04:53:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hjchk-0001C8-5E; Sat, 06 Jul 2019 04:53:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hjchk-0007Zf-3C; Sat, 06 Jul 2019 04:53:44 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138766-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:<job
 status>:broken:regression
 freebsd-master:build-amd64-freebsd:host-install(5):broken:regression
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=93d0ca1e9da97f492ba6fb9f7774c6b6172879c3
X-Osstest-Versions-That: freebsd=14e63f898b16382f4577cfea211a7fb5ad7983e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jul 2019 04:53:44 +0000
Subject: [Xen-devel] [freebsd-master test] 138766: trouble: blocked/broken
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

ZmxpZ2h0IDEzODc2NiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4NzY2LwoKRmFpbHVyZXMgYW5kIHBy
b2JsZW1zIHdpdGggdGVzdHMgOi0oCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWls
ZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAg
YnJva2VuCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICA1IGhvc3QtaW5zdGFsbCg1KSAg
ICAgICAgYnJva2VuIFJFR1IuIHZzLiAxMzg1NDAKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2Vl
ZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAx
IGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiBidWlsZC1hbWQ2NC1m
cmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAg
bi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAg
OTNkMGNhMWU5ZGE5N2Y0OTJiYTZmYjlmNzc3NGM2YjYxNzI4NzljMwpiYXNlbGluZSB2ZXJzaW9u
OgogZnJlZWJzZCAgICAgICAgICAgICAgMTRlNjNmODk4YjE2MzgyZjQ1NzdjZmVhMjExYTdmYjVh
ZDc5ODNlOQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM4NTQwICAyMDE5LTA2LTI2IDA5OjIzOjA2
IFogICAgOSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDEzODYwNiAgMjAxOS0wNi0yOCAwOTox
OToyOCBaICAgIDcgZGF5cyAgICA0IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzODc2
NiAgMjAxOS0wNy0wNSAwOToxOTo1NyBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVv
cGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIGFsYyA8YWxjQEZyZWVCU0Qu
b3JnPgogIGFyaWNoYXJkc29uIDxhcmljaGFyZHNvbkBGcmVlQlNELm9yZz4KICBhc29tZXJzIDxh
c29tZXJzQEZyZWVCU0Qub3JnPgogIGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJjcmFuIDxiY3Jh
bkBGcmVlQlNELm9yZz4KICBiZHJld2VyeSA8YmRyZXdlcnlARnJlZUJTRC5vcmc+CiAgYnIgPGJy
QEZyZWVCU0Qub3JnPgogIGNvZ25ldCA8Y29nbmV0QEZyZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVl
QlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGRlcyA8ZGVzQEZyZWVC
U0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGRvdWdtIDxkb3VnbUBGcmVlQlNELm9y
Zz4KICBlbWFzdGUgPGVtYXN0ZUBGcmVlQlNELm9yZz4KICBnYW5ib2xkIDxnYW5ib2xkQEZyZWVC
U0Qub3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVl
QlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFuc0BGcmVlQlNE
Lm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBsYW5kb25mIDxsYW5kb25mQEZyZWVCU0Qu
b3JnPgogIGxvb3MgPGxvb3NARnJlZUJTRC5vcmc+CiAgbHVwb3JsIDxsdXBvcmxARnJlZUJTRC5v
cmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+
CiAgbWFyY2VsIDxtYXJjZWxARnJlZUJTRC5vcmc+CiAgbWFyaXVzIDxtYXJpdXNARnJlZUJTRC5v
cmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgog
IG1ja3VzaWNrIDxtY2t1c2lja0BGcmVlQlNELm9yZz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNE
Lm9yZz4KICBtbSA8bW1ARnJlZUJTRC5vcmc+CiAgbnAgPG5wQEZyZWVCU0Qub3JnPgogIHBoaWxp
cCA8cGhpbGlwQEZyZWVCU0Qub3JnPgogIHJncmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAg
cmxpYmJ5IDxybGliYnlARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qu
b3JnPgogIHNlYW5jIDxzZWFuY0BGcmVlQlNELm9yZz4KICBzamcgPHNqZ0BGcmVlQlNELm9yZz4K
ICB0aWpsIDx0aWpsQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBGcmVlQlNELm9yZz4KICB0
c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB2YW5neXplbiA8dmFuZ3l6ZW5ARnJlZUJTRC5v
cmc+CiAgdm1hZmZpb25lIDx2bWFmZmlvbmVARnJlZUJTRC5vcmc+CiAgd2Jsb2NrIDx3YmxvY2tA
RnJlZUJTRC5vcmc+CiAgemVpc2luZyA8emVpc2luZ0BGcmVlQlNELm9yZz4KCmpvYnM6CiBidWls
ZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YmxvY2tlZCAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xv
Z3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFy
ZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3Qg
aW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9z
c3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0
ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCmJyb2tlbi1qb2IgYnVpbGQt
YW1kNjQtZnJlZWJzZCBicm9rZW4KYnJva2VuLXN0ZXAgYnVpbGQtYW1kNjQtZnJlZWJzZCBob3N0
LWluc3RhbGwoNSkKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUg
MjUyOCBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
