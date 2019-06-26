Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49D56466
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 10:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg36p-0004Hx-0J; Wed, 26 Jun 2019 08:16:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G0cr=UZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hg36m-0004Hs-SE
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 08:16:48 +0000
X-Inumbo-ID: bc13548c-97ea-11e9-a80b-9349b239590b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc13548c-97ea-11e9-a80b-9349b239590b;
 Wed, 26 Jun 2019 08:16:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 26 Jun 2019 02:16:44 -0600
Message-Id: <5D1329E8020000780023B2FD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 26 Jun 2019 02:16:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
 <23824.56583.488225.205300@mariner.uk.xensource.com>
 <23825.64696.25926.318881@mariner.uk.xensource.com>
 <23826.11187.707446.188402@mariner.uk.xensource.com>
 <5D123CD0020000780023B077@prv1-mh.provo.novell.com>
 <23826.17279.656820.722725@mariner.uk.xensource.com>
In-Reply-To: <23826.17279.656820.722725@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.6-testing test] 138333: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDE3OjUzLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMz
OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPj4gSSd2ZSB0YWtlbiBhIGxvb2suIFRoZSBndWVzdHMg
bm93IHRyaXBsZSBmYXVsdCBkdXJpbmcgQklPUyBpbml0aWFsaXphdGlvbjoKPiAKPiBUaGFua3Mu
ICBIcm0uCj4gCj4+IEkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHRoZSByb21iaW9zIGJ1aWxk
IGlzIGJyb2tlbiAtIGRpZCB5b3UgaGFwcGVuCj4+IHRvIGNvbXBhcmUgdGhvc2UgYmluYXJpZXM/
IE90b2ggSSBjYW4ndCBzZWVtIHRvIHNwb3QgYW55IGZpeGVzIGluCj4+IG1hc3RlciB0aGF0IHdv
dWxkIGxvb2sgbGlrZSBwb3NzaWJseSBhZGRyZXNzaW5nIGJ1aWxkIGlzc3VlcyB3aXRoIGEKPj4g
bmV3ZXIgdG9vbCBjaGFpbiAob3RoZXIgdGhhbiBjYXNlcyB3aGVyZSB0aGUgYnVpbGQgaXRzZWxm
IHdvdWxkIGZhaWwpLgo+IAo+IE5vLCBJIGhhdmVuJ3QgY29tcGFyZWQgdGhlIHJvbWJpb3MgYmlu
YXJpZXMuCj4gCj4+IElycmVzcGVjdGl2ZSBvZiB0aGlzIEknbSBub3QgcmVhbGx5IG9wcG9zZWQg
dG8gYSBmb3JjZSBwdXNoIGFzIHlvdSd2ZQo+PiBzdWdnZXN0ZWQsIGRlc3BpdGUgYmVpbmcgYWZy
YWlkIHRoYXQgdGhpcyBtYXkgaGlkZSBhbiBhY3R1YWwgaXNzdWUuCj4+IFRoYXQncyBldmVuIG1v
cmUgc28gdGhhdCBieSBub3cgNC43IGhhcyBnb25lIG91dCBvZiBzZWN1cml0eQo+PiBzdXBwb3J0
LCBhbmQgaGVuY2Ugd2Ugb25seSBuZWVkIGl0IG5vdyBmb3IgNC44J3MgLXByZXYgdGVzdHMuCj4g
Cj4gSW5kZWVkLCBwcmVjaXNlbHkuICBBcmUgaGFwcHkgd2l0aCBtZSBkb2luZyBhIGZvcmNlIHB1
c2ggbm93ID8KCkkgdGhpbmsgc28sIHllcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
