Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ECE204AE
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:28:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREVJ-0001OW-L7; Thu, 16 May 2019 11:24:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREVH-0001OP-WC
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:24:52 +0000
X-Inumbo-ID: 381cc6d4-77cd-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 381cc6d4-77cd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:24:50 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: eUemwXHE7WAhjOUuS5bGPqpENJo7MDLPVr3SNeyR9QdP6sA5Gxixx4x6lTCYzWf3JGO9U3YsNa
 8UcgLPQVWHtVo87htS+7qyYDsXtLEPz/mTOaHew9ua4ll2jUQ+rCLkKKAxuG1kEl/xXKguy5yw
 eSm21bOAHgeum/Q0dUbeuL2QZRWZ4Z+/UsPDLst53MOmGD8XBZoqhJ85IeQw8EPyvqjWrTU8L9
 ygU5bLdtsWsEh0R9OT5fkNiJbBDydD3v5tFAkSC/EQcQVWsFY8Vb6KV//MdaBiscWmipYPHxYN
 gKc=
X-SBRS: 2.7
X-MesageID: 518698
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="518698"
Date: Thu, 16 May 2019 12:24:48 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190516112448.GV2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Olaf Hering <ohering@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6NDU6NDBQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMTowNzozNUFNICswMjAwLCBPbGFm
IEhlcmluZyB3cm90ZToKPiA+IEFtIFRodSwgMTYgTWF5IDIwMTkgMTA6MDk6MzggKzAyMDAKPiA+
IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoKPiA+IAo+ID4gPiBUaGUg
cGF0Y2ggImxpYnhsOiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIHNldCBkZXZpY2VfbW9kZWxfdmVy
c2lvbiIKPiA+ID4gYnJlYWtzIGNyZWF0aW5nIGFueSBkb21haW4gZm9yIG1lLgo+ID4gCj4gPiBU
aGUgaXNzdWUgaXMsIGNyZWF0ZV9kb21haW4gd2lsbCBldmVudHVhbGx5IGNhbGwgZnJlZW1lbS4K
PiA+IElmIGF1dG9iYWxsb29uIGlzIHNldCwgZHVlIHRvIGRvbTBfbWVtPSBmb3IgZXhhbXBsZSwg
YWxsIGlzIGZpbmUuCj4gPiBJZiBtZW1vcnkgaGFzIHRvIGJlIGZyZWVkLCBsaWJ4bF9kb21haW5f
bmVlZF9tZW1vcnkgd2lsbCBnZXQgYW4KPiA+IGluY29tcGxldGUgYl9pbmZvLiBTb21laG93IHRo
ZSBuZXcgbGlieGxfX2RvbWFpbl9zZXRfZGV2aWNlX21vZGVsCj4gPiBtdXN0IGJlIGNhbGxlZCBm
b3IgdGhlIGRfY29uZmlnIHJldHVybmVkIGJ5IHBhcnNlX2NvbmZpZ19kYXRhLgo+ID4gCj4gPiBI
b3cgc2hvdWxkIHRoaXMgYmUgZml4ZWQ/Cj4gCj4gSGF2aW5nIGEgZmllbGQgaW4gYnVpbGRfaW5m
byB3aXRoIGEgZGVmYXVsdCB2YWx1ZSB0aGF0IGRlcGVuZHMgb24KPiBmaWVsZHMgb3V0c2lkZSBv
ZiBidWlsZF9pbmZvIGlzIHByb2JsZW1hdGljLCBzaW5jZSBub3QgYWxsIGNhbGxlcnMgb2YKPiBs
aWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBoYXZlIGFjY2VzcyB0byBsaWJ4bF9k
b21haW5fY29uZmlnLgo+IAo+IEFuIG9wdGlvbiB3b3VsZCBiZSB0byBwYXNzIGxpYnhsX2RvbWFp
bl9jb25maWcgdG8KPiBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBhbmQgZml4
dXAgdGhlIGNhbGxlcnMuIFRoYXQgc2VlbXMKPiBsaWtlIHRoZSBiZXN0IHNvbHV0aW9uIEFUTSwg
YnV0IGl0IHdvdWxkIHJlcXVpcmUgcmV2ZXJ0aW5nIHRoZQoKVGhhdCB3aWxsIDEpIG1ha2UgdGhl
IG5hbWUgd3JvbmcgMikgeW91IHdpbGwgaGF2ZSB0byBjb25qdXJlIHVwIGEKZG9tYWluX2NvbmZp
ZyBzdHJ1Y3R1cmUgZXZlbiBpZiBpdCBpcyBub3QgbmVlZGVkLi4uCgpXZWkuCgo+IGN1cnJlbnRs
eSBjb21taXR0ZWQgcGF0Y2hlcywgc2luY2UgdGhlcmUgd29uJ3QgYmUgYSByZWFzb24gYW55bW9y
ZSB0bwo+IHNwbGl0IHRoZSBkZXZpY2UgbW9kZWwgc2VsZWN0aW9uIGNvZGUgb3V0IG9mCj4gbGli
eGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQuCj4gCj4gUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
