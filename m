Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D6C0719
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqyO-0003aK-PY; Fri, 27 Sep 2019 14:11:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S/it=XW=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iDqyN-0003Zf-CA
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:11:51 +0000
X-Inumbo-ID: be8f830e-e130-11e9-967a-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by localhost (Halon) with ESMTPS
 id be8f830e-e130-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:11:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 07:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; d="scan'208";a="391175017"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2019 07:11:36 -0700
Date: Fri, 27 Sep 2019 22:15:38 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190927141536.GA9071@gao-cwp>
References: <1569506015-26938-1-git-send-email-chao.gao@intel.com>
 <1569506015-26938-7-git-send-email-chao.gao@intel.com>
 <c9b53200-3b90-7f93-21f8-dd715965546a@suse.com>
 <20190927135330.GA5570@gao-cwp>
 <1cc3a02b-c73a-d2bd-e96a-3bfa28ddc925@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cc3a02b-c73a-d2bd-e96a-3bfa28ddc925@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v11 6/7] microcode: rendezvous CPUs in NMI
 handler and load ucode
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
 Stefano Stabellini <sstabellini@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDM6NTU6MDBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyNy4wOS4yMDE5IDE1OjUzLCBDaGFvIEdhbyB3cm90ZToKPj4gT24gRnJpLCBTZXAg
MjcsIDIwMTkgYXQgMTI6MTk6MjJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAy
Ni4wOS4yMDE5IDE1OjUzLCBDaGFvIEdhbyB3cm90ZToKPj4+PiBAQCAtNDIwLDE0ICs0OTgsMjMg
QEAgc3RhdGljIGludCBjb250cm9sX3RocmVhZF9mbihjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3Bh
dGNoICpwYXRjaCkKPj4+PiAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4+ICAgICAgfQo+Pj4+ICAK
Pj4+PiAtICAgIC8qIExldCBwcmltYXJ5IHRocmVhZHMgbG9hZCB0aGUgZ2l2ZW4gdWNvZGUgdXBk
YXRlICovCj4+Pj4gLSAgICBzZXRfc3RhdGUoTE9BRElOR19FTlRFUik7Cj4+Pj4gLQo+Pj4+ICsg
ICAgLyogQ29udHJvbCB0aHJlYWQgbG9hZHMgdWNvZGUgZmlyc3Qgd2hpbGUgb3RoZXJzIGFyZSBp
biBOTUkgaGFuZGxlci4gKi8KPj4+PiAgICAgIHJldCA9IG1pY3JvY29kZV9vcHMtPmFwcGx5X21p
Y3JvY29kZShwYXRjaCk7Cj4+Pj4gICAgICBpZiAoICFyZXQgKQo+Pj4+ICAgICAgICAgIGF0b21p
Y19pbmMoJmNwdV91cGRhdGVkKTsKPj4+PiAgICAgIGF0b21pY19pbmMoJmNwdV9vdXQpOwo+Pj4+
ICAKPj4+PiArICAgIGlmICggcmV0ID09IC1FSU8gKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfRVJSCj4+Pj4gKyAgICAgICAgICAgICAgICJMYXRlIGxvYWRpbmcgYWJv
cnRlZDogQ1BVJXUgZmFpbGVkIHRvIHVwZGF0ZSB1Y29kZVxuIiwgY3B1KTsKPj4+PiArICAgICAg
ICBzZXRfc3RhdGUoTE9BRElOR19FWElUKTsKPj4+PiArICAgICAgICByZXR1cm4gcmV0Owo+Pj4+
ICsgICAgfQo+Pj4+ICsKPj4+PiArICAgIC8qIExldCBwcmltYXJ5IHRocmVhZHMgbG9hZCB0aGUg
Z2l2ZW4gdWNvZGUgdXBkYXRlICovCj4+Pj4gKyAgICBzZXRfc3RhdGUoTE9BRElOR19FTlRFUik7
Cj4+Pgo+Pj4gV2hpbGUgdGhlIGRlc2NyaXB0aW9uIGdvZXMgdG8gc29tZSBsZW5ndGhzIHRvIGV4
cGxhaW4gdGhpcyBvcmRlcmluZyBvZgo+Pj4gdXBkYXRlcywgSSBzdGlsbCBkb24ndCByZWFsbHkg
c2VlIHRoZSBwb2ludDogSG93IGlzIGl0IGJldHRlciBmb3IgdGhlCj4+PiBjb250cm9sIENQVSB0
byBoYXZlIHVwZGF0ZWQgaXRzIHVjb2RlIGVhcmx5IGFuZCB0aGVuIGhpdCBhbiBOTUkgYmVmb3Jl
Cj4+PiB0aGUgb3RoZXIgQ1BVcyBoYXZlIGV2ZW4gc3RhcnRlZCB1cGRhdGluZywgdGhhbiB0aGUg
b3RoZXIgd2F5IGFyb3VuZAo+Pj4gaW4gdGhlIG9wcG9zaXRlIGNhc2U/Cj4+IAo+PiBXZSB3YW50
IHRvIGJlIGNvbnNlcnZhdGl2ZSBoZXJlLiBJZiBhbiB1Y29kZSBpcyB0byB1cGRhdGUgc29tZXRo
aW5nCj4+IHNoYXJlZCBieSBhIHdob2xlIHNvY2tldCwgZm9yIHRoZSBsYXR0ZXIgY2FzZSwgY29u
dHJvbCB0aHJlYWQgbWF5Cj4+IGJlIGFjY2Vzc2luZyB0aGluZ3MgdGhhdCBhcmUgYmVpbmcgdXBk
YXRpbmcgYnkgdGhlIHVjb2RlIGxvYWRpbmcgb24KPj4gb3RoZXIgY29yZXMuIEl0IGlzIG5vdCBz
YWZlLCBqdXN0IGxpa2Ugc2libGluZyB0aHJlYWQgaXNuJ3QgZXhwZWN0ZWQKPj4gdG8gYWNjZXNz
IGZlYXR1cmVzIGV4cG9zZWQgYnkgdGhlIG9sZCB1Y29kZSB3aGVuIHByaW1hcnkgdGhyZWFkIGlz
Cj4+IGxvYWRpbmcgdWNvZGUuCj4KPkFoIHllcywgY29uc2lkZXJpbmcgYSBzb2NrZXQtd2lkZSBl
ZmZlY3QgZGlkbid0IG9jY3VyIHRvIG1lIChhbHRob3VnaAo+aXQgc2hvdWxkIGhhdmUpLiBTbyBp
ZiB5b3UgbWVudGlvbiB0aGlzIGFzcGVjdCBpbiB0aGUgZGVzY3JpcHRpb24sIEkKPnRoaW5rIEkn
bSBnb2luZyB0byBiZSBmaW5lIHdpdGggdGhlIGNoYW5nZSBpbiB0aGlzIHJlZ2FyZC4gWWV0IChh
cyBzbwo+b2Z0ZW4pIHRoaXMgcmFpc2VzIGFub3RoZXIgcXVlc3Rpb246IFdoYXQgYWJvdXQgInNl
Y29uZGFyeSIgc29ja2V0cz8KPlNob3VsZG4ndCB3ZSBlbnRlcnRhaW4gYSBzaW1pbGFyIHR3by1z
dGVwIGFwcHJvYWNoIHRoZXJlIHRoZW4/CgpOby4gVGhlIHR3by1zdGVwIGFwcHJvYWNoIGlzIGJl
Y2F1c2UgY29udHJvbCB0aHJlYWQgY2Fubm90IGNhbGwKc2VsZl9ubWkoKSBpbiBjYXNlIG9mIHRy
aWdnZXJpbmcgdW5rbm93bl9ubWlfZXJyb3IoKSBhbmQgd2hhdCBpcyBkb25lCmluIHRoZSBtYWlu
IE5NSSBoYW5kbGVyIGlzbid0IHdlbGwgY29udHJvbGxlZC4gQWxsIGNvcmVzIG9uIG90aGVyCnNv
Y2tldHMgd2lsbCByZW5kZXp2b3VzIGluIE5NSSBoYW5kbGVyLiBJdCBtZWFucyBldmVyeSBjb3Jl
J3MgYmVoYXZpb3IKb24gb3RoZXIgc29ja2V0cyBpcyB3ZWxsIGNvbnRyb2xsZWQuCgpUaGFua3MK
Q2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
