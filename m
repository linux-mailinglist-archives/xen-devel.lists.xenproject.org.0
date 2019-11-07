Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752CDF2D9B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 12:42:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSg8j-0003h1-8f; Thu, 07 Nov 2019 11:39:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSg8h-0003gu-Q8
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 11:39:47 +0000
X-Inumbo-ID: 4c640ec4-0153-11ea-a1c2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c640ec4-0153-11ea-a1c2-12813bfff9fa;
 Thu, 07 Nov 2019 11:39:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4B75AF19;
 Thu,  7 Nov 2019 11:39:45 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <542838a9-8e9d-f1e8-4f7e-af5fc75ba3fe@suse.com>
 <a3b8cbc1-d26a-38d0-7bd8-0011b54d2d13@suse.com>
 <c65260f0-8228-f55d-4c29-c5a030c540a8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c88dca0-1cc0-762d-6a3f-c6e4c7a66d06@suse.com>
Date: Thu, 7 Nov 2019 12:39:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c65260f0-8228-f55d-4c29-c5a030c540a8@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH] build: provide option to disambiguate
 symbol names
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMjAxOSAxMjowMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS83LzE5IDc6
MjAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyNC4xMC4yMDE5IDE1OjMxLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IFRoZSAuZmlsZSBhc3NlbWJsZXIgZGlyZWN0aXZlcyBnZW5lcmF0ZWQg
YnkgdGhlIGNvbXBpbGVyIGRvIG5vdCBpbmNsdWRlCj4+PiBhbnkgcGF0aCBjb21wb25lbnRzIChn
Y2MpIG9yIGp1c3QgdGhlIG9uZXMgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxpbmUKPj4+IChj
bGFuZywgYXQgbGVhc3QgdmVyc2lvbiA1KSwgYW5kIGhlbmNlIG11bHRpcGxlIGlkZW50aWNhbGx5
IG5hbWVkIHNvdXJjZQo+Pj4gZmlsZXMgKGluIGRpZmZlcmVudCBkaXJlY3RvcmllcykgbWF5IHBy
b2R1Y2UgaWRlbnRpY2FsbHkgbmFtZWQgc3RhdGljCj4+PiBzeW1ib2xzIChpbiB0aGVpciBrYWxs
c3ltcyByZXByZXNlbnRhdGlvbikuIFRoZSBiaW5hcnkgZGlmZmluZyBhbGdvcml0aG0KPj4+IHVz
ZWQgYnkgeGVuLWxpdmVwYXRjaCwgaG93ZXZlciwgZGVwZW5kcyBvbiBoYXZpbmcgdW5pcXVlIHN5
bWJvbHMuCj4+Pgo+Pj4gUHJvdmlkZSBhIEtjb25maWcgb3B0aW9uIHRvIGNvbnRyb2wgdGhlIChi
dWlsZCkgYmVoYXZpb3IsIGFuZCBpZiBlbmFibGVkCj4+PiB1c2Ugb2JqY29weSB0byBwcmVwZW5k
IHRoZSAocmVsYXRpdmUgdG8gdGhlIHhlbi8gc3ViZGlyZWN0b3J5KSBwYXRoIHRvCj4+PiB0aGUg
Y29tcGlsZXIgaW52b2tlZCBTVFRfRklMRSBzeW1ib2xzLgo+IAo+IFRoaXMgaXMgYSBnb29kIGV4
cGxhbmF0aW9uLCBhbmQgSSB0aGluayB0aGUgY2hhbmdlcyBtYWtlIHNlbnNlLiAgQnV0Cj4gdW5m
b3J0dW5hdGVseS4uLgo+IAo+Pj4gQ29uZGl0aW9uYWxpemUgZXhwbGljaXQgLmZpbGUgZGlyZWN0
aXZlIGluc2VydGlvbiBpbiBDIGZpbGVzIHdoZXJlIGl0Cj4+PiBleGlzdHMganVzdCB0byBkaXNh
bWJpZ3VhdGUgbmFtZXMgaW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBub3RlIHRoYXQKPj4+IGF0
IHRoZSBzYW1lIHRpbWUgdGhlIHJlZHVuZGFudCBlbWlzc2lvbiBvZiBTVFRfRklMRSBzeW1ib2xz
IGdldHMKPj4+IHN1cHByZXNzZWQgZm9yIGNsYW5nLiBBc3NlbWJsZXIgZmlsZXMgYXMgd2VsbCBh
cyBtdWx0aXBseSBjb21waWxlZCBDCj4+PiBvbmVzIHVzaW5nIF9fT0JKRUNUX0ZJTEVfXyBhcmUg
bGVmdCBhbG9uZSBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gLi4uSSBkb24ndCBmb2xsb3cgdGhp
cyBhdCBhbGwuICBXaGF0IGRvZXMgdGhlIC5maWxlIGRpcmVjdGl2ZSBkbyBpbgo+IHRob3NlIHBs
YWNlcywgYW5kIHdoeSBpcyBpdCBhbiBpc3N1ZT8KCkFzIGV4cGxhaW5lZCBhdCB0aGUgYmVnaW5u
aW5nIG9mIHRoZSBkZXNjcmlwdGlvbiwgZm9yIHNvbWUgZGlyL2ZpbGUuYwpwYXNzZWQgdG8gdGhl
IGNvbXBpbGVyLAotIGdjYyBlbWl0cyAiLmZpbGUgZmlsZS5jIiwKLSBjbGFuZyBlbWl0cyAiLmZp
bGUgZGlyL2ZpbGUuYyIuCkl0IHdhcyBhIGxvbmcgdGltZSBhZ28gdGhhdCB3ZSBoYWQgbm90aWNl
ZCBpc3N1ZXMgd2l0aCBzdGF0aWMgc3ltYm9scwpiZWNhdXNlIG9mIGdjYyBvbWl0dGluZyB0aGUg
ZGlyZWN0b3J5IHBhcnQuIEhlbmNlIHNvbWUgLmZpbGUKZGlyZWN0aXZlcyBnb3QgaW5zZXJ0ZWQg
aW4gc291cmNlIGZpbGVzIHdoZXJlIHdlIG5vdGljZWQgaXQgd291bGQKbWF0dGVyLgoKQXMgdG8g
dGhlICJ3aHkgaXMgaXQgYW4gaXNzdWUgcGFydCIgLSB0aGVzZSBkaXJlY3RpdmVzIGdldCBpbiB0
aGUgd2F5Cm9mIHRoZSBuZXcgbWVjaGFuaXNtIChiZWNhdXNlIHdlIGFzayBmb3IgImZpbGUuYyIg
c3ltYm9scyB0byBiZQpyZW5hbWVkLCBub3QgImRpci9maWxlLmMiIG9uZXMpLgoKPiBBbmQgd2h5
IGRvIHdlIGFsd2F5cyBkaXNhYmxlIGl0IGluIGNsYW5nPwoKQmVjYXVzZSwgYXMgcGVyIGFib3Zl
LCBpdCdzIHJlZHVuZGFudCB3aXRoIHdoYXQgdGhlIGNvbXBpbGVyIGluc2VydHMuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
