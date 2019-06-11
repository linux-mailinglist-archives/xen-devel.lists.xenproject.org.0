Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA53CC61
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:02:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagM3-0000RP-HL; Tue, 11 Jun 2019 12:58:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hagM2-0000RI-7x
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:58:22 +0000
X-Inumbo-ID: 971a9973-8c48-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 971a9973-8c48-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:58:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 06:58:20 -0600
Message-Id: <5CFFA567020000780023709D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 06:58:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-9-git-send-email-chao.gao@intel.com>
 <5CF7CD2702000078002358F4@prv1-mh.provo.novell.com>
 <20190611123615.GA22930@gao-cwp>
In-Reply-To: <20190611123615.GA22930@gao-cwp>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 08/10] x86/microcode: Synchronize late
 microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de,
 Borislav Petkov <bp@suse.de>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDE0OjM2LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBXZWQsIEp1biAwNSwgMjAxOSBhdCAwODowOTo0M0FNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+Pk9uIHRoZSB3aG9sZSwgdGFraW5nIGEgMjU2LXRocmVhZCBzeXN0ZW0gYXMgZXhhbXBsZSwg
eW91Cj4+YWxsb3cgdGhlIHdob2xlIHByb2Nlc3MgdG8gdGFrZSBvdmVyIDQgbWluIHdpdGhvdXQg
Y2FsbGluZwo+PnBhbmljKCkuCj4+TGVhdmluZyBhc2lkZSBndWVzdHMsIEkgZG9uJ3QgdGhpbmsg
WGVuIGl0c2VsZiB3b3VsZAo+PnN1cnZpdmUgdGhpcyBpbiBhbGwgY2FzZXMuIFdlJ3ZlIGZvdW5k
IHRoZSBuZWVkIHRvIHByb2Nlc3MKPj5zb2Z0aXJxcyB3aXRoIGZhciBzbWFsbGVyIGRlbGF5cywg
aW4gcGFydGljdWxhciBmcm9tIGtleSBoYW5kbGVycwo+PnByb2R1Y2luZyBsb3RzIG9mIG91dHB1
dC4gQXQgdGhlIHZlcnkgbGVhc3QgdGhlcmUgc2hvdWxkIGJlIGEKPj5ib2xkIHdhcm5pbmcgbG9n
Z2VkIGlmIHRoZSBzeXN0ZW0gaGFkIGJlZW4gaW4gc3RvcC1tYWNoaW5lCj4+c3RhdGUgZm9yLCBz
YXksIGxvbmdlciB0aGFuIDEwMG1zICh2YWx1ZSBzdWJqZWN0IHRvIGRpc2N1c3Npb24pLgo+IAo+
IEluIHRoZW9yeSwgaWYgeW91IG1lYW4gMjU2IGNvcmVzLCB5ZXMuIERvIHlvdSB0aGluayBhIGNv
bmZpZ3VyYWJsZSBhbmQKPiBydW4tdGltZSBjaGFuZ2VhYmxlIHVwcGVyIGJvdW5kIGZvciB0aGUg
d2hvbGUgcHJvY2VzcyBjYW4gYWRkcmVzcyB5b3VyCj4gY29uY2Vybj8gVGhlIGRlZmF1bHQgdmFs
dWUgZm9yIHRoaXMgdXBwZXIgYm91bmQgY2FuIGJlIHNldCB0byBhIGxhcmdlCj4gdmFsdWUgKGZv
ciBleGFtcGxlLCAxcyAqIHRoZSBudW1iZXIgb2Ygb25saW5lIGNvcmUpIGFuZCB0aGUgYWRtaW4g
Y2FuCj4gYWp1c3QvbG93ZXIgdGhlIHVwcGVyIGJvdW5kIGFjY29yZGluZyB0byB0aGUgd2F5IChz
ZXJpYWwgb3IgcGFyYWxsZWwpIHRvCj4gcGVyZm9ybSB0aGUgdXBkYXRlIGFuZCBvdGhlciByZXF1
aXJlbWVudHMuIE9uY2UgdGhlIHVwcGVyIGJvdW5kIGlzCj4gcmVhY2hlZCwgd2Ugd291bGQgY2Fs
bCBwYW5pYygpLgoKV2VsbCwgYSBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIGNvbnRyb2wgdGhlIHRv
dGFsIHRpbWUgdW50aWwKY2FsbGluZyBwYW5pYygpIG1heSBoZWxwLCBidXQgYXMgeW91J3ZlIHNh
aWQgaW4gdGhlIHBhc3Q6IElmIHdlCnBhbmljIGFueXdheSwgaXQgZG9lc24ndCBtYXR0ZXIgbXVj
aCB3aGF0IHRoZSB0aW1lb3V0IGlzLiBNeQpwb2ludCB3YXMgcmF0aGVyIHRvIG1ha2UgZXhwbGlj
aXQgdGhhdCB0aGUgcHJvY2VzcyBtYXkgaGF2ZQpjb21wbGV0ZWQgYWZ0ZXIgYSAodG9vKSBsb25n
IHRpbWUuIFJlbWVtYmVyIHlvdSBtZWFuIHRoaXMKbGF0ZSBsb2FkaW5nIHRvIGhhcHBlbiB3aXRo
IGd1ZXN0cyBydW5uaW5nLiBXZSBzaG91bGQgYXZvaWQKbWFraW5nIHRoZSBzeXN0ZW0gdW5zdGFi
bGUgYXMgbXVjaCBhcyB3ZSBjYW4uIFRoaXMgaW5jbHVkZXMKdGhpcyB0YWtpbmcgbG9uZyBhbmQg
dGhlIGNvbXBsZXRpbmcgc3VjY2Vzc2Z1bGx5IF9hcyB3ZWxsIGFzXwpjYWxsaW5nIHBhbmljKCku
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
