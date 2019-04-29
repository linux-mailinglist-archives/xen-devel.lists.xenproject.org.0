Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4061E154
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 13:31:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4SI-0000GW-EX; Mon, 29 Apr 2019 11:28:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kTU8=S7=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hL4SH-0000GE-O7
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:28:17 +0000
X-Inumbo-ID: e107f974-6a71-11e9-a807-dbae18f28519
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e107f974-6a71-11e9-a807-dbae18f28519;
 Mon, 29 Apr 2019 11:28:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hL4SA-0005Fb-2J; Mon, 29 Apr 2019 11:28:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hL4S9-0007Ry-MR; Mon, 29 Apr 2019 11:28:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hL4S9-00077D-LT; Mon, 29 Apr 2019 11:28:09 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135403-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-freebsd-again:<none
 executed>:queued:regression
 freebsd-master:build-amd64-xen-freebsd:<none executed>:queued:regression
 freebsd-master:build-amd64-freebsd:syslog-server:running:regression
 freebsd-master:build-amd64-freebsd:freebsd-build:running:regression
X-Osstest-Versions-This: freebsd=6a06ed6af25f3f34c2776af1cc19a67672b68b8b
X-Osstest-Versions-That: freebsd=b58321507702a1125aed58ddc320b560b1bffc71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Apr 2019 11:28:09 +0000
Subject: [Xen-devel] [freebsd-master test] 135403: trouble: queued/running
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

ZmxpZ2h0IDEzNTQwMyBmcmVlYnNkLW1hc3RlciBydW5uaW5nIFtyZWFsXQpodHRwOi8vbG9ncy50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1NDAzLwoKRmFpbHVyZXMgYW5k
IHByb2JsZW1zIHdpdGggdGVzdHMgOi0oCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBi
dWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgIDxub25lIGV4ZWN1dGVkPiAgICAgICAgICAg
ICAgcXVldWVkCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgIDxub25lIGV4ZWN1dGVk
PiAgICAgICAgICAgICAgcXVldWVkCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICA0IHN5
c2xvZy1zZXJ2ZXIgICAgICAgICAgICAgICAgcnVubmluZwogYnVpbGQtYW1kNjQtZnJlZWJzZCAg
ICAgICAgICAgNyBmcmVlYnNkLWJ1aWxkICAgICAgICAgICAgICAgIHJ1bm5pbmcKCnZlcnNpb24g
dGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICA2YTA2ZWQ2YWYyNWYz
ZjM0YzI3NzZhZjFjYzE5YTY3NjcyYjY4YjhiCmJhc2VsaW5lIHZlcnNpb246CiBmcmVlYnNkICAg
ICAgICAgICAgICBiNTgzMjE1MDc3MDJhMTEyNWFlZDU4ZGRjMzIwYjU2MGIxYmZmYzcxCgpMYXN0
IHRlc3Qgb2YgYmFzaXMgICAxMzUyMzMgIDIwMTktMDQtMjQgMDk6MTk6MDMgWiAgICA1IGRheXMK
RmFpbGluZyBzaW5jZSAgICAgICAgMTM1MzE3ICAyMDE5LTA0LTI2IDA5OjE5OjA2IFogICAgMyBk
YXlzICAgIDEgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgICAgICAgICAgICAgICAgICAg
ICAgICAobm90IGZvdW5kKSAgICAgICAgIDAgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNo
ZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgYWUgPGFlQEZyZWVCU0Qub3JnPgogIGFzb21lcnMg
PGFzb21lcnNARnJlZUJTRC5vcmc+CiAgYmNyYW4gPGJjcmFuQEZyZWVCU0Qub3JnPgogIGJkZSA8
YmRlQEZyZWVCU0Qub3JnPgogIGJyIDxickBGcmVlQlNELm9yZz4KICBjZW0gPGNlbUBGcmVlQlNE
Lm9yZz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+
CiAgZ2FsbGF0aW4gPGdhbGxhdGluQEZyZWVCU0Qub3JnPgogIGdvbnpvIDxnb256b0BGcmVlQlNE
Lm9yZz4KICBoc2VsYXNreSA8aHNlbGFza3lARnJlZUJTRC5vcmc+CiAgaWFuIDxpYW5ARnJlZUJT
RC5vcmc+CiAgaW1wIDxpbXBARnJlZUJTRC5vcmc+CiAgamhiIDxqaGJARnJlZUJTRC5vcmc+CiAg
amhpYmJpdHMgPGpoaWJiaXRzQEZyZWVCU0Qub3JnPgogIGpvaGFsdW4gPGpvaGFsdW5ARnJlZUJT
RC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5v
cmc+CiAgbGV2IDxsZXZARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgog
IG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgcmdyaW1l
cyA8cmdyaW1lc0BGcmVlQlNELm9yZz4KICBybWFja2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+
CiAgcndhdHNvbiA8cndhdHNvbkBGcmVlQlNELm9yZz4KICBzaHVyZCA8c2h1cmRARnJlZUJTRC5v
cmc+CiAgdHJhc3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHRzb29tZSA8dHNvb21lQEZyZWVCU0Qu
b3JnPgogIHR1ZXhlbiA8dHVleGVuQEZyZWVCU0Qub3JnPgogIHR5Y2hvbiA8dHljaG9uQEZyZWVC
U0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBxdWV1ZWQgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJ1bm5pbmcgCiBidWlsZC1hbWQ2NC14
ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcXVldWVkICAK
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
eQoKYnJva2VuLWpvYiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluIHF1ZXVlZApicm9rZW4tam9i
IGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkIHF1ZXVlZAoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNp
b24gbG9nOyBpdCB3b3VsZCBiZSAxMjc0IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
