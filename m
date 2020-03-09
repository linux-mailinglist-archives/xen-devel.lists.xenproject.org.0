Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763E17EC13
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 23:30:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBQps-0000ve-2l; Mon, 09 Mar 2020 22:25:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kdoy=42=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jBQpq-0000vZ-L0
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 22:25:18 +0000
X-Inumbo-ID: d9e4a8dc-6254-11ea-acb0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9e4a8dc-6254-11ea-acb0-12813bfff9fa;
 Mon, 09 Mar 2020 22:25:16 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jBQpn-0008Vs-Sv; Mon, 09 Mar 2020 22:25:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jBQpn-0006i6-BJ; Mon, 09 Mar 2020 22:25:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jBQpn-0001ap-Ae; Mon, 09 Mar 2020 22:25:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-148280-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(4):broken:regression
X-Osstest-Versions-This: ovmf=a3e25cc8a1dd3d1ea24ed02f90c44221e015e965
X-Osstest-Versions-That: ovmf=3b9cd714542a8744252d973e1f163222a9f21b9e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Mar 2020 22:25:15 +0000
Subject: [Xen-devel] [ovmf test] 148280: trouble: broken/pass
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

ZmxpZ2h0IDE0ODI4MCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDgyODAvCgpGYWlsdXJlcyBhbmQgcHJvYmxlbXMgd2l0
aCB0ZXN0cyA6LSgKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LAppbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4
Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJv
a2VuCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgNCBob3N0LWluc3RhbGwo
NCkgYnJva2VuIFJFR1IuIHZzLiAxNDgxMTQKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6
CiBvdm1mICAgICAgICAgICAgICAgICBhM2UyNWNjOGExZGQzZDFlYTI0ZWQwMmY5MGM0NDIyMWUw
MTVlOTY1CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAzYjljZDcxNDU0
MmE4NzQ0MjUyZDk3M2UxZjE2MzIyMmE5ZjIxYjllCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxNDgx
MTQgIDIwMjAtMDMtMDUgMDc6NTI6MTIgWiAgICA0IGRheXMKRmFpbGluZyBzaW5jZSAgICAgICAg
MTQ4MTU3ICAyMDIwLTAzLTA2IDA0OjEzOjQ0IFogICAgMyBkYXlzICAgIDMgYXR0ZW1wdHMKVGVz
dGluZyBzYW1lIHNpbmNlICAgMTQ4MjgwICAyMDIwLTAzLTA4IDIyOjU5OjQ5IFogICAgMCBkYXlz
ICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRl
c3Q6CiAgQW5kcmVpIFdhcmtlbnRpbiA8YXdhcmtlbnRpbkB2bXdhcmUuY29tPgogIEFyZCBCaWVz
aGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+CiAgUGV0ZSBCYXRhcmQgPHBldGVAYWtlby5pZT4KCmpvYnM6CiBidWlsZC1h
bWQ2NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFt
ZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2
NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJva2VuICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xv
Z3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAg
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5h
dGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAog
ICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9
UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIv
P3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNv
ZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9z
c3Rlc3QuZ2l0O2E9c3VtbWFyeQoKYnJva2VuLWpvYiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUt
b3ZtZi1hbWQ2NCBicm9rZW4KYnJva2VuLXN0ZXAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92
bWYtYW1kNjQgaG9zdC1pbnN0YWxsKDQpCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7
IGl0IHdvdWxkIGJlIDYyMSBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
