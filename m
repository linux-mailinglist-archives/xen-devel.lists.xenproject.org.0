Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C842B136674
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 06:14:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipmYt-0001kg-BV; Fri, 10 Jan 2020 05:10:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xwMR=27=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ipmYs-0001kb-GL
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 05:10:18 +0000
X-Inumbo-ID: 7aa90992-3367-11ea-bd62-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aa90992-3367-11ea-bd62-12813bfff9fa;
 Fri, 10 Jan 2020 05:10:12 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ipmYl-0006Al-Hx; Fri, 10 Jan 2020 05:10:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ipmYl-0000DQ-7O; Fri, 10 Jan 2020 05:10:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ipmYl-0003ry-6X; Fri, 10 Jan 2020 05:10:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145902-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This: ovmf=e18792566c7fb1335e705c3b19334db9271eac90
X-Osstest-Versions-That: ovmf=70911f1f4aee0366b6122f2b90d367ec0f066beb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jan 2020 05:10:11 +0000
Subject: [Xen-devel] [ovmf test] 145902: regressions - FAIL
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

ZmxpZ2h0IDE0NTkwMiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDU5MDIvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQ1NzY3CiB0ZXN0LWFtZDY0
LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTQ1NzY3Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAgICAgICAg
ICAgICAgICAgZTE4NzkyNTY2YzdmYjEzMzVlNzA1YzNiMTkzMzRkYjkyNzFlYWM5MApiYXNlbGlu
ZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgNzA5MTFmMWY0YWVlMDM2NmI2MTIyZjJi
OTBkMzY3ZWMwZjA2NmJlYgoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ1NzY3ICAyMDIwLTAxLTA4
IDAwOjM5OjA5IFogICAgMiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NTc3NCAgMjAyMC0w
MS0wOCAwMjo1MDoyMCBaICAgIDIgZGF5cyAgIDExIGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0NTkwMiAgMjAyMC0wMS0xMCAwMjo1Mjo1MCBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFyZCBCaWVz
aGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIEFzaGlzaCBTaW5naGFsIDxhc2hp
c2hzaW5naGFAbnZpZGlhLmNvbT4KICBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAg
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBQYXZhbmEuSyA8cGF2YW5hLmtAaW50
ZWwuY29tPgogIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZD8gPHBoaWxtZEByZWRoYXQuY29tPgogIFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29tPgogIFNpeXVhbiBGdSA8c2l5
dWFuLmZ1QGludGVsLmNvbT4KICBTaXl1YW4sIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgoKam9i
czoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1w
dm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAg
ICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9z
c3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdl
czogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxh
YmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xv
Z3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVy
YWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0Lmdp
dDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0
IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KY29tbWl0
IGUxODc5MjU2NmM3ZmIxMzM1ZTcwNWMzYjE5MzM0ZGI5MjcxZWFjOTAKQXV0aG9yOiBFcmljIERv
bmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CkRhdGU6ICAgVGh1IEphbiA5IDEzOjIxOjM2IDIwMjAg
KzA4MDAKCiAgICBVZWZpQ3B1UGtnL1BpU21tQ3B1RHhlU21tOiBBZGQgbWlzc2VkIGNvbW1lbnRz
IGZvciBwYXJhbWV0ZXIuCiAgICAKICAgIFRoaXMgaXNzdWUgY2F1c2VkIGJ5IGJlbG93IGNoYW5n
ZToKICAgICAgU0hBLTE6IGI5NDhhNDk2MTUwZjRhZTRmNjU2YzBmMGFiNjcyNjA4NzIzYzgwZTYK
ICAgICAgKiBVZWZpQ3B1UGtnL1BpU21tQ3B1RHhlU21tOiBQcmUtYWxsb2NhdGUgUFJPQ0VEVVJF
X1RPS0VOIGJ1ZmZlcgogICAgICBSRUY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MjM4OAogICAgCiAgICBSZXZpZXdlZC1ieTogUmF5IE5pIDxyYXkubmlA
aW50ZWwuY29tPgogICAgQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+
CiAgICBTaWduZWQtb2ZmLWJ5OiBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+Cgpjb21t
aXQgZjU1NDc3ZmUyZDYyNjg3YWUwYjkxZTNjNWU2OGRiMmMyMmNiYWY1YwpBdXRob3I6IEFyZCBC
aWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgpEYXRlOiAgIFdlZCBKYW4gOCAx
NTozODo0MyAyMDIwICswMTAwCgogICAgT3ZtZlBrZzogdXNlIEhJSSB0eXBlIFBDRHMgZm9yIFRQ
TTIgY29uZmlnIHJlbGF0ZWQgdmFyaWFibGVzCiAgICAKICAgIFRoZSBISUkgcGFnZXMgdGhhdCBh
cmUgcGFydCBvZiBUY2cyQ29uZmlnRHhlIGV4cGVjdCB0aGUgZm9sbG93aW5nIFBDRHMKICAgIHRv
IGJlIG9mIGR5bmFtaWMgSElJIHR5cGUsIHNvIGRlY2xhcmUgdGhlbSBhcyBzdWNoLgogICAgCiAg
ICAgIGdFZmlTZWN1cml0eVBrZ1Rva2VuU3BhY2VHdWlkLlBjZFRjZ1BoeXNpY2FsUHJlc2VuY2VJ
bnRlcmZhY2VWZXIKICAgICAgZ0VmaVNlY3VyaXR5UGtnVG9rZW5TcGFjZUd1aWQuUGNkVHBtMkFj
cGlUYWJsZVJldgogICAgCiAgICBDdXJyZW50bHksIHRoZSBUUE0yIEFDUEkgdGFibGUgaXMgbm90
IHByb2R1Y2VkLCBzaW5jZSB3ZSBkbyBub3QKICAgIGluY29ycG9yYXRlIHRoZSBUY2cyU21tIG1v
ZHVsZSwgd2hpY2ggaW1wbGVtZW50cyB0aGUgU01JIGJhc2VkCiAgICBwaHlzaWNhbCBwcmVzZW5j
ZSBpbnRlcmZhY2UgZXhwb3NlZCB0byB0aGUgT1MuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IEFy
ZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogICAgUmV2aWV3ZWQtYnk6
IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cgpjb21taXQgY2YzYWQ5NzJhMjEwNWZm
YTM3OTVkZGIxZDljMTQ5YzdmYzM2OWY5YgpBdXRob3I6IEFyZCBCaWVzaGV1dmVsIDxhcmQuYmll
c2hldXZlbEBsaW5hcm8ub3JnPgpEYXRlOiAgIFdlZCBKYW4gOCAxNTozODo0MiAyMDIwICswMTAw
CgogICAgT3ZtZlBrZzogcmVvcmdhbml6ZSBUUE0yIHN1cHBvcnQgaW4gRFNDL0ZERiBmaWxlcwog
ICAgCiAgICBQdXQgdGhlIFRQTTIgcmVsYXRlZCBEWEUgbW9kdWxlcyB0b2dldGhlciBpbiB0aGUg
RFNDLCBhbmQgYWRkIGEKICAgIFRQTTIgc3VwcG9ydCBoZWFkZXIgY29tbWVudCB3aGlsZSBhdCBp
dC4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVs
QGxpbmFyby5vcmc+CiAgICBSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0
LmNvbT4KCmNvbW1pdCAyNjQ5YTczNWIyNDllNTRhNGRkZDdiZDJiOGQ2MmJmZTc3ZThkNmRhCkF1
dGhvcjogUGhpbGlwcGUgTWF0aGlldS1EYXVkPyA8cGhpbG1kQHJlZGhhdC5jb20+CkRhdGU6ICAg
VGh1IEphbiAyIDIwOjE2OjU2IDIwMjAgKzA4MDAKCiAgICBCYXNlVG9vbHMvUGF0Y2hDaGVjay5w
eTogSWdub3JlIENSIGFuZCBMRiBjaGFyYWN0ZXJzIGluIHN1YmplY3QgbGVuZ3RoCiAgICAKICAg
IFJFRjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTMK
ICAgIAogICAgU3RyaXAgdGhlIHRyYWlsaW5nIGNoYXJhY3RlcnMgYmVmb3JlIGNoZWNraW5nIHRo
ZSBzdWJqZWN0IGxpbmUgaXMKICAgIGxlc3MgdGhhbiA3MiBjaGFyYWN0ZXJzLgogICAgCiAgICBG
aXhlczogZTYxNDA2NzA4YzgzZgogICAgQ2M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwu
Y29tPgogICAgQ2M6IEpvcmRhbiBKdXN0ZW4gPGpvcmRhbi5sLmp1c3RlbkBpbnRlbC5jb20+CiAg
ICBSZXZpZXdlZC1ieTogSm9yZGFuIEp1c3RlbiA8am9yZGFuLmwuanVzdGVuQGludGVsLmNvbT4K
ICAgIFJldmlld2VkLWJ5OiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICAKICAg
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29t
PgoKY29tbWl0IDk3MmQ4ODcyNjQxMGUyMWIxZmZmMWE1Mjg4NTQyMDJjNjdlOTdlZjEKQXV0aG9y
OiBBc2hpc2ggU2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CkRhdGU6ICAgVHVlIERl
YyAyNCAxMDo1Nzo0NyAyMDE5ICswODAwCgogICAgTWRlTW9kdWxlUGtnOiBBZGQgRURLMiBQbGF0
Zm9ybSBCb290IE1hbmFnZXIgUHJvdG9jb2wKICAgIAogICAgQWRkIGVkazIgcGxhdGZvcm0gYm9v
dCBtYW5hZ2VyIHByb3RvY29sIHdoaWNoIHdvdWxkIGhhdmUgcGxhdGZvcm0KICAgIHNwZWNpZmlj
IHJlZnJlc2hlcyB0byB0aGUgYXV0byBlbnVtZXJhdGVkIGFzIHdlbGwgYXMgTlYgYm9vdCBvcHRp
b25zCiAgICBmb3IgdGhlIHBsYXRmb3JtLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBBc2hpc2gg
U2luZ2hhbCA8YXNoaXNoc2luZ2hhQG52aWRpYS5jb20+CiAgICBSZXZpZXdlZC1ieTogUmF5IE5p
IDxyYXkubmlAaW50ZWwuY29tPgoKY29tbWl0IGM5ZDcyNjI4NDMyMTI2Y2JjZTU4YTQ4YjQ0MGU0
OTQ0YmFhNGJlYWIKQXV0aG9yOiBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwuY29tPgpEYXRlOiAg
IFRodSBKYW4gMiAyMDozMDoyNyAyMDIwICswMDAwCgogICAgQ3J5cHRvUGtnOiBTdXBwb3J0IGZv
ciBTSEEzODQgJiBTSEE1MTIgUlNBIHNpZ25pbmcgc2NoZW1lcwogICAgCiAgICBCWjogaHR0cHM6
Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yMzg5CiAgICAKICAgIEN1
cnJlbnRseSBSU0Egc2lnbmluZyBzY2hlbWUgc3VwcG9ydCBpcyBhdmFpbGFibGUgZm9yIE1ENSwg
U0hBLTEgb3IKICAgIFNIQS0yNTYgYWxnb3JpdGhtcy5UaGUgZml4IGlzIHRvIGV4dGVuZCB0aGlz
IHN1cHBvcnQgZm9yIFNIQTM4NCBhbmQKICAgIFNIQTUxMi4KICAgIAogICAgQ2M6IExpbWluZyBH
YW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IEppYW4gSiBXYW5nIDxqaWFuLmoud2Fu
Z0BpbnRlbC5jb20+CiAgICBDYzogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgogICAg
CiAgICBTaWduZWQtb2ZmLWJ5OiBQYXZhbmEuSyA8cGF2YW5hLmtAaW50ZWwuY29tPgogICAgUmV2
aWV3ZWQtYnk6IEppYW4gSiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+Cgpjb21taXQgMzk2
ZTc5MTA1OWYzNzA2MmNiZWU4NTY5NmUyYjQxODZlYzcyYTllMwpBdXRob3I6IFNpeXVhbiwgRnUg
PHNpeXVhbi5mdUBpbnRlbC5jb20+CkRhdGU6ICAgRnJpIEphbiAzIDE0OjU5OjI3IDIwMjAgKzA4
MDAKCiAgICBVZWZpQ3B1UGtnOiBBbHdheXMgbG9hZCBtaWNyb2NvZGUgcGF0Y2ggb24gQVAgcHJv
Y2Vzc29yLgogICAgCiAgICBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIG1pY3JvY29kZSBsb2FkZXIg
dG8gYWx3YXlzIHBlcmZvcm0gYSBtaWNyb2NvZGUKICAgIGRldGVjdCBhbmQgbG9hZCBvbiBib3Ro
IEJTUCBhbmQgQVAgcHJvY2Vzc29yLiBUaGlzIGlzIHRvIGZpeCBhIHBvdGVudGlhbAogICAgbWlj
cm9jb2RlIHJldmlzaW9uIG1pc21hdGNoIGlzc3VlIGluIGJlbG93IHNpdHVhdGlvbjoKICAgIDEu
IEFzc3VtZSB0aGVyZSBhcmUgdHdvIG1pY3JvY29kZSBjby1leGlzdHMgaW4gZmxhc2g6IG9uZSBw
cm9kdWN0aW9uCiAgICAgICB2ZXJzaW9uIGFuZCBvbmUgZGVidWcgdmVyc2lvbiBtaWNyb2NvZGUu
CiAgICAyLiBGSVQgbG9hZHMgcHJvZHVjdGlvbiBtaWNyb2NvZGUgdG8gQlNQIGFuZCBhbGwgQVAu
CiAgICAzLiBVZWZpQ3B1UGtnIGxvYWRlciBsb2FkcyBkZWJ1ZyBtaWNyb2NvZGUgdG8gQlNQLCBh
bmQgc2tpcCB0aGUgbG9hZGluZwogICAgICAgb24gQVAuCiAgICBBcyBhIHJlc3VsdCwgZGlmZmVy
ZW50IG1pY3JvY29kZSBwYXRjaGVzIGFyZSBsb2FkZWQgdG8gQlNQIGFuZCBBUCwgYW5kCiAgICB0
cmlnZ2VyIG1pY3JvY29kZSBtaXNtYXRjaCBlcnJvciBkdXJpbmcgT1MgYm9vdC4KICAgIAogICAg
QlogbGluazogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0y
NDMxCiAgICAKICAgIENjOiBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAgICBDYzog
UmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgogICAgU2lnbmVkLW9mZi1ieTogU2l5dWFuIEZ1IDxz
aXl1YW4uZnVAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEVyaWMgRG9uZyA8ZXJpYy5kb25n
QGludGVsLmNvbT4KCmNvbW1pdCAwOGE0NzVkZjEwYjc1Zjg0Y2RlYjliMTFlMzhmOGVlZTliNWMw
NDhkCkF1dGhvcjogU2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29tPgpEYXRlOiAgIEZyaSBK
YW4gMyAxNToxMTo1MSAyMDIwICswODAwCgogICAgVWVmaUNwdVBrZzogUmVtb3ZlIGFsaWdubWVu
dCBjaGVjayB3aGVuIGNhbGN1bGF0ZSBtaWNyb2NvZGUgc2l6ZS4KICAgIAogICAgVGhpcyBwYXRj
aCByZW1vdmVzIHRoZSB1bm5lY2Vzc2FyeSBhbGlnbm1lbnQgY2hlY2sgb24gbWljcm9jb2RlIHBh
dGNoCiAgICBUb3RhbFNpemUgaW50cm9kdWNlZCBieSBjb21taXQgZDc4NmExNzIuIFRoZSBUb3Rh
bFNpemUgaGFzIGFscmVhZHkgYmVlbgogICAgY2hlY2tlZCB3aXRoIDFLIGFsaWdubWVudCBhbmQg
TUFYX0FERFJFU1MgaW4gcHJldmlvdXMgY29kZSBhcyBiZWxvdzoKICAgIAogICAgICAgIGlmICgg
KFVJTlROKU1pY3JvY29kZUVudHJ5UG9pbnQgPiAoTUFYX0FERFJFU1MgLSBUb3RhbFNpemUpIHx8
CiAgICAgICAgICAgICAoKFVJTlROKU1pY3JvY29kZUVudHJ5UG9pbnQgKyBUb3RhbFNpemUpID4g
TWljcm9jb2RlRW5kIHx8CiAgICAgICAgICAgICAoRGF0YVNpemUgJiAweDMpICE9IDAgfHwKICAg
ICAgICAgICAgIChUb3RhbFNpemUgJiAoU0laRV8xS0IgLSAxKSkgIT0gMCB8fAogICAgICAgICAg
ICAgVG90YWxTaXplIDwgRGF0YVNpemUKICAgICAgICAgICApIHsKICAgIAogICAgQ2M6IEVyaWMg
RG9uZyA8ZXJpYy5kb25nQGludGVsLmNvbT4KICAgIENjOiBSYXkgTmkgPHJheS5uaUBpbnRlbC5j
b20+CiAgICBDYzogSGFvIEEgV3UgPGhhby5hLnd1QGludGVsLmNvbT4KICAgIFNpZ25lZC1vZmYt
Ynk6IFNpeXVhbiBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBSYXkg
TmkgPHJheS5uaUBpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogRXJpYyBEb25nIDxlcmljLmRv
bmdAaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
