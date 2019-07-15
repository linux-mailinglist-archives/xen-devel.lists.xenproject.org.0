Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD768844
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 13:39:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmzHN-0006za-MN; Mon, 15 Jul 2019 11:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q8SM=VM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hmzHL-0006zV-RT
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 11:36:23 +0000
X-Inumbo-ID: c42c58a8-a6f4-11e9-94f6-83dd8af8737e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c42c58a8-a6f4-11e9-94f6-83dd8af8737e;
 Mon, 15 Jul 2019 11:36:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 354892B;
 Mon, 15 Jul 2019 04:36:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF273F71F;
 Mon, 15 Jul 2019 04:36:19 -0700 (PDT)
To: Hunyue Yau z <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <3431405.GtiBnG5Jy9@acer0> <b49189f5-34a3-5846-41b3-a32d54868566@arm.com>
 <2537214.YZPW3Q6nNT@acer0>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5ac6a07f-d3de-5063-c5bb-edab714df248@arm.com>
Date: Mon, 15 Jul 2019 12:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <2537214.YZPW3Q6nNT@acer0>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Iain Hunter <drhunter95@gmail.com>, Denis Obrezkov <denisobrezkov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMi8wNy8yMDE5IDE5OjMyLCBIdW55dWUgWWF1IHogd3JvdGU6Cj4gT24gRnJpZGF5
LCBKdWx5IDEyLCAyMDE5IDE2OjEzOjMyIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+
IE9uIDcvMTEvMTkgNzoyOSBQTSwgSHVueXVlIFlhdSB3cm90ZToKPj4+IFtUaGlzIG1haWwgaW5j
b3Jwb3JhdGVzIGNvbW1lbnRzIHJhaXNlZCBvbiBJUkMuIEkgaGF2ZSBtYWRlIHNvbWUgb2YgdGhp
cwo+Pj4gbUhpLG9yZSB2ZXJib3NlIHRvIHByb3ZpZGUgY29udGV4dCB0byBwZW9wbGUgdGhhdCBo
YXZlbid0IHNlZW4gdGhlIElSQwo+Pj4gY29tbWVudHMuXQo+PiBUaGFuayB5b3UgZm9yIHRoZSBz
dW1tYXJ5IQo+Pgo+Pj4gVGhpcyB3aWxsIGJlIGEgYnVuY2ggb2YgZmFjdHMgb24gdGhlIGFtNS4g
U29tZW9uZSBlbHNlIHdpbGwgaGF2ZSByZWxhdGUgaXQKPj4+IGJhY2sgdG8gWGVuLgo+Pj4KPj4+
IDEgLSBUaGUgV1VHZW4gaXMgYSBoYXJkd2FyZSBibG9jayBvbiB0aGUgTVBVIGJsb2NrIHRoYXQg
Y2FuIHR1cm4KPj4+IGludGVycnVwdHMKPj4+IGludG8gd2FrZSB1cCBldmVudHMgaWYgdGhlIE1Q
VSBpcyBpbiBjZXJ0YWluIGRlZXBlciBzbGVlcCBzdGF0ZXMuIFRoaXMKPj4+IGFwcGxpZXMgb25s
eSB0byBjZXJ0YWluIGludGVycnVwdHMuIFdlIGNhbiBjb25maXJtIHRoaXMgYnkgbG9va2luZyBh
dCB0aGUKPj4+IERUJ3MgcmVnaXN0ZXIgYWRkcmVzcy4gUGVyIHRoZSBUUk0sIHRoZXkgYXJlIHJl
Z2lzdGVycyBmb3IgdGhlIE1QVSdzIFBSQ00KPj4+IChQb3dlci9SZXNldC9DbG9jayBNYW5hZ2Vt
ZW50KS4gSW4gc2hvcnQsIHRoaXMgYmxvY2sgbWFrZXMgaW50ZXJydXB0cyBhCj4+PiBwb3NzaWJs
ZSB3YWtlIHVwIHNvdXJjZS4KPj4+Cj4+PiAyIC0gRWFybGllciBrZXJuZWxzIGRpZCBub3QgZXhw
b3NlIHRoYXQgSFcgYmxvY2suIFNlZSB0aGlzIHBhdGNoIHRoYXQKPj4+IGludHJvZHVjZWQgdGhl
IFdVR2VuIC0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvNzEz
NmQ0NTdmMzY1ZWNjOTNkZGZmY2RkNDJhYjQ5YTg0Cj4+PiA3M2YyNjBiIEkgc3VzcGVjdCBsb29r
aW5nIGF0IHRoZSBiZWZvcmUgcGFydCBvZiB0aGUgcGF0Y2ggc2hvdWxkIHByb3ZpZGUKPj4+IGNs
dWVzIG9uIGhvdyB0byBoYW5kbGUgdGhlIFdVR2VuLgo+Pj4KPj4+Cj4+PiAzIC0gVGhpcyBtYXkg
YmUgcmVkdW5kYW50IGJ1dCBtb3JlIGRlZmluaXRpb25zIChpbiB0aGUgaHVtYW4gc2Vuc2UpIGhl
cmU6Cj4+PiBodHRwczovL3d3dy5tam13aXJlZC5uZXQva2VybmVsL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cAo+Pj4gdC1jb250cm9sbGVyL3RpLG9tYXA0LXd1Z2Vu
LW1wdQo+Pj4KPj4+IDQgLSBGb3IgdGhlIFVBUlQgY2FzZSwgSSBzdXNwZWN0IHRoZSBmbG93IERl
bm5pcyBwb2ludGVkIG91dCBpcyBhYm91dAo+Pj4gcmlnaHQuIEhvd2V2ZXIsIHRoYXQgbWF5IGJl
IGRpZmZlcmVudCBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdCBzb3VyY2UuCj4+Pgo+Pj4gVW5r
bm93bnMgZnJvbSBteSBwb2ludCBvZiB2aWV3IC0KPj4+Cj4+PiBhIC0gRG9lcyBYZW4gdmlydHVh
bGl6ZSBwb3dlciBtYW5hZ2VtZW50PyBJZiBzbywgdGhpcyBtYXkgaGF2ZSBoYXZlIGFuCj4+PiBp
bXBhY3QuIEkgd291bGQgbm90IHJlY29tbWVuZCBhZGRpbmcgUE0gdmlydHVhbGl6YXRpb24gaW4g
R1NvQy4gSXQgaXMKPj4+IHR1Z2dpbmcgb24gYSB2ZXJ5IGxvbmcgc3RyaW5nLgo+Pgo+PiBYZW4g
ZG9lcyBub3QgdmlydHVhbGl6ZSBwb3dlciBtYW5hZ2VtZW50IGF0IHRoZSBtb21lbnQuIEkgYWdy
ZWUgdGhhdAo+PiB0aGlzIGlzIHRvbyBiaWcgZm9yIHRoZSBzY29wZSBvZiB0aGUgR1NvQy4KPj4K
Pj4+IGIgLSBJZiBYZW4gZG9lcyBub3QgdmlydHVhbGl6ZSB0aGF0LCBzb21lb25lIG5lZWRzIHRv
IGRlY2lkZSBob3cgbXVjaCB0bwo+Pj4gbGVhdmUgdG8gdGhlIGd1ZXNzLgo+Pj4KPj4+IGMgLSBJ
IHdvbmRlciBpZiB3ZSBjYW4gZG8gYSBoYWxmIHdheSBoYWNrIHdoZXJlIHRoZSBrZXJuZWwgc2V0
cyB1cCB0aGUgUE0KPj4+IGJ1dCBYZW4gaG9va3MgdG8gZ2V0IHRoZSBpbnRlcnJ1cHQuIFRoZSBI
VyB3aWxsIGRvIGl0cyBQTSB0aGluZyBhbmQgWGVuCj4+PiBjYW4gcHJvY2VzcyB0aGUgaW50ZXJy
dXB0Lgo+Pgo+PiBIbW1tLCB0aGUgcXVlc3Rpb24gaGVyZSBpcyB3aGV0aGVyIHRoZSBVQVJUIHdv
dWxkIGJlIHVzdWFibGUgYmVmb3JlIERvbTAKPj4gaXMgc2V0dGluZyB1cCB0aGUgUE0/IElmIG5v
dCwgdGhlbiwgd2Ugd291bGQgbmVlZCB0byBkZWFsIHdpdGggaXQgaW4gWGVuLgo+Pgo+Pj4gR3Vl
c3Nlcy9wb3NzaWJsZSBoYWNrcyAtCj4+PiAtIEZvciB0aGUgaW50ZXJydXB0cyB3ZSBjYXJlIGFi
b3V0LCB0aGUgY3Jvc3MgYmFyIGNhbiByb3V0ZSB0aGluZ3MgdG8gdGhlCj4+PiBNUFUgdW5jb25k
aXRpb25hbGx5LiBUaGlzIHdvdWxkIGJyZWFrIHRoZSBvdGhlciBIVyBibG9ja3MgYnV0IG1vc3Qg
b2YKPj4+IHRoZW0gYXJlbid0IG5lZWRlZCBmb3IgYm9vdC4KPj4KPj4gU29ycnkgZm9yIG15IGln
bm9yYW5jZSwgd2hpY2ggSFcgYmxvY2tzIGFyZSB5b3UgdGFsa2luZyBhYm91dD8KPiAKPiBUaGUg
SFcgYmxvY2tzIEkgYW0gcmVmZXJyaW5nIHRvIGFyZSBzdHVmZiBsaWtlIEVWRSwgSVBVLCBhbmQg
RFNQLiBJbml0aWFsbHksIHdlCj4gY2FuIGV2ZW4gaWdub3JlIHRoZSBQUlVTUy4gVGhpcyBzaG91
bGQgbGVhdmUganVzdCBzZW5kaW5nIGludGVycnVwdHMgdG8gdGhlCj4gTVBVLiBBcyBJIHVuZGVy
c3RhbmQgaXQsIHRoZXJlIGlzIG5vIGN1cnJlbnQgc3VwcG9ydCBmb3IgdGhvc2UgcmlnaHQgbm93
Cj4gYW55d2F5cy4gSSB0aGluayBFVkUvSVBVL0RTUCByZXF1aXJlIGEgd29ya2luZyBjbWVtIGRy
aXZlciB3aGljaCBpcyBub3QgZnVsbHkKPiB1cHN0cmVhbWVkLiBCQkFJIGRvZXMgdXNlIHRoZW0g
YnV0IHRoYXQgcmVxdWlyZXMgYSBzcGVjaWZpYyBrZXJuZWwuCj4gCj4gUFJVU1Mgd291bGQgYmUg
bmljZSAoYWthIHRoZSBQUlUgc3R1ZmYpIGV2ZW50dWFsbHkgYXMgdGhlIGJpdHMgYXJlIHVwc3Ry
ZWFtIGJ1dAo+IG5vdCBjcml0aWNhbCBmb3Igbm93LgoKVGhhbmsgeW91IGZvciB0aGUgY2xhcmlm
aWNhdGlvbi4gTXkga25vd2xlZGdlIG9uIHRoZSBib2FyZCBpcyBsaW1pdGVkLCBzbyBJIHdpbGwg
CnRha2UgeW91cnMgY29tbWVudHMgYXMgZ3JhbnRlZCA6KS4KCkNoZWVycywKCj4gCj4+Cj4+IENo
ZWVycywKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
