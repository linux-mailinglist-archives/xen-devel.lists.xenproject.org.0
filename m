Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8313B0C0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:22:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPqE-0000RW-Qi; Tue, 14 Jan 2020 17:18:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26Li=3D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1irPqD-0000RR-UG
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:18:57 +0000
X-Inumbo-ID: e8a2c6da-36f1-11ea-ac27-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a2c6da-36f1-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 17:18:40 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1irPpw-0000Es-68; Tue, 14 Jan 2020 17:18:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1irPpv-0006OY-U5; Tue, 14 Jan 2020 17:18:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1irPpv-0005vl-TF; Tue, 14 Jan 2020 17:18:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1irPpv-0005vl-TF@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Jan 2020 17:18:39 +0000
Subject: [Xen-devel] [xen-unstable-smoke bisection] complete build-arm64-xsm
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YnJhbmNoIHhlbi11bnN0YWJsZS1zbW9rZQp4ZW5icmFuY2ggeGVuLXVuc3RhYmxlLXNtb2tlCmpv
YiBidWlsZC1hcm02NC14c20KdGVzdGlkIHhlbi1idWlsZAoKVHJlZTogcWVtdXUgZ2l0Oi8veGVu
Yml0cy54ZW4ub3JnL3FlbXUteGVuLmdpdApUcmVlOiB4ZW4gZ2l0Oi8veGVuYml0cy54ZW4ub3Jn
L3hlbi5naXQKCioqKiBGb3VuZCBhbmQgcmVwcm9kdWNlZCBwcm9ibGVtIGNoYW5nZXNldCAqKioK
CiAgQnVnIGlzIGluIHRyZWU6ICB4ZW4gZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3hlbi5naXQKICBC
dWcgaW50cm9kdWNlZDogIDg5MmI5ZGNlYmRiN2Y2NDY2NTdlMTFjZmRkOTVhMzg1MTA3YmJlZmEK
ICBCdWcgbm90IHByZXNlbnQ6IDAzYmZlNTI2ZWNhZGM4NmYzMWVkYTQzM2I5MWRjOTBiZTA1NjM5
MTkKICBMYXN0IGZhaWwgcmVwcm86IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
L29zc3Rlc3QvbG9ncy8xNDYwODgvCgoKICBjb21taXQgODkyYjlkY2ViZGI3ZjY0NjY1N2UxMWNm
ZGQ5NWEzODUxMDdiYmVmYQogIEF1dGhvcjogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgogIERhdGU6ICAgVHVlIEphbiAxNCAxMjowMzo0NyAyMDIwICswMTAwCiAgCiAgICAgIElSUTog
dTE2IGlzIHRvbyBuYXJyb3cgZm9yIGFuIGV2ZW50IGNoYW5uZWwgbnVtYmVyCiAgICAgIAogICAg
ICBGSUZPIGV2ZW50IGNoYW5uZWxzIGFsbG93IHBvcnRzIHVwIHRvIDJeMTcsIHNvIHdlIG5lZWQg
dG8gdXNlIGEgd2lkZXIKICAgICAgZmllbGQgaW4gc3RydWN0IHBpcnEuIE1vdmUgIm1hc2tlZCIg
c3VjaCB0aGF0IGl0IG1heSBzaGFyZSB0aGUgOC1ieXRlCiAgICAgIHNsb3Qgd2l0aCBzdHJ1Y3Qg
YXJjaF9waXJxIG9uIDY0LWJpdCBhcmNoZXMsIHJhdGhlciB0aGFuIGxlYXZpbmcgYQogICAgICA3
LWJ5dGUgaG9sZSBpbiBhbGwgY2FzZXMuCiAgICAgIAogICAgICBUYWtlIHRoZSBvcHBvcnR1bml0
eSBhbmQgYWxzbyBhZGQgYSBjb21tZW50IHJlZ2FyZGluZyAiYXJjaCIgcGxhY2VtZW50CiAgICAg
IHdpdGhpbiB0aGUgc3RydWN0dXJlLgogICAgICAKICAgICAgU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogICAgICBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCgpGb3IgYmlzZWN0aW9uIHJldmlzaW9uLXR1cGxl
IGdyYXBoIHNlZToKICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVz
dC9yZXN1bHRzL2Jpc2VjdC94ZW4tdW5zdGFibGUtc21va2UvYnVpbGQtYXJtNjQteHNtLnhlbi1i
dWlsZC5odG1sClJldmlzaW9uIElEcyBpbiBlYWNoIGdyYXBoIG5vZGUgcmVmZXIsIHJlc3BlY3Rp
dmVseSwgdG8gdGhlIFRyZWVzIGFib3ZlLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpSdW5uaW5nIGNzLWJpc2VjdGlvbi1zdGVwIC0tZ3JhcGgtb3V0PS9ob21lL2xv
Z3MvcmVzdWx0cy9iaXNlY3QveGVuLXVuc3RhYmxlLXNtb2tlL2J1aWxkLWFybTY0LXhzbS54ZW4t
YnVpbGQgLS1zdW1tYXJ5LW91dD10bXAvMTQ2MDg4LmJpc2VjdGlvbi1zdW1tYXJ5IC0tYmFzaXMt
dGVtcGxhdGU9MTQ2MDQ4IC0tYmxlc3NpbmdzPXJlYWwscmVhbC1iaXNlY3QgeGVuLXVuc3RhYmxl
LXNtb2tlIGJ1aWxkLWFybTY0LXhzbSB4ZW4tYnVpbGQKU2VhcmNoaW5nIGZvciBmYWlsdXJlIC8g
YmFzaXMgcGFzczoKIDE0NjA2OCBmYWlsIFtob3N0PXJvY2hlc3RlcjFdIC8gMTQ2MDQ4IG9rLgpG
YWlsdXJlIC8gYmFzaXMgcGFzcyBmbGlnaHRzOiAxNDYwNjggLyAxNDYwNDgKVHJlZTogcWVtdXUg
Z2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLmdpdApUcmVlOiB4ZW4gZ2l0Oi8veGVuYml0
cy54ZW4ub3JnL3hlbi5naXQKTGF0ZXN0IDkzM2ViYWQyNDcwYTE2OTUwNDc5OWExZDk1YjhlNDEw
YmQ5ODQ3ZWYgMTAxMzk4ZTFmODFjYTdhNGY0NWFiNTRjNGQwYzRmZWU3YjNhN2JkOApCYXNpcyBw
YXNzIDkzM2ViYWQyNDcwYTE2OTUwNDc5OWExZDk1YjhlNDEwYmQ5ODQ3ZWYgMDNiZmU1MjZlY2Fk
Yzg2ZjMxZWRhNDMzYjkxZGM5MGJlMDU2MzkxOQpHZW5lcmF0aW5nIHJldmlzaW9ucyB3aXRoIC4v
YWRob2MtcmV2dHVwbGUtZ2VuZXJhdG9yICBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcWVtdS14ZW4u
Z2l0IzkzM2ViYWQyNDcwYTE2OTUwNDc5OWExZDk1YjhlNDEwYmQ5ODQ3ZWYtOTMzZWJhZDI0NzBh
MTY5NTA0Nzk5YTFkOTViOGU0MTBiZDk4NDdlZiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdp
dCMwM2JmZTUyNmVjYWRjODZmMzFlZGE0MzNiOTFkYzkwYmUwNTYzOTE5LTEwMTM5OGUxZjgxY2E3
YTRmNDVhYjU0YzRkMGM0ZmVlN2IzYTdiZDgKTG9hZGVkIDUwMDEgbm9kZXMgaW4gcmV2aXNpb24g
Z3JhcGgKU2VhcmNoaW5nIGZvciB0ZXN0IHJlc3VsdHM6CiAxNDYwNDggcGFzcyA5MzNlYmFkMjQ3
MGExNjk1MDQ3OTlhMWQ5NWI4ZTQxMGJkOTg0N2VmIDAzYmZlNTI2ZWNhZGM4NmYzMWVkYTQzM2I5
MWRjOTBiZTA1NjM5MTkKIDE0NjA4MyBwYXNzIDkzM2ViYWQyNDcwYTE2OTUwNDc5OWExZDk1Yjhl
NDEwYmQ5ODQ3ZWYgMDNiZmU1MjZlY2FkYzg2ZjMxZWRhNDMzYjkxZGM5MGJlMDU2MzkxOQogMTQ2
MDgwIGZhaWwgOTMzZWJhZDI0NzBhMTY5NTA0Nzk5YTFkOTViOGU0MTBiZDk4NDdlZiAxMDEzOThl
MWY4MWNhN2E0ZjQ1YWI1NGM0ZDBjNGZlZTdiM2E3YmQ4CiAxNDYwNjggZmFpbCA5MzNlYmFkMjQ3
MGExNjk1MDQ3OTlhMWQ5NWI4ZTQxMGJkOTg0N2VmIDEwMTM5OGUxZjgxY2E3YTRmNDVhYjU0YzRk
MGM0ZmVlN2IzYTdiZDgKIDE0NjA3NCBwYXNzIDkzM2ViYWQyNDcwYTE2OTUwNDc5OWExZDk1Yjhl
NDEwYmQ5ODQ3ZWYgMDNiZmU1MjZlY2FkYzg2ZjMxZWRhNDMzYjkxZGM5MGJlMDU2MzkxOQogMTQ2
MDgyIGZhaWwgOTMzZWJhZDI0NzBhMTY5NTA0Nzk5YTFkOTViOGU0MTBiZDk4NDdlZiA4OTJiOWRj
ZWJkYjdmNjQ2NjU3ZTExY2ZkZDk1YTM4NTEwN2JiZWZhCiAxNDYwODggZmFpbCA5MzNlYmFkMjQ3
MGExNjk1MDQ3OTlhMWQ5NWI4ZTQxMGJkOTg0N2VmIDg5MmI5ZGNlYmRiN2Y2NDY2NTdlMTFjZmRk
OTVhMzg1MTA3YmJlZmEKIDE0NjA4NiBmYWlsIDkzM2ViYWQyNDcwYTE2OTUwNDc5OWExZDk1Yjhl
NDEwYmQ5ODQ3ZWYgODkyYjlkY2ViZGI3ZjY0NjY1N2UxMWNmZGQ5NWEzODUxMDdiYmVmYQogMTQ2
MDg3IHBhc3MgOTMzZWJhZDI0NzBhMTY5NTA0Nzk5YTFkOTViOGU0MTBiZDk4NDdlZiAwM2JmZTUy
NmVjYWRjODZmMzFlZGE0MzNiOTFkYzkwYmUwNTYzOTE5ClNlYXJjaGluZyBmb3IgaW50ZXJlc3Rp
bmcgdmVyc2lvbnMKIFJlc3VsdCBmb3VuZDogZmxpZ2h0IDE0NjA0OCAocGFzcyksIGZvciBiYXNp
cyBwYXNzCiBSZXN1bHQgZm91bmQ6IGZsaWdodCAxNDYwNjggKGZhaWwpLCBmb3IgYmFzaXMgZmFp
bHVyZQogUmVwcm8gZm91bmQ6IGZsaWdodCAxNDYwNzQgKHBhc3MpLCBmb3IgYmFzaXMgcGFzcwog
UmVwcm8gZm91bmQ6IGZsaWdodCAxNDYwODAgKGZhaWwpLCBmb3IgYmFzaXMgZmFpbHVyZQogMCBy
ZXZpc2lvbnMgYXQgOTMzZWJhZDI0NzBhMTY5NTA0Nzk5YTFkOTViOGU0MTBiZDk4NDdlZiAwM2Jm
ZTUyNmVjYWRjODZmMzFlZGE0MzNiOTFkYzkwYmUwNTYzOTE5Ck5vIHJldmlzaW9ucyBsZWZ0IHRv
IHRlc3QsIGNoZWNraW5nIGdyYXBoIHN0YXRlLgogUmVzdWx0IGZvdW5kOiBmbGlnaHQgMTQ2MDQ4
IChwYXNzKSwgZm9yIGxhc3QgcGFzcwogUmVzdWx0IGZvdW5kOiBmbGlnaHQgMTQ2MDgyIChmYWls
KSwgZm9yIGZpcnN0IGZhaWx1cmUKIFJlcHJvIGZvdW5kOiBmbGlnaHQgMTQ2MDgzIChwYXNzKSwg
Zm9yIGxhc3QgcGFzcwogUmVwcm8gZm91bmQ6IGZsaWdodCAxNDYwODYgKGZhaWwpLCBmb3IgZmly
c3QgZmFpbHVyZQogUmVwcm8gZm91bmQ6IGZsaWdodCAxNDYwODcgKHBhc3MpLCBmb3IgbGFzdCBw
YXNzCiBSZXBybyBmb3VuZDogZmxpZ2h0IDE0NjA4OCAoZmFpbCksIGZvciBmaXJzdCBmYWlsdXJl
CgoqKiogRm91bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQgKioqCgogIEJ1ZyBp
cyBpbiB0cmVlOiAgeGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0CiAgQnVnIGludHJv
ZHVjZWQ6ICA4OTJiOWRjZWJkYjdmNjQ2NjU3ZTExY2ZkZDk1YTM4NTEwN2JiZWZhCiAgQnVnIG5v
dCBwcmVzZW50OiAwM2JmZTUyNmVjYWRjODZmMzFlZGE0MzNiOTFkYzkwYmUwNTYzOTE5CiAgTGFz
dCBmYWlsIHJlcHJvOiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MvMTQ2MDg4LwoKCiAgY29tbWl0IDg5MmI5ZGNlYmRiN2Y2NDY2NTdlMTFjZmRkOTVhMzg1
MTA3YmJlZmEKICBBdXRob3I6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBEYXRl
OiAgIFR1ZSBKYW4gMTQgMTI6MDM6NDcgMjAyMCArMDEwMAogIAogICAgICBJUlE6IHUxNiBpcyB0
b28gbmFycm93IGZvciBhbiBldmVudCBjaGFubmVsIG51bWJlcgogICAgICAKICAgICAgRklGTyBl
dmVudCBjaGFubmVscyBhbGxvdyBwb3J0cyB1cCB0byAyXjE3LCBzbyB3ZSBuZWVkIHRvIHVzZSBh
IHdpZGVyCiAgICAgIGZpZWxkIGluIHN0cnVjdCBwaXJxLiBNb3ZlICJtYXNrZWQiIHN1Y2ggdGhh
dCBpdCBtYXkgc2hhcmUgdGhlIDgtYnl0ZQogICAgICBzbG90IHdpdGggc3RydWN0IGFyY2hfcGly
cSBvbiA2NC1iaXQgYXJjaGVzLCByYXRoZXIgdGhhbiBsZWF2aW5nIGEKICAgICAgNy1ieXRlIGhv
bGUgaW4gYWxsIGNhc2VzLgogICAgICAKICAgICAgVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFs
c28gYWRkIGEgY29tbWVudCByZWdhcmRpbmcgImFyY2giIHBsYWNlbWVudAogICAgICB3aXRoaW4g
dGhlIHN0cnVjdHVyZS4KICAgICAgCiAgICAgIFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KICAgICAgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpSZXZpc2lvbiBncmFwaCBsZWZ0IGluIC9ob21lL2xvZ3MvcmVz
dWx0cy9iaXNlY3QveGVuLXVuc3RhYmxlLXNtb2tlL2J1aWxkLWFybTY0LXhzbS54ZW4tYnVpbGQu
e2RvdCxwcyxwbmcsaHRtbCxzdmd9LgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCjE0NjA4ODogdG9sZXJhYmxlIEFMTCBGQUlMCgpmbGlnaHQgMTQ2MDg4IHhlbi11bnN0
YWJsZS1zbW9rZSByZWFsLWJpc2VjdCBbcmVhbF0KaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NjA4OC8KCkZhaWx1cmVzIDotLyBidXQgbm8gcmVncmVz
c2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsCmluY2x1ZGluZyB0ZXN0cyB3aGlj
aCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgNiB4ZW4t
YnVpbGQgICAgICAgICAgICAgICBmYWlsIGJhc2VsaW5lIHVudGVzdGVkCgoKam9iczoKIGJ1aWxk
LWFybTY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJv
amVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMK
CkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9n
cy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRo
ZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1h
aWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0
LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUg
Zm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7
YT1zdW1tYXJ5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
