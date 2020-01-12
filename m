Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A10F1386AB
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jan 2020 14:37:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqdNn-0001hM-M7; Sun, 12 Jan 2020 13:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=24dF=3B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iqdNl-0001hG-TJ
 for xen-devel@lists.xenproject.org; Sun, 12 Jan 2020 13:34:21 +0000
X-Inumbo-ID: 39e00444-3540-11ea-8174-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39e00444-3540-11ea-8174-12813bfff9fa;
 Sun, 12 Jan 2020 13:34:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iqdNf-00033N-2c; Sun, 12 Jan 2020 13:34:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iqdNe-0004n6-QC; Sun, 12 Jan 2020 13:34:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iqdNe-0003wE-PB; Sun, 12 Jan 2020 13:34:14 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146020-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=9d1c9d0379d065ca11bc3354faee2c742e89c005
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 Jan 2020 13:34:14 +0000
Subject: [Xen-devel] [ovmf test] 146020: regressions - FAIL
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

ZmxpZ2h0IDE0NjAyMCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYwMjAvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgOWQxYzlkMDM3OWQwNjVjYTExYmMzMzU0ZmFlZTJjNzQyZTg5YzAwNQpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICAgNCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgIDQgZGF5cyAgIDIzIGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NTkyNiAgMjAyMC0wMS0xMCAxMjowOTozMyBaICAgIDIgZGF5cyAgIDExIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFyZCBCaWVz
aGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIEFzaGlzaCBTaW5naGFsIDxhc2hp
c2hzaW5naGFAbnZpZGlhLmNvbT4KICBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAg
SmFzb24gVm9lbHogPGphc29uLnZvZWx6QGludGVsLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNl
a0ByZWRoYXQuY29tPgogIFBhdmFuYS5LIDxwYXZhbmEua0BpbnRlbC5jb20+CiAgUGhpbGlwcGUg
TWF0aGlldS1EYXVkPyA8cGhpbG1kQHJlZGhhdC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVk
ZSA8cGhpbG1kQHJlZGhhdC5jb20+CiAgU2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgog
IFNpeXVhbiwgRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+CiAgVml0YWx5IENoZXB0c292IDx2aXQ5
Njk2QHByb3Rvbm1haWwuY29tPgogIFZpdGFseSBDaGVwdHNvdiB2aWEgR3JvdXBzLklvIDx2aXQ5
Njk2PXByb3Rvbm1haWwuY29tQGdyb3Vwcy5pbz4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
aTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1x
ZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFt
ZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgZmFp
bCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpM
b2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVz
ZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWls
O2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZv
dW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9
c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgMzU2
IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
