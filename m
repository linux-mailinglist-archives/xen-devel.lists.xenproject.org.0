Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485E18B23B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 12:20:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEtAS-00072J-6B; Thu, 19 Mar 2020 11:16:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEtAQ-000721-2k
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 11:16:50 +0000
X-Inumbo-ID: 1fd71c64-69d3-11ea-bbe2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fd71c64-69d3-11ea-bbe2-12813bfff9fa;
 Thu, 19 Mar 2020 11:16:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76CDDAC44;
 Thu, 19 Mar 2020 11:16:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
 <02b265af-0b0d-0d8f-ed53-4e27c1d12beb@suse.com>
 <cefd1fb0-d6cf-0798-169f-56b49356d2ac@citrix.com>
 <c322646e-ada5-fb39-743e-c2d167da8e3b@suse.com>
 <0c961be0-fb48-b8e5-e584-4eaa390be308@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61815486-4e61-625e-6f03-3a6f8e199251@suse.com>
Date: Thu, 19 Mar 2020 12:16:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0c961be0-fb48-b8e5-e584-4eaa390be308@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAyMCAxMTo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wMy8yMDIw
IDA5OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTkuMDMuMjAyMCAxMDo1MiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDE5LzAzLzIwMjAgMDk6MjEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDE4LjAzLjIwMjAgMjI6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFNw
bGl0IHRoZSBleGlzdGluZyBhc20vbWljcm9jb2RlLmggaW4gaGFsZiwga2VlcGluZyB0aGUgcGVy
LWNwdSBjcHVfc2lnCj4+Pj4+IGF2YWlsYWJsZSB0byBleHRlcm5hbCB1c2VycywgYW5kIG1vdmlu
ZyBldmVyeXRoaW5nIGVsc2UgaW50byBwcml2YXRlLmgKPj4+Pj4KPj4+Pj4gVGFrZSB0aGUgb3Bw
b3J0dW5pdHkgdG8gdHJpbSBhbmQgY2xlYW4gdXAgdGhlIGluY2x1ZGUgbGlzdHMgZm9yIGFsbCAz
IHNvdXJjZQo+Pj4+PiBmaWxlcywgYWxsIG9mIHdoaWNoIGluY2x1ZGUgcmF0aGVyIG1vcmUgdGhh
biBuZWNlc3NhcnkuCj4+Pj4+Cj4+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pj4+Pgo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+Pj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gYWxi
ZWl0IHByZWZlcmFibHkgd2l0aCAuLi4KPj4+Pgo+Pj4+PiAtLS0KPj4+Pj4gIHhlbi9hcmNoL3g4
Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCj4+Pj4+ICB4
ZW4vYXJjaC94ODYvbWljcm9jb2RlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAzICsr
Cj4+Pj4+ICB4ZW4vYXJjaC94ODYve21pY3JvY29kZV9hbWQuYyA9PiBtaWNyb2NvZGUvYW1kLmN9
ICB8IDEyICsrKystLS0tCj4+Pj4+ICB4ZW4vYXJjaC94ODYve21pY3JvY29kZS5jID0+IG1pY3Jv
Y29kZS9jb3JlLmN9ICAgICB8IDE1ICsrKy0tLS0tLS0KPj4+Pj4gIC4uLi94ODYve21pY3JvY29k
ZV9pbnRlbC5jID0+IG1pY3JvY29kZS9pbnRlbC5jfSAgIHwgIDkgKystLS0tCj4+Pj4+ICAuLi4v
bWljcm9jb2RlLmggPT4gYXJjaC94ODYvbWljcm9jb2RlL3ByaXZhdGUuaH0gICB8IDE5ICsrKyst
LS0tLS0tLS0KPj4+PiAuLi4gdGhlc2UgZ29pbmcgaW50byB4ZW4vYXJjaC94ODYvY3B1L21pY3Jv
Y29kZS8uIFRob3VnaHRzPwo+Pj4gVEJILCBJJ3ZlIGFsd2F5cyBmb3VuZCB0aGUgY3B1LyBkaXJl
Y3RvcnkgcmVkdW5kYW50LsKgIEV2ZXJ5dGhpbmcgaW4KPj4+IGFyY2gveDg2IGlzIHBhcnQgb2Yg
dGhlIENQVSwgYW5kIHRoZXNlIGRheXMsIGV2ZW4gZHJpdmVycy9wYXNzdGhyb3VnaCBpcwo+Pj4g
cGFydCBvZiB0aGUgQ1BVLgo+PiBJJ20gc3VycHJpc2VkIG9mIHlvdSBzYXlpbmcgc28gLSBjZXJ0
YWlubHkgZS5nLiBtZW1vcnkgbWFuYWdlbWVudAo+PiBzdHVmZiBhbHNvIGludGVyZmFjZXMgd2l0
aCB0aGUgQ1BVLCBidXQgaXMgaW1vIHN0aWxsIGhlbHBmdWwgdG8gYmUKPj4gc2VwYXJhdGVkLgo+
IAo+IEkgY2FuIHNlZSBhbiBhcmd1bWVudCBmb3IgdGhpbmdzIGxpa2UgZG9tYWluLmMgbm90IGxp
dmluZyBpbiBjcHUvLCBidXQKPiB3aGVyZSBkbyB3ZSBkcmF3IHRoZSBsaW5lPwo+IAo+IFNob3Vs
ZCB0cmFwcy5jIGJlIGNvbnNpZGVyZWQgY3B1LyBvciBub3Q/CgpQZXJoYXBzIHBhcnRseSBoZXJl
IGFuZCB0aGVyZS4KCj7CoCBXaGF0IGFib3V0IEZQVSBoYW5kbGluZz8KClllcywgdGhpcyB3b3Vs
ZCBiZWxvbmcgdW5kZXIgY3B1LyBpbW8uCgo+PiBMaWtld2lzZSB3aGlsZSBJT01NVSBzdHVmZiBt
YXkgdG9kYXkgYmUgcGFydCBvZiB0aGUKPj4gQ1BVIHBhY2thZ2UsIGl0J3Mgc3RpbGwgbm90IGNv
cmUgQ1BVIGZ1bmN0aW9uYWxpdHkgaW1vLgo+IAo+IFN1cmUsIGZvciBzbWFsbCBzeXN0ZW1zLCBi
dXQgY29uc2lkZXJpbmcgaXQgaXMgZWZmZWN0aXZlbHkgbWFuZGF0b3J5IGZvcgo+IGEgPjI1NSBj
cHUgc3lzdGVtLCBJJ2Qgbm8gbG9uZ2VyIGFncmVlLgoKVGhhdCBzdGlsbCBkb2Vzbid0IG1ha2Ug
dGhlIElPTU1VIHBhcnQgb2YgdGhlIGNvcmUgQ1BVLiBOb3IKaXMgaXQgdGVjaG5pY2FsbHkgaW1w
b3NzaWJsZSB0byBydW4gPjI1NSBDUFUgc3lzdGVtcyB3aXRob3V0CklPTU1VLCBpdCdzIGp1c3Qg
bm90IHZlcnkgZWZmaWNpZW50IGludGVycnVwdCBkaXN0cmlidXRpb24Kd2lzZS4KCj4gQWZ0ZXIg
YWxsLCB3ZSBrbm93IGl0cyBub3Qgc2FmZSBydW5uaW5nIGFuIEludGVsIHN5c3RlbSB1bnRpbCB5
b3UndmUKPiB0dXJuZWQgb24gZXZlcnkgdGhyZWFkJ3MgQ1I0Lk1DRSwgZXZlbiBpZiB5b3UgZG9u
J3QgYWN0dWFsbHkgd2FudCB0byB1c2UKPiB0aGUgdGhyZWFkLgoKV2VsbCwgQ1I0Lk1DRSBhbmQg
aW4gZmFjdCBhbGwgTUNBIGhhbmRsaW5nIGlzIENQVSBzdHVmZiwKYW5kIGhlbmNlIGltbyB2YWxp
ZGx5IGxpdmVzIHVuZGVyIGNwdS9tY2hlY2svLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
