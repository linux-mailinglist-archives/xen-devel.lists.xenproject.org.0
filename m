Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9AE3479C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY96W-0004nm-2h; Tue, 04 Jun 2019 13:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY96U-0004nf-CL
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:03:50 +0000
X-Inumbo-ID: 2fe2b76e-86c9-11e9-a194-2321ace099f0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fe2b76e-86c9-11e9-a194-2321ace099f0;
 Tue, 04 Jun 2019 13:03:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 07:03:45 -0600
Message-Id: <5CF66C2E0200007800235190@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 07:03:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667500200007800235116@prv1-mh.provo.novell.com>
 <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
In-Reply-To: <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/4] PCI: move pdev_list field to common
 structure
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@cirix.com>,
 Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE0OjU1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvNC8xOSAxOjQyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL3BjaS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+PiBAQCAtMTIxLDcg
KzEyMSw5IEBAIHN0cnVjdCBwY2lfZGV2IHsKPj4gICB9Owo+PiAgIAo+PiAgICNkZWZpbmUgZm9y
X2VhY2hfcGRldihkb21haW4sIHBkZXYpIFwKPj4gLSAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBk
ZXYsICYoZG9tYWluLT5hcmNoLnBkZXZfbGlzdCksIGRvbWFpbl9saXN0KQo+PiArICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkocGRldiwgJihkb21haW4pLT5wZGV2X2xpc3QsIGRvbWFpbl9saXN0KQo+
PiArCj4+ICsjZGVmaW5lIGhhc19hcmNoX3BkZXZzKGQpICghbGlzdF9lbXB0eSgmKGQpLT5wZGV2
X2xpc3QpKQo+IAo+IFRoaXMgZmVlbHMgYSBiaXQgc3RyYW5nZSB0byBrZWVwICJhcmNoIiBpbiB0
aGUgbWFjcm8gbmFtZSB3aGVuIHRoZSBjb2RlIAo+IGlzIG5vdyBnZW5lcmljLiBIb3cgYWJvdXQg
ImRvbWFpbl9oYXNfcGRldnMiPwoKSW5kZWVkIEkgZGlkIG5vdGljZSB0aGlzIG9kZGl0eSB0b28s
IGJ1dCBpZiBzdWNoIGFuIGFkanVzdG1lbnQgaXMKdG8gYmUgbWFkZSB0aGVuIGltbyBub3QgaW4g
dGhpcyBwYXRjaC4gQWZ0ZXIgYWxsIGluIHR1cm4gSSdkIG5lZWQKdG8gY2hhbmdlIGFsbCB1c2Ug
c2l0ZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
