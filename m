Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FD411AD6A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 15:27:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if2v0-0003vd-C3; Wed, 11 Dec 2019 14:24:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wJzz=2B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1if2uz-0003vY-2F
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 14:24:45 +0000
X-Inumbo-ID: f644d246-1c21-11ea-8b4a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f644d246-1c21-11ea-8b4a-12813bfff9fa;
 Wed, 11 Dec 2019 14:24:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1if2ur-0002qI-LC; Wed, 11 Dec 2019 14:24:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1if2ur-0002l4-9B; Wed, 11 Dec 2019 14:24:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1if2ur-00054Q-8S; Wed, 11 Dec 2019 14:24:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144713-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-amd64:xen-build:fail:regression
 ovmf:build-i386-xsm:xen-build:fail:regression
 ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:build-i386:xen-build:fail:regression
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=2fe25a74d6fee3c2ac0b930f7f3596cb432e766e
X-Osstest-Versions-That: ovmf=804666c86e7b6f04fe5c5cfdb13199c19e0e99b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Dec 2019 14:24:37 +0000
Subject: [Xen-devel] [ovmf test] 144713: regressions - FAIL
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

ZmxpZ2h0IDE0NDcxMyBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQ3MTMvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDYgeGVu
LWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NDYzNwogYnVpbGQtaTM4Ni14
c20gICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQ0NjM3CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAg
ICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDQ2MzcKIGJ1aWxkLWkzODYgICAgICAgICAgICAg
ICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NDYzNwoK
VGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIGJ1aWxk
LWkzODYtbGlidmlydCAgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBi
bG9ja2VkICBuL2EKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1v
dm1mLWFtZDY0ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICBibG9ja2VkIG4vYQogdGVz
dC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAg
ICAgICAgIGJsb2NrZWQgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAg
ICAgICAgICAgICAgICAgMmZlMjVhNzRkNmZlZTNjMmFjMGI5MzBmN2YzNTk2Y2I0MzJlNzY2ZQpi
YXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgODA0NjY2Yzg2ZTdiNmYwNGZl
NWM1Y2ZkYjEzMTk5YzE5ZTBlOTliMAoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ0NjM3ICAyMDE5
LTEyLTA5IDA5OjA5OjQ5IFogICAgMiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NDY0NiAg
MjAxOS0xMi0xMCAwMTozOTo1MyBaICAgIDEgZGF5cyAgICA5IGF0dGVtcHRzClRlc3Rpbmcgc2Ft
ZSBzaW5jZSAgIDE0NDcxMyAgMjAxOS0xMi0xMSAxMjowOToxOSBaICAgIDAgZGF5cyAgICAxIGF0
dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFu
dG9pbmUgQ29ldXIgPGNvZXVyQGdteC5mcj4KICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2
ZWxAbGluYXJvLm9yZz4KICBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgSmlld2Vu
IFlhbyA8Smlld2VuLllhb0BpbnRlbC5jb20+CiAgTWljaGFlbCBLdWJhY2tpIDxtaWNoYWVsLmEu
a3ViYWNraUBpbnRlbC5jb20+CiAgUGhpbGlwcGUgTWF0aGlldS1EYXVkZSA8cGhpbG1kQHJlZGhh
dC5jb20+CiAgU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQt
YW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
aWwgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1h
bWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxv
Y2tlZCAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja2VkIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1k
NjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBibG9j
a2VkIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9s
b2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAg
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFu
YXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtm
PVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBj
b2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1v
c3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpjb21taXQgMmZlMjVhNzRk
NmZlZTNjMmFjMGI5MzBmN2YzNTk2Y2I0MzJlNzY2ZQpBdXRob3I6IEFyZCBCaWVzaGV1dmVsIDxh
cmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgpEYXRlOiAgIFR1ZSBNYXIgNSAxNDozMjo0OCAyMDE5
ICswMTAwCgogICAgQXJtUGtnL01tQ29tbXVuaWNhdGlvbkR4ZTogcmVsYXkgYXJjaGl0ZWN0ZWQg
UEkgZXZlbnRzIHRvIE1NIGNvbnRleHQKICAgIAogICAgUEkgZGVmaW5lcyBhIGZldyBhcmNoaXRl
Y3RlZCBldmVudHMgdGhhdCBoYXZlIHNpZ25pZmljYW5jZSBpbiB0aGUgTU0KICAgIGNvbnRleHQg
YXMgd2VsbCBhcyBpbiB0aGUgbm9uLXNlY3VyZSBEWEUgY29udGV4dC4gU28gcmVnaXN0ZXIgbm90
aWZ5CiAgICBoYW5kbGVycyBmb3IgdGhlc2UgZXZlbnRzLCBhbmQgcmVsYXkgdGhlbSBpbnRvIHRo
ZSBzdGFuZGFsb25lIE1NIHdvcmxkLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBBcmQgQmllc2hl
dXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICAgIFJldmlld2VkLWJ5OiBKaWV3ZW4g
WWFvIDxqaWV3ZW4ueWFvQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBBY2hpbiBHdXB0YSA8
YWNoaW4uZ3VwdGFAYXJtLmNvbT4KCmNvbW1pdCBkM2FkZDExZTg3ZGFjZTE4MDM4NzU2MmQ2ZjE5
NTFmMmJmZmJkM2Q5CkF1dGhvcjogTWljaGFlbCBLdWJhY2tpIDxtaWNoYWVsLmEua3ViYWNraUBp
bnRlbC5jb20+CkRhdGU6ICAgV2VkIE5vdiAyMCAxNzozMToyNCAyMDE5IC0wODAwCgogICAgTWRl
TW9kdWxlUGtnIFBlaUNvcmU6IEltcHJvdmUgY29tbWVudCBzZW1hbnRpY3MKICAgIAogICAgVGhp
cyBwYXRjaCBjbGFyaWZpZXMgd29yZGluZyBpbiBzZXZlcmFsIFBlaUNvcmUgY29tbWVudHMgdG8g
aW1wcm92ZQogICAgcmVhZGluZyBjb21wcmVoZW5zaW9uLgogICAgCiAgICBDYzogRGFuZGFuIEJp
IDxkYW5kYW4uYmlAaW50ZWwuY29tPgogICAgQ2M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50
ZWwuY29tPgogICAgQ2M6IEppYW4gSiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+CiAgICBD
YzogSGFvIEEgV3UgPGhhby5hLnd1QGludGVsLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgS3ViYWNraSA8bWljaGFlbC5hLmt1YmFja2lAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6
IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEppYW4g
SiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+Cgpjb21taXQgZDM5ZDEyNjBjNjE1YjcxNjY3
NWY2N2Y1YzRlMWY0ZjUyZGYwMWRhZApBdXRob3I6IE1pY2hhZWwgS3ViYWNraSA8bWljaGFlbC5h
Lmt1YmFja2lAaW50ZWwuY29tPgpEYXRlOiAgIFdlZCBOb3YgMjAgMTc6MTA6NDggMjAxOSAtMDgw
MAoKICAgIE1kZU1vZHVsZVBrZyBQZWlDb3JlOiBGaXggdHlwb3MKICAgIAogICAgQ2M6IERhbmRh
biBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4KICAgIENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2Fv
QGludGVsLmNvbT4KICAgIENjOiBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdAaW50ZWwuY29tPgog
ICAgQ2M6IEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIEt1YmFja2kgPG1pY2hhZWwuYS5rdWJhY2tpQGludGVsLmNvbT4KICAgIFJldmlld2Vk
LWJ5OiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWRlIDxwaGlsbWRAcmVkaGF0LmNvbT4KICAgIFJldmlld2VkLWJ5
OiBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdAaW50ZWwuY29tPgoKY29tbWl0IDk3ZWVkZjVkZmJh
ZmZkZTMzMjEwZmQ4ODA2NjI0N2NmMGI3ZDMzMjUKQXV0aG9yOiBBbnRvaW5lIENvZXVyIDxjb2V1
ckBnbXguZnI+CkRhdGU6ICAgV2VkIERlYyA0IDEyOjE0OjUzIDIwMTkgKzA4MDAKCiAgICBJbnRl
bEZzcDJXcmFwcGVyUGtnOiBGaXggdmFyaW91cyB0eXBvcwogICAgCiAgICBGaXggdmFyaW91cyB0
eXBvcyBpbiBjb21tZW50cyBhbmQgZG9jdW1lbnRhdGlvbi4KICAgIAogICAgQ2M6IENoYXNlbCBD
aGl1IDxjaGFzZWwuY2hpdUBpbnRlbC5jb20+CiAgICBDYzogTmF0ZSBEZVNpbW9uZSA8bmF0aGFu
aWVsLmwuZGVzaW1vbmVAaW50ZWwuY29tPgogICAgQ2M6IFN0YXIgWmVuZyA8c3Rhci56ZW5nQGlu
dGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWRlIDxwaGlsbWRA
cmVkaGF0LmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZGUgPHBo
aWxtZEByZWRoYXQuY29tPgogICAgUmV2aWV3ZWQtYnk6IE5hdGUgRGVTaW1vbmUgPG5hdGhhbmll
bC5sLmRlc2ltb25lQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBDaGFzZWwgQ2hpdSA8Y2hh
c2VsLmNoaXVAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFN0YXIgWmVuZyA8c3Rhci56ZW5n
QGludGVsLmNvbT4KCmNvbW1pdCA3ZTU1Y2Y2YjQ4ZGNkNDNkZTQ2ZDAwOGIyZjEyY2FhYWQyNTU0
NTAzCkF1dGhvcjogSmlld2VuIFlhbyA8amlld2VuLnlhb0BpbnRlbC5jb20+CkRhdGU6ICAgU2F0
IERlYyA3IDIxOjQxOjEwIDIwMTkgKzA4MDAKCiAgICBTZWN1cml0eVBrZy9UY2cyU21tOiBNZWFz
dXJlIHRoZSB0YWJsZSBiZWZvcmUgcGF0Y2guCiAgICAKICAgIFJFRjogaHR0cHM6Ly9idWd6aWxs
YS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTQwCiAgICAKICAgIEFjY29yZGluZyB0
byBUQ0cgUEZQIHNwZWNpZmljYXRpb246IHRoZSBBQ1BJIHRhYmxlIG11c3QgYmUKICAgIG1lYXN1
cmVkIHByaW9yIHRvIGFueSBtb2RpZmljYXRpb24sIGFuZCB0aGUgbWVhc3VyZW1lbnQKICAgIG11
c3QgYmUgc2FtZSBjcm9zcyBldmVyeSBib290IGN5Y2xlLgogICAgCiAgICBUaGVyZSBpcyBhIGZp
eCAzYTYzYzE3ZWJjODUzY2JiMjdkMTkwNzI5ZDAxZTI3ZjY4ZTY1Yjk0CiAgICBmb3IgdGhlIEhJ
RCBkYXRhLiBIb3dldmVyIHRoYXQgaXMgbm90IGVub3VnaC4KICAgIFRoZSBMQU1ML0xBU0EgYW5k
IFBDRCBjb25maWd1cmF0aW9uIGNoYW5nZSBtYXkgYWxzbyBjYXVzZQogICAgc2ltaWxhciBwcm9i
bGVtLgogICAgCiAgICBXZSBuZWVkIG1lYXN1cmUgdGhlIHRhYmxlIGJlZm9yZSBhbnkgdXBkYXRl
LgogICAgCiAgICBDYzogSmlhbiBKIFdhbmcgPGppYW4uai53YW5nQGludGVsLmNvbT4KICAgIENj
OiBDaGFvIFpoYW5nIDxjaGFvLmIuemhhbmdAaW50ZWwuY29tPgogICAgU2lnbmVkLW9mZi1ieTog
Smlld2VuIFlhbyA8Smlld2VuLllhb0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogQ2hhbyBa
aGFuZyA8Y2hhby5iLnpoYW5nQGludGVsLmNvbT4KCmNvbW1pdCBhODAwMzJkYzQ0YTEwNzFhMzRm
NDQxNWE3YzVjZWY1MTcwZWU2MTU5CkF1dGhvcjogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRl
bC5jb20+CkRhdGU6ICAgVHVlIE5vdiAxOSAxNjoyMjowOCAyMDE5ICswODAwCgogICAgQmFzZVRv
b2xzOiBSZW1vdmUgcmVkdW5kYW50IGJpbmFyeSBjYWNoZSBmaWxlCiAgICAKICAgIFJlZGVzaWdu
IHRoZSBiaW5hcnkgY2FjaGUgYW5kIG5vdCBuZWVkIHRvIHNhdmUgdGhlCiAgICBjYWNoZSBpbnRl
cm1lZGlhdGUgcmVzdWx0IGFuZCBzdGF0ZSBpbiBtZW1vcnkgYXMgYQogICAgTW9kdWxlQnVpbGRD
YWNoZUlSIGNsYXNzIGluc3RhbmNlLiBTbyByZW1vdmUgdGhlCiAgICBDYWNoZUlSLnB5IHdoaWNo
IGRlZmluZSB0aGUgTW9kdWxlQnVpbGRDYWNoZUlSIGNsYXNzLgogICAgCiAgICBTaWduZWQtb2Zm
LWJ5OiBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KICAgIAogICAgQ2M6IExpbWlu
ZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IEJvYiBGZW5nIDxib2IuYy5mZW5n
QGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5j
b20+Cgpjb21taXQgZmM4YjhkZWFjMmQ3NzUyNGZmOGNmZTQ0YWNmOTViNWUxZjU5ODA0ZQpBdXRo
b3I6IFN0ZXZlbiBTaGkgPHN0ZXZlbi5zaGlAaW50ZWwuY29tPgpEYXRlOiAgIFR1ZSBOb3YgMTkg
MTY6MTc6MDAgMjAxOSArMDgwMAoKICAgIEJhc2VUb29sczogTGV2ZXJhZ2UgY29tcGlsZXIgb3V0
cHV0IHRvIG9wdGltaXplIGJpbmFyeSBjYWNoZQogICAgCiAgICBSZWRlc2lnbiB0aGUgYmluYXJ5
IGNhY2hlIGFuZCBiYXNlcyBvbiB0aGUgY29tcGlsZXIgdG8KICAgIG91dHB1dCB0aGUgZGVwZW5k
ZW5jeSBoZWFkZXIgZmlsZXMgaW5mbyBmb3IgZXZlcnkgbW9kdWxlLgogICAgVGhlIGJpbmFyeSBj
YWNoZSB3aWxsIGRpcmVjdGx5IGNvbnN1bWUgdGhlIGRlcGVuZGVuY3kgaGVhZGVyCiAgICBmaWxl
cyBpbmZvIGFuZCBkb2Vzbid0IHBhcnNlIHRoZSBDIHNvdXJjZSBjb2RlIGJ5IGl0ZXNlbGYuCiAg
ICBBbHNvIHJlZGVzaWduIHRoZSBkZXBlbmRlbmN5IGZpbGVzIGxpc3QgZm9ybWF0IGZvciBtb2R1
bGUKICAgIGFuZCB0cnkgdG8gc2hhcmUgdGhlIGNvbW1vbiBsaWIgaGFzaCByZXN1bHQgYXMgbW9y
ZSBhcwogICAgcG9zc2libGUgaW4gbG9jYWwgcHJvY2Vzcy4gUmVtb3ZlIHRoZSB1bm5lY2Vzc2Fy
eSBzaGFyZSBkYXRhCiAgICBhY2Nlc3MgYWNyb3NzIG11bHRpcHJvY2Vzc2luZy4KICAgIAogICAg
U2lnbmVkLW9mZi1ieTogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+CiAgICAKICAg
IENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIENjOiBCb2IgRmVuZyA8
Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogQm9iIEZlbmcgPGJvYi5jLmZl
bmdAaW50ZWwuY29tPgoKY29tbWl0IDNiZmJjOTE1MDc0YTQ1ZjRkOWM2MWFhMmI2OThhNjJmMWEy
NDEyNGUKQXV0aG9yOiBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KRGF0ZTogICBN
b24gT2N0IDIxIDE0OjUxOjQ5IDIwMTkgKzA4MDAKCiAgICBCYXNlVG9vbHM6IGVuaGFuY2UgdGhl
IENhY2hlQ29weUZpbGUgbWV0aG9kIGFyZyBuYW1lcwogICAgCiAgICBFbmhhbmNlIHRoZSBDYWNo
ZUNvcHlGaWxlIG1ldGhvZCBhcmcgbmFtZXMgdG8gYmUgbW9yZQogICAgY2xlYXIgYW5kIHJlYWRh
YmxlCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBTaGkgPHN0ZXZlbi5zaGlAaW50ZWwu
Y29tPgogICAgCiAgICBDYzogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgICBD
YzogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEJvYiBG
ZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KCmNvbW1pdCA5MWY2YzUzM2Y4ZTljNDlmZmQwOThl
OTE2NzcyNDU5NmVjZmQ3NDEwCkF1dGhvcjogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5j
b20+CkRhdGU6ICAgTW9uIE9jdCAyMSAxNDoyNDo1NyAyMDE5ICswODAwCgogICAgQmFzZVRvb2xz
OiBzdG9yZSBtb3JlIGNvbXBsZXRlIG91dHB1dCBmaWxlcyBpbiBiaW5hcnkgY2FjaGUKICAgIAog
ICAgQmluYXJ5IGNhY2hlIHVzZSB0aGUgT3V0cHV0RmlsZSBtZXRob2QgdG8gcmV0dXJuIHRoZSBt
b2R1bGUKICAgIGJ1aWx0IG91dHB1dCBmaWxlcyBuZWVkZWQgdG8gc3RvcmUgaW4gY2FjaGUsIGJ1
dCBjdXJyZW50CiAgICBPdXRwdXRGaWxlIGltcGxlbWVudGF0aW9uIGRvZXNuJ3QgcmV0dXJuIGNv
bXBsZXRlIG91dHB1dCBmaWxlcy4KICAgIEVuaGFuY2UgdGhlIE91dHB1dEZpbGUgbWV0aG9kIHRv
IHJldHVybiBtb3JlIGNvbXBsZXRlIG91dHB1dCBmaWxlcy4KICAgIAogICAgU2lnbmVkLW9mZi1i
eTogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+CiAgICAKICAgIENjOiBMaW1pbmcg
R2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIENjOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0Bp
bnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29t
PgoKY29tbWl0IDBjM2U4ZTk5NDdhNmMxM2I0MzI3ZGQxMWIyMGFjYjk1NDQxNzAxY2YKQXV0aG9y
OiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CkRhdGU6ICAgV2VkIE5vdiAyMCAxMDo1
ODozMCAyMDE5ICswODAwCgogICAgQmFzZVRvb2xzOiBFbmhhbmNlIEJhc2V0b29sIGZvciBpbmNy
ZW1lbnRhbCBidWlsZAogICAgCiAgICBCWjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMzExCiAgICAKICAgIEluY2x1ZGUgZGVwZW5kZW5jeSBmaWxlIGlu
IE1ha2VmaWxlIHRvIGVuaGFuY2UKICAgIGluY3JlbWVudGFsIGJ1aWxkCiAgICAKICAgIFNpZ25l
ZC1vZmYtYnk6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KICAgIAogICAgQ2M6IExp
bWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IFN0ZXZlbiBTaGkgPHN0ZXZl
bi5zaGlAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IExpbWluZyBHYW8gPGxpbWluZy5nYW9A
aW50ZWwuY29tPgoKY29tbWl0IGNiMjc3ODE1ZDVlYTkyNzE4ZWVkMmQzMzQ2NDE0NTFjZTY1YjBm
ZjUKQXV0aG9yOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CkRhdGU6ICAgTW9uIERl
YyAyIDE2OjI1OjMyIDIwMTkgKzA4MDAKCiAgICBCYXNlVG9vbHM6IFVwZGF0ZSBidWlsZF9ydWxl
LnR4dCB0byBnZW5lcmF0ZSBkZXBlbmRlbnQgZmlsZXMuCiAgICAKICAgIEJaOiBodHRwczovL2J1
Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTIzMTEKICAgIAogICAgRW5hYmxl
IHRoZSBkZXBlbmRlbnQgZmlsZXMgZ2VuZXJhdGlvbiBmdW5jdGlvbiBmb3IgY29tcGlsZXJzCiAg
ICBhbmQgVHJpbSB0b29sLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBCb2IgRmVuZyA8Ym9iLmMu
ZmVuZ0BpbnRlbC5jb20+CiAgICAKICAgIENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVs
LmNvbT4KICAgIENjOiBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KICAgIFJldmll
d2VkLWJ5OiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KCmNvbW1pdCBlNmVkYmUz
MTVmYzNmYmQwMjc4M2NiNGZhYTkyODRmOGQwNWM0MTBkCkF1dGhvcjogQm9iIEZlbmcgPGJvYi5j
LmZlbmdAaW50ZWwuY29tPgpEYXRlOiAgIFdlZCBOb3YgMjAgMTA6NTg6MjggMjAxOSArMDgwMAoK
ICAgIEJhc2VUb29sczogR2VuZXJhdGUgZGVwZW5kZW50IGZpbGVzIGZvciBBU0wgYW5kIEFTTSBm
aWxlcwogICAgCiAgICBCWjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMzExCiAgICAKICAgIEltcGxlbWVudCB0aGUgZnVuY3Rpb24gaW4gVHJpbSB0b29s
IHRvIGdldCB0aGUgaW5jbHVkZWQKICAgIGZpbGUgbGlzdCBmb3IgQVNMIGFuZCBBU00gZmlsZS4K
ICAgIAogICAgU2lnbmVkLW9mZi1ieTogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgog
ICAgCiAgICBDYzogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgICBDYzogU3Rl
dmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogTGltaW5nIEdh
byA8bGltaW5nLmdhb0BpbnRlbC5jb20+Cgpjb21taXQgMTNjNWUzNGExYjhiZmVkYmQxMGVhMDM4
Y2ZjYmFlNWNhZWFiNjY1MgpBdXRob3I6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4K
RGF0ZTogICBNb24gRGVjIDIgMTY6MjQ6MTkgMjAxOSArMDgwMAoKICAgIEJhc2VUb29sczogQWRk
IGJ1aWxkIG9wdGlvbiBmb3IgZGVwZW5kZW5jeSBmaWxlIGdlbmVyYXRpb24KICAgIAogICAgQlo6
IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjMxMQogICAg
CiAgICBBZGQgL3Nob3dJbmNsdWRlcyBmb3IgbXN2YyBhbmQgLU1NRCAtTUYgJEAuZGVwcwogICAg
Zm9yIEdDQyBhbmQgQ0xBTkcKICAgIAogICAgUmVtb3ZlIC9NUCBmb3IgbXN2YyBzaW5jZSAvTVAg
ZG9lcyBub3Qgd29yayB3aXRoCiAgICAvc2hvd0luY2x1ZGVzCiAgICAKICAgIFNpZ25lZC1vZmYt
Ynk6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KICAgIAogICAgQ2M6IExpbWluZyBH
YW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IFN0ZXZlbiBTaGkgPHN0ZXZlbi5zaGlA
aW50ZWwuY29tPgogICAgQ2M6IE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hhZWwuZC5raW5uZXlAaW50
ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
