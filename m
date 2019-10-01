Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDFFC3048
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:33:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEUc-0006cK-KX; Tue, 01 Oct 2019 09:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFEUb-0006cF-0L
 for xen-devel@lists.xen.org; Tue, 01 Oct 2019 09:30:49 +0000
X-Inumbo-ID: 263e967a-e42e-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 263e967a-e42e-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 09:30:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 149441000;
 Tue,  1 Oct 2019 02:30:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B32333F739;
 Tue,  1 Oct 2019 02:30:45 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-5-sstabellini@kernel.org>
 <0eef5f6f-a8f2-4a6c-745f-56a16314d3ac@arm.com>
 <e1ccdeff-58f7-11ff-f07f-1e9457ca578d@gmail.com>
 <d24ff53d-b153-b00f-4374-5fe9fbd80e47@arm.com>
 <alpine.DEB.2.21.1909271627160.2594@sstabellini-ThinkPad-T480s>
 <697f53cd-2e3b-8890-45e8-4897a29b4133@gmail.com>
 <f2f155dd-4387-61ca-9a16-496c958352a7@arm.com>
 <alpine.DEB.2.21.1909301415250.2594@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <56d8660e-1098-603b-1a30-b0118c072e30@arm.com>
Date: Tue, 1 Oct 2019 10:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301415250.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Oleksandr <olekstysh@gmail.com>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDAxLzEwLzIwMTkgMDA6MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDMwIFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIE9sZWtz
YW5kciwKPj4KPj4gT24gMzAvMDkvMjAxOSAxMDozNCwgT2xla3NhbmRyIHdyb3RlOgo+Pj4gT24g
MjguMDkuMTkgMDI6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4+IEkgaGF2ZSB0
byBhZG1pdCB0aGF0IEkgZG9uJ3Qga25vdyBhYm91dCBkb20wbGVzcyBmZWF0dXJlIGVub3VnaCAu
Li4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gQnV0LCBzaG91bGRuJ3Qgd2UgY2hlY2sgaWYgdGhlIGRl
dmljZSBpcyBiZWhpbmQgdGhlIElPTU1VIGFuZCB0cnkgdG8KPj4+Pj4+IGFkZAo+Pj4+Pj4gaXQg
KGlvbW11X2FkZF9kdF9kZXZpY2UpIGJlZm9yZSBhc3NpZ25pbmcgaXQgKHRoaXMgaXMgbmVlZGVk
IGZvcgo+Pj4+Pj4gZHJpdmVycwo+Pj4+Pj4gd2hpY2ggc3VwcG9ydCBnZW5lcmljIElPTU1VIERU
IGJpbmRpbmdzIGluIHRoZSBmaXJzdCBwbGFjZSkuCj4+Pj4+Pgo+Pj4+Pj4gW3BsZWFzZSB0YWtl
IGEgbG9vayBhdAo+Pj4+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAyNzE0Lmh0bWwKPj4+Pj4+IGlmIHNvXQo+Pj4+Pj4K
Pj4+Pj4+IEp1bGllbiwgd2hhdCBkbyB5b3UgdGhpbms/Cj4+Pj4+IFllcyB5b3UgYXJlIHJpZ2h0
Lgo+Pj4+Pgo+Pj4+PiBAU3RlZmFubywgdGhpcyBpcyBhIHJlY2VudGx5IG1lcmdlZCBmZWF0dXJl
LiBXaXRob3V0IGl0LCB5b3Ugd2lsbCBub3QgYmUKPj4+Pj4gYWJsZSB0byB1c2UgcGFzc3Rocm91
Z2ggd2l0aCBkb20wbGVzcyBndWVzdCB3aGVuIHRoZSBJT01NVSAoc3VjaCBhcwo+Pj4+PiBJUE1N
VSkgaXMgdXNpbmcgdGhlIGdlbmVyaWMgRFQgYmluZGluZ3MuCj4+Pj4gSnVzdCBkb3VibGUtY2hl
Y2tpbmcgYnV0IGl0IHNob3VsZCBiZSBvbmx5IGEgbWF0dGVyIG9mIHRoZSBmb2xsb3dpbmcsCj4+
Pj4gcmlnaHQ/Cj4+Pj4KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmVzID0gaW9tbXVfYWRkX2R0X2Rl
dmljZShub2RlKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgPCAwICkKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmVzOwo+Pj4KPj4+IEkgdGhpbmssIHRoZSBjaGFu
Z2UgYWJvdmUgaXMgY29ycmVjdC4KPj4+Cj4+Pgo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKCBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKG5vZGUpICkKPj4+PiArwqDCoMKgwqDCoMKgwqAg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcyA9IGlvbW11X2Fzc2lnbl9kdF9kZXZp
Y2Uoa2luZm8tPmQsIG5vZGUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggcmVz
IDwgMCApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmVzOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gKwo+Pj4+Cj4+Pj4gKEkgYW0gYXNraW5nIGJlY2F1
c2UgSSBjb3VsZG4ndCBxdWl0ZSB0ZXN0IGl0IGR1ZSB0byB0aGUgZXJyb3Igd2l0aAo+Pj4+IG1t
dS1tYXN0ZXJzIEkgbWVudGlvbmVkIGluIHRoZSBvdGhlciBlbWFpbC4pCj4+PiBSZWdhcmRpbmcg
dGhlIGNoZWNrICJpZiAoZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChub2RlKSkiIGhlcmUuIEkgdGhp
bmssIGl0Cj4+PiBkZXBlbmRzIG9uIHRoZSAieGVuLHBhdGgiIHB1cnBvc2UuCj4+Pgo+Pj4gMS4g
SWYgInhlbixwYXRoIiBwcm9wZXJ0eSBpcywgbGV0IHNheSwgY2xvc2UgdG8gImR0ZGV2IiBwcm9w
ZXJ0eSBpbiBkb21haW4KPj4+IGNvbmZpZyBmaWxlLCB3aGVyZSB3ZSBkZXNjcmliZSBtYXN0ZXIg
ZGV2aWNlcyB3aGljaCBhcmUgYmVoaW5kIHRoZSBJT01NVSwgc28KPj4+ICptdXN0KiBiZSBwcm90
ZWN0ZWQsIHRoZW4gdGhhdCBjaGVjayBzaG91bGQgYmUgcmVtb3ZlZC4gUGxlYXNlIHNlZQo+Pj4g
aW9tbXVfZG9fZHRfZG9tY3RsKCkuCj4+Pgo+Pj4gMi4gSWYgInhlbixwYXRoIiBwcm9wZXJ0eSBj
YW4gYWxzbyBiZSB1c2VkIHRvIGRlc2NyaWJlIGRldmljZXMgd2hpY2ggYXJlIG5vdAo+Pj4gYmVo
aW5kIHRoZSBJT01NVSAoc28gZG9uJ3QgbmVlZCB0byBiZSBwcm90ZWN0ZWQpLCBidXQganVzdCBm
b3IgdGhlCj4+PiAiaW50ZXJydXB0IG1hcHBpbmdzIiBwdXJwb3NlcywgdGhlbiB0aGF0IGNoZWNr
IGlzIGNvcnJlY3QgYW5kIHNob3VsZCByZW1haW4uCj4+Cj4+IFNvbWUgZGV2aWNlIG1heSBub3Qg
YmUgYmVoaW5kIGFuIElPTU1VIGJ1dCBzdGlsbCBkbyBETUEuIFdlIGFyZSBub3QgZG9pbmcgYQo+
PiBmYXZvciB0byB0aGUgdXNlciB0byBjb250aW51ZSB0aGUgYXNzaWdubWVudCBhcyB0aGlzIGNv
dWxkIGxlYWQgdG8gYXQgYmVzdCB0bwo+PiBhIG5vbi13b3JraW5nIGRldmljZSAoYXQgd29yc3Qg
YSBzZWN1cml0eSBpc3N1ZSkuCj4+Cj4+IFRoZXJlZm9yZSBJIGFtIGFnYWluc3QgdGhlIHNvbHV0
aW9uIDIpLgo+IAo+IEkgYWdyZWUuIChBbmQgaG9uZXN0bHksICJ4ZW4scGF0aCIgd2FzIGludHJv
ZHVjZWQgYXMgYW4gZXF1aXZhbGVudCBvZgo+ICJkdGRldiIgaW5pdGlhbGx5LikKPiAKPiAKPj4g
SG93ZXZlciwgdGhpcyByYWlzZXMgc29tZSBxdWVzdGlvbnMgd2h5IE1NSU9zIGFyZSB0cmVhdGVk
IGRpZmZlcmVudGx5IChpLmUKPj4gdGhleSBkb24ndCBuZWVkIGFuIElPTU1VKS4KPj4KPj4gSW4g
dGhlIGN1cnJlbnQgc2V0dXAsIHlvdSB3b3VsZCBub3QgYmUgYWJsZSB0byBwYXNzdGhyb3VnaCBh
IG5vbiBETUEtY2FwYWJsZQo+PiB0byBhIGd1ZXN0IGlmIHRoZXkgbmVlZHMgaW50ZXJydXB0cyAo
ZS5nLiBhbiBVQVJUKSBidXQgeW91IHdvdWxkIGJlIGlmIHRoZXkKPj4gZG9uJ3QgdXNlIGludGVy
cnVwdHMuCj4+Cj4+IFNvIEkgdGhpbmsgd2UgbmVlZCBhIGNvdXBsZSBvZiBtb3JlIGNoYW5nZXM6
Cj4+ICAgICAxKSBJbnRyb2R1Y2UgYW4gb3B0aW9uIHRvIGFsbG93IHRoZSB1c2VyIHRvIGlnbm9y
ZSBJT01NVSBpc3N1ZXMgKHNvbWV0aGluZwo+PiBsaWtlICJ4ZW4sZm9yY2UtYXNzaWduLXdpdGhv
dXQtaW9tbXUiKS4KPj4gICAgIDIpICJ4ZW4scmVnIiBjYW5ub3QgYmUgc3BlY2lmaWVkIHdpdGhv
dXQgInhlbixwYXRoIi4gVGhpcyBhbGxvd3MgdXMgdG8KPj4gcG9saWNlIHRoZSB1c2VyIERULgo+
IAo+IEludGVyZXN0aW5nIHF1ZXN0aW9ucy4KPiAKPiBTb21ldGhpbmcgbGlrZSAieGVuLGZvcmNl
LWFzc2lnbi13aXRob3V0LWlvbW11IiB3b3VsZCBiZSB1c2VmdWwuIFRoZQo+IHVwc2lkZSBvZiBi
ZWluZyBhYmxlIHRvIGFzc2lnbiBhIG5vbi1JT01NVS1wcm90ZWN0ZWQgbm9uLURNQS1jYXBhYmxl
Cj4gZGV2aWNlIG91dHdlaWdocyB0aGUgZG93bnNpZGVzLgo+IAo+IEkgYW0gbGVzcyBzdXJlIGFi
b3V0IGhhdmluZyB0byBzcGVjaWZ5ICJ4ZW4scmVnIiB0b2dldGhlciB3aXRoCj4gInhlbixwYXRo
Ii4gSXQgaXMgZmFpcmx5IGNvbW1vbiB0byBoYXZlIGEgY29udHJvbCByZWdpc3RlciBNTUlPIHJl
Z2lvbgo+IHBhZ2UgaW4gRlBHQSB0aGF0IGRvZXNuJ3QgZG8gYW55IERNQSBhbmQgaGFzIG5vIHJl
bGF0ZWQgaW50ZXJydXB0cy4gSW4KPiB0aG9zZSBjYXNlcywgaXQgaXMgbmljZSB0byBiZSBhYmxl
IHRvIGhhbmRsZSBpdCBieSBqdXN0IGhhdmluZyBvbmUKPiAieGVuLHJlZyIgcHJvcGVydHkuIEJ1
dCBtYXliZSBpZiB0aGUgdXNlciBhbHNvIHBhc3Nlcwo+ICJ4ZW4sZm9yY2UtYXNzaWduLXdpdGhv
dXQtaW9tbXUiIHRoZW4gd2UgY291bGQgYWxzbyBpZ25vcmUgYSBtaXNzaW5nCj4gInhlbixwYXRo
Ii4KPiAKPiBJbiBhbnkgY2FzZSwgbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBrZWVwIHRoZSBz
ZXJpZXMgYXMgaXMgZm9yIG5vdywKPiBhbmQgbWFrZSB0aGVzZSBjaGFuZ2VzIGxhdGVyLiAKCkJp
bmRpbmdzIGFyZSBtZWFudCB0byBiZSBzdGFibGUsIHNvIHdlIHdvdWxkIGVuZCB1cCB0byBoYXZl
IHRvIGNyZWF0ZSBhIG5ldyAKYmluZGluZ3MgdG8gY2F0ZXIgdGhlIHNvbHV0aW9uIGRpc2N1c3Nl
ZCBoZXJlLiBTbyBJIHdvdWxkIHJhdGhlciBhdm9pZCB0byB0YWtlIAp0aGF0IGFwcHJvYWNoLgoK
PiBIb3dldmVyLCBmb3IgdGhlIHNha2Ugb2YgbW92aW5nIHRoaW5ncwo+IGZvcndhcmQgcXVpY2ts
eSwgSSBhbHNvIGltcGxlbWVudGVkIEp1bGllbidzIHN1Z2dlc3Rpb25zLiBTbyBJJ2xsIHNlbmQK
PiB0d28gdjcgdXBkYXRlcyB0byB0aGlzIHNlcmllczoKPiAKPiAtIHY3YTogdGhlIG1pbmltYWwg
Y2hhbmdlcyB2ZXJzaW9uLCB3aXRob3V0IHRoaW5ncyBkaXNjdXNzZWQgaGVyZSBleGNlcHQKPiAg
ICAgICAgIGZvciByZW1vdmluZyB0aGUgImlmIChkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKG5vZGUp
KSIgY2hlY2sKPiAtIHY3YjogYSB2ZXJzaW9uIHdpdGggYWxsIHRoZSBjaGFuZ2VzIGRpc2N1c3Nl
ZCBoZXJlCj4gCj4gSnVsaWVuLCBJJ2xsIGxldCB5b3UgcGljayB5b3VyIGZhdm9yaXRlLCBob3Bl
ZnVsbHkgb25lIG9mIHRoZW0gd2lsbCBiZQo+IHRvIHlvdXIgbGlraW5nLgoKVGhhbmsgeW91IGZv
ciBzdWdnZXN0aW5nIHRoZSB0d28gdmVyc2lvbnMuIEkgd2lsbCBoYXZlIGEgbG9vayBhdCB0aGVt
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
