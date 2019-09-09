Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FCAAD953
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 14:46:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7J1l-0007zd-G6; Mon, 09 Sep 2019 12:44:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7J1k-0007zO-7h
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 12:44:16 +0000
X-Inumbo-ID: 8788bbd0-d2ff-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8788bbd0-d2ff-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 12:44:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DD65B02E;
 Mon,  9 Sep 2019 12:44:14 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9de7652a-fd0e-c487-8bf7-053d3ee0b2f1@suse.com>
Date: Mon, 9 Sep 2019 14:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] RFC: Criteria for checking in core scheduling series
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHVzaW5nIERhcmlvJ3MgY29ycmVjdCBtYWlsIGFkZHJlc3MKCk9uIDA2LjA5LjE5IDEzOjA5
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IFRoZXJlIHdhcyBhIGRpc2N1c3Npb24gb24gdGhlIGNv
bW11bml0eSBjYWxsIGFib3V0IHRoZSBjb3JlIHNjaGVkdWxpbmcKPiBzZXJpZXMgYmVpbmcgZGV2
ZWxvcGVkIGJ5IEp1ZXJnZW4gR3Jvc3MgWzFdLiAgVGhlIGNvbmNsdXNpb24gY2FuIGJlCj4gc3Vt
bWFyaXplZCBhcyBmb2xsb3dzOgo+IAo+ICogV2Ugbm9ybWFsbHkgd2FpdCB0byBjaGVjayBpbiBz
ZXJpZXMgdW50aWwgdGhleSBhcmUgcXVpdGUgZ29vZCAtLSBhbGwKPiB0aGUgaSdzIGRvdHRlZCBh
bmQgYWxsIHRoZSB0J3MgY3Jvc3NlZAo+IAo+ICogVGhpcyBpcyBmb3Igc2V2ZXJhbCByZWFzb25z
OyBwcmltYXJpbHkgYmVjYXVzZSBvbmNlIGNvZGUgZ2V0cyBjaGVja2VkCj4gaW4sIGl0IHJhcmVs
eSBnZXRzIGxvb2tlZCBhdCBhZ2Fpbi4gIEluIHBhcnRpY3VsYXIsIHRoZXJlJ3Mgbm90aGluZwo+
IHN0b3BwaW5nIHRoZSBzdWJtaXR0ZXIgZnJvbSBuZWdsZWN0aW5nIHRvIGRvIGltcG9ydGFudCBj
bGVhbi11cHMsIGluCj4gc3BpdGUgb2YgdGhlaXIgYmVzdCBpbnRlbnRpb25zOyBsZWF2aW5nIHRo
ZSBtYWludGFpbmVyIG9yIHRoZSByZXN0IG9mCj4gdGhlIGNvbW11bml0eSB0byBkbyBpdC4KPiAK
PiAqIEhvd2V2ZXIsIGZvciBwYXJ0aWN1bGFybHkgbG9uZywgY29tcGxpY2F0ZWQgc2VyaWVzIGxp
a2UgdGhlIGNvcmUKPiBzY2hlZHVsaW5nIHNlcmllcywgdGhpcyBjYW4gaGF2ZSBzaWduaWZpY2Fu
dCBkb3duc2lkZXMuICBSZWJhc2luZyBhCj4gNjAtcGF0Y2ggYnJhbmNoIHJlZ3VsYXJseSBpcyBh
IGxvdCBvZiBjaHVybiBmb3IgbGl0dGxlIHZhbHVlOyBhbmQgY29yZQo+IHBhcnRzIG9mIHRoZSBz
ZXJpZXMgd2hpY2ggYXJlIG1vc3RseSBjb21wbGV0ZSBhcmUgY3VycmVudGx5IG9ubHkgZ2V0dGlu
Zwo+IHNwb3JhZGljIGRldiB0ZXN0aW5nIHJhdGhlciB0aGFuIHRoZSB3aWRlIHJhbmdlIG9mIHRl
c3RpbmcgdGhleSB3b3VsZAo+IGdldCBmcm9tIGJlaW5nIGluIHN0YWdpbmcuCj4gCj4gKiBYZW5T
ZXJ2ZXIgYW5kIFN1U0UgYXJlIGJvdGggbG9uZy10ZXJtIGNvbW11bml0eSBtZW1iZXJzIHdpdGgg
YSBzdHJvbmcKPiBpbmNlbnRpdmUgdG8gbWFpbnRhaW4gYW5kIGltcHJvdmUgdGhlIGZlYXR1cmU7
IHNvIHRoZSByaXNrIG9mIHRoZQo+IGZlYXR1cmUgYmVpbmcgbGVmdCBmb3IgdGhlIGNvbW11bml0
eSB0byBtYWludGlhbiBpcyByZWxhdGl2ZWx5IG5vdy4KPiAKPiBXaXRoIGFsbCB0aG9zZSB0aGlu
Z3MgaW4gbWluZCwgdGhlIGNvbmNsdXNpb24gd2FzIHRvIGxvd2VyIHRoZQo+ICJjaGVjay1pbiIg
dGhyZXNob2xkIGZyb20gd2hhdCBpdCBub3JtYWxseSBpcywgaW4gb3JkZXIgdG8gYWxsb3cgdGhl
Cj4gc2VyaWVzIHRvIGJlIGNoZWNrZWQgaW4gaW4gdGhlIG5lYXIgZnV0dXJlLCBpbiBlbm91Z2gg
dGltZSBhdCBsZWFzdCBmb3IKPiB0aGUgImRlZmF1bHQgb2ZmIiB0byBiZSB3ZWxsLXRlc3RlZCBi
eSB0aGUgNC4xMyByZWxlYXNlLgo+IAo+IFRoZSBjcml0ZXJpYSB3ZSBza2V0Y2hlZCBvdXQgd2Vy
ZToKPiAKPiAqIEFsbCB0aGUgcGF0Y2hlcyBzdGlsbCBuZWVkIGFwcHJvcHJpYXRlIEFjayAvIFIt
YidzCj4gCj4gKiBUaGVyZSBzaG91bGQgYmUgcmVhc29uIHRvIGJlbGlldmUgdGhhdCB0aGUgc2Vy
aWVzIHdpbGwgaGF2ZSBsaXR0bGUgdG8KPiBubyBpbXBhY3Qgb24gInRocmVhZCBtb2RlIiAodGhy
ZWFkcyBiZWluZyB0aGUgdW5pdCBvZiBzY2hlZHVsaW5nOyBpLmUuLAo+IHRoZSBzdGF0dXMgcXVv
KQo+IAo+IFdSVCB0aGUgc2Vjb25kIHBvaW50LCBhcHBhcmVudGx5IFhlblNlcnZlciBoYXZlIGJl
ZW4gdGVzdGluZyB0aGUgc2VyaWVzCj4gcmVndWxhcmx5IGZvciBzb21lIHRpbWUsIGFuZCBhcmUg
c2F0aXNmaWVkIGZyb20gYSB0ZXN0aW5nIHBlcnNwZWN0aXZlCj4gdGhhdCB0aGVyZSBpcyBubyBz
aWduaWZpY2FudCBkZWdyYWRhdGlvbiBmb3IgdGhlIHNlcmllcyB3aGVuIGluICJ0aHJlYWQKPiBt
b2RlIi4KPiAKPiBTbyB0aGlzIHdvdWxkIHJlYWxseSBiZSBhIHJlY29tbWVuZGF0aW9uIC8gbGlj
ZW5zZSB0byB0aGUgdmFyaW91cwo+IG1haW50YWluZXJzIGludm9sdmVkOyBwcmltYXJpbHkgRGFy
aW8sIEkgdGhpbmsgKHNpbmNlIEkgcHJvYmFibHkgd29uJ3QKPiBoYXZlIHRpbWUgdG8gcmV2aWV3
IHRoZSBzZXJpZXMpLgo+IAo+IE5vIGRlY2lzaW9ucyBhcmUgb2ZmaWNpYWwgdW50aWwgZGlzY3Vz
c2VkIG9uIHhlbi1kZXZlbDsgc28gdGhlIGRlY2lzaW9uCj4gd2lsbCBub3QgYmUgY29uc2lkZXJl
ZCBvZmZpY2lhbCB1bnRpbCBhIGZldyBkYXlzIGhhdmUgcGFzc2VkIHdpdGhvdXQKPiBvYmplY3Rp
b24uICBBbmQgb2YgY291cnNlLCBpZiBhbnlvbmUgYXQgdGhlIG1lZXRpbmcgaGFkIGEgZGlmZmVy
ZW50Cj4gdW5kZXJzdGFuZGluZyBvZiB3aGF0IHdhcyBzYWlkLCBvciBoYXMgc29tZXRoaW5nIHRv
IGFkZCwgcGxlYXNlIGRvIHNvLgo+IAo+IFRoYW5rcywKPiAgIC1HZW9yZ2UKPiAKPiBbMV0gaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vMjAxOTA4MDkxNDU4MzMuMTAyMC0xLWpncm9zc0BzdXNlLmNv
bS8KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
