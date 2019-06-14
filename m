Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D3457CF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 10:44:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbhlN-0001k6-Mo; Fri, 14 Jun 2019 08:40:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4uC=UN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hbhlM-0001jw-B4
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 08:40:44 +0000
X-Inumbo-ID: 141d3874-8e80-11e9-8bc0-a3af9b6fe085
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 141d3874-8e80-11e9-8bc0-a3af9b6fe085;
 Fri, 14 Jun 2019 08:40:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hbhlB-0002R6-HF; Fri, 14 Jun 2019 08:40:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hbhlB-0001Uw-7S; Fri, 14 Jun 2019 08:40:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hbhlB-0000ip-6a; Fri, 14 Jun 2019 08:40:33 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137673-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=1f3b25e11df9b37a3d833be52de6c9c83d29a644
X-Osstest-Versions-That: freebsd=9694d3c1a707ebfc10d407f51d669bba0f958359
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Jun 2019 08:40:33 +0000
Subject: [Xen-devel] [freebsd-master test] 137673: all pass - PUSHED
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

ZmxpZ2h0IDEzNzY3MyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3NjczLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMWYzYjI1ZTExZGY5YjM3YTNkODMz
YmU1MmRlNmM5YzgzZDI5YTY0NApiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgOTY5NGQzYzFhNzA3ZWJmYzEwZDQwN2Y1MWQ2NjliYmEwZjk1ODM1OQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM3NTc2ICAyMDE5LTA2LTEwIDA5OjE5OjMyIFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNzY3MyAgMjAxOS0wNi0xMiAwOToxOTowMyBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGJkcmV3ZXJ5IDxiZHJld2VyeUBGcmVlQlNELm9yZz4KICBieiA8YnpARnJlZUJTRC5vcmc+CiAg
Y2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAgZGVscGhpaiA8ZGVscGhpakBGcmVlQlNELm9yZz4KICBk
b3VnbSA8ZG91Z21ARnJlZUJTRC5vcmc+CiAgaW1wIDxpbXBARnJlZUJTRC5vcmc+CiAgamhiIDxq
aGJARnJlZUJTRC5vcmc+CiAgbG9vcyA8bG9vc0BGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9y
bEBGcmVlQlNELm9yZz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNELm9yZz4KICB2bWFmZmlvbmUg
PHZtYWZmaW9uZUBGcmVlQlNELm9yZz4KICB6ZWlzaW5nIDx6ZWlzaW5nQEZyZWVCU0Qub3JnPgoK
am9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJz
ZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ct
cmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9o
b21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmls
ZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQg
b2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hp
bmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJlZWJzZC5n
aXQKICAgOTY5NGQzYzFhNzAuLjFmM2IyNWUxMWRmICAxZjNiMjVlMTFkZjliMzdhM2Q4MzNiZTUy
ZGU2YzljODNkMjlhNjQ0IC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
