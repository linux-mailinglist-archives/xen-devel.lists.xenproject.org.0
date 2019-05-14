Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B581C71D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:41:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUq9-0005KN-MG; Tue, 14 May 2019 10:39:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQUq7-0005KG-RZ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:39:19 +0000
X-Inumbo-ID: 845e8b88-7634-11e9-ae8f-07f44db2fbce
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 845e8b88-7634-11e9-ae8f-07f44db2fbce;
 Tue, 14 May 2019 10:39:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89714855"
Date: Tue, 14 May 2019 12:39:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190514103907.2fc6pf7p64m3c7fh@Air-de-Roger>
References: <20190514072741.11760-1-olaf@aepfle.de>
 <20190514101856.6otetd56n72t42bm@Air-de-Roger>
 <20190514123118.6c9ecbf7.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514123118.6c9ecbf7.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v1] libxl: add helper function to set
 device_model_version
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6MzE6MThQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVHVlLCAxNCBNYXkgMjAxOSAxMjoxODo1NiArMDIwMAo+IHNjaHJpZWIgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+IAo+ID4gV2h5IGlzIGl0IG5vdCBm
aW5lIHRvIHNldCB0aGUgZGV2aWNlIG1vZGVsIHZlcnNpb24gaW4KPiA+IGxpYnhsX19kb21haW5f
YnVpbGRfaW5mb19zZXRkZWZhdWx0Pwo+IAo+IEJlY2F1c2UgaXQgcmVjZWl2ZXMganVzdCBidWls
ZF9pbmZvLCB3aGljaCBsYWNrcyBhbGwgdGhlIGRhdGEgdG8gZGVjaWRlCj4gaWYgYSBkZXZpY2Ug
dHlwZSBuZWVkcyBhIGRldmljZSBtb2RlbCBvciBub3QuCgpHYWgsIHRoYW5rcy4gQ291bGQgeW91
IHBsZWFzZSBhZGQgdGhpcyB0byB0aGUgY29tbWl0IG1lc3NhZ2U/IE9yIGVsc2UKaXQncyBsaWtl
bHkgSSB3aWxsIGFzayBhZ2Fpbi4KCldpdGggdGhhdDoKClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
