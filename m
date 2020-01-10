Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E231371F5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 16:59:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwdy-00076V-Ht; Fri, 10 Jan 2020 15:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipwdw-00076Q-Vf
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 15:56:13 +0000
X-Inumbo-ID: b9122f2e-33c1-11ea-bf4d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9122f2e-33c1-11ea-bf4d-12813bfff9fa;
 Fri, 10 Jan 2020 15:56:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DDA5B15D;
 Fri, 10 Jan 2020 15:56:10 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
 <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01239ba8-9084-faff-c9f7-f59970aefd82@suse.com>
Date: Fri, 10 Jan 2020 16:56:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDEuMjAyMCAxNjoyOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzEwLzIwIDEx
OjAyIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxMC8wMS8yMDIwIDEwOjM3LCBTZXJn
ZXkgRHlhc2xpIHdyb3RlOgo+Pj4gSGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQg
Y2FuIGhlbHAgaWRlbnRpZnkgdGhlIHJ1bm5pbmcgWGVuCj4+PiBiaW5hcnkgdmVyc2lvbjogWEVO
VkVSX2V4dHJhdmVyc2lvbiwgWEVOVkVSX2NvbXBpbGVfaW5mbywgWEVOVkVSX2NoYW5nZXNldC4K
Pj4+IEFkZCBleHBsaWNpdCBjYXNlcyBmb3IgWEVOVkVSX2NvbW1hbmRsaW5lIGFuZCBYRU5WRVJf
YnVpbGRfaWQgYXMgd2VsbC4KPj4+Cj4+PiBJbnRyb2R1Y2UgeHNtX2ZpbHRlcl9kZW5pZWQoKSB0
byBodm1sb2FkZXIgdG8gcmVtb3ZlICI8ZGVuaWVkPiIgc3RyaW5nCj4+PiBmcm9tIGd1ZXN0J3Mg
RE1JIHRhYmxlcyB0aGF0IG90aGVyd2lzZSB3b3VsZCBiZSBzaG93biBpbiB0b29scyBsaWtlCj4+
PiBkbWlkZWNvZGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiB2MSAtLT4gdjI6Cj4+PiAtIEFkZGVkIHhz
bV9maWx0ZXJfZGVuaWVkKCkgdG8gaHZtbG9hZGVyIGluc3RlYWQgb2YgbW9kaWZ5aW5nIHhlbl9k
ZW55KCkKPj4+IC0gTWFkZSBiZWhhdmlvdXIgdGhlIHNhbWUgZm9yIGJvdGggUmVsZWFzZSBhbmQg
RGVidWcgYnVpbGRzCj4+PiAtIFhFTlZFUl9jYXBhYmlsaXRpZXMgaXMgbm8gbG9uZ2VyIGhpZGVk
Cj4+Pgo+Pj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+
PiBDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4gQ0M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+Pj4gQ0M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPgo+Pj4gQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KPj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+
PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4+IENDOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVn
cmFAdHljaG8ubnNhLmdvdj4KPj4KPj4gSSByZWFsaXNlIHRoZXJlIGFyZSBhcmd1bWVudHMgb3Zl
ciBob3cgdG8gZml4IHRoaXMsIGJ1dCB3ZSAodGhlIFhlbgo+PiBjb21tdW5pdHkpIGhhdmUgYWxy
ZWFkeSBmKmNrZWQgdXAgb25jZSBoZXJlLCBhbmQgdGhpcyBpcyBkb2luZyBzbyBhCj4+IHNlY29u
ZCB0aW1lLgo+Pgo+PiBOYWNrLgo+Pgo+PiBGaXhpbmcgaXQgYW55d2hlcmUgb3RoZXIgdGhhbiBY
ZW4gaXMgc2ltcGx5IG5vdCBhcHByb3ByaWF0ZS4KCihyZXBseWluZyBoZXJlLCBiZWNhdXNlIHRo
ZSBvcmlnaW5hbCBtYWlsIGRvZXNuJ3Qgc2VlbSB0byBoYXZlCm1hZGUgaXQgaW50byBteSBpbmJv
eCkKCkkndmUgc2FpZCBzbyB0byBTZXJnZXkgYWxyZWFkeSBvbiB2MTogVGhlICJmaXgiIHlvdSB3
YW50IG5lZWRzIHRvCmJlIGF0IG9yIGNsb3NlciB0byB0aGUgcHJlc2VudGF0aW9uIGxheWVyLiBG
cm9tIFhlbidzIHBlcnNwZWN0aXZlCnRoZSByZXF1ZXN0IGZvciBpbmZvcm1hdGlvbiB3YXMgX2lu
ZGVlZF8gZGVuaWVkLgoKPj4gVGhlIHJlYXNvbiBmb3IgdGhpcyAod2hpY2ggb3VnaHQgdG8gYmUg
b2J2aW91cywgYnV0IEkgZ3Vlc3Mgb25seSB0bwo+PiB0aG9zZSB3aG8gYWN0dWFsbHkgZG8gY3Vz
dG9tZXIgc3VwcG9ydCkgaXMgYmFzaWMgaHVtYW4gcGh5c2lvbG9neS7CoAo+PiAiZGVuaWVkIiBt
ZWFucyBzb21ldGhpbmcgaGFzIGdvbmUgd3JvbmcuwqAgSXQgc2NhcmVzIHBlb3BsZSwgYW5kIGNh
dXNlcwo+PiB0aGVtIHRvIHNlZWsgaGVscCB0byBjaGFuZ2UgZml4IHdoYXRldmVyIGlzIGJyb2tl
bi4KPiAKPiBUaGlzIHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIGFyZ3VtZW50IHRoYXQgIjxkZW5p
ZWQ+IiBjYXVzZXMgaXNzdWVzLgo+IEJ1dCB0aGF0IGRvZXNuJ3QgY2hhbmdlIHRoZSBmYWN0IHRo
YXQgIiIgYWxzbyBjYXVzZXMgaXNzdWVzLgo+IAo+IFdoYXQgYWJvdXQgY2hhbmdpbmcgdGhlIHN0
cmluZyB0byAiPGJ1aWxkLWlkIGhpZGRlbj4iIG9yIHNvbWV0aGluZyBsaWtlCj4gdGhhdD8gIFRo
YXQgbWFrZXMgaXQgbW9yZSBjbGVhciB3aGF0IHdvdWxkIGhhdmUgYmVlbiBpbiB0aGF0IHBsYWNl
LCBhbmQKPiAiaGlkZGVuIiBpcyBhIGxvdCBsZXNzIHNjYXJ5IHRoYW4gImRlbmllZCIuCgpJIGNv
dWxkIGxpdmUgd2l0aCB0aGlzLiBCdXQgKGp1ZGdpbmcgZnJvbSB0aGUgcGljdHVyZSB0aGF0IHdh
cwpwcm92aWRlZCBlYXJsaWVyIG9uKSBpdCB3b3VsZCBzdGlsbCByZXF1aXJlIGZpbHRlcmluZyBh
dCBvciBjbG9zZQp0byB0aGUgcHJlc2VudGF0aW9uIGxheWVyLCBhbmQgYnkgY2hhbmdpbmcgdGhl
IHByaW9yIDxkZW5pZWQ+IHRvCmRpZmZlcmVudCBhbmQgdmFyeWluZyBzdHJpbmdzIG1heSBtYWtl
IHRoYXQgam9iIGhhcmRlciAoYWxiZWl0CnBlcmhhcHMgdGhleSBjb3VsZCBsb29rIGZvciBhbnkg
PC4uLj4pLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
