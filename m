Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB13359EB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:53:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYSZc-00015r-30; Wed, 05 Jun 2019 09:51:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYSZZ-00014n-KX
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:51:09 +0000
X-Inumbo-ID: 710d134a-8777-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 710d134a-8777-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 09:51:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 03:51:07 -0600
Message-Id: <5CF790890200007800235696@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 03:51:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1559677885-10731-1-git-send-email-andrew.cooper3@citrix.com>
 <1559677885-10731-3-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1559677885-10731-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] tools/fuzz: Add a cpu-policy fuzzing
 harness
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDIxOjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlcmUgaXMgbm93IGVub3VnaCBjb21wbGV4aXR5IHRoYXQgYSBmdXp6aW5nIGhhcm5l
c3MgaXMgYSBnb29kIGlkZWEsIGFuZAo+IGVub3VnaCBzdXBwb3J0aW5nIGxvZ2ljIHRvIGltcGxl
bWVudCBvbmUgd2hpY2ggQUZMIHNlZW1zIGhhcHB5IHdpdGguCj4gCj4gVGFrZSB0aGUgZXhpc3Rp
bmcgcmVjYWxjdWxhdGVfc3ludGgoKSBoZWxwZXIgYW5kIGV4cG9ydCBpdCBhcwo+IHg4Nl9jcHVp
ZF9wb2xpY3lfcmVjYWxjX3N5bnRoKCksIGFzIGl0IGlzIG5lZWRlZCBieSB0aGUgZnV6emluZyBo
YXJuZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4
LmNvbT4KPiAtLS0KPiAgdG9vbHMvZnV6ei9jcHUtcG9saWN5Ly5naXRpZ25vcmUgICAgICAgICAg
fCAgIDEgKwo+ICB0b29scy9mdXp6L2NwdS1wb2xpY3kvTWFrZWZpbGUgICAgICAgICAgICB8ICAy
OCArKysrKwo+ICB0b29scy9mdXp6L2NwdS1wb2xpY3kvYWZsLXBvbGljeS1mdXp6ZXIuYyB8IDE4
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKCkRvZXMgdGhpcyB3YW50IHRvIGJlIGFj
Y29tcGFuaWVkIGJ5IGEgLi9NQUlOVEFJTkVSUyB1cGRhdGUKdG8gdGhlIFg4NiBzZWN0aW9uPwoK
PiAgeGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaCAgICAgICAgICAgfCAgIDUgKwo+ICB4
ZW4vbGliL3g4Ni9jcHVpZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQo+ICA1IGZp
bGVzIGNoYW5nZWQsIDIyNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbmUgZnVydGhlciByZW1hcms6
Cgo+ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4gK3sKPiArICAgIEZJTEUgKmZw
ID0gTlVMTDsKPiArCj4gKyAgICBzZXRidWYoc3RkaW4sIE5VTEwpOwo+ICsgICAgc2V0YnVmKHN0
ZG91dCwgTlVMTCk7Cj4gKwo+ICsgICAgd2hpbGUgKCB0cnVlICkKPiArICAgIHsKPiArICAgICAg
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9wdGlvbiBvcHRzW10gPSB7Cj4gKyAgICAgICAgICAgIHsg
ImRlYnVnIiwgbm9fYXJndW1lbnQsIE5VTEwsICdkJyB9LAo+ICsgICAgICAgICAgICB7ICJoZWxw
Iiwgbm9fYXJndW1lbnQsIE5VTEwsICdoJyB9LAo+ICsgICAgICAgICAgICB7fSwKPiArICAgICAg
ICB9Owo+ICsgICAgICAgIGludCBjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgImhkIiwgb3B0
cywgTlVMTCk7Cj4gKwo+ICsgICAgICAgIGlmICggYyA9PSAtMSApCj4gKyAgICAgICAgICAgIGJy
ZWFrOwo+ICsKPiArICAgICAgICBzd2l0Y2ggKCBjICkKPiArICAgICAgICB7Cj4gKyAgICAgICAg
Y2FzZSAnZCc6Cj4gKyAgICAgICAgICAgIHByaW50ZigiRW5hYmxpbmcgZGVidWdcbiIpOwo+ICsg
ICAgICAgICAgICBkZWJ1ZyA9IHRydWU7Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAg
ICAgICBkZWZhdWx0Ogo+ICsgICAgICAgICAgICBwcmludGYoIkJhZCBvcHRpb24gJWQgKCVjKVxu
IiwgYywgYyk7Cj4gKyAgICAgICAgICAgIGV4aXQoLTEpOwo+ICsgICAgICAgICAgICBicmVhazsK
CldvdWxkbid0ICdoJyAod3JvbmdseSkgY29tZSBpbnRvIGhlcmU/IChUaGUgYnJlYWsgc3RhdGVt
ZW50IGFsc28gbG9va3MKdG8gYmUgdW5uZWNlc3NhcnkgYWZ0ZXIgZXhpdCgpLikKCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
