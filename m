Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E088161E0F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 00:50:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3q6A-0002zf-AK; Mon, 17 Feb 2020 23:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q5L1=4F=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j3q68-0002za-2q
 for xen-devel@lists.xen.org; Mon, 17 Feb 2020 23:46:44 +0000
X-Inumbo-ID: bf32780a-51df-11ea-80a6-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf32780a-51df-11ea-80a6-12813bfff9fa;
 Mon, 17 Feb 2020 23:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xnz1jmeyCF9ORdFfdw2KyqUIy/cxfYuW/yN6OLAt334=; b=QQF+AsNe/F/SutrPYpJGrZ58wy
 BivD12Q1XLIYcNDOyCzkhqfNPOv3GOFz1VMdjMn2fJiTmsVV6/fF1IZI8jOaHu2rFjuW+t6ZxYYi+
 zNJ3TVWgBxOHuwKr9dppXxf6vu4JpUryV+LCAhO/MqMStVesbXGbv8JBnu8EGtgd8Gjc=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:47370
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j3q7o-000059-RH; Tue, 18 Feb 2020 00:48:28 +0100
To: Sarah Newman <srn@prgmr.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
References: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
 <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Openpgp: preference=signencrypt
Autocrypt: addr=sander@eikelenboom.it; prefer-encrypt=mutual; keydata=
 mQMuBFNFDU0RCACWtSq295Y0xaUP3k7jub63jXIfXgGJ+LUbLJeS0mOeRC+xftv3qk9U2aTi
 z0Glopirh/6aRXb+rcxQ9hOVNfRHKvnHPyb1yC5zNadDAj+E+fO/iW0Yco5OnwUhNfEMkKT9
 WKRW4oWD/uv9CkHRaPNZbX3Sd1u1ns0LUML3ayws/kUb7FPrh1CZVhgvfJuD85Kj1YpbHUyU
 v2nWBT+hoYEfT8y4SfhDPy9UMXrPlUGPFACvWfBy76mxpdTtzfuDk8r1s4hbvVKty29VBEcH
 0fFKZmqsywhDWTP9ILibk0azXRvA+6ZD6D9WUBZ0TfC8vy1eG0zEDF7yOThatoYuWlqHAQC1
 OFOG97B+zbc1R1HTYZUreUt28VQ1v+2pG/sZj0Mcgwf+N1UdiyS96pFYXUD9z0lQztCETF+I
 P/tiDapjhlQld6LGfHO3Qk3/tMtgh32TMxOjCTNrP1fn3eOdDRwyn7ZSzcIMZ0j55DXp5ut9
 NJ0UxXMGnOWm/Lcz81EhR6QxR6EdgL5iCsJjqSq8DMaBz+dswanOksPrGzJ+IHFYYesRRzdE
 Z9dQpARCry4c0vX3wX4BG+vRdYHKfM4tHvr+wdM7U3F1ta8C0HU+lFfAH7/nhpxLB9/Ibin8
 9+KItaujo4XJhOx8QLNnJiU1bPOvUHGqX2WUn8yb1eLgCx9nZ4YUrP1YDiilrMx9hGMdl0hk
 gKKoMWh8B2/qChSuKMI2Kwu+uwgAlqz0QuQkWFTLbXLpyHcnayT7TVKsAMgn7i0kl8CaeW9i
 /r62k2l2yZIXtJuLBEJ1qVZ1P1sXUYuFqIlOjW0VKyJ3IZa6cTLQfRxVN+ETGtAUGJvUpaNa
 n84nG3vAnmSmCnHDWBxr66wF4+UnIj0sHPlYclJGy/mrxs+OhhCog5NvbpzWAiLeZ1MeyNs+
 JwWzW7I4o7PcHAt74PpVDiwhuPUZJs2fXi4u73lPxVfTKJHEHJrxbfgQP/qeWebIwADj1X4q
 s5njcvNBE+ier8EVwbyTBL7Fzf39Grw/9Kf4CiUCu7kxQTRyHyT/nJWuaMdR00yqEVGctv2n
 e3qrNqGambQqU2FuZGVyIEVpa2VsZW5ib29tIDxzYW5kZXJAZWlrZWxlbmJvb20uaXQ+iIEE
 ExEIACkFAlNFDU0CGwMFCQfIF1MHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRChIPzf
 fJPzZO3KAP9VcRwYdaETTC4+s3gscTMGFDUT+WYcNqpIIn/BLGKuFAD/eglObB2QxiXV4t1T
 ++6WKsvKtNlmrssnOqOmZyqPZQ8=
Message-ID: <2ea581e2-adca-8d5d-a54e-dba86d1535fa@eikelenboom.it>
Date: Tue, 18 Feb 2020 00:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
Content-Language: en-US
Subject: Re: [Xen-devel] CPU Lockup bug with the credit2 scheduler
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
Cc: Alastair Browne <alastair.browne@memset.com>, Glen <glenbarney@gmail.com>,
 Tomas Mozes <hydrapolic@gmail.com>, PGNet Dev <pgnet.dev@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAyMDo1OCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+IE9uIDEvNy8yMCA2OjI1
IEFNLCBBbGFzdGFpciBCcm93bmUgd3JvdGU6Cj4+Cj4+IENPTkNMVVNJT04KPj4KPj4gU28gaW4g
Y29uY2x1c2lvbiwgdGhlIHRlc3RzIGluZGljYXRlIHRoYXQgY3JlZGl0MiBtaWdodCBiZSB1bnN0
YWJsZS4KPj4KPj4gRm9yIHRoZSB0aW1lIGJlaW5nLCB3ZSBhcmUgdXNpbmcgY3JlZGl0IGFzIHRo
ZSBjaG9zZW4gc2NoZWR1bGVyLiBXZQo+PiBhcmUgYm9vdGluZyB0aGUga2VybmVsIHdpdGggYSBw
YXJhbWV0ZXIgInNjaGVkPWNyZWRpdCIgdG8gZW5zdXJlIHRoYXQKPj4gdGhlIGNvcnJlY3Qgc2No
ZWR1bGVyIGlzIHVzZWQuCj4+Cj4+IEFmdGVyIHRoZSB0ZXN0cywgd2UgZGVjaWRlZCB0byBzdGlj
ayB3aXRoIDQuOS4wLjkga2VybmVsIGFuZCA0LjEyIFhlbgo+PiBmb3IgcHJvZHVjdGlvbiB1c2Ug
cnVubmluZyBjcmVkaXQxIGFzIHRoZSBkZWZhdWx0IHNjaGVkdWxlci4KPiAKPiBPbmUgcGVyc29u
IENDJ2VkIGFwcGVhcnMgdG8gYmUgaGF2aW5nIHRoZSBzYW1lIGV4cGVyaWVuY2UsIHdoZXJlIHRo
ZSBjcmVkaXQyIHNjaGVkdWxlciBsZWFkcyB0byBsb2NrdXBzIChpbiB0aGlzIGNhc2UgaW4gdGhl
IGRvbVUsIG5vdCB0aGUgZG9tMCkgdW5kZXIgCj4gcmVsYXRpdmVseSBoZWF2eSBsb2FkLiBJdCBz
ZWVtcyBwb3NzaWJsZSB0aGV5IG1heSBoYXZlIHRoZSBzYW1lIHJvb3QgY2F1c2UuCj4gCj4gSSBk
b24ndCB0aGluayB0aGVyZSBhcmUsIGJ1dCBoYXZlIHRoZXJlIGJlZW4gYW55IHBhdGNoZXMgc2lu
Y2UgdGhlIDQuMTMuMCByZWxlYXNlIHdoaWNoIG1pZ2h0IGhhdmUgZml4ZWQgcHJvYmxlbXMgd2l0
aCBjcmVkaXQgMiBzY2hlZHVsZXI/IElmIG5vdCwgCj4gd2hhdCB3b3VsZCB0aGUgbmV4dCBzdGVw
IGJlIHRvIGlzb2xhdGluZyB0aGUgcHJvYmxlbSAtIGEgZGVidWcgYnVpbGQgb2YgWGVuIG9yIHNv
bWV0aGluZyBlbHNlPwo+IAo+IElmIHRoZXJlIGFyZSBubyBtZXJnZWQgb3IgcHJvcG9zZWQgZml4
ZXMgc29vbiwgaXQgbWF5IGJlIHdvcnRoIGNvbnNpZGVyaW5nIG1ha2luZyB0aGUgY3JlZGl0IHNj
aGVkdWxlciB0aGUgZGVmYXVsdCBhZ2FpbiB1bnRpbCBwcm9ibGVtcyB3aXRoIHRoZSAKPiBjcmVk
aXQyIHNjaGVkdWxlciBhcmUgcmVzb2x2ZWQuCj4gCj4gVGhhbmtzLCBTYXJhaAo+IAo+IAoKSGkg
U2FyYWggLyBBbGFzdGFpciwKCkkgY2FuIG9ubHkgcHJvdmlkZSBteSBuPTEgKE9LLCBJJ20gcnVu
bmluZyBhIGJ1bmNoIG9mIGJveGVzLCBzb21lIG9mIHdoaWNoIHByZXR0eSBvdmVyLWNvbW1pdHRl
ZCBDUFUgd2lzZSksIApidXQgSSBoYXZlbid0IHNlZW4gYW55IGlzc3VlcyAobGF0ZWx5KSB3aXRo
IGNyZWRpdDIuCgpJIGRpZCB0YWtlIGEgbG9vayBhdCBBbGFzdGFpciBCcm93bmUncyByZXBvcnQg
eW91ciByZXBsaWVkIHRvIChodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAyMC0wMS9tc2cwMDM2MS5odG1sKQphbmQgSSBkbyBzZWUgc29tZSBkaWZmZXJlbmNl
czoKICAgIC0gQWxhc3RhaXIncyBtYWNoaW5lIGhhcyBtdWx0aXBsZSBzb2NrZXRzLCBteSBtYWNo
aW5lcyBkb24ndC4KICAgIC0gSXQgc2VlbXMgQWxhc3RhaXIncyBjb25maWcgaXMgdXNpbmcgYmFs
bG9vbmluZyA/IChkb20wX21lbT00MDk2TSxtYXg6MTYzODRNKSwgZm9yIG1lIHRoYXQgaGFzIGJl
ZW4gYSBzb3VyY2Ugb2YgdHJvdWJsZSBpbiB0aGUgcGFzdCwgc28gbXkgY29uZmlncyBkb24ndC4K
ICAgIC0ga2VybmVsJ3MgdGVzdGVkIGFyZSBxdWl0ZSBvbGQgKDQuMTkuNjcgKGxhdGVzdCB1cHN0
cmVhbSBpcyA0LjE5LjEwNCksIDQuOS4xODkgKGxhdGVzdCB1cHN0cmVhbSBpcyA0LjkuMjE0KSkg
YW5kIG5vIHJlYWxseSBuZXcga2VybmVsIGlzIHRlc3RlZAogICAgICAoNS40IGlzIGF2YWlsYWJs
ZSBpbiBEZWJpYW4gYmFja3BvcnQgZm9yIGJ1c3RlcikuIAogICAgLSBBbGFzdGFpciwgYXJlIHlv
dSB1c2luZyBwdiwgaHZtIG9yIHB2aCBndWVzdHM/IFRoZSByZXBvcnQgc2VlbXMgdG8gbWlzcyB0
aGUgR3Vlc3QgY29uZmlncyAoSSdtIHByaW1hcmlseSB1c2luZyBQVkgsIGFuZCBmZXcgSFZNJ3Ms
IG5vIFBWIGV4Y2VwdCBmb3IgZG9tMCkgPwoKQW55IGhvdywgY291bGQgYmUgd29ydGh3aGlsZSB0
byB0ZXN0IHdpdGhvdXQgYmFsbG9vbmluZywgYW5kIHRlc3QgYSByZWNlbnQga2VybmVsIHRvIHJ1
bGUgb3V0IGFuIGlzc3VlIHdpdGggKG1pc3NpbmcpIGtlcm5lbCBiYWNrcG9ydHMuCgotLQpTYW5k
ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
