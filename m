Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BFF45E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 12:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLQ9S-0003qN-6o; Tue, 30 Apr 2019 10:38:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLQ9Q-0003qI-8l
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:38:16 +0000
X-Inumbo-ID: 0ea9d524-6b34-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0ea9d524-6b34-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 10:38:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 04:38:13 -0600
Message-Id: <5CC82593020000780022A50D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 04:38:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1-mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
In-Reply-To: <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDEyOjMxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgoK
PiAKPiBPbiAzMC8wNC8yMDE5IDExOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMzAu
MDQuMTkgYXQgMTE6MTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gSW4geGVuL2NvbW1v
bi9zY2hlZHVsZS5jIHRoZXJlIGlzIGEgd2VpcmQgIiNpZm5kZWYgQ09ORklHX1g4NiIgaW4KPj4+
IGRvX3BvbGwoKS4KPj4+Cj4+PiBJdCB3YXMgaW50cm9kdWNlZCB3YXkgYmVmb3JlIGFueW9uZSB3
b3VsZCB0aGluayBhYm91dCBBUk0gYnkgY29tbWl0Cj4+PiBlZjRjNmIwNzljYzU1ZSAoSSBjb3Vs
ZG4ndCBmaW5kIGFueSB4ZW4tZGV2ZWwgbWFpbCByZWxhdGVkIHRvIHRoYXQKPj4+IGNvbW1pdCks
IHNvIEkgZ3Vlc3MgaXQgaXMgcmVsYXRlZCB0byBJQTY0Pwo+PiAKPj4gUXVpdGUgY2VydGFpbmx5
LCB5ZXMgKG9yIFBQQyBhcyBhbiBhbHRlcm5hdGl2ZSwgYnV0IEkga25vdyBub3RoaW5nCj4+IGFi
b3V0IHRoZWlyIG1lbW9yeSBvcmRlcmluZyBtb2RlbCkuCj4+IAo+Pj4gUXVlc3Rpb24gaXM6IGNh
biB3ZSBqdXN0IGRyb3AgaXQsIG9yIGRvZXMgQVJNIGRlcGVuZCBvbiBpdD8gQW5kIGlmIEFSTQo+
Pj4gcmVhbGx5IG5lZWRzIGl0LCBpcyBpdCB0aGUgbWVtb3J5IGJhcnJpZXIgb25seT8gQW5kIHdo
eSB3b3VsZG4ndCBhCj4+PiBzaW1pbGFyIGJhcnJpZXIgYmUgbmVlZGVkIGluIHZjcHVfYmxvY2so
KSB0aGVuPwo+PiAKPj4gSXQncyBub3QgdGhlIG1lbW9yeSBiYXJyaWVyLCBidXQgdGhlIHN1YnNl
cXVlbnQgY2hlY2tzLiBUaGUgYmFycmllcgo+PiBpcyB0aGVyZSBvbmx5IHRvIG1ha2Ugc3VyZSB0
aGUgY2hlY2tzIGRvbid0IGhhcHBlbiBiZWZvcmUgdGhlCj4+IGVhcmxpZXIgd3JpdGVzLiBBbmQg
YXMgdGhlIGNvbW1lbnQgc2F5cyAtIGl0J3MgdGhlIGNvbWJpbmF0aW9uIG9mCj4+IHRoZSAzIHdy
aXRlcyB0aGF0IG1heSBnZXQgbWlzLW9yZGVyZWQgYW5kIGhlbmNlIG1pcy1pbnRlcnByZXRlZCBi
eQo+PiBvdGhlciAocmVhZGluZykgcGFydGllcy4gdmNwdV9ibG9jaygpLCBvdG9oLCBzZXRzIHRo
ZSBWUEZfYmxvY2tlZAo+PiBiaXQgb25seSwgc28gdGhlcmUncyBubyBwb3RlbnRpYWwgb3JkZXJp
bmcgaXNzdWUgdGhlcmUuCj4gCj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoZSBjb21tZW50IGluIHZj
cHVfYmxvY2sgaXMgbm90IGNvcnJlY3Q/CgpOby4gQnV0IEknbSBub3QgdGFsa2luZyBhYm91dCB0
aGUgbG9jYWxfZXZlbnRzX25lZWRfZGVsaXZlcnkoKQpjaGVja3MgKHdoaWNoIGV4aXN0IGluIGJv
dGggZnVuY3Rpb25zKSwgYnV0IHRoZSBvbmVzIGluc2lkZSB0aGUKI2lmZGVmIGluIGRvX3BvbGwo
KSAod2hpY2ggaGF2ZSBubyBlcXVpdmFsZW50IGluIHZjcHVfYmxvY2soKSkuClRoYXQncyBub3Qg
dG8gc2F5IHRoYXQgdGhlcmUgbWF5IG5vdCBuZWVkIHRvIGJlIGEgYmFycmllciBhaGVhZApvZiBs
b2NhbF9ldmVudHNfbmVlZF9kZWxpdmVyeSgpIGFzIHdlbGwgLSBJJ3ZlIHNpbXBseSBub3QgdGhv
dWdodAp0aHJvdWdoIHRoYXQgZnVydGhlciBjYXNlICh5ZXQpLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
