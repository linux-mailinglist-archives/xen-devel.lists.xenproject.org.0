Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE82073D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:49:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFmN-00023W-8s; Thu, 16 May 2019 12:46:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRFmL-00023O-0T
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:46:33 +0000
X-Inumbo-ID: 9eb9b4d0-77d8-11e9-84b9-737899b19552
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eb9b4d0-77d8-11e9-84b9-737899b19552;
 Thu, 16 May 2019 12:46:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C1C4AF68;
 Thu, 16 May 2019 12:46:26 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-25-jgross@suse.com> <5CDD557D020000780022FA32@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5fe18121-19de-b6d3-bc77-dc68b6221165@suse.com>
Date: Thu, 16 May 2019 14:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD557D020000780022FA32@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC V2 24/45] xen: let vcpu_create() select
 processor
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IEBAIC0zMTQsMTQgKzMx
NCw0MiBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX2l0ZW0gKnNjaGVkX2FsbG9jX2l0ZW0oc3RydWN0
IHZjcHUgKnYpCj4+ICAgICAgcmV0dXJuIE5VTEw7Cj4+ICB9Cj4+ICAKPj4gLWludCBzY2hlZF9p
bml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBwcm9jZXNzb3IpCj4+ICtzdGF0
aWMgdW5zaWduZWQgaW50IHNjaGVkX3NlbGVjdF9pbml0aWFsX2NwdShzdHJ1Y3QgdmNwdSAqdikK
Pj4gK3sKPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+IAo+IGNvbnN0IChw
ZXJoYXBzIGFsc28gdGhlIGZ1bmN0aW9uIHBhcmFtZXRlcik/CgpZZXMuCgo+IAo+PiArICAgIG5v
ZGVpZF90IG5vZGU7Cj4+ICsgICAgY3B1bWFza190IGNwdXM7Cj4gCj4gVG8gYmUgaG9uZXN0LCBJ
J20gbm90IGhhcHB5IHRvIHNlZSBuZXcgb24tc3RhY2sgaW5zdGFuY2VzIG9mCj4gY3B1bWFza190
IGFwcGVhci4gU2VlaW5nIC4uLgo+IAo+PiArICAgIGNwdW1hc2tfY2xlYXIoJmNwdXMpOwo+PiAr
ICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGQtPm5vZGVfYWZmaW5pdHkgKQo+PiArICAg
ICAgICBjcHVtYXNrX29yKCZjcHVzLCAmY3B1cywgJm5vZGVfdG9fY3B1bWFzayhub2RlKSk7Cj4+
ICsgICAgY3B1bWFza19hbmQoJmNwdXMsICZjcHVzLCBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGQp
KTsKPj4gKyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdXMpICkKPj4gKyAgICAgICAgY3B1bWFz
a19jb3B5KCZjcHVzLCBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGQpKTsKPiAKPiAuLi4gdGhpcyBm
YWxsYmFjayB5b3UgdXNlIGFueXdheSwgaXMgdGhlcmUgYW55IGlzc3VlIHdpdGggaXQgYWxzbwo+
IHNlcnZpbmcgdGhlIGNhc2Ugd2hlcmUgemFsbG9jX2NwdW1hc2tfdmFyKCkgZmFpbHM/CgpFaXRo
ZXIgdGhhdCwgb3I6CgotIGp1c3QgZmFpbCB0byBjcmVhdGUgdGhlIHZjcHUgaW4gdGhhdCBjYXNl
LCBhcyBjaGFuY2VzIGFyZSByYXRoZXIKICBoaWdoIGUuZy4gdGhlIGZvbGxvd2luZyBhcmNoX3Zj
cHVfY3JlYXRlKCkgd2lsbCBmYWlsIGFueXdheQotIHRha2UgdGhlIHNjaGVkdWxpbmcgbG9jayBh
bmQgdXNlIGNwdW1hc2tfc2NyYXRjaAotIChhYil1c2Ugb25lIG9mIHRoZSBhdmFpbGFibGUgY3B1
bWFza3MgaW4gc3RydWN0IHNjaGVkX3VuaXQgd2hpY2gKICBhcmUgbm90IGluIHVzZSB5ZXQKCk15
IHByZWZlcmVuY2Ugd291bGQgYmUgdXNpbmcgY3B1bWFza19zY3JhdGNoLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
