Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EB41EA4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 10:08:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hayH4-0005fi-Iy; Wed, 12 Jun 2019 08:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hayH2-0005fX-OZ
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 08:06:24 +0000
X-Inumbo-ID: f609d308-8ce8-11e9-b9fb-effcef551efe
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f609d308-8ce8-11e9-b9fb-effcef551efe;
 Wed, 12 Jun 2019 08:06:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4AFC6AF35;
 Wed, 12 Jun 2019 08:06:19 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
 <bc1bd71d30525853e293624ec9684935b3082d14.camel@suse.com>
 <5D00AC740200007800237511@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5000adb1-ddaf-a13c-afc7-1e36674064a5@suse.com>
Date: Wed, 12 Jun 2019 10:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D00AC740200007800237511@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDYuMTkgMDk6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDExLjA2LjE5IGF0
IDE4OjU1LCA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToKPj4gT24gVHVlLCAyMDE5LTA1LTI4
IGF0IDEyOjMyICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gSW5zdGVhZCBvZiBzZXR0
aW5nIHRoZSBzY2hlZHVsZXIgcGVyY3B1IGxvY2sgYWRkcmVzcyBpbiBlYWNoIG9mIHRoZQo+Pj4g
c3dpdGNoX3NjaGVkIGluc3RhbmNlcyBvZiB0aGUgZGlmZmVyZW50IHNjaGVkdWxlcnMgZG8gdGhh
dCBpbgo+Pj4gc2NoZWR1bGVfY3B1X3N3aXRjaCgpIHdoaWNoIGlzIHRoZSBzaW5nbGUgY2FsbGVy
IG9mIHRoYXQgZnVuY3Rpb24uCj4+PiBGb3IgdGhhdCBwdXJwb3NlIGxldCBzY2hlZF9zd2l0Y2hf
c2NoZWQoKSBqdXN0IHJldHVybiB0aGUgbmV3IGxvY2sKPj4+IGFkZHJlc3MuCj4+Pgo+PiBUaGlz
IGxvb2tzIGdvb2QgdG8gbWUuIFRoZSBvbmx5IGFjdHVhbCBmdW5jdGlvbmFsL2JlaGF2aW9yYWwg
ZGlmZmVyZW5jZQo+PiBJJ3ZlIGJlZW4gYWJsZSB0byBzcG90IGlzIHRoZSBmYWN0IHRoYXQsIGlu
IENyZWRpdDIsIHdlIGN1cnJlbnRseQo+PiBzd2l0Y2ggdGhlIGxvY2sgcG9pbnRlciB3aGlsZSBz
dGlsbCBob2xkaW5nIHRoZSB3cml0ZSBsb2NrIG9uIHRoZQo+PiBnbG9iYWwgc2NoZWR1bGVyLiBB
ZnRlciB0aGlzIGNoYW5nZSwgd2UgZG9uJ3QgYW55IGxvbmdlci4KPj4KPj4gVGhhdCBiZWluZyBz
YWlkLCBJJ3ZlIHRyaWVkIHRvIHRoaW5rIGFib3V0IGhvdyB0aGlzIGNvdWxkIGJlIGEgcHJvYmxl
bSwKPj4gYnV0IGZhaWxlZCBhdCBpbWFnaW5pbmcgc3VjaCBhIHNjZW5hcmlvLCBzbzoKPj4KPj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+Cj4+IFJl
dmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+Pgo+PiBJJ20g
d29uZGVyaW5nIHdoZXRoZXIgaXQgbWFrZSBzZW5zZSBmb3IgdGhlIGFib3ZlIHRvIGJlIHF1aWNr
bHkKPj4gbWVudGlvbmVkIGluIHRoZSBjaGFuZ2Vsb2csIGJ1dCBhbSBsZWFuaW5nIHRvd2FyZCAi
bm90IHJlYWxseQo+PiBuZWNlc3NhcnkiLiBJbiBwYXJ0aWN1bGFyLCBJIGRvbid0IHRoaW5rIGl0
J3Mgd29ydGggdG8gcmVzcGluIHRoZSBwYXRjaAo+PiBqdXN0IGZvciB0aGF0Li4uIFNvLCBlaXRo
ZXIganVzdCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgYWRkZWQgd2hpbGUKPj4gY29tbWl0dGluZywg
b3IgZm9yZ2V0IGl0Lgo+IAo+IEknZCBiZSBoYXBweSB0byBhZGQgc29tZXRoaW5nIHdoaWxlIGNv
bW1pdHRpbmcsIGJ1dCBvbmUgb2YgeW91Cj4gd291bGQgbmVlZCB0byBwcm9wb3NlIHRoZSB3b3Jk
aW5nIG9mIHRoaXMgInNvbWV0aGluZyIuCgpXaGF0IGFib3V0OgoKSXQgc2hvdWxkIGJlIG5vdGVk
IHRoYXQgaW4gY3JlZGl0MiB0aGUgbG9jayB1c2VkIHRvIGJlIHNldCB3aGlsZSBzdGlsbApob2xk
aW5nIHRoZSBnbG9iYWwgc2NoZWR1bGVyIHdyaXRlIGxvY2ssIHdoaWNoIHdpbGwgbm8gbG9uZ2Vy
IGJlIHRydWUKd2l0aCB0aGUgbmV3IHNjaGVtZSBhcHBsaWVkLiBUaGlzIGlzIGFjdHVhbGx5IG5v
IHByb2JsZW0gYXMgdGhlIHdyaXRlCmxvY2sgaXMgbWVhbnQgdG8gZ3VhcmQgdGhlIGNhbGwgb2Yg
aW5pdF9wZGF0YSgpIHdoaWNoIHN0aWxsIGlzIHRydWUuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
