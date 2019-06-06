Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8B3715E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 12:12:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYpL2-0006Ze-HI; Thu, 06 Jun 2019 10:09:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYpL0-0006ZX-Fo
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 10:09:38 +0000
X-Inumbo-ID: 2f5864c6-8843-11e9-9de3-1b844a837716
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f5864c6-8843-11e9-9de3-1b844a837716;
 Thu, 06 Jun 2019 10:09:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 04:09:34 -0600
Message-Id: <5CF8E65B0200007800235DB8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 04:09:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
 <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
In-Reply-To: <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
 pci_sbdf_t
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDExOjUwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIFttYWls
dG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9uIEJlaGFsZiBPZiAK
PiBSb2dlciBQYXUgTW9ubmUKPj4gU2VudDogMDYgSnVuZSAyMDE5IDEwOjAyCj4+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgCj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIAo+IFJ6
ZXN6dXRlayBXaWxrCj4+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcCA8
R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgQW5kcmV3IAo+IENvb3Blcgo+PiA8QW5kcmV3LkNv
b3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
VGltIChYZW4ub3JnKSAKPiA8dGltQHhlbi5vcmc+OyBKdWxpZW4KPj4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1
IE1vbm5lIAo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0g
W1BBVENIIHYyIDAxLzEyXSBwY2k6IGludHJvZHVjZSBhIGRldmZuIGZpZWxkIHRvIAo+IHBjaV9z
YmRmX3QKPj4gCj4+IFRoaXMgaXMgZXF1aXZhbGVudCB0byB0aGUgY3VycmVudCBleHRmdW5jIGZp
ZWxkIGluIHRlcm0gb2YgY29udGVudHMuCj4+IAo+PiBTd2l0Y2ggdGhlIHR3byBjdXJyZW50IHVz
ZXJzIG9mIGV4dGZ1bmMgdG8gdXNlIGRldmZuIGluc3RlYWQgZm9yCj4+IGNvcnJlY3RuZXNzLgo+
PiAKPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4+IAo+PiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT4KPj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBDYzogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+
PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4gLS0tCj4+IENoYW5nZXMgc2luY2UgdjE6Cj4+
ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uCj4+IC0tLQo+PiBOQjogUGF1bCBzdWdnZXN0ZWQgdG8g
bmFtZSB0aGUgZnVuY3Rpb24gZmllbGQgZm4gaW5zdGVhZCBvZiBmdW5jLCBzbwo+PiB0aGF0IGl0
IHdvdWxkIG1hdGNoIHRoZSBuYW1pbmcgb2YgdGhlIGRldmZuIGZpZWxkLiBTYWRseSB0aGUgZnVu
Ywo+PiBmaWVsZCBjYW5ub3QgYmUgYWxpYXNlZCB0byBhbm90aGVyIGZpZWxkIHVzaW5nIGEgdW5p
b24gYmVjYXVzZSBpdCdzIGEKPj4gYml0IGZpZWxkLCBzbyB0aGUgb25seSBvcHRpb24gaXMgdG8g
cmVuYW1lIGZ1bmMgdG8gZm4uCj4gCj4gSXMgdGhhdCB0cnVlPyBDYW4geW91IG5vdCBkbyBzb21l
dGhpbmcgbGlrZS4uLgo+IAo+IHVuaW9uIHsKPiAgIHN0cnVjdCB7Cj4gICAgIHVpbnQ4X3QgZnVu
YyA6IDMsCj4gICAgICAgICAgICAgZGV2ICA6IDU7Cj4gICB9Owo+ICAgc3RydWN0IHsKPiAgICAg
dWludDhfdCBmbiAgIDogMywKPiAgICAgICAgICAgICBwYWQgIDogNTsKCkFuZCB0aGUgInBhZCIg
ZmllbGQgaGVyZSB3b3VsZG4ndCByZWFsbHkgYmUgbmVjZXNzYXJ5LgoKSXMgdGhlcmUgYSByZWFz
b24gImZ1bmMiIG5lZWRzIHRvIGJlIGtlcHQ/IElmIHNvLCBpcyB0aGVyZSBhIHBsYW4gdG8KcGhh
c2Ugb3V0IGl0cyB1c2U/IElmIHNvLCBwZXJoYXBzIGZuIGFuZCBkZXYgc2hvdWxkIGJlIGdyb3Vw
ZWQKdG9nZXRoZXIsIGFuZCBmdW5jIHNob3VsZCBiZWNvbWUgdGhlICh0ZW1wb3JhcnkpIGFsaWFz
PwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
