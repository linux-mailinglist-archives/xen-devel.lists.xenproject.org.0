Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB04825B7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 21:45:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huiqE-000060-J7; Mon, 05 Aug 2019 19:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LV9r=WB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1huiqD-00005o-JB
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 19:40:21 +0000
X-Inumbo-ID: d6d082d4-b7b8-11e9-86c6-5351c22aabec
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6d082d4-b7b8-11e9-86c6-5351c22aabec;
 Mon, 05 Aug 2019 19:40:11 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1huiq2-0007ju-3U; Mon, 05 Aug 2019 19:40:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1huiq1-0000SP-OA; Mon, 05 Aug 2019 19:40:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1huiq1-0001ec-NW; Mon, 05 Aug 2019 19:40:09 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139729-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=17a1fc80d578803ae6318e7e297fc0b5605fba29
X-Osstest-Versions-That: freebsd=f66d5bcdd266eb22421e6f81a8f4530d1627b4a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Aug 2019 19:40:09 +0000
Subject: [Xen-devel] [freebsd-master test] 139729: all pass - PUSHED
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

ZmxpZ2h0IDEzOTcyOSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5NzI5LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgMTdhMWZjODBkNTc4ODAzYWU2MzE4
ZTdlMjk3ZmMwYjU2MDVmYmEyOQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgZjY2ZDViY2RkMjY2ZWIyMjQyMWU2ZjgxYThmNDUzMGQxNjI3YjRhOAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5NjM3ICAyMDE5LTA4LTAyIDA5OjIwOjA4IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTcyOSAgMjAxOS0wOC0wNSAwOToxOTozNCBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAg
YnogPGJ6QEZyZWVCU0Qub3JnPgogIGN5IDxjeUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxw
aGlqQEZyZWVCU0Qub3JnPgogIGdubiA8Z25uQEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVC
U0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0c0BGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFu
c0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBtYXJraiA8bWFya2pARnJl
ZUJTRC5vcmc+CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgcnJzIDxycnNARnJlZUJTRC5vcmc+
CiAgdGFrYXdhdGEgPHRha2F3YXRhQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZy
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
Yml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJlZWJzZC5naXQKICAgZjY2ZDViY2RkMjYuLjE3
YTFmYzgwZDU3ICAxN2ExZmM4MGQ1Nzg4MDNhZTYzMThlN2UyOTdmYzBiNTYwNWZiYTI5IC0+IHRl
c3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
