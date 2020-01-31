Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7214F2CD
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 20:35:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixc1U-00074P-SP; Fri, 31 Jan 2020 19:32:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DGHf=3U=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1ixc1T-00074K-G8
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 19:32:11 +0000
X-Inumbo-ID: 5f0ebdb2-4460-11ea-b211-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5f0ebdb2-4460-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 19:32:10 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200121143926.125116-1-jeff.kubascik@dornerworks.com>
 <95cf666a-a3d1-10f3-ab8a-22fd622ce114@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <8ea66aca-b52a-3c30-6cb9-a01f33006985@dornerworks.com>
Date: Fri, 31 Jan 2020 14:32:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <95cf666a-a3d1-10f3-ab8a-22fd622ce114@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH] xen/arm: Implement GICD_IGRPMODR as RAZ/WI
 for VGICv3
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMS8yOS8yMDIwIDQ6MjcgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToK
PiBIaSBKZWZmLAo+IAo+IE9uIDIxLzAxLzIwMjAgMTQ6MzksIEplZmYgS3ViYXNjaWsgd3JvdGU6
Cj4+IFRoZSBWR0lDdjMgbW9kdWxlIGRvZXMgbm90IGltcGxlbWVudCBzZWN1cml0eSBleHRlbnNp
b25zIGZvciBndWVzdHMuCj4+IEZ1cnRoZXJtb3JlLCBwZXIgdGhlIEFSTSBHZW5lcmljIEludGVy
cnVwdCBDb250cm9sbGVyIEFyY2hpdGVjdHVyZQo+PiBTcGVjaWZpY2F0aW9uIChBUk0gSUhJIDAw
NjlFKSwgc2VjdGlvbiA5LjkuMTUsIHRoZSBHSUNEX0lHUlBNT0RSCj4+IHJlZ2lzdGVyIHNob3Vs
ZCBiZSBSQVovV0kgdG8gbm9uLXNlY3VyZSBhY2Nlc3NlcyB3aGVuIEdJQ0RfQ1RMUi5EUyA9IDAu
Cj4+IFRoaXMgaW1wbGVtZW50cyB0aGUgR0lDRF9JR1JQTU9EUiByZWdpc3RlciBmb3IgZ3Vlc3Qg
Vk1zIGFzIFJBWi9XSSwgdG8KPj4gYXZvaWQgYSBkYXRhIGFib3J0IGluIHRoZSBjYXNlIHRoZSBn
dWVzdCBhdHRlbXB0cyB0byByZWFkIG9yIHdyaXRlIHRoZQo+PiByZWdpc3Rlci4KPiAKPiBQZXIg
dGhlIHNwZWMsIGFsbCByZXNlcnZlZCByZWdpc3RlcnMgc2hvdWxkIGJlIFJBWi9XSS4gU28gaG93
IGFib3V0Cj4gaW1wbGVtZW50aW5nIHRoZSBkZWZhdWx0IGNhc2UgYXMgcmVhZF9hc196ZXJvL3dy
aXRlX2lnbm9yZT8KPiAKPiBUaGlzIHdvdWxkIGFsc28gY292ZXIgc29tZSBwcm9ibGVtIHRoYXQg
bWF5IGFyaXNlIHdpdGggZnV0dXJlIExpbnV4LiBJCj4gaGF2ZSBhY3R1YWxseSBiZWVuIHRvbGQg
dGhhdCBMaW51eCB3aWxsIGFjY2VzcyByZWdpc3RlcnMgKElJUkMgR0lDdjQKPiBzcGVjaWZpYykg
dGhhdCBtYXkgbm90IGhhdmUgYmVlbiBpbXBsZW1lbnRlZCBieSBYZW4gYW5kIHNob3VsZCBiZSBS
QVovV0kuCgpJIGFtIHZlcnkgbXVjaCBpbiBzdXBwb3J0IG9mIHRoaXMgYXBwcm9hY2guIFdlIGhh
dmUgc2VlbiB0aGlzIGlzc3VlIGluIHRoZSBwYXN0CndoZW4gcG9ydGluZyBvdGhlciBSVE9TJ3Mg
dG8gWGVuLCB0eXBpY2FsbHkgZHVyaW5nIEdJQyBkcml2ZXIgaW5pdGlhbGl6YXRpb24uCgpJJ2xs
IHNlbmQgb3V0IGEgdjIgb2YgdGhpcyBwYXRjaCB0aGF0IHdpbGwgbWFrZSB0aGUgZGVmYXVsdCBj
YXNlIFJBWi9XSS4KCj4gQ2hlZXJzLAo+IAo+IC0tCj4gSnVsaWVuIEdyYWxsCj4gCgpTaW5jZXJl
bHksCkplZmYgS3ViYXNjaWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
