Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13474AE91
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 01:11:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdNCt-0003Jg-Qq; Tue, 18 Jun 2019 23:08:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EKPJ=UR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hdNCs-0003JU-4Q
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 23:08:02 +0000
X-Inumbo-ID: e9ed8c06-921d-11e9-8fb4-4341f59acaf2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9ed8c06-921d-11e9-8fb4-4341f59acaf2;
 Tue, 18 Jun 2019 23:07:59 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hdNCn-0002Bk-03; Tue, 18 Jun 2019 23:07:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hdNCm-0000ds-Je; Tue, 18 Jun 2019 23:07:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hdNCm-0002PT-Ix; Tue, 18 Jun 2019 23:07:56 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-137901-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=d946d8f14c81df5c94524f0c759db84880bbcae8
X-Osstest-Versions-That: freebsd=4fd6fe044c7407d68435d36c51e2413ba39d6a3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2019 23:07:56 +0000
Subject: [Xen-devel] [freebsd-master test] 137901: all pass - PUSHED
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

ZmxpZ2h0IDEzNzkwMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3OTAxLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZDk0NmQ4ZjE0YzgxZGY1Yzk0NTI0
ZjBjNzU5ZGI4NDg4MGJiY2FlOApiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNGZkNmZlMDQ0Yzc0MDdkNjg0MzVkMzZjNTFlMjQxM2JhMzlkNmEzYQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM3NzIzICAyMDE5LTA2LTE0IDA5OjE5OjA1IFogICAgNCBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNzkwMSAgMjAxOS0wNi0xNyAwOToxOTozNCBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFudG9pbmUg
PGFudG9pbmVARnJlZUJTRC5vcmc+CiAgYXNvbWVycyA8YXNvbWVyc0BGcmVlQlNELm9yZz4KICBi
ZHJld2VyeSA8YmRyZXdlcnlARnJlZUJTRC5vcmc+CiAgZGVscGhpaiA8ZGVscGhpakBGcmVlQlNE
Lm9yZz4KICBkb3VnbSA8ZG91Z21ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJT
RC5vcmc+CiAgZ3JvZyA8Z3JvZ0BGcmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4K
ICBqdWxpYW4gPGp1bGlhbkBGcmVlQlNELm9yZz4KICBtYXJpdXMgPG1hcml1c0BGcmVlQlNELm9y
Zz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBtY2t1c2ljayA8bWNrdXNpY2tARnJlZUJTRC5v
cmc+CiAgbndoaXRlaG9ybiA8bndoaXRlaG9ybkBGcmVlQlNELm9yZz4KICBwaGlsaXAgPHBoaWxp
cEBGcmVlQlNELm9yZz4KICByZW5lIDxyZW5lQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBG
cmVlQlNELm9yZz4KICB6ZWlzaW5nIDx6ZWlzaW5nQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxk
LWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdo
dCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9n
cwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJl
IGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBp
biBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3Nz
dGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3Rl
cgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24g
OgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJlZWJzZC5naXQKICAgNGZkNmZl
MDQ0YzcuLmQ5NDZkOGYxNGM4ICBkOTQ2ZDhmMTRjODFkZjVjOTQ1MjRmMGM3NTlkYjg0ODgwYmJj
YWU4IC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
