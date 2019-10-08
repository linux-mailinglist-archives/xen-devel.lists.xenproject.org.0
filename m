Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3685CF295
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 08:16:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHilR-0000HX-E5; Tue, 08 Oct 2019 06:14:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdvn=YB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iHilP-0000HS-NG
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 06:14:27 +0000
X-Inumbo-ID: e0910436-e992-11e9-97c4-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0910436-e992-11e9-97c4-12813bfff9fa;
 Tue, 08 Oct 2019 06:14:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 23:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="206578564"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2019 23:14:17 -0700
Date: Tue, 8 Oct 2019 14:18:19 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008061817.GA25749@gao-cwp>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <20191004235855.GA10634@gao-cwp>
 <e31ebe3d-3aa8-dafd-1104-54fcaf1a4896@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e31ebe3d-3aa8-dafd-1104-54fcaf1a4896@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDk6Mzg6NDhBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwNS4xMC4yMDE5IDAxOjU4LCBDaGFvIEdhbyB3cm90ZToKPj4gT24gV2VkLCBPY3Qg
MDIsIDIwMTkgYXQgMTI6NDk6MzVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4g
VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaG9zdF9tYXNrYWxsIG1ha2VzIGl0IHN0aWNr
eSBhY3Jvc3MKPj4+IGFzc2lnbiBhbmQgZGVhc3NpZ24gY2FsbHMsIHdoaWNoIG1lYW5zIHRoYXQg
b25jZSBhIGd1ZXN0IGZvcmNlcyBYZW4gdG8KPj4+IHNldCBob3N0X21hc2thbGwgdGhlIG1hc2th
bGwgYml0IGlzIG5vdCBnb2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPj4+IGNhbGwgdG8gUEhZ
U0RFVk9QX3ByZXBhcmVfbXNpeCBpcyBwZXJmb3JtZWQuIFN1Y2ggY2FsbCBob3dldmVyCj4+PiBz
aG91bGRuJ3QgYmUgcGFydCBvZiB0aGUgbm9ybWFsIGZsb3cgd2hlbiBkb2luZyBQQ0kgcGFzc3Ro
cm91Z2gsIGFuZAo+Pj4gaGVuY2UgdGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFz
c2lnbmluZyBpbiBvcmRlciB0byBwcmV2ZW50Cj4+PiBob3N0X21hc2thbGwgYmVpbmcgY2Fycmll
ZCBvdmVyIGZyb20gcHJldmlvdXMgYXNzaWduYXRpb25zLgo+Pj4KPj4+IE5vdGUgdGhhdCBvdGhl
ciBtYXNrIGZpZWxkcywgbGlrZSBndWVzdF9tYXNrZWQgb3IgdGhlIGVudHJ5IG1hc2tiaXQKPj4+
IGFyZSBhbHJlYWR5IHJlc2V0IHdoZW4gdGhlIG1zaXggY2FwYWJpbGl0eSBpcyBpbml0aWFsaXpl
ZC4gQWxzbyBub3RlCj4+PiB0aGF0IGRvaW5nIHRoZSByZXNldCBvZiBob3N0X21hc2thbGwgdGhl
cmUgd291bGQgYWxsb3cgdGhlIGd1ZXN0IHRvCj4+PiByZXNldCBzdWNoIGZpZWxkIGJ5IGVuYWJs
aW5nIGFuZCBkaXNhYmxpbmcgTVNJWCwgd2hpY2ggaXMgbm90Cj4+PiBpbnRlbmRlZC4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Pj4+IC0tLQo+Pj4gQ2M6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+PiBDYzogIlNw
YXNzb3YsIFN0YW5pc2xhdiIgPHN0YW5zcGFzQGFtYXpvbi5kZT4KPj4+IENjOiBQYXNpIEvDpHJr
a8OkaW5lbiA8cGFzaWtAaWtpLmZpPgo+Pj4gLS0tCj4+PiBDaGFvLCBTdGFuaXNsYXYsIGNhbiB5
b3UgcGxlYXNlIGNoZWNrIGlmIHRoaXMgcGF0Y2ggZml4ZXMgeW91cgo+Pj4gaXNzdWVzPwo+PiAK
Pj4gSSBhbSBnbGFkIHRvLiBGb3IgeW91ciB0ZXN0aW5nLCB5b3UgY2FuIGp1c3Qga2lsbCBxZW11
IGFuZCBkZXN0cm95IHRoZQo+PiBndWVzdC4gVGhlbiBtYXNrYWxsIGJpdCBvZiBhIHBhc3MtdGhy
dSBkZXZpY2Ugd2lsbCBiZSBzZXQuIEFuZCBpbiB0aGlzCj4+IGNhc2UsIHRyeSB0byByZWNyZWF0
ZSB0aGUgZ3Vlc3QgYW5kIGNoZWNrIHdoZXRoZXIgdGhlIG1hc2thbGwgYml0IGlzCj4+IGNsZWFy
ZWQgaW4gZ3Vlc3QuCj4+IAo+PiBUaGUgc29sdXRpb24gaXMgc2ltaWxhciB0byBteSB2MSBbMV0u
IE9uZSBxdWVzdGlvbiBJTU8gKElJUkMsIGl0IGlzIHdoeQo+PiBJIGNoYW5nZWQgdG8gYW5vdGhl
ciBhcHByb2FjaCkgaXM6IHdoeSBub3QgZG8gc3VjaCByZXNldCBhdCBkZWl2Y2UKPj4gZGVhc3Np
Z25tZW50IHN1Y2ggdGhhdCBkb20wIGNhbiB1c2UgYSBjbGVhbiBkZXZpY2UuIE90aGVyd2lzZSwg
dGhlCj4+IGRldmljZSB3b24ndCB3b3JrIGFmdGVyIGJlaW5nIHVuYm91bmQgZnJvbSBwY2liYWNr
LiBCdXQgSSBhbSBub3Qgc28KPj4gc3VyZSwgSSBjYW4gY2hlY2sgaXQgbmV4dCBUdWVzZGF5Lgo+
Cj5JIHRvbyBkaWQgdGhpbmsgYWJvdXQgdGhpcywgYnV0IGFpdWkgcGNpYmFjayBuZWVkcyB0byBp
c3N1ZQo+UEhZU0RFVk9QX3JlbGVhc2VfbXNpeCBhbnl3YXksIGFuZCBEb20wIHdvdWxkIHRoZW4g
cmUtc2V0dXAgTVNJLVgKPiJmcm9tIHNjcmF0Y2giLCBpLmUuIHdlJ2QgY2xlYXIgdGhlIGZsYWcg
YW55d2F5IGluCj5tc2l4X2NhcGFiaWxpdHlfaW5pdCgpIGR1ZSB0byBtc2l4LT51c2VkX2VudHJp
ZXMgYmVpbmcgemVybyBhdAo+dGhlIGZpcnN0IChvZiBwb3NzaWJseSBzZXZlcmFsKSBpbnZvY2F0
aW9uKHMpLgoKWWVzLiBJIGp1c3QgY2hlY2tlZCBpdCBvbiBteSBtYWNoaW5lIGFuZCBmb3VuZCB5
b3UgYXJlIHJpZ2h0LgoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
