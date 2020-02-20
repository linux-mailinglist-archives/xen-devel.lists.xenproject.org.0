Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B778E1657E1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 07:40:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4fSg-0001Vn-No; Thu, 20 Feb 2020 06:37:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4fSe-0001Vi-Mi
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 06:37:24 +0000
X-Inumbo-ID: 73b410aa-53ab-11ea-84e0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73b410aa-53ab-11ea-84e0-12813bfff9fa;
 Thu, 20 Feb 2020 06:37:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB201AD33;
 Thu, 20 Feb 2020 06:37:22 +0000 (UTC)
To: Kees Cook <keescook@chromium.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20200220062318.69299-1-keescook@chromium.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <16a166da-c6e7-aa36-53a0-1b56197c8fc0@suse.com>
Date: Thu, 20 Feb 2020 07:37:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220062318.69299-1-keescook@chromium.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/xen: Distribute switch variables for
 initialization
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAgMDc6MjMsIEtlZXMgQ29vayB3cm90ZToKPiBWYXJpYWJsZXMgZGVjbGFyZWQg
aW4gYSBzd2l0Y2ggc3RhdGVtZW50IGJlZm9yZSBhbnkgY2FzZSBzdGF0ZW1lbnRzCj4gY2Fubm90
IGJlIGF1dG9tYXRpY2FsbHkgaW5pdGlhbGl6ZWQgd2l0aCBjb21waWxlciBpbnN0cnVtZW50YXRp
b24gKGFzCj4gdGhleSBhcmUgbm90IHBhcnQgb2YgYW55IGV4ZWN1dGlvbiBmbG93KS4gV2l0aCBH
Q0MncyBwcm9wb3NlZCBhdXRvbWF0aWMKPiBzdGFjayB2YXJpYWJsZSBpbml0aWFsaXphdGlvbiBm
ZWF0dXJlLCB0aGlzIHRyaWdnZXJzIGEgd2FybmluZyAoYW5kIHRoZXkKPiBkb24ndCBnZXQgaW5p
dGlhbGl6ZWQpLiBDbGFuZydzIGF1dG9tYXRpYyBzdGFjayB2YXJpYWJsZSBpbml0aWFsaXphdGlv
bgo+ICh2aWEgQ09ORklHX0lOSVRfU1RBQ0tfQUxMPXkpIGRvZXNuJ3QgdGhyb3cgYSB3YXJuaW5n
LCBidXQgaXQgYWxzbwo+IGRvZXNuJ3QgaW5pdGlhbGl6ZSBzdWNoIHZhcmlhYmxlc1sxXS4gTm90
ZSB0aGF0IHRoZXNlIHdhcm5pbmdzIChvciBzaWxlbnQKPiBza2lwcGluZykgaGFwcGVuIGJlZm9y
ZSB0aGUgZGVhZC1zdG9yZSBlbGltaW5hdGlvbiBvcHRpbWl6YXRpb24gcGhhc2UsCj4gc28gZXZl
biB3aGVuIHRoZSBhdXRvbWF0aWMgaW5pdGlhbGl6YXRpb25zIGFyZSBsYXRlciBlbGlkZWQgaW4g
ZmF2b3Igb2YKPiBkaXJlY3QgaW5pdGlhbGl6YXRpb25zLCB0aGUgd2FybmluZ3MgcmVtYWluLgo+
IAo+IFRvIGF2b2lkIHRoZXNlIHByb2JsZW1zLCBtb3ZlIHN1Y2ggdmFyaWFibGVzIGludG8gdGhl
ICJjYXNlIiB3aGVyZQo+IHRoZXkncmUgdXNlZCBvciBsaWZ0IHRoZW0gdXAgaW50byB0aGUgbWFp
biBmdW5jdGlvbiBib2R5Lgo+IAo+IGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYzogSW4gZnVu
Y3Rpb24g4oCYeGVuX3dyaXRlX21zcl9zYWZl4oCZOgo+IGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYzo5MDQ6MTI6IHdhcm5pbmc6IHN0YXRlbWVudCB3aWxsIG5ldmVyIGJlIGV4ZWN1dGVkIFst
V3N3aXRjaC11bnJlYWNoYWJsZV0KPiAgICA5MDQgfCAgIHVuc2lnbmVkIHdoaWNoOwo+ICAgICAg
ICB8ICAgICAgICAgICAgXn5+fn4KPiAKPiBbMV0gaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3df
YnVnLmNnaT9pZD00NDkxNgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
