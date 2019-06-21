Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E134E0A7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:53:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heDNL-0001p0-NK; Fri, 21 Jun 2019 06:50:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heDNK-0001ov-Dp
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:50:18 +0000
X-Inumbo-ID: d3a5de2e-93f0-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3a5de2e-93f0-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 06:50:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:50:16 -0600
Message-Id: <5D0C7E280200007800239F29@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:50:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B86A9020000780021F2BB@prv1-mh.provo.novell.com>
 <3ebf4381-d49d-aa14-532a-9942a5358841@citrix.com>
In-Reply-To: <3ebf4381-d49d-aa14-532a-9942a5358841@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 41/50] x86emul: support AVX512_4FMAPS
 insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE2OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0zMjA1
LDYgKzMyMDYsMTggQEAgeDg2X2RlY29kZSgKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRlKTsKPj4gICAgICAgICAgICAgICAgICAgICAg
c3RhdGUtPnNpbWRfc2l6ZSA9IHNpbWRfb3RoZXI7Cj4+ICAgICAgICAgICAgICAgICAgfQo+PiAr
Cj4+ICsgICAgICAgICAgICAgICAgc3dpdGNoICggYiApCj4+ICsgICAgICAgICAgICAgICAgewo+
PiArICAgICAgICAgICAgICAgIC8qIHY0Znssbn1tYWRke3Asc31zIG5lZWQgc3BlY2lhbCBjYXNp
bmcgKi8KPiAKPiBXaHk/ICBHaXZlbiB0aGF0IHRoaXMgaXNuJ3QgYm9pbGVycGxhdGUgYWRkaXRp
b24gb2YgbmV3IGluc3RydWN0aW9ucywgaXQKPiBuZWVkcyBhIGRpc2N1c3Npb24gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLgoKSSd2ZSBhZGRlZAoKQSBkZWNvZGVyIGFkanVzdG1lbnQgaXMgbmVlZGVk
IGhlcmUgYmVjYXVzZSBvZiB0aGUgY3VycmVudCBzaGFyaW5nIG9mCnRhYmxlIGVudHJpZXMgYmV0
d2VlbiBkaWZmZXJlbnQgKGltcGxpZWQpIG9wY29kZSBwcmVmaXhlczogVGhlIHNhbWUKbWFqb3Ig
b3Bjb2RlcyBhcmUgdXNlZCBmb3IgdmZtc3ViezEzMiwyMTN9e3Asc317cyxkfSwgd2hpY2ggaGF2
ZSBhCmRpZmZlcmVudCBtZW1vcnkgb3BlcmFuZCBzaXplIGFuZCBkaWZmZXJlbnQgRGlzcDggc2Nh
bGluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
