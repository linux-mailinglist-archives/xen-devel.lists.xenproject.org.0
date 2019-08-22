Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01879894A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 04:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0cdp-0001qW-Eb; Thu, 22 Aug 2019 02:15:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=08Xs=WS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i0cdo-0001qR-CA
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 02:15:56 +0000
X-Inumbo-ID: c2a3105c-c482-11e9-ac23-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a3105c-c482-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 02:15:50 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0cdf-0004OB-TA; Thu, 22 Aug 2019 02:15:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0cdf-0002XA-El; Thu, 22 Aug 2019 02:15:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i0cdf-00058r-E3; Thu, 22 Aug 2019 02:15:47 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-140468-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=86c98d165a4b667fe15d1c139a5cb363cec17282
X-Osstest-Versions-That: freebsd=41a4c010326cd697d92141076bab53c424edb56f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Aug 2019 02:15:47 +0000
Subject: [Xen-devel] [freebsd-master test] 140468: all pass - PUSHED
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

ZmxpZ2h0IDE0MDQ2OCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwNDY4LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgODZjOThkMTY1YTRiNjY3ZmUxNWQx
YzEzOWE1Y2IzNjNjZWMxNzI4MgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNDFhNGMwMTAzMjZjZDY5N2Q5MjE0MTA3NmJhYjUzYzQyNGVkYjU2ZgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTQwMzU1ICAyMDE5LTA4LTE5IDA5OjIwOjE2IFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDE0MDQ2OCAgMjAxOS0wOC0yMSAwOToyNDo1NSBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFlIDxhZUBGcmVlQlNELm9yZz4KICBhc29tZXJzIDxhc29tZXJzQEZyZWVCU0Qub3JnPgogIGF2
ZyA8YXZnQEZyZWVCU0Qub3JnPgogIGJyb29rcyA8YnJvb2tzQEZyZWVCU0Qub3JnPgogIGNlbSA8
Y2VtQEZyZWVCU0Qub3JnPgogIGRlbHBoaWogPGRlbHBoaWpARnJlZUJTRC5vcmc+CiAgZGltIDxk
aW1ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgamVmZiA8amVm
ZkBGcmVlQlNELm9yZz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJp
dHNARnJlZUJTRC5vcmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFu
c0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBrcCA8a3BARnJlZUJTRC5v
cmc+CiAgbWFudSA8bWFudUBGcmVlQlNELm9yZz4KICBtYXJraiA8bWFya2pARnJlZUJTRC5vcmc+
CiAgbWF2IDxtYXZARnJlZUJTRC5vcmc+CiAgbWpnIDxtamdARnJlZUJTRC5vcmc+CiAgc2NvdHRw
aCA8c2NvdHRwaEBGcmVlQlNELm9yZz4KICBzdGV2ZWsgPHN0ZXZla0BGcmVlQlNELm9yZz4KICB0
c29vbWUgPHRzb29tZUBGcmVlQlNELm9yZz4KICB2bWFmZmlvbmUgPHZtYWZmaW9uZUBGcmVlQlNE
Lm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVu
LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwps
b2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29u
ZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0
cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0
ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9Ymxv
YjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAog
ICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkK
CgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2Zy
ZWVic2QuZ2l0CiAgIDQxYTRjMDEwMzI2Li44NmM5OGQxNjVhNCAgODZjOThkMTY1YTRiNjY3ZmUx
NWQxYzEzOWE1Y2IzNjNjZWMxNzI4MiAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
