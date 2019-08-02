Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B418002E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 20:31:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htcGZ-0003UG-TP; Fri, 02 Aug 2019 18:26:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kqZB=V6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1htcGZ-0003U7-2G
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 18:26:59 +0000
X-Inumbo-ID: 18e41b80-b553-11e9-95ad-030ae3993524
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18e41b80-b553-11e9-95ad-030ae3993524;
 Fri, 02 Aug 2019 18:26:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1htcGP-0007ny-U8; Fri, 02 Aug 2019 18:26:49 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1htcGP-0001SD-Cl; Fri, 02 Aug 2019 18:26:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1htcGP-0000BS-CA; Fri, 02 Aug 2019 18:26:49 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139637-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=f66d5bcdd266eb22421e6f81a8f4530d1627b4a8
X-Osstest-Versions-That: freebsd=58ae190bd3c0e785e5895867257c9926915fb818
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Aug 2019 18:26:49 +0000
Subject: [Xen-devel] [freebsd-master test] 139637: all pass - PUSHED
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

ZmxpZ2h0IDEzOTYzNyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5NjM3LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZjY2ZDViY2RkMjY2ZWIyMjQyMWU2
ZjgxYThmNDUzMGQxNjI3YjRhOApiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNThhZTE5MGJkM2MwZTc4NWU1ODk1ODY3MjU3Yzk5MjY5MTVmYjgxOAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5NTU5ICAyMDE5LTA3LTMxIDA5OjE5OjMyIFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTYzNyAgMjAxOS0wOC0wMiAwOToyMDowOCBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGJ6IDxiekBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGVt
YXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIEVyaWMgSm95bmVyIDxlcmpAZnJlZWJzZC5vcmc+
CiAgZXJqIDxlcmpARnJlZUJTRC5vcmc+CiAgSmFjb2IgS2VsbGVyIDxqYWNvYi5lLmtlbGxlckBp
bnRlbC5jb20+CiAgamhpYmJpdHMgPGpoaWJiaXRzQEZyZWVCU0Qub3JnPgogIGpraW0gPGpraW1A
RnJlZUJTRC5vcmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJl
ZUJTRC5vcmc+CiAgbHVwb3JsIDxsdXBvcmxARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZy
ZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNE
Lm9yZz4KICBtY2t1c2ljayA8bWNrdXNpY2tARnJlZUJTRC5vcmc+CiAgb3Nob2dibyA8b3Nob2di
b0BGcmVlQlNELm9yZz4KICBybWFja2xlbSA8cm1hY2tsZW1ARnJlZUJTRC5vcmc+CiAgcnJzIDxy
cnNARnJlZUJTRC5vcmc+CiAgdHVleGVuIDx0dWV4ZW5ARnJlZUJTRC5vcmc+CiAgd29zY2ggPHdv
c2NoQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAg
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
L3hlbi9naXQvZnJlZWJzZC5naXQKICAgNThhZTE5MGJkM2MuLmY2NmQ1YmNkZDI2ICBmNjZkNWJj
ZGQyNjZlYjIyNDIxZTZmODFhOGY0NTMwZDE2MjdiNGE4IC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
