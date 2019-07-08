Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011062B79
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 00:31:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkc7V-00050C-DJ; Mon, 08 Jul 2019 22:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hkc7U-000504-IK
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 22:28:24 +0000
X-Inumbo-ID: b1dc4228-a1cf-11e9-8e08-abb65c9c27fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1dc4228-a1cf-11e9-8e08-abb65c9c27fa;
 Mon, 08 Jul 2019 22:28:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC1D720656;
 Mon,  8 Jul 2019 22:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562624902;
 bh=AXXs4RXl1DgSOEzGgSA6ofAcyOpkcDilUuIrbMS1xSc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=wa4a9zyZ4JaHUyaWEg6AM8i5osD/GMID0ZRo1yTY7jcpjqDeQAs0Qr+8/xYZxhudQ
 97Z5ADytGjMtEMJRbkKfAv2M0sTFL+DZNQaPlrlBkDtrarF+VIlo4BWbhBuKd0QcQx
 IKgUy6d5QPhL8UEY8pT/yt8G6W+thoruZP5whbbg=
Date: Mon, 8 Jul 2019 17:28:16 -0500 (CDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Will Abele <will.abele@starlab.io>
In-Reply-To: <20190706211048.uvilbrefroxroli3@starlab.io>
Message-ID: <alpine.DEB.2.21.1907081552310.3099@sstabellini-ThinkPad-T480s>
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
 <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
 <20190706211048.uvilbrefroxroli3@starlab.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <Julien.Grall@arm.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCA2IEp1bCAyMDE5LCBXaWxsIEFiZWxlIHdyb3RlOgo+IFRoZSAwNy8wNi8yMDE5IDE4
OjE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMDYvMDcvMjAxOSAxOTox
NywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiAKPiA+ID4gCj4gPiA+IE9uIDA2LzA3LzIwMTkg
MTk6MDIsIFdpbGwgQWJlbGUgd3JvdGU6Cj4gPiA+PiBGcm9tOiBXaWxsIEFiZWxlIDx3aWxsLmFi
ZWxlQHN0YXJsYWIuaW8+Cj4gPiA+Pgo+ID4gPj4gSGksCj4gPiA+IAo+ID4gPiBIaSwKPiA+ID4g
Cj4gPiA+PiBJJ3ZlIGJlZW4gdXNpbmcgZG9tMGxlc3MgWGVuIG9uIHRoZSBIaWtleSA5NjAgd2l0
aCBhIDQuMTQgTGludXggCj4gPiA+PiBLZXJuZWwuIEkgaGFkCj4gPiA+PiB0cm91YmxlIGdldHRp
bmcgdGhlIDQuMTQgTGludXggS2VybmVsIHRvIGJvb3QgYXMgYSBkb20wbGVzcyBkb21VIAo+ID4g
Pj4gYmVjYXVzZSBpdCB3YXMKPiA+ID4+IG1pc2ludGVycHJldGluZyB0aGUgZGV2aWNlIHRyZWUg
dmVyc2lvbi4gTGludXggNC4xNCBhbmQgZWFybGllciAKPiA+ID4+IGludGVycHJldCBkZXZpY2UK
PiA+ID4+IHRyZWVzIHdpdGggYSAiLyIgaW4gdGhlIHJvb3Qgbm9kZSBhcyB2ZXJzaW9uIDE2LiBY
ZW4gcHJvZHVjZXMgYSAKPiA+ID4+IHZlcnNpb24gMTcKPiA+ID4+IGRldmljZSB0cmVlLCBzbyB0
aGUgcm9vdCBub2RlIG5lZWRzIHRvIGJlICIiIHRvIHdvcmsgd2l0aCA0LjE0IGFuZCAKPiA+ID4+
IGVhcmxpZXIgTGludXgKPiA+ID4+IEtlcm5lbHMuIExpbnV4IDQuMTUgYW5kIGxhdGVyIGFzc3Vt
ZSB0aGF0IHRoZSB2ZXJzaW9uIGlzIDE3LCBzbyB0aGlzIAo+ID4gPj4gcGF0Y2ggZG9lcwo+ID4g
Pj4gbm90IGhhdmUgYW55IGltcGFjdC4KPiA+ID4+Cj4gPiA+PiBQbGVhc2UgbGV0IG1lIGtub3cg
aWYgeW91IG5lZWQgYW55IG1vcmUgaW5mb3JtYXRpb24gb3IgaGF2ZSAKPiA+ID4+IHN1Z2dlc3Rp
b25zIGZvcgo+ID4gPj4gb3RoZXIgd2F5cyB0byBoYW5kbGUgdGhpcy4KPiA+ID4gCj4gPiA+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aGVyZSB0aGUgdmVyc2lvbiBjb21lcyBmcm9tLiBJIGFsc28gZG9u
J3QgdW5kZXJzdGFuZCAKPiA+ID4gaG93IHlvdSBpbmZlcnJlZCB0aGF0IFhlbiBpcyBjcmVhdGlu
ZyBhIHZlcnNpb24gMTcgZGV2aWNlLXRyZWUuCj4gPiA+IAo+ID4gPiBEbyB5b3UgaGF2ZSBsaW5r
IHRvIHRoZSBwYXJhZ3JhcGggaW4gdGhlIHNwZWNpZmljYXRpb25zPwo+ID4gCj4gPiBBbHNvLCBw
bGVhc2UgZXhwYW5kIHdoYXQgaXMgdGhlIGV4YWN0IGVycm9yLiBTbyB3ZSBjYW4gdW5kZXJzdGFu
ZCAKPiA+IHdoZXRoZXIgdGhpcyBpcyB0aGUgcmlnaHQgZml4Lgo+ID4gCj4gPiBDaGVlcnMsCj4g
PiAKPiA+IC0tIAo+ID4gSnVsaWVuIEdyYWxsCj4gCj4gLS0gCj4gCj4gSGkgSnVsaWVuLAo+IAo+
IFRoYW5rcyBmb3IgdGhlIHByb21wdCByZXNwb25zZS4KPiAKPiBJIHNhaWQgaW4gbXkgbWVzc2Fn
ZSB0aGF0IExpbnV4IHdhcyBpbnRlcnByZXRpbmcgdGhlIGRldmljZSB0cmVlIGFzIHZlcnNpb24g
MTYuCj4gTG9va2luZyB0aHJvdWdoIHRoZSBjb2RlIGFnYWluLCBJIHJlYWxpemUgaXQgd2FzIGJl
aW5nIGludGVycHJldGVkIGFzIGVhcmxpZXIKPiB0aGFuIDE2LiBBcyBtZW50aW9uZWQgaW4gTGlu
dXggY29tbWl0IGE3ZTRjZmIwYTdjYTQ3NzNlN2QwZGQxZDljMDE4YWIyN2ExNTM2MGUsCj4gTGlu
dXggaGFkIGFscmVhZHkgYnJva2VuIHN1cHBvcnQgZm9yIEZEVCB2ZXJzaW9ucyBlYXJsaWVyIHRo
YW4gMTYuCj4gcG9wdWxhdGVfbm9kZSgpIGluIGRyaXZlcnMvb2YvZmR0LmMgd291bGQgc3RvcCBw
YXJzaW5nIHRoZSBmZHQgYXQgdGhlIHJvb3Qgbm9kZQo+IGlmIGl0IHRob3VnaHQgdGhlIGZkdCB2
ZXJzaW9uIHdhcyBlYXJsaWVyIHRoYW4gMTYuCj4gCj4gWGVuIHNldHMgdGhlIEZEVCB2ZXJzaW9u
IHRvIDE3IGluIGZkdF9jcmVhdGUoKS4KPiAKPiBUaGUgaXNzdWUgSSB3YXMgaGF2aW5nIHdhcyB0
aGF0IExpbnV4IHBhbmlja2VkIHdoaWxlIGluaXRpYWxpemluZyBpbnRlcnJ1cHRzCj4gYmVjYXVz
ZSBpdCBjb3VsZCBub3QgZmluZCBhbiBpbnRlcnJ1cHQgY29udHJvbGxlci4gSXQgY291bGRuJ3Qg
ZmluZCB0aGUKPiBpbnRlcnJ1cHQgY29udHJvbGxlciBiZWNhdXNlIGl0IGRpZG4ndCBwcm9jZXNz
IHRoYXQgcGFydCBvZiB0aGUgZGV2aWNlIHRyZWUuCgpUaGFuayB5b3UsIFdpbGwhIEFuZCBpdCBp
cyBncmVhdCB0byBoZWFyIHRoYXQgeW91IGFyZSB1c2luZyBkb20wbGVzcyA6KQoKSSBjb3VsZG4n
dCBmaW5kIHRoZSBzcGVjaWZpYyByZWZlcmVuY2UgdG8gdGhlIHNwZWMsIGJ1dCBJIGNvdWxkIHZl
cmlmeQp0aGF0IHRoZSBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgZm9yIExpbnV4IDQuMTQsIHdoaWxl
IGl0IGlzIHVubmVlZGVkIGZvcgpuZXdlciBMaW51eCB2ZXJzaW9ucyAodGhleSBzdGlsbCB3b3Jr
IHdpdGggdGhlIHBhdGNoKS4gQWxzbyB3ZSBhbHJlYWR5CnN0YXJ0IGVtcHR5IGRldmljZSB0cmVl
IHVzaW5nICIiIGluc3RlYWQgb2YgIi8iIGluIGEgZmV3IG90aGVyIHBsYWNlcy4gSQp3b3VsZCBs
b3ZlIHRvIGhhdmUgdGhlIHJpZ2h0IHJlZmVyZW5jZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhv
dWdoLgoKRllJIHdlIGFsc28gaGF2ZSBhbm90aGVyIGluc3RhbmNlIG9mIGZkdF9iZWdpbl9ub2Rl
KGZkdCwgIi8iKSBpbgp4ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYyB0aGF0IG5lZWRz
IGZpeGluZyBhbmQgY291bGQgYmUgZG9uZSBpbgp0aGlzIHBhdGNoLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
