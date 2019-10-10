Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBFD2BD5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 15:56:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIYsp-0006d3-Q1; Thu, 10 Oct 2019 13:53:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIYso-0006cr-3W
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 13:53:34 +0000
X-Inumbo-ID: 58d7f02a-eb65-11e9-931a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58d7f02a-eb65-11e9-931a-12813bfff9fa;
 Thu, 10 Oct 2019 13:53:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3DA61AF23;
 Thu, 10 Oct 2019 13:53:32 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191010113345.6867-1-roger.pau@citrix.com>
 <20191010113345.6867-2-roger.pau@citrix.com>
 <b1e9fac5-a476-638c-e550-c179146ecf7f@suse.com>
 <20191010121302.GF1389@Air-de-Roger.citrite.net>
 <39f2d60b-e371-1646-dc79-cf1355a81afa@suse.com>
 <20191010132936.GH1389@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a9ae192-a530-fa66-44a1-2d0a6b9e5853@suse.com>
Date: Thu, 10 Oct 2019 15:53:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010132936.GH1389@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] x2APIC: translate IO-APIC entries
 when enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMjAxOSAxNToyOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBP
Y3QgMTAsIDIwMTkgYXQgMDI6NTU6MDJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDEwLjEwLjIwMTkgMTQ6MTMsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVGh1LCBP
Y3QgMTAsIDIwMTkgYXQgMDE6NTQ6MDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMTAuMTAuMjAxOSAxMzozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+PiBXaGVuIGlu
dGVycnVwdCByZW1hcHBpbmcgaXMgZW5hYmxlZCBhcyBwYXJ0IG9mIGVuYWJsaW5nIHgyQVBJQyB0
aGUKPj4+Pgo+Pj4+IFBlcmhhcHMgInVubWFza2VkIiBpbnN0ZWFkIG9mICJ0aGUiPwo+Pj4+Cj4+
Pj4+IElPLUFQSUMgZW50cmllcyBhbHNvIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB0aGUgbmV3
IGZvcm1hdCBhbmQgYWRkZWQKPj4+Pj4gdG8gdGhlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUu
Cj4+Pj4+Cj4+Pj4+IFRoaXMgcHJldmVudHMgSU9NTVUgaW50ZXJydXB0IHJlbWFwcGluZyBmYXVs
dHMgd2hlbiBib290aW5nIG9uCj4+Pj4+IGhhcmR3YXJlIHRoYXQgaGFzIHVubWFza2VkIElPLUFQ
SUMgcGlucy4KPj4+Pgo+Pj4+IEJ1dCBpbiB0aGUgZW5kIGl0IG9ubHkgcGFwZXJzIG92ZXIgd2hh
dGV2ZXIgdGhlIHNwdXJpb3VzIGludGVycnVwdHMKPj4+PiByZXN1bHQgZm9ybSwgZG9lc24ndCBp
dD8gV2hpY2ggaXNuJ3QgdG8gc2F5IHRoaXMgaXNuJ3QgYW4KPj4+PiBpbXByb3ZlbWVudC4gQ2Fs
bGluZyBvdXQgdGhlIEV4dEludCBjYXNlIGhlcmUgbWF5IGJlIHdvcnRod2hpbGUgYXMKPj4+PiB3
ZWxsLCBhcyB3b3VsZCBiZSBwb2ludGluZyBvdXQgdGhhdCB0aGlzIGNhc2Ugc3RpbGwgd29uJ3Qg
d29yayBvbgo+Pj4+IEFNRCBJT01NVXMuCj4+Pgo+Pj4gQnV0IHRoZSBmaXggZm9yIHRoZSBFeHRJ
TlQgQU1EIGlzc3VlIHNob3VsZCBiZSBkb25lIGluCj4+PiBhbWRfaW9tbXVfaW9hcGljX3VwZGF0
ZV9pcmUgdGhlbiwgc28gdGhhdCBpdCBjYW4gcHJvcGVybHkgaGFuZGxlCj4+PiBFeHRJTlQgZGVs
aXZlcnkgbW9kZSwgbm90IHRvIHRoaXMgcGFydCBvZiB0aGUgY29kZS4gSSB3aWxsIGxvb2sKPj4+
IGludG8gaXQsIGJ1dCBJIHRoaW5rIGl0J3Mga2luZCBvZiB0YW5nZW50aWFsIHRvIHRoZSBpc3N1
ZSBoZXJlLgo+Pgo+PiBJJ20gbm90IHRhbGtpbmcgb2YgeW91IHdvcmtpbmcgb24gZml4aW5nIHRo
aXMgcmlnaHQgYXdheS4gSSdtIG1lcmVseQo+PiBhc2tpbmcgdGhhdCB5b3UgbWVudGlvbiBoZXJl
IChhKSB0aGUgRXh0SW50IHNwZWNpYWwgY2FzZSBhbmQgKGIpCj4+IHRoYXQgdGhpcyBzcGVjaWFs
IGNhc2Ugd2lsbCAoY29udGludWUgdG8pIG5vdCB3b3JrIGluIHRoZSBBTUQgY2FzZS4KPiAKPiBQ
bGVhc2UgYmVhciB3aXRoIG1lLCBJJ3ZlIHRha2VuIGEgbG9vayBhdCB0aGUgRXh0SU5UIGhhbmRs
aW5nIGZvciBBTUQKPiBhbmQgSSdtIG5vdCBzdXJlIEkgY2FuIHNwb3Qgd2hhdCdzIG1pc3Npbmcu
IFhlbiBzZWVtcyB0byBoYW5kbGUgYm90aAo+IHRoZSBFSW50UGFzcyBhbmQgSVYgZmllbGRzIG9m
IHRoZSBEVEUgKHNlZSBpb21tdV9kdGVfYWRkX2RldmljZV9lbnRyeQo+IGFuZCBhbWRfaW9tbXVf
c2V0X2ludHJlbWFwX3RhYmxlKSwgYW5kIHRoYXQgc2hvdWxkIGJlIGVub3VnaCBpbiBvcmRlcgo+
IHRvIHBhc3N0aHJvdWdoIHN1Y2ggaW50ZXJydXB0cy4KCkVJbnRQYXNzIGdldHMgc2V0IGJhc2Vk
IG9uIEFDUEkgdGFibGUgaW5mb3JtYXRpb24sIG5vdCB3aGF0IHdlIGZvdW5kCmluIGEgcGFydGlj
dWxhciBSVEUuIFRoYXQncyBob3BlZnVsbHkgZmluZSwgYnV0IHlvdSBrbm93IGhvdyByZWxpYWJs
ZQpmaXJtd2FyZSBpcyBlc3BlY2lhbGx5IGluIGNvcm5lciBjYXNlcy4KCj4gSXMgdGhlcmUgc29t
ZSBvdGhlciBoYW5kbGluZyB0aGF0IEknbSBtaXNzaW5nPyAobWF5YmUgaW4gdGhlIGhhbmRsaW5n
Cj4gb2YgdGhlIGludGVycnVwdCBpdHNlbGY/KQoKTG9vayBhdCB0aGUgdXBkYXRlX2ludHJlbWFw
X2VudHJ5X2Zyb21faW9hcGljKCkgLT4KdXBkYXRlX2ludHJlbWFwX2VudHJ5KCkgcGF0aDogVGhp
cyBjb252ZXJ0cyB0aGUgMy1iaXQgZGVsaXZlcnkgbW9kZQpmaWVsZCBpbnRvIGEgMS1iaXQgaW50
X3R5cGUgb25lICh0aGUgZmllbGQgaXMgcmVhbGx5IDMgYml0cyB3aWRlLApidXQgdmFsdWVzIDAx
MC4uMTExIChiaW5hcnkpIGFyZSBkb2N1bWVudGVkIGFzIHJlc2VydmVkOyBJIGNhbid0CmV4Y2x1
ZGUgdGhvdWdoIHRoYXQgdGhlIGRvY3VtZW50YXRpb24gaXMgd3JvbmcgaGVyZSkuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
