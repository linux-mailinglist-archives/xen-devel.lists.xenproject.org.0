Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8065145
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 06:42:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlQrh-0000ej-4Z; Thu, 11 Jul 2019 04:39:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dQWt=VI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hlQrf-0000eZ-7v
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 04:39:27 +0000
X-Inumbo-ID: dc3fea9b-a395-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc3fea9b-a395-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 04:39:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hlQra-0004Yq-KQ; Thu, 11 Jul 2019 04:39:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hlQra-0005Mb-Bc; Thu, 11 Jul 2019 04:39:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hlQra-0005Yn-Ak; Thu, 11 Jul 2019 04:39:22 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-138886-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=5c4a9b0e32c1f9c47d5b687d6036bb03c3cc071c
X-Osstest-Versions-That: freebsd=14e63f898b16382f4577cfea211a7fb5ad7983e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Jul 2019 04:39:22 +0000
Subject: [Xen-devel] [freebsd-master test] 138886: all pass - PUSHED
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

ZmxpZ2h0IDEzODg4NiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM4ODg2LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNWM0YTliMGUzMmMxZjljNDdkNWI2
ODdkNjAzNmJiMDNjM2NjMDcxYwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgMTRlNjNmODk4YjE2MzgyZjQ1NzdjZmVhMjExYTdmYjVhZDc5ODNlOQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM4NTQwICAyMDE5LTA2LTI2IDA5OjIzOjA2IFogICAxNCBkYXlzCkZhaWxpbmcg
c2luY2UgICAgICAgIDEzODYwNiAgMjAxOS0wNi0yOCAwOToxOToyOCBaICAgMTIgZGF5cyAgICA2
IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzODg4NiAgMjAxOS0wNy0xMCAwOToxOToz
OCBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlz
aW9ucyB1bmRlciB0ZXN0OgogIGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFyaWNoYXJkc29uIDxh
cmljaGFyZHNvbkBGcmVlQlNELm9yZz4KICBhc29tZXJzIDxhc29tZXJzQEZyZWVCU0Qub3JnPgog
IGF2ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJjcmFuIDxiY3JhbkBGcmVlQlNELm9yZz4KICBiZHJl
d2VyeSA8YmRyZXdlcnlARnJlZUJTRC5vcmc+CiAgYnIgPGJyQEZyZWVCU0Qub3JnPgogIGNvZ25l
dCA8Y29nbmV0QEZyZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxk
ZWxwaGlqQEZyZWVCU0Qub3JnPgogIGRlcyA8ZGVzQEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZy
ZWVCU0Qub3JnPgogIGRvdWdtIDxkb3VnbUBGcmVlQlNELm9yZz4KICBlbWFzdGUgPGVtYXN0ZUBG
cmVlQlNELm9yZz4KICBmc3UgPGZzdUBGcmVlQlNELm9yZz4KICBnYW5ib2xkIDxnYW5ib2xkQEZy
ZWVCU0Qub3JnPgogIGhycyA8aHJzQEZyZWVCU0Qub3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBG
cmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9y
Zz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5v
cmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFuc0BGcmVlQlNELm9y
Zz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBsYW5kb25mIDxsYW5kb25mQEZyZWVCU0Qub3Jn
PgogIGxvb3MgPGxvb3NARnJlZUJTRC5vcmc+CiAgbHVwb3JsIDxsdXBvcmxARnJlZUJTRC5vcmc+
CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAg
bWFyY2VsIDxtYXJjZWxARnJlZUJTRC5vcmc+CiAgbWFyaXVzIDxtYXJpdXNARnJlZUJTRC5vcmc+
CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIG1j
a3VzaWNrIDxtY2t1c2lja0BGcmVlQlNELm9yZz4KICBtZXRhIDxtZXRhQEZyZWVCU0Qub3JnPgog
IG1ob3JuZSA8bWhvcm5lQEZyZWVCU0Qub3JnPgogIG1tIDxtbUBGcmVlQlNELm9yZz4KICBucCA8
bnBARnJlZUJTRC5vcmc+CiAgcGhpbGlwIDxwaGlsaXBARnJlZUJTRC5vcmc+CiAgcmdyaW1lcyA8
cmdyaW1lc0BGcmVlQlNELm9yZz4KICBybGliYnkgPHJsaWJieUBGcmVlQlNELm9yZz4KICBybWFj
a2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+CiAgc2VhbmMgPHNlYW5jQEZyZWVCU0Qub3JnPgog
IHNqZyA8c2pnQEZyZWVCU0Qub3JnPgogIHRpamwgPHRpamxARnJlZUJTRC5vcmc+CiAgdHJhc3og
PHRyYXN6QEZyZWVCU0Qub3JnPgogIHRzb29tZSA8dHNvb21lQEZyZWVCU0Qub3JnPgogIHZhbmd5
emVuIDx2YW5neXplbkBGcmVlQlNELm9yZz4KICB2bWFmZmlvbmUgPHZtYWZmaW9uZUBGcmVlQlNE
Lm9yZz4KICB3YmxvY2sgPHdibG9ja0BGcmVlQlNELm9yZz4KICB3aHUgPHdodUBGcmVlQlNELm9y
Zz4KICB6ZWlzaW5nIDx6ZWlzaW5nQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZy
ZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
YnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0
ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6
IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJs
ZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dz
CgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFs
LCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7
YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBo
YXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVu
Yml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJlZWJzZC5naXQKICAgMTRlNjNmODk4YjEuLjVj
NGE5YjBlMzJjICA1YzRhOWIwZTMyYzFmOWM0N2Q1YjY4N2Q2MDM2YmIwM2MzY2MwNzFjIC0+IHRl
c3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
