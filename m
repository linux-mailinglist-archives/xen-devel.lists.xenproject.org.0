Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02DADFEA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 22:22:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Q9E-0005xO-3K; Mon, 09 Sep 2019 20:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1apQ=XE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i7Q9C-0005xJ-ON
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 20:20:26 +0000
X-Inumbo-ID: 4096b598-d33f-11e9-ac15-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4096b598-d33f-11e9-ac15-12813bfff9fa;
 Mon, 09 Sep 2019 20:20:23 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Q98-0006mt-R6; Mon, 09 Sep 2019 20:20:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Q98-00016R-7Z; Mon, 09 Sep 2019 20:20:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Q98-0007y2-6z; Mon, 09 Sep 2019 20:20:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141164-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-pvops:<job status>:broken:regression
 ovmf:build-amd64:<job status>:broken:regression
 ovmf:build-i386-xsm:<job status>:broken:regression
 ovmf:build-amd64-pvops:<job status>:broken:regression
 ovmf:build-i386:<job status>:broken:regression
 ovmf:build-amd64-xsm:<job status>:broken:regression
 ovmf:build-i386:host-install(4):broken:regression
 ovmf:build-amd64-xsm:host-install(4):broken:regression
 ovmf:build-amd64-pvops:host-install(4):broken:regression
 ovmf:build-amd64:host-install(4):broken:regression
 ovmf:build-i386-xsm:host-install(4):broken:regression
 ovmf:build-i386-pvops:host-install(4):broken:regression
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=d6f5a5050b942cc0ec08bdc39900b8231957e18c
X-Osstest-Versions-That: ovmf=59b754c9f697d9627b0ccccd327d5132f0e1abb0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2019 20:20:22 +0000
Subject: [Xen-devel] [ovmf test] 141164: trouble: blocked/broken
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

ZmxpZ2h0IDE0MTE2NCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDExNjQvCgpGYWlsdXJlcyBhbmQgcHJvYmxlbXMgd2l0
aCB0ZXN0cyA6LSgKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LAppbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtcHZv
cHMgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1
aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAg
ICBicm9rZW4KIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAg
ICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgPGpv
YiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWkzODYgICAgICAgICAgICAg
ICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0
LXhzbSAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4K
IGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICBi
cm9rZW4gUkVHUi4gdnMuIDE0MTA5MQogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgNCBo
b3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDkxCiBidWlsZC1hbWQ2
NC1wdm9wcyAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgYnJva2VuIFJFR1Iu
IHZzLiAxNDEwOTEKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxs
KDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMuIDE0MTA5MQogYnVpbGQtaTM4Ni14c20gICAgICAg
ICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDkx
CiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAg
YnJva2VuIFJFR1IuIHZzLiAxNDEwOTEKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0
IGFyZSBub3QgYmxvY2tpbmc6CiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LXhs
LXFlbXV1LW92bWYtYW1kNjQgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgYmxvY2tlZCBu
L2EKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAg
ICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICBibG9ja2VkIG4vYQoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIGQ2ZjVhNTA1MGI5NDJjYzBl
YzA4YmRjMzk5MDBiODIzMTk1N2UxOGMKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIDU5Yjc1NGM5ZjY5N2Q5NjI3YjBjY2NjZDMyN2Q1MTMyZjBlMWFiYjAKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDE0MTA5MSAgMjAxOS0wOS0wNiAxMzozOToyOCBaICAgIDMgZGF5cwpUZXN0
aW5nIHNhbWUgc2luY2UgICAxNDExNTggIDIwMTktMDktMDkgMDM6Mzg6NTcgWiAgICAwIGRheXMg
ICAgMiBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVz
dDoKICBGYW4sIFpoaWp1WCA8emhpanV4LmZhbkBpbnRlbC5jb20+CiAgWmhpanUuRmFuIDx6aGlq
dXguZmFuQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWkzODYteHNtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVp
bGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyb2tlbiAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogYnVpbGQtaTM4Ni1saWJ2aXJ0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBidWls
ZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YnJva2VuICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicm9rZW4gIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFt
ZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYteGwt
cWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
c2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6
IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcg
ZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVu
cHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBh
bmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3Rlcgog
ICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9
UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKYnJv
a2VuLWpvYiBidWlsZC1pMzg2LXB2b3BzIGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWFtZDY0IGJy
b2tlbgpicm9rZW4tam9iIGJ1aWxkLWkzODYteHNtIGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWFt
ZDY0LXB2b3BzIGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWkzODYgYnJva2VuCmJyb2tlbi1qb2Ig
YnVpbGQtYW1kNjQteHNtIGJyb2tlbgpicm9rZW4tc3RlcCBidWlsZC1pMzg2IGhvc3QtaW5zdGFs
bCg0KQpicm9rZW4tc3RlcCBidWlsZC1hbWQ2NC14c20gaG9zdC1pbnN0YWxsKDQpCmJyb2tlbi1z
dGVwIGJ1aWxkLWFtZDY0LXB2b3BzIGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWlsZC1h
bWQ2NCBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtaTM4Ni14c20gaG9zdC1pbnN0
YWxsKDQpCmJyb2tlbi1zdGVwIGJ1aWxkLWkzODYtcHZvcHMgaG9zdC1pbnN0YWxsKDQpCgpOb3Qg
cHVzaGluZy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpjb21taXQgZDZmNWE1MDUwYjk0MmNjMGVjMDhiZGMzOTkwMGI4MjMxOTU3
ZTE4YwpBdXRob3I6IEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVsLmNvbT4KRGF0ZTogICBX
ZWQgU2VwIDQgMTc6NTQ6MTIgMjAxOSArMDgwMAoKICAgIEJhc2VUb29sczpFQ0MgbmVlZCB0byBo
YW5kbGUgbG93ZXIgY2FzZSAnc3RhdGljJwogICAgCiAgICBCWjpodHRwczovL2J1Z3ppbGxhLnRp
YW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE3NzgKICAgIAogICAgV2UgYXJlIGdvaW5nIHRv
IGFkZCBrZXl3b3JkIChsb3dlciBjYXNlKSAnc3RhdGljJyBmb3IgZnVuY3Rpb25zIGFuZCBnbG9i
YWwKICAgIHZhcmlhYmxlcyB3aGljaCBhcmUgbm90IHJlZmVyZW5jZWQgb3V0c2lkZSB0aGVpciBj
dXJyZW50IEMgZmlsZS4KICAgIAogICAgSG93ZXZlciwgdGhlIEVDQyB0b29sIG9ubHkgcmVjb2du
aXplcyB1cHBlciBjYXNlICdTVEFUSUMnIGF0IHRoaXMgbW9tZW50LgogICAgVGhpcyB3aWxsIGxl
YWQgdG8gaXNzdWUgcmVwb3J0cyBmb3IgbmV3IGNvZGVzIHRoYXQgZm9sbG93IHRoZSBhYm92ZSBj
b2RpbmcKICAgIHN0eWxlLgogICAgCiAgICBUaGlzIHBhdGNoIGlzIGdvaW5nIHRvIGhhbmRsZSBs
b3dlciBjYXNlICdzdGF0aWMnCiAgICAKICAgIENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGlu
dGVsLmNvbT4KICAgIENjOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICBTaWdu
ZWQtb2ZmLWJ5OiBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgogICAgUmV2aWV3ZWQt
Ynk6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KCmNvbW1pdCAwM2FkM2Q4ODljNjQ5
NzhjMzFhOGNjZDcwZjE4NjI1NThiZGIwYTJkCkF1dGhvcjogRmFuLCBaaGlqdVggPHpoaWp1eC5m
YW5AaW50ZWwuY29tPgpEYXRlOiAgIEZyaSBTZXAgNiAxMToyOTo1NCAyMDE5ICswODAwCgogICAg
QmFzZVRvb2xzOkVjYyBoYW5kbGUgYW5vdGhlciBjb3B5cmlnaHQgZm9ybWF0CiAgICAKICAgIEJa
Omh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA1NwogICAg
CiAgICBFY2MgY2FuIG5vdCBoYW5kbGUgdGhlIGNvcHlyaWdodCBmb3JtYXQgbGlrZQogICAgCiAg
ICAoQykgQ29weXJpZ2h0IDIwMTUtMjAxNiBIZXdsZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBEZXZl
bG9wbWVudCBMUDxCUj4KICAgIAogICAgVGhpcyB3aWxsIGNhdXNlIEVjYyB0byByZXBvcnQgd3Jv
bmcgaW5mb3JtYXRpb24uCiAgICAKICAgIFRoaXMgcGF0Y2ggaXMgZ29pbmcgdG8gaGFuZGxlIHRo
aXMgZm9ybWF0CiAgICAKICAgIENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4K
ICAgIENjOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5
OiBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEJvYiBG
ZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
