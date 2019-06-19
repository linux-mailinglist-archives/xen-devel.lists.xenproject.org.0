Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583A4BC7D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdcAc-0000RL-9c; Wed, 19 Jun 2019 15:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdcAb-0000RF-0D
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:06:41 +0000
X-Inumbo-ID: d68b0252-92a3-11e9-8653-d7d1e6fbbfcb
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d68b0252-92a3-11e9-8653-d7d1e6fbbfcb;
 Wed, 19 Jun 2019 15:06:39 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EvMbVPGtKP0aWfDlN15WMC9qhGq9rKQkugQiFMMKPmzYCfGzt57e9qY0Z2sTsjCg0CFGNaQcI8
 MvdEZuXkmGSzsTjqd/QNqT42FqThdj38uqc+D+K3JGUJHKITUDCxLBKi37tC8I4XjmxBJuljzL
 CeKt8/bL88Y04BoOEzfXr3LbMErAUNX02vQ4Tape06Mb9uYF4NGcb/Uz/AQ1rbXI1tUFoMGIeL
 +aPN3Wu+3XGhlpJM/wjME9kUtObUZ139d+9ClRmwVTv17u+wbDhvE7XhPmij9gBh2r2dXeSKxH
 ecM=
X-SBRS: 2.7
X-MesageID: 1974162
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1974162"
Date: Wed, 19 Jun 2019 17:06:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6NTc6MDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gSWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9y
dCAoaWU6IG11bHRpYm9vdDIpLgo+ID4gVGhpcyBhbGxvd3MgdG8gcG9zaXRpb24gdGhlIC5yZWxv
YyBzZWN0aW9uIGNvcnJlY3RseSBpbiB0aGUgb3V0cHV0Cj4gPiBiaW5hcnksIG9yIGVsc2UgdGhl
IGxpbmtlciBtaWdodCBwbGFjZSAucmVsb2MgYmVmb3JlIHRoZSAudGV4dAo+ID4gc2VjdGlvbi4K
PiA+IAo+ID4gTm90ZSB0aGF0IHRoZSAucmVsb2Mgc2VjdGlvbiBpcyBtb3ZlZCBiZWZvcmUgLmJz
cyBmb3IgdHdvIHJlYXNvbnM6IGluCj4gPiBvcmRlciBmb3IgdGhlIHJlc3VsdGluZyBiaW5hcnkg
dG8gbm90IGNvbnRhaW4gYW55IHNlY3Rpb24gd2l0aCBkYXRhCj4gPiBhZnRlciAuYnNzLCBzbyB0
aGF0IHRoZSBmaWxlIHNpemUgY2FuIGJlIHNtYWxsZXIgdGhhbiB0aGUgbG9hZGVkCj4gPiBtZW1v
cnkgc2l6ZSwgYW5kIGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBz
byBpdAo+ID4gYmVsb25ncyB3aXRoIHRoZSBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQt
b25seSBkYXRhLgo+IAo+IFdoaWxlIHRoaXMgbWF5IGJlIGZpbmUgZm9yIEVMRiwgSSdtIGFmcmFp
ZCBpdCB3b3VsZCBiZSBjYWxsaW5nIGZvcgo+IHN1YnRsZSBpc3N1ZXMgd2l0aCB4ZW4uZWZpIChp
LmUuIHRoZSBQRSBiaW5hcnkpOiBUaGVyZSBhIC5yZWxvYwo+IHNlY3Rpb24gaXMgZ2VuZXJhbGx5
IGV4cGVjdGVkIHRvIGNvbWUgYWZ0ZXIgIm5vcm1hbCIgZGF0YQo+IHNlY3Rpb25zLgoKT0ssIHdv
dWxkIHlvdSBsaWtlIG1lIHRvIGxlYXZlIHRoZSAucmVsb2Mgc2VjdGlvbiBhdCB0aGUgcHJldmlv
dXMKcG9zaXRpb24gZm9yIEVGSSBidWlsZHMgdGhlbj8KCk9yIGRvIHdlIHByZWZlciB0byBsZWF2
ZSAucmVsb2Mgb3JwaGFuZWQgaW4gdGhlIEVMRiBidWlsZD8KCj4gT24gdGhlIHdob2xlLCBzZWVp
bmcgYWxsIHRoZXNlIGFkanVzdG1lbnRzIGZvciBhIGxpbmtlciBiZWhhdmlvcgo+IEknbSB0ZW1w
dGVkIHRvIGNhbGwgYnVnZ3ksIEknbSBub3Qgc3VyZSB3aGV0aGVyIHdlIHNob3VsZG4ndAo+IGlu
c3RlYWQgZGVjbGFyZSB0aGlzIGxpbmtlciB2ZXJzaW9uIGFzIHVudXNhYmxlIHdpdGggWGVuLiBJ
IGNhbid0Cj4gaW1hZ2luZSB0aGF0IHRoZXkncmUgZ29pbmcgdG8gbGVhdmUgaXQgYXMgaXQgaXMg
cmlnaHQgbm93LgoKSSd2ZSBhbHJlYWR5IHN1Ym1pdHRlZCBhIGJ1ZyByZXBvcnQsIGxldCdzIHNl
ZSBpZiB0aGlzIGNhbiBiZSBmaXhlZAphbmQgYmFja3BvcnRlZCB0byA4LiBJdCdzIGEgc2hhbWUg
YmVjYXVzZSBwcmV2aW91cyB2ZXJzaW9ucyBvZiBsbGQKd29ya2VkIGp1c3QgZmluZSwgYW5kIEkg
d291bGQgY29uc2lkZXIgdGhpcyBhIGxsZCByZWdyZXNzaW9uLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
