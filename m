Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE914E9DA
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 09:58:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixS6W-0005Eg-GQ; Fri, 31 Jan 2020 08:56:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixS6U-0005Eb-9E
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 08:56:42 +0000
X-Inumbo-ID: 992f5622-4407-11ea-8b9d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 992f5622-4407-11ea-8b9d-12813bfff9fa;
 Fri, 31 Jan 2020 08:56:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC49EAE0D;
 Fri, 31 Jan 2020 08:56:40 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-6-anthony.perard@citrix.com>
 <7c16cfcc-0ec5-18f9-e05c-84415fed72c9@suse.com>
 <91397e9b-794d-e59b-cde0-ebfc92ed15f9@suse.com>
 <20200130183422.GR1288@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49b73173-2fb3-3488-cc71-d5fd6b698b0c@suse.com>
Date: Fri, 31 Jan 2020 09:56:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130183422.GR1288@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 05/12] xen/include: remove include of
 Config.mk
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

T24gMzAuMDEuMjAyMCAxOTozNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MjksIDIwMjAgYXQgMDQ6MzM6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5
LjAxLjIwMjAgMTY6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTcuMDEuMjAyMCAxMTo1
MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+Pj4gSXQgaXNuJ3QgbmVjZXNzYXJ5IHRvIGluY2x1
ZGUgQ29uZmlnLm1rIGhlcmUgYmVjYXVzZSB0aGlzIE1ha2VmaWxlIGlzCj4+Pj4gb25seSB1c2Vk
IGJ5IHhlbi9SdWxlcy5tayB3aGljaCBhbHJlYWR5IGluY2x1ZGVzIENvbmZpZy5tay4KPj4+Cj4+
PiBBbmQgc28gaXMgeGVuL3Rlc3QvbGl2ZXBhdGNoL01ha2VmaWxlIGFmYWljcyBmcm9tIGl0cyBw
YXJlbnQgZGlyCj4+PiBNYWtlZmlsZS4gV2l0aCB0aGlzIGFsc28gYWRqdXN0ZWQgKG9yIGl0IGV4
cGxhaW5lZCB3aHkgSSdtIHNlZWluZwo+Pj4gdGhpbmdzIGluY29ycmVjdGx5KSAuLi4KPj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4KPj4gQW5kIG5vdyBJJ3ZlIHNlZW4gdGhhdCBwYXRjaCA2IGRvZXMganVzdCB0aGlzLiBJIHRo
aW5rIHN1Y2gKPj4gY29tbW9uIHRoZW1lIGNoYW5nZXMgYXJlLCB1bmxlc3MgcGF0Y2hlcyBhcmUg
b3Zlcmx5IGxhcmdlCj4+IGFscmVhZHksIGJldHRlciBwdXQgYWxsIGluIG9uIHBhdGNoLiBBbnl3
YXkgLSB0aGUgUi1iIHRoZW4KPj4gaXMgdW5jb25kaXRpb25hbC4KPiAKPiBJIGRvbid0IGxpa2Ug
c3F1YXNoaW5nIHVucmVsYXRlZCBjaGFuZ2VzIHRvZ2V0aGVyLiBJIHRob3VnaCBib3RoIGNoYW5n
ZXMKPiBkZXNlcnZlZCB0aGVyZSBvd24gZXhwbGFuYXRpb24gaW4gdGhpcyBjYXNlLiBUaGV5IGRv
bid0IHRvdWNoIHRoZSBzYW1lCj4gc3Vic3lzdGVtLCB0aGV5IGRvbid0IGhhdmUgdGhlIHNhbWUg
c2V0IG9mIG1haW50YWluZXJzLgoKWWVzLCB0aGUgaXNzdWUgd2FzIGluIHBhcnQgYmVjYXVzZSBJ
IG5vdGljZWQgdG9vIGxhdGUgdGhhdAp0aGVyZSB3YXMgYSAybmQsIHNpbWlsYXIgcGF0Y2ggKGFu
ZCBoZW5jZSBJIHdlbnQgYW5kIGNoZWNrZWQKd2hldGhlciB5b3UndmUgY2F1Z2h0IGFsbCBpbnN0
YW5jZXMgd2hlcmUgcmVtb3ZhbCB3b3VsZCBiZQpwb3NzaWJsZSkuIEkgdW5kZXJzdGFuZCB5b3Vy
IGNvbmNlcm5zLCB5ZXQgSSB0aGluayB0aGVzZSB0d28KYXJlbid0IHVucmVsYXRlZC4gVW5kZXIg
YSB0aXRsZSAicmVtb3ZlIHVubmVjZXNzYXJ5IGluY2x1ZGVzCm9mIENvbmZpZy5tayIgYm90aCB3
b3VsZCBoYXZlIGZpdC4gQnV0IGRvbid0IGdldCBtZSB3cm9uZywKSSdtIGZpbmUgd2l0aCB0aGVt
IHJlbWFpbmluZyBzcGxpdC4gQSBwb3N0LWNvbW1pdC1tZXNzYWdlCnJlbWFyayBjbGFyaWZ5aW5n
IHRoaXMgZG9lc24ndCBjb3ZlciBhbGwgaW5zdGFuY2VzIHdvdWxkCmhhdmUgaGVscGVkIHJldmll
dyBuZXZlcnRoZWxlc3MuCgo+PiBBbm90aGVyIHF1ZXN0aW9uOiBUaGUgY292ZXIgbGV0dGVyIGRv
ZXNuJ3Qgc2F5IGFueXRoaW5nIGFib3V0Cj4+IHNvbWUgKG9yIG1vc3QpIHBhdGNoZXMgaGVyZSBi
ZWluZyBpbmRlcGVuZGVudCBvZiBvbmUgYW5vdGhlciwKPj4gYW5kIGhlbmNlIHRoZSBvcHRpb24g
b2YgdGhlbSBnb2luZyBpbiBvdXQgb2Ygb3JkZXIuIFRoZSBvbmUKPj4gaGVyZSBsb29rcyB0byBi
ZSBlbnRpcmVseSBzdGFuZGFsb25lLCBmb3IgZXhhbXBsZS4KPiAKPiBJdCBpcyBleHRyYSB3b3Jr
IHRvIGZpZ3VyZSBvdXQgd2hpY2ggcGF0Y2ggY291bGQgYmUgYXBwbGllZCBvdXQgb2YKPiBvcmRl
ci4gSSB3b3VsZCBoYXZlIGluZGVwZW5kZW50IHBhdGNoIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhl
IHNlcmllcywKPiBidXQgaWYgdGhlcmUgYXJlbid0LCBpdCBpcyBwcm9iYWJseSBiZWNhdXNlIEkg
aGF2ZW4ndCB0aG91Z2ggdGhleSB3ZXJlCj4gaW1wb3J0YW50IGVub3VnaCB0byB0aGluayBhYm91
dCBhcHBseWluZyB0aGVtIGluZGVwZW5kZW50bHkuIEkgbWlnaHQgdHJ5Cj4gdG8gcmVvcmRlciBz
b21lIHBhdGNoZXMgaW4gbGF0ZXIgdmVyc2lvbiBvZiBhIHNlcmllcyB0byBoYXZlIHRoZW0KPiBh
cHBsaWVkIGVhcmxpZXIuCj4gCj4gQXMgZm9yIHRoaXMgc2VyaWVzLCBJIGRvIHRoaW5rIGFwcGx5
aW5nIG1vc3QgcGF0Y2hlcyBpbiBvcmRlciBpcwo+IGltcG9ydGFudCwgY2hhbmdpbmcgdGhlIG9y
ZGVyIG1heSBsZWFkIHRvIHVuZXhwZWN0ZWQgYnJlYWthZ2UuIFRoYXQKPiBtaWdodCBub3QgYmUg
dHJ1ZSwgYnV0IEkgZG9uJ3Qgd2FudCB0byBzcGVuZCB0aW1lIG9uIGNoZWNraW5nIHRoYXQuCgpG
YWlyIGVub3VnaC4gV2l0aCBteSBjb21taXR0ZXIgaGF0IG9uLCBJIGp1c3QgdHlwaWNhbGx5IHRy
eQp0byBzcG90IG9wcG9ydHVuaXRpZXMgb2YgY29tbWl0dGluZyBwaWVjZXMsIHRvIHJlZHVjZSB0
aGUKb3ZlcmFsbCB2b2x1bWUgb2YgdG8tYmUtcmVzZW50IHBhdGNoZXMuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
