Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930138BCC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 15:38:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZF1t-00085k-2d; Fri, 07 Jun 2019 13:35:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hZF1q-00085f-QC
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 13:35:34 +0000
X-Inumbo-ID: 1ec90e94-8929-11e9-a0ef-170fdcace71c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ec90e94-8929-11e9-a0ef-170fdcace71c;
 Fri, 07 Jun 2019 13:35:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 07 Jun 2019 07:35:30 -0600
Message-Id: <5CFA68220200007800236458@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 07 Jun 2019 07:35:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-5-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 04/13] pci: make PCI_SBDF return a
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDExOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEFuZCBmaXggaXQncyBvbmx5IGNhbGxlci4KCkZpeD8gSXQgd2Fzbid0IGJyb2tlbiwgd2FzIGl0
PyBIb3cgYWJvdXQgImFkanVzdCI/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+IEBAIC0zNCw3ICszNCw4IEBACj4gICNkZWZpbmUg
UENJX0RFVkZOMihiZGYpICgoYmRmKSAmIDB4ZmYpCj4gICNkZWZpbmUgUENJX0JERihiLGQsZikg
ICgoKChiKSAmIDB4ZmYpIDw8IDgpIHwgUENJX0RFVkZOKGQsZikpCj4gICNkZWZpbmUgUENJX0JE
RjIoYixkZikgICgoKChiKSAmIDB4ZmYpIDw8IDgpIHwgKChkZikgJiAweGZmKSkKPiAtI2RlZmlu
ZSBQQ0lfU0JERihzLGIsZCxmKSAoKCgocykgJiAweGZmZmYpIDw8IDE2KSB8IFBDSV9CREYoYixk
LGYpKQo+ICsjZGVmaW5lIFBDSV9TQkRGKHMsYixkLGYpIFwKPiArICAgICgocGNpX3NiZGZfdCkg
eyAuc2JkZiA9ICgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSB9KQoKUGxl
YXNlIGNhbiB3ZSBnYWluIHRoZSBtaXNzaW5nIGJsYW5rcyBhZnRlciB0aGUgY29tbWFzIGhlcmUg
YXQgdGhpcwpvY2Nhc2lvbiAoZG9hYmxlIHdoaWxlIGNvbW1pdHRpbmcpPyBUaGVuCkFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
