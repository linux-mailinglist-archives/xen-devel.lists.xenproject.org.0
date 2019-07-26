Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82376F6F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 19:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr3Xu-0000yj-33; Fri, 26 Jul 2019 16:58:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f6kF=VX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hr3Xs-0000yZ-Fw
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 16:58:16 +0000
X-Inumbo-ID: 8f3ea359-afc6-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f3ea359-afc6-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 16:58:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hr3Xo-0000Tp-Ov; Fri, 26 Jul 2019 16:58:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hr3Xo-0008Gt-D2; Fri, 26 Jul 2019 16:58:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hr3Xo-0003oj-C0; Fri, 26 Jul 2019 16:58:12 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-139368-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=467944ce4546b5d2cd88b15125501d03597920bd
X-Osstest-Versions-That: freebsd=d78b126a34dc1b5c6830bf18ddae6f5b2990f589
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jul 2019 16:58:12 +0000
Subject: [Xen-devel] [freebsd-master test] 139368: all pass - PUSHED
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

ZmxpZ2h0IDEzOTM2OCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM5MzY4LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNDY3OTQ0Y2U0NTQ2YjVkMmNkODhi
MTUxMjU1MDFkMDM1OTc5MjBiZApiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgZDc4YjEyNmEzNGRjMWI1YzY4MzBiZjE4ZGRhZTZmNWIyOTkwZjU4OQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM5MzA5ICAyMDE5LTA3LTI0IDA5OjE5OjQwIFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzOTM2OCAgMjAxOS0wNy0yNiAwOToxOToyOCBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFsYyA8YWxjQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAg
YmprIDxiamtARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZXJq
IDxlcmpARnJlZUJTRC5vcmc+CiAgaWFuIDxpYW5ARnJlZUJTRC5vcmc+CiAgaW1wIDxpbXBARnJl
ZUJTRC5vcmc+CiAgSmFjb2IgS2VsbGVyIDxqYWNvYi5lLmtlbGxlckBpbnRlbC5jb20+CiAgamhp
YmJpdHMgPGpoaWJiaXRzQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5zQEZyZWVCU0Qub3Jn
PgogIGtyaW9uIDxrcmlvbkBGcmVlQlNELm9yZz4KICBsdXBvcmwgPGx1cG9ybEBGcmVlQlNELm9y
Zz4KICBsd2hzdSA8bHdoc3VARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3Jn
PgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxybWFja2xlbUBGcmVlQlNELm9y
Zz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZy
ZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dz
OiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmln
IGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywg
YW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtm
PVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQ
dXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2ZyZWVi
c2QuZ2l0CiAgIGQ3OGIxMjZhMzRkLi40Njc5NDRjZTQ1NCAgNDY3OTQ0Y2U0NTQ2YjVkMmNkODhi
MTUxMjU1MDFkMDM1OTc5MjBiZCAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
