Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA983343E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 17:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpFm-0008Ic-U3; Mon, 03 Jun 2019 15:52:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXpFm-0008IX-4c
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 15:52:06 +0000
X-Inumbo-ID: 876042b6-8617-11e9-802e-bfb26c71d7c1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 876042b6-8617-11e9-802e-bfb26c71d7c1;
 Mon, 03 Jun 2019 15:52:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 09:52:01 -0600
Message-Id: <5CF5421A0200007800234B94@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 09:51:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Petre Pircalabu" <ppircalabu@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com><cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
In-Reply-To: <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/9] vm_event: Define VM_EVENT type
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA1LjE5IGF0IDE2OjE4LCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ICsrKyBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9kb21jdGwuaAo+IEBAIC0zOCw3ICszOCw3IEBACj4gICNpbmNsdWRlICJodm0v
c2F2ZS5oIgo+ICAjaW5jbHVkZSAibWVtb3J5LmgiCj4gIAo+IC0jZGVmaW5lIFhFTl9ET01DVExf
SU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMQo+ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJG
QUNFX1ZFUlNJT04gMHgwMDAwMDAxMgoKSSBkb24ndCB0aGluayBzdWNoIGEgYnVtcCBpcyBuZWVk
ZWQgLSBhZmFpY3QgdGhlIGludGVyZmFjZSByZW1haW5zCmJpbmFyeSBjb21wYXRpYmxlLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
