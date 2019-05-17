Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F32194B
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 15:38:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRd1u-0004cc-Db; Fri, 17 May 2019 13:36:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRd1s-0004cX-Bs
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 13:36:08 +0000
X-Inumbo-ID: b70ae0ec-78a8-11e9-ae3c-1f13e0bccbdf
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b70ae0ec-78a8-11e9-ae3c-1f13e0bccbdf;
 Fri, 17 May 2019 13:36:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 07:36:02 -0600
Message-Id: <5CDEB8C102000078002301DE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 07:36:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "George Dunlap" <George.Dunlap@eu.citrix.com>,
 "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
 <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
 <d46ce182-44e5-dab8-37ae-a9e920120e5f@suse.com>
In-Reply-To: <d46ce182-44e5-dab8-37ae-a9e920120e5f@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Ping: [PATCH] xen/sched: fix csched2_deinit_pdata()
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

Pj4+IE9uIDE3LjA1LjE5IGF0IDE1OjI0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Ny8wNS8yMDE5IDE1OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDguMDUuMTkgYXQg
MTM6MzEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQ29tbWl0IDc1M2JhNDNkNmQxNmU2
ODggKCJ4ZW4vc2NoZWQ6IGZpeCBjcmVkaXQyIHNtdCBpZGxlIGhhbmRsaW5nIikKPj4+IGludHJv
ZHVjZWQgYSByZWdyZXNzaW9uIHdoZW4gc3dpdGNoaW5nIGNwdXMgYmV0d2VlbiBjcHVwb29scy4K
Pj4+Cj4+PiBXaGVuIGFzc2lnbmluZyBhIGNwdSB0byBhIGNwdXBvb2wgd2l0aCBjcmVkaXQyIGJl
aW5nIHRoZSBkZWZhdWx0Cj4+PiBzY2hlZHVsZXIgY3NjaGVkMl9kZWluaXRfcGRhdGEoKSBpcyBj
YWxsZWQgZm9yIHRoZSBjcmVkaXQyIHByaXZhdGUgZGF0YQo+Pj4gYWZ0ZXIgdGhlIG5ldyBzY2hl
ZHVsZXIncyBwcml2YXRlIGRhdGEgaGFzIGJlZW4gaG9va2VkIHRvIHRoZSBwZXItY3B1Cj4+PiBz
Y2hlZHVsZXIgZGF0YS4gVW5mb3J0dW5hdGVseSBjc2NoZWQyX2RlaW5pdF9wZGF0YSgpIHdpbGwg
Y3ljbGUgdGhyb3VnaAo+Pj4gYWxsIHBlci1jcHUgc2NoZWR1bGVyIGFyZWFzIGl0IGtub3dzIG9m
IGZvciByZW1vdmluZyB0aGUgY3B1IGZyb20gdGhlCj4+PiByZXNwZWN0aXZlIHNpYmxpbmcgbWFz
a3MgaW5jbHVkaW5nIHRoZSBhcmVhIG9mIHRoZSBqdXN0IG1vdmVkIGNwdS4gVGhpcwo+Pj4gd2ls
bCAoZGVwZW5kaW5nIG9uIHRoZSBuZXcgc2NoZWR1bGVyKSBlaXRoZXIgY2xvYmJlciB0aGUgZGF0
YSBvZiB0aGUKPj4+IG5ldyBzY2hlZHVsZXIgb3IgaW4gY2FzZSBvZiBzY2hlZF9ydCBsZWFkIHRv
IGEgY3Jhc2guCj4+Pgo+Pj4gQXZvaWQgdGhhdCBieSByZW1vdmluZyB0aGUgY3B1IGZyb20gdGhl
IGxpc3Qgb2YgYWN0aXZlIGNwdXMgaW4gY3JlZGl0Mgo+Pj4gZGF0YSBmaXJzdC4KPj4+Cj4+PiBU
aGUgb3Bwb3NpdGUgcHJvYmxlbSBpcyBvY2N1cnJpbmcgd2hlbiByZW1vdmluZyBhIGNwdSBmcm9t
IGEgY3B1cG9vbDoKPj4+IGluaXRfcGRhdGEoKSBvZiBjcmVkaXQyIHdpbGwgYWNjZXNzIHRoZSBw
ZXItY3B1IGRhdGEgb2YgdGhlIG9sZAo+Pj4gc2NoZWR1bGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gCj4+IE1heSBJIGFzayB3aGF0
IHRoZSBkaXNwb3NpdGlvbiBvZiB0aGlzIGlzPyBJJ3ZlIG5vdGljZWQgdG9vIGxhdGUKPj4gdGhh
dCBJJ3ZlIGJhY2twb3J0ZWQgdGhlIGNvbW1pdCBiZWluZyBmaXhlZCBoZXJlIHdpdGhvdXQKPj4g
d2FpdGluZyBmb3IgdGhpcyBmaXggdG8gZ28gaW4uIEknZCBwcmVmZXIgdGhlIHN0YWJsZSB0cmVl
cywgaW4KPj4gcGFydGljdWxhciA0LjExIGZvciB0aGUgaW1wZW5kaW5nIDQuMTEuMiByZWxlYXNl
LCB0byBiZSBhYmxlCj4+IHRvIHBpY2sgdGhpcyB1cCBzb29uLgo+IAo+IERhcmlvIGFscmVhZHkg
Z2F2ZSBoaXMgUmV2aWV3ZWQtYnk6CgpPaCwgbXkgZmF1bHQgdGhlbiAtIGFwb2xvZ2llcy4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
