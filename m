Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372C1BBD4
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 19:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQEcB-0001wG-1W; Mon, 13 May 2019 17:19:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZP0k=TN=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQEc9-0001wB-Va
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 17:19:50 +0000
X-Inumbo-ID: 4d599736-75a3-11e9-923a-bf748a17c9b8
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d599736-75a3-11e9-923a-bf748a17c9b8;
 Mon, 13 May 2019 17:19:45 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8DE7A3031EB6; Mon, 13 May 2019 20:19:44 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.181.126])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 5C5CA304F234;
 Mon, 13 May 2019 20:19:44 +0300 (EEST)
To: Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <BHLEo8qk7hjPZRHdTZsqgFeG6k2VEbu6AtIB-fGhWL3Y01IYvu3rwUWAWgazUqMPUjx6ReFkMbRnF57DigHupbuhtOoq2mYhNbI-XJ352rA=@protonmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <fef5a0f2-cd1f-126c-c1e5-6d9a10ca928d@bitdefender.com>
Date: Mon, 13 May 2019 20:19:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BHLEo8qk7hjPZRHdTZsqgFeG6k2VEbu6AtIB-fGhWL3Y01IYvu3rwUWAWgazUqMPUjx6ReFkMbRnF57DigHupbuhtOoq2mYhNbI-XJ352rA=@protonmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xMy8xOSA3OjE4IFBNLCBNYXRoaWV1IFRhcnJhbCB3cm90ZToKPiBMZSB2ZW5kcmVkaSwg
bWFpIDEwLCAyMDE5IDU6MjEgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IGEgw6ljcml0wqA6Cj4gCj4+IE9uIDEwLzA1LzIwMTkgMTY6MTcsIE1hdGhpZXUgVGFy
cmFsIHdyb3RlOgo+Pgo+Pj4gTGUgamV1ZGksIG1haSA5LCAyMDE5IDY6NDIgUE0sIEFuZHJldyBD
b29wZXIgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbSBhIMOpY3JpdMKgOgo+Pj4KPj4+PiBUaGVy
ZWZvcmUsIHRoZSBjb25jbHVzaW9uIHRvIGRyYXcgaXMgdGhhdCBpdCBpcyBhIGxvZ2ljYWwgYnVn
IHNvbWV3aGVyZS4KPj4+IFRoZSBidWcgaXMgc3RpbGwgaGVyZSwgc28gd2UgY2FuIGV4Y2x1ZGUg
YSBtaWNyb2NvZGUgaXNzdWUuCj4+Cj4+IEdvb2QgLSB0aGF0IGlzIG9uZSBmdXJ0aGVyIGFuZ2xl
IGV4Y2x1ZGVkLsKgIEFsd2F5cyBtYWtlIHN1cmUgeW91IGFyZQo+PiBydW5uaW5nIHdpdGggdXAt
dG8tZGF0ZSBtaWNyb2NvZGUsIGJ1dCBpdCBsb29rcyBsaWtlIHdlIGJhY2sgdG8KPj4gaW52ZXN0
aWdhdGluZyBhIGxvZ2ljYWwgYnVnIGluIGxpYnZtaSBvciBYZW4uCj4gCj4gSSBwbGF5ZWQgd2l0
aCB0b29sL3Rlc3RzL3hlbi1hY2Nlc3MgdGhpcyBhZnRlcm5vb24uCj4gCj4gVGhlIHRvb2wgaXMg
d29ya2luZywgaSBjb3VsZCBpbnRlcmNlcHQgYnJlYWtwb2ludHMsIGNwdWlkLCB3cml0ZSBhbmQg
ZXhlYyBtZW0gYWNjZXNzZXMsIGV0Yy4uCj4gCj4gSG93ZXZlciwgdXNpbmcgYWx0cDJtIHJlbGF0
ZWQgaW50ZXJjZXB0cyBsZWFkcyB0byBhIGd1ZXN0IGNyYXNoIHNvbWV0aW1lczoKPiAKPiBXaW5k
b3dzIDcgeDY0LCA0IFZDUFVzCj4gLSBhbHRwMm1fd3JpdGU6IGNyYXNoCj4gLSBhbHRwMm1fZXhl
YzogY3Jhc2gKPiAtIGFsdHAybV93cml0ZV9ub19ncHQ6IGZyb3plbgo+IAo+IFdpbmRvd3MgNyB4
NjQsIDEgVkNQVQo+IC0gYWx0cDJtX3dyaXRlOiBjcmFzaAo+IC0gYWx0cDJtX2V4ZWM6IE9LCj4g
LSBhbHRwMm1fd3JpdGVfbm9fZ3B0OiBmcm96ZW4KPiAKPiAiZnJvemVuIiBtZWFucyB0aGF0IHhl
bi1hY2Nlc3MgcmVjZWl2ZXMgVk1JIGV2ZW50cywgYnVnIHRoZSBndWVzdCBpcyBmcm96ZW4gdW50
aWwgSSBkZWNpZGUgdG8gc3RvcCB4ZW4tYWNjZXNzLgo+IEknbSB3b25kZXJpbmcgd2hhdCBraW5k
IG9mIGV4ZWMgZXZlbnRzIGl0IHJlY2VpdmVkIGJlY2F1c2UgdGhleSBhcmUgbm90IHRoZSBzYW1l
LCBzbyBpdCdzIG5vdCBsb29waW5nCj4gb3ZlciB0aGUgc2FtZSBSSVAgb3ZlciBhbmQgb3Zlci4g
KD8pCkkgdGhpbmsgeW91J3JlIHNpbXBseSB0cmlwcGluZyBzb21lIE9TIHRpbWVyIGJlY2F1c2Ug
eW91J3JlIHNsb3dpbmcgdGhlCmd1ZXN0IGRvd24gaW4gdGhlIGNyYXNoIGNhc2UsIGFuZCBzaW1w
bHkga2VlcCB0aGUgZ3Vlc3QgdG9vIGJ1c3kKaGFuZGxpbmcgZXZlbnRzIGluIHRoZSAiZnJlZXpl
IiBjYXNlLiBSZW1lbWJlciB0aGF0IHRoZXJlJ3MgcXVpdGUgYQpkZWxheSBydW5uaW5nIGVhY2gg
b2ZmZW5kaW5nIGluc3RydWN0aW9uOiBvbmUgdm1fZXZlbnQgc2F5aW5nIHlvdSd2ZSBnb3QKYSB2
aW9sYXRpb24sIGEgcmVwbHkgc2F5aW5nICJwdXQgdGhpcyBWQ1BVIGluIHNpbmdsZS1zdGVwIG1v
ZGUgX2FuZF8Kc3dpdGNoIHRvIHRoZSB1bnJlc3RyaWN0ZWQgRVBUIHZpZXciLCBhbm90aGVyIHZt
X2V2ZW50IHNheWluZwoiaW5zdHJ1Y3Rpb24gZXhlY3V0ZWQiLCBmb2xsb3dlZCBieSBhbm9oZXIg
cmVwbHkgc2F5aW5nICJzd2l0Y2ggYmFjayB0bwp0aGUgcmVzdHJpY3RlZCBFUFQgX2FuZF8gdGFr
ZSB0aGUgVkNQVSBvdXQgb2Ygc2luZ2xlLXN0ZXAgbW9kZSIuCgpSZXN0cmljdGluZyB0aGUgd2hv
bGUgb2YgdGhlIGd1ZXN0J3MgbWVtb3J5IChhbmQgc28gZG9pbmcgdGhpcyBkYW5jZSBmb3IKX2V2
ZXJ5XyBpbnN0cnVjdGlvbiBjYXVzaW5nIGEgZmF1bHQpIGlzIHByYWN0aWNhbGx5IGd1YXJhbnRl
ZWQgdG8gdXBzZXQKdGhlIE9TLiBBIGxpdHRsZSBFUFQgcmVzdHJpY3RpbmcgZ29lcyBhIGxvbmcg
d2F5LgoKT2YgY291cnNlLCBpZiB0aGlzIGNvdWxkIGJlIGltcHJvdmVkIHNvIHRoYXQgZXZlbiBz
dHJlc3MtdGVzdHMgKHdoaWNoIGlzCmJhc2ljYWxseSB3aGF0IHhlbi1hY2Nlc3MgaXMpIGxlYXZl
IHRoZSBndWVzdCBydW5uaW5nIHNtb290aGx5LCB0aGF0J2QKYmUgZmFudGFzdGljLgoKClJhenZh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
