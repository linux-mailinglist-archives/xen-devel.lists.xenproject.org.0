Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB925812B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSFe-0008BQ-2f; Thu, 27 Jun 2019 11:07:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgSFc-0008BK-Up
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:07:36 +0000
X-Inumbo-ID: c3f8c056-98cb-11e9-bf48-fbeea5a0852b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3f8c056-98cb-11e9-bf48-fbeea5a0852b;
 Thu, 27 Jun 2019 11:07:35 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AjOpbKouy51PdExKtTTRUb2sFNnhMQZdAvsvNeMwjnRwUSwyt74joZrXvFBEBA0SXPM/teKnlm
 Aj33nEHVkJ7cY9bUoqAvcxFjbK7RnI5hgG/u8fx+Ltwwz3GCbGUkpnEDpEB/3DeFOgQUgmZCY9
 IOXf/i1JVtTnF/Xaq3Mj06BdaBcZNuKr4+WSo2NuL/YiGP7dHGGOIbk5ExvI/Gsxq8X3cl1W78
 U1+lzIP2Z4J4lDtiqL6yFqs+JPO7KT/p7kiZn85DzMEu1mcKiiE2W2O8bQnrJtlTH6lRflTPWp
 3ns=
X-SBRS: 2.7
X-MesageID: 2307988
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2307988"
Date: Thu, 27 Jun 2019 13:07:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190627110723.uawqqg7qd4tfyetv@MacBook-Air-de-Roger.local>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <a258e2ad-d024-33f4-c4ba-edd777d3683f@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a258e2ad-d024-33f4-c4ba-edd777d3683f@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/linker: add a reloc section to
 ELF linker script
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
Cc: xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6NTk6NDZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wNi8yMDE5IDEwOjMzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBp
ZiB0aGUgaHlwZXJ2aXNvciBoYXMgYmVlbiBidWlsdCB3aXRoIEVGSSBzdXBwb3J0IChpZTogbXVs
dGlib290MikuCj4gPiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24g
Y29ycmVjdGx5IGluIHRoZSBvdXRwdXQKPiA+IGJpbmFyeS4KPiA+Cj4gPiBOb3RlIHRoYXQgZm9y
IHRoZSBFTEYgb3V0cHV0IGZvcm1hdCB0aGUgLnJlbG9jIHNlY3Rpb24gaXMgbW92ZWQgYmVmb3Jl
Cj4gPiAuYnNzIGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBzbyBp
dCBiZWxvbmdzIHdpdGggdGhlCj4gPiBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQtb25s
eSBkYXRhLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IAo+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEknbSBzdGlsbCBjb25mdXNl
ZCBhcyB0byB3aHkgd2UgbmVlZCB0aGlzIGluIHRoZQo+IGZpcnN0IHBsYWNlLgo+IAo+IFRoZSBF
TEYgYnVpbGQgaXMgbGlua2VkIHRvIGEgZml4ZWQgdmlydHVhbCBhZGRyZXNzLCBpcnJlc3BlY3Rp
dmUgb2YKPiB3aGV0aGVyIGdydWIgbG9hZHMgaXQgdmlhIE1CMSBvciBNQjIgYW5kL29yIHdpdGgg
RUZJIGRldGFpbHMuCj4gCj4gaS5lLiB0aGUgbm9uLUVGSSBidWlsZCBzaG91bGRuJ3QgaGF2ZSBh
bnkgcmVtYWluaW5nIHJlbG9jYXRpb25zIGJ5IHRoZQo+IHRpbWUgaXQgaXMgZnVsbHkgbGlua2Vk
Lgo+IAo+IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpSaWdodCwgYnV0IHRoZXJlJ3MgY29k
ZSB0aGF0IGRlcGVuZHMgb24gdGhlIHN5bWJvbHMgZGVmaW5lZCBpbiAucmVsb2MKKF9fYmFzZV9y
ZWxvY3Nfc3RhcnQvX19iYXNlX3JlbG9jc19lbmQpLCBzbyB1bmxlc3MgdGhvc2Ugc3ltYm9scyBh
cmUKZGVmaW5lZCB0aGUgbGlua2VyIHdpbGwgdGhyb3cgYSBtaXNzaW5nIHN5bWJvbHMgZXJyb3Ig
b24gdGhlIGZpbmFsCmxpbmsgc3RlcC4KCkkgY291bGQgYWRkIC5yZWxvYyB0byB0aGUgZGlzY2Fy
ZGVkIHNlY3Rpb25zIGxpc3QgYW5kIGNyZWF0ZSB0aGUKX19iYXNlX3JlbG9jc19zdGFydCBhbmQg
X19iYXNlX3JlbG9jc19lbmQgc3ltYm9scyBvbiB0aGUgbGlua2VyIHNjcmlwdAptYXliZSwgYnV0
IEknbSBub3Qgc3VyZSB0aGF0J3MgYW55IGJldHRlciB0aGFuIGp1c3QgaGF2aW5nIHRoZSBkdW1t
eQoucmVsb2Mgc2VjdGlvbi4KCk9yIGFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGNvbXBpbGUg
dGhlIHVuaXRzIHRoYXQgdXNlIHRob3NlIHN5bWJvbHMKdHdpY2UsIG9uZSBmb3IgdGhlIEVMRiBi
dWlsZCBhbmQgb25lIGZvciB0aGUgUEUgYnVpbGQsIGJ1dCBhZ2FpbiB0aGF0CmRvZXNuJ3Qgc2Vl
bSBtdWNoIGJldHRlciBJTU8uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
