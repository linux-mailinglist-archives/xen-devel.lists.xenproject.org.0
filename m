Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68F134EEE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 22:34:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipIvI-0001Xt-Ox; Wed, 08 Jan 2020 21:31:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ko4=25=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ipIvH-0001Xo-50
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 21:31:27 +0000
X-Inumbo-ID: 2fdca022-325e-11ea-b1f0-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fdca022-325e-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 21:31:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ipIuz-0005eZ-N5; Wed, 08 Jan 2020 21:31:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ipIuy-0004eI-HB; Wed, 08 Jan 2020 21:31:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ipIuy-0001OA-Gb; Wed, 08 Jan 2020 21:31:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145817-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=972d88726410e21b1fff1a528854202c67e97ef1
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Jan 2020 21:31:08 +0000
Subject: [Xen-devel] [ovmf test] 145817: regressions - FAIL
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

ZmxpZ2h0IDE0NTgxNyBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDU4MTcvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKCnZlcnNpb24gdGFy
Z2V0ZWQgZm9yIHRlc3Rpbmc6CiBvdm1mICAgICAgICAgICAgICAgICA5NzJkODg3MjY0MTBlMjFi
MWZmZjFhNTI4ODU0MjAyYzY3ZTk3ZWYxCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAg
ICAgICAgICA3MDkxMWYxZjRhZWUwMzY2YjYxMjJmMmI5MGQzNjdlYzBmMDY2YmViCgpMYXN0IHRl
c3Qgb2YgYmFzaXMgICAxNDU3NjcgIDIwMjAtMDEtMDggMDA6Mzk6MDkgWiAgICAwIGRheXMKRmFp
bGluZyBzaW5jZSAgICAgICAgMTQ1Nzc0ICAyMDIwLTAxLTA4IDAyOjUwOjIwIFogICAgMCBkYXlz
ICAgIDQgYXR0ZW1wdHMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQ1NzkwICAyMDIwLTAxLTA4IDA5
OjEwOjMwIFogICAgMCBkYXlzICAgIDMgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQg
cmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQXNoaXNoIFNpbmdoYWwgPGFzaGlzaHNpbmdoYUBudmlk
aWEuY29tPgogIFBhdmFuYS5LIDxwYXZhbmEua0BpbnRlbC5jb20+CiAgU2l5dWFuIEZ1IDxzaXl1
YW4uZnVAaW50ZWwuY29tPgogIFNpeXVhbiwgRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+Cgpqb2Jz
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
ICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3Nz
dGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2Vz
OiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFi
bGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJh
bCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0
O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3Qg
aGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpjb21taXQg
OTcyZDg4NzI2NDEwZTIxYjFmZmYxYTUyODg1NDIwMmM2N2U5N2VmMQpBdXRob3I6IEFzaGlzaCBT
aW5naGFsIDxhc2hpc2hzaW5naGFAbnZpZGlhLmNvbT4KRGF0ZTogICBUdWUgRGVjIDI0IDEwOjU3
OjQ3IDIwMTkgKzA4MDAKCiAgICBNZGVNb2R1bGVQa2c6IEFkZCBFREsyIFBsYXRmb3JtIEJvb3Qg
TWFuYWdlciBQcm90b2NvbAogICAgCiAgICBBZGQgZWRrMiBwbGF0Zm9ybSBib290IG1hbmFnZXIg
cHJvdG9jb2wgd2hpY2ggd291bGQgaGF2ZSBwbGF0Zm9ybQogICAgc3BlY2lmaWMgcmVmcmVzaGVz
IHRvIHRoZSBhdXRvIGVudW1lcmF0ZWQgYXMgd2VsbCBhcyBOViBib290IG9wdGlvbnMKICAgIGZv
ciB0aGUgcGxhdGZvcm0uCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEFzaGlzaCBTaW5naGFsIDxh
c2hpc2hzaW5naGFAbnZpZGlhLmNvbT4KICAgIFJldmlld2VkLWJ5OiBSYXkgTmkgPHJheS5uaUBp
bnRlbC5jb20+Cgpjb21taXQgYzlkNzI2Mjg0MzIxMjZjYmNlNThhNDhiNDQwZTQ5NDRiYWE0YmVh
YgpBdXRob3I6IFBhdmFuYS5LIDxwYXZhbmEua0BpbnRlbC5jb20+CkRhdGU6ICAgVGh1IEphbiAy
IDIwOjMwOjI3IDIwMjAgKzAwMDAKCiAgICBDcnlwdG9Qa2c6IFN1cHBvcnQgZm9yIFNIQTM4NCAm
IFNIQTUxMiBSU0Egc2lnbmluZyBzY2hlbWVzCiAgICAKICAgIEJaOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTIzODkKICAgIAogICAgQ3VycmVudGx5IFJT
QSBzaWduaW5nIHNjaGVtZSBzdXBwb3J0IGlzIGF2YWlsYWJsZSBmb3IgTUQ1LCBTSEEtMSBvcgog
ICAgU0hBLTI1NiBhbGdvcml0aG1zLlRoZSBmaXggaXMgdG8gZXh0ZW5kIHRoaXMgc3VwcG9ydCBm
b3IgU0hBMzg0IGFuZAogICAgU0hBNTEyLgogICAgCiAgICBDYzogTGltaW5nIEdhbyA8bGltaW5n
Lmdhb0BpbnRlbC5jb20+CiAgICBDYzogSmlhbiBKIFdhbmcgPGppYW4uai53YW5nQGludGVsLmNv
bT4KICAgIENjOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICAKICAgIFNpZ25l
ZC1vZmYtYnk6IFBhdmFuYS5LIDxwYXZhbmEua0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTog
SmlhbiBKIFdhbmcgPGppYW4uai53YW5nQGludGVsLmNvbT4KCmNvbW1pdCAzOTZlNzkxMDU5ZjM3
MDYyY2JlZTg1Njk2ZTJiNDE4NmVjNzJhOWUzCkF1dGhvcjogU2l5dWFuLCBGdSA8c2l5dWFuLmZ1
QGludGVsLmNvbT4KRGF0ZTogICBGcmkgSmFuIDMgMTQ6NTk6MjcgMjAyMCArMDgwMAoKICAgIFVl
ZmlDcHVQa2c6IEFsd2F5cyBsb2FkIG1pY3JvY29kZSBwYXRjaCBvbiBBUCBwcm9jZXNzb3IuCiAg
ICAKICAgIFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgbWljcm9jb2RlIGxvYWRlciB0byBhbHdheXMg
cGVyZm9ybSBhIG1pY3JvY29kZQogICAgZGV0ZWN0IGFuZCBsb2FkIG9uIGJvdGggQlNQIGFuZCBB
UCBwcm9jZXNzb3IuIFRoaXMgaXMgdG8gZml4IGEgcG90ZW50aWFsCiAgICBtaWNyb2NvZGUgcmV2
aXNpb24gbWlzbWF0Y2ggaXNzdWUgaW4gYmVsb3cgc2l0dWF0aW9uOgogICAgMS4gQXNzdW1lIHRo
ZXJlIGFyZSB0d28gbWljcm9jb2RlIGNvLWV4aXN0cyBpbiBmbGFzaDogb25lIHByb2R1Y3Rpb24K
ICAgICAgIHZlcnNpb24gYW5kIG9uZSBkZWJ1ZyB2ZXJzaW9uIG1pY3JvY29kZS4KICAgIDIuIEZJ
VCBsb2FkcyBwcm9kdWN0aW9uIG1pY3JvY29kZSB0byBCU1AgYW5kIGFsbCBBUC4KICAgIDMuIFVl
ZmlDcHVQa2cgbG9hZGVyIGxvYWRzIGRlYnVnIG1pY3JvY29kZSB0byBCU1AsIGFuZCBza2lwIHRo
ZSBsb2FkaW5nCiAgICAgICBvbiBBUC4KICAgIEFzIGEgcmVzdWx0LCBkaWZmZXJlbnQgbWljcm9j
b2RlIHBhdGNoZXMgYXJlIGxvYWRlZCB0byBCU1AgYW5kIEFQLCBhbmQKICAgIHRyaWdnZXIgbWlj
cm9jb2RlIG1pc21hdGNoIGVycm9yIGR1cmluZyBPUyBib290LgogICAgCiAgICBCWiBsaW5rOiBo
dHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0MzEKICAgIAog
ICAgQ2M6IEVyaWMgRG9uZyA8ZXJpYy5kb25nQGludGVsLmNvbT4KICAgIENjOiBSYXkgTmkgPHJh
eS5uaUBpbnRlbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBTaXl1YW4gRnUgPHNpeXVhbi5mdUBp
bnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogRXJpYyBEb25nIDxlcmljLmRvbmdAaW50ZWwuY29t
PgoKY29tbWl0IDA4YTQ3NWRmMTBiNzVmODRjZGViOWIxMWUzOGY4ZWVlOWI1YzA0OGQKQXV0aG9y
OiBTaXl1YW4gRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+CkRhdGU6ICAgRnJpIEphbiAzIDE1OjEx
OjUxIDIwMjAgKzA4MDAKCiAgICBVZWZpQ3B1UGtnOiBSZW1vdmUgYWxpZ25tZW50IGNoZWNrIHdo
ZW4gY2FsY3VsYXRlIG1pY3JvY29kZSBzaXplLgogICAgCiAgICBUaGlzIHBhdGNoIHJlbW92ZXMg
dGhlIHVubmVjZXNzYXJ5IGFsaWdubWVudCBjaGVjayBvbiBtaWNyb2NvZGUgcGF0Y2gKICAgIFRv
dGFsU2l6ZSBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBkNzg2YTE3Mi4gVGhlIFRvdGFsU2l6ZSBoYXMg
YWxyZWFkeSBiZWVuCiAgICBjaGVja2VkIHdpdGggMUsgYWxpZ25tZW50IGFuZCBNQVhfQUREUkVT
UyBpbiBwcmV2aW91cyBjb2RlIGFzIGJlbG93OgogICAgCiAgICAgICAgaWYgKCAoVUlOVE4pTWlj
cm9jb2RlRW50cnlQb2ludCA+IChNQVhfQUREUkVTUyAtIFRvdGFsU2l6ZSkgfHwKICAgICAgICAg
ICAgICgoVUlOVE4pTWljcm9jb2RlRW50cnlQb2ludCArIFRvdGFsU2l6ZSkgPiBNaWNyb2NvZGVF
bmQgfHwKICAgICAgICAgICAgIChEYXRhU2l6ZSAmIDB4MykgIT0gMCB8fAogICAgICAgICAgICAg
KFRvdGFsU2l6ZSAmIChTSVpFXzFLQiAtIDEpKSAhPSAwIHx8CiAgICAgICAgICAgICBUb3RhbFNp
emUgPCBEYXRhU2l6ZQogICAgICAgICAgICkgewogICAgCiAgICBDYzogRXJpYyBEb25nIDxlcmlj
LmRvbmdAaW50ZWwuY29tPgogICAgQ2M6IFJheSBOaSA8cmF5Lm5pQGludGVsLmNvbT4KICAgIENj
OiBIYW8gQSBXdSA8aGFvLmEud3VAaW50ZWwuY29tPgogICAgU2lnbmVkLW9mZi1ieTogU2l5dWFu
IEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFJheSBOaSA8cmF5Lm5p
QGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
