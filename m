Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC792203DF
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:48:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDta-0005ya-FV; Thu, 16 May 2019 10:45:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRDtY-0005yV-Kd
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:45:52 +0000
X-Inumbo-ID: c59eef43-77c7-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c59eef43-77c7-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 10:45:51 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: KNJyUQTxOMJLB/LhsJgu0ZsjlIUNOEORWorKYg+r2PFlW6vu7lAWuMZ8qMri3I3F66YeBEvLrt
 EYTrYP7zI8y0/CIshuOx4IwyyeC4BjApk+jVd3/UsRqB+uR+YZxBc1qflm7ab/OSAyYvQ/7jWM
 oH5QWCQqovsX7Q+VBxEw+UGBoVr9KhdRFBqd/QllyLCtGbymB4hWo82hAMn4zHao02DIXjJOXe
 NHrOYTg1HQnS40TPFv1mgFYnR8NeOjFIEAFbFgFuL3UmqmMUAc+SPJ3LlEyNjXgdB5jbjslHWD
 yMk=
X-SBRS: 2.7
X-MesageID: 496565
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="496565"
Date: Thu, 16 May 2019 12:45:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <ohering@suse.com>
Message-ID: <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516110735.67e19d15.ohering@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MDc6MzVBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMDowOTozOCArMDIwMAo+IHNjaHJpZWIgSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoKPiAKPiA+IFRoZSBwYXRjaCAibGlieGw6IGFkZCBo
ZWxwZXIgZnVuY3Rpb24gdG8gc2V0IGRldmljZV9tb2RlbF92ZXJzaW9uIgo+ID4gYnJlYWtzIGNy
ZWF0aW5nIGFueSBkb21haW4gZm9yIG1lLgo+IAo+IFRoZSBpc3N1ZSBpcywgY3JlYXRlX2RvbWFp
biB3aWxsIGV2ZW50dWFsbHkgY2FsbCBmcmVlbWVtLgo+IElmIGF1dG9iYWxsb29uIGlzIHNldCwg
ZHVlIHRvIGRvbTBfbWVtPSBmb3IgZXhhbXBsZSwgYWxsIGlzIGZpbmUuCj4gSWYgbWVtb3J5IGhh
cyB0byBiZSBmcmVlZCwgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IHdpbGwgZ2V0IGFuCj4gaW5j
b21wbGV0ZSBiX2luZm8uIFNvbWVob3cgdGhlIG5ldyBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwKPiBtdXN0IGJlIGNhbGxlZCBmb3IgdGhlIGRfY29uZmlnIHJldHVybmVkIGJ5IHBhcnNl
X2NvbmZpZ19kYXRhLgo+IAo+IEhvdyBzaG91bGQgdGhpcyBiZSBmaXhlZD8KCkhhdmluZyBhIGZp
ZWxkIGluIGJ1aWxkX2luZm8gd2l0aCBhIGRlZmF1bHQgdmFsdWUgdGhhdCBkZXBlbmRzIG9uCmZp
ZWxkcyBvdXRzaWRlIG9mIGJ1aWxkX2luZm8gaXMgcHJvYmxlbWF0aWMsIHNpbmNlIG5vdCBhbGwg
Y2FsbGVycyBvZgpsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBoYXZlIGFjY2Vz
cyB0byBsaWJ4bF9kb21haW5fY29uZmlnLgoKQW4gb3B0aW9uIHdvdWxkIGJlIHRvIHBhc3MgbGli
eGxfZG9tYWluX2NvbmZpZyB0bwpsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBh
bmQgZml4dXAgdGhlIGNhbGxlcnMuIFRoYXQgc2VlbXMKbGlrZSB0aGUgYmVzdCBzb2x1dGlvbiBB
VE0sIGJ1dCBpdCB3b3VsZCByZXF1aXJlIHJldmVydGluZyB0aGUKY3VycmVudGx5IGNvbW1pdHRl
ZCBwYXRjaGVzLCBzaW5jZSB0aGVyZSB3b24ndCBiZSBhIHJlYXNvbiBhbnltb3JlIHRvCnNwbGl0
IHRoZSBkZXZpY2UgbW9kZWwgc2VsZWN0aW9uIGNvZGUgb3V0IG9mCmxpYnhsX19kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
