Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDAD150E4E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:04:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyf7Q-0004T2-H4; Mon, 03 Feb 2020 17:02:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyf7O-0004Sx-KH
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:02:38 +0000
X-Inumbo-ID: faab9ae0-46a6-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faab9ae0-46a6-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 17:02:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0074AFE1;
 Mon,  3 Feb 2020 17:02:36 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e4bbfae-d65e-eb0a-0497-998657391760@suse.com>
Date: Mon, 3 Feb 2020 18:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200121084330.18309-8-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/9] xen: provide version information in
 hypfs
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAwOTo0MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBQcm92aWRlIHZlcnNp
b24gYW5kIGNvbXBpbGUgaW5mb3JtYXRpb24gaW4gL2J1aWxkaW5mby8gbm9kZSBvZiB0aGUKPiBY
ZW4gaHlwZXJ2aXNvciBmaWxlIHN5c3RlbS4gQXMgdGhpcyBpbmZvcm1hdGlvbiBpcyBhY2Nlc3Np
YmxlIGJ5IGRvbTAKPiBvbmx5IG5vIGFkZGl0aW9uYWwgc2VjdXJpdHkgcHJvYmxlbSBhcmlzZXMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbiBzdWdnZXN0
aW9uOgoKPiBAQCAtMzczLDYgKzM3NCw1MCBAQCB2b2lkIF9faW5pdCBkb19pbml0Y2FsbHModm9p
ZCkKPiAgICAgICAgICAoKmNhbGwpKCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQg
bWFqb3JfdmVyc2lvbjsKPiArc3RhdGljIHVuc2lnbmVkIGludCBtaW5vcl92ZXJzaW9uOwo+ICsK
PiArc3RhdGljIEhZUEZTX0RJUl9JTklUKGJ1aWxkaW5mbywgImJ1aWxkaW5mbyIpOwo+ICtzdGF0
aWMgSFlQRlNfRElSX0lOSVQoY29tcGlsZWluZm8sICJjb21waWxlaW5mbyIpOwo+ICtzdGF0aWMg
SFlQRlNfRElSX0lOSVQodmVyc2lvbiwgInZlcnNpb24iKTsKPiArc3RhdGljIEhZUEZTX1VJTlRf
SU5JVChtYWpvciwgIm1ham9yIiwgbWFqb3JfdmVyc2lvbik7Cj4gK3N0YXRpYyBIWVBGU19VSU5U
X0lOSVQobWlub3IsICJtaW5vciIsIG1pbm9yX3ZlcnNpb24pOwo+ICtzdGF0aWMgSFlQRlNfU1RS
SU5HX0lOSVQoY2hhbmdlc2V0LCAiY2hhbmdlc2V0Iik7Cj4gK3N0YXRpYyBIWVBGU19TVFJJTkdf
SU5JVChjb21waWxlciwgImNvbXBpbGVyIik7Cj4gK3N0YXRpYyBIWVBGU19TVFJJTkdfSU5JVChj
b21waWxlX2J5LCAiY29tcGlsZV9ieSIpOwo+ICtzdGF0aWMgSFlQRlNfU1RSSU5HX0lOSVQoY29t
cGlsZV9kYXRlLCAiY29tcGlsZV9kYXRlIik7Cj4gK3N0YXRpYyBIWVBGU19TVFJJTkdfSU5JVChj
b21waWxlX2RvbWFpbiwgImNvbXBpbGVfZG9tYWluIik7Cj4gK3N0YXRpYyBIWVBGU19TVFJJTkdf
SU5JVChleHRyYSwgImV4dHJhIik7CgpQbGVhc2UgY29uc2lkZXIgbWFraW5nIGFsbCBvZiB0aGUg
YWJvdmUgX19yZWFkX21vc3RseS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
