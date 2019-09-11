Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5DBB0251
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 19:02:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i85x9-0003Mb-Dz; Wed, 11 Sep 2019 16:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KvjC=XG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i85x7-0003MW-J2
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 16:58:45 +0000
X-Inumbo-ID: 6a0a1b00-d4b5-11e9-83dc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a0a1b00-d4b5-11e9-83dc-12813bfff9fa;
 Wed, 11 Sep 2019 16:58:44 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i85x4-0004oE-5B; Wed, 11 Sep 2019 16:58:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i85x3-0004ZU-AX; Wed, 11 Sep 2019 16:58:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i85x3-0001CR-9m; Wed, 11 Sep 2019 16:58:41 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-141221-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd:freebsd-build:fail:regression
 freebsd-master:build-amd64-freebsd-again:build-check(1):blocked:nonblocking
 freebsd-master:build-amd64-xen-freebsd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: freebsd=39803421e203f1f25b6be7d7504eb0d4431b6df2
X-Osstest-Versions-That: freebsd=a3dbacfc31a3c2ef7d9d4d12d4e5108f044c0701
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Sep 2019 16:58:41 +0000
Subject: [Xen-devel] [freebsd-master test] 141221: regressions - trouble:
 blocked/fail
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

ZmxpZ2h0IDE0MTIyMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxMjIxLwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAg
ICAgICA3IGZyZWVic2QtYnVpbGQgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDEwMDQKClRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1h
bWQ2NC1mcmVlYnNkLWFnYWluICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxv
Y2tlZCAgbi9hCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogZnJlZWJzZCAgICAgICAgICAgICAgMzk4MDM0MjFlMjAzZjFmMjViNmJlN2Q3NTA0ZWIwZDQ0
MzFiNmRmMgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAgICAgYTNkYmFjZmMz
MWEzYzJlZjdkOWQ0ZDEyZDRlNTEwOGYwNDRjMDcwMQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQx
MDA0ICAyMDE5LTA5LTA0IDA5OjIwOjEzIFogICAgNyBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDE0MTA4NiAgMjAxOS0wOS0wNiAwOToyMTozMyBaICAgIDUgZGF5cyAgICAzIGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDE0MTIyMSAgMjAxOS0wOS0xMSAwOToxOTo1NSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3Jn
PgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYXZnIDxhdmdARnJlZUJTRC5vcmc+
CiAgYmFwdCA8YmFwdEBGcmVlQlNELm9yZz4KICBiY3JhbiA8YmNyYW5ARnJlZUJTRC5vcmc+CiAg
YmRyZXdlcnkgPGJkcmV3ZXJ5QEZyZWVCU0Qub3JnPgogIGJyIDxickBGcmVlQlNELm9yZz4KICBj
ZW0gPGNlbUBGcmVlQlNELm9yZz4KICBjcmVlcyA8Y3JlZXNARnJlZUJTRC5vcmc+CiAgY3kgPGN5
QEZyZWVCU0Qub3JnPgogIGRpbSA8ZGltQEZyZWVCU0Qub3JnPgogIGVkIDxlZEBGcmVlQlNELm9y
Zz4KICBlbWFzdGUgPGVtYXN0ZUBGcmVlQlNELm9yZz4KICBmYWJpZW50IDxmYWJpZW50QEZyZWVC
U0Qub3JnPgogIGdsZWJpdXMgPGdsZWJpdXNARnJlZUJTRC5vcmc+CiAgZ29uem8gPGdvbnpvQEZy
ZWVCU0Qub3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBG
cmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqZWZmIDxqZWZmQEZyZWVCU0Qu
b3JnPgogIGpnaCA8amdoQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVlQlNE
Lm9yZz4KICBqaWxsZXMgPGppbGxlc0BGcmVlQlNELm9yZz4KICBqa2ltIDxqa2ltQEZyZWVCU0Qu
b3JnPgogIGpvaGFsdW4gPGpvaGFsdW5ARnJlZUJTRC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJl
ZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAga3AgPGtwQEZyZWVCU0Qub3JnPgog
IGx1cG9ybCA8bHVwb3JsQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVlQlNELm9yZz4K
ICBtYW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBt
YXYgPG1hdkBGcmVlQlNELm9yZz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNELm9yZz4KICBtamcg
PG1qZ0BGcmVlQlNELm9yZz4KICBvc2hvZ2JvIDxvc2hvZ2JvQEZyZWVCU0Qub3JnPgogIHBmZyA8
cGZnQEZyZWVCU0Qub3JnPgogIHBoaWxpcCA8cGhpbGlwQEZyZWVCU0Qub3JnPgogIHJtYWNrbGVt
IDxybWFja2xlbUBGcmVlQlNELm9yZz4KICBycnMgPHJyc0BGcmVlQlNELm9yZz4KICBzY290dGwg
PHNjb3R0bEBGcmVlQlNELm9yZz4KICBzY290dHBoIDxzY290dHBoQEZyZWVCU0Qub3JnPgogIHNl
dmFuIDxzZXZhbkBGcmVlQlNELm9yZz4KICBzamcgPHNqZ0BGcmVlQlNELm9yZz4KICBzdGV2ZWsg
PHN0ZXZla0BGcmVlQlNELm9yZz4KICB0YWthd2F0YSA8dGFrYXdhdGFARnJlZUJTRC5vcmc+CiAg
dHJhc3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHRzb29tZSA8dHNvb21lQEZyZWVCU0Qub3JnPgog
IHR1ZXhlbiA8dHVleGVuQEZyZWVCU0Qub3JnPgogIHl1cmlwdiA8eXVyaXB2QEZyZWVCU0Qub3Jn
PgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBibG9ja2VkIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJl
ZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
c2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6
IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcg
ZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVu
cHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBh
bmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3Rlcgog
ICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9
UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5v
dCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgMjU1MSBsaW5lcyBsb25n
LikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
