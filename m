Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED1189A57
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 12:14:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWcO-0005ph-3t; Wed, 18 Mar 2020 11:12:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEWcM-0005pK-4Q
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 11:12:10 +0000
X-Inumbo-ID: 4e73a8aa-6909-11ea-bac2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e73a8aa-6909-11ea-bac2-12813bfff9fa;
 Wed, 18 Mar 2020 11:12:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 061F7B1FB;
 Wed, 18 Mar 2020 11:12:07 +0000 (UTC)
To: paul@xen.org
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
 <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
 <005f01d5fd02$b7aa2240$26fe66c0$@xen.org>
 <6bed9bf3-1d2b-286a-cd3f-55e5dd2d8efd@suse.com>
 <006401d5fd11$cdf31930$69d94b90$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68f41288-31dc-bb16-fd09-5a818cd8f3e9@suse.com>
Date: Wed, 18 Mar 2020 12:12:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <006401d5fd11$cdf31930$69d94b90$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jeff.kubascik@dornerworks.com, "'Xia, Hongyan'" <hongyxia@amazon.com>,
 stewart.hildebrand@dornerworks.com, xen-devel@lists.xenproject.org,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMTo0MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDE4IE1hcmNoIDIwMjAgMTA6MTAKPj4gVG86IHBhdWxAeGVuLm9yZwo+PiBDYzogJ0Rh
dmlkIFdvb2Rob3VzZScgPGR3bXcyQGluZnJhZGVhZC5vcmc+OyBzc3RhYmVsbGluaUBrZXJuZWwu
b3JnOyBqdWxpZW5AeGVuLm9yZzsgd2xAeGVuLm9yZzsKPj4ga29ucmFkLndpbGtAb3JhY2xlLmNv
bTsgZ2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tOyBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Owo+PiBpYW4uamFja3NvbkBldS5jaXRyaXguY29tOyBnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb207
IGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tOyAnWGlhLCBIb25neWFuJwo+PiA8aG9uZ3l4
aWFAYW1hem9uLmNvbT47IHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb207IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0geGVu
L21tOiBJbnRyb2R1Y2UgUEdfc3RhdGVfdW5pbml0aWFsaXNlZAo+Pgo+PiBPbiAxOC4wMy4yMDIw
IDA5OjUzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2pl
Y3Qub3JnPiBPbiBCZWhhbGYgT2YgRGF2aWQgV29vZGhvdXNlCj4+Pj4gU2VudDogMTcgTWFyY2gg
MjAyMCAyMjoxNQo+Pj4+Cj4+Pj4gT24gVGh1LCAyMDIwLTAyLTIwIGF0IDEyOjU5ICswMTAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDcuMDIuMjAyMCAxOTowNCwgRGF2aWQgV29vZGhv
dXNlIHdyb3RlOgo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPj4+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4+Pj4+PiBAQCAtNDg4LDcgKzQ4OCw4IEBAIHZvaWQgc2hhcmVfeGVu
X3BhZ2Vfd2l0aF9ndWVzdChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBzdHJ1Y3QgZG9tYWluICpk
LAo+Pj4+Pj4KPj4+Pj4+ICAgICAgICBwYWdlX3NldF9vd25lcihwYWdlLCBkKTsKPj4+Pj4+ICAg
ICAgICBzbXBfd21iKCk7IC8qIGluc3RhbGwgdmFsaWQgZG9tYWluIHB0ciBiZWZvcmUgdXBkYXRp
bmcgcmVmY250LiAqLwo+Pj4+Pj4gLSAgICBBU1NFUlQoKHBhZ2UtPmNvdW50X2luZm8gJiB+UEdD
X3hlbl9oZWFwKSA9PSAwKTsKPj4+Pj4+ICsgICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYg
flBHQ194ZW5faGVhcCkgPT0gUEdDX3N0YXRlX2ludXNlIHx8Cj4+Pj4+PiArICAgICAgICAgICAo
cGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hlYXApID09IFBHQ19zdGF0ZV91bmluaXRpYWxp
c2VkKTsKPj4+Pj4KPj4+Pj4gQ2FuIHVuaW5pdGlhbGl6ZWQgcGFnZXMgcmVhbGx5IG1ha2UgaXQg
aGVyZT8KPj4+Pgo+Pj4+IFllcCwgd2Ugc2hhcmUgdGhlIGxvdyAxTWlCIHdpdGggZG9tX2lvLgo+
Pj4+Cj4+Pgo+Pj4gT09JIGFueW9uZSBrbm93IHdoeSB3ZSBkbyB0aGlzPyBJcyBpdCBhY3R1YWxs
eSBuZWNlc3Nhcnk/Cj4+Cj4+IFllcywgZm9yIERvbTAgdG8gYmUgYWJsZSB0byBhY2Nlc3MgdGhp
bmdzIGxpa2UgRUJEQSwgSUJGVCwgb3IgZGF0YQo+PiBmb3VuZCBpbiBCSU9TIHNwYWNlLgo+Pgo+
IAo+IE9rLiBJIGFtIHN0aWxsIHdvbmRlcmluZyB3aHkgZG9tMCdzIGxvdyAxTWlCIG9mIHBmbiBz
cGFjZSBpcyBub3QKPiBzaW1wbHkgbWFwcGVkIDE6MSB0aG91Z2guIEp1c3QgaGlzdG9yaWNhbD8K
CldlbGwsIGluIGEgd2F5IHBlcmhhcHMuIFVzaW5nIHRoZSBEb21JTyBhcHByb2FjaCBpcyBsZXNz
IG9mIGEgc3BlY2lhbApjYXNlIHRoYW4gbWFwcGluZyBzb21lIGFyYml0cmFyeSByYW5nZSAxOjEu
IEZ1cnRoZXJtb3JlIERvbTAgYmVpbmcgUFYKd291bGRuJ3QgbmVjZXNzYXJpbHkgZXhwZWN0IGFu
eSBCSU9TIGluIGl0cyBQRk4gcmFuZ2UgdGhlcmUsIGJ1dApyYXRoZXIgdmlld3MgaXQgYXMgbm9y
bWFsIFJBTS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
