Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47050D0EBF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIB3a-00054m-UI; Wed, 09 Oct 2019 12:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=naEN=YC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iIB3Z-00054e-CR
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:27:05 +0000
X-Inumbo-ID: 1712cc62-ea90-11e9-9bee-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1712cc62-ea90-11e9-9bee-bc764e2007e4;
 Wed, 09 Oct 2019 12:26:59 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iIB3T-0006Wp-3b; Wed, 09 Oct 2019 12:26:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iIB3S-0005zo-Sa; Wed, 09 Oct 2019 12:26:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iIB3S-0000oS-Rz; Wed, 09 Oct 2019 12:26:58 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-142455-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=2de1f611be06ded3a59726a4052a9039be7d459b
X-Osstest-Versions-That: ovmf=410c4d00d9f7e369d1ce183e9e8de98cb59c4d20
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2019 12:26:58 +0000
Subject: [Xen-devel] [ovmf test] 142455: regressions - FAIL
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

ZmxpZ2h0IDE0MjQ1NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDI0NTUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDI0MjMKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQyNDIzCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgMmRlMWY2MTFiZTA2ZGVkM2E1OTcyNmE0MDUyYTkwMzliZTdkNDU5YgpiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNDEwYzRkMDBkOWY3ZTM2OWQxY2UxODNl
OWU4ZGU5OGNiNTljNGQyMAoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQyNDIzICAyMDE5LTEwLTA4
IDAxOjM5OjM0IFogICAgMSBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDE0MjQ1NSAgMjAxOS0x
MC0wOCAxOToyMTo1MiBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0
b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIFBldGUgQmF0YXJkIDxwZXRlQGFrZW8uaWU+
Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
aTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1p
Mzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQg
b24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MK
aW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBh
dmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4g
Z2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rl
c3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIK
ClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpj
b21taXQgMmRlMWY2MTFiZTA2ZGVkM2E1OTcyNmE0MDUyYTkwMzliZTdkNDU5YgpBdXRob3I6IFBl
dGUgQmF0YXJkIDxwZXRlQGFrZW8uaWU+CkRhdGU6ICAgV2VkIFNlcCAyNSAyMzo1MDowNSAyMDE5
ICswODAwCgogICAgTWRlTW9kdWxlUGtnL0Jkc0R4ZTogQWxzbyBjYWxsIFBsYXRmb3JtQm9vdE1h
bmFnZXJXYWl0Q2FsbGJhY2sgb24gMAogICAgCiAgICBUaGUgZXhpc3RpbmcgbG9vcCBpcyBzZXQg
dG8gY2FsbCBQbGF0Zm9ybUJvb3RNYW5hZ2VyV2FpdENhbGxiYWNrIGV2ZXJ5CiAgICBzZWNvbmQg
ZXhjZXB0IHRoZSBsYXN0IG9uZS4gV2UgYmVsaWV2ZSB0aGlzIGlzIGEgbWlzdGFrZSBhcyBpdCBw
cmV2ZW50cwogICAgdGhlIGNhbGxlZCBjb2RlIGZyb20gcGVyZm9ybWluZyB0aW1lb3V0IGV4cGly
YXRpb24gdGFza3Mgc3VjaCBhcywgZm9yCiAgICBpbnN0YW5jZSwgZW5zdXJpbmcgdGhhdCB0aGUg
bGFzdCBzZWdtZW50IG9mIGEgcHJvZ3Jlc3MgYmFyIGlzIGRpc3BsYXllZAogICAgYmVmb3JlIGNv
bnRpbnVpbmcgKHdoaWNoIGlzIGEgY3VycmVudCBpc3N1ZSBmb3IgdGhlIFJQaTMgcGxhdGZvcm0p
LgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBQZXRlIEJhdGFyZCA8cGV0ZUBha2VvLmllPgogICAg
UmV2aWV3ZWQtYnk6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgUmV2aWV3
ZWQtYnk6IFJheSBOaSA8cmF5Lm5pQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
