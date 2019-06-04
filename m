Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97034A96
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 16:41:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYAax-0006ag-1i; Tue, 04 Jun 2019 14:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYAav-0006ab-Fn
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 14:39:21 +0000
X-Inumbo-ID: 884fe6e4-86d6-11e9-b9a4-6b31d80a6ca1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 884fe6e4-86d6-11e9-b9a4-6b31d80a6ca1;
 Tue, 04 Jun 2019 14:39:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 08:39:17 -0600
Message-Id: <5CF682930200007800235268@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 08:39:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-3-git-send-email-chao.gao@intel.com>
In-Reply-To: <1558945891-3015-3-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 02/10] microcode/intel: extend
 microcode_update_match()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2ludGVsLmMKPiBAQCAtMTM0LDE0ICsxMzQsMjggQEAgc3RhdGljIGludCBjb2xs
ZWN0X2NwdV9pbmZvKHVuc2lnbmVkIGludCBjcHVfbnVtLCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAq
Y3NpZykKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW5saW5lIGludCBtaWNy
b2NvZGVfdXBkYXRlX21hdGNoKAo+IC0gICAgdW5zaWduZWQgaW50IGNwdV9udW0sIGNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsCj4gLSAgICBpbnQgc2lnLCBp
bnQgcGYpCj4gK3N0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgbWljcm9jb2RlX3Vw
ZGF0ZV9tYXRjaCgKPiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICpt
Y19oZWFkZXIsIHVuc2lnbmVkIGludCBzaWcsCj4gKyAgICB1bnNpZ25lZCBpbnQgcGYsIHVuc2ln
bmVkIGludCByZXYpCj4gIHsKPiAtICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBl
cl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdV9udW0pOwo+ICsgICAgY29uc3Qgc3RydWN0IGV4dGVu
ZGVkX3NpZ3RhYmxlICpleHRfaGVhZGVyOwo+ICsgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3Np
Z25hdHVyZSAqZXh0X3NpZzsKPiArICAgIHVuc2lnbmVkIGxvbmcgZGF0YV9zaXplID0gZ2V0X2Rh
dGFzaXplKG1jX2hlYWRlcik7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiArCj4gKyAgICBpZiAo
IHNpZ21hdGNoKHNpZywgbWNfaGVhZGVyLT5zaWcsIHBmLCBtY19oZWFkZXItPnBmKSApCj4gKyAg
ICAgICAgcmV0dXJuIChtY19oZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNP
REU7CgpBcyBpbmRpY2F0ZWQgYmVmb3JlLCBJIHRoaW5rIHlvdSB3b3VsZCBiZXR0ZXIgYWxzbyBw
cm92aWRlIGFuICJlcXVhbCIKaW5kaWNhdGlvbi4gSWlyYyBJJ3ZlIHRvbGQgeW91IHRoYXQgSSBo
YXZlIG9uZSBzeXN0ZW0gd2hlcmUgdGhlIGNvcmVzCmdldCBoYW5kZWQgb3ZlciBmcm9tIHRoZSBC
SU9TIGluIGFuIGluY29uc2lzdGVudCBzdGF0ZSAob25seSBjb3JlCmhhcyB1Y29kZSBsb2FkZWQp
LiBIZW5jZSB3ZSdkIHdhbnQgdG8gYmUgYWJsZSB0byBhbHNvIF9zdG9yZV8KdWNvZGUgbWF0Y2hp
bmcgdGhhdCBmb3VuZCBvbiBDUFUgMCwgd2l0aG91dCBhY3R1YWxseSB3YW50IHRvIF9sb2FkXwpp
dCB0aGVyZS4KCj4gLSAgICByZXR1cm4gKHNpZ21hdGNoKHNpZywgdWNpLT5jcHVfc2lnLnNpZywg
cGYsIHVjaS0+Y3B1X3NpZy5wZikgJiYKPiAtICAgICAgICAgICAgKG1jX2hlYWRlci0+cmV2ID4g
dWNpLT5jcHVfc2lnLnJldikpOwo+ICsgICAgaWYgKCBnZXRfdG90YWxzaXplKG1jX2hlYWRlcikg
PT0gKGRhdGFfc2l6ZSArIE1DX0hFQURFUl9TSVpFKSApCj4gKyAgICAgICAgcmV0dXJuIE1JU19V
Q09ERTsKCk9rYXksIHlvdSdyZSB0aWdodGVuaW5nIHRoZSBvcmlnaW5hbCA8PSB0byA9PSBoZXJl
LiBCdXQgaWYgeW91J3JlCmFscmVhZHkgdGlnaHRlbmluZyB0aGluZ3MsIHdoeSBkb24ndCB5b3Ug
bWFrZSBzdXJlIHlvdSBhY3R1YWxseQpoYXZlIGVub3VnaCBkYXRhIHRvIC4uLgoKPiArICAgIGV4
dF9oZWFkZXIgPSAoY29uc3Qgdm9pZCAqKShtY19oZWFkZXIgKyAxKSArIGRhdGFfc2l6ZTsKCi4u
LiBob2xkIGFuIGV4dGVuZGVkIGhlYWRlciwgYW5kIHRoZW4gYWxzbyB0byBob2xkIC4uLgoKPiAr
ICAgIGV4dF9zaWcgPSAoY29uc3Qgdm9pZCAqKShleHRfaGVhZGVyICsgMSk7Cj4gKyAgICBmb3Ig
KCBpID0gMDsgaSA8IGV4dF9oZWFkZXItPmNvdW50OyBpKysgKQo+ICsgICAgICAgIGlmICggc2ln
bWF0Y2goc2lnLCBleHRfc2lnW2ldLnNpZywgcGYsIGV4dF9zaWdbaV0ucGYpICkKPiArICAgICAg
ICAgICAgcmV0dXJuIChtY19oZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNP
REU7CgouLi4gZW5vdWdoIGFycmF5IGVsZW1lbnRzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
