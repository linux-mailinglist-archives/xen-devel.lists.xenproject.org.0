Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD8C0485
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:43:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDod9-0000If-6g; Fri, 27 Sep 2019 11:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDod7-0000IZ-KY
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:41:45 +0000
X-Inumbo-ID: c7ae0ae2-e11b-11e9-9675-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c7ae0ae2-e11b-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 11:41:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1940AEC4;
 Fri, 27 Sep 2019 11:41:43 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
Date: Fri, 27 Sep 2019 13:41:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23949.58956.637645.181431@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/6] docs: add feature document for Xen
 hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 AndrewCooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTI6MzcsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mgd3Jp
dGVzICgiW1BBVENIIHYxIDEvNl0gZG9jczogYWRkIGZlYXR1cmUgZG9jdW1lbnQgZm9yIFhlbiBo
eXBlcnZpc29yIHN5c2ZzLWxpa2Ugc3VwcG9ydCIpOgo+PiBPbiB0aGUgMjAxOSBYZW4gZGV2ZWxv
cGVyIHN1bW1pdCB0aGVyZSB3YXMgYWdyZWVtZW50IHRoYXQgdGhlIFhlbgo+PiBoeXBlcnZpc29y
IHNob3VsZCBnYWluIHN1cHBvcnQgZm9yIGEgaGllcmFyY2hpY2FsIG5hbWUtdmFsdWUgc3RvcmUK
Pj4gc2ltaWxhciB0byB0aGUgTGludXgga2VybmVsJ3Mgc3lzZnMuCj4+Cj4+IEluIHRoZSBiZWdp
bm5pbmcgdGhlcmUgc2hvdWxkIG9ubHkgYmUgYmFzaWMgc3VwcG9ydDogZW50cmllcyBjYW4gYmUK
Pj4gYWRkZWQgZnJvbSB0aGUgaHlwZXJ2aXNvciBpdHNlbGYgb25seSwgdGhlcmUgaXMgYSBzaW1w
bGUgaHlwZXJjYWxsCj4+IGludGVyZmFjZSB0byByZWFkIHRoZSBkYXRhLgo+Pgo+PiBBZGQgYSBm
ZWF0dXJlIGRvY3VtZW50IGZvciBzZXR0aW5nIHRoZSBiYXNlIG9mIGEgZGlzY3Vzc2lvbiByZWdh
cmRpbmcKPj4gdGhlIGRlc2lyZWQgZnVuY3Rpb25hbGl0eSBhbmQgdGhlIGVudHJpZXMgdG8gYWRk
Lgo+IAo+IFRoYW5rcyBmb3IgdGhpcyB3b3JrLiAgTGlrZSBvdGhlcnMsIEkgYXBwcm92ZSBvZiB0
aGUgYmFzaWMgaWRlYS4KPiAKPiBSZWFkaW5nIHlvdXIgc3BlYyBkb2N1bWVudCBoZXJlLCBJIHRo
aW5rIHRoZXJlIGlzIGEga2V5IHBhcnQgbWlzc2luZzoKPiBwbGVhc2UgY291bGQgeW91IHNwZWNp
ZnkgdGhlIGFsbG93YWJsZSBzeW50YXggZm9yIGtleXMsIGFuZCBmb3IKPiB2YWx1ZXMuCgpZZXMs
IHRoYXQgc2hvdWxkIGJlIGRvbmUuCgo+IAo+IEkgZ3Vlc3MgdGhhdCBrZXlzIHdpbGwgYmUgY2hv
c2VuIGZyb20gc29tZSBsaW1pdGVkIHNhZmUgY2hhcmFjdGVyCj4gc2V0ID8gIFdoYXQgYWJvdXQg
dmFsdWVzID8gIE1pZ2h0IHdlIGNyZWF0ZSBhIGtleSB3aG9zZSB2YWx1ZSBjb250YWlucwo+IGJp
bmFyeSBkYXRhID8KCkknZCBnbyB3aXRoICJbLUEtWmEtejAtOUBfLjooKVxbXF0jLDtdKiIgZm9y
IGtleXMgYW5kIEFTQ0lJIGZvciB2YWx1ZXMuCgo+IERlcGVuZCBvbiB0aGUgYW5zd2VyIHRvIHRo
aXMgcXVlc3Rpb24sIEkgbWF5IHdhbnQgdG8gc3VnZ2VzdCBjaGFuZ2VzCj4gb3IgZW5oYW5jZW1l
bnRzIHRvIHlvdXIgcHJvcG9zZWQgY29tbWFuZC1saW5lIHRvb2wuCj4gCj4gQWxzbywgeW91ciB0
b3AtbGV2ZWwgZG9jdW1lbnQgaGFzIGEgbGlzdCBvZiBwYXRocyBpbiBpdCwgd2hpY2ggaXMKPiBw
cmVzdW1hYmx5IHByb3NwZWN0aXZlLiAgTWF5YmUgdGhhdCBpbmZvcm1hdGlvbiBzaG91bGQgYmUg
YSBub24tcGFyc2VkCj4gaGVhZGVyIHNlY3Rpb24gaW4gdGhlIHBhdGhzIGRvY3VtZW50ID8KClll
cywgdGhhdCdzIGJldHRlci4KCj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gYWRkIGEgc2NyaXB0
IHRvIHhlbi5naXQgd2hpY2ggbGlzdHMgdGhlCj4geGVuaHlwZnMgYW5kIGNoZWNrcyB0aGF0IGFs
bCB0aGUgcGF0aHMgYXJlIGRvY3VtZW50ZWQgPyAgV2UgY291bGQgYWRkCj4gYSBmZXcgY2FsbHMg
dG8gdGhhdCB0byBvc3N0ZXN0Li4uCgpJJ2QgZXhwZWN0IHNvbWUgcGFydHMgdG8gYmUgZGVzY3Jp
YmVkIHJhdGhlciBnZW5lcmljYWxseSAoYXMgY2FuIGJlIHNlZW4KaW4gcGF0Y2ggNiBmb3IgdGhl
IHJ1bnRpbWUgcGFyYW1ldGVycykuIE1heWJlIEkgc2hvdWxkIGFkZCB0aGUgZW50cmllcwp3aXRo
IHdpbGRjYXJkcyB0aGVyZS4KCk9UT0ggYWRkaW5nIHN1Y2ggYSBzY3JpcHQgY2FuIGVhc2lseSBi
ZSBkb25lIGxhdGVyLCBtYXliZSB3aXRoIHNvbWUKdHdlYWtzIHRvIHRoZSBwYXRoIGRvY3VtZW50
YXRpb24uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
