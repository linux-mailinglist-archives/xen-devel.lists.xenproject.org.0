Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF2F6BE1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 00:41:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTwm2-0002d7-Tj; Sun, 10 Nov 2019 23:37:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HB8c=ZC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iTwm1-0002cx-Eo
 for xen-devel@lists.xenproject.org; Sun, 10 Nov 2019 23:37:37 +0000
X-Inumbo-ID: 1302d922-0413-11ea-9631-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1302d922-0413-11ea-9631-bc764e2007e4;
 Sun, 10 Nov 2019 23:37:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iTwlz-0007Dm-Fy; Sun, 10 Nov 2019 23:37:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iTwlz-00057V-4a; Sun, 10 Nov 2019 23:37:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iTwlz-0000fI-3r; Sun, 10 Nov 2019 23:37:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iTwlz-0000fI-3r@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Nov 2019 23:37:35 +0000
Subject: [Xen-devel] [freebsd-master bisection] complete build-amd64-freebsd
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

YnJhbmNoIHhlbi11bnN0YWJsZQp4ZW5icmFuY2ggeGVuLXVuc3RhYmxlCmpvYiBidWlsZC1hbWQ2
NC1mcmVlYnNkCnRlc3RpZCBmcmVlYnNkLWJ1aWxkCgpUcmVlOiBmcmVlYnNkIGdpdDovL2dpdGh1
Yi5jb20vZnJlZWJzZC9mcmVlYnNkLmdpdAoKKioqIEZvdW5kIGFuZCByZXByb2R1Y2VkIHByb2Js
ZW0gY2hhbmdlc2V0ICoqKgoKICBCdWcgaXMgaW4gdHJlZTogIGZyZWVic2QgZ2l0Oi8vZ2l0aHVi
LmNvbS9mcmVlYnNkL2ZyZWVic2QuZ2l0CiAgQnVnIGludHJvZHVjZWQ6ICA3ZjgzODQ0NjE3YjNj
YWIyMDdlODE0YjNmMTM1MWRiODNjYTJiZTI5CiAgQnVnIG5vdCBwcmVzZW50OiBkNGNkODc0N2U2
MmIzMzAxOWEyZjNhZDJhMmVlOTdhNTBiZmI2YWUyCiAgTGFzdCBmYWlsIHJlcHJvOiBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQzOTk3LwoKCiAgY29t
bWl0IDdmODM4NDQ2MTdiM2NhYjIwN2U4MTRiM2YxMzUxZGI4M2NhMmJlMjkKICBBdXRob3I6IGdq
YiA8Z2piQEZyZWVCU0Qub3JnPgogIERhdGU6ICAgVGh1IFNlcCAxOSAxNjo0MzoxMiAyMDE5ICsw
MDAwCiAgCiAgICAgIEFwcGx5IHIzNDY3OTIgKGNwZXJjaXZhKSBmcm9tIHN0YWJsZS8xMiB0byBo
ZWFkLiAgVGhlIG9yaWdpbmFsIGNvbW1pdAogICAgICBtZXNzYWdlOgogICAgICAKICAgICAgIE9u
IG5vbi14ODYgc3lzdGVtcywgdXNlICJxdWFydGVybHkiIHBhY2thZ2VzLgogICAgICAKICAgICAg
IHg4NiBhcmNoaXRlY3R1cmVzIGhhdmUgImxhdGVzdCIgcGFja2FnZSBidWlsZHMgb24gc3RhYmxl
LyosIHNvIGtlZXAgdXNpbmcKICAgICAgIHRob3NlICh0aGV5J2xsIGdldCBzd2l0Y2hlZCBvdmVy
IHRvICJxdWFydGVybHkiIGR1cmluZyByZWxlYXNlcykuCiAgICAgIAogICAgICBUaGUgb3JpZ2lu
YWwgY29tbWl0IHdhcyBhIGRpcmVjdCBjb21taXQgdG8gc3RhYmxlLzEyLCBhcyBhdCB0aGUgdGlt
ZSBpdAogICAgICB3YXMgcHJlc3VtZWQgaXQgd291bGQgbm90IGJlIG5lY2Vzc2FyeSBmb3IgaGVh
ZC4gIEhvd2V2ZXIsIHdoZW4gaXQgaXMgdGltZQogICAgICB0byBjcmVhdGUgYSByZWxlbmcgYnJh
bmNoIG9yIHN3aXRjaCBmcm9tIFBSRVJFTEVBU0UvU1RBQkxFIHRvIEJFVEEvUkMsIHRoZQogICAg
ICBwa2coNykgTWFrZWZpbGUgbmVlZHMgZnVydGhlciBhZGp1c3RpbmcuICBUaGlzIGNvbW1pdCBp
bmNsdWRlcyB0aG9zZQogICAgICBmdXJ0aGVyIGFkanVzdG1lbnRzLCBldmFsdWF0aW5nIHRoZSBC
UkFOQ0ggdmFyaWFibGUgZnJvbSByZWxlYXNlL01ha2VmaWxlCiAgICAgIHRvIGRldGVybWluZSB0
aGUgcGtnKDcpIHJlcG9zaXRvcnkgdG8gdXNlLgogICAgICAKICAgICAgTUZDIGFmdGVyOiAgICAg
IGltbWVkaWF0ZSAoaWYgcG9zc2libGUpCiAgICAgIFNwb25zb3JlZCBieTogICBSdWJpY29uIENv
bW11bmljYXRpb25zLCBMTEMgKE5ldGdhdGUpCgoKRm9yIGJpc2VjdGlvbiByZXZpc2lvbi10dXBs
ZSBncmFwaCBzZWU6CiAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvcmVzdWx0cy9iaXNlY3QvZnJlZWJzZC1tYXN0ZXIvYnVpbGQtYW1kNjQtZnJlZWJzZC5mcmVl
YnNkLWJ1aWxkLmh0bWwKUmV2aXNpb24gSURzIGluIGVhY2ggZ3JhcGggbm9kZSByZWZlciwgcmVz
cGVjdGl2ZWx5LCB0byB0aGUgVHJlZXMgYWJvdmUuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tClJ1bm5pbmcgY3MtYmlzZWN0aW9uLXN0ZXAgLS1ncmFwaC1vdXQ9L2hv
bWUvbG9ncy9yZXN1bHRzL2Jpc2VjdC9mcmVlYnNkLW1hc3Rlci9idWlsZC1hbWQ2NC1mcmVlYnNk
LmZyZWVic2QtYnVpbGQgLS1zdW1tYXJ5LW91dD10bXAvMTQzOTk3LmJpc2VjdGlvbi1zdW1tYXJ5
IC0tYmFzaXMtdGVtcGxhdGU9MTQxNTAxIC0tYmxlc3NpbmdzPXJlYWwscmVhbC1iaXNlY3QgZnJl
ZWJzZC1tYXN0ZXIgYnVpbGQtYW1kNjQtZnJlZWJzZCBmcmVlYnNkLWJ1aWxkClNlYXJjaGluZyBm
b3IgZmFpbHVyZSAvIGJhc2lzIHBhc3M6CiAxNDM5MjcgZmFpbCBbaG9zdD1odXhlbHJlYmUxXSAv
IDE0MTUwMSBbaG9zdD1yaW1hdmExXSAxNDE0MjAgb2suCkZhaWx1cmUgLyBiYXNpcyBwYXNzIGZs
aWdodHM6IDE0MzkyNyAvIDE0MTQyMApUcmVlOiBmcmVlYnNkIGdpdDovL2dpdGh1Yi5jb20vZnJl
ZWJzZC9mcmVlYnNkLmdpdApMYXRlc3QgYTg1YWU3OGFkNzBmYzA3MTE3NWJkMmE4Nzg5YzU3OGZh
Zjc5ODVjZgpCYXNpcyBwYXNzIDJmYTM0NzljZmFkYjBiYjNmZTY5NGRiZmQyOWYyMzUwZWIyNTcw
ZGYKR2VuZXJhdGluZyByZXZpc2lvbnMgd2l0aCAuL2FkaG9jLXJldnR1cGxlLWdlbmVyYXRvciAg
Z2l0Oi8vZ2l0aHViLmNvbS9mcmVlYnNkL2ZyZWVic2QuZ2l0IzJmYTM0NzljZmFkYjBiYjNmZTY5
NGRiZmQyOWYyMzUwZWIyNTcwZGYtYTg1YWU3OGFkNzBmYzA3MTE3NWJkMmE4Nzg5YzU3OGZhZjc5
ODVjZgpGcm9tIGdpdDovL2NhY2hlOjk0MTkvZ2l0Oi8vZ2l0aHViLmNvbS9mcmVlYnNkL2ZyZWVi
c2QKICAgMTI4MjczOThjZDEuLjA5NjBmZmZkMTk5ICBtYXN0ZXIgICAgIC0+IG9yaWdpbi9tYXN0
ZXIKICAgNWZlNTIyN2JiYTEuLmFiN2UwYWI4YjFhICBzdm5faGVhZCAgIC0+IG9yaWdpbi9zdm5f
aGVhZApBdXRvIHBhY2tpbmcgdGhlIHJlcG9zaXRvcnkgaW4gYmFja2dyb3VuZCBmb3Igb3B0aW11
bSBwZXJmb3JtYW5jZS4KU2VlICJnaXQgaGVscCBnYyIgZm9yIG1hbnVhbCBob3VzZWtlZXBpbmcu
CmVycm9yOiBUaGUgbGFzdCBnYyBydW4gcmVwb3J0ZWQgdGhlIGZvbGxvd2luZy4gUGxlYXNlIGNv
cnJlY3QgdGhlIHJvb3QgY2F1c2UKYW5kIHJlbW92ZSBnYy5sb2cuCkF1dG9tYXRpYyBjbGVhbnVw
IHdpbGwgbm90IGJlIHBlcmZvcm1lZCB1bnRpbCB0aGUgZmlsZSBpcyByZW1vdmVkLgoKd2Fybmlu
ZzogVGhlcmUgYXJlIHRvbyBtYW55IHVucmVhY2hhYmxlIGxvb3NlIG9iamVjdHM7IHJ1biAnZ2l0
IHBydW5lJyB0byByZW1vdmUgdGhlbS4KCkF1dG8gcGFja2luZyB0aGUgcmVwb3NpdG9yeSBpbiBi
YWNrZ3JvdW5kIGZvciBvcHRpbXVtIHBlcmZvcm1hbmNlLgpTZWUgImdpdCBoZWxwIGdjIiBmb3Ig
bWFudWFsIGhvdXNla2VlcGluZy4KZXJyb3I6IFRoZSBsYXN0IGdjIHJ1biByZXBvcnRlZCB0aGUg
Zm9sbG93aW5nLiBQbGVhc2UgY29ycmVjdCB0aGUgcm9vdCBjYXVzZQphbmQgcmVtb3ZlIGdjLmxv
Zy4KQXV0b21hdGljIGNsZWFudXAgd2lsbCBub3QgYmUgcGVyZm9ybWVkIHVudGlsIHRoZSBmaWxl
IGlzIHJlbW92ZWQuCgp3YXJuaW5nOiBUaGVyZSBhcmUgdG9vIG1hbnkgdW5yZWFjaGFibGUgbG9v
c2Ugb2JqZWN0czsgcnVuICdnaXQgcHJ1bmUnIHRvIHJlbW92ZSB0aGVtLgoKTG9hZGVkIDUwMjEg
bm9kZXMgaW4gcmV2aXNpb24gZ3JhcGgKU2VhcmNoaW5nIGZvciB0ZXN0IHJlc3VsdHM6CiAxNDE0
MjAgcGFzcyAyZmEzNDc5Y2ZhZGIwYmIzZmU2OTRkYmZkMjlmMjM1MGViMjU3MGRmCiAxNDE1MDEg
W2hvc3Q9cmltYXZhMV0KIDE0MTcwMSBmYWlsIDU4ZmYwN2YxNDc3MTA4MTU5OTNjZWVjOTYzYzRj
ZjgxMzQwYjYzODMKIDE0MTgxMSBmYWlsIDU5NjllZjNjOGM4MWNiYzMyN2U3ZDFlNzRlZGUzYzRi
NjRkZjcxMzMKIDE0MTg5NSBmYWlsIDBlZWRkYzI1NzFhOWZlMTliZDBlZmRiOWVjNjAyYzk0ODdj
ZWI3YjUKIDE0MjAyMyBmYWlsIGI2NmQ2ZGVmZTJlMmU5YWExYjRkMDVjZTk4MjE4ODQ3OWY4NGJl
ZmYKIDE0MjMwNiBbaG9zdD1odXhlbHJlYmUwXQogMTQyMjY0IFtob3N0PWh1eGVscmViZTBdCiAx
NDIyNzkgW2hvc3Q9aHV4ZWxyZWJlMF0KIDE0MjMxMCBbaG9zdD1odXhlbHJlYmUwXQogMTQyMzE2
IFtob3N0PWh1eGVscmViZTBdCiAxNDIzMjIgW2hvc3Q9aHV4ZWxyZWJlMF0KIDE0MjM5MiBmYWls
IGJkOGU5ZDEyYjE4MTg3OTYyMjM0NDA3YzNlNDRlOWViMzRlODU1ZDEKIDE0MjQ4OCBmYWlsIDZi
ZjkzM2M0MzQ1MGUxYTIyMWFjZTNlMmViMjRkNDBjM2NhMGFlNDcKIDE0MjU5NSBbaG9zdD1odXhl
bHJlYmUwXQogMTQyNzM5IFtob3N0PWh1eGVscmViZTBdCiAxNDI4MDMgZmFpbCAxMjQzNGIwYTM2
MjAzMzJmZTNjZGZiMjFkYjJhMzQ4ZTZmNjg5YjVmCiAxNDI4NjggZmFpbCBjNDA0ZTViNGYxYjgy
MjQ0N2ViNDJkYWQ2NmEyNjQ0OTM3YjIwZTM5CiAxNDMwMDEgW2hvc3Q9aHV4ZWxyZWJlMF0KIDE0
MzE1MyBmYWlsIGY1OGMyMTcxZDg3OGQzNDAyYmM0ZmEwNWQwYmJlOGU3YTZjMjRlMzEKIDE0MzA1
OSBbaG9zdD1odXhlbHJlYmUwXQogMTQzMjcyIGZhaWwgNGMzZGQ0ZTMxOTY2YTkyZTFiYjcyOWJj
NDY3OGZjOWE4OTA2YzdlZQogMTQzMzk3IGZhaWwgM2Q0MDE0NzI4MjY3MGQ1OTdiMzM2YmU1NTk5
YjVjYzRjMmZmN2RkZAogMTQzNTE2IFtob3N0PWh1eGVscmViZTBdCiAxNDM3MDQgW2hvc3Q9aHV4
ZWxyZWJlMF0KIDE0Mzg3MCBmYWlsIDc4YzI3OWI1YjljMzkzZGFlMzA3ZjllNjE0OWRmZDQ5ZDE0
ZjYzYWUKIDE0MzkzMCBwYXNzIDJmYTM0NzljZmFkYjBiYjNmZTY5NGRiZmQyOWYyMzUwZWIyNTcw
ZGYKIDE0Mzk2MCBmYWlsIGE4NWFlNzhhZDcwZmMwNzExNzViZDJhODc4OWM1NzhmYWY3OTg1Y2YK
IDE0MzkyNyBmYWlsIGE4NWFlNzhhZDcwZmMwNzExNzViZDJhODc4OWM1NzhmYWY3OTg1Y2YKIDE0
Mzk1NiBmYWlsIDc4YzI3OWI1YjljMzkzZGFlMzA3ZjllNjE0OWRmZDQ5ZDE0ZjYzYWUKIDE0Mzk5
MCBwYXNzIGQ0Y2Q4NzQ3ZTYyYjMzMDE5YTJmM2FkMmEyZWU5N2E1MGJmYjZhZTIKIDE0Mzk5MiBm
YWlsIDdmODM4NDQ2MTdiM2NhYjIwN2U4MTRiM2YxMzUxZGI4M2NhMmJlMjkKIDE0Mzk5NSBwYXNz
IGQ0Y2Q4NzQ3ZTYyYjMzMDE5YTJmM2FkMmEyZWU5N2E1MGJmYjZhZTIKIDE0Mzk3MCBmYWlsIDM1
Y2EyNjA2MzgyY2JhMTM3ODUwYmEwYzE3MDdjZThmZWE3NjU0NzgKIDE0Mzk3NCBwYXNzIGQ0Y2Q4
NzQ3ZTYyYjMzMDE5YTJmM2FkMmEyZWU5N2E1MGJmYjZhZTIKIDE0Mzk5NyBmYWlsIDdmODM4NDQ2
MTdiM2NhYjIwN2U4MTRiM2YxMzUxZGI4M2NhMmJlMjkKIDE0Mzk3OCBmYWlsIDEwZjNiZWZmYzY0
ODQ0ZDBhMWVhZmRlZWI2MjM1NjVlNzgwY2FiYjkKIDE0Mzk4MiBmYWlsIDg0M2EyY2FjODk1NTg0
OTIyN2MyZThjNjBjOGQzYWE3MWUxMzU0YmIKIDE0Mzk4NCBmYWlsIGFkYjY1ZDc0MTZiMjMzNmNj
NzU4MjkyOTkyOTMxNGFiZjZjNDQ5NWEKIDE0Mzk4NiBmYWlsIDdmODM4NDQ2MTdiM2NhYjIwN2U4
MTRiM2YxMzUxZGI4M2NhMmJlMjkKU2VhcmNoaW5nIGZvciBpbnRlcmVzdGluZyB2ZXJzaW9ucwog
UmVzdWx0IGZvdW5kOiBmbGlnaHQgMTQxNDIwIChwYXNzKSwgZm9yIGJhc2lzIHBhc3MKIFJlc3Vs
dCBmb3VuZDogZmxpZ2h0IDE0MzkyNyAoZmFpbCksIGZvciBiYXNpcyBmYWlsdXJlCiBSZXBybyBm
b3VuZDogZmxpZ2h0IDE0MzkzMCAocGFzcyksIGZvciBiYXNpcyBwYXNzCiBSZXBybyBmb3VuZDog
ZmxpZ2h0IDE0Mzk2MCAoZmFpbCksIGZvciBiYXNpcyBmYWlsdXJlCiAwIHJldmlzaW9ucyBhdCBk
NGNkODc0N2U2MmIzMzAxOWEyZjNhZDJhMmVlOTdhNTBiZmI2YWUyCk5vIHJldmlzaW9ucyBsZWZ0
IHRvIHRlc3QsIGNoZWNraW5nIGdyYXBoIHN0YXRlLgogUmVzdWx0IGZvdW5kOiBmbGlnaHQgMTQz
OTc0IChwYXNzKSwgZm9yIGxhc3QgcGFzcwogUmVzdWx0IGZvdW5kOiBmbGlnaHQgMTQzOTg2IChm
YWlsKSwgZm9yIGZpcnN0IGZhaWx1cmUKIFJlcHJvIGZvdW5kOiBmbGlnaHQgMTQzOTkwIChwYXNz
KSwgZm9yIGxhc3QgcGFzcwogUmVwcm8gZm91bmQ6IGZsaWdodCAxNDM5OTIgKGZhaWwpLCBmb3Ig
Zmlyc3QgZmFpbHVyZQogUmVwcm8gZm91bmQ6IGZsaWdodCAxNDM5OTUgKHBhc3MpLCBmb3IgbGFz
dCBwYXNzCiBSZXBybyBmb3VuZDogZmxpZ2h0IDE0Mzk5NyAoZmFpbCksIGZvciBmaXJzdCBmYWls
dXJlCgoqKiogRm91bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQgKioqCgogIEJ1
ZyBpcyBpbiB0cmVlOiAgZnJlZWJzZCBnaXQ6Ly9naXRodWIuY29tL2ZyZWVic2QvZnJlZWJzZC5n
aXQKICBCdWcgaW50cm9kdWNlZDogIDdmODM4NDQ2MTdiM2NhYjIwN2U4MTRiM2YxMzUxZGI4M2Nh
MmJlMjkKICBCdWcgbm90IHByZXNlbnQ6IGQ0Y2Q4NzQ3ZTYyYjMzMDE5YTJmM2FkMmEyZWU5N2E1
MGJmYjZhZTIKICBMYXN0IGZhaWwgcmVwcm86IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xNDM5OTcvCgpBdXRvIHBhY2tpbmcgdGhlIHJlcG9zaXRvcnkg
aW4gYmFja2dyb3VuZCBmb3Igb3B0aW11bSBwZXJmb3JtYW5jZS4KU2VlICJnaXQgaGVscCBnYyIg
Zm9yIG1hbnVhbCBob3VzZWtlZXBpbmcuCmVycm9yOiBUaGUgbGFzdCBnYyBydW4gcmVwb3J0ZWQg
dGhlIGZvbGxvd2luZy4gUGxlYXNlIGNvcnJlY3QgdGhlIHJvb3QgY2F1c2UKYW5kIHJlbW92ZSBn
Yy5sb2cuCkF1dG9tYXRpYyBjbGVhbnVwIHdpbGwgbm90IGJlIHBlcmZvcm1lZCB1bnRpbCB0aGUg
ZmlsZSBpcyByZW1vdmVkLgoKd2FybmluZzogVGhlcmUgYXJlIHRvbyBtYW55IHVucmVhY2hhYmxl
IGxvb3NlIG9iamVjdHM7IHJ1biAnZ2l0IHBydW5lJyB0byByZW1vdmUgdGhlbS4KCgogIGNvbW1p
dCA3ZjgzODQ0NjE3YjNjYWIyMDdlODE0YjNmMTM1MWRiODNjYTJiZTI5CiAgQXV0aG9yOiBnamIg
PGdqYkBGcmVlQlNELm9yZz4KICBEYXRlOiAgIFRodSBTZXAgMTkgMTY6NDM6MTIgMjAxOSArMDAw
MAogIAogICAgICBBcHBseSByMzQ2NzkyIChjcGVyY2l2YSkgZnJvbSBzdGFibGUvMTIgdG8gaGVh
ZC4gIFRoZSBvcmlnaW5hbCBjb21taXQKICAgICAgbWVzc2FnZToKICAgICAgCiAgICAgICBPbiBu
b24teDg2IHN5c3RlbXMsIHVzZSAicXVhcnRlcmx5IiBwYWNrYWdlcy4KICAgICAgCiAgICAgICB4
ODYgYXJjaGl0ZWN0dXJlcyBoYXZlICJsYXRlc3QiIHBhY2thZ2UgYnVpbGRzIG9uIHN0YWJsZS8q
LCBzbyBrZWVwIHVzaW5nCiAgICAgICB0aG9zZSAodGhleSdsbCBnZXQgc3dpdGNoZWQgb3ZlciB0
byAicXVhcnRlcmx5IiBkdXJpbmcgcmVsZWFzZXMpLgogICAgICAKICAgICAgVGhlIG9yaWdpbmFs
IGNvbW1pdCB3YXMgYSBkaXJlY3QgY29tbWl0IHRvIHN0YWJsZS8xMiwgYXMgYXQgdGhlIHRpbWUg
aXQKICAgICAgd2FzIHByZXN1bWVkIGl0IHdvdWxkIG5vdCBiZSBuZWNlc3NhcnkgZm9yIGhlYWQu
ICBIb3dldmVyLCB3aGVuIGl0IGlzIHRpbWUKICAgICAgdG8gY3JlYXRlIGEgcmVsZW5nIGJyYW5j
aCBvciBzd2l0Y2ggZnJvbSBQUkVSRUxFQVNFL1NUQUJMRSB0byBCRVRBL1JDLCB0aGUKICAgICAg
cGtnKDcpIE1ha2VmaWxlIG5lZWRzIGZ1cnRoZXIgYWRqdXN0aW5nLiAgVGhpcyBjb21taXQgaW5j
bHVkZXMgdGhvc2UKICAgICAgZnVydGhlciBhZGp1c3RtZW50cywgZXZhbHVhdGluZyB0aGUgQlJB
TkNIIHZhcmlhYmxlIGZyb20gcmVsZWFzZS9NYWtlZmlsZQogICAgICB0byBkZXRlcm1pbmUgdGhl
IHBrZyg3KSByZXBvc2l0b3J5IHRvIHVzZS4KICAgICAgCiAgICAgIE1GQyBhZnRlcjogICAgICBp
bW1lZGlhdGUgKGlmIHBvc3NpYmxlKQogICAgICBTcG9uc29yZWQgYnk6ICAgUnViaWNvbiBDb21t
dW5pY2F0aW9ucywgTExDIChOZXRnYXRlKQoKZG90OiBncmFwaCBpcyB0b28gbGFyZ2UgZm9yIGNh
aXJvLXJlbmRlcmVyIGJpdG1hcHMuIFNjYWxpbmcgYnkgMC40Mzc4OTggdG8gZml0CnBubXRvcG5n
OiA0NSBjb2xvcnMgZm91bmQKUmV2aXNpb24gZ3JhcGggbGVmdCBpbiAvaG9tZS9sb2dzL3Jlc3Vs
dHMvYmlzZWN0L2ZyZWVic2QtbWFzdGVyL2J1aWxkLWFtZDY0LWZyZWVic2QuZnJlZWJzZC1idWls
ZC57ZG90LHBzLHBuZyxodG1sLHN2Z30uCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KMTQzOTk3OiB0b2xlcmFibGUgQUxMIEZBSUwKCmZsaWdodCAxNDM5OTcgZnJlZWJz
ZC1tYXN0ZXIgcmVhbC1iaXNlY3QgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xNDM5OTcvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJlZ3Jlc3Np
b25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLAppbmNsdWRpbmcgdGVzdHMgd2hpY2gg
Y291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgIDcgZnJlZWJz
ZC1idWlsZCAgICAgICAgICAgZmFpbCBiYXNlbGluZSB1bnRlc3RlZAoKCmpvYnM6CiBidWlsZC1h
bWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFp
bCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpM
b2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVz
ZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWls
O2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5n
aXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZv
dW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9
c3VtbWFyeQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
