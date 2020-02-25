Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434416C257
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:30:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aG7-0008HI-DM; Tue, 25 Feb 2020 13:28:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6aG5-0008HD-KW
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:28:21 +0000
X-Inumbo-ID: b09c5222-57d2-11ea-9300-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b09c5222-57d2-11ea-9300-12813bfff9fa;
 Tue, 25 Feb 2020 13:28:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0684FAC66;
 Tue, 25 Feb 2020 13:28:20 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c31a7453-7f1b-22d4-f448-0bd486deed86@suse.com>
Date: Tue, 25 Feb 2020 14:28:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224123922.GO4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxMzozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyMSwgMjAyMCBhdCAxMDo0OToyMUFNIC0wODAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+
ICtzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRv
bWFpbiAqY2QpCj4+ICt7Cj4+ICsgICAgaW50IHJjID0gLUVJTlZBTDsKPj4gKwo+PiArICAgIGlm
ICggIWNkLT5jb250cm9sbGVyX3BhdXNlX2NvdW50ICkKPj4gKyAgICAgICAgcmV0dXJuIHJjOwo+
IAo+IC1FQlVTWSBtaWdodCBiZSBiZXR0ZXIgaGVyZS4KPiAKPj4gKwo+PiArICAgIC8qCj4+ICsg
ICAgICogV2Ugb25seSB3YW50IHRvIGdldCBhbmQgcGF1c2UgdGhlIHBhcmVudCBvbmNlLCBub3Qg
ZWFjaCB0aW1lIHRoaXMKPj4gKyAgICAgKiBvcGVyYXRpb24gaXMgcmVzdGFydGVkIGR1ZSB0byBw
cmVlbXB0aW9uLgo+PiArICAgICAqLwo+PiArICAgIGlmICggIWNkLT5wYXJlbnRfcGF1c2VkICkK
Pj4gKyAgICB7Cj4+ICsgICAgICAgIEFTU0VSVChnZXRfZG9tYWluKGQpKTsKPiAKPiBXZSBhcmUg
dHJ5aW5nIHRvIGF2b2lkIHN1Y2ggY29uc3RydWN0cywgaW5zdGVhZCBJIHN1Z2dlc3Q6Cj4gCj4g
aWYgKCAhZ2V0X2RvbWFpbihwYXJlbnQpICkKPiB7Cj4gICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgp
Owo+ICAgICByZXR1cm4gLUVCVVNZOwo+IH0KCkJ1dCBpc24ndCB0aGUgQVNTRVJUKCkgaGVyZSB3
cm9uZyBhbnl3YXk/IEkuZS4gd2hhdCBpcyBpdCB0aGF0Cmd1YXJhbnRlZXMgdGhhdCBkIGhhc24n
dCBnb25lIGF3YXk/IElmIGl0J3MgdGhlIGNhbGxlciBvZiB0aGlzCmZ1bmN0aW9uLCB0aGVuIHdv
dWxkbid0IGl0IGJlIGdldF9rbm93bmFsaXZlX2RvbWFpbigpIHRoYXQKd2FudHMgdXNpbmcgaGVy
ZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
