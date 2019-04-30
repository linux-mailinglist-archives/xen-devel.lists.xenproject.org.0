Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1688F939
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 14:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLS7X-0006SX-Kn; Tue, 30 Apr 2019 12:44:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5T1X=TA=citrix.com=prvs=016a56d21=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLS7W-0006SS-TK
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 12:44:26 +0000
X-Inumbo-ID: ad637f56-6b45-11e9-8250-1b71692af4b1
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad637f56-6b45-11e9-8250-1b71692af4b1;
 Tue, 30 Apr 2019 12:44:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="84746836"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23752.17186.527512.614163@mariner.uk.xensource.com>
Date: Tue, 30 Apr 2019 13:44:18 +0100
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>
In-Reply-To: <osstest-135420-mainreport@xen.org>
References: <osstest-135420-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] linux 4.19 does not build on armhf Re: [linux-4.19
 test] 135420: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltsaW51eC00LjE5IHRlc3RdIDEzNTQyMDog
cmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDEzNTQyMCBsaW51eC00LjE5IHJlYWwgW3Jl
YWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEz
NTQyMC8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2Nl
ZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJl
IHJ1bjoKPiAgYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgNiBrZXJuZWwtYnVpbGQgICAg
ICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI5MzEzCgpodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1NDIwL2J1aWxkLWFybWhmLXB2b3BzLzYudHMta2Vy
bmVsLWJ1aWxkLmxvZwoKICBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmM6IEluIGZ1bmN0aW9u
IMOi4oKsy5xxY29tX3NjbV9hc3NpZ25fbWVtw6LigqzihKI6CiAgZHJpdmVycy9maXJtd2FyZS9x
Y29tX3NjbS5jOjQ2OTo0NzogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiDDouKCrMucZG1h
X2FsbG9jX2NvaGVyZW50w6LigqzihKIgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFst
V2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQogICAgcHRyID0gZG1hX2FsbG9jX2Nv
aGVyZW50KF9fc2NtLT5kZXYsIHB0cl9zeiwgJnB0cl9waHlzLCBHRlBfS0VSTkVMKTsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS5jOjIxOjA6CiAgLi9pbmNsdWRl
L2xpbnV4L2RtYS1tYXBwaW5nLmg6NTYwOjIxOiBub3RlOiBleHBlY3RlZCDDouKCrMucZG1hX2Fk
ZHJfdCAqIHtha2EgbG9uZyBsb25nIHVuc2lnbmVkIGludCAqfcOi4oKs4oSiIGJ1dCBhcmd1bWVu
dCBpcyBvZiB0eXBlIMOi4oKsy5xwaHlzX2FkZHJfdCAqIHtha2EgdW5zaWduZWQgaW50ICp9w6Li
gqzihKIKICAgc3RhdGljIGlubGluZSB2b2lkICpkbWFfYWxsb2NfY29oZXJlbnQoc3RydWN0IGRl
dmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn4KICBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKICBz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMwMzogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZmly
bXdhcmUvcWNvbV9zY20ubycgZmFpbGVkCiAgbWFrZVsyXTogKioqIFtkcml2ZXJzL2Zpcm13YXJl
L3Fjb21fc2NtLm9dIEVycm9yIDEKICBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0NDogcmVjaXBl
IGZvciB0YXJnZXQgJ2RyaXZlcnMvZmlybXdhcmUnIGZhaWxlZAogIG1ha2VbMV06ICoqKiBbZHJp
dmVycy9maXJtd2FyZV0gRXJyb3IgMgogIG1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlz
aGVkIGpvYnMuLi4uCgpJIHRoaW5rIHRoaXMgYnVpbGQgZmFpbHVyZSBpcyBwcm9iYWJseSBhIHJl
Z3Jlc3Npb247IHJhdGhlciBpdCBpcyBkdWUKdG8gdGhlIHN0cmV0Y2ggdXBkYXRlIHdoaWNoIGJy
aW5ncyBpbiBhIG5ldyBjb21waWxlci4KCkhvd2V2ZXIsIEkgd291bGQgcHJlZmVyIHRvIGF2b2lk
IGEgZm9yY2UgcHVzaCBiZWNhdXNlIHRoaXMgYnVpbGQKZmFpbHVyZSBtZWFucyB0aGF0IHRoZSBh
cm1oZiB0ZXN0cyBkaWRuJ3QgcnVuLgoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xY293MiAgICAx
NyBndWVzdC1sb2NhbG1pZ3JhdGUveDEwICAgZmFpbCBSRUdSLiB2cy4gMTI5MzEzCgpUaGlzIGlz
IGEga25vd24gcmVncmVzc2lvbiB3aXRoIHRoZSBzdHJldGNoIHVwZ3JhZGUgYW5kIGlzIG5vdGhp
bmcgdG8KZG8gd2l0aCBsaW51eC00LjE5IChvciBYZW4sIEkgdGhpbmspLgoKPiAgdGVzdC1hbWQ2
NC1hbWQ2NC1saWJ2aXJ0LXZoZCAxNyBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVH
Ui4gdnMuIDEyOTMxMwoKVGhpcyBpcyBhbm90aGVyIGJ1Zywgd2hpY2ggbG9va3MgbGlrZSBpdCBp
cyBhY3R1YWxseSBhIGJ1ZyBpbiBMaW51eAo0LjE5LiAgSSB3aWxsIHNlbmQgYW5vdGhlciBtYWls
IGFib3V0IGl0LgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
