Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4478EA6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:03:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7A1-0005PL-4F; Mon, 29 Jul 2019 15:02:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs79z-0005P7-Cy
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:01:59 +0000
X-Inumbo-ID: cf42ef54-b211-11e9-8740-93dc7d340984
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf42ef54-b211-11e9-8740-93dc7d340984;
 Mon, 29 Jul 2019 15:01:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JjtLm3A5pRED04tgWphh/+Q5kC0hA1WoccKhcDFluGtegSxPjy078cexHFQLiKRsUsoAy3pT7L
 mIeU7nLKEhXUqNWi1hNtIgo7SOXKM/zCfkcaT4k3++uzNrbi9MzHf4DCymR8RTUD9K2d9eKS0a
 ZDkQGtupvUXlmzlZ0rDwPBdx0DO9ihYC31j1154uplRhnqq3fOpcDd+KRbdQ0zm+hU0aQoFMKY
 cMRAsqMS+gEJGrcXP3hbF0UIz4HzQE9LM0Gu/fNWgrHMrx8CpDw6/VP8R7C0WxDsBLce0+w3O5
 jw8=
X-SBRS: 2.7
X-MesageID: 3561879
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3561879"
To: Jan Beulich <JBeulich@suse.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-2-andrew.cooper3@citrix.com>
 <a27cfac4-231b-e06c-11a9-5bf8f839fee2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <998bce0b-dd54-3f64-e759-e6f93b9b278a@citrix.com>
Date: Mon, 29 Jul 2019 16:01:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a27cfac4-231b-e06c-11a9-5bf8f839fee2@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDcvMjAxOSAxNDoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDcuMjAxOSAy
MjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRnV0dXJlIGNoYW5nZXMgYXJlIGdvaW5nIHRv
IG5lZWQgdG8gcGFnZSBhbGlnbiBzb21lIHBlcmNwdSBkYXRhLgo+Pgo+PiBUaGlzIG1lYW5zIHRo
YXQgdGhlIHBlcmNwdSBhcmVhIG5lZWRzIHN1aXRhYmx5IGFsaWduaW5nIGluIHRoZSBCU1Mgc28g
Q1BVMCBoYXMKPj4gY29ycmVjdGx5IGFsaWduZWQgZGF0YS4gIFNodWZmbGUgdGhlIGV4YWN0IGxp
bmsgb3JkZXIgb2YgaXRlbXMgd2l0aGluIHRoZSBCU1MKPj4gdG8gZ2l2ZSAuYnNzLnBlcmNwdS5w
YWdlX2FsaWduZWQgYXBwcm9wcmlhdGUgYWxpZ25tZW50Lgo+Pgo+PiBJbiBhZGRpdGlvbiwgd2Ug
bmVlZCB0byBiZSBhYmxlIHRvIHNwZWNpZnkgYW4gYWxpZ25tZW50IGF0dHJpYnV0ZSB0bwo+PiBf
X0RFRklORV9QRVJfQ1BVKCkuICBSZXdvcmsgaXQgc28gdGhlIGNhbGxlciBwYXNzZXMgaW4gYWxs
IGF0dHJpYnV0ZXMsIGFuZAo+PiBhZGp1c3QgREVGSU5FX1BFUl9DUFV7LF9SRUFEX01PU1RMWX0o
KSB0byBtYXRjaC4gIFRoaXMgaGFzIHRoZSBhZGRlZCBib251cwo+PiB0aGF0IGl0IGlzIG5vdyBw
b3NzaWJsZSB0byBncmVwIGZvciAuYnNzLnBlcmNwdSBhbmQgZmluZCBhbGwgdGhlIHVzZXJzLgo+
IEFuZCBpdCBoYXMgdGhlIG1lYW5pbmdmdWwgZG93bnNpZGUgb2Ygbm93IGV2ZXJ5IHVzZSBzaXRl
IG5lZWRpbmcgdG8gZ2V0Cj4gdGhpbmdzIHJpZ2h0LgoKWW91IHNheSB0aGlzIGFzIGlmIGl0IHRo
ZSBjdXJyZW50IHdheSBvZiBkb2luZyB0aGluZ3MgaXMgYW55dGhpbmcgbW9yZQp0aGFuIGFuIGls
bHVzaW9uIG9mIHByb3RlY3Rpb24uCgo+ICBUaGlzIGlzIG5vdCByZWFsbHkgYSBwcm9ibGVtIHNv
bGVseSBiZWNhdXNlCj4gX19ERUZJTkVfUEVSX0NQVSgpIGlzIGEgaGVscGVyIGZvciBhbGwgdGhl
IHJlYWwgREVGSU5FX1BFUl9DUFUqKCkuIFRoZQo+IGdyZXAtaW5nIGFyZ3VtZW50IGlzIG5vdCBh
IHJlYWxseSBtZWFuaW5nZnVsIG9uZSBpbW8gYW55d2F5IC0geW91IGNvdWxkCj4gYXMgd2VsbCBn
cmVwIGZvciBERUZJTkVfUEVSX0NQVS4KCkFuZCBhcyB1c3VhbCwgb3VyIHBvaW50cyBvZiB2aWV3
IGRpZmZlciBzdWJzdGFudGlhbGx5IGhlcmUuwqAgTG9va2luZyBmb3IKREVGSU5FX1BFUl9DUFUo
KSBkb2Vzbid0IGhlbHAgeW91IGlkZW50aWZ5IHRoZSBzZWN0aW9ucyBpbiB1c2UuwqAgVGhhdApy
ZXF1aXJlcyBhIGZ1cnRoZXIgbGV2ZWwgb2YgaW5kaXJlY3Rpb24uCgo+IEFueXdheSAtIHRoaXMg
aXMgbm90IGFuIG9iamVjdGlvbiB0byB0aGUgY2hvc2VuIGFwcHJvYWNoLCBqdXN0IGEgcmVtYXJr
Lgo+IEknZCBsaWtlIHRvIG5vdGUgdGhvdWdoIHRoYXQgeW91IGV4cGxpY2l0bHkgdW5kbyBzb21l
dGhpbmcgSSBoYWQgZG9uZQo+IChpaXJjKSwgYW5kIEkgbWF5IGZpbmQgb2RkIHdoZW4gcnVubmlu
ZyBpbnRvIGFnYWluIGRvd24gdGhlIHJvYWQsCj4gcG90ZW50aWFsbHkgcmVzdWx0aW5nIGluIGFu
ICJ1bmRvLXRoZS11bmRvIiBwYXRjaC4gSSB0aGluayB3ZSByZWFsbHkKPiBuZWVkIHRvIGZpbmQg
YSB3YXkgdG8gYXZvaWQgcmUtZG9pbmcgdGhpbmdzIHRoYXQgd2VyZSBkb25lIGludGVudGlvbmFs
bHkKPiBpbiBjZXJ0YWluIHdheXMsIHdoZW4gdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB2YXJpYW50
cyBpcyBtZXJlbHkgcGVyc29uYWwKPiB0YXN0ZS4KCktlaXIgaW50cm9kdWNlZCBwZXJjcHUgaW4g
ZWE2MDhjYzM2ZCB3aGVuIERFRklORV9QRVJfQ1BVKCkgd2FzIHByaXZhdGUKdG8geDg2IGFuZCBo
YWQgdGhlIF9fc2VjdGlvbigpIGltcGxpY2l0IGluIGl0LgoKWW91IGNoYW5nZWQgREVGSU5FX1BF
Ul9DUFUoKSB0byBpbmNsdWRlIGEgc3VmZml4IGZvciB0aGUgcHVycG9zZSBvZgppbnRyb2R1Y2lu
ZyBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSgpIGluIGNmYmYxN2ZmYmIwLCBidXQgbm93aGVy
ZSBpcwp0aGVyZSBhbnkgaGludCBvZiBhIHN1Z2dlc3Rpb24gdGhhdCB0aGUgZW5kIHJlc3VsdCB3
YXMgYW55dGhpbmcgbW9yZQp0aGFuIGp1c3QgImhvdyBpdCBoYXBwZW5lZCB0byB0dXJuIG91dCIu
CgoKQXMgdG8gInRoaXMgYmVpbmcgaW50ZW50aW9uYWwgdG8gcmVtb3ZlIG1pc3Rha2VzIi7CoCBU
aGVyZSBhcmUgcGxlbnR5IG9mCndheXMgdG8gc2NyZXcgdGhpcyB1cCwgaW5jbHVkaW5nIHdheXMg
d2hpY2ggZG9uJ3QgaW52b2x2ZSB1c2luZwpfX0RFRklORV9QRVJfQ1BVKCwsICJmb28iKSwgb3Ig
bWFudWFsbHkgaW5zZXJ0aW5nIHNvbWV0aGluZyBpbnRvCi5ic3MucGVyX2NwdSBvdXRzaWRlIG9m
IGFueSBvZiB0aGUgcGVyY3B1IGluZnJhc3RydWN0dXJlLCBhbmQgbm8gYW1vdW50Cm9mIHRlY2hu
aWNhbCBtZWFzdXJlcyBjYW4gY2F0Y2ggdGhpcy4KClRoZSBvbmx5IHJlY291cnNlIGlzIHNlbnNp
YmxlIGNvZGUgcmV2aWV3LCBhbmQgYW55IG9wZW5jb2RlZCB1c2Ugb2YKX19ERUZJTkVfUEVSX0NQ
VSgpIG9yIF9fc2VjdGlvbigiLmJzcy5wZXJfY3B1IiAuLi4pIHN0aWNrIG91dCBpbiBhbgpvYnZp
b3VzIG1hbm5lci4KCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4gKysrIGIveGVu
L2FyY2gveDg2L3hlbi5sZHMuUwo+PiBAQCAtMjkzLDE0ICsyOTMsMTUgQEAgU0VDVElPTlMKPj4g
ICAgICAgICAgX19ic3Nfc3RhcnQgPSAuOwo+PiAgICAgICAgICAqKC5ic3Muc3RhY2tfYWxpZ25l
ZCkKPj4gICAgICAgICAgKiguYnNzLnBhZ2VfYWxpZ25lZCopCj4+IC0gICAgICAgKiguYnNzKQo+
PiAtICAgICAgIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMpOwo+PiAgICAgICAgICBfX3Blcl9j
cHVfc3RhcnQgPSAuOwo+PiArICAgICAgICooLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkKQo+IE5v
dyB0aGlzIGlzIGEgY2FzZSB3aGVyZSBJIHRoaW5rIGFuIGV4cGxpY2l0IEFMSUdOKFBBR0VfU0la
RSkgd291bGQgYmUKPiBkZXNpcmFibGU6IElmIHRoZSBsYXN0IGl0ZW0gaW4gLmJzcy5wYWdlX2Fs
aWduZWQgd2FzIG5vdCBhIG11bHRpcGxlIG9mCj4gUEFHRV9TSVpFIGluIHNpemUsIHRoZW4gX19w
ZXJfY3B1X3N0YXJ0IHdvdWxkIGxpdmUgbmVlZGxlc3NseSBlYXJseSwKPiBwb3NzaWJseSBpbmNy
ZWFzaW5nIG91ciBtZW1vcnkgb3ZlcmhlYWQgYnkgYSBwYWdlIHBlciBDUFUgZm9yIG5vIGdhaW4K
PiBhdCBhbGwuCgpIbW0sIHllcy7CoCBXZSBzaG91bGQgZG8gb3VyIGJlc3QgdG8gZGVmZW5kIGFn
YWluc3QgYnVncyBsaWtlIHRoaXMuCgo+Cj4+ICAgICAgICAgICooLmJzcy5wZXJjcHUpCj4+ICAg
ICAgICAgIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMpOwo+PiAgICAgICAgICAqKC5ic3MucGVy
Y3B1LnJlYWRfbW9zdGx5KQo+PiAgICAgICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVTKTsK
Pj4gICAgICAgICAgX19wZXJfY3B1X2RhdGFfZW5kID0gLjsKPj4gKyAgICAgICAqKC5ic3MpCj4+
ICsgICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7Cj4+ICAgICAgICAgIF9fYnNzX2Vu
ZCA9IC47Cj4gV2h5IGlzIHRoaXMgbGFzdCBBTElHTigpIG5lZWRlZD8KClRyeSB0YWtpbmcgaXQg
b3V0IGFuZCB0aGUgbGlua2VyIHdpbGwgbWFrZSBpdHMgZmVlbGluZ3Mga25vd24uCgpUZWNobmlj
YWxseSwgaXQgb25seSBuZWVkcyA4IGJ5dGUgYWxpZ25tZW50IChpdHMgc28gd2UgY2FuIHVzZSBy
ZXAgc3Rvc3EKdG8gY2xlYXIpLCB3aGljaCBpcyBtb3JlIHJlbGF4ZWQgdGhhbiBTTVBfQ0FDSEVf
QllURVMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
