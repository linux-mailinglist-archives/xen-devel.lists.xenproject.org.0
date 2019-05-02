Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9652C11419
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 09:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM62o-0002oq-Rj; Thu, 02 May 2019 07:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DatZ=TC=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hM62o-0002oZ-4M
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 07:22:14 +0000
X-Inumbo-ID: fc0512e4-6caa-11e9-a711-0f5c7adc85fe
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc0512e4-6caa-11e9-a711-0f5c7adc85fe;
 Thu, 02 May 2019 07:22:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hM62d-00009G-H6; Thu, 02 May 2019 07:22:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hM62d-00007D-6y; Thu, 02 May 2019 07:22:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hM62d-0006eD-6L; Thu, 02 May 2019 07:22:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135451-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:leak-check/check:fail:regression
X-Osstest-Versions-This: ovmf=727d7ebaa9f3dab8822d264fbc8104aee8f08867
X-Osstest-Versions-That: ovmf=20029ca22baaeb9418c1fd9df88d12d32d585cb6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 May 2019 07:22:03 +0000
Subject: [Xen-devel] [ovmf test] 135451: regressions - FAIL
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

ZmxpZ2h0IDEzNTQ1MSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzU0NTEvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAyMSBsZWFrLWNoZWNrL2NoZWNrIGZhaWwgUkVHUi4gdnMuIDEzNTMxOAoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIDcyN2Q3ZWJhYTlmM2RhYjg4
MjJkMjY0ZmJjODEwNGFlZThmMDg4NjcKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIDIwMDI5Y2EyMmJhYWViOTQxOGMxZmQ5ZGY4OGQxMmQzMmQ1ODVjYjYKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzNTMxOCAgMjAxOS0wNC0yNiAxMDo0MToyMyBaICAgIDUgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzUzNzEgIDIwMTktMDQtMjggMDA6NDE6MjQgWiAgICA0IGRheXMg
ICAgMyBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzU0NTEgIDIwMTktMDUtMDEgMDY6
NDY6MzcgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICAiVGllbiBIb2NrLCBMb2giIDx0aWVuLmhvY2subG9oQGlu
dGVsLmNvbT4KICBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KICBB
cmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICBCb2IgRmVuZyA8Ym9i
LmMuZmVuZ0BpbnRlbC5jb20+CiAgQnJldCBCYXJrZWxldyA8QnJldC5CYXJrZWxld0BtaWNyb3Nv
ZnQuY29tPgogIERhbmRhbiBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4KICBGYW4sIFpoaWp1WCA8
emhpanV4LmZhbkBpbnRlbC5jb20+CiAgRmVuZywgQm9iIEMgPGJvYi5jLmZlbmdAaW50ZWwuY29t
PgogIEhhbyBXdSA8aGFvLmEud3VAaW50ZWwuY29tPgogIElnb3IgRHJ1emhpbmluIDxpZ29yLmRy
dXpoaW5pbkBjaXRyaXguY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CiAg
TWFyY2luIFdvanRhcyA8bXdAc2VtaWhhbGYuY29tPgogIE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hh
ZWwuZC5raW5uZXlAaW50ZWwuY29tPgogIFNoZW5nbGVpIFpoYW5nIDxzaGVuZ2xlaS56aGFuZ0Bp
bnRlbC5jb20+CiAgVGllbiBIb2NrLCBMb2ggPHRpZW4uaG9jay5sb2hAaW50ZWwuY29tPgogIFdh
bmcgRmFuIDxmYW4ud2FuZ0BpbnRlbC5jb20+CiAgV2FuZywgRmFuIDxmYW4ud2FuZ0BpbnRlbC5j
b20+CiAgWHVlIFNoZW5nZmVuZ1ggPHNoZW5nZmVuZ3gueHVlQGludGVsLmNvbT4KICBYdWUsIFNo
ZW5nZmVuZ1ggPHNoZW5nZmVuZ3gueHVlQGludGVsLmNvbT4KICBaaGljaGFvIEdhbyA8emhpY2hh
by5nYW9AaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5jb20+Cgpqb2Jz
OgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2
b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3Nz
dGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2Vz
OiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFi
bGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJh
bCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0
O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3Qg
aGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lv
biBsb2c7IGl0IHdvdWxkIGJlIDE3NzMgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
