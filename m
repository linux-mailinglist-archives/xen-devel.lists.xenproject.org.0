Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A313E304
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:59:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8Rx-0005XC-7y; Thu, 16 Jan 2020 16:56:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9NlG=3F=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1is8Rv-0005X2-BQ
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:56:51 +0000
X-Inumbo-ID: 26c08b24-3881-11ea-b89f-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26c08b24-3881-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 16:56:34 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1is8Rd-00059o-Qc; Thu, 16 Jan 2020 16:56:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1is8Rd-0002Yb-7B; Thu, 16 Jan 2020 16:56:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1is8Rd-0006V8-6T; Thu, 16 Jan 2020 16:56:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146110-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:build-i386-xsm:xen-build:fail:regression
X-Osstest-Versions-This: ovmf=710ff7490ad897383eb35d1becadabd21a733f24
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Jan 2020 16:56:33 +0000
Subject: [Xen-devel] [ovmf test] 146110: regressions - FAIL
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

ZmxpZ2h0IDE0NjExMCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYxMTAvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3CiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAg
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKCnZlcnNpb24gdGFyZ2V0ZWQgZm9y
IHRlc3Rpbmc6CiBvdm1mICAgICAgICAgICAgICAgICA3MTBmZjc0OTBhZDg5NzM4M2ViMzVkMWJl
Y2FkYWJkMjFhNzMzZjI0CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA3
MDkxMWYxZjRhZWUwMzY2YjYxMjJmMmI5MGQzNjdlYzBmMDY2YmViCgpMYXN0IHRlc3Qgb2YgYmFz
aXMgICAxNDU3NjcgIDIwMjAtMDEtMDggMDA6Mzk6MDkgWiAgICA4IGRheXMKRmFpbGluZyBzaW5j
ZSAgICAgICAgMTQ1Nzc0ICAyMDIwLTAxLTA4IDAyOjUwOjIwIFogICAgOCBkYXlzICAgMzggYXR0
ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQ2MTEwICAyMDIwLTAxLTE1IDA5OjQ4OjUyIFog
ICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25z
IHVuZGVyIHRlc3Q6CiAgQWFyb24gTGkgPGFhcm9uLmxpQGludGVsLmNvbT4KICBBbGJlY2tpLCBN
YXRldXN6IDxtYXRldXN6LmFsYmVja2lAaW50ZWwuY29tPgogIEFyZCBCaWVzaGV1dmVsIDxhcmQu
Ymllc2hldXZlbEBsaW5hcm8ub3JnPgogIEFzaGlzaCBTaW5naGFsIDxhc2hpc2hzaW5naGFAbnZp
ZGlhLmNvbT4KICBCcmlhbiBSIEhhdWcgPGJyaWFuLnIuaGF1Z0BpbnRlbC5jb20+CiAgRXJpYyBE
b25nIDxlcmljLmRvbmdAaW50ZWwuY29tPgogIEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVs
LmNvbT4KICBIYW8gQSBXdSA8aGFvLmEud3VAaW50ZWwuY29tPgogIEphc29uIFZvZWx6IDxqYXNv
bi52b2VsekBpbnRlbC5jb20+CiAgS3J6eXN6dG9mIEtvY2ggPGtyenlzenRvZi5rb2NoQGFybS5j
b20+CiAgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBMaSwgQWFyb24gPGFhcm9u
LmxpQGludGVsLmNvbT4KICBNYXRldXN6IEFsYmVja2kgPG1hdGV1c3ouYWxiZWNraUBpbnRlbC5j
b20+CiAgTWljaGFlbCBEIEtpbm5leSA8bWljaGFlbC5kLmtpbm5leUBpbnRlbC5jb20+CiAgUGF2
YW5hLksgPHBhdmFuYS5rQGludGVsLmNvbT4KICBQaGlsaXBwZSBNYXRoaWV1LURhdWQ/IDxwaGls
bWRAcmVkaGF0LmNvbT4KICBQaGlsaXBwZSBNYXRoaWV1LURhdWRlIDxwaGlsbWRAcmVkaGF0LmNv
bT4KICBTaXl1YW4gRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+CiAgU2l5dWFuLCBGdSA8c2l5dWFu
LmZ1QGludGVsLmNvbT4KICBTdWRpcHRvIFBhdWwgPHN1ZGlwdG8ucGF1bEBhcm0uY29tPgogIFZp
dGFseSBDaGVwdHNvdiA8dml0OTY5NkBwcm90b25tYWlsLmNvbT4KICBWaXRhbHkgQ2hlcHRzb3Yg
dmlhIEdyb3Vwcy5JbyA8dml0OTY5Nj1wcm90b25tYWlsLmNvbUBncm91cHMuaW8+CiAgWmhpanUu
RmFuIDx6aGlqdXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkz
ODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWls
ICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4
Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11
dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0
LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAg
ICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dz
LCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSBy
ZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hi
PW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7
YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5k
IGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3Vt
bWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgNjg2IGxp
bmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
