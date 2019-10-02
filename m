Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D1C8C37
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 17:03:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFg5x-00036X-D1; Wed, 02 Oct 2019 14:59:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFg5v-00036S-Ll
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 14:59:11 +0000
X-Inumbo-ID: 3095e694-e525-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3095e694-e525-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 14:59:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C15BCABD3;
 Wed,  2 Oct 2019 14:59:09 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
 <9b3f955c-ad76-601f-2b58-fa9dc4608c72@suse.com>
 <924f41b2-7779-9c56-9b71-56523756ecdc@oracle.com>
 <5650904d-b616-5ee7-216a-a0ac28d7426d@suse.com>
 <9d6b6b00-a3b1-95b4-7633-597c0094ab90@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63155d02-1082-3f26-6c2f-76aa3b753302@suse.com>
Date: Wed, 2 Oct 2019 16:59:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9d6b6b00-a3b1-95b4-7633-597c0094ab90@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/xen: Return from panic notifier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, james@dingwall.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxNjoxNCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEwLzIvMTkg
OTo0MiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Cj4+IEkgY2FuIG9ubHkgZ3Vlc3MgdGhhdCB0
aGUgdGhpbmtpbmcgcHJvYmFibHkgd2FzIHRoYXQgZS5nLiBleHRlcm5hbAo+PiBkdW1waW5nIChi
eSB0aGUgdG9vbCBzdGFjaykgd291bGQgYmUgbW9yZSByZWxpYWJsZSAoaW5jbHVkaW5nIGJ1dAo+
PiBub3QgbGltaXRlZCB0byB0aGlzIG1lYW5pbmcgbGVzcyBjaGFuZ2Ugb2Ygc3RhdGUgZnJvbSB3
aGVuIHRoZQo+PiBvcmlnaW5hbCBjcmFzaCByZWFzb24gd2FzIGRldGVjdGVkKSB0aGFuIGhhdmlu
ZyB0aGUgZG9tYWluIGR1bXAKPj4gaXRzZWxmLgo+IAo+IAo+IFdlIGNvdWxkIHJlZ2lzdGVyIGFu
IGV4dGVybmFsIGR1bXBlciAoY29udHJvbGxlZCBieSBhIGJvb3Qgb3B0aW9uCj4gcGVyaGFwcywg
b2ZmIGJ5IGRlZmF1bHQpIHRoYXQgd2lsbCBjYWxsIGRpcmVjdGx5IGludG8gaHlwZXJ2aXNvciB3
aXRoCj4gU0hVVERPV05fY3Jhc2guIFRoYXQgd2lsbCBndWFyYW50ZWUgdGhhdCB3ZSB3aWxsIGNv
bXBsZXRlIHRoZSBub3RpZmllcgo+IGNoYWluIHdpdGhvdXQgcmVseWluZyBvbiBwcmlvcml0aWVz
LiAoT2YgY291cnNlIHRoaXMgc3RpbGwgd29uJ3QgYWRkcmVzcwo+IGEgcG9zc2libGUgbmV3IGZl
YXR1cmUgaW4gcGFuaWMoKSB0aGF0IG1pZ2h0IGJlIGNhbGxlZCBwb3N0LWR1bXBpbmcpCj4gCj4g
SWYgeW91IHRoaW5rIGl0J3Mgd29ydGggZG9pbmcgdGhpcyBjYW4gYmUgZWFzaWx5IGFkZGVkLgoK
V2VsbCwgSSB0aGluayB0aGlzIGlzIHRoZSBiZXR0ZXIgb3B0aW9uIHRoYW4gcG90ZW50aWFsbHkK
cGluZ3BvbmdpbmcgYmV0d2VlbiB0aGUgdHdvIGV4dHJlbWVzLCBiZWNhdXNlIG9uZSB3YW50cyBp
dCB0aGUKd2F5IGl0IGN1cnJlbnRseSBpcyBhbmQgYW5vdGhlciB3YW50cyBpdCB0aGUgd2F5IHRo
aXMgcGF0Y2gKY2hhbmdlcyB0aGluZ3MgdG8uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
