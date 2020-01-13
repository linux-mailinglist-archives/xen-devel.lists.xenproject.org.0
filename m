Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0082139D2F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 00:22:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir8wS-0006ul-LG; Mon, 13 Jan 2020 23:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DqNH=3C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ir8wR-0006ug-1H
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 23:16:15 +0000
X-Inumbo-ID: b0f97176-365a-11ea-82f7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0f97176-365a-11ea-82f7-12813bfff9fa;
 Mon, 13 Jan 2020 23:16:13 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ir8wO-0000r1-Tx; Mon, 13 Jan 2020 23:16:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ir8wO-0001Ym-Km; Mon, 13 Jan 2020 23:16:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ir8wO-00070Y-KB; Mon, 13 Jan 2020 23:16:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146051-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(4):broken:heisenbug
X-Osstest-Versions-This: ovmf=4465cd124fbcf5490faad6a1a834299b30b5d009
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Jan 2020 23:16:12 +0000
Subject: [Xen-devel] [ovmf test] 146051: regressions - trouble:
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

ZmxpZ2h0IDE0NjA1MSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDYwNTEvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogdGVzdC1hbWQ2NC1pMzg2
LXhsLXFlbXV1LW92bWYtYW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMu
IDE0NTc2NwogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0IDEwIGRlYmlhbi1o
dm0taW5zdGFsbCBmYWlsIGluIDE0NjA0NyBSRUdSLiB2cy4gMTQ1NzY3CgpUZXN0cyB3aGljaCBh
cmUgZmFpbGluZyBpbnRlcm1pdHRlbnRseSAobm90IGJsb2NraW5nKToKIHRlc3QtYW1kNjQtYW1k
NjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgNCBob3N0LWluc3RhbGwoNCkgIGJyb2tlbiBwYXNzIGlu
IDE0NjA0NwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAg
ICAgIDQ0NjVjZDEyNGZiY2Y1NDkwZmFhZDZhMWE4MzQyOTliMzBiNWQwMDkKYmFzZWxpbmUgdmVy
c2lvbjoKIG92bWYgICAgICAgICAgICAgICAgIDcwOTExZjFmNGFlZTAzNjZiNjEyMmYyYjkwZDM2
N2VjMGYwNjZiZWIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0NTc2NyAgMjAyMC0wMS0wOCAwMDoz
OTowOSBaICAgIDUgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxNDU3NzQgIDIwMjAtMDEtMDgg
MDI6NTA6MjAgWiAgICA1IGRheXMgICAzMiBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAx
NDYwNDEgIDIwMjAtMDEtMTMgMDQ6Mzk6MjMgWiAgICAwIGRheXMgICAgNCBhdHRlbXB0cwoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbGJlY2tpLCBNYXRl
dXN6IDxtYXRldXN6LmFsYmVja2lAaW50ZWwuY29tPgogIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmll
c2hldXZlbEBsaW5hcm8ub3JnPgogIEFzaGlzaCBTaW5naGFsIDxhc2hpc2hzaW5naGFAbnZpZGlh
LmNvbT4KICBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpo
aWp1eC5mYW5AaW50ZWwuY29tPgogIEphc29uIFZvZWx6IDxqYXNvbi52b2VsekBpbnRlbC5jb20+
CiAgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBNYXRldXN6IEFsYmVja2kgPG1h
dGV1c3ouYWxiZWNraUBpbnRlbC5jb20+CiAgUGF2YW5hLksgPHBhdmFuYS5rQGludGVsLmNvbT4K
ICBQaGlsaXBwZSBNYXRoaWV1LURhdWQ/IDxwaGlsbWRAcmVkaGF0LmNvbT4KICBQaGlsaXBwZSBN
YXRoaWV1LURhdWRlIDxwaGlsbWRAcmVkaGF0LmNvbT4KICBTaXl1YW4gRnUgPHNpeXVhbi5mdUBp
bnRlbC5jb20+CiAgU2l5dWFuLCBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBWaXRhbHkgQ2hl
cHRzb3YgPHZpdDk2OTZAcHJvdG9ubWFpbC5jb20+CiAgVml0YWx5IENoZXB0c292IHZpYSBHcm91
cHMuSW8gPHZpdDk2OTY9cHJvdG9ubWFpbC5jb21AZ3JvdXBzLmlvPgogIFpoaWp1LkZhbiA8emhp
anV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmly
dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1h
bWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogdGVzdC1hbWQ2NC1pMzg2LXhs
LXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dz
OiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmln
IGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywg
YW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtm
PVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCmJy
b2tlbi1qb2IgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0IGJyb2tlbgpicm9r
ZW4tc3RlcCB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgaG9zdC1pbnN0YWxs
KDQpCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDQyMiBsaW5l
cyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
