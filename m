Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E192B59D
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 14:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVEv0-0001lc-Og; Mon, 27 May 2019 12:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVEuz-0001lX-AP
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 12:39:57 +0000
X-Inumbo-ID: 87513708-807c-11e9-a500-dfecd746288f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87513708-807c-11e9-a500-dfecd746288f;
 Mon, 27 May 2019 12:39:55 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: wS8Lcz6LGUI/HTFYw5pirvfCeY1Fxm6m9CSl/9jnysHJGJMW6xorEDIwdy2d6LVo0MnlHLtDsk
 AhEWGsXNh/WI2mxvaskw+fwCEuBOoN72nFueG/TXsiobABWkT4SS+cBSgI2yYXv0TTH6ls4Q5i
 DNtYuTw1P4AzYm9BE7XRNKt9vmmYho/Yk/S8/bK6g69bSix6ODuyfAHw54KilHUA3wxpB92hB7
 Arwv5vW53g0FdPtxKDsNnZsTm/HDoFj/A/8EfCpkQfFpMtNUAa6rCVgu/dKk1T88SnC1ghA90Z
 9P0=
X-SBRS: 2.7
X-MesageID: 955467
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="955467"
Date: Mon, 27 May 2019 14:39:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190527123941.nqzuyv6jqxk25hsj@Air-de-Roger>
References: <20190522164530.33147-1-roger.pau@citrix.com>
 <5CE66AC302000078002319E6@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE66AC302000078002319E6@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86: fix alternative_callN usage of
 ALTERNATIVE asm macro
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDM6NDE6MjNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjA1LjE5IGF0IDE4OjQ1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gYWx0ZXJuYXRpdmVfY2FsbE4gdXNpbmcgaW5saW5lIGFzc2VtYmx5IHRvIGdlbmVy
YXRlIHRoZSBhbHRlcm5hdGl2ZQo+ID4gcGF0Y2ggc2l0ZXMgc2hvdWxkIGJlIHVzaW5nIHRoZSBB
TFRFUk5BVElWRSBDIHByZXByb2Nlc3NvciBtYWNybwo+ID4gcmF0aGVyIHRoYW4gdGhlIEFMVEVS
TkFUSVZFIGFzc2VtYmx5IG1hY3JvLAo+IAo+IFdoeT8gU2VlIElORElSRUNUX3tDQUxMLEpNUH0u
IE15IGdvYWwsIGFzIHNhaWQgb24gaXJjLCB3b3VsZCBiZQo+IHRvIGV2ZW50dWFsbHkgZWxpbWlu
YXRlIHRoZSByZWR1bmRhbnQgQyBtYWNyb3MsIGluIGZhdm9yIG9mIGp1c3QgdXNpbmcKPiB0aGUg
YXNzZW1ibGVyIG9uZXMuCgpVc2luZyB0aGUgY3VycmVudCBhc3NlbWJseSBtYWNyb3MgZm9yIGlu
bGluZSBhc20gYWx0ZXJuYXRpdmVzIHdvdWxkCnJlZ3Jlc3MgdGhlIGJ1aWxkIG9uIGxsdm0gYmFz
ZWQgdG9vbGNoYWlucy4gSWYgdGhhdCdzIGluZGVlZCB0aGUgcGF0aApmb3J3YXJkIEkgd2lsbCBo
YXZlIHRvIGxvb2sgaW50byBtYWtpbmcgdGhvc2Ugd29yayBpbiBpbmxpbmUgYXNzZW1ibHkKaW5z
dGFuY2VzLgoKPiA+IHRoZSBtb3JlIHRoYXQgdXNpbmcgdGhlCj4gPiBhc3NlbWJseSBtYWNybyBp
biBhbiBpbmxpbmUgYXNzZW1ibHkgaW5zdGFuY2UgY2F1c2VzIHRoZSBmb2xsb3dpbmcKPiA+IGVy
cm9yIG9uIGxsdm0gYmFzZWQgdG9vbGNoYWluczoKPiA+IAo+ID4gPGluc3RhbnRpYXRpb24+OjE6
MTogZXJyb3I6IGludmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlvbgo+ID4gLkwwX29yaWdfczogY2Fs
bCAqZ2VuYXBpYys2NCglcmlwKTsgLkwwX29yaWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEg
LSAKPiA+IC5MMF9yZXBsX3MxKSAtICguLi4KPiAKPiBUaGUgdW5kZXJzdGFuZGluZyBJIGdldCBp
cyB0aGF0IGNsYW5nIGRvZXNuJ3QgcHJvcGVybHkgc3VwcG9ydCB0aGUKPiBcQCBjb25zdHJ1Y3Qs
IGV4cGFuZGluZyBpdCB0byB6ZXJvIGV2ZXJ5IHRpbWUuCgpZZXMsIHRoYXQncyBteSB1bmRlcnN0
YW5kaW5nIGFsc28uIEkndmUgYWxyZWFkeSBmaWxsZWQgYSBidWcgcmVwb3J0OgoKaHR0cHM6Ly9i
dWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD00MjAzNAoKPiBUaGF0J3MgYSBjbGFuZyBidWcK
PiBpbW8sIGFuZCBoZW5jZSB0aGUgd29yZGluZyBoZXJlIHNob3VsZCByZWZsZWN0IHRoaXMsIHJh
dGhlciB0aGFuCj4gc3VnZ2VzdGluZyB0aGUgY29kZSBpcyBicm9rZW4uKEkgc2VlbSB0byB2YWd1
ZWx5IHJlY2FsbCBhbiBpc3N1ZQo+IHdpdGggY2xhbmcgaW5zdGFudGlhdGluZyBhIG5ldyBhc3Nl
bWJseSBlbnZpcm9ubWVudCBldmVyeSB0aW1lCj4gaXQgZW5jb3VudGVycyBhbiBhc20oKS4pCgpJ
SVJDIEkndmUgZml4ZWQgdGhhdCBvbmUgdXBzdHJlYW0gcXVpdGUgc29tZSB0aW1lIGFnbywgYW5k
IHNob3VsZCBiZQpmaXhlZCBpbiB2ZXJzaW9ucyA+PSA2LgoKPiBXaXRob3V0IGNsYW5nIGZpeGVk
LCBhbmQgd2l0aCB1cyB3YW50aW5nCj4gdG8gYmUgYWJsZSB0byBjb250aW51ZSB0byBidWlsZCB3
aXRoIGNsYW5nLCB0aGlzIHRoZW4gdm9pZHMgdGhlIGVudGlyZQo+IHB1cnBvc2Ugb2YgZjg1MDYx
OTY5MiAoIng4Ni9hbHRlcm5hdGl2ZXM6IGFsbG93IHVzaW5nIGFzc2VtYmxlcgo+IG1hY3JvcyBp
biBmYXZvciBvZiBDIG9uZXMiKSwgd2hpY2ggaXJjIHdhcyBvcmlnaW5hbGx5IHBhcnQgb2YgdGhl
Cj4gc2VyaWVzLCBidXQgd2VudCBpbiBtdWNoIGFoZWFkIG9mIGl0LgoKSSBjYW4gbG9vayBpbnRv
IHdvcmthcm91bmRzIHRvIHRoaXMsIHRoZSBvbmUgdGhhdCBjb21lcyB0byBtaW5kIGlzCnVzaW5n
IC5hbHRtYWNybyBhbmQgTE9DQUwgaW4gb3JkZXIgdG8gY3JlYXRlIHVuaXF1ZSBsYWJlbHMgaW4g
dGhlCm1hY3JvLiBJIGNhbiB0ZXN0IGlmIHN1Y2ggYXBwcm9hY2ggd291bGQgd29yayBpZiB0aGUg
cGxhbiBpcyB0byBvbmx5CnJlbHkgb24gdGhlIGFzc2VtYmx5IGFsdGVybmF0aXZlIGNvZGUuCgo+
IAo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hbHRlcm5hdGl2ZS5oCj4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZlLmgKPiA+IEBAIC0yMDIsOSArMjAyLDggQEAg
ZXh0ZXJuIHZvaWQgYWx0ZXJuYXRpdmVfYnJhbmNoZXModm9pZCk7Cj4gPiAgICAgIHJldHR5cGUg
cmV0XzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ICAgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyByMTBfIGFzbSgicjEwIik7ICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIHIxMV8gYXNt
KCJyMTEiKTsgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgIGFzbSB2b2xhdGlsZSAo
X19zdHJpbmdpZnkoQUxURVJOQVRJVkUgImNhbGwgKiVjW2FkZHJdKCUlcmlwKSIsIFwKPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY2FsbCAuIiwgICAgICAg
ICAgICAgICAgXAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFg4Nl9GRUFUVVJFX0FMV0FZUykgICAgICBcCj4gPiArICAgIGFzbSB2b2xhdGlsZSAoQUxURVJO
QVRJVkUoImNhbGwgKiVjW2FkZHJdKCUlcmlwKSIsICJjYWxsIC4iLCAgIFwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBYODZfRkVBVFVSRV9BTFdBWVMpICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICAgICAgICAgICAgIDogQUxUX0NBTEwgIyMgbiAjIyBfT1VULCAiPWEi
IChyZXRfKSwgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAiPXIiIChyMTBf
KSwgIj1yIiAocjExXykgQVNNX0NBTExfQ09OU1RSQUlOVCAgIFwKPiA+ICAgICAgICAgICAgICAg
ICAgICA6IFthZGRyXSAiaSIgKCYoZnVuYykpLCAiZyIgKGZ1bmMpICAgICAgICAgICAgICAgXAo+
IAo+IE9rYXksIGx1Y2tpbHkgdGhlIGNvZGUgY2hhbmdlIGl0c2VsZiBpcyBzaW1wbGUgZW5vdWdo
LCBzbyBpdCByZWFsbHkKPiB3YXNuJ3QgdGhhdCBJIGhhZCB0byB1c2UgdGhlIHZhcmlhbnQgdXNl
ZCB0byBtYWtlIHRoaW5ncyB3b3JrIGF0Cj4gYWxsLgoKU2luY2UgdGhlIG9ubHkgY2hhbmdlIHJl
cXVlc3RlZCBpcyByZWxhdGVkIHRvIHRoZSBjb21taXQgbWVzc2FnZSwKd291bGQgeW91IGJlIE9L
IHRvIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG86CgotLS04PC0tLQp4ODY6IHJlbW92ZSBh
bHRlcm5hdGl2ZV9jYWxsTiB1c2FnZSBvZiBBTFRFUk5BVElWRSBhc20gbWFjcm8KCmFsdGVybmF0
aXZlX2NhbGxOIHVzaW5nIGlubGluZSBhc3NlbWJseSB0byBnZW5lcmF0ZSB0aGUgYWx0ZXJuYXRp
dmUKcGF0Y2ggc2l0ZXMgc2hvdWxkIGJlIHVzaW5nIHRoZSBBTFRFUk5BVElWRSBDIHByZXByb2Nl
c3NvciBtYWNybwpyYXRoZXIgdGhhbiB0aGUgQUxURVJOQVRJVkUgYXNzZW1ibHkgbWFjcm8sIHRo
ZSBtb3JlIHRoYXQgdXNpbmcgdGhlCmFzc2VtYmx5IG1hY3JvIGluIGFuIGlubGluZSBhc3NlbWJs
eSBpbnN0YW5jZSB0cmlnZ2VycyB0aGUgZm9sbG93aW5nCmJ1ZyBvbiBsbHZtIGJhc2VkIHRvb2xj
aGFpbnM6Cgo8aW5zdGFudGlhdGlvbj46MToxOiBlcnJvcjogaW52YWxpZCBzeW1ib2wgcmVkZWZp
bml0aW9uCi5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5M
MF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEpIC0gKC4uLgpeCjxpbnN0YW50aWF0
aW9uPjoxOjM3OiBlcnJvcjogaW52YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCi5MMF9vcmlnX3M6
IGNhbGwgKmdlbmFwaWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBs
X2UxIC0gLkwwX3JlcGxfczEpIC0gKC4uLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCjxpbnN0YW50aWF0aW9uPjoxOjYwOiBlcnJvcjogaW52YWxpZCByZWFzc2lnbm1lbnQg
b2Ygbm9uLWFic29sdXRlIHZhcmlhYmxlICcuTDBfZGlmZicKLkwwX29yaWdfczogY2FsbCAqZ2Vu
YXBpYys2NCglcmlwKTsgLkwwX29yaWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEgLSAuTDBf
cmVwbF9zMSkgLSAoLi4uCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo8aW5saW5lIGFzbT46MToyOiBub3RlOiB3aGlsZSBpbiBtYWNy
byBpbnN0YW50aWF0aW9uCiAgICAgICAgQUxURVJOQVRJVkUgImNhbGwgKmdlbmFwaWMrNjQoJXJp
cCkiLCAiY2FsbCAuIiwgWDg2X0ZFQVRVUkVfTE0KICAgICAgICBeCjxpbnN0YW50aWF0aW9uPjox
OjE1NjogZXJyb3I6IGludmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlvbgogIC4uLi0gKC5MMF9vcmln
X2UgLSAuTDBfb3JpZ19zKTsgbWtub3BzICgoLSguTDBfZGlmZiA+IDApKSAqIC5MMF9kaWZmKTsg
LkwwX29yaWdfcDoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPGluc3RhbnRpYXRpb24+OjE4OjU6IGVycm9y
OiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5M
MF9yZXBsX2UxOgogICAgXgo8aW5zdGFudGlhdGlvbj46MTg6MjY6IGVycm9yOiBpbnZhbGlkIHN5
bWJvbCByZWRlZmluaXRpb24KICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5MMF9yZXBsX2UxOgog
ICAgICAgICAgICAgICAgICAgICAgICAgXgo8aW5zdGFudGlhdGlvbj46MToxOiBlcnJvcjogaW52
YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCi5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQoJXJp
cCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEpIC0g
KC4uLgpeCjxpbnN0YW50aWF0aW9uPjoxOjM3OiBlcnJvcjogaW52YWxpZCBzeW1ib2wgcmVkZWZp
bml0aW9uCi5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5M
MF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEpIC0gKC4uLgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCjxpbnN0YW50aWF0aW9uPjoxOjYwOiBlcnJvcjogaW52
YWxpZCByZWFzc2lnbm1lbnQgb2Ygbm9uLWFic29sdXRlIHZhcmlhYmxlICcuTDBfZGlmZicKLkww
X29yaWdfczogY2FsbCAqZ2VuYXBpYys2NCglcmlwKTsgLkwwX29yaWdfZTogLkwwX2RpZmYgPSAo
LkwwX3JlcGxfZTEgLSAuTDBfcmVwbF9zMSkgLSAoLi4uCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo8aW5saW5lIGFzbT46MToyOiBu
b3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCiAgICAgICAgQUxURVJOQVRJVkUgImNh
bGwgKmdlbmFwaWMrNjQoJXJpcCkiLCAiY2FsbCAuIiwgWDg2X0ZFQVRVUkVfTE0KICAgICAgICBe
CjxpbnN0YW50aWF0aW9uPjoxOjE1NjogZXJyb3I6IGludmFsaWQgc3ltYm9sIHJlZGVmaW5pdGlv
bgogIC4uLi0gKC5MMF9vcmlnX2UgLSAuTDBfb3JpZ19zKTsgbWtub3BzICgoLSguTDBfZGlmZiA+
IDApKSAqIC5MMF9kaWZmKTsgLkwwX29yaWdfcDoKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPGluc3RhbnRp
YXRpb24+OjE4OjU6IGVycm9yOiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KICAgIC5MMF9y
ZXBsX3MxOiBjYWxsIC47IC5MMF9yZXBsX2UxOgogICAgXgo8aW5zdGFudGlhdGlvbj46MTg6MjY6
IGVycm9yOiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KICAgIC5MMF9yZXBsX3MxOiBjYWxs
IC47IC5MMF9yZXBsX2UxOgogICAgICAgICAgICAgICAgICAgICAgICAgXgo8aW5zdGFudGlhdGlv
bj46MToxOiBlcnJvcjogaW52YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCi5MMF9vcmlnX3M6IGNh
bGwgKmdlbmFwaWMrNjQoJXJpcCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2Ux
IC0gLkwwX3JlcGxfczEpIC0gKC4uLgpeCjxpbnN0YW50aWF0aW9uPjoxOjM3OiBlcnJvcjogaW52
YWxpZCBzeW1ib2wgcmVkZWZpbml0aW9uCi5MMF9vcmlnX3M6IGNhbGwgKmdlbmFwaWMrNjQoJXJp
cCk7IC5MMF9vcmlnX2U6IC5MMF9kaWZmID0gKC5MMF9yZXBsX2UxIC0gLkwwX3JlcGxfczEpIC0g
KC4uLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCjxpbnN0YW50aWF0aW9u
PjoxOjYwOiBlcnJvcjogaW52YWxpZCByZWFzc2lnbm1lbnQgb2Ygbm9uLWFic29sdXRlIHZhcmlh
YmxlICcuTDBfZGlmZicKLkwwX29yaWdfczogY2FsbCAqZ2VuYXBpYys2NCglcmlwKTsgLkwwX29y
aWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEgLSAuTDBfcmVwbF9zMSkgLSAoLi4uCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo8
aW5saW5lIGFzbT46MToyOiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCiAgICAg
ICAgQUxURVJOQVRJVkUgImNhbGwgKmdlbmFwaWMrNjQoJXJpcCkiLCAiY2FsbCAuIiwgWDg2X0ZF
QVRVUkVfTE0KICAgICAgICBeCjxpbnN0YW50aWF0aW9uPjoxOjE1NjogZXJyb3I6IGludmFsaWQg
c3ltYm9sIHJlZGVmaW5pdGlvbgogIC4uLi0gKC5MMF9vcmlnX2UgLSAuTDBfb3JpZ19zKTsgbWtu
b3BzICgoLSguTDBfZGlmZiA+IDApKSAqIC5MMF9kaWZmKTsgLkwwX29yaWdfcDoKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPGluc3RhbnRpYXRpb24+OjE4OjU6IGVycm9yOiBpbnZhbGlkIHN5bWJvbCByZWRl
ZmluaXRpb24KICAgIC5MMF9yZXBsX3MxOiBjYWxsIC47IC5MMF9yZXBsX2UxOgogICAgXgo8aW5z
dGFudGlhdGlvbj46MTg6MjY6IGVycm9yOiBpbnZhbGlkIHN5bWJvbCByZWRlZmluaXRpb24KICAg
IC5MMF9yZXBsX3MxOiBjYWxsIC47IC5MMF9yZXBsX2UxOgogICAgICAgICAgICAgICAgICAgICAg
ICAgXgoKVGhpcyBpcyBhIGJ1ZyBpbiBsbHZtIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQgYmVmb3Jl
IHN3aXRjaGluZyB0byB1c2UKdGhlIGFsdGVybmF0aXZlIGFzc2VtYmx5IG1hY3JvcyBpbiBpbmxp
bmUgYXNzZW1ibHkgY2FsbCBzaXRlcy4KCkZpeGVzOiA2N2QwMWNkYjUgKCJ4ODY6IGluZnJhc3Ry
dWN0dXJlIHRvIGFsbG93IGNvbnZlcnRpbmcgY2VydGFpbiBpbmRpcmVjdCBjYWxscyB0byBkaXJl
Y3Qgb25lcyIpClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
