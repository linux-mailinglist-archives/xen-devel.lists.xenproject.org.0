Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57C1059F
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 08:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLj0J-0000FO-Pf; Wed, 01 May 2019 06:46:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xAd2=TB=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hLj0I-0000F6-La
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 06:46:06 +0000
X-Inumbo-ID: cad6627c-6bdc-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cad6627c-6bdc-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 06:46:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hLj0G-0001xE-N3; Wed, 01 May 2019 06:46:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hLj0G-0002Fs-DM; Wed, 01 May 2019 06:46:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hLj0G-0001WJ-Ch; Wed, 01 May 2019 06:46:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135431-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:leak-check/check:fail:regression
X-Osstest-Versions-This: ovmf=e2d3a25f1a3135221a9c8061e1b8f90245d727eb
X-Osstest-Versions-That: ovmf=20029ca22baaeb9418c1fd9df88d12d32d585cb6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 May 2019 06:46:04 +0000
Subject: [Xen-devel] [ovmf test] 135431: regressions - FAIL
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

ZmxpZ2h0IDEzNTQzMSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzU0MzEvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAyMSBsZWFrLWNoZWNrL2NoZWNrIGZhaWwgUkVHUi4gdnMuIDEzNTMxOAoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIGUyZDNhMjVmMWEzMTM1MjIx
YTljODA2MWUxYjhmOTAyNDVkNzI3ZWIKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIDIwMDI5Y2EyMmJhYWViOTQxOGMxZmQ5ZGY4OGQxMmQzMmQ1ODVjYjYKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzNTMxOCAgMjAxOS0wNC0yNiAxMDo0MToyMyBaICAgIDQgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzUzNzEgIDIwMTktMDQtMjggMDA6NDE6MjQgWiAgICAzIGRheXMg
ICAgMiBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzU0MzEgIDIwMTktMDQtMjkgMTM6
NDE6MzQgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICAiVGllbiBIb2NrLCBMb2giIDx0aWVuLmhvY2subG9oQGlu
dGVsLmNvbT4KICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICBC
b2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgQnJldCBCYXJrZWxldyA8QnJldC5CYXJr
ZWxld0BtaWNyb3NvZnQuY29tPgogIERhbmRhbiBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4KICBI
YW8gV3UgPGhhby5hLnd1QGludGVsLmNvbT4KICBNYXJjaW4gV29qdGFzIDxtd0BzZW1paGFsZi5j
b20+CiAgU2hlbmdsZWkgWmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBUaWVuIEhv
Y2ssIExvaCA8dGllbi5ob2NrLmxvaEBpbnRlbC5jb20+CiAgV2FuZyBGYW4gPGZhbi53YW5nQGlu
dGVsLmNvbT4KICBXYW5nLCBGYW4gPGZhbi53YW5nQGludGVsLmNvbT4KICBYdWUgU2hlbmdmZW5n
WCA8c2hlbmdmZW5neC54dWVAaW50ZWwuY29tPgogIFh1ZSwgU2hlbmdmZW5nWCA8c2hlbmdmZW5n
eC54dWVAaW50ZWwuY29tPgogIFpoaWNoYW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+Cgpq
b2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4
NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2
LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAg
ICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24g
b3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1h
Z2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFp
bGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3Qv
bG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2Vu
ZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3Qu
Z2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRl
c3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZp
c2lvbiBsb2c7IGl0IHdvdWxkIGJlIDEwMTUgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
