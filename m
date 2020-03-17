Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A203A1887A1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:38:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDKm-00061t-K8; Tue, 17 Mar 2020 14:36:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEDKk-00061o-H7
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:36:42 +0000
X-Inumbo-ID: b78ed2ea-685c-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b78ed2ea-685c-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 14:36:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 700ABADA3;
 Tue, 17 Mar 2020 14:36:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6bad3fd-93b7-5835-4c46-dd2382dfd67e@suse.com>
Date: Tue, 17 Mar 2020 15:36:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313130614.27265-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/4] xen/rcu: add assertions to debug
 build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxNDowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBYZW4ncyBSQ1UgaW1w
bGVtZW50YXRpb24gcmVsaWVzIG9uIG5vIHNvZnRpcnEgaGFuZGxpbmcgdGFraW5nIHBsYWNlCj4g
d2hpbGUgYmVpbmcgaW4gYSBSQ1UgY3JpdGljYWwgc2VjdGlvbi4gQWRkIEFTU0VSVCgpcyBpbiBk
ZWJ1ZyBidWlsZHMKPiBpbiBvcmRlciB0byBjYXRjaCBhbnkgdmlvbGF0aW9ucy4KPiAKPiBGb3Ig
dGhhdCBwdXJwb3NlIG1vZGlmeSByY3VfcmVhZF9bdW5dbG9jaygpIHRvIHVzZSBhIGRlZGljYXRl
ZCBwZXJjcHUKPiBjb3VudGVyIGFkZGl0aW9uYWwgdG8gcHJlZW1wdF9bZW58ZGlzXWFibGUoKSBh
cyB0aGlzIGVuYWJsZXMgdG8gdGVzdAo+IHRoYXQgY29uZGl0aW9uIGluIF9fZG9fc29mdGlycSgp
IChBU1NFUlRfTk9UX0lOX0FUT01JQygpIGlzIG5vdAo+IHVzYWJsZSB0aGVyZSBkdWUgdG8gX19j
cHVfdXAoKSBjYWxsaW5nIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpCj4gd2hpbGUgaG9sZGlu
ZyB0aGUgY3B1IGhvdHBsdWcgbG9jaykuCj4gCj4gV2hpbGUgYXQgaXQgc3dpdGNoIHRoZSByY3Vf
cmVhZF9bdW5dbG9jaygpIGltcGxlbWVudGF0aW9uIHRvIHN0YXRpYwo+IGlubGluZSBmdW5jdGlv
bnMgaW5zdGVhZCBvZiBtYWNyb3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4Kd2l0aCBvbmUgcmVtYXJrOgoKPiBAQCAtOTEsMTYgKzExNCwyMyBAQCB0eXBlZGVmIHN0
cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVhZF9sb2NrX3Q7Cj4gICAqIHdpbGwgYmUgZGVmZXJy
ZWQgdW50aWwgdGhlIG91dGVybW9zdCBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24KPiAg
ICogY29tcGxldGVzLgo+ICAgKgo+IC0gKiBJdCBpcyBpbGxlZ2FsIHRvIGJsb2NrIHdoaWxlIGlu
IGFuIFJDVSByZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlvbi4KPiArICogSXQgaXMgaWxsZWdhbCB0
byBwcm9jZXNzIHNvZnRpcnFzIHdoaWxlIGluIGFuIFJDVSByZWFkLXNpZGUgY3JpdGljYWwgc2Vj
dGlvbi4KClRoZSBsYXRlc3Qgd2l0aCB0aGUgcmUtYWRkZWQgcHJlZW1wdF9kaXNhYmxlKCksIHdv
dWxkbid0IHRoaXMgYmV0dGVyCnNheSAiLi4uIHRvIHByb2Nlc3Mgc29mdGlycXMgb3IgYmxvY2sg
Li4uIj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
