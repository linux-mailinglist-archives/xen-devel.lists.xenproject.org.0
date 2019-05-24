Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED51296F6
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 13:19:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU8CB-000510-33; Fri, 24 May 2019 11:17:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU8C9-00050v-UP
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 11:17:05 +0000
X-Inumbo-ID: 7438d52c-7e15-11e9-8a43-b734e9ef3b36
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7438d52c-7e15-11e9-8a43-b734e9ef3b36;
 Fri, 24 May 2019 11:17:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 05:17:01 -0600
Message-Id: <5CE7D2A90200007800231F9A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 05:16:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-5-roger.pau@citrix.com>
 <5CE7C93A0200007800231F24@prv1-mh.provo.novell.com>
 <5d339f33-a5e7-49be-ee40-5782401ceab1@citrix.com>
In-Reply-To: <5d339f33-a5e7-49be-ee40-5782401ceab1@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] print: introduce a format specifier for
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDEyOjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMjAxOSAxMTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEw
LjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhlIG5l
dyBmb3JtYXQgc3BlY2lmaWVyIGlzICclcHAnLCBhbmQgcHJpbnRzIGEgcGNpX3NiZGZfdCB1c2lu
ZyB0aGUKPj4+IHNlZzpidXM6ZGV2LmZ1bmMgZm9ybWF0LiBSZXBsYWNlIGFsbCBTQkRGcyBwcmlu
dGVkIHVzaW5nCj4+PiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVzZSB0aGUgbmV3IGZvcm1hdCBz
cGVjaWZpZXIuCj4+IFNvIG9uIHRoZSBwb3NpdGl2ZSBzaWRlIExpbnV4IGRvZXNuJ3QgdXNlICdw
JyB5ZXQsIHNvIHdlJ3JlIG9ubHkgYXQgcmlzawo+PiBvZiBhIGZ1dHVyZSBjb25mbGljdC4gSG93
ZXZlciwgaGF2aW5nIHRvIHBhc3MgYSA2NC1iaXQgcG9pbnRlciBqdXN0Cj4+IHRvIHByaW50IGEg
MzItYml0IGVudGl0eSBzZWVtcyByYXRoZXIgd2FzdGVmdWwgdG8gbWUuIFNpbmNlIHdlIGNhbid0
Cj4+IHVzZSBlbnRpcmVseSBuZXcgZm9ybWF0IHNwZWNpZmllcnMsIGRpZCB5b3UgY29uc2lkZXIg
KGFiKXVzaW5nIG9uZQo+PiB3ZSByYXJlbHkgdXNlLCBsaWtlICVvLCBzdWZmaXhlZCBzaW1pbGFy
bHkgbGlrZSB3ZSBkbyBmb3IgJXA/IFRoZQo+PiBleHRlbnNpb24gY291bGQgYmUgcmVzdHJpY3Rl
ZCB0byBhcHBseSBvbmx5IHdoZW4gbmVpdGhlciBmaWVsZCB3aWR0aAo+PiBub3IgcHJlY2lzaW9u
IG5vciBhbnkgZmxhZ3Mgd2VyZSBzcGVjaWZpZWQsIGkuZS4gb25seSB0byBwbGFpbiAlbyAoYXQK
Pj4gbGVhc3QgaW5pdGlhbGx5KS4KPj4KPj4gV2UnZCB0aGVuIGhhdmUgc29tZXRoaW5nIGFsb25n
IHRoZSBsaW5lcyBvZgo+Pgo+PiAjZGVmaW5lIFBSSV9zYmRmICJvcCIKPj4gI2RlZmluZSBQUklf
U0JERih2KSAoKHYpLnNiZGYpCj4+Cj4+IGFuZAo+Pgo+PiAgICAgcHJpbnRrKCIlIiBQUklfc2Jk
ZiAiOiAuLi5cbiIsIFBSSV9TQkRGKHBkZXYtPnNiZGYpLCAuLi4pOwo+IAo+IEV4Y2VwdCB0aGUg
YW5zd2VyIHdpbGwgYmUgdGhlIHNhbWUgYXMgZXZlcnkgdGltZSB5b3UndmUgYXNrZWQgdGhpcyBp
bgo+IHRoZSBwYXN0LgoKSSBkb24ndCByZWNhbGwgc3VnZ2VzdGluZyBhbnkgdXNlIG9mICVvIHNv
IGZhci4gVGhlIG9uZSB0aGluZyBJCmRvIHJlY2FsbCBzdWdnZXN0aW5nIChhbmQgd2hpY2ggdHVy
bmVkIG91dCBiYWQpIHdhcyB1c2luZyBhbgpsIG1vZGlmaWVyIHdpdGggJXBiLgoKPiBObywgYmVj
YXVzZSAtV2Zvcm1hdCBkb2Vzbid0IHRvbGVyYXRlIGl0LgoKSG93IHdvdWxkIC1XZm9ybWF0IGNo
b2tlIGhlcmU/ICVvIGFjY2VwdHMgKHVuc2lnbmVkKSBpbnRlZ2VycywKZG9lc24ndCBpdD8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
