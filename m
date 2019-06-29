Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50D5ABAE
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jun 2019 16:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhE0j-000837-KA; Sat, 29 Jun 2019 14:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qbs8=U4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hhE0i-00082v-4i
 for xen-devel@lists.xenproject.org; Sat, 29 Jun 2019 14:07:24 +0000
X-Inumbo-ID: 35b1614c-9a77-11e9-95b3-af642e52bb89
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35b1614c-9a77-11e9-95b3-af642e52bb89;
 Sat, 29 Jun 2019 14:07:20 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hhE0d-0007qK-S6; Sat, 29 Jun 2019 14:07:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hhE0d-0005Wv-Gd; Sat, 29 Jun 2019 14:07:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hhE0d-0006E9-Fk; Sat, 29 Jun 2019 14:07:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-138607-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=48fdf9a6df2c401fb8850659a67d1fbbc353d771
X-Osstest-Versions-That: ovmf=c54c85621826ace8684879fef9eb8ba7f49cfb54
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Jun 2019 14:07:19 +0000
Subject: [Xen-devel] [ovmf test] 138607: all pass - PUSHED
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

ZmxpZ2h0IDEzODYwNyBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzg2MDcvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICA0OGZkZjlhNmRmMmM0MDFmYjg4NTA2NTlhNjdkMWZi
YmMzNTNkNzcxCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBjNTRjODU2
MjE4MjZhY2U4Njg0ODc5ZmVmOWViOGJhN2Y0OWNmYjU0CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
Mzg1ODAgIDIwMTktMDYtMjcgMDU6MTk6MDUgWiAgICAyIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM4NjA3ICAyMDE5LTA2LTI4IDEwOjU1OjIxIFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgRGFuZGFuIEJp
IDxkYW5kYW4uYmlAaW50ZWwuY29tPgogIEVyaWMgSmluIDxlcmljLmppbkBpbnRlbC5jb20+CiAg
RmFuLCBaaGlqdVggPHpoaWp1eC5mYW5AaW50ZWwuY29tPgogIEppbiwgRXJpYyA8ZXJpYy5qaW5A
aW50ZWwuY29tPgogIFNoZW5nbGVpIFpoYW5nIDxzaGVuZ2xlaS56aGFuZ0BpbnRlbC5jb20+CiAg
V2VpNiBYdSA8d2VpNi54dUBpbnRlbC5jb20+CiAgWmhpanUuRmFuIDx6aGlqdXguZmFuQGludGVs
LmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9w
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1h
bWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZs
aWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3Mv
bG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4g
YXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcv
b3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVz
dCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1h
c3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNp
b24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvb3NzdGVzdC9vdm1mLmdpdAog
ICBjNTRjODU2MjE4Li40OGZkZjlhNmRmICA0OGZkZjlhNmRmMmM0MDFmYjg4NTA2NTlhNjdkMWZi
YmMzNTNkNzcxIC0+IHhlbi10ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
