Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A98C39C0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKY3-0002Ri-KA; Tue, 01 Oct 2019 15:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFKY1-0002Rd-Of
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:58:45 +0000
X-Inumbo-ID: 585b5cfc-e464-11e9-9703-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 585b5cfc-e464-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 15:58:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5698B137;
 Tue,  1 Oct 2019 15:58:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
 <20191001143207.15844-2-andrew.cooper3@citrix.com>
 <b5101087-a0db-50bf-8276-78f38b859aff@suse.com>
 <f8483c39-947c-1ef1-34b7-3927d55cbf42@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88f519eb-ca6b-56ce-991a-3699942db1f7@suse.com>
Date: Tue, 1 Oct 2019 17:58:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f8483c39-947c-1ef1-34b7-3927d55cbf42@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_ARRAY
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNzo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8yMDE5
IDE1OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTAuMjAxOSAxNjozMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFRoZXJlIGFyZSBsZWdpdGltYXRlIGNpcmN1bXN0YW5jZSB3aGVy
ZSBhcnJheSBoYXJkZW5pbmcgaXMgbm90IHdhbnRlZCBvcgo+Pj4gbmVlZGVkLiAgQWxsb3cgaXQg
dG8gYmUgdHVybmVkIG9mZi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+PiB3aXRoIG9uZSBtb3JlIHF1ZXN0aW9uIChJJ20gc29ycnksIEkg
bWVhbnQgdG8gYXNrIG9uIHYxIGJ1dCB0aGVuCj4+IGZvcmdvdCk6Cj4+Cj4+PiAtLS0gYS94ZW4v
Y29tbW9uL0tjb25maWcKPj4+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4gQEAgLTc3LDYg
Kzc3LDMwIEBAIGNvbmZpZyBIQVNfQ0hFQ0tQT0xJQ1kKPj4+ICAJc3RyaW5nCj4+PiAgCW9wdGlv
biBlbnY9IlhFTl9IQVNfQ0hFQ0tQT0xJQ1kiCj4+PiAgCj4+PiArbWVudSAiU3BlY3VsYXRpdmUg
aGFyZGVuaW5nIgo+Pj4gKwo+Pj4gK2NvbmZpZyBTUEVDVUxBVElWRV9IQVJERU5fQVJSQVkKPj4+
ICsJYm9vbCAiU3BlY3VsYXRpdmUgQXJyYXkgSGFyZGVuaW5nIgo+Pj4gKwlkZWZhdWx0IHkKPj4g
QXJlIHlvdS93ZSBjb252aW5jZWQgaXQgaXMgYSBnb29kIGlkZWEgdG8gZXhwb3NlIHRoaXMgd2l0
aG91dCBFWFBFUlQKPj4gcXVhbGlmaWVyPyBJIGtub3cgeW91IGRpc2xpa2UgdGhhdCBlbnRpcmUg
bW9kZWwsIGJ1dCBvdXIgY29tbW9uCj4+IGdyb3VuZHMgc3RpbGwgYXJlIC0gYWZhaWN0IC0gdGhh
dCB3ZSBkb24ndCB3YW50IGEgcHJvbGlmZXJhdGlvbiBvZgo+PiAoc2VjdXJpdHkpIHN1cHBvcnRl
ZCBjb25maWd1cmF0aW9uIHZhcmlhdGlvbnMuCj4gCj4gSXRzIG5vdCBFWFBFUlQgSSBkaXNsaWtl
LsKgIEhhdmluZyBhIENPTkZJR19FWFBFUlQganVzdCBsaWtlIExpbnV4IGhhcwo+IHdvdWxkIGJl
IGZpbmUuwqAgSXRzIHRoZSBmYWN0IHRoYXQgaXQgd2lsbCBzaWxlbnRseSByZXZlcnQgYmVoaW5k
IHlvdXIKPiBiYWNrIGlmIGFuIGVudmlyb25tZW50IHZhcmlhYmxlIGlzIG1pc3Npbmcgd2hpY2gg
aXMgd2hhdCBtYWtlcyB0aGUKPiBiZWhhdmlvdXIgdG94aWMgZm9yIHBlb3BsZSB0byB1c2UuCj4g
Cj4gVGhhdCBhc2lkZSwgSSBkb24ndCB0aGluayB0aGlzIHdhcnJhbnRzIGV4cGVydC7CoCBJdCBp
cyBiZXN0LWVmZm9ydC1vbmx5Cj4gbWl0aWdhdGlvbiwgd2hpY2ggb24gdGhlIGJhbGFuY2Ugb2Yg
cHJvYmFiaWxpdHkgaXMgbm90IGNvbXBsZXRlLCB3aGljaAo+IGNhbiBzYWZlbHkgYmUgdHVybmVk
IG9mZiBiYXNlZCBvbiBhIHJpc2sgYXNzZXNzbWVudCBvZiB0aGUgdGFyZ2V0IENQVQo+IGFuZCBl
bnZpcm9ubWVudC4KCkkgbW9zdGx5IGFncmVlIHdpdGggdGhpczsgdGhlIHF1ZXN0aW9uIHRob3Vn
aCB3YXMgbW9yZSB0b3dhcmRzIHdoZXRoZXIKdGhpcyBpcyBhIGdvb2QgZW5vdWdoIHJlYXNvbiB0
byBzZXQgYShub3RoZXIpIHByZWNlZGVudCBvZiBhbiBFWFBFUlQtCmxlc3Mgb3B0aW9uLCB3aGVu
IHdlIHRyeSB0byBoYXZlIGFzIGZldyBvZiB0aGVtIGFzIHBvc3NpYmxlLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
