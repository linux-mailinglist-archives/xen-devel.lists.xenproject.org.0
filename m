Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658241DFC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 09:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haxsD-0002v3-Jz; Wed, 12 Jun 2019 07:40:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1haxsC-0002uy-Dw
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 07:40:44 +0000
X-Inumbo-ID: 60524c30-8ce5-11e9-b21f-db0e163f4f64
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60524c30-8ce5-11e9-b21f-db0e163f4f64;
 Wed, 12 Jun 2019 07:40:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 01:40:39 -0600
Message-Id: <5D00AC740200007800237511@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 01:40:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Dario Faggioli" <dfaggioli@suse.com>,
 "Juergen Gross" <jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
 <bc1bd71d30525853e293624ec9684935b3082d14.camel@suse.com>
In-Reply-To: <bc1bd71d30525853e293624ec9684935b3082d14.camel@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 Robert VanVossen <Robert.VanVossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDE4OjU1LCA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToKPiBP
biBUdWUsIDIwMTktMDUtMjggYXQgMTI6MzIgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
IEluc3RlYWQgb2Ygc2V0dGluZyB0aGUgc2NoZWR1bGVyIHBlcmNwdSBsb2NrIGFkZHJlc3MgaW4g
ZWFjaCBvZiB0aGUKPj4gc3dpdGNoX3NjaGVkIGluc3RhbmNlcyBvZiB0aGUgZGlmZmVyZW50IHNj
aGVkdWxlcnMgZG8gdGhhdCBpbgo+PiBzY2hlZHVsZV9jcHVfc3dpdGNoKCkgd2hpY2ggaXMgdGhl
IHNpbmdsZSBjYWxsZXIgb2YgdGhhdCBmdW5jdGlvbi4KPj4gRm9yIHRoYXQgcHVycG9zZSBsZXQg
c2NoZWRfc3dpdGNoX3NjaGVkKCkganVzdCByZXR1cm4gdGhlIG5ldyBsb2NrCj4+IGFkZHJlc3Mu
Cj4+IAo+IFRoaXMgbG9va3MgZ29vZCB0byBtZS4gVGhlIG9ubHkgYWN0dWFsIGZ1bmN0aW9uYWwv
YmVoYXZpb3JhbCBkaWZmZXJlbmNlCj4gSSd2ZSBiZWVuIGFibGUgdG8gc3BvdCBpcyB0aGUgZmFj
dCB0aGF0LCBpbiBDcmVkaXQyLCB3ZSBjdXJyZW50bHkKPiBzd2l0Y2ggdGhlIGxvY2sgcG9pbnRl
ciB3aGlsZSBzdGlsbCBob2xkaW5nIHRoZSB3cml0ZSBsb2NrIG9uIHRoZQo+IGdsb2JhbCBzY2hl
ZHVsZXIuIEFmdGVyIHRoaXMgY2hhbmdlLCB3ZSBkb24ndCBhbnkgbG9uZ2VyLgo+IAo+IFRoYXQg
YmVpbmcgc2FpZCwgSSd2ZSB0cmllZCB0byB0aGluayBhYm91dCBob3cgdGhpcyBjb3VsZCBiZSBh
IHByb2JsZW0sCj4gYnV0IGZhaWxlZCBhdCBpbWFnaW5pbmcgc3VjaCBhIHNjZW5hcmlvLCBzbzoK
PiAKPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+
IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IAo+IEkn
bSB3b25kZXJpbmcgd2hldGhlciBpdCBtYWtlIHNlbnNlIGZvciB0aGUgYWJvdmUgdG8gYmUgcXVp
Y2tseQo+IG1lbnRpb25lZCBpbiB0aGUgY2hhbmdlbG9nLCBidXQgYW0gbGVhbmluZyB0b3dhcmQg
Im5vdCByZWFsbHkKPiBuZWNlc3NhcnkiLiBJbiBwYXJ0aWN1bGFyLCBJIGRvbid0IHRoaW5rIGl0
J3Mgd29ydGggdG8gcmVzcGluIHRoZSBwYXRjaAo+IGp1c3QgZm9yIHRoYXQuLi4gU28sIGVpdGhl
ciBqdXN0IHNvbWV0aGluZyB0aGF0IGNhbiBiZSBhZGRlZCB3aGlsZQo+IGNvbW1pdHRpbmcsIG9y
IGZvcmdldCBpdC4KCkknZCBiZSBoYXBweSB0byBhZGQgc29tZXRoaW5nIHdoaWxlIGNvbW1pdHRp
bmcsIGJ1dCBvbmUgb2YgeW91CndvdWxkIG5lZWQgdG8gcHJvcG9zZSB0aGUgd29yZGluZyBvZiB0
aGlzICJzb21ldGhpbmciLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
