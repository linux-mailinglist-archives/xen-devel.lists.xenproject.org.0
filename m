Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1480D38B57
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 15:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZEgE-0006My-Fj; Fri, 07 Jun 2019 13:13:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hZEgD-0006Mt-9w
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 13:13:13 +0000
X-Inumbo-ID: ff042a4c-8925-11e9-aafb-13a281ab3a44
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff042a4c-8925-11e9-aafb-13a281ab3a44;
 Fri, 07 Jun 2019 13:13:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 07 Jun 2019 07:13:09 -0600
Message-Id: <5CFA62E3020000780023642A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 07 Jun 2019 07:13:07 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <1559909224-26062-1-git-send-email-andrew.cooper3@citrix.com>
 <ec9e3d3d-867d-cccf-b873-6f145188f824@citrix.com>
 <8efecc80-34ce-0fec-f5f6-7917a4b1c0a4@citrix.com>
In-Reply-To: <8efecc80-34ce-0fec-f5f6-7917a4b1c0a4@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86: Fix boot with CONFIG_XSM enabled
 following c/s 7177f589ba
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
Cc: WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDE0OjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gImFkanVzdCBzeXN0ZW0gZG9tYWluIGNyZWF0aW9uIChhbmQgY2FsbCBpdCBlYXJsaWVy
IG9uIHg4NikiIGRpZG4ndCBhY2NvdW50Cj4gZm9yIHRoZSBmYWN0IHRoYXQgZG9tYWluX2NyZWF0
ZSgpIGRlcGVuZHMgb24gWFNNIGFscmVhZHkgYmVpbmcgc2V0IHVwLgo+IAo+IFRoZXJlZm9yZSwg
ZG9tYWluX2NyZWF0ZSgpIGZvbGxvd3MgeHNtX29wcy0+YWxsb2Nfc2VjdXJpdHlfZG9tYWluKCkg
d2hpY2ggaXMKPiBvZmZzZXQgMCBmcm9tIGEgTlVMTCBwb2ludGVyLCBtZWFuaW5nIHRoYXQgd2Ug
ZXhlY3V0ZSB0aGUgMTZiaXQgSVZUIHVudGlsCj4gaGFwcGVuaW5nIHRvIGV4cGxvZGUgaW4gX194
ODZfaW5kaXJlY3RfdGh1bmtfcmF4KCkuCj4gCj4gVGhlcmUgaXMgbm90aGluZyB2ZXJ5IGludGVy
ZXN0aW5nIHdoaWNoIHhzbV9tdWx0aWJvb3RfaW5pdCgpIG1vcmUgdGhhbgo+IGFsbG9jYXRpbmcg
bWVtb3J5LCB3aGljaCBtZWFucyBpdCBpcyBzYWZlIHRvIG1vdmUgZWFybGllciBkdXJpbmcgc2V0
dXAuCgpUaGUgbGFzdCBzZW50ZW5jZSBsb29rcyBzb21ld2hhdCBvZGQgdG8gbWUgKHRoZSAid2hp
Y2giIGluIHBhcnRpY3VsYXIpLgpQZXJoYXBzIHlvdSBjb3VsZCByZXBocmFzZSB0aGF0PwoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFzIHRvIG5vdCBjb25z
aWRlcmluZyBYU00gLSBJIGRpZCBzcGVjaWZpY2FsbHkgY2hlY2sgdGhhdCB0aGUgcmVzcGVjdGl2
ZQpGbGFzayBmdW5jdGlvbiBpcyBmaW5lLiBJIGZvcmdvdCB0aGF0IHRoZXJlJ3MgYW4gaW5kaXJl
Y3QgY2FsbCBpbiBiZXR3ZWVuLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
