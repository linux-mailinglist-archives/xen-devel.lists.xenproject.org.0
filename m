Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E440B79B25
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 23:34:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDEc-0005xi-W3; Mon, 29 Jul 2019 21:31:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kpHI=V2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hsDEb-0005xY-KF
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 21:31:09 +0000
X-Inumbo-ID: 2b2d36d6-b248-11e9-8f26-ff14828fe05d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b2d36d6-b248-11e9-8f26-ff14828fe05d;
 Mon, 29 Jul 2019 21:31:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hsDET-0005bt-HN; Mon, 29 Jul 2019 21:31:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hsDET-0001y1-4D; Mon, 29 Jul 2019 21:31:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hsDET-0004at-3V; Mon, 29 Jul 2019 21:31:01 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139488-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=51e3e3ac0b7ca4c2619be3df90d1c0a9ca3176d2
X-Osstest-Versions-That: freebsd=467944ce4546b5d2cd88b15125501d03597920bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Jul 2019 21:31:01 +0000
Subject: [Xen-devel] [freebsd-master test] 139488: all pass - PUSHED
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

ZmxpZ2h0IDEzOTQ4OCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5NDg4LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNTFlM2UzYWMwYjdjYTRjMjYxOWJl
M2RmOTBkMWMwYTljYTMxNzZkMgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNDY3OTQ0Y2U0NTQ2YjVkMmNkODhiMTUxMjU1MDFkMDM1OTc5MjBiZAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5MzY4ICAyMDE5LTA3LTI2IDA5OjE5OjI4IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTQ4OCAgMjAxOS0wNy0yOSAwOToyNzoyNiBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFyeWJjaGlrIDxhcnliY2hpa0BGcmVlQlNELm9yZz4KICBhc29tZXJzIDxhc29tZXJzQEZyZWVC
U0Qub3JnPgogIGJhcHQgPGJhcHRARnJlZUJTRC5vcmc+CiAgZGltIDxkaW1ARnJlZUJTRC5vcmc+
CiAgZG91Z20gPGRvdWdtQEZyZWVCU0Qub3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBGcmVlQlNE
Lm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBr
cCA8a3BARnJlZUJTRC5vcmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBG
cmVlQlNELm9yZz4KICBybWFja2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+CiAgVG9tb2hpcm8g
S3VzdW1pIDxrdXN1bWkudG9tb2hpcm9AZ21haWwuY29tPgogIHR1ZXhlbiA8dHVleGVuQEZyZWVC
U0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14
ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
CmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBj
b25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1s
YWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBv
cnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1h
c3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFy
eQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQv
ZnJlZWJzZC5naXQKICAgNDY3OTQ0Y2U0NTQuLjUxZTNlM2FjMGI3ICA1MWUzZTNhYzBiN2NhNGMy
NjE5YmUzZGY5MGQxYzBhOWNhMzE3NmQyIC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
