Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75900142619
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 09:48:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itShV-0006e0-Ik; Mon, 20 Jan 2020 08:46:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itShU-0006dv-2i
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 08:46:24 +0000
X-Inumbo-ID: 5443fe7c-3b61-11ea-b934-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5443fe7c-3b61-11ea-b934-12813bfff9fa;
 Mon, 20 Jan 2020 08:46:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 85C9DAB3D;
 Mon, 20 Jan 2020 08:46:19 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <cf29db3bde903a5788322381ef6eac1a6ed9b2b9.1576630344.git.elnikety@amazon.com>
 <729be010-5721-3eca-8a95-63987b61d897@suse.com>
 <e456ffdd-6c93-8f8c-9385-f169fa984dfb@amazon.com>
 <980abeb1-4c86-2618-9ab2-094af86d47ab@suse.com>
 <3666c417-a263-0333-d3e0-fa83d7341bf2@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65b93a9e-b828-4cdd-5ebc-09356420f4b5@suse.com>
Date: Mon, 20 Jan 2020 09:46:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3666c417-a263-0333-d3e0-fa83d7341bf2@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/microcode: Support builtin CPU
 microcode
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAyMTowNiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMjAuMTIuMTkg
MTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOS4xMi4yMDE5IDIzOjExLCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IE9uIDE4LjEyLjE5IDEzOjQyLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAxOC4xMi4yMDE5IDAyOjMyLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4+Pj4gLS0t
IC9kZXYvbnVsbAo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlL01ha2VmaWxlCj4+
Pj4+IEBAIC0wLDAgKzEsNDYgQEAKPj4+Pj4gKyMgQ29weXJpZ2h0IChDKSAyMDE5IEFtYXpvbi5j
b20sIEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuCj4+Pj4+ICsjIEF1dGhvcjogRXNsYW0gRWxuaWtl
dHkgPGVsbmlrZXR5QGFtYXpvbi5jb20+Cj4+Pj4+ICsjCj4+Pj4+ICsjIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Cj4+
Pj4+ICsjIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5Cj4+Pj4+ICsjIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247
IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4+Pj4+ICsjIChhdCB5b3VyIG9w
dGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4+Pj4+ICsjCj4+Pj4+ICsjIFRoaXMgcHJvZ3JhbSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+Pj4+PiAr
IyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJy
YW50eSBvZgo+Pj4+PiArIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlCj4+Pj4+ICsjIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuCj4+Pj4+ICsKPj4+Pj4gKyMgUmVtb3ZlIHF1b3RlcyBhbmQgZXhj
ZXNzIHNwYWNlcyBmcm9tIGNvbmZpZ3VyYXRpb24gc3RyaW5ncwo+Pj4+PiArVUNPREVfRElSPSQo
c3RyaXAgJChzdWJzdCAkXCIsLCQoQ09ORklHX0JVSUxUSU5fVUNPREVfRElSKSkpCj4+Pj4+ICtV
Q09ERV9BTUQ9JChzdHJpcCAkKHN1YnN0ICRcIiwsJChDT05GSUdfQlVJTFRJTl9VQ09ERV9BTUQp
KSkKPj4+Pj4gK1VDT0RFX0lOVEVMPSQoc3RyaXAgJChzdWJzdCAkXCIsLCQoQ09ORklHX0JVSUxU
SU5fVUNPREVfSU5URUwpKSkKPj4+Pj4gKwo+Pj4+PiArIyBBTUQgYW5kIElOVEVMIG1pY3JvY29k
ZSBibG9icy4gVXNlICd3aWxkY2FyZCcgdG8gZmlsdGVyIGZvciBleGlzdGluZyBibG9icy4KPj4+
Pj4gK2FtZC1ibG9icyA6PSAkKHdpbGRjYXJkICQoYWRkcHJlZml4ICQoVUNPREVfRElSKSwkKFVD
T0RFX0FNRCkpKQo+Pj4+PiAraW50ZWwtYmxvYnMgOj0gJCh3aWxkY2FyZCAkKGFkZHByZWZpeCAk
KFVDT0RFX0RJUiksJChVQ09ERV9JTlRFTCkpKQo+Pj4+PiArCj4+Pj4+ICtpZm5lcSAoJChhbWQt
YmxvYnMpLCkKPj4+Pj4gK29iai15ICs9IHVjb2RlX2FtZC5vCj4+Pj4+ICtlbmRpZgo+Pj4+PiAr
Cj4+Pj4+ICtpZm5lcSAoJChpbnRlbC1ibG9icyksKQo+Pj4+PiArb2JqLXkgKz0gdWNvZGVfaW50
ZWwubwo+Pj4+PiArZW5kaWYKPj4+Pj4gKwo+Pj4+PiAraWZlcSAoJChhbWQtYmxvYnMpJChpbnRl
bC1ibG9icyksKQo+Pj4+PiArb2JqLXkgKz0gdWNvZGVfZHVtbXkubwo+Pj4+PiArZW5kaWYKPj4+
Pj4gKwo+Pj4+PiArdWNvZGVfYW1kLm86IE1ha2VmaWxlICQoYW1kLWJsb2JzKQo+Pj4+PiArCWNh
dCAkKGFtZC1ibG9icykgPiAkQC5iaW4KPj4+Pj4gKwkkKE9CSkNPUFkpIC1JIGJpbmFyeSAtTyBl
bGY2NC14ODYtNjQgLUIgaTM4Njp4ODYtNjQgLS1yZW5hbWUtc2VjdGlvbiAuZGF0YT0uYnVpbHRp
bl9hbWRfdWNvZGUsYWxsb2MsbG9hZCxyZWFkb25seSxkYXRhLGNvbnRlbnRzICRALmJpbiAkQAo+
Pj4+PiArCXJtIC1mICRALmJpbgo+Pj4+PiArCj4+Pj4+ICt1Y29kZV9pbnRlbC5vOiBNYWtlZmls
ZSAkKGludGVsLWJsb2JzKQo+Pj4+PiArCWNhdCAkKGludGVsLWJsb2JzKSA+ICRALmJpbgo+Pj4+
PiArCSQoT0JKQ09QWSkgLUkgYmluYXJ5IC1PIGVsZjY0LXg4Ni02NCAtQiBpMzg2Ong4Ni02NCAt
LXJlbmFtZS1zZWN0aW9uIC5kYXRhPS5idWlsdGluX2ludGVsX3Vjb2RlLGFsbG9jLGxvYWQscmVh
ZG9ubHksZGF0YSxjb250ZW50cyAkQC5iaW4gJEAKPj4+Pj4gKwlybSAtZiAkQC5iaW4KPj4+Pgo+
Pj4+IFRoaXMgY2FuIGJlIGhhZCB3aXRoIGEgcGF0dGVybiBydWxlICh3aXRoIHRoZSB2ZW5kb3Ig
YmVpbmcgdGhlIHN0ZW0pCj4+Pj4gYW5kIGhlbmNlIHdpdGhvdXQgZHVwbGljYXRpb24sIEkgdGhp
bmsuCj4+Pj4KPj4+PiBBbHNvIC0gaXMgc2ltcGx5IGNvbmNhdGVuYXRpbmcgdGhlIGJsb2JzIHJl
bGlhYmxlIGVub3VnaD8gVGhlcmUncyBubwo+Pj4+IGJ1aWxkIHRpbWUgZGlhZ25vc3RpYyB0aGF0
IHRoZSByZXN1bHQgd291bGQgYWN0dWFsbHkgYmUgdW5kZXJzdG9vZAo+Pj4+IGF0IHJ1bnRpbWUu
Cj4+Pj4KPj4+Cj4+PiBDb25jYXRlbmF0aW9uIGlzIHJlbGlhYmxlIChhcyBsb25nIGFzIHRoZSBp
bmRpdmlkdWFsIG1pY3JvY29kZSBibG9icyBhcmUKPj4+IG5vdCBtYWxmb3JtZWQsIGFuZCBpbiB0
aGF0IGNhc2UgdGhlIGJ1aWx0aW4gaXMgbm90IG1ha2luZyBtYXR0ZXJzIHdvcnNlCj4+PiBjb21w
YXJlZCB0byBwcmVzZW50aW5nIHRoZSBtYWxmb3JtZWQgdXBkYXRlIHZpYSA8aW50ZWdlcj4gfCBz
Y2FuKS4KPj4KPj4gQSBtYWxmb3JtZWQgdXBkYXRlIGZvdW5kIHRoZSBvdGhlciB3YXkgaXMgYSBi
dWcgaW4gdGhlIHRvb2xzCj4+IGNvbnN0cnVjdGluZyB0aGUgcmVzcGVjdGl2ZSBpbWFnZXMuIEEg
bWFsZm9ybWVkIGJ1aWx0LWluCj4+IHVwZGF0ZSBpcyBhIGJ1ZyBpbiB0aGUgWGVuIGJ1aWxkIHN5
c3RlbS4gVGhlIHB1dCB0aGUgcXVlc3Rpb24KPj4gZGlmZmVyZW50bHk6IElzIGl0IHNwZWNpZmll
ZCBzb21ld2hlcmUgdGhhdCB0aGUgYmxvYnMgYWxsIGhhdmUKPj4gdG8gaGF2ZSBjZXJ0YWluIHBy
b3BlcnRpZXMsIHdoaWNoIHRoZSBzdHJhaWdodCBjb25jYXRlbmF0aW9uCj4+IHJlbGllcyB1cG9u
Pwo+Pgo+IAo+IFJlZmVyIHRvICggaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRh
dGlvbi94ODYvbWljcm9jb2RlLnR4dCApLiAKPiBBdXRoZW50aWNBTUQuYmluIGFuZCBHZW51aW5l
SW50ZWwuYmluIGFyZSBib3RoIGNvbmNhdGVuYXRpb25zIG9mIAo+IGluZGl2aWR1YWwgbWljcm9j
b2RlIGJsb2JzLgoKV2VsbCwgeWVzLCBhbmQgZnJvbSBwcmFjdGljYWwgb2JzZXJ2YXRpb25zIHRo
aXMgaXMgZ29vZCBlbm91Z2guIEJ1dApvYnNlcnZlIGUuZy4gaG93IHRoYXQgcGFyYWdyYXBoIHN0
YXJ0cyB3aXRoICJIZXJlJ3MgYSBjcnVkZSBleGFtcGxlCi4uLiIuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
