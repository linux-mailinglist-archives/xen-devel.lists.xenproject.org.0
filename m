Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7811E48F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:28:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkwr-00068t-Bl; Fri, 13 Dec 2019 13:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifkwq-00068o-3L
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:25:36 +0000
X-Inumbo-ID: 060c1bc2-1dac-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 060c1bc2-1dac-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 13:25:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B837AB202;
 Fri, 13 Dec 2019 13:25:25 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <d48d495dc3ab4ba1869221be36fac343@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f6254b6-a19a-5bf8-0ba7-e0b2479c868b@suse.com>
Date: Fri, 13 Dec 2019 14:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d48d495dc3ab4ba1869221be36fac343@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNDoxMiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDEz
IERlY2VtYmVyIDIwMTkgMTI6NTMKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsgS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+Owo+PiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwKPj4gPGp1bGllbkB4ZW4ub3JnPjsgV2VpIExpdSA8d2xA
eGVuLm9yZz47IEtvbnJhZCBXaWxrCj4+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsKPj4gQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsK
Pj4gSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOp
Cj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENI
IHYyXSBJT01NVTogbWFrZSBETUEgY29udGFpbm1lbnQgb2YgcXVhcmFudGluZWQKPj4gZGV2aWNl
cyBvcHRpb25hbAo+Pgo+PiBDb250YWluaW5nIHN0aWxsIGluIGZsaWdodCBETUEgd2FzIGludHJv
ZHVjZWQgdG8gd29yayBhcm91bmQgY2VydGFpbgo+PiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5n
IGhhcmQgdXBvbiBoaXR0aW5nIGFuIElPTU1VIGZhdWx0LiBQYXNzaW5nCj4+IHRocm91Z2ggKHN1
Y2gpIGRldmljZXMgKG9uIHN1Y2ggc3lzdGVtcykgaXMgaW5oZXJlbnRseSBpbnNlY3VyZSAoYXMK
Pj4gZ3Vlc3RzIGNvdWxkIGVhc2lseSBhcnJhbmdlIGZvciBJT01NVSBmYXVsdHMgdG8gb2NjdXIp
LiBEZWZhdWx0aW5nIHRvCj4+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29t
ZSBhd2FyZSBvZiBpc3N1ZXMgd2l0aCBkZXZpY2VzIGNhbgo+PiBiZSBjb25zaWRlcmVkIHVuZGVz
aXJhYmxlLiBUaGVyZWZvcmUgY29udmVydCB0aGlzIG1vZGUgb2Ygb3BlcmF0aW9uIHRvCj4+IGFu
IG9wdGlvbmFsIG9uZSwgbm90IG9uZSBlbmFibGVkIGJ5IGRlZmF1bHQuCj4+Cj4+IFRoaXMgaW52
b2x2ZXMgcmVzdXJyZWN0aW5nIGNvZGUgY29tbWl0IGVhMzg4Njc4MzFkYSAoIng4NiAvIGlvbW11
OiBzZXQKPj4gdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlIHF1YXJhbnRpbmUgZG9tYWluIikgZGlk
IHJlbW92ZSwgaW4gYSBzbGlnaHRseQo+PiBleHRlbmRlZCBhbmQgYWJzdHJhY3RlZCBmYXNoaW9u
LiBIZXJlLCBpbnN0ZWFkIG9mIHJlaW50cm9kdWNpbmcgYSBwcmV0dHkKPj4gcG9pbnRsZXNzIHVz
ZSBvZiAiZ290byIgaW4gZG9tYWluX2NvbnRleHRfdW5tYXAoKSwgYW5kIGluc3RlYWQgb2YgbWFr
aW5nCj4+IHRoZSBmdW5jdGlvbiAoYXQgbGVhc3QgdGVtcG9yYXJpbHkpIGluY29uc2lzdGVudCwg
dGFrZSB0aGUgb3Bwb3J0dW5pdHkKPj4gYW5kIHJlcGxhY2UgdGhlIG90aGVyIHNpbWlsYXJseSBw
b2ludGxlc3MgImdvdG8iIGFzIHdlbGwuCj4+Cj4+IEluIG9yZGVyIHRvIGtleSB0aGUgcmUtaW5z
dGF0ZWQgYnlwYXNzZXMgb2ZmIG9mIHRoZXJlIChub3QpIGJlaW5nIGEgcm9vdAo+PiBwYWdlIHRh
YmxlIHRoaXMgZnVydGhlciByZXF1aXJlcyBtb3ZpbmcgdGhlIGFsbG9jYXRlX2RvbWFpbl9yZXNv
dXJjZXMoKQo+PiBpbnZvY2F0aW9uIGZyb20gcmVhc3NpZ25fZGV2aWNlKCkgdG8gYW1kX2lvbW11
X3NldHVwX2RvbWFpbl9kZXZpY2UoKSAob3IKPj4gZWxzZSByZWFzc2lnbl9kZXZpY2UoKSB3b3Vs
ZCBhbGxvY2F0ZSBhIHJvb3QgcGFnZSB0YWJsZSBhbnl3YXkpOyB0aGlzIGlzCj4+IGJlbmlnbiB0
byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUgbGF0dGVyIGZ1bmN0aW9uLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBBcyBmYXIg
YXMgNC4xMyBpcyBjb25jZXJuZWQsIEkgZ3Vlc3MgaWYgd2UgY2FuJ3QgY29tZSB0byBhbiBhZ3Jl
ZW1lbnQKPj4gaGVyZSwgdGhlIG9ubHkgb3RoZXIgb3B0aW9uIGlzIHRvIHJldmVydCBlYTM4ODY3
ODMxZGEgZnJvbSB0aGUgYnJhbmNoLAo+PiBmb3IgaGF2aW5nIGJlZW4gY29tbWl0dGVkIHByZW1h
dHVyZWx5IChJJ20gbm90IHNvIG11Y2ggd29ycmllZCBhYm91dCB0aGUKPj4gbWFzdGVyIGJyYW5j
aCwgd2hlcmUgd2UgaGF2ZSBhbXBsZSB0aW1lIHVudGlsIDQuMTQpLiBXaGF0IEkgc3VyZWx5IHdh
bnQKPj4gdG8gc2VlIHVzIGF2b2lkIGlzIGEgYmFjayBhbmQgZm9ydGggaW4gYmVoYXZpb3Igb2Yg
cmVsZWFzZWQgdmVyc2lvbnMuCj4+IChOb3RlIHRoYXQgNC4xMi4yIGlzIHNpbWlsYXJseSBibG9j
a2VkIG9uIGEgZGVjaXNpb24gZWl0aGVyIHdheSBoZXJlLikKPj4KPj4gSSdtIGhhcHB5IHRvIHRh
a2UgYmV0dGVyIHN1Z2dlc3Rpb25zIHRvIHJlcGxhY2UgImZ1bGwiLgo+IAo+IEhvdyBhYm91dCBz
aW1wbHkgInNpbmsiLCBzaW5jZSB0aGF0J3Mgd2hhdCBpdCBkb2VzPwoKQnV0IGl0J3Mgbm90IHJl
YWxseSBhICJzaW5rIiwgYXMgd2Ugc3RpbGwgZmF1bHQgd3JpdGVzICh3aGljaCBpcyB0aGUKb25s
eSB0aGluZyBJIGNhbiBzZWUgdG8gYmUgInN1bmsiIGlmIEknbSBnZXR0aW5nIHRoZSBtZWFuaW5n
IG9mIHRoZQp3b3JkIHJpZ2h0KS4KCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
bW11LmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+PiBAQCAtMzAs
MTMgKzMwLDE3IEBAIGJvb2xfdCBfX2luaXRkYXRhIGlvbW11X2VuYWJsZSA9IDE7Cj4+ICBib29s
X3QgX19yZWFkX21vc3RseSBpb21tdV9lbmFibGVkOwo+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkg
Zm9yY2VfaW9tbXU7Cj4+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV92ZXJib3NlOwo+PiAt
Ym9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X3F1YXJhbnRpbmUgPSB0cnVlOwo+PiAgYm9vbF90IF9f
cmVhZF9tb3N0bHkgaW9tbXVfaWdmeCA9IDE7Cj4+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21t
dV9zbm9vcCA9IDE7Cj4+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9xaW52YWwgPSAxOwo+
PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cmVtYXAgPSAxOwo+PiAgYm9vbF90IF9f
cmVhZF9tb3N0bHkgaW9tbXVfY3Jhc2hfZGlzYWJsZTsKPj4KPj4gKyNkZWZpbmUgSU9NTVVfcXVh
cmFudGluZV9ub25lICAwCj4+ICsjZGVmaW5lIElPTU1VX3F1YXJhbnRpbmVfYmFzaWMgMQo+PiAr
I2RlZmluZSBJT01NVV9xdWFyYW50aW5lX2Z1bGwgIDIKPj4gK3VpbnQ4X3QgX19yZWFkX21vc3Rs
eSBpb21tdV9xdWFyYW50aW5lID0gSU9NTVVfcXVhcmFudGluZV9iYXNpYzsKPiAKPiBJZiB3ZSBo
YXZlICdJT01NVV9xdWFyYW50aW5lX3NpbmsnIGluc3RlYWQgb2YgJ0lPTU1VX3F1YXJhbnRpbmVf
ZnVsbCcsCj4gdGhlbiBob3cgYWJvdXQgJ0lPTU1VX3F1YXJhbnRpbmVfd3JpdGVfZmF1bHQnIGlu
c3RlYWQgb2YKPiAnSU9NTVVfcXVhcmFudGluZV9iYXNpYyc/CgpXaHkgIndyaXRlX2ZhdWx0Ij8g
RXZlbiBpbiAiZnVsbCIgbW9kZSB5b3Ugb25seSBhdm9pZCByZWFkIGZhdWx0cwphaXVpIChzZWUg
YWxzbyBhYm92ZSkuIFNvIGlmIGFueXRoaW5nICJ3cml0ZV9mYXVsdCIgd291bGQgYmUgYQpyZXBs
YWNlbWVudCBmb3IgImZ1bGwiOyAiYmFzaWMiIGNvdWxkIGJlIHJlcGxhY2VkIGJ5IGp1c3QgImZh
dWx0Igp0aGVuLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
