Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856431352CD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 06:43:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipQY9-0000Bf-MN; Thu, 09 Jan 2020 05:40:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o844=26=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ipQY7-0008Qf-LL
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 05:40:03 +0000
X-Inumbo-ID: 782b7dbe-32a2-11ea-b960-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 782b7dbe-32a2-11ea-b960-12813bfff9fa;
 Thu, 09 Jan 2020 05:39:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ipQY0-0000Fm-NS; Thu, 09 Jan 2020 05:39:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ipQY0-0007jW-EU; Thu, 09 Jan 2020 05:39:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ipQY0-0005tg-Dn; Thu, 09 Jan 2020 05:39:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145831-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:heisenbug
X-Osstest-Versions-This: ovmf=972d88726410e21b1fff1a528854202c67e97ef1
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Jan 2020 05:39:56 +0000
Subject: [Xen-devel] [ovmf test] 145831: regressions - FAIL
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

ZmxpZ2h0IDE0NTgzMSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDU4MzEvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDU3NjcKClRlc3RzIHdoaWNo
IGFyZSBmYWlsaW5nIGludGVybWl0dGVudGx5IChub3QgYmxvY2tpbmcpOgogdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIHBhc3Mg
aW4gMTQ1ODI1Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAgICAg
ICAgICAgOTcyZDg4NzI2NDEwZTIxYjFmZmYxYTUyODg1NDIwMmM2N2U5N2VmMQpiYXNlbGluZSB2
ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJiOTBk
MzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4IDAw
OjM5OjA5IFogICAgMSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0wMS0w
OCAwMjo1MDoyMCBaICAgIDEgZGF5cyAgICA2IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAg
IDE0NTc5MCAgMjAyMC0wMS0wOCAwOToxMDozMCBaICAgIDAgZGF5cyAgICA1IGF0dGVtcHRzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFzaGlzaCBTaW5n
aGFsIDxhc2hpc2hzaW5naGFAbnZpZGlhLmNvbT4KICBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwu
Y29tPgogIFNpeXVhbiBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBTaXl1YW4sIEZ1IDxzaXl1
YW4uZnVAaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1k
NjQgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1x
ZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAoKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpz
Zy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczog
L2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBm
aWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFu
ZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1S
RUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0
dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90
IHB1c2hpbmcuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KY29tbWl0IDk3MmQ4ODcyNjQxMGUyMWIxZmZmMWE1Mjg4NTQyMDJjNjdl
OTdlZjEKQXV0aG9yOiBBc2hpc2ggU2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CkRh
dGU6ICAgVHVlIERlYyAyNCAxMDo1Nzo0NyAyMDE5ICswODAwCgogICAgTWRlTW9kdWxlUGtnOiBB
ZGQgRURLMiBQbGF0Zm9ybSBCb290IE1hbmFnZXIgUHJvdG9jb2wKICAgIAogICAgQWRkIGVkazIg
cGxhdGZvcm0gYm9vdCBtYW5hZ2VyIHByb3RvY29sIHdoaWNoIHdvdWxkIGhhdmUgcGxhdGZvcm0K
ICAgIHNwZWNpZmljIHJlZnJlc2hlcyB0byB0aGUgYXV0byBlbnVtZXJhdGVkIGFzIHdlbGwgYXMg
TlYgYm9vdCBvcHRpb25zCiAgICBmb3IgdGhlIHBsYXRmb3JtLgogICAgCiAgICBTaWduZWQtb2Zm
LWJ5OiBBc2hpc2ggU2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CiAgICBSZXZpZXdl
ZC1ieTogUmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgoKY29tbWl0IGM5ZDcyNjI4NDMyMTI2Y2Jj
ZTU4YTQ4YjQ0MGU0OTQ0YmFhNGJlYWIKQXV0aG9yOiBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwu
Y29tPgpEYXRlOiAgIFRodSBKYW4gMiAyMDozMDoyNyAyMDIwICswMDAwCgogICAgQ3J5cHRvUGtn
OiBTdXBwb3J0IGZvciBTSEEzODQgJiBTSEE1MTIgUlNBIHNpZ25pbmcgc2NoZW1lcwogICAgCiAg
ICBCWjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yMzg5
CiAgICAKICAgIEN1cnJlbnRseSBSU0Egc2lnbmluZyBzY2hlbWUgc3VwcG9ydCBpcyBhdmFpbGFi
bGUgZm9yIE1ENSwgU0hBLTEgb3IKICAgIFNIQS0yNTYgYWxnb3JpdGhtcy5UaGUgZml4IGlzIHRv
IGV4dGVuZCB0aGlzIHN1cHBvcnQgZm9yIFNIQTM4NCBhbmQKICAgIFNIQTUxMi4KICAgIAogICAg
Q2M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IEppYW4gSiBXYW5n
IDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+CiAgICBDYzogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50
ZWwuY29tPgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwu
Y29tPgogICAgUmV2aWV3ZWQtYnk6IEppYW4gSiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+
Cgpjb21taXQgMzk2ZTc5MTA1OWYzNzA2MmNiZWU4NTY5NmUyYjQxODZlYzcyYTllMwpBdXRob3I6
IFNpeXVhbiwgRnUgPHNpeXVhbi5mdUBpbnRlbC5jb20+CkRhdGU6ICAgRnJpIEphbiAzIDE0OjU5
OjI3IDIwMjAgKzA4MDAKCiAgICBVZWZpQ3B1UGtnOiBBbHdheXMgbG9hZCBtaWNyb2NvZGUgcGF0
Y2ggb24gQVAgcHJvY2Vzc29yLgogICAgCiAgICBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIG1pY3Jv
Y29kZSBsb2FkZXIgdG8gYWx3YXlzIHBlcmZvcm0gYSBtaWNyb2NvZGUKICAgIGRldGVjdCBhbmQg
bG9hZCBvbiBib3RoIEJTUCBhbmQgQVAgcHJvY2Vzc29yLiBUaGlzIGlzIHRvIGZpeCBhIHBvdGVu
dGlhbAogICAgbWljcm9jb2RlIHJldmlzaW9uIG1pc21hdGNoIGlzc3VlIGluIGJlbG93IHNpdHVh
dGlvbjoKICAgIDEuIEFzc3VtZSB0aGVyZSBhcmUgdHdvIG1pY3JvY29kZSBjby1leGlzdHMgaW4g
Zmxhc2g6IG9uZSBwcm9kdWN0aW9uCiAgICAgICB2ZXJzaW9uIGFuZCBvbmUgZGVidWcgdmVyc2lv
biBtaWNyb2NvZGUuCiAgICAyLiBGSVQgbG9hZHMgcHJvZHVjdGlvbiBtaWNyb2NvZGUgdG8gQlNQ
IGFuZCBhbGwgQVAuCiAgICAzLiBVZWZpQ3B1UGtnIGxvYWRlciBsb2FkcyBkZWJ1ZyBtaWNyb2Nv
ZGUgdG8gQlNQLCBhbmQgc2tpcCB0aGUgbG9hZGluZwogICAgICAgb24gQVAuCiAgICBBcyBhIHJl
c3VsdCwgZGlmZmVyZW50IG1pY3JvY29kZSBwYXRjaGVzIGFyZSBsb2FkZWQgdG8gQlNQIGFuZCBB
UCwgYW5kCiAgICB0cmlnZ2VyIG1pY3JvY29kZSBtaXNtYXRjaCBlcnJvciBkdXJpbmcgT1MgYm9v
dC4KICAgIAogICAgQlogbGluazogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3df
YnVnLmNnaT9pZD0yNDMxCiAgICAKICAgIENjOiBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5j
b20+CiAgICBDYzogUmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgogICAgU2lnbmVkLW9mZi1ieTog
U2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEVyaWMgRG9u
ZyA8ZXJpYy5kb25nQGludGVsLmNvbT4KCmNvbW1pdCAwOGE0NzVkZjEwYjc1Zjg0Y2RlYjliMTFl
MzhmOGVlZTliNWMwNDhkCkF1dGhvcjogU2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgpE
YXRlOiAgIEZyaSBKYW4gMyAxNToxMTo1MSAyMDIwICswODAwCgogICAgVWVmaUNwdVBrZzogUmVt
b3ZlIGFsaWdubWVudCBjaGVjayB3aGVuIGNhbGN1bGF0ZSBtaWNyb2NvZGUgc2l6ZS4KICAgIAog
ICAgVGhpcyBwYXRjaCByZW1vdmVzIHRoZSB1bm5lY2Vzc2FyeSBhbGlnbm1lbnQgY2hlY2sgb24g
bWljcm9jb2RlIHBhdGNoCiAgICBUb3RhbFNpemUgaW50cm9kdWNlZCBieSBjb21taXQgZDc4NmEx
NzIuIFRoZSBUb3RhbFNpemUgaGFzIGFscmVhZHkgYmVlbgogICAgY2hlY2tlZCB3aXRoIDFLIGFs
aWdubWVudCBhbmQgTUFYX0FERFJFU1MgaW4gcHJldmlvdXMgY29kZSBhcyBiZWxvdzoKICAgIAog
ICAgICAgIGlmICggKFVJTlROKU1pY3JvY29kZUVudHJ5UG9pbnQgPiAoTUFYX0FERFJFU1MgLSBU
b3RhbFNpemUpIHx8CiAgICAgICAgICAgICAoKFVJTlROKU1pY3JvY29kZUVudHJ5UG9pbnQgKyBU
b3RhbFNpemUpID4gTWljcm9jb2RlRW5kIHx8CiAgICAgICAgICAgICAoRGF0YVNpemUgJiAweDMp
ICE9IDAgfHwKICAgICAgICAgICAgIChUb3RhbFNpemUgJiAoU0laRV8xS0IgLSAxKSkgIT0gMCB8
fAogICAgICAgICAgICAgVG90YWxTaXplIDwgRGF0YVNpemUKICAgICAgICAgICApIHsKICAgIAog
ICAgQ2M6IEVyaWMgRG9uZyA8ZXJpYy5kb25nQGludGVsLmNvbT4KICAgIENjOiBSYXkgTmkgPHJh
eS5uaUBpbnRlbC5jb20+CiAgICBDYzogSGFvIEEgV3UgPGhhby5hLnd1QGludGVsLmNvbT4KICAg
IFNpZ25lZC1vZmYtYnk6IFNpeXVhbiBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICAgIFJldmll
d2VkLWJ5OiBSYXkgTmkgPHJheS5uaUBpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogRXJpYyBE
b25nIDxlcmljLmRvbmdAaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
