Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9D13A32F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 09:45:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irHm0-0002ZG-EE; Tue, 14 Jan 2020 08:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26Li=3D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1irHly-0002Z9-Rw
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 08:42:02 +0000
X-Inumbo-ID: af716db4-36a9-11ea-a2eb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af716db4-36a9-11ea-a2eb-bc764e2007e4;
 Tue, 14 Jan 2020 08:41:41 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1irHlc-0005rO-Aj; Tue, 14 Jan 2020 08:41:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1irHlc-0006Jy-0N; Tue, 14 Jan 2020 08:41:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1irHlb-0005CR-Vs; Tue, 14 Jan 2020 08:41:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146059-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(4):broken:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=b112ec225f1c5f85b7b7db4110b4d4f1a0626d6b
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Jan 2020 08:41:39 +0000
Subject: [Xen-devel] [ovmf test] 146059: regressions - trouble:
 broken/fail/pass
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

ZmxpZ2h0IDE0NjA1OSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYwNTkvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogdGVzdC1hbWQ2NC1hbWQ2
NC14bC1xZW11dS1vdm1mLWFtZDY0IDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBSRUdSLiB2cy4g
MTQ1NzY3CiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZt
LWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0
aW5nOgogb3ZtZiAgICAgICAgICAgICAgICAgYjExMmVjMjI1ZjFjNWY4NWI3YjdkYjQxMTBiNGQ0
ZjFhMDYyNmQ2YgpiYXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFm
MWY0YWVlMDM2NmI2MTIyZjJiOTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAg
MTQ1NzY3ICAyMDIwLTAxLTA4IDAwOjM5OjA5IFogICAgNiBkYXlzCkZhaWxpbmcgc2luY2UgICAg
ICAgIDE0NTc3NCAgMjAyMC0wMS0wOCAwMjo1MDoyMCBaICAgIDYgZGF5cyAgIDM0IGF0dGVtcHRz
ClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDE0NjA1NiAgMjAyMC0wMS0xMyAyMzozOToyNCBaICAgIDAg
ZGF5cyAgICAyIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRl
ciB0ZXN0OgogIEFsYmVja2ksIE1hdGV1c3ogPG1hdGV1c3ouYWxiZWNraUBpbnRlbC5jb20+CiAg
QXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgQXNoaXNoIFNpbmdo
YWwgPGFzaGlzaHNpbmdoYUBudmlkaWEuY29tPgogIEVyaWMgRG9uZyA8ZXJpYy5kb25nQGludGVs
LmNvbT4KICBGYW4sIFpoaWp1WCA8emhpanV4LmZhbkBpbnRlbC5jb20+CiAgSmFzb24gVm9lbHog
PGphc29uLnZvZWx6QGludGVsLmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29t
PgogIE1hdGV1c3ogQWxiZWNraSA8bWF0ZXVzei5hbGJlY2tpQGludGVsLmNvbT4KICBNaWNoYWVs
IEQgS2lubmV5IDxtaWNoYWVsLmQua2lubmV5QGludGVsLmNvbT4KICBQYXZhbmEuSyA8cGF2YW5h
LmtAaW50ZWwuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZD8gPHBoaWxtZEByZWRoYXQuY29t
PgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29tPgogIFNpeXVhbiBG
dSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBTaXl1YW4sIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29t
PgogIFZpdGFseSBDaGVwdHNvdiA8dml0OTY5NkBwcm90b25tYWlsLmNvbT4KICBWaXRhbHkgQ2hl
cHRzb3YgdmlhIEdyb3Vwcy5JbyA8dml0OTY5Nj1wcm90b25tYWlsLmNvbUBncm91cHMuaW8+CiAg
WmhpanUuRmFuIDx6aGlqdXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZp
cnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14
bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiB0ZXN0
LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2Vz
CgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0
aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVt
YWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVz
dC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJl
IGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0
O2E9c3VtbWFyeQoKYnJva2VuLWpvYiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1k
NjQgYnJva2VuCmJyb2tlbi1zdGVwIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCBob3N0LWluc3RhbGwoNCkKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291
bGQgYmUgNDQ1IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
