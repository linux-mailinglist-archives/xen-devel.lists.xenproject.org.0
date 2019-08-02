Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0A7F008
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:11:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTUq-0005mn-3a; Fri, 02 Aug 2019 09:05:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BtSY=V6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1htTUp-0005mh-B5
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:05:07 +0000
X-Inumbo-ID: 9cecc5f2-b504-11e9-8f32-237fc863c22e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cecc5f2-b504-11e9-8f32-237fc863c22e;
 Fri, 02 Aug 2019 09:05:03 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VVXQtWNAjf6q32sbWWYLNdPMsVDugae+gyW8hULiV4vCzokM8wlbWtBtDXu9UwxFhjBtmVAhVQ
 BF6iPxQyK75tFb4vcihG9+dIzIItvTRqJeJOlz2VFdOIyKpDpHAnEYDQXxYXEGrPLzG7dphsC4
 riS6V97REepDWtZRN4JaHsmIO1rrWZ/4zhUTDi+Qz4DKVNFA183Kb549hR3+ttzo09OF8c8rxl
 vywVd6/WftJ+pEtMWDfeHWAeHWs6cjKIT9PL66fpvyyEu3cEvLViXogA8akGBavWMJXT2ySPdU
 t7k=
X-SBRS: 2.7
X-MesageID: 3775136
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,337,1559534400"; 
   d="scan'208";a="3775136"
Date: Fri, 2 Aug 2019 11:04:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190802090449.d6kvgzzvla34jbzx@Air-de-Roger>
References: <20190801160048.11031-1-jgross@suse.com>
 <CAMmSBy-Qb6nfjfGd-4GXrYVR8E5G07oCmQH4fFfngT3c7-8E1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy-Qb6nfjfGd-4GXrYVR8E5G07oCmQH4fFfngT3c7-8E1g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: Juergen Gross <jgross@suse.com>, luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 konrad.wilk@oracle.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>, dfaggioli@suse.com,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 puwen@hygon.cn, xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMTE6MTE6NTBBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBPbiBUaHUsIEF1ZyAxLCAyMDE5IGF0IDk6MDEgQU0gSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGVtYWlsIG9ubHkgdHJhY2tzIGJp
ZyBpdGVtcyBmb3IgeGVuLmdpdCB0cmVlLiBQbGVhc2UgcmVwbHkgZm9yIGl0ZW1zIHlvdQo+ID4g
d291bGQgbGlrZSB0byBzZWUgaW4gNC4xMyBzbyB0aGF0IHBlb3BsZSBoYXZlIGFuIGlkZWEgd2hh
dCBpcyBnb2luZyBvbiBhbmQKPiA+IHByaW9yaXRpc2UgYWNjb3JkaW5nbHkuCj4gPgo+ID4gWW91
J3JlIHdlbGNvbWUgdG8gcHJvdmlkZSBkZXNjcmlwdGlvbiBhbmQgdXNlIGNhc2VzIG9mIHRoZSBm
ZWF0dXJlIHlvdSdyZQo+ID4gd29ya2luZyBvbi4KPiA+Cj4gPiA9IFRpbWVsaW5lID0KPiA+Cj4g
PiBXZSBub3cgYWRvcHQgYSBmaXhlZCBjdXQtb2ZmIGRhdGUgc2NoZW1lLiBXZSB3aWxsIHJlbGVh
c2UgYWJvdXQgZXZlcnkgOCBtb250aHMuCj4gPiBUaGUgdXBjb21pbmcgNC4xMyB0aW1lbGluZSBh
cmUgYXMgZm9sbG93ZWQ6Cj4gPgo+ID4gKiBMYXN0IHBvc3RpbmcgZGF0ZTogU2VwdGVtYmVyIDEz
dGgsIDIwMTkKPiA+ICogSGFyZCBjb2RlIGZyZWV6ZTogU2VwdGVtYmVyIDI3dGgsIDIwMTkKPiA+
ICogUkMxOiBUQkQKPiA+ICogUmVsZWFzZTogTm92ZW1iZXIgN3RoLCAyMDE5Cj4gPgo+ID4gTm90
ZSB0aGF0IHdlIGRvbid0IGhhdmUgZnJlZXplIGV4Y2VwdGlvbiBzY2hlbWUgYW55bW9yZS4gQWxs
IHBhdGNoZXMKPiA+IHRoYXQgd2lzaCB0byBnbyBpbnRvIDQuMTMgbXVzdCBiZSBwb3N0ZWQgaW5p
dGlhbGx5IG5vIGxhdGVyIHRoYW4gdGhlCj4gPiBsYXN0IHBvc3RpbmcgZGF0ZSBhbmQgZmluYWxs
eSBubyBsYXRlciB0aGFuIHRoZSBoYXJkIGNvZGUgZnJlZXplLiBBbGwKPiA+IHBhdGNoZXMgcG9z
dGVkIGFmdGVyIHRoYXQgZGF0ZSB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcXVldWVkIGludG8gbmV4
dAo+ID4gcmVsZWFzZS4KPiA+Cj4gPiBSQ3Mgd2lsbCBiZSBhcnJhbmdlZCBpbW1lZGlhdGVseSBh
ZnRlciBmcmVlemUuCj4gPgo+ID4gV2UgcmVjZW50bHkgaW50cm9kdWNlZCBhIGppcmEgaW5zdGFu
Y2UgdG8gdHJhY2sgYWxsIHRoZSB0YXNrcyAobm90IG9ubHkgYmlnKQo+ID4gZm9yIHRoZSBwcm9q
ZWN0LiBTZWU6IGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9p
c3N1ZXMuCj4gPgo+ID4gU29tZSBvZiB0aGUgdGFza3MgdHJhY2tlZCBieSB0aGlzIGUtbWFpbCBh
bHNvIGhhdmUgYSBjb3JyZXNwb25kaW5nIGppcmEgdGFzawo+ID4gcmVmZXJyZWQgYnkgWEVOLU4u
Cj4gPgo+ID4gSSBoYXZlIHN0YXJ0ZWQgdG8gaW5jbHVkZSB0aGUgdmVyc2lvbiBudW1iZXIgb2Yg
c2VyaWVzIGFzc29jaWF0ZWQgdG8gZWFjaAo+ID4gZmVhdHVyZS4gQ2FuIGVhY2ggb3duZXIgc2Vu
ZCBhbiB1cGRhdGUgb24gdGhlIHZlcnNpb24gbnVtYmVyIGlmIHRoZSBzZXJpZXMKPiA+IHdhcyBw
b3N0ZWQgdXBzdHJlYW0/Cj4gCj4gR3JlYXQgdGltZWxpbmUhIE9uIExGIEVkZ2UgUHJvamVjdCBF
VkUgc2lkZSwgd2UnZCBsaWtlIHRvIGhlbHAgd2l0aCB0ZXN0aW5nIGFuCj4gdXBjb21pbmcgNC4x
MyBhcyBtdWNoIGFzIHdlIGNhbi4gVGhlIGdvYWwgZm9yIHVzIGlzIHRvIGdldCByaWQgb2Ygb3V0
LW9mLXRyZWUKPiBwYXRjaGVzIChtb3N0IG9mIHRoZW0gaGF2ZSB0byBkbyB3aXRoIEFscGluZSBM
aW51eCBzdXBwb3J0KSBhbmQgdG8gbWFrZSBzdXJlCj4gdGhhdCB3ZSBkb24ndCBoYXZlIGlzc3Vl
IG9uIGFueSBvZiB0aGVzZSBwbGF0Zm9ybXM6Cj4gICAgICBodHRwczovL3dpa2kubGZlZGdlLm9y
Zy9kaXNwbGF5L0VWRS9IYXJkd2FyZStQbGF0Zm9ybXMrU3VwcG9ydGluZytFVkUKCldlIGN1cnJl
bnRseSBoYXZlIGtpbmQgb2YgZGlmZmVyZW50IHRlc3RzIHN5c3RlbXMsIHdlIGhhdmUgVHJhdmlz
IGFuZApHaXRsYWIgQ0kgYnVpbGQgdGVzdGluZywgd2hpY2ggYmFzaWNhbGx5IG1ha2VzIHN1cmUg
dGhlIGJ1aWxkIHdvcmtzIG9uCmEgdmFyaWV0eSBvZiBPU2VzIGFuZCB0b29sY2hhaW5zLiBHaXRs
YWIgQ0kgYWxzbyBoYXMgYSBjb3VwbGUgb2YKZnVuY3Rpb25hbCB0ZXN0cyAoYnkgYm9vdGluZyBY
ZW4gaW4gUUVNVSksIGJ1dCB0aG9zZSBhcmUgdmVyeSBtaW5pbWFsLgoKVGhlbiBwdXNoZXMgdG8g
bWFzdGVyIGFyZSBnYXR0ZWQgYnkgb3NzdGVzdCBbMF0sIHdoaWNoIGlzIGEgWGVuIHNwZWNpZmlj
CnRlc3Qgc3lzdGVtLiBvc3N0ZXN0IG1hbmFnZXMgYSBwb29sIG9mIGhhcmR3YXJlIChib3RoIHg4
NiBhbmQgQVJNKSBhbmQKcGVyZm9ybXMgYSB3aWRlIHZhcmlldHkgb2YgdGVzdHMgYmVmb3JlIGRl
Y2xhcmluZyBhIGdpdmVuIGNvbW1pdCBhcwpnb29kLiBZb3UgY2FuIGZvciBleGFtcGxlIHRha2Ug
YSBsb29rIGF0IG9uZSBvZiB0aGUgcmVjZW50IG9zc3Rlc3QKcmVwb3J0cyBvbiB0aGUgc3RhZ2lu
ZyBicmFuY2g6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTktMDgvbXNnMDAwOTYuaHRtbAoKQW5kOgoKaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzOTU4OS8KCldoaWNoIGNvbnRhaW5zIHRoZSBm
dWxsIHRlc3QgbWF0cml4LgoKPiBTaW5jZSBJJ20gc3RpbGwgYSBsaXR0bGUgYml0IG5ldyB0byBo
b3cgWGVuIHJlbGVhc2UgcHJvY2VzcyB3b3JrcywgSSdtIHdvbmRlcmluZwo+IHdoYXQncyB0aGUg
YmVzdCB3YXkgZm9yIHVzIHRvIHN0YXkgb24gdGhlIHNhbWUgcGFnZSB3aXRoIHRoZSByZXN0IG9m
Cj4gdGhlIGNvbW11bml0eQo+IHRlc3RpbmcgZWZmb3J0cz8KCkl0J3MgcG9zc2libGUgdG8gaW50
ZWdyYXRlIG5ldyBoYXJkd2FyZSBpbnRvIG9zc3Rlc3QsIGJ1dCBJIHRoaW5rIGluCmFzIGEgYmFy
ZSBtaW5pbXVtIGl0IG5lZWRzIHRvIGJlIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBzYWZlbHkgcmFj
a2VkCmluIGEgZGF0YWNlbnRlciBhbmQgcmVsaWFibHkgb3BlcmF0ZWQgd2l0aG91dCBhbnkgaHVt
YW4gaW50ZXJ2ZW50aW9uLgpJJ3ZlIGFkZGVkIGhpbSB0byB0aGUgQ2MgaW4gY2FzZSB5b3UgaGF2
ZSBtb3JlIHNwZWNpZmljIHF1ZXN0aW9ucwphYm91dCB0aGlzIHByb2Nlc3MuCgo+IFdpbGwgdGhl
cmUgYmUgbmlnaHRseSB0YXJiYWxscyBwdWJsaXNoZWQgYXQgc29tZSBwb2ludD8gSXMgdGhlcmUg
YW55Cj4ga2luZCBvZiBidWlsZAo+IGluZnJhc3RydWN0dXJlIEkgY2FuIGhvb2sgdXAgb24gb3Vy
IHNpZGUgdG8gbWFrZSBzdXJlIHRoYXQgSSByZXBvcnQgaXNzdWVzIGFzCj4gc29vbiBhcyBwb3Nz
aWJsZT8KClRoZSByZWxlYXNlIHByb2Nlc3Mgd2lsbCBzdGFydCB3aXRoIHRoZSBjb2RlIGZyZWV6
ZSwgYW5kIGFmdGVyd2FyZHMKcmVsZWFzZSBjYW5kaWRhdGVzIHdpbGwgYmUgY3V0IG9uIGEgYmkt
d2Vla2x5IChvciB3ZWVrbHk/KSBiYXNpcy4gQQpzb3VyY2UgY29kZSB0YXJiYWxsIGlzIHB1Ymxp
c2hlZCBmb3IgZWFjaCBvZiB0aG9zZS4gRHVyaW5nIHRoZSBSQwpwcm9jZXNzIHdlIGFzayB1c2Vy
cyB0byB0ZXN0IHRoZSByZWxlYXNlIGNhbmRpZGF0ZXMgYW5kIG1ha2Ugc3VyZSBhbGwKdGhlIGZl
YXR1cmVzIHRoZXkgY2FyZSBhYm91dCB3b3JrIHByb3Blcmx5LCBvdGhlcndpc2UgYnVnIHJlcG9y
dHMgYXJlCmZpbGxlZCBkaXJlY3RseSBvbiB0aGUgbWFpbGluZyBsaXN0LgoKSWYgeW91IGhhdmUg
dGhlIGNhcGFjaXR5IGFuZCBhdXRvbWF0aW9uIGp1c3QgdGVzdGluZyBzdGFnaW5nIG9yIG1hc3Rl
cgp3b3VsZCBhbHNvIGJlIGhlbHBmdWwsIHNpbmNlIEFGQUNUIGZyb20gdGhlIEVWRSBzdXBwb3J0
ZWQgcGxhdGZvcm1zCnlvdSBoYXZlIGEgd2lkZSBhcnJheSBvZiBoYXJkd2FyZSB0byB0ZXN0IG9u
LgoKVGhhbmtzLCBSb2dlci4KClswXSBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPXN1bW1hcnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
