Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CE9EB21
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:36:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cXN-0001KS-Fg; Tue, 27 Aug 2019 14:33:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cXL-0001KK-Oi
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:33:31 +0000
X-Inumbo-ID: a320e246-c8d7-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a320e246-c8d7-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:33:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7FEBADF0;
 Tue, 27 Aug 2019 14:33:28 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190814104404.17739-1-andrew.cooper3@citrix.com>
 <20190814120052.cyimf6ya3eojpyvp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b1bd860-ec8e-5d24-9228-f9c505d19c29@suse.com>
Date: Tue, 27 Aug 2019 16:33:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814120052.cyimf6ya3eojpyvp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Annotate pagetables with
 STT_OBJECT
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDguMjAxOSAxNDowMCwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAx
OSBhdCAxMTo0NDowNEFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFsuLi5dCj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9jb25maWcuaAo+PiBpbmRleCAyMmRjNzk1ZWVhLi4zNTcwNTQ0MWZmIDEwMDY0NAo+PiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvY29uZmlnLmgKPj4gQEAgLTU2LDYgKzU2LDExIEBACj4+ICAgI2RlZmluZSBHTE9CQUwo
bmFtZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgICAgLmdsb2JsIG5hbWU7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gICAgIG5hbWU6Cj4+ICsKPj4gKyNk
ZWZpbmUgRU5EREFUQShuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAu
dHlwZSBuYW1lLCBTVFRfT0JKRUNUOyAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiBJc24ndCB0
aGUgY29ycmVjdCBzeW50YXgKPiAKPiAgICAgIC50eXBlIG5hbWUgU1RUX09CSkVDVDsKPiAKPiA/
Cj4gCj4gVGhlIGNvbW1hIHNob3VsZG4ndCBiZSB0aGVyZSBhY2NvcmRpbmcgdG8gYXMgbWFudWFs
LgoKUXVvdGUgMToKCiJFTEYgVmVyc2lvbgogIC0tLS0tLS0tLS0tCgogIEZvciBFTEYgdGFyZ2V0
cywgdGhlICcudHlwZScgZGlyZWN0aXZlIGlzIHVzZWQgbGlrZSB0aGlzOgoKICAgICAgLnR5cGUg
TkFNRSAsIFRZUEUgREVTQ1JJUFRJT04KIgoKVGhlIGNvbW1hIGlzIGRlZmluaXRlbHkgaGVyZSwg
dW5jb25kaXRpb25hbGx5LiBCdXQgeWVzLCBxdW90ZSAyOgoKJyAgIFRoZSBzeW50YXhlcyBzdXBw
b3J0ZWQgYXJlOgoKICAgICAgICAgLnR5cGUgPG5hbWU+IFNUVF88VFlQRV9JTl9VUFBFUl9DQVNF
PgogICAgICAgICAudHlwZSA8bmFtZT4sIzx0eXBlPgogICAgICAgICAudHlwZSA8bmFtZT4sQDx0
eXBlPgogICAgICAgICAudHlwZSA8bmFtZT4sJTx0eXBlPgogICAgICAgICAudHlwZSA8bmFtZT4s
Ijx0eXBlPiInCgpKdWRnaW5nIGZyb20gdGhlIHNvdXJjZXMgYWxsIGZvcm1zIHRyZWF0IHRoZSBj
b21tYSBhcyBvcHRpb25hbC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
