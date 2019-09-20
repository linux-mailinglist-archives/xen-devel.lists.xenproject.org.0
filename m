Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8820B93CE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 17:15:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBKaZ-0008PO-EC; Fri, 20 Sep 2019 15:12:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBKaX-0008PF-Tv
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 15:12:49 +0000
X-Inumbo-ID: 1affa01a-dbb9-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1affa01a-dbb9-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 15:12:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98DD5AD12;
 Fri, 20 Sep 2019 15:12:47 +0000 (UTC)
To: Anthony Perard <anthony.perard@citrix.com>
References: <osstest-141508-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b92b66ab-d5b5-6669-d7ac-da2fd9f91b37@suse.com>
Date: Fri, 20 Sep 2019 17:12:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-141508-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable-smoke test] 141508: regressions -
 trouble: blocked/fail
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxNjo0NSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDE1MDggeGVuLXVuc3RhYmxlLXNtb2tlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTUwOC8KPiAKPiBSZWdyZXNzaW9u
cyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywK
PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgYnVpbGQtYXJtNjQt
eHNtICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTQxMjUzCj4gIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDYgeGVuLWJ1aWxkICAg
ICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MTI1MwoKSnVzdCBGWUksIGluIGNhc2UgeW91
IGRpZG4ndCBub3RpY2UgeWV0OgoKIENDICAgICAgIHhlbmxpZ2h0X3N0dWJzLm8KeGVubGlnaHRf
c3R1YnMuYzogSW4gZnVuY3Rpb24gJ3N0dWJfbGlieGxfZG9tYWluX3BhdXNlJzoKeGVubGlnaHRf
c3R1YnMuYzo2MzI6ODogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRzIHRvIGZ1bmN0aW9uICdsaWJ4
bF9kb21haW5fcGF1c2UnCiAgcmV0ID0gbGlieGxfZG9tYWluX3BhdXNlKENUWCwgY19kb21pZCk7
CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSB4ZW5saWdo
dF9zdHVicy5jOjMwOjA6Ci9ob21lL29zc3Rlc3QvYnVpbGQuMTQxNTA4LmJ1aWxkLWFtZDY0L3hl
bi90b29scy9vY2FtbC9saWJzL3hsLy4uLy4uLy4uLy4uL3Rvb2xzL2xpYnhsL2xpYnhsLmg6MTY0
Mzo1OiBub3RlOiBkZWNsYXJlZCBoZXJlCiBpbnQgbGlieGxfZG9tYWluX3BhdXNlKGxpYnhsX2N0
eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICBefn5+fn5+fn5+fn5+fn5+fn4KeGVubGlnaHRf
c3R1YnMuYzogSW4gZnVuY3Rpb24gJ3N0dWJfbGlieGxfZG9tYWluX3VucGF1c2UnOgp4ZW5saWdo
dF9zdHVicy5jOjY0ODo4OiBlcnJvcjogdG9vIGZldyBhcmd1bWVudHMgdG8gZnVuY3Rpb24gJ2xp
YnhsX2RvbWFpbl91bnBhdXNlJwogIHJldCA9IGxpYnhsX2RvbWFpbl91bnBhdXNlKENUWCwgY19k
b21pZCk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IHhlbmxpZ2h0X3N0dWJzLmM6MzA6MDoKL2hvbWUvb3NzdGVzdC9idWlsZC4xNDE1MDguYnVpbGQt
YW1kNjQveGVuL3Rvb2xzL29jYW1sL2xpYnMveGwvLi4vLi4vLi4vLi4vdG9vbHMvbGlieGwvbGli
eGwuaDoxNjQ2OjU6IG5vdGU6IGRlY2xhcmVkIGhlcmUKIGludCBsaWJ4bF9kb21haW5fdW5wYXVz
ZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsCiAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn4KeGVubGlnaHRfc3R1YnMuYzogSW4gZnVuY3Rpb24gJ3N0dWJfeGxfc2VuZF90cmlnZ2VyJzoK
eGVubGlnaHRfc3R1YnMuYzoxMDQ1Ojg6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5j
dGlvbiAnbGlieGxfc2VuZF90cmlnZ2VyJwogIHJldCA9IGxpYnhsX3NlbmRfdHJpZ2dlcihDVFgs
IGNfZG9taWQsIGNfdHJpZ2dlciwgY192Y3B1aWQpOwogICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20geGVubGlnaHRfc3R1YnMuYzozMDowOgovaG9tZS9vc3N0
ZXN0L2J1aWxkLjE0MTUwOC5idWlsZC1hbWQ2NC94ZW4vdG9vbHMvb2NhbWwvbGlicy94bC8uLi8u
Li8uLi8uLi90b29scy9saWJ4bC9saWJ4bC5oOjI0MDg6NTogbm90ZTogZGVjbGFyZWQgaGVyZQog
aW50IGxpYnhsX3NlbmRfdHJpZ2dlcihsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsCiAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+Ci9ob21lL29zc3Rlc3QvYnVpbGQuMTQxNTA4LmJ1aWxkLWFt
ZDY0L3hlbi90b29scy9vY2FtbC9saWJzL3hsLy4uLy4uL01ha2VmaWxlLnJ1bGVzOjM3OiByZWNp
cGUgZm9yIHRhcmdldCAneGVubGlnaHRfc3R1YnMubycgZmFpbGVkCm1ha2VbN106IExlYXZpbmcg
ZGlyZWN0b3J5ICcvaG9tZS9vc3N0ZXN0L2J1aWxkLjE0MTUwOC5idWlsZC1hbWQ2NC94ZW4vdG9v
bHMvb2NhbWwvbGlicy94bCcKbWFrZVs3XTogKioqIFt4ZW5saWdodF9zdHVicy5vXSBFcnJvciAx
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
