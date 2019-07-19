Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BF6EA7E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXFA-00034P-Cz; Fri, 19 Jul 2019 18:04:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TkfO=VQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hoXF8-00034F-TD
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:04:30 +0000
X-Inumbo-ID: a7340835-aa4f-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7340835-aa4f-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:04:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hoXF6-00089P-9P; Fri, 19 Jul 2019 18:04:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hoXF5-0007I2-Pb; Fri, 19 Jul 2019 18:04:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hoXF5-0004Yh-Oq; Fri, 19 Jul 2019 18:04:27 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139159-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=37af220308d220ce946683e1a2e80b352fb9e856
X-Osstest-Versions-That: freebsd=6418500c9f9c91a698564bbc264c513461611472
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Jul 2019 18:04:27 +0000
Subject: [Xen-devel] [freebsd-master test] 139159: all pass - PUSHED
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

ZmxpZ2h0IDEzOTE1OSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5MTU5LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMzdhZjIyMDMwOGQyMjBjZTk0NjY4
M2UxYTJlODBiMzUyZmI5ZTg1NgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNjQxODUwMGM5ZjljOTFhNjk4NTY0YmJjMjY0YzUxMzQ2MTYxMTQ3MgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5MDg0ICAyMDE5LTA3LTE3IDA5OjE5OjM4IFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTE1OSAgMjAxOS0wNy0xOSAwOToxOTozOCBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFuZHJldyA8YW5kcmV3QEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5v
cmc+CiAgYmRyZXdlcnkgPGJkcmV3ZXJ5QEZyZWVCU0Qub3JnPgogIGJyb29rcyA8YnJvb2tzQEZy
ZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVC
U0Qub3JnPgogIGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgog
IGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGtwIDxrcEBGcmVlQlNELm9yZz4KICBtYXJraiA8bWFy
a2pARnJlZUJTRC5vcmc+CiAgbWNrdXNpY2sgPG1ja3VzaWNrQEZyZWVCU0Qub3JnPgogIHNqZyA8
c2pnQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJz
ZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2Vz
CgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0
aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVt
YWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVz
dC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJl
IGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0
O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21l
L3hlbi9naXQvZnJlZWJzZC5naXQKICAgNjQxODUwMGM5ZjkuLjM3YWYyMjAzMDhkICAzN2FmMjIw
MzA4ZDIyMGNlOTQ2NjgzZTFhMmU4MGIzNTJmYjllODU2IC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
