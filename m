Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBE6B2885
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 00:37:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8u7K-0005lv-ML; Fri, 13 Sep 2019 22:32:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YNN1=XI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i8u7I-0005lq-St
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 22:32:36 +0000
X-Inumbo-ID: 61f04e0e-d676-11e9-b299-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61f04e0e-d676-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 22:32:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i8u7G-00051w-EH; Fri, 13 Sep 2019 22:32:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i8u7G-0002zR-3t; Fri, 13 Sep 2019 22:32:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i8u7G-0002UO-2z; Fri, 13 Sep 2019 22:32:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141286-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=cd93953538aac6026a8012d14a63b320eadd0c98
X-Osstest-Versions-That: xen=1014f47c7a808e025b8920ab80bfe73a2888b3e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2019 22:32:34 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141286: regressions - FAIL
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

ZmxpZ2h0IDE0MTI4NiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTI4Ni8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hcm1oZi1hcm1oZi14bCAg
ICAgICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQxMjUz
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVz
dC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAg
IGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDEzIG1pZ3Jh
dGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJt
NjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2
ZXIgcGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAg
ICAgIGNkOTM5NTM1MzhhYWM2MDI2YTgwMTJkMTRhNjNiMzIwZWFkZDBjOTgKYmFzZWxpbmUgdmVy
c2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIDEwMTRmNDdjN2E4MDhlMDI1Yjg5MjBhYjgwYmZl
NzNhMjg4OGIzZTUKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MTI1MyAgMjAxOS0wOS0xMiAxNzow
MDo0MyBaICAgIDEgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxNDEyNTUgIDIwMTktMDktMTIg
MjE6MDE6MjIgWiAgICAxIGRheXMgICAgOCBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAx
NDEyNzQgIDIwMTktMDktMTMgMTI6MDE6NTMgWiAgICAwIGRheXMgICAgNCBhdHRlbXB0cwoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBDaGFvIEdhbyA8Y2hh
by5nYW9AaW50ZWwuY29tPgogIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KICBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgogIFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCmpvYnM6CiBidWlsZC1hcm02
NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtaGYt
YXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAg
IAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2
NCAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBv
cnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUv
bG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywg
ZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBv
c3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7
aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hp
bmcuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KY29tbWl0IGNkOTM5NTM1MzhhYWM2MDI2YTgwMTJkMTRhNjNiMzIwZWFkZDBjOTgK
QXV0aG9yOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpEYXRlOiAgIEZyaSBTZXAgMTMg
MTI6MzE6MzQgMjAxOSArMDIwMAoKICAgIG1pY3JvY29kZTogcGFzcyBhIHBhdGNoIHBvaW50ZXIg
dG8gYXBwbHlfbWljcm9jb2RlKCkKICAgIAogICAgYXBwbHlfbWljcm9jb2RlKCkncyBhbHdheXMg
bG9hZGluZyB0aGUgY2FjaGVkIHVjb2RlIHBhdGNoIGZvcmNlcwogICAgYSBwYXRjaCB0byBiZSBz
dG9yZWQgYmVmb3JlIGJlaW5nIGxvYWRlZC4gTWFrZSBhcHBseV9taWNyb2NvZGUoKQogICAgYWNj
ZXB0IGEgcGF0Y2ggcG9pbnRlciB0byByZW1vdmUgdGhlIGxpbWl0YXRpb24gc28gdGhhdCBhIHBh
dGNoCiAgICBjYW4gYmUgc3RvcmVkIGFmdGVyIGEgc3VjY2Vzc2Z1bCBsb2FkaW5nLgogICAgCiAg
ICBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgogICAgUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmNvbW1pdCA4NmY2NzA2ZTRm
NGFhODk4YmQ2ZmZlOGYxNzEzZmQxNzVjYzJjN2M5CkF1dGhvcjogQ2hhbyBHYW8gPGNoYW8uZ2Fv
QGludGVsLmNvbT4KRGF0ZTogICBGcmkgU2VwIDEzIDEyOjMxOjAxIDIwMTkgKzAyMDAKCiAgICBt
aWNyb2NvZGUvYW1kOiBjYWxsIHN2bV9ob3N0X29zdndfaW5pdCgpIGluIGNvbW1vbiBjb2RlCiAg
ICAKICAgIEludHJvZHVjZSBhIHZlbmRvciBob29rLCAuZW5kX3VwZGF0ZV9wZXJjcHUsIGZvciBz
dm1faG9zdF9vc3Z3X2luaXQoKS4KICAgIFRoZSBob29rIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBl
YWNoIGNwdSBhZnRlciBsb2FkaW5nIGFuIHVwZGF0ZS4KICAgIEl0IGlzIGEgcHJlcGFyYXRpb24g
Zm9yIHNwbGl0aW5nIG91dCBhcHBseV9taWNyb2NvZGUoKSBmcm9tCiAgICBjcHVfcmVxdWVzdF9t
aWNyb2NvZGUoKS4KICAgIAogICAgTm90ZSB0aGF0IHN2bV9ob3N0X29zdm1faW5pdCgpIHNob3Vs
ZCBiZSBjYWxsZWQgcmVnYXJkbGVzcyBvZiB0aGUKICAgIHJlc3VsdCBvZiBsb2FkaW5nIGFuIHVw
ZGF0ZS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNv
bT4KICAgIFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpjb21t
aXQgNDFkZjU5OTlmMWY2MTFjY2JhZWRiMTVmNWE0ZGJkMWMxYTYzNDE3MwpBdXRob3I6IENoYW8g
R2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CkRhdGU6ICAgRnJpIFNlcCAxMyAxMjozMDoxMiAyMDE5
ICswMjAwCgogICAgbWljcm9jb2RlOiByZW1vdmUgcG9pbnRsZXNzICdjcHUnIHBhcmFtZXRlcgog
ICAgCiAgICBTb21lIGNhbGxiYWNrcyBpbiBtaWNyb2NvZGVfb3BzIG9yIHJlbGF0ZWQgZnVuY3Rp
b25zIHRha2UgYSBjcHUKICAgIGlkIHBhcmFtZXRlci4gQnV0IGF0IGN1cnJlbnQgY2FsbCBzaXRl
cywgdGhlIGNwdSBpZCBwYXJhbWV0ZXIgaXMKICAgIGFsd2F5cyBlcXVhbCB0byBjdXJyZW50IGNw
dSBpZC4gU29tZSBvZiB0aGVtIGV2ZW4gdXNlIGFuIGFzc2VydGlvbgogICAgdG8gZ3VhcmFudGVl
IHRoaXMuIFJlbW92ZSB0aGlzIHJlZHVuZGVudCAnY3B1JyBwYXJhbWV0ZXIuCiAgICAKICAgIFNp
Z25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKY29tbWl0IDgxY2MwZjM5MzE0MzUz
NzQwNzcxODQ2NjUxNDgzMzVmY2EyNDU4NDkKQXV0aG9yOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50
ZWwuY29tPgpEYXRlOiAgIEZyaSBTZXAgMTMgMTI6Mjg6NDQgMjAxOSArMDIwMAoKICAgIG1pY3Jv
Y29kZTogcmVtb3ZlIHN0cnVjdCB1Y29kZV9jcHVfaW5mbwogICAgCiAgICBSZW1vdmUgdGhlIHBl
ci1jcHUgY2FjaGUgZmllbGQgaW4gc3RydWN0IHVjb2RlX2NwdV9pbmZvIHNpbmNlIGl0IGhhcwog
ICAgYmVlbiByZXBsYWNlZCBieSBhIGdsb2JhbCBjYWNoZS4gSXQgd291bGQgbGVhZHMgdG8gb25s
eSBvbmUgZmllbGQKICAgIHJlbWFpbmluZyBpbiB1Y29kZV9jcHVfaW5mby4gVGhlbiwgdGhpcyBz
dHJ1Y3QgaXMgcmVtb3ZlZCBhbmQgdGhlCiAgICByZW1haW5pbmcgZmllbGQgKGNwdSBzaWduYXR1
cmUpIGlzIHN0b3JlZCBpbiBwZXItY3B1IGFyZWEuCiAgICAKICAgIFRoZSBjcHUgc3RhdHVzIG5v
dGlmaWVyIGlzIGFsc28gcmVtb3ZlZC4gSXQgd2FzIHVzZWQgdG8gZnJlZSB0aGUgIm1jIgogICAg
ZmllbGQgdG8gYXZvaWQgbWVtb3J5IGxlYWsuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IENoYW8g
R2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKY29tbWl0IDgzMWYxNjI3NDk0MmNlNzBmYmI1MGM0Mzg1ODlmODJj
N2Q2MzEyNTcKQXV0aG9yOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpEYXRlOiAgIEZy
aSBTZXAgMTMgMTI6Mjg6MTMgMjAxOSArMDIwMAoKICAgIG1pY3JvY29kZTogY2xlYW4gdXAgbWlj
cm9jb2RlX3Jlc3VtZV9jcHUKICAgIAogICAgUHJldmlvdXNseSwgYSBwZXItY3B1IHVjb2RlIGNh
Y2hlIGlzIG1haW50YWluZWQuIFRoZW4gZWFjaCBDUFUgaGFkIG9uZQogICAgcGVyLWNwdSB1cGRh
dGUgY2FjaGUgYW5kIHRoZXJlIG1pZ2h0IGJlIG11bHRpcGxlIHZlcnNpb25zIG9mIG1pY3JvY29k
ZS4KICAgIFRodXMgbWljcm9jb2RlX3Jlc3VtZV9jcHUgdHJpZWQgYmVzdCB0byB1cGRhdGUgbWlj
cm9jb2RlIGJ5IGxvYWRpbmcKICAgIGV2ZXJ5IHVwZGF0ZSBjYWNoZSB1bnRpbCBhIHN1Y2Nlc3Nm
dWwgbG9hZC4KICAgIAogICAgQnV0IG5vdyB0aGUgY2FjaGUgc3RydWN0IGlzIHNpbXBsaWZpZWQg
YSBsb3QgYW5kIG9ubHkgYSBzaW5nbGUgdWNvZGUgaXMKICAgIGNhY2hlZC4gYSBzaW5nbGUgaW52
b2NhdGlvbiBvZiAtPmFwcGx5X21pY3JvY29kZSgpIHdvdWxkIGxvYWQgdGhlIGNhY2hlCiAgICBh
bmQgbWFrZSBtaWNyb2NvZGUgdXBkYXRlZC4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogQ2hhbyBH
YW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cgpjb21taXQgOWRhMjM5NDNjY2Q1NTdkZGI2YzM0ZTk2ZTNiYzA3OGE1
MWFkODIwNQpBdXRob3I6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CkRhdGU6ICAgRnJp
IFNlcCAxMyAxMjoyNzo0MiAyMDE5ICswMjAwCgogICAgbWljcm9jb2RlOiBpbnRyb2R1Y2UgYSBn
bG9iYWwgY2FjaGUgb2YgdWNvZGUgcGF0Y2gKICAgIAogICAgdG8gcmVwbGFjZSB0aGUgY3VycmVu
dCBwZXItY3B1IGNhY2hlICd1Y2ktPm1jJy4KICAgIAogICAgV2l0aCB0aGUgYXNzdW1wdGlvbiB0
aGF0IGFsbCBDUFVzIGluIHRoZSBzeXN0ZW0gaGF2ZSB0aGUgc2FtZSBzaWduYXR1cmUKICAgIChm
YW1pbHksIG1vZGVsLCBzdGVwcGluZyBhbmQgJ3BmJyksIG9uZSBtaWNyb2NvZGUgdXBkYXRlIG1h
dGNoZXMgd2l0aAogICAgb25lIGNwdSBzaG91bGQgbWF0Y2ggd2l0aCBvdGhlcnMuIEhhdmluZyBk
aWZmZXJpbmcgbWljcm9jb2RlIHJldmlzaW9ucwogICAgb24gY3B1cyB3b3VsZCBjYXVzZSBzeXN0
ZW0gdW5zdGFibGUgYW5kIHNob3VsZCBiZSBhdm9pZGVkLiBIZW5jZSwgY2FjaGluZwogICAgb25l
IG1pY3JvY29kZSB1cGRhdGUgaXMgZ29vZCBlbm91Z2ggZm9yIGFsbCBjYXNlcy4KICAgIAogICAg
SW50cm9kdWNlIGEgZ2xvYmFsIHZhcmlhYmxlLCBtaWNyb2NvZGVfY2FjaGUsIHRvIHN0b3JlIHRo
ZSBuZXdlc3QKICAgIG1hdGNoaW5nIG1pY3JvY29kZSB1cGRhdGUuIFdoZW5ldmVyIHdlIGdldCBh
IG5ldyB2YWxpZCBtaWNyb2NvZGUgdXBkYXRlLAogICAgaXRzIHJldmlzaW9uIGlkIGlzIGNvbXBh
cmVkIGFnYWluc3QgdGhhdCBvZiB0aGUgbWljcm9jb2RlIHVwZGF0ZSB0bwogICAgZGV0ZXJtaW5l
IHdoZXRoZXIgdGhlICJtaWNyb2NvZGVfY2FjaGUiIG5lZWRzIHRvIGJlIHJlcGxhY2VkLiBBbmQK
ICAgIHRoaXMgZ2xvYmFsIGNhY2hlIGlzIGxvYWRlZCB0byBjcHUgaW4gYXBwbHlfbWljcm9jb2Rl
KCkuCiAgICAKICAgIEFsbCBvcGVyYXRpb25zIG9uIHRoZSBjYWNoZSBpcyBwcm90ZWN0ZWQgYnkg
J21pY3JvY29kZV9tdXRleCcuCiAgICAKICAgIE5vdGUgdGhhdCBJIGRlbGliZXJhdGVseSBhdm9p
ZCB0b3VjaGluZyB0aGUgb2xkIHBlci1jcHUgY2FjaGUgKCd1Y2ktPm1jJykKICAgIGFzIEkgYW0g
Z29pbmcgdG8gcmVtb3ZlIGl0IGNvbXBsZXRlbHkgaW4gdGhlIGZvbGxvd2luZyBwYXRjaGVzLiBX
ZSBjb3B5CiAgICBldmVyeXRoaW5nIHRvIGNyZWF0ZSB0aGUgbmV3IGNhY2hlIGJsb2IgdG8gYXZv
aWQgcmV1c2luZyBzb21lIGJ1ZmZlcnMKICAgIHByZXZpb3VzbHkgYWxsb2NhdGVkIGZvciB0aGUg
b2xkIHBlci1jcHUgY2FjaGUuIEl0IGlzIG5vdCBzbyBlZmZpY2llbnQsCiAgICBidXQgaXQgaXMg
YWxyZWFkeSBjb3JyZWN0ZWQgYnkgYSBwYXRjaCBsYXRlciBpbiB0aGlzIHNlcmllcy4KICAgIAog
ICAgU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KICAgIFJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KICAgIEFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpjb21taXQgNjhmOTRlZjhlNTdj
ZWE4MjY4MGI3YmRhMmUwM2NhYWJjYmE2ZDBhNgpBdXRob3I6IENoYW8gR2FvIDxjaGFvLmdhb0Bp
bnRlbC5jb20+CkRhdGU6ICAgRnJpIFNlcCAxMyAxMjoyNjo1MSAyMDE5ICswMjAwCgogICAgbWlj
cm9jb2RlL2FtZDogZGlzdGluZ3Vpc2ggb2xkIGFuZCBtaXNtYXRjaGVkIHVjb2RlIGluIG1pY3Jv
Y29kZV9maXRzKCkKICAgIAogICAgU29tZXRpbWVzLCBhbiB1Y29kZSB3aXRoIGEgbGV2ZWwgbG93
ZXIgdGhhbiBvciBlcXVhbCB0byBjdXJyZW50IENQVSdzCiAgICBwYXRjaCBsZXZlbCBpcyB1c2Vm
dWwuIEZvciBleGFtcGxlLCB0byB3b3JrIGFyb3VuZCBhIGJyb2tlbiBiaW9zIHdoaWNoCiAgICBv
bmx5IGxvYWRzIHVjb2RlIGZvciBCU1AsIHdoZW4gQlNQIHBhcnNlcyBhbiB1Y29kZSBibG9iIGR1
cmluZyBib290dXAsCiAgICBpdCBpcyBiZXR0ZXIgdG8gc2F2ZSBhbiB1Y29kZSB3aXRoIGxvd2Vy
IG9yIGVxdWFsIGxldmVsIGZvciBBUHMKICAgIAogICAgTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaXMg
bWFkZSBpbiB0aGlzIHBhdGNoLiBCdXQgZm9sbG93aW5nIHBhdGNoIHdvdWxkCiAgICBoYW5kbGUg
Im9sZCB1Y29kZSIgYW5kICJtaXNtYXRjaGVkIHVjb2RlIiBzZXBhcmF0ZWx5LgogICAgCiAgICBT
aWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgogICAgUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmNvbW1pdCAxMDk3YWViMjdhZmVk
ZDdmZDcxM2VhMmQyMmE3ZjQ0YzY0MjljY2JjCkF1dGhvcjogQ2hhbyBHYW8gPGNoYW8uZ2FvQGlu
dGVsLmNvbT4KRGF0ZTogICBGcmkgU2VwIDEzIDEyOjI2OjE2IDIwMTkgKzAyMDAKCiAgICBtaWNy
b2NvZGUvaW50ZWw6IGV4dGVuZCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCkKICAgIAogICAgdG8g
YSBtb3JlIGdlbmVyaWMgZnVuY3Rpb24uIFNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgYWxvbmUgdG8g
Y2hlY2sKICAgIGFuIHVwZGF0ZSBhZ2FpbnN0IHRoZSBDUFUgc2lnbmF0dXJlIGFuZCBjdXJyZW50
IHVwZGF0ZSByZXZpc2lvbi4KICAgIAogICAgTm90ZSB0aGF0IGVudW0gbWljcm9jb2RlX21hdGNo
X3Jlc3VsdCB3aWxsIGJlIHVzZWQgaW4gY29tbW9uIGNvZGUKICAgIChha2EgbWljcm9jb2RlLmMp
LCBpdCBoYXMgYmVlbiBwbGFjZWQgaW4gdGhlIGNvbW1vbiBoZWFkZXIuIEFuZAogICAgY29uc3Rp
ZnlpbmcgdGhlIHBhcmFtZXRlciBvZiBtaWNyb2NvZGVfc2FuaXR5X2NoZWNrKCkgc3VjaCB0aGF0
IGl0CiAgICBjYW4gYmUgY2FsbGVkIGJ5IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goKS4KICAgIAog
ICAgU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KICAgIFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpjb21taXQgNzg0ODFmNTI1
ODc2YTZmNzUzODY2NzE1YWJhZjgzNGY5YTRjYmMxYQpBdXRob3I6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+CkRhdGU6ICAgRnJpIFNlcCAxMyAxMjoyMTo0NyAyMDE5ICsw
MjAwCgogICAgcHVibGljL3hlbi5oOiB1cGRhdGUgdGhlIGNvbW1lbnQgZXhwbGFpbmluZyAnV2Fs
bGNsb2NrIHRpbWUnCiAgICAKICAgIFNpbmNlIGNvbW1pdCAwNjI5YWRmZDgwZSAiQWN0dWFsbHkg
c2V0IGEgSFZNIGRvbWFpbidzIHRpbWUgb2Zmc2V0IHdoZW4gaXQKICAgIHNldHMgdGhlIFJUQyIs
IHRoZSBjb21tZW50IGluIHRoZSBwdWJsaWMgaGVhZGVyIGhhcyBiZWVuIG1pc2xlYWRpbmcsIHNp
bmNlCiAgICBpdCBjbGFpbXMgdGhhdCB3YWxsY2xvY2sgdGltZSBpcyBvbmx5IHVwZGF0ZWQgYnkg
Y29udHJvbCBzb2Z0d2FyZS4KICAgIE1vcmVvdmVyLCB0aGUgY29tbWVudHMgc3RhdGluZyB0aGF0
IHdjX3NlYyBhbmQgd2NfbnNlYyBhcmUgc2Vjb25kcyBhbmQKICAgIG5hbm9zZWNvbmRzIChyZXNw
ZWN0aXZlbHkpIGluIFVUQyBzaW5jZSB0aGUgVW5peCBlcG9jaCBhcmUgYm9ndXMuIFRoZWlyCiAg
ICB2YWx1ZXMgYXJlIGFkanVzdGVkIGJ5IHRoZSBkb21haW4ncyB0aW1lX29mZnNldF9zZWNvbmRz
IHZhbHVlLCB3aGljaCBpcwogICAgdXBkYXRlZCBieSBhIGd1ZXN0IHdyaXRlIHRvIHRoZSBlbXVs
YXRlZCBSVEMgYW5kIGhlbmNlIHRoZSB3YWxsY2xvY2sKICAgIHRpbWV6b25lIGlzIHVuZGVyIGd1
ZXN0IGNvbnRyb2wuCiAgICAKICAgIFRoaXMgcGF0Y2ggYXR0ZW1wdHMgdG8gYnJpbmcgdGhlIGNv
bW1lbnQgaW4gbGluZSB3aXRoIHJlYWxpdHkgd2hpbHN0CiAgICBrZWVwaW5nIGl0IHJlYXNvbmFi
bHkgc2hvcnQuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+CiAgICBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKY29tbWl0IGY1OTg2NmUyYmMxOTBmMDgzOGRhMTk4OGUxNTcyMmNhYzEzNDAzZTUKQXV0
aG9yOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpEYXRlOiAgIFRodSBT
ZXAgMTIgMTU6MTg6NDcgMjAxOSArMDEwMAoKICAgIFVwZGF0ZSBteSBNQUlOVEFJTkVSUyBlbnRy
aWVzCiAgICAKICAgIE15IENpdHJpeCBlbWFpbCBhZGRyZXNzIHdpbGwgZXhwaXJlIHNob3J0bHku
CiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+CiAgICBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CmNvbW1pdCAyYmNkZGM0ZGExMThkNTI4ZWIxZmJmMTYzN2Y5MTE3NWZmOTk2OWVjCkF1dGhvcjog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiAgIEZyaSBTZXAgMTMgMDg6MTU6
MDUgMjAxOSArMDIwMAoKICAgIGRlYnVndHJhY2U6IGZpeCBBcm0gYnVpbGQKICAgIAogICAgQWRk
IG1pc3NpbmcgI2luY2x1ZGVzLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CiAgICBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKY29tbWl0IDZlM2U3NzEyMDM3ODFiYTY0ODM2MzZhNzMyYjI2NDRmZDZjYWIwODEK
QXV0aG9yOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpEYXRlOiAgIFdlZCBT
ZXAgMTEgMTY6MzE6MzQgMjAxOSArMDEwMAoKICAgIHhlbi9hcm06IHNldHVwOiBSZWxvY2F0ZSB0
aGUgRGV2aWNlLVRyZWUgbGF0ZXIgb24gaW4gdGhlIGJvb3QKICAgIAogICAgQXQgdGhlIG1vbWVu
dCwgdGhlIERldmljZS1UcmVlIGlzIHJlbG9jYXRlZCBpbnRvIHhlbmhlYXAgd2hpbGUgc2V0dGlu
ZwogICAgdXAgdGhlIG1lbW9yeSBzdWJzeXN0ZW0uIFRoaXMgaXMgYWN0dWFsbHkgbm90IG5lY2Vz
c2FyeSBiZWNhdXNlIHRoZQogICAgZWFybHkgbWFwcGluZyBpcyBzdGlsbCBwcmVzZW50IGFuZCB3
ZSBkb24ndCByZXF1aXJlIHRoZSB2aXJ0dWFsIGFkZHJlc3MKICAgIHRvIGJlIHN0YWJsZSB1bnRp
bCB1bmZsYXR0aW5nIHRoZSBEZXZpY2UtVHJlZS4KICAgIAogICAgU28gdGhlIHJlbG9jYXRpb24g
Y2FuIHNhZmVseSBiZSBtb3ZlZCBhZnRlciB0aGUgbWVtb3J5IHN1YnN5c3RlbSBpcwogICAgZnVs
bHkgc2V0dXAuIFRoaXMgaGFzIHRoZSBuaWNlIGFkdmFudGFnZSB0byBtYWtlIHRoZSByZWxvY2F0
aW9uIGNvbW1vbgogICAgYW5kIGxldCB0aGUgeGVuaGVhcCBhbGxvY2F0b3IgZGVjaWRlcyB3aGVy
ZSB0byBwdXQgaXQuCiAgICAKICAgIExhc3RseSwgdGhlIGRldmljZS10cmVlIGlzIG5vdCBnb2lu
ZyB0byBiZSB1c2VkIGZvciBBQ1BJIHN5c3RlbS4gU28KICAgIHRoZXJlIGFyZSBubyBuZWVkIHRv
IHJlbG9jYXRlIGl0IGFuZCBjYW4ganVzdCBiZSBkaXNjYXJkZWQuCiAgICAKICAgIFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgICBSZXZpZXdlZC1i
eTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgogICAgQWNr
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCmNvbW1p
dCAwYTE5NjczYWZmYmM5MTc3ZWE1Zjc1OGJhMjQ1YzcwZGQxYTQ1YTkwCkF1dGhvcjogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KRGF0ZTogICBXZWQgU2VwIDExIDE2OjE5OjQy
IDIwMTkgKzAxMDAKCiAgICB4ZW4vYXJtOiBib290ZmQ6IEZpeCBpbmRlbnRhdGlvbiBpbiBwcm9j
ZXNzX211bHRpYm9vdF9ub2RlKCkKICAgIAogICAgT25lIGxpbmUgaW4gcHJvY2Vzc19tdWx0aWJv
b3Rfbm9kZSgpIGlzIHVzaW5nIGhhcmQgdGFiIHJhdGhlciB0aGFuIHNvZnQKICAgIHRhYi4gU28g
Zml4IGl0IQogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgogICAgUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJf
YmFiY2h1a0BlcGFtLmNvbT4KICAgIEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CihxZW11IGNoYW5nZXMgbm90IGluY2x1ZGVkKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
