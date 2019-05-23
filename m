Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B499A28084
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 17:05:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTpEL-0003CR-T9; Thu, 23 May 2019 15:02:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTpEK-0003CK-Dw
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 15:02:04 +0000
X-Inumbo-ID: b7b11030-7d6b-11e9-842a-77b2687923ff
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7b11030-7d6b-11e9-842a-77b2687923ff;
 Thu, 23 May 2019 15:02:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 09:01:59 -0600
Message-Id: <5CE6B5E50200007800231C66@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 09:01:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <nmanthey@amazon.de>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-4-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1558424746-24059-4-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 3/3] common/grant_table:
 harden version dependent accesses
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDA5OjQ1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBH
dWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3Qg
Y29udHJvbGxlZAo+IGRhdGEgdG8gdGhlbS4gVGhpcyBkYXRhIGlzIHVzZWQgYXMgaW5kZXggZm9y
IG1lbW9yeSBsb2FkcyBhZnRlciBib3VuZAo+IGNoZWNrcyBoYXZlIGJlZW4gZG9uZS4gRGVwZW5k
aW5nIG9uIHRoZSBncmFudCB0YWJsZSB2ZXJzaW9uLCB0aGUKPiBzaXplIG9mIGVsZW1lbnRzIGlu
IGNvbnRhaW5lcnMgZGlmZmVyLiBBcyB0aGUgYmFzZSBkYXRhIHN0cnVjdHVyZSBpcwo+IGEgcGFn
ZSwgdGhlIG51bWJlciBvZiBlbGVtZW50cyBwZXIgcGFnZSBhbHNvIGRpZmZlcnMuIENvbnNlcXVl
bnRseSwKPiBib3VuZCBjaGVja3MgYXJlIHZlcnNpb24gZGVwZW5kZW50LCBzbyB0aGF0IHNwZWN1
bGF0aXZlIGV4ZWN1dGlvbiBjYW4KPiBoYXBwZW4gaW4gc2V2ZXJhbCBzdGFnZXMsIHRoZSBib3Vu
ZCBjaGVjayBhcyB3ZWxsIGFzIHRoZSB2ZXJzaW9uIGNoZWNrLgo+IAo+IFRoaXMgY29tbWl0IG1p
dGlnYXRlcyBjYXNlcyB3aGVyZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgY291bGQgaGFwcGVuCj4g
ZHVlIHRvIHRoZSB2ZXJzaW9uIGNvbXBhcmlzb24uIEluIGNhc2VzLCB3aGVyZSBubyBkaWZmZXJl
bnQgbWVtb3J5Cj4gbG9jYXRpb25zIGFyZSBhY2Nlc3NlZCBvbiB0aGUgY29kZSBwYXRoIHRoYXQg
Zm9sbG93IGFuIGlmIHN0YXRlbWVudCwKPiBubyBwcm90ZWN0aW9uIGlzIHJlcXVpcmVkLiBObyBk
aWZmZXJlbnQgbWVtb3J5IGxvY2F0aW9ucyBhcmUgYWNjZXNzZWQKPiBpbiB0aGUgZm9sbG93aW5n
IGZ1bmN0aW9ucyBhZnRlciBhIHZlcnNpb24gY2hlY2s6Cj4gCj4gICogZ250dGFiX3NldHVwX3Rh
YmxlOiBvbmx5IGNhbGN1bGF0ZWQgbnVtYmVyc2kgYXJlIHVzZWQsIGFuZCB0aGVuCj4gICAgICAg
ICBmdW5jdGlvbiBnbnR0YWJfZ3Jvd190YWJsZSBpcyBjYWxsZWQsIHdoaWNoIGlzIHZlcnNpb24g
cHJvdGVjdGVkCj4gCj4gICogZ250dGFiX3RyYW5zZmVyOiB0aGUgY2FzZSB0aGF0IGRlcGVuZHMg
b24gdGhlIHZlcnNpb24gY2hlY2sganVzdCBnZXRzCj4gICAgICAgICBpbnRvIGNvcHlpbmcgYSBw
YWdlIG9yIG5vdAoKV2VsbCwgdGhpcyBpcyBhIGxpdHRsZSBsYXgsIGJ1dCBJJ20gd2lsbGluZyB0
byBhY2NlcHQgaXQuIFRoZXJlIGNvdWxkLCBhZnRlcgphbGwsIHN0aWxsIGJlIHNwZWN1bGF0aW9u
IGludG8gYWxsb2NfZG9taGVhcF9wYWdlKCkuCgo+ICAqIGFjcXVpcmVfZ3JhbnRfZm9yX2NvcHk6
IHRoZSBub3QgZml4ZWQgY29tcGFyaXNvbiBpcyBvbiB0aGUgYWJvcnQgcGF0aAo+ICAgICAgICAg
YW5kIGRvZXMgbm90IGFjY2VzcyBvdGhlciBzdHJ1Y3R1cmVzLCBhbmQgb24gdGhlIGVsc2UgYnJh
bmNoIG9ubHkKPiAgICAgICAgIGFjY2Vzc2VzIHN0cnVjdHVyZXMgdGhhdCBhcmUgcHJvcGVybHkg
YWxsb2NhdGVkCgpBcyBzYWlkIGluIG15IHJlY2VudCByZXBseSB0byB2MTAgb2YgdGhlIG9yaWdp
bmFsIHNlcmllcywgaW4gcGFydGljdWxhcgpmb3IgZml4dXBfc3RhdHVzX2Zvcl9jb3B5X3Bpbigp
IHRoaXMgaXNuJ3QgaW1tZWRpYXRlbHkgb2J2aW91cy4gSW4Kbm8gY2FzZSBpcyAiZG9lcyBub3Qg
YWNjZXNzIG90aGVyIHN0cnVjdHVyZXMiIHRydWUsIHRob3VnaC4gSG93CmFib3V0IHNheWluZyAi
YWNjZXNzZXMgb25seSBzdHJ1Y3R1cmVzIHRoYXQgaGF2ZSBiZWVuIHZhbGlkYXRlZApiZWZvcmUi
IG9yIHNvbWUgc3VjaCBpbnN0ZWFkIChJIGRvbid0IHBhcnRpY3VsYXJseSBsaWtlICJ2YWxpZGF0
ZWQiCmhlcmUsIGJ1dCBJIGNhbid0IGN1cnJlbnRseSB0aGluayBvZiBhbnl0aGluZyBiZXR0ZXIp
PwoKPiAgKiBnbnR0YWJfc2V0X3ZlcnNpb246IGFsbCBhY2Nlc3NpYmxlIGRhdGEgaXMgYWxsb2Nh
dGVkIGZvciBib3RoIHZlcnNpb25zCgpUaGlzIGlzIG5vdCBlbm91Z2ggZm9yIG15IHRhc3RlOiBU
aGUgdmVyeSBmaXJzdCBsb29wIGlzIHNhZmUgb25seQpiZWNhdXNlIG5yX2dyYW50X2VudHJpZXMo
KSBpcy4gQW5kIHNwZWN1bGF0aW5nIGludG8KZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1l
cygpIGRvZXNuJ3QgbG9vayBzYWZlIGF0IGFsbCwgYXMKZ3QtPnN0YXR1c1tpXSBtYXkgYmUgTlVM
TC4KCj4gICogZ250dGFiX3JlbGVhc2VfbWFwcGluZ3M6IHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVk
IG9ubHkgZHVyaW5nIGRvbWFpbgo+ICAgICAgICBkZXN0cnVjdGlvbiBhbmQgY29udHJvbCBpcyBu
b3QgcmV0dXJuZWQgdG8gdGhlIGd1ZXN0Cj4gCj4gICogbWVtX3NoYXJpbmdfZ3JlZl90b19nZm46
IHNwZWN1bGF0aW9uIHdpbGwgYmUgc3RvcGVkIGJ5IHRoZSBzZWNvbmQgaWYKPiAgICAgICAgc3Rh
dGVtZW50LCBhcyB0aGF0IHBsYWNlcyBhIGJhcnJpZXIgb24gYW55IHBhdGggdG8gYmUgZXhlY3V0
ZWQuCj4gCj4gICogZ250dGFiX2dldF9zdGF0dXNfZnJhbWVfbWZuOiBubyB2ZXJzaW9uIGRlcGVu
ZGVudCBjaGVjaywgYmVjYXVzZSBhbGwKPiAgICAgICAgYWNjZXNzZXMsIGV4Y2VwdCB0aGUgZ3Qt
PnN0YXR1c1tpZHhdLCBkbyBub3QgcGVyZm9ybSBhY3R1YWwKPiAgICAgICAgb3V0LW9mLWJvdW5k
IGFjY2Vzc2VzLCBpbmNsdWRpbmcgdGhlIGdudHRhYl9ncm93X3RhYmxlIGZ1bmN0aW9uCj4gICAg
ICAgIGNhbGwuCgpOaXQ6IEkgdmVyeSBtdWNoIGhvcGUgbm8gY29kZSBhbnl3aGVyZSBwZXJmb3Jt
cyBfYWN0dWFsXyBvdXQgb2YKYm91bmQgYWNjZXNzZXMuIEknbSBzdXJlIHlvdSBtZWFuIHNwZWN1
bGF0aXZlIG9uZXMgaGVyZS4KCj4gICogZ250dGFiX2dldF9zaGFyZWRfZnJhbWU6IGJsb2NrX3Nw
ZWN1bGF0aW9uIGluCj4gICAgICAgIGdudHRhYl9nZXRfc3RhdHVzX2ZyYW1lX21mbiBibG9ja3Mg
YWNjZXNzZXMKClRoZSBmb3JtZXIgZG9lc24ndCBjYWxsIHRoZSBsYXR0ZXIsIGFuZCBhcyBwZXIg
bXkgcGF0Y2ggMiBjb21tZW50cwpnbnR0YWJfZ2V0X3NoYXJlZF9mcmFtZV9tZm4oKSBsb29rcyB0
byByZW1haW4gdW5wcm90ZWN0ZWQgYWZ0ZXIKcGF0Y2ggMi4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
