Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C9150327
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 10:17:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyXor-0007Lg-RU; Mon, 03 Feb 2020 09:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iyXor-0007Lb-1K
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 09:15:01 +0000
X-Inumbo-ID: a714bea2-4665-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a714bea2-4665-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 09:15:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 670B4ADFF;
 Mon,  3 Feb 2020 09:14:59 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-6-jgross@suse.com>
 <20200131155753.gyv4n67oz3znsxt5@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f26c60d0-d056-2841-1b94-ef6dc397d995@suse.com>
Date: Mon, 3 Feb 2020 10:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200131155753.gyv4n67oz3znsxt5@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/9] libs: add libxenhypfs
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAgMTY6NTcsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMjEsIDIwMjAg
YXQgMDk6NDM6MjZBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQWRkIHRoZSBuZXcg
bGlicmFyeSBsaWJ4ZW5oeXBmcyBmb3IgYWNjZXNzIHRvIHRoZSBoeXBlcnZpc29yIGZpbGVzeXN0
ZW0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
PiAKPiBJJ3ZlIG9ubHkgc2tpbW1lZCByZWFkIGl0LiBUaGUgY29kZSBsb29rcyBzZW5zaWJsZS4K
PiAKPiBPbmUgbWlub3IgY29tbWVudC4KPiAKPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvaHlw
ZnMveGVuaHlwZnMucGMuaW4gYi90b29scy9saWJzL2h5cGZzL3hlbmh5cGZzLnBjLmluCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjljYjk2OGYwZGIKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi90b29scy9saWJzL2h5cGZzL3hlbmh5cGZzLnBjLmluCj4+IEBA
IC0wLDAgKzEsMTAgQEAKPj4gK3ByZWZpeD1AQHByZWZpeEBACj4+ICtpbmNsdWRlZGlyPUBAaW5j
ZGlyQEAKPj4gK2xpYmRpcj1AQGxpYmRpckBACj4+ICsKPj4gK05hbWU6IFhlbmh5cGZzCj4+ICtE
ZXNjcmlwdGlvbjogVGhlIFhlbmh5cGZzIGxpYnJhcnkgZm9yIFhlbiBoeXBlcnZpc29yCj4+ICtW
ZXJzaW9uOiBAQHZlcnNpb25AQAo+PiArQ2ZsYWdzOiAtSSR7aW5jbHVkZWRpcn0gQEBjZmxhZ3Ns
b2NhbEBACj4+ICtMaWJzOiBAQGxpYnNmbGFnQEAke2xpYmRpcn0gLWx4ZW5oeXBmcwo+PiArUmVx
dWlyZXMucHJpdmF0ZTogeGVudG9vbGNvcmUseGVudG9vbGxvZyx4ZW5jYWxsCj4gCj4gTmVlZCB0
byBsaXN0IGxpYnogaGVyZT8KClByb2JhYmx5LCB5ZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
