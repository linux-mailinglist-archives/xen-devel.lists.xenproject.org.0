Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1914789C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 07:40:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iusbJ-0002Pz-GG; Fri, 24 Jan 2020 06:37:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li/E=3N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iusbI-0002Pu-LD
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 06:37:52 +0000
X-Inumbo-ID: 02e35468-3e74-11ea-b833-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02e35468-3e74-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 06:37:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iusb2-0001Vg-FD; Fri, 24 Jan 2020 06:37:36 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iusb2-0006ZG-6r; Fri, 24 Jan 2020 06:37:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iusb2-0006Od-6K; Fri, 24 Jan 2020 06:37:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146457-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=2aa977eb6baaa4e43a9ef3ad26f9eb117eb178f5
X-Osstest-Versions-That: xen=021cc01ecac111be3301ad33ff5cda4543ca8b92
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Jan 2020 06:37:36 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 146457: regressions - FAIL
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

ZmxpZ2h0IDE0NjQ1NyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NjQ1Ny8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQ2NDAx
CiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAgICAgICAgICAg
ICBmYWlsIFJFR1IuIHZzLiAxNDY0MDEKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCwgYnV0
IGFyZSBub3QgYmxvY2tpbmc6CiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAxIGJ1aWxk
LWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0ZXN0LWFybTY0LWFybTY0LXhs
LXhzbSAgICAgICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICAgYmxvY2tlZCAgbi9hCiB0
ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAg
ICAgZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4g
ICAgICAgICAgICAgICAgICAyYWE5NzdlYjZiYWFhNGU0M2E5ZWYzYWQyNmY5ZWIxMTdlYjE3OGY1
CmJhc2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICAwMjFjYzAxZWNhYzExMWJl
MzMwMWFkMzNmZjVjZGE0NTQzY2E4YjkyCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxNDY0MDEgIDIw
MjAtMDEtMjIgMjM6MDA6MzUgWiAgICAxIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQ2NDIw
ICAyMDIwLTAxLTIzIDE1OjAwOjI5IFogICAgMCBkYXlzICAgIDcgYXR0ZW1wdHMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9w
bGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQWxleGFuZHJ1IElzYWlsYSA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CiAgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPgogIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgVGFtYXMgSyBMZW5neWVs
IDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtYW1kNjQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybTY0LWFy
bTY0LXhsLXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAK
IHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0ICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
MmFhOTc3ZWI2YmFhYTRlNDNhOWVmM2FkMjZmOWViMTE3ZWIxNzhmNQpBdXRob3I6IEFsZXhhbmRy
dSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KRGF0ZTogICBGcmkgSmFu
IDE3IDEzOjMxOjMzIDIwMjAgKzAwMDAKCiAgICB4ODYvbW06IE1ha2UgdXNlIG9mIHRoZSBkZWZh
dWx0IGFjY2VzcyBwYXJhbSBmcm9tIHhjX2FsdHAybV9jcmVhdGVfdmlldwogICAgCiAgICBBdCB0
aGlzIG1vbWVudCB0aGUgZGVmYXVsdF9hY2Nlc3MgcGFyYW0gZnJvbSB4Y19hbHRwMm1fY3JlYXRl
X3ZpZXcgaXMKICAgIG5vdCB1c2VkLgogICAgCiAgICBUaGlzIHBhdGNoIGFzc2lnbnMgZGVmYXVs
dF9hY2Nlc3MgdG8gcDJtLT5kZWZhdWx0X2FjY2VzcyBhdCB0aGUgdGltZSBvZgogICAgaW5pdGlh
bGl6aW5nIGEgbmV3IGFsdHAybSB2aWV3LgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KICAgIEFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBp
cmNhbGFidUBiaXRkZWZlbmRlci5jb20+CiAgICBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgoKY29tbWl0IGI3MDFhZGJlZTM3YmVmYTU4YzdiZGVjODBi
NjVmOTNlMDMzMjUyZTYKQXV0aG9yOiBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+CkRhdGU6ICAgRnJpIEphbiAxNyAxMzozMTozMSAyMDIwICswMDAwCgog
ICAgeDg2L21tOiBQdWxsIHZlbmRvci1pbmRlcGVuZGVudCBhbHRwMm0gY29kZSBvdXQgb2YgcDJt
LWVwdC5jIGFuZCBpbnRvIHAybS5jCiAgICAKICAgIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KICAg
IAogICAgUmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4K
ICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBSZXZp
ZXdlZC1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KICAg
IEFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cgpjb21t
aXQgZWEyMmJjZDAzMGRhNzcxYmUxODgyMWJmNGE4OThlZDdhMzE0ZWI4MwpBdXRob3I6IEFsZXhh
bmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KRGF0ZTogICBGcmkg
SmFuIDE3IDEzOjMxOjMwIDIwMjAgKzAwMDAKCiAgICB4ODYvYWx0cDJtOiBBZGQgaHlwZXJjYWxs
IHRvIHNldCBhIHJhbmdlIG9mIHN2ZSBiaXRzCiAgICAKICAgIEJ5IGRlZmF1bHQgdGhlIHN2ZSBi
aXRzIGFyZSBub3Qgc2V0LgogICAgVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGh5cGVyY2FsbCwgeGNf
YWx0cDJtX3NldF9zdXByZXNzX3ZlX211bHRpKCksCiAgICB0byBzZXQgYSByYW5nZSBvZiBzdmUg
Yml0cy4KICAgIFRoZSBjb3JlIGZ1bmN0aW9uLCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKCks
IGRvZXMgbm90IGJyZWFrIGluIGNhc2UKICAgIG9mIGEgZXJyb3IgYW5kIGl0IGlzIGRvaW5nIGEg
YmVzdCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhlCiAgICBnaXZlbiByYW5nZS4g
QSBjaGVjayBmb3IgY29udGludWF0aW9uIGlzIG1hZGUgaW4gb3JkZXIgdG8gaGF2ZQogICAgcHJl
ZW1wdGlvbiBvbiBsYXJnZSByYW5nZXMuCiAgICBUaGUgZ2ZuIG9mIHRoZSBmaXJzdCBlcnJvciBp
cyBzdG9yZWQgaW4KICAgIHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vy
cm9yX2dmbiBhbmQgdGhlIGVycm9yIGNvZGUgaXMKICAgIHN0b3JlZCBpbiB4ZW5faHZtX2FsdHAy
bV9zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9lcnJvci4KICAgIElmIG5vIGVycm9yIG9jY3VycmVk
IHRoZSB2YWx1ZXMgd2lsbCBiZSAwLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUg
SXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBSZXZpZXdlZC1ieTogUGV0cmUgUGlyY2FsYWJ1
IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KICAgIEFja2VkLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cgpjb21taXQgNTE2MGRiZDUxMjUyM2Q4NjVmNzI3
MWFmMjM2MzZhYTNmMzUzNjE4NgpBdXRob3I6IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4KRGF0ZTogICBGcmkgSmFuIDE3IDEzOjMxOjI2IDIwMjAgKzAw
MDAKCiAgICB4ODYvbW06IEFkZCBhcnJheV9pbmRleF9ub3NwZWMgdG8gZ3Vlc3QgcHJvdmlkZWQg
aW5kZXggdmFsdWVzCiAgICAKICAgIFRoaXMgcGF0Y2ggYWltcyB0byBzYW5pdGl6ZSBpbmRleGVz
LCBwb3RlbnRpYWxseSBndWVzdCBwcm92aWRlZAogICAgdmFsdWVzLCBmb3IgYWx0cDJtX2VwdHBb
XSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4KICAgIAogICAgUmVxdWVzdGVkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNh
aWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KICAgIEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CihxZW11IGNoYW5nZXMgbm90IGluY2x1ZGVkKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
