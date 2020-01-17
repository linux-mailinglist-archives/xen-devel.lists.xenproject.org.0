Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE81405B1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 09:59:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNRP-0002N9-45; Fri, 17 Jan 2020 08:57:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isNRO-0002N4-8Y
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 08:57:18 +0000
X-Inumbo-ID: 59a98105-3907-11ea-8887-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59a98105-3907-11ea-8887-12813bfff9fa;
 Fri, 17 Jan 2020 08:57:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7629EAD56;
 Fri, 17 Jan 2020 08:57:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <8b795995-4f61-af08-2ead-5a841cb709f0@citrix.com>
 <e32e75f1-08f1-bdff-b347-23293dafb933@suse.com>
 <9a0fb4ab-831d-f293-7fa1-b969a1571690@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <149c932d-16b6-f0da-9f7f-1e10cd7e74c5@suse.com>
Date: Fri, 17 Jan 2020 09:57:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9a0fb4ab-831d-f293-7fa1-b969a1571690@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] EFI development issues
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAyMToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMS8yMDIw
IDE2OjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMDEuMjAyMCAxNzowMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IMKgIChXYWl0aW5nIGZvciBhCj4+PiBrZXlwcmVzcyBvbiBTdGRJ
biBob3dldmVyIGRvZXMgd29yaywgd2hpY2ggaXMgaG93IEkgZXZlbnR1YWxseSBkaWFnbm9zZWQK
Pj4+IHRoYXQgaXQgd2FzIGFuIG91dHB1dCBwcm9ibGVtLinCoCBTa2lwcGluZyB0aGlzIGxvZ2lj
IGFsbG93cyBkZWJ1Z2dpbmcgdG8KPj4+IHdvcmsuCj4+IEFzIHNob3VsZCB0aGVuIGRvIC1iYXNl
dmlkZW8uCj4gCj4gVGhhdCBpcyBhbm90aGVyIG9ic2VydmF0aW9uLsKgIEl0IGlzIHZlcnkgY29u
ZnVzaW5nIGhhdmluZyBjb21tYW5kIGxpbmUKPiBwYXJhbWV0ZXJzIHRvIHhlbi5lZmkgd2hpY2gg
YXJlIGRpZmZlcmVudCB0byBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyB0bwo+IFhlbi7CoCBUaGUg
cGFyYW1ldGVycyB0byB4ZW4uZWZpIGFyZW4ndCBkb2N1bWVudGVkIGFueXdoZXJlLCBhcyBmYXIg
YXMgSQo+IGNhbiB0ZWxsLgoKV2VsbCwgaWYgInhlbi5lZmkgLWhlbHAiIGRvZXNuJ3QgY291bnQs
IHRoZW4geWVzLCB0aGlzIG1heSB3YW50IGFkZGluZwp0byBlZmkucGFuZG9jLiBUaGUgLWNmZyBv
cHRpb24gaXMgbWVudGlvbmVkIHRoZXJlIChhbGJlaXQgbm90IGluIGEKc3lzdGVtYXRpYyBtYW5u
ZXIpLCBhbmQgdGhlIG9ubHkgb3RoZXIgcG9zc2libHkgdXNlZnVsIG9wdGlvbiB0aGF0IHdhcwp0
aGVyZSBmcm9tIHRoZSBiZWdpbm5pbmcgd2FzIC1iYXNldmlkZW87IC1tYXBicyBhcHBlYXJlZCBv
bmx5IGxhdGVyLgpXaGVuIGNyZWF0aW5nIHRoYXQgZG9jLCBmb2N1cyB3YXMgY2xlYXJseSBvbiB0
aGUgY29tbW9ubHkgdXNlZCBhc3BlY3RzLgoKPj4+IFdoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgY2hh
bmdpbmcgdG8gYSBkaWZmZXJlbnQgbW9kZT/CoCBDZXJ0YWlubHkgYXMgZmFyCj4+PiBhcyBzZXJp
YWwgY29uc29sZXMgZ28sIHN0aWNraW5nIHdpdGggdGhlIG1vZGUgdGhlIGxvYWRlciB1c2VzIGNl
cnRhaW5seQo+Pj4gZmVlbHMgbGlrZSBhIHNhZmVyIG9wdGlvbi4KPj4gRG9lcyBhIHNlcmlhbCBj
b25zb2xlIHJlcG9ydCBhICJyZXNvbHV0aW9uIiBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4gCj4gSG93
IHdvdWxkIEkgZmluZCBvdXQ/CgpZb3UgY291bGQgbG9nIHRoZSB2YWx1ZXMgZm91bmQgaW4gY2Fz
ZSBvZiBhIHB1cmUgc2VyaWFsIGNvbnNvbGUKc2V0dXAgKGkuZS4gaGVhZGxlc3MpLiBCdXQgdGhl
IG11bHRpcGxleGVkIGNhc2UgaXMgZ29pbmcgdG8gYmUgdGhlCm1vcmUgaW52b2x2ZWQgb25lIGFu
eXdheS4KCj4+IEFuZAo+PiBpZiB3ZSB3ZXJlIGFibGUgdG8gKHN1ZmZpY2llbnRseSBlYXNpbHkp
IHRlbGwgdmlkZW8gZnJvbSBzZXJpYWwKPj4gY29uc29sZSwgaG93IHdvdWxkIHdlIGRlYWwgd2l0
aCB0aGUgY2FzZSBvZiBTdGRPdXQgLyBTdGRFcnIgYmVpbmcKPj4gbXVsdGlwbGV4ZWQgdG8gYm90
aD8KPiAKPiBJbiBteSBjYXNlIHRoZXkgYXJlIG11bHRpcGxleGVkLCBhbmQgYWxsIHdvcmsgZmlu
ZSBiZWZvcmUgc2V0X21vZGUoKSBjYWxsLgo+IAo+IEFmdGVyIHNldF9tb2RlKCksIFZHQSBzdGls
bCB3b3Jrcywgd2hpbGUgc2VyaWFsIHNlZXMgbm90aGluZyBmdXJ0aGVyIG9uCj4gU3RkT3V0L1N0
ZGVyciAocHJlLWV4aXN0aW5nIGxpbmVzIGFyZSBzdGlsbCBpbiBwbGFjZSkuCgpVbmZvcnR1bmF0
ZWx5IHRoZSB0d28gb2YgdGhlIHRocmVlIEVGSSBib3hlcyBJIHJvdXRpbmVseSB3b3JrIHdpdGgK
YW5kIHRoYXQgSSd2ZSB0cmllZCBtdXgtZWQgY29uZmlndXJhdGlvbnMgb24gaGFkIG5vIHN1Y2gg
aXNzdWUsIHNvCkknbSBhZnJhaWQgSSBjb3VsZG4ndCBlYXNpbHkgZGVidWcgdGhpcyBteXNlbGYg
ZXZlbiBpZiBJIHdhbnRlZCB0by4KQnV0IGFueXdheSwgc2l0dWF0aW9ucyBsaWtlIHRoaXMgb25l
IGFyZSBleGFjdGx5IHdoeSAtYmFzZXZpZGVvIGhhcwpiZWVuIHRoZXJlIGZyb20gdGhlIHZlcnkg
YmVnaW5uaW5nLgoKRm9yIHN5c3RlbXMgd2l0aCBhIHZpZGVvIGRldmljZSwgdGhlIG1vZGUgc2V0
IGhlcmUgbWF5IGJlIHRoZSBtb2RlCmFuIGV2ZW50dWFsIFggZHJpdmVyIGFsc28gdXNlczsgc2Fk
bHkgTGludXgnZXMga2VybmVsIG1vZGUgc2V0dGluZwpsb29rcyB0byBiZSBoYXZpbmcgYSBoaWdo
IChhbmQgaW5jcmVhc2luZykgZmFpbHVyZSByYXRlIGFjY29yZGluZwp0byBteSBleHBlcmllbmNl
LiBQb3NzaWJseSBtdWNoIGxpa2UgdGhlIGhpZ2ggcmF0ZSBvZiBFRkkgaXNzdWVzCnlvdSBvYnNl
cnZlIC8gZ2V0IHJlcG9ydGVkLCBhcyBvcHBvc2VkIHRvIG1lIG5vdCBoYXZpbmcgc2VlbiBtb3N0
Cm9mIHRoZW0gb24gdGhlIGJveGVzIEkgd29yayB3aXRoIGFsbCB0aGUgdGltZSAoaS5lLiBzaW1w
bHkgYmFkIHZzCmdvb2QgbHVjaykuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
