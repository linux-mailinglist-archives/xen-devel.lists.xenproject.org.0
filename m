Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B81219E1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 20:24:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igvv5-0008KI-80; Mon, 16 Dec 2019 19:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JO2Q=2G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1igvv4-0008JY-7W
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 19:20:38 +0000
X-Inumbo-ID: 198bb29a-2039-11ea-a914-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 198bb29a-2039-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 19:20:20 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1igvul-0005jG-Te; Mon, 16 Dec 2019 19:20:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1igvul-0002Tm-Iz; Mon, 16 Dec 2019 19:20:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1igvul-0004AG-IM; Mon, 16 Dec 2019 19:20:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144876-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-xsm:xen-build:fail:regression
 ovmf:build-amd64:xen-build:fail:regression
 ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:build-i386:xen-build:fail:regression
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=bfb141cf19dd6f9b8df8b9d0914a5b3b15e1a798
X-Osstest-Versions-That: ovmf=804666c86e7b6f04fe5c5cfdb13199c19e0e99b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Dec 2019 19:20:19 +0000
Subject: [Xen-devel] [ovmf test] 144876: regressions - FAIL
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

ZmxpZ2h0IDE0NDg3NiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQ4NzYvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgIDYgeGVu
LWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NDYzNwogYnVpbGQtYW1kNjQg
ICAgICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQ0NjM3CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAg
ICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDQ2MzcKIGJ1aWxkLWkzODYgICAgICAgICAgICAg
ICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NDYzNwoK
VGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIGJ1aWxk
LWFtZDY0LWxpYnZpcnQgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBi
bG9ja2VkICBuL2EKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1v
dm1mLWFtZDY0ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICBibG9ja2VkIG4vYQogdGVz
dC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAg
ICAgICAgIGJsb2NrZWQgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogb3ZtZiAg
ICAgICAgICAgICAgICAgYmZiMTQxY2YxOWRkNmY5YjhkZjhiOWQwOTE0YTViM2IxNWUxYTc5OApi
YXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgODA0NjY2Yzg2ZTdiNmYwNGZl
NWM1Y2ZkYjEzMTk5YzE5ZTBlOTliMAoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQ0NjM3ICAyMDE5
LTEyLTA5IDA5OjA5OjQ5IFogICAgNyBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDE0NDY0NiAg
MjAxOS0xMi0xMCAwMTozOTo1MyBaICAgIDYgZGF5cyAgIDU5IGF0dGVtcHRzClRlc3Rpbmcgc2Ft
ZSBzaW5jZSAgIDE0NDc3MCAgMjAxOS0xMi0xMiAxODo0MToyNiBaICAgIDQgZGF5cyAgIDQ4IGF0
dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFu
dG9pbmUgQ29ldXIgPGNvZXVyQGdteC5mcj4KICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2
ZWxAbGluYXJvLm9yZz4KICBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgSmlld2Vu
IFlhbyA8Smlld2VuLllhb0BpbnRlbC5jb20+CiAgTWljaGFlbCBLdWJhY2tpIDxtaWNoYWVsLmEu
a3ViYWNraUBpbnRlbC5jb20+CiAgUGV0ZSBCYXRhcmQgPHBldGVAYWtlby5pZT4KICBQaGlsaXBw
ZSBNYXRoaWV1LURhdWRlIDxwaGlsbWRAcmVkaGF0LmNvbT4KICBTdGV2ZW4gU2hpIDxzdGV2ZW4u
c2hpQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWkzODYteHNtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQt
YW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
aWwgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBidWlsZC1h
bWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVt
dXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ct
cmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9o
b21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmls
ZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQg
b2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBw
dXNoaW5nLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCmNvbW1pdCBiZmIxNDFjZjE5ZGQ2ZjliOGRmOGI5ZDA5MTRhNWIzYjE1ZTFh
Nzk4CkF1dGhvcjogUGV0ZSBCYXRhcmQgPHBldGVAYWtlby5pZT4KRGF0ZTogICBUdWUgRGVjIDEw
IDE4OjIzOjA0IDIwMTkgKzAwMDAKCiAgICBNZGVQa2cvSW5jbHVkZTogQWRkIERDQyBhbmQgQkNN
MjgzNSBTUENSIFVBUlQgdHlwZXMKICAgIAogICAgQXMgcGVyIHRoZSBNaWNyb3NvZnQgRGVidWcg
UG9ydCBUYWJsZSAyIChEQkcyKSBkb2N1bWVudGF0aW9uLCB0aGF0CiAgICBjYW4gYmUgZm91bmQg
b25saW5lLCB3ZSBhcmUgbWlzc2luZyAyIHNlcmlhbCBpbnRlcmZhY2UgdHlwZXMgZm9yCiAgICBB
cm0gRENDIGFuZCBCY20yODM1ICh0aGUgbGF0dGVyIGJlaW5nIHVzZWQgd2l0aCB0aGUgUmFzcGJl
cnJ5IFBpKS4KICAgIAogICAgVGhlc2Ugc2FtZSB0eXBlcyBhcmUgcHJlc2VudCBpbiBEZWJ1Z1Bv
cnQyVGFibGUuaCBzbyBhZGQgdGhlbSB0bwogICAgU2VyaWFsUG9ydENvbnNvbGVSZWRpcmVjdGlv
blRhYmxlLmggdG9vLgogICAgCiAgICBOb3RlIHRoYXQgd2UgZm9sbG93ZWQgdGhlIHNhbWUgaWRp
b3N5bmNyYXNpZXMgYXMgRGVidWdQb3J0MlRhYmxlCiAgICBmb3IgbmFtaW5nIHRoZXNlIG5ldyBt
YWNyb3MuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFBldGUgQmF0YXJkIDxwZXRlQGFrZW8uaWU+
CiAgICBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+
CiAgICBSZXZpZXdlZC1ieTogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Cgpjb21t
aXQgMmZlMjVhNzRkNmZlZTNjMmFjMGI5MzBmN2YzNTk2Y2I0MzJlNzY2ZQpBdXRob3I6IEFyZCBC
aWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgpEYXRlOiAgIFR1ZSBNYXIgNSAx
NDozMjo0OCAyMDE5ICswMTAwCgogICAgQXJtUGtnL01tQ29tbXVuaWNhdGlvbkR4ZTogcmVsYXkg
YXJjaGl0ZWN0ZWQgUEkgZXZlbnRzIHRvIE1NIGNvbnRleHQKICAgIAogICAgUEkgZGVmaW5lcyBh
IGZldyBhcmNoaXRlY3RlZCBldmVudHMgdGhhdCBoYXZlIHNpZ25pZmljYW5jZSBpbiB0aGUgTU0K
ICAgIGNvbnRleHQgYXMgd2VsbCBhcyBpbiB0aGUgbm9uLXNlY3VyZSBEWEUgY29udGV4dC4gU28g
cmVnaXN0ZXIgbm90aWZ5CiAgICBoYW5kbGVycyBmb3IgdGhlc2UgZXZlbnRzLCBhbmQgcmVsYXkg
dGhlbSBpbnRvIHRoZSBzdGFuZGFsb25lIE1NIHdvcmxkLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5
OiBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICAgIFJldmlld2Vk
LWJ5OiBKaWV3ZW4gWWFvIDxqaWV3ZW4ueWFvQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBB
Y2hpbiBHdXB0YSA8YWNoaW4uZ3VwdGFAYXJtLmNvbT4KCmNvbW1pdCBkM2FkZDExZTg3ZGFjZTE4
MDM4NzU2MmQ2ZjE5NTFmMmJmZmJkM2Q5CkF1dGhvcjogTWljaGFlbCBLdWJhY2tpIDxtaWNoYWVs
LmEua3ViYWNraUBpbnRlbC5jb20+CkRhdGU6ICAgV2VkIE5vdiAyMCAxNzozMToyNCAyMDE5IC0w
ODAwCgogICAgTWRlTW9kdWxlUGtnIFBlaUNvcmU6IEltcHJvdmUgY29tbWVudCBzZW1hbnRpY3MK
ICAgIAogICAgVGhpcyBwYXRjaCBjbGFyaWZpZXMgd29yZGluZyBpbiBzZXZlcmFsIFBlaUNvcmUg
Y29tbWVudHMgdG8gaW1wcm92ZQogICAgcmVhZGluZyBjb21wcmVoZW5zaW9uLgogICAgCiAgICBD
YzogRGFuZGFuIEJpIDxkYW5kYW4uYmlAaW50ZWwuY29tPgogICAgQ2M6IExpbWluZyBHYW8gPGxp
bWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IEppYW4gSiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRl
bC5jb20+CiAgICBDYzogSGFvIEEgV3UgPGhhby5hLnd1QGludGVsLmNvbT4KICAgIFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgS3ViYWNraSA8bWljaGFlbC5hLmt1YmFja2lAaW50ZWwuY29tPgogICAg
UmV2aWV3ZWQtYnk6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgUmV2aWV3
ZWQtYnk6IEppYW4gSiBXYW5nIDxqaWFuLmoud2FuZ0BpbnRlbC5jb20+Cgpjb21taXQgZDM5ZDEy
NjBjNjE1YjcxNjY3NWY2N2Y1YzRlMWY0ZjUyZGYwMWRhZApBdXRob3I6IE1pY2hhZWwgS3ViYWNr
aSA8bWljaGFlbC5hLmt1YmFja2lAaW50ZWwuY29tPgpEYXRlOiAgIFdlZCBOb3YgMjAgMTc6MTA6
NDggMjAxOSAtMDgwMAoKICAgIE1kZU1vZHVsZVBrZyBQZWlDb3JlOiBGaXggdHlwb3MKICAgIAog
ICAgQ2M6IERhbmRhbiBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4KICAgIENjOiBMaW1pbmcgR2Fv
IDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIENjOiBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdA
aW50ZWwuY29tPgogICAgQ2M6IEhhbyBBIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAgICBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWVsIEt1YmFja2kgPG1pY2hhZWwuYS5rdWJhY2tpQGludGVsLmNvbT4K
ICAgIFJldmlld2VkLWJ5OiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIFJl
dmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWRlIDxwaGlsbWRAcmVkaGF0LmNvbT4KICAg
IFJldmlld2VkLWJ5OiBKaWFuIEogV2FuZyA8amlhbi5qLndhbmdAaW50ZWwuY29tPgoKY29tbWl0
IDk3ZWVkZjVkZmJhZmZkZTMzMjEwZmQ4ODA2NjI0N2NmMGI3ZDMzMjUKQXV0aG9yOiBBbnRvaW5l
IENvZXVyIDxjb2V1ckBnbXguZnI+CkRhdGU6ICAgV2VkIERlYyA0IDEyOjE0OjUzIDIwMTkgKzA4
MDAKCiAgICBJbnRlbEZzcDJXcmFwcGVyUGtnOiBGaXggdmFyaW91cyB0eXBvcwogICAgCiAgICBG
aXggdmFyaW91cyB0eXBvcyBpbiBjb21tZW50cyBhbmQgZG9jdW1lbnRhdGlvbi4KICAgIAogICAg
Q2M6IENoYXNlbCBDaGl1IDxjaGFzZWwuY2hpdUBpbnRlbC5jb20+CiAgICBDYzogTmF0ZSBEZVNp
bW9uZSA8bmF0aGFuaWVsLmwuZGVzaW1vbmVAaW50ZWwuY29tPgogICAgQ2M6IFN0YXIgWmVuZyA8
c3Rhci56ZW5nQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWRlIDxwaGlsbWRAcmVkaGF0LmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZGUgPHBoaWxtZEByZWRoYXQuY29tPgogICAgUmV2aWV3ZWQtYnk6IE5hdGUgRGVTaW1v
bmUgPG5hdGhhbmllbC5sLmRlc2ltb25lQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBDaGFz
ZWwgQ2hpdSA8Y2hhc2VsLmNoaXVAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFN0YXIgWmVu
ZyA8c3Rhci56ZW5nQGludGVsLmNvbT4KCmNvbW1pdCA3ZTU1Y2Y2YjQ4ZGNkNDNkZTQ2ZDAwOGIy
ZjEyY2FhYWQyNTU0NTAzCkF1dGhvcjogSmlld2VuIFlhbyA8amlld2VuLnlhb0BpbnRlbC5jb20+
CkRhdGU6ICAgU2F0IERlYyA3IDIxOjQxOjEwIDIwMTkgKzA4MDAKCiAgICBTZWN1cml0eVBrZy9U
Y2cyU21tOiBNZWFzdXJlIHRoZSB0YWJsZSBiZWZvcmUgcGF0Y2guCiAgICAKICAgIFJFRjogaHR0
cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTQwCiAgICAKICAg
IEFjY29yZGluZyB0byBUQ0cgUEZQIHNwZWNpZmljYXRpb246IHRoZSBBQ1BJIHRhYmxlIG11c3Qg
YmUKICAgIG1lYXN1cmVkIHByaW9yIHRvIGFueSBtb2RpZmljYXRpb24sIGFuZCB0aGUgbWVhc3Vy
ZW1lbnQKICAgIG11c3QgYmUgc2FtZSBjcm9zcyBldmVyeSBib290IGN5Y2xlLgogICAgCiAgICBU
aGVyZSBpcyBhIGZpeCAzYTYzYzE3ZWJjODUzY2JiMjdkMTkwNzI5ZDAxZTI3ZjY4ZTY1Yjk0CiAg
ICBmb3IgdGhlIEhJRCBkYXRhLiBIb3dldmVyIHRoYXQgaXMgbm90IGVub3VnaC4KICAgIFRoZSBM
QU1ML0xBU0EgYW5kIFBDRCBjb25maWd1cmF0aW9uIGNoYW5nZSBtYXkgYWxzbyBjYXVzZQogICAg
c2ltaWxhciBwcm9ibGVtLgogICAgCiAgICBXZSBuZWVkIG1lYXN1cmUgdGhlIHRhYmxlIGJlZm9y
ZSBhbnkgdXBkYXRlLgogICAgCiAgICBDYzogSmlhbiBKIFdhbmcgPGppYW4uai53YW5nQGludGVs
LmNvbT4KICAgIENjOiBDaGFvIFpoYW5nIDxjaGFvLmIuemhhbmdAaW50ZWwuY29tPgogICAgU2ln
bmVkLW9mZi1ieTogSmlld2VuIFlhbyA8Smlld2VuLllhb0BpbnRlbC5jb20+CiAgICBSZXZpZXdl
ZC1ieTogQ2hhbyBaaGFuZyA8Y2hhby5iLnpoYW5nQGludGVsLmNvbT4KCmNvbW1pdCBhODAwMzJk
YzQ0YTEwNzFhMzRmNDQxNWE3YzVjZWY1MTcwZWU2MTU5CkF1dGhvcjogU3RldmVuIFNoaSA8c3Rl
dmVuLnNoaUBpbnRlbC5jb20+CkRhdGU6ICAgVHVlIE5vdiAxOSAxNjoyMjowOCAyMDE5ICswODAw
CgogICAgQmFzZVRvb2xzOiBSZW1vdmUgcmVkdW5kYW50IGJpbmFyeSBjYWNoZSBmaWxlCiAgICAK
ICAgIFJlZGVzaWduIHRoZSBiaW5hcnkgY2FjaGUgYW5kIG5vdCBuZWVkIHRvIHNhdmUgdGhlCiAg
ICBjYWNoZSBpbnRlcm1lZGlhdGUgcmVzdWx0IGFuZCBzdGF0ZSBpbiBtZW1vcnkgYXMgYQogICAg
TW9kdWxlQnVpbGRDYWNoZUlSIGNsYXNzIGluc3RhbmNlLiBTbyByZW1vdmUgdGhlCiAgICBDYWNo
ZUlSLnB5IHdoaWNoIGRlZmluZSB0aGUgTW9kdWxlQnVpbGRDYWNoZUlSIGNsYXNzLgogICAgCiAg
ICBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KICAgIAog
ICAgQ2M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IEJvYiBGZW5n
IDxib2IuYy5mZW5nQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBCb2IgRmVuZyA8Ym9iLmMu
ZmVuZ0BpbnRlbC5jb20+Cgpjb21taXQgZmM4YjhkZWFjMmQ3NzUyNGZmOGNmZTQ0YWNmOTViNWUx
ZjU5ODA0ZQpBdXRob3I6IFN0ZXZlbiBTaGkgPHN0ZXZlbi5zaGlAaW50ZWwuY29tPgpEYXRlOiAg
IFR1ZSBOb3YgMTkgMTY6MTc6MDAgMjAxOSArMDgwMAoKICAgIEJhc2VUb29sczogTGV2ZXJhZ2Ug
Y29tcGlsZXIgb3V0cHV0IHRvIG9wdGltaXplIGJpbmFyeSBjYWNoZQogICAgCiAgICBSZWRlc2ln
biB0aGUgYmluYXJ5IGNhY2hlIGFuZCBiYXNlcyBvbiB0aGUgY29tcGlsZXIgdG8KICAgIG91dHB1
dCB0aGUgZGVwZW5kZW5jeSBoZWFkZXIgZmlsZXMgaW5mbyBmb3IgZXZlcnkgbW9kdWxlLgogICAg
VGhlIGJpbmFyeSBjYWNoZSB3aWxsIGRpcmVjdGx5IGNvbnN1bWUgdGhlIGRlcGVuZGVuY3kgaGVh
ZGVyCiAgICBmaWxlcyBpbmZvIGFuZCBkb2Vzbid0IHBhcnNlIHRoZSBDIHNvdXJjZSBjb2RlIGJ5
IGl0ZXNlbGYuCiAgICBBbHNvIHJlZGVzaWduIHRoZSBkZXBlbmRlbmN5IGZpbGVzIGxpc3QgZm9y
bWF0IGZvciBtb2R1bGUKICAgIGFuZCB0cnkgdG8gc2hhcmUgdGhlIGNvbW1vbiBsaWIgaGFzaCBy
ZXN1bHQgYXMgbW9yZSBhcwogICAgcG9zc2libGUgaW4gbG9jYWwgcHJvY2Vzcy4gUmVtb3ZlIHRo
ZSB1bm5lY2Vzc2FyeSBzaGFyZSBkYXRhCiAgICBhY2Nlc3MgYWNyb3NzIG11bHRpcHJvY2Vzc2lu
Zy4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5j
b20+CiAgICAKICAgIENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIENj
OiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogQm9iIEZl
bmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgoKY29tbWl0IDNiZmJjOTE1MDc0YTQ1ZjRkOWM2MWFh
MmI2OThhNjJmMWEyNDEyNGUKQXV0aG9yOiBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGludGVsLmNv
bT4KRGF0ZTogICBNb24gT2N0IDIxIDE0OjUxOjQ5IDIwMTkgKzA4MDAKCiAgICBCYXNlVG9vbHM6
IGVuaGFuY2UgdGhlIENhY2hlQ29weUZpbGUgbWV0aG9kIGFyZyBuYW1lcwogICAgCiAgICBFbmhh
bmNlIHRoZSBDYWNoZUNvcHlGaWxlIG1ldGhvZCBhcmcgbmFtZXMgdG8gYmUgbW9yZQogICAgY2xl
YXIgYW5kIHJlYWRhYmxlCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBTaGkgPHN0ZXZl
bi5zaGlAaW50ZWwuY29tPgogICAgCiAgICBDYzogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRl
bC5jb20+CiAgICBDYzogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgogICAgUmV2aWV3
ZWQtYnk6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KCmNvbW1pdCA5MWY2YzUzM2Y4
ZTljNDlmZmQwOThlOTE2NzcyNDU5NmVjZmQ3NDEwCkF1dGhvcjogU3RldmVuIFNoaSA8c3RldmVu
LnNoaUBpbnRlbC5jb20+CkRhdGU6ICAgTW9uIE9jdCAyMSAxNDoyNDo1NyAyMDE5ICswODAwCgog
ICAgQmFzZVRvb2xzOiBzdG9yZSBtb3JlIGNvbXBsZXRlIG91dHB1dCBmaWxlcyBpbiBiaW5hcnkg
Y2FjaGUKICAgIAogICAgQmluYXJ5IGNhY2hlIHVzZSB0aGUgT3V0cHV0RmlsZSBtZXRob2QgdG8g
cmV0dXJuIHRoZSBtb2R1bGUKICAgIGJ1aWx0IG91dHB1dCBmaWxlcyBuZWVkZWQgdG8gc3RvcmUg
aW4gY2FjaGUsIGJ1dCBjdXJyZW50CiAgICBPdXRwdXRGaWxlIGltcGxlbWVudGF0aW9uIGRvZXNu
J3QgcmV0dXJuIGNvbXBsZXRlIG91dHB1dCBmaWxlcy4KICAgIEVuaGFuY2UgdGhlIE91dHB1dEZp
bGUgbWV0aG9kIHRvIHJldHVybiBtb3JlIGNvbXBsZXRlIG91dHB1dCBmaWxlcy4KICAgIAogICAg
U2lnbmVkLW9mZi1ieTogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+CiAgICAKICAg
IENjOiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KICAgIENjOiBCb2IgRmVuZyA8
Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogQm9iIEZlbmcgPGJvYi5jLmZl
bmdAaW50ZWwuY29tPgoKY29tbWl0IDBjM2U4ZTk5NDdhNmMxM2I0MzI3ZGQxMWIyMGFjYjk1NDQx
NzAxY2YKQXV0aG9yOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CkRhdGU6ICAgV2Vk
IE5vdiAyMCAxMDo1ODozMCAyMDE5ICswODAwCgogICAgQmFzZVRvb2xzOiBFbmhhbmNlIEJhc2V0
b29sIGZvciBpbmNyZW1lbnRhbCBidWlsZAogICAgCiAgICBCWjogaHR0cHM6Ly9idWd6aWxsYS50
aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yMzExCiAgICAKICAgIEluY2x1ZGUgZGVwZW5k
ZW5jeSBmaWxlIGluIE1ha2VmaWxlIHRvIGVuaGFuY2UKICAgIGluY3JlbWVudGFsIGJ1aWxkCiAg
ICAKICAgIFNpZ25lZC1vZmYtYnk6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KICAg
IAogICAgQ2M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IFN0ZXZl
biBTaGkgPHN0ZXZlbi5zaGlAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IExpbWluZyBHYW8g
PGxpbWluZy5nYW9AaW50ZWwuY29tPgoKY29tbWl0IGNiMjc3ODE1ZDVlYTkyNzE4ZWVkMmQzMzQ2
NDE0NTFjZTY1YjBmZjUKQXV0aG9yOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CkRh
dGU6ICAgTW9uIERlYyAyIDE2OjI1OjMyIDIwMTkgKzA4MDAKCiAgICBCYXNlVG9vbHM6IFVwZGF0
ZSBidWlsZF9ydWxlLnR4dCB0byBnZW5lcmF0ZSBkZXBlbmRlbnQgZmlsZXMuCiAgICAKICAgIEJa
OiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTIzMTEKICAg
IAogICAgRW5hYmxlIHRoZSBkZXBlbmRlbnQgZmlsZXMgZ2VuZXJhdGlvbiBmdW5jdGlvbiBmb3Ig
Y29tcGlsZXJzCiAgICBhbmQgVHJpbSB0b29sLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBCb2Ig
RmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgICAKICAgIENjOiBMaW1pbmcgR2FvIDxsaW1p
bmcuZ2FvQGludGVsLmNvbT4KICAgIENjOiBTdGV2ZW4gU2hpIDxzdGV2ZW4uc2hpQGludGVsLmNv
bT4KICAgIFJldmlld2VkLWJ5OiBMaW1pbmcgR2FvIDxsaW1pbmcuZ2FvQGludGVsLmNvbT4KCmNv
bW1pdCBlNmVkYmUzMTVmYzNmYmQwMjc4M2NiNGZhYTkyODRmOGQwNWM0MTBkCkF1dGhvcjogQm9i
IEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgpEYXRlOiAgIFdlZCBOb3YgMjAgMTA6NTg6Mjgg
MjAxOSArMDgwMAoKICAgIEJhc2VUb29sczogR2VuZXJhdGUgZGVwZW5kZW50IGZpbGVzIGZvciBB
U0wgYW5kIEFTTSBmaWxlcwogICAgCiAgICBCWjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUu
b3JnL3Nob3dfYnVnLmNnaT9pZD0yMzExCiAgICAKICAgIEltcGxlbWVudCB0aGUgZnVuY3Rpb24g
aW4gVHJpbSB0b29sIHRvIGdldCB0aGUgaW5jbHVkZWQKICAgIGZpbGUgbGlzdCBmb3IgQVNMIGFu
ZCBBU00gZmlsZS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogQm9iIEZlbmcgPGJvYi5jLmZlbmdA
aW50ZWwuY29tPgogICAgCiAgICBDYzogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+
CiAgICBDYzogU3RldmVuIFNoaSA8c3RldmVuLnNoaUBpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1i
eTogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Cgpjb21taXQgMTNjNWUzNGExYjhi
ZmVkYmQxMGVhMDM4Y2ZjYmFlNWNhZWFiNjY1MgpBdXRob3I6IEJvYiBGZW5nIDxib2IuYy5mZW5n
QGludGVsLmNvbT4KRGF0ZTogICBNb24gRGVjIDIgMTY6MjQ6MTkgMjAxOSArMDgwMAoKICAgIEJh
c2VUb29sczogQWRkIGJ1aWxkIG9wdGlvbiBmb3IgZGVwZW5kZW5jeSBmaWxlIGdlbmVyYXRpb24K
ICAgIAogICAgQlo6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MjMxMQogICAgCiAgICBBZGQgL3Nob3dJbmNsdWRlcyBmb3IgbXN2YyBhbmQgLU1NRCAtTUYg
JEAuZGVwcwogICAgZm9yIEdDQyBhbmQgQ0xBTkcKICAgIAogICAgUmVtb3ZlIC9NUCBmb3IgbXN2
YyBzaW5jZSAvTVAgZG9lcyBub3Qgd29yayB3aXRoCiAgICAvc2hvd0luY2x1ZGVzCiAgICAKICAg
IFNpZ25lZC1vZmYtYnk6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KICAgIAogICAg
Q2M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPgogICAgQ2M6IFN0ZXZlbiBTaGkg
PHN0ZXZlbi5zaGlAaW50ZWwuY29tPgogICAgQ2M6IE1pY2hhZWwgRCBLaW5uZXkgPG1pY2hhZWwu
ZC5raW5uZXlAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IExpbWluZyBHYW8gPGxpbWluZy5n
YW9AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
