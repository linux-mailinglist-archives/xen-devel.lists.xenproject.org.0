Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10ACB4788
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6zR-0002xx-6u; Tue, 17 Sep 2019 06:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CvKT=XM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iA6zP-0002xl-Cx
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:29:27 +0000
X-Inumbo-ID: 7dfc4db4-d914-11e9-978d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dfc4db4-d914-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 06:29:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iA6zM-0005qF-HI; Tue, 17 Sep 2019 06:29:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iA6zL-0006bX-Tv; Tue, 17 Sep 2019 06:29:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iA6zL-0008Sx-TE; Tue, 17 Sep 2019 06:29:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141383-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=9e1cfdf3ae7f2e920d2e5c7bbc1de78d27f6d259
X-Osstest-Versions-That: xen=1014f47c7a808e025b8920ab80bfe73a2888b3e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Sep 2019 06:29:23 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141383: regressions - FAIL
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

ZmxpZ2h0IDE0MTM4MyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTM4My8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hcm1oZi1hcm1oZi14bCAg
ICAgICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQxMjUz
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVz
dC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAg
IGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDEzIG1pZ3Jh
dGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJt
NjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2
ZXIgcGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAg
ICAgIDllMWNmZGYzYWU3ZjJlOTIwZDJlNWM3YmJjMWRlNzhkMjdmNmQyNTkKYmFzZWxpbmUgdmVy
c2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIDEwMTRmNDdjN2E4MDhlMDI1Yjg5MjBhYjgwYmZl
NzNhMjg4OGIzZTUKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MTI1MyAgMjAxOS0wOS0xMiAxNzow
MDo0MyBaICAgIDQgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxNDEyNTUgIDIwMTktMDktMTIg
MjE6MDE6MjIgWiAgICA0IGRheXMgICAzMCBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAx
NDEzNjkgIDIwMTktMDktMTYgMTM6MDE6MDAgWiAgICAwIGRheXMgICAgNSBhdHRlbXB0cwoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBDaGFvIEdhbyA8Y2hh
by5nYW9AaW50ZWwuY29tPgogIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KICBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogIFBhd2Vs
IFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KICBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYXJtNjQt
YXJtNjQteGwteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBv
c3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFn
ZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWls
YWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9s
b2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5l
cmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVz
dCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmNvbW1p
dCA5ZTFjZmRmM2FlN2YyZTkyMGQyZTVjN2JiYzFkZTc4ZDI3ZjZkMjU5CkF1dGhvcjogUGF3ZWwg
V2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpEYXRlOiAgIFdlZCBBdWcgMjEgMTA6
MDQ6MzAgMjAxOSArMDAwMAoKICAgIGxpdmVwYXRjaDogYWx3YXlzIHByaW50IFhFTkxPR19FUlIg
aW5mb3JtYXRpb24gKEFSTSwgRUxGKQogICAgCiAgICBUaGlzIGNvbXBsZW1lbnRzIFsxXSBjb21t
aXQgZm9yIEFSTSBhbmQgbGl2ZXBhdGNoX2VsZiBmaWxlcy4KICAgIAogICAgWzFdIDQ0NzBlZmVh
ZTQgbGl2ZXBhdGNoOiBhbHdheXMgcHJpbnQgWEVOTE9HX0VSUiBpbmZvcm1hdGlvbgogICAgCiAg
ICBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+
CiAgICBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICAgIFJl
dmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCmNv
bW1pdCBjZDkzOTUzNTM4YWFjNjAyNmE4MDEyZDE0YTYzYjMyMGVhZGQwYzk4CkF1dGhvcjogQ2hh
byBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KRGF0ZTogICBGcmkgU2VwIDEzIDEyOjMxOjM0IDIw
MTkgKzAyMDAKCiAgICBtaWNyb2NvZGU6IHBhc3MgYSBwYXRjaCBwb2ludGVyIHRvIGFwcGx5X21p
Y3JvY29kZSgpCiAgICAKICAgIGFwcGx5X21pY3JvY29kZSgpJ3MgYWx3YXlzIGxvYWRpbmcgdGhl
IGNhY2hlZCB1Y29kZSBwYXRjaCBmb3JjZXMKICAgIGEgcGF0Y2ggdG8gYmUgc3RvcmVkIGJlZm9y
ZSBiZWluZyBsb2FkZWQuIE1ha2UgYXBwbHlfbWljcm9jb2RlKCkKICAgIGFjY2VwdCBhIHBhdGNo
IHBvaW50ZXIgdG8gcmVtb3ZlIHRoZSBsaW1pdGF0aW9uIHNvIHRoYXQgYSBwYXRjaAogICAgY2Fu
IGJlIHN0b3JlZCBhZnRlciBhIHN1Y2Nlc3NmdWwgbG9hZGluZy4KICAgIAogICAgU2lnbmVkLW9m
Zi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpjb21taXQgODZmNjcwNmU0ZjRhYTg5OGJkNmZm
ZThmMTcxM2ZkMTc1Y2MyYzdjOQpBdXRob3I6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+
CkRhdGU6ICAgRnJpIFNlcCAxMyAxMjozMTowMSAyMDE5ICswMjAwCgogICAgbWljcm9jb2RlL2Ft
ZDogY2FsbCBzdm1faG9zdF9vc3Z3X2luaXQoKSBpbiBjb21tb24gY29kZQogICAgCiAgICBJbnRy
b2R1Y2UgYSB2ZW5kb3IgaG9vaywgLmVuZF91cGRhdGVfcGVyY3B1LCBmb3Igc3ZtX2hvc3Rfb3N2
d19pbml0KCkuCiAgICBUaGUgaG9vayBmdW5jdGlvbiBpcyBjYWxsZWQgb24gZWFjaCBjcHUgYWZ0
ZXIgbG9hZGluZyBhbiB1cGRhdGUuCiAgICBJdCBpcyBhIHByZXBhcmF0aW9uIGZvciBzcGxpdGlu
ZyBvdXQgYXBwbHlfbWljcm9jb2RlKCkgZnJvbQogICAgY3B1X3JlcXVlc3RfbWljcm9jb2RlKCku
CiAgICAKICAgIE5vdGUgdGhhdCBzdm1faG9zdF9vc3ZtX2luaXQoKSBzaG91bGQgYmUgY2FsbGVk
IHJlZ2FyZGxlc3Mgb2YgdGhlCiAgICByZXN1bHQgb2YgbG9hZGluZyBhbiB1cGRhdGUuCiAgICAK
ICAgIFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgICBSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CiAgICBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKY29tbWl0IDQxZGY1OTk5
ZjFmNjExY2NiYWVkYjE1ZjVhNGRiZDFjMWE2MzQxNzMKQXV0aG9yOiBDaGFvIEdhbyA8Y2hhby5n
YW9AaW50ZWwuY29tPgpEYXRlOiAgIEZyaSBTZXAgMTMgMTI6MzA6MTIgMjAxOSArMDIwMAoKICAg
IG1pY3JvY29kZTogcmVtb3ZlIHBvaW50bGVzcyAnY3B1JyBwYXJhbWV0ZXIKICAgIAogICAgU29t
ZSBjYWxsYmFja3MgaW4gbWljcm9jb2RlX29wcyBvciByZWxhdGVkIGZ1bmN0aW9ucyB0YWtlIGEg
Y3B1CiAgICBpZCBwYXJhbWV0ZXIuIEJ1dCBhdCBjdXJyZW50IGNhbGwgc2l0ZXMsIHRoZSBjcHUg
aWQgcGFyYW1ldGVyIGlzCiAgICBhbHdheXMgZXF1YWwgdG8gY3VycmVudCBjcHUgaWQuIFNvbWUg
b2YgdGhlbSBldmVuIHVzZSBhbiBhc3NlcnRpb24KICAgIHRvIGd1YXJhbnRlZSB0aGlzLiBSZW1v
dmUgdGhpcyByZWR1bmRlbnQgJ2NwdScgcGFyYW1ldGVyLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5
OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmNvbW1pdCA4MWNjMGYzOTMxNDM1Mzc0MDc3MTg0NjY1
MTQ4MzM1ZmNhMjQ1ODQ5CkF1dGhvcjogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KRGF0
ZTogICBGcmkgU2VwIDEzIDEyOjI4OjQ0IDIwMTkgKzAyMDAKCiAgICBtaWNyb2NvZGU6IHJlbW92
ZSBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8KICAgIAogICAgUmVtb3ZlIHRoZSBwZXItY3B1IGNhY2hl
IGZpZWxkIGluIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyBzaW5jZSBpdCBoYXMKICAgIGJlZW4gcmVw
bGFjZWQgYnkgYSBnbG9iYWwgY2FjaGUuIEl0IHdvdWxkIGxlYWRzIHRvIG9ubHkgb25lIGZpZWxk
CiAgICByZW1haW5pbmcgaW4gdWNvZGVfY3B1X2luZm8uIFRoZW4sIHRoaXMgc3RydWN0IGlzIHJl
bW92ZWQgYW5kIHRoZQogICAgcmVtYWluaW5nIGZpZWxkIChjcHUgc2lnbmF0dXJlKSBpcyBzdG9y
ZWQgaW4gcGVyLWNwdSBhcmVhLgogICAgCiAgICBUaGUgY3B1IHN0YXR1cyBub3RpZmllciBpcyBh
bHNvIHJlbW92ZWQuIEl0IHdhcyB1c2VkIHRvIGZyZWUgdGhlICJtYyIKICAgIGZpZWxkIHRvIGF2
b2lkIG1lbW9yeSBsZWFrLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5n
YW9AaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCmNvbW1pdCA4MzFmMTYyNzQ5NDJjZTcwZmJiNTBjNDM4NTg5ZjgyYzdkNjMxMjU3CkF1
dGhvcjogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KRGF0ZTogICBGcmkgU2VwIDEzIDEy
OjI4OjEzIDIwMTkgKzAyMDAKCiAgICBtaWNyb2NvZGU6IGNsZWFuIHVwIG1pY3JvY29kZV9yZXN1
bWVfY3B1CiAgICAKICAgIFByZXZpb3VzbHksIGEgcGVyLWNwdSB1Y29kZSBjYWNoZSBpcyBtYWlu
dGFpbmVkLiBUaGVuIGVhY2ggQ1BVIGhhZCBvbmUKICAgIHBlci1jcHUgdXBkYXRlIGNhY2hlIGFu
ZCB0aGVyZSBtaWdodCBiZSBtdWx0aXBsZSB2ZXJzaW9ucyBvZiBtaWNyb2NvZGUuCiAgICBUaHVz
IG1pY3JvY29kZV9yZXN1bWVfY3B1IHRyaWVkIGJlc3QgdG8gdXBkYXRlIG1pY3JvY29kZSBieSBs
b2FkaW5nCiAgICBldmVyeSB1cGRhdGUgY2FjaGUgdW50aWwgYSBzdWNjZXNzZnVsIGxvYWQuCiAg
ICAKICAgIEJ1dCBub3cgdGhlIGNhY2hlIHN0cnVjdCBpcyBzaW1wbGlmaWVkIGEgbG90IGFuZCBv
bmx5IGEgc2luZ2xlIHVjb2RlIGlzCiAgICBjYWNoZWQuIGEgc2luZ2xlIGludm9jYXRpb24gb2Yg
LT5hcHBseV9taWNyb2NvZGUoKSB3b3VsZCBsb2FkIHRoZSBjYWNoZQogICAgYW5kIG1ha2UgbWlj
cm9jb2RlIHVwZGF0ZWQuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdh
b0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKY29tbWl0IDlkYTIzOTQzY2NkNTU3ZGRiNmMzNGU5NmUzYmMwNzhhNTFhZDgyMDUKQXV0
aG9yOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpEYXRlOiAgIEZyaSBTZXAgMTMgMTI6
Mjc6NDIgMjAxOSArMDIwMAoKICAgIG1pY3JvY29kZTogaW50cm9kdWNlIGEgZ2xvYmFsIGNhY2hl
IG9mIHVjb2RlIHBhdGNoCiAgICAKICAgIHRvIHJlcGxhY2UgdGhlIGN1cnJlbnQgcGVyLWNwdSBj
YWNoZSAndWNpLT5tYycuCiAgICAKICAgIFdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBhbGwgQ1BV
cyBpbiB0aGUgc3lzdGVtIGhhdmUgdGhlIHNhbWUgc2lnbmF0dXJlCiAgICAoZmFtaWx5LCBtb2Rl
bCwgc3RlcHBpbmcgYW5kICdwZicpLCBvbmUgbWljcm9jb2RlIHVwZGF0ZSBtYXRjaGVzIHdpdGgK
ICAgIG9uZSBjcHUgc2hvdWxkIG1hdGNoIHdpdGggb3RoZXJzLiBIYXZpbmcgZGlmZmVyaW5nIG1p
Y3JvY29kZSByZXZpc2lvbnMKICAgIG9uIGNwdXMgd291bGQgY2F1c2Ugc3lzdGVtIHVuc3RhYmxl
IGFuZCBzaG91bGQgYmUgYXZvaWRlZC4gSGVuY2UsIGNhY2hpbmcKICAgIG9uZSBtaWNyb2NvZGUg
dXBkYXRlIGlzIGdvb2QgZW5vdWdoIGZvciBhbGwgY2FzZXMuCiAgICAKICAgIEludHJvZHVjZSBh
IGdsb2JhbCB2YXJpYWJsZSwgbWljcm9jb2RlX2NhY2hlLCB0byBzdG9yZSB0aGUgbmV3ZXN0CiAg
ICBtYXRjaGluZyBtaWNyb2NvZGUgdXBkYXRlLiBXaGVuZXZlciB3ZSBnZXQgYSBuZXcgdmFsaWQg
bWljcm9jb2RlIHVwZGF0ZSwKICAgIGl0cyByZXZpc2lvbiBpZCBpcyBjb21wYXJlZCBhZ2FpbnN0
IHRoYXQgb2YgdGhlIG1pY3JvY29kZSB1cGRhdGUgdG8KICAgIGRldGVybWluZSB3aGV0aGVyIHRo
ZSAibWljcm9jb2RlX2NhY2hlIiBuZWVkcyB0byBiZSByZXBsYWNlZC4gQW5kCiAgICB0aGlzIGds
b2JhbCBjYWNoZSBpcyBsb2FkZWQgdG8gY3B1IGluIGFwcGx5X21pY3JvY29kZSgpLgogICAgCiAg
ICBBbGwgb3BlcmF0aW9ucyBvbiB0aGUgY2FjaGUgaXMgcHJvdGVjdGVkIGJ5ICdtaWNyb2NvZGVf
bXV0ZXgnLgogICAgCiAgICBOb3RlIHRoYXQgSSBkZWxpYmVyYXRlbHkgYXZvaWQgdG91Y2hpbmcg
dGhlIG9sZCBwZXItY3B1IGNhY2hlICgndWNpLT5tYycpCiAgICBhcyBJIGFtIGdvaW5nIHRvIHJl
bW92ZSBpdCBjb21wbGV0ZWx5IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcy4gV2UgY29weQogICAg
ZXZlcnl0aGluZyB0byBjcmVhdGUgdGhlIG5ldyBjYWNoZSBibG9iIHRvIGF2b2lkIHJldXNpbmcg
c29tZSBidWZmZXJzCiAgICBwcmV2aW91c2x5IGFsbG9jYXRlZCBmb3IgdGhlIG9sZCBwZXItY3B1
IGNhY2hlLiBJdCBpcyBub3Qgc28gZWZmaWNpZW50LAogICAgYnV0IGl0IGlzIGFscmVhZHkgY29y
cmVjdGVkIGJ5IGEgcGF0Y2ggbGF0ZXIgaW4gdGhpcyBzZXJpZXMuCiAgICAKICAgIFNpZ25lZC1v
ZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CiAgICBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKY29tbWl0IDY4Zjk0ZWY4ZTU3Y2VhODI2ODBiN2Jk
YTJlMDNjYWFiY2JhNmQwYTYKQXV0aG9yOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpE
YXRlOiAgIEZyaSBTZXAgMTMgMTI6MjY6NTEgMjAxOSArMDIwMAoKICAgIG1pY3JvY29kZS9hbWQ6
IGRpc3Rpbmd1aXNoIG9sZCBhbmQgbWlzbWF0Y2hlZCB1Y29kZSBpbiBtaWNyb2NvZGVfZml0cygp
CiAgICAKICAgIFNvbWV0aW1lcywgYW4gdWNvZGUgd2l0aCBhIGxldmVsIGxvd2VyIHRoYW4gb3Ig
ZXF1YWwgdG8gY3VycmVudCBDUFUncwogICAgcGF0Y2ggbGV2ZWwgaXMgdXNlZnVsLiBGb3IgZXhh
bXBsZSwgdG8gd29yayBhcm91bmQgYSBicm9rZW4gYmlvcyB3aGljaAogICAgb25seSBsb2FkcyB1
Y29kZSBmb3IgQlNQLCB3aGVuIEJTUCBwYXJzZXMgYW4gdWNvZGUgYmxvYiBkdXJpbmcgYm9vdHVw
LAogICAgaXQgaXMgYmV0dGVyIHRvIHNhdmUgYW4gdWNvZGUgd2l0aCBsb3dlciBvciBlcXVhbCBs
ZXZlbCBmb3IgQVBzCiAgICAKICAgIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlzIG1hZGUgaW4gdGhp
cyBwYXRjaC4gQnV0IGZvbGxvd2luZyBwYXRjaCB3b3VsZAogICAgaGFuZGxlICJvbGQgdWNvZGUi
IGFuZCAibWlzbWF0Y2hlZCB1Y29kZSIgc2VwYXJhdGVseS4KICAgIAogICAgU2lnbmVkLW9mZi1i
eTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpjb21taXQgMTA5N2FlYjI3YWZlZGQ3ZmQ3MTNlYTJk
MjJhN2Y0NGM2NDI5Y2NiYwpBdXRob3I6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CkRh
dGU6ICAgRnJpIFNlcCAxMyAxMjoyNjoxNiAyMDE5ICswMjAwCgogICAgbWljcm9jb2RlL2ludGVs
OiBleHRlbmQgbWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgpCiAgICAKICAgIHRvIGEgbW9yZSBnZW5l
cmljIGZ1bmN0aW9uLiBTbyB0aGF0IGl0IGNhbiBiZSB1c2VkIGFsb25lIHRvIGNoZWNrCiAgICBh
biB1cGRhdGUgYWdhaW5zdCB0aGUgQ1BVIHNpZ25hdHVyZSBhbmQgY3VycmVudCB1cGRhdGUgcmV2
aXNpb24uCiAgICAKICAgIE5vdGUgdGhhdCBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgd2ls
bCBiZSB1c2VkIGluIGNvbW1vbiBjb2RlCiAgICAoYWthIG1pY3JvY29kZS5jKSwgaXQgaGFzIGJl
ZW4gcGxhY2VkIGluIHRoZSBjb21tb24gaGVhZGVyLiBBbmQKICAgIGNvbnN0aWZ5aW5nIHRoZSBw
YXJhbWV0ZXIgb2YgbWljcm9jb2RlX3Nhbml0eV9jaGVjaygpIHN1Y2ggdGhhdCBpdAogICAgY2Fu
IGJlIGNhbGxlZCBieSBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCkuCiAgICAKICAgIFNpZ25lZC1v
ZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKY29tbWl0IDc4NDgxZjUyNTg3NmE2Zjc1Mzg2
NjcxNWFiYWY4MzRmOWE0Y2JjMWEKQXV0aG9yOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgpEYXRlOiAgIEZyaSBTZXAgMTMgMTI6MjE6NDcgMjAxOSArMDIwMAoKICAgIHB1
YmxpYy94ZW4uaDogdXBkYXRlIHRoZSBjb21tZW50IGV4cGxhaW5pbmcgJ1dhbGxjbG9jayB0aW1l
JwogICAgCiAgICBTaW5jZSBjb21taXQgMDYyOWFkZmQ4MGUgIkFjdHVhbGx5IHNldCBhIEhWTSBk
b21haW4ncyB0aW1lIG9mZnNldCB3aGVuIGl0CiAgICBzZXRzIHRoZSBSVEMiLCB0aGUgY29tbWVu
dCBpbiB0aGUgcHVibGljIGhlYWRlciBoYXMgYmVlbiBtaXNsZWFkaW5nLCBzaW5jZQogICAgaXQg
Y2xhaW1zIHRoYXQgd2FsbGNsb2NrIHRpbWUgaXMgb25seSB1cGRhdGVkIGJ5IGNvbnRyb2wgc29m
dHdhcmUuCiAgICBNb3Jlb3ZlciwgdGhlIGNvbW1lbnRzIHN0YXRpbmcgdGhhdCB3Y19zZWMgYW5k
IHdjX25zZWMgYXJlIHNlY29uZHMgYW5kCiAgICBuYW5vc2Vjb25kcyAocmVzcGVjdGl2ZWx5KSBp
biBVVEMgc2luY2UgdGhlIFVuaXggZXBvY2ggYXJlIGJvZ3VzLiBUaGVpcgogICAgdmFsdWVzIGFy
ZSBhZGp1c3RlZCBieSB0aGUgZG9tYWluJ3MgdGltZV9vZmZzZXRfc2Vjb25kcyB2YWx1ZSwgd2hp
Y2ggaXMKICAgIHVwZGF0ZWQgYnkgYSBndWVzdCB3cml0ZSB0byB0aGUgZW11bGF0ZWQgUlRDIGFu
ZCBoZW5jZSB0aGUgd2FsbGNsb2NrCiAgICB0aW1lem9uZSBpcyB1bmRlciBndWVzdCBjb250cm9s
LgogICAgCiAgICBUaGlzIHBhdGNoIGF0dGVtcHRzIHRvIGJyaW5nIHRoZSBjb21tZW50IGluIGxp
bmUgd2l0aCByZWFsaXR5IHdoaWxzdAogICAga2VlcGluZyBpdCByZWFzb25hYmx5IHNob3J0Lgog
ICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXgu
Y29tPgogICAgQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmNvbW1p
dCBmNTk4NjZlMmJjMTkwZjA4MzhkYTE5ODhlMTU3MjJjYWMxMzQwM2U1CkF1dGhvcjogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KRGF0ZTogICBUaHUgU2VwIDEyIDE1OjE4
OjQ3IDIwMTkgKzAxMDAKCiAgICBVcGRhdGUgbXkgTUFJTlRBSU5FUlMgZW50cmllcwogICAgCiAg
ICBNeSBDaXRyaXggZW1haWwgYWRkcmVzcyB3aWxsIGV4cGlyZSBzaG9ydGx5LgogICAgCiAgICBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogICAg
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgpjb21taXQgMmJj
ZGRjNGRhMTE4ZDUyOGViMWZiZjE2MzdmOTExNzVmZjk5NjllYwpBdXRob3I6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KRGF0ZTogICBGcmkgU2VwIDEzIDA4OjE1OjA1IDIwMTkgKzAy
MDAKCiAgICBkZWJ1Z3RyYWNlOiBmaXggQXJtIGJ1aWxkCiAgICAKICAgIEFkZCBtaXNzaW5nICNp
bmNsdWRlcy4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgogICAgQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmNv
bW1pdCA2ZTNlNzcxMjAzNzgxYmE2NDgzNjM2YTczMmIyNjQ0ZmQ2Y2FiMDgxCkF1dGhvcjogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KRGF0ZTogICBXZWQgU2VwIDExIDE2OjMx
OjM0IDIwMTkgKzAxMDAKCiAgICB4ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1U
cmVlIGxhdGVyIG9uIGluIHRoZSBib290CiAgICAKICAgIEF0IHRoZSBtb21lbnQsIHRoZSBEZXZp
Y2UtVHJlZSBpcyByZWxvY2F0ZWQgaW50byB4ZW5oZWFwIHdoaWxlIHNldHRpbmcKICAgIHVwIHRo
ZSBtZW1vcnkgc3Vic3lzdGVtLiBUaGlzIGlzIGFjdHVhbGx5IG5vdCBuZWNlc3NhcnkgYmVjYXVz
ZSB0aGUKICAgIGVhcmx5IG1hcHBpbmcgaXMgc3RpbGwgcHJlc2VudCBhbmQgd2UgZG9uJ3QgcmVx
dWlyZSB0aGUgdmlydHVhbCBhZGRyZXNzCiAgICB0byBiZSBzdGFibGUgdW50aWwgdW5mbGF0dGlu
ZyB0aGUgRGV2aWNlLVRyZWUuCiAgICAKICAgIFNvIHRoZSByZWxvY2F0aW9uIGNhbiBzYWZlbHkg
YmUgbW92ZWQgYWZ0ZXIgdGhlIG1lbW9yeSBzdWJzeXN0ZW0gaXMKICAgIGZ1bGx5IHNldHVwLiBU
aGlzIGhhcyB0aGUgbmljZSBhZHZhbnRhZ2UgdG8gbWFrZSB0aGUgcmVsb2NhdGlvbiBjb21tb24K
ICAgIGFuZCBsZXQgdGhlIHhlbmhlYXAgYWxsb2NhdG9yIGRlY2lkZXMgd2hlcmUgdG8gcHV0IGl0
LgogICAgCiAgICBMYXN0bHksIHRoZSBkZXZpY2UtdHJlZSBpcyBub3QgZ29pbmcgdG8gYmUgdXNl
ZCBmb3IgQUNQSSBzeXN0ZW0uIFNvCiAgICB0aGVyZSBhcmUgbm8gbmVlZCB0byByZWxvY2F0ZSBp
dCBhbmQgY2FuIGp1c3QgYmUgZGlzY2FyZGVkLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogICAgUmV2aWV3ZWQtYnk6IFZvbG9keW15
ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KICAgIEFja2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgpjb21taXQgMGExOTY3M2Fm
ZmJjOTE3N2VhNWY3NThiYTI0NWM3MGRkMWE0NWE5MApBdXRob3I6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkRhdGU6ICAgV2VkIFNlcCAxMSAxNjoxOTo0MiAyMDE5ICswMTAw
CgogICAgeGVuL2FybTogYm9vdGZkOiBGaXggaW5kZW50YXRpb24gaW4gcHJvY2Vzc19tdWx0aWJv
b3Rfbm9kZSgpCiAgICAKICAgIE9uZSBsaW5lIGluIHByb2Nlc3NfbXVsdGlib290X25vZGUoKSBp
cyB1c2luZyBoYXJkIHRhYiByYXRoZXIgdGhhbiBzb2Z0CiAgICB0YWIuIFNvIGZpeCBpdCEKICAg
IAogICAgU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
ICAgIFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBh
bS5jb20+CiAgICBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoocWVtdSBjaGFuZ2VzIG5vdCBpbmNsdWRlZCkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
