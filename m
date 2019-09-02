Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F4A5AA4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 17:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4oKP-0002hW-5c; Mon, 02 Sep 2019 15:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4oKO-0002hQ-9W
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 15:33:12 +0000
X-Inumbo-ID: f7d49e6a-cd96-11e9-aea3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7d49e6a-cd96-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 15:33:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65523AF7A;
 Mon,  2 Sep 2019 15:33:10 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
 <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
 <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
 <f0aa7c7e-82a9-4b94-4c00-d9faa763d505@suse.com>
 <f8078a1de8d54ff5801a679182bfc03e@AMSPEX02CL03.citrite.net>
 <9519b0cf-8e00-f1f8-af41-f036a9132208@suse.com>
 <80440d28316f4cc3921f869005f1b94c@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32484cb1-1a5d-db21-c625-30008a9773f2@suse.com>
Date: Mon, 2 Sep 2019 17:33:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <80440d28316f4cc3921f869005f1b94c@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim\(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNzoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDE1OjU0
Cj4+Cj4+IE9uIDAyLjA5LjIwMTkgMTY6MjEsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IFllcywg
dGhlIGhhcCBwYXJ0IHN0YXlzIHB1dC4gVGhlICdvb3Nfb2ZmJyBwYXJ0IG1vdmVzIHRvIHg4NiBh
bmQgYXJtIGNhbgo+Pj4gYmUgbGVmdCBhbG9uZSBiZWNhdXNlIGl0IGFscmVhZHkgcmVqZWN0cyBm
bGFncyAhPSAoaHZtIHwgaGFwKS4KPj4KPj4gQnV0IGl0IG1heSBiZXR0ZXIgcmVqZWN0IHRoZSBP
T1MgZmxhZyBfZGVzcGl0ZV8gaGF2aW5nIG9ubHkgSFZNIGd1ZXN0cywKPj4gYXMgbG9uZyBhcyB0
aGVyZSdzIG5vIHNoYWRvdyBtb2RlIHRoZXJlIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4KPiAKPiBU
aGUgZmxhZyB3aWxsIGJlIHJlamVjdGVkLiBBcyBJIHNhaWQgKGluIGFiYnJldmlhdGVkIGZvcm0p
LCB0aGUgdGVzdCBpbiB0aGUgQVJNIGNvZGUgaXM6Cj4gCj4gaWYgKGNvbmZpZy0+ZmxhZ3MgIT0g
KFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCB8IFhFTl9ET01DVExfQ0RGX2hhcCkgKQo+IAllcnJv
ci4uLgo+IAo+IFNvLCBhbnkgYXR0ZW1wdCB0byBzZXQgWEVOX0RPTUNUTF9DREZfb29zX29mZiB3
aWxsIGFscmVhZHkgY2F1c2UgYW4gZXJyb3IuCgpPaCwgSSdtIHNvcnJ5LCBJIGRpZG4ndCByZWNh
bGwgdGhhdCB0aGV5IGFjY2VwdCBvbmx5IGEgc2luZ2xlIHZhbHVlCmhlcmUuIEknbSBzb3JyeSBm
b3IgdGhlIG5vaXNlIHRoZW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
