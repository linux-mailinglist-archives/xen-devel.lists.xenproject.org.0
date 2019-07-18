Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B06CCA2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 12:16:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho3Pz-0001xG-T3; Thu, 18 Jul 2019 10:13:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho3Py-0001x5-Mi
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 10:13:42 +0000
X-Inumbo-ID: b5800582-a944-11e9-8b7a-076ece796eaa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5800582-a944-11e9-8b7a-076ece796eaa;
 Thu, 18 Jul 2019 10:13:38 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tAvijrtc4JsN7TFM7P6ZOMXitxN/GaIq9HfRmmkBTE6WOloNAnpa4exS/j+x54ITpAgcfLnB4Z
 lN1sIA7AgrpJsaF9niI+NGH1c2Tn+YTrq5LrHdzjxCEf2IvNTF2aej/NrJ2mxpm/7jRNsvtYRd
 2UsWmBrAYmljfmoUAaoPHc+2k9vpJ8cQk42cNnBGZgF/JGfBbG6KQNC/QQrkRFiP+CIco7PCEE
 C0RfhfjV52UxfFGDs97oPUmcYh4cGZ50w0k+I3Em8rSKTty/sIsuD/0GiBBkzpn6PmxU1QWeBG
 9ww=
X-SBRS: 2.7
X-MesageID: 3135807
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,276,1559534400"; 
   d="scan'208";a="3135807"
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel
 (xen-devel@lists.xenproject.org)" <xen-devel@lists.xenproject.org>
References: <f07114de1c9f440182359a1d7d064fdd@AMSPEX02CL03.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3131a159-5f19-64b0-2537-8b944b16ad16@citrix.com>
Date: Thu, 18 Jul 2019 11:13:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f07114de1c9f440182359a1d7d064fdd@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] IOMMU page-tables
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxMDo0OSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEhpLAo+Cj4gICBCZWZv
cmUgSSBnZXQgdG9vIGZhciBpbnRvIHRoaXMgSSB3YW50IHRvIGdldCBzb21lIG9waW5pb25zIGZy
b20gdGhlIHdpZGVyIGNvbW11bml0eS4uLgo+Cj4gICBBdCB0aGUgbW9tZW50IHdoZW4gdGhlIGZp
cnN0IFBDSSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gYSBkb21haW4gKGkuZS4gcGFzc2VkIHRocm91
Z2gpIHRoaXMgd2lsbCB0cmlnZ2VyIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcyBm
b3IgdGhhdCBkb21haW4uIFNpbWlsYXJseSB3aGVuIHRoZSBsYXN0IFBDSSBkZXZpY2UgaXMgZGUt
YXNzaWduZWQgdGhlIHRhYmxlcyBhcmUgdG9ybiBkb3duIGFnYWluLiBCb3RoIG9mIHRoZXNlIG9w
ZXJhdGlvbnMgY2FuIGJlIHF1aXRlIGV4cGVuc2l2ZSBpZiB0aGUgZG9tYWluIGlzIGEgbGFyZ2Ug
YW1vdW50IGZvciBSQU0sIGFuZCBpZiB0aGUgSU9NTVUgZG9lcyBub3Qgc3VwcG9ydCBzaGFyaW5n
IHRoZSBzZWNvbmQgbGV2ZWwgQ1BVIHBhZ2UgdGFibGVzIChvciB0aGUgZG9tYWluIGlzIFBWKS4g
TW9yZW92ZXIsIHRoZSBndWVzdCBjb3VsZCBzaW11bHRhbmVvdXNseSBiZSBiYWxsb29uaW5nIG9y
IGRvaW5nIG90aGVyIG9wZXJhdGlvbnMgdGhhdCBhZmZlY3QgaXRzIHBhZ2UgdHlwZXMgYW5kIHNv
IHRoZSBwcm9jZXNzIG9mIGJ1aWxkaW5nIHRoZSB0YWJsZXMgaGFzIHRvIHRha2UgaW50byBhY2Nv
dW50IHN1Y2ggcmFjZXMuCj4gICBJZiB3ZSB3ZXJlIGluc3RlYWQgdG8gc2F5IHRoYXQgZ2l2aW5n
IGEgZG9tYWluIElPTU1VIHBhZ2UgdGFibGVzIGlzIGFuIG9wdGlvbiB0aGF0IG5lZWRzIHRvIGJl
IHNlbGVjdGVkIGF0IGRvbWFpbiBjcmVhdGUgdGltZSB0aGVuIGl0IG1ha2VzIHRoZSBjb2RlIHNp
Z25pZmljYW50bHkgc2ltcGxlciBhbmQgdGhlcmUgaXMgbm8gbmVlZCB0byBkZWFsIHdpdGggcGFn
ZSB0eXBlIGNoYW5nZS9iYWxsb29uaW5nIHJhY2VzIGFueSBtb3JlLiBJIGhhY2tlZCB0b2dldGhl
ciBhIHRlc3QgcGF0Y2ggYW5kIGl0IGdldHMgcmlkIG9mIHJvdWdobHkgMjAwIGxpbmVzIG9mIGNv
ZGUgKGFuZCB0aGVyZSBtYXkgYmUgbW9yZSB0aGF0IEkgbWlzc2VkKS4KPiAgIERvZXMgYW55b25l
IHRoaW5rIHRoYXQgZGVjaWRpbmcgd2hldGhlciBhIGRvbWFpbiBzaG91bGQgZ2V0IElPTU1VIHBh
Z2UgdGFibGVzIGlzIG5vdCBhIHJlYXNvbmFibGUgdGhpbmcgdG8gaGF2ZSB0byBkbyBhdCBjcmVh
dGUgdGltZT8KClRvIGJlIGFic29sdXRlbHkgY2xlYXIgaGVyZSwgSSBkb24ndCBzZWUgYW55IGV2
aWRlbmNlIGZvciB0aGUgY3VycmVudApiZWhhdmlvdXIgdG8gYmUgYSBjb21tb25seSB1c2VkIGZl
YXR1cmUgaW4gcHJhY3RpY2UuCgpJZiBhbnlvbmUgaGFzIGEgY291bnRlcmV4YW1wbGUsIHBsZWFz
ZSBzcGVhayB1cCB1cmdlbnRseS4KCkZ1cnRoZXJtb3JlLCB0aGUgY29tcGxleGl0eSBhbmQgKGJl
c3Qtd2UtY2FuLW1hbmFnZS1zZWN1cml0eS13aXNlKQpsaXZlbG9ja3MgaW4gdGhlIGh5cGVydmlz
b3IvdG9vbHN0YWNrIGlzIGp1c3RpZmljYXRpb24gYWxvbmUgdG8Kc2VyaW91c2x5IGNvbnNpZGVy
IGRyb3BwaW5nIGl0IG1vdmluZyBmb3J3YXJkcy7CoCBUaGUgY29tcGxleGl0eSBpbgpwYXJ0aWN1
bGFyIGlzIGFuIGltcGVkaW1lbnQgdG8gc2V2ZXJhbCBhc3BlY3RzIG9mIElPTU1VIGRldmVsb3Bt
ZW50IHdvcmsKd2hpY2ggYXJlIGluIHByb2dyZXNzLgoKSW4gcGFydGljdWxhciwgSSBkbyBub3Qg
c2VlIGl0IGFzIGFuIHVucmVhc29uYWJsZSBidXJkZW4gZm9yCmFkbWlucy9ndWVzdHMgdG8gc3Bl
Y2lmeSB3aGV0aGVyIHRoZXkgd2FudCBhbiBJT01NVSBhdCBkb21haW4gY3JlYXRpb24KdGltZS7C
oCBJIGV4cGVjdCB0aGF0IHRoZSBvdmVyd2hlbG1pbmcgbWFqb3JpdHkgb2YgY2FzZXMgYWxyZWFk
eSBrbm93IGF0CmNyZWF0aW9uIHRpbWUgd2hpY2ggUENJIGRldmljZXMgd2FudCBhc3NpZ25pbmcu
CgpBcyBmYXIgYXMgSSdtIGNvbmNlcm5lZCwgdGhpcyBmZWF0dXJlL2Nvcm5lciBjYXNlIHdhbnRz
IHJpcHBpbmcgb3V0LsKgCldoYXRldmVyIHRoZSBvcmlnaW5hbCBpbnRlbnRpb24sIGhpbmRzaWdo
dCBoYXMgZGVtb25zdHJhdGVkIHRoYXQgaXQKcmVhbGx5IGlzbid0IGNsZXZlciBpZGVhLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
