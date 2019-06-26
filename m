Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953256881
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 14:21:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg6s4-00084M-Sf; Wed, 26 Jun 2019 12:17:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cXZU=UZ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hg6s3-00084H-AM
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 12:17:51 +0000
X-Inumbo-ID: 69a534b4-980c-11e9-8980-bc764e045a96
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69a534b4-980c-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 12:17:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 05:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="313412199"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga004.jf.intel.com with ESMTP; 26 Jun 2019 05:17:46 -0700
Date: Wed, 26 Jun 2019 20:21:59 +0800
From: Chao Gao <chao.gao@intel.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190626122157.GA2885@gao-cwp>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
 <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDg6MTc6NTBBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPk9uIDI0LjA2LjE5IDIwOjQ3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+KyB4
ZW4tZGV2ZWwKPj4KPj5PbiBNb24sIDI0IEp1biAyMDE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4+PkhpIGFsbCwKPj4+Cj4+PkkgbWlnaHQgaGF2ZSBmb3VuZCBhIGJ1ZyB3aXRoIFBDSSBw
YXNzdGhyb3VnaCB0byBhIExpbnV4IEhWTSBndWVzdCBvbgo+Pj54ODYgd2l0aCBYZW4gNC4xMi4g
SXQgaXMgbm90IGVhc3kgZm9yIG1lIHRvIGdldCBhY2Nlc3MsIGFuZCBlc3BlY2lhbGx5Cj4+PmNo
YW5nZSBjb21wb25lbnRzLCBvbiB0aGlzIHBhcnRpY3VsYXIgc3lzdGVtLCBhbmQgSSBkb24ndCBo
YXZlIGFjY2VzcyB0bwo+Pj5vdGhlciB4ODYgYm94ZXMgYXQgdGhlIG1vbWVudCwgc28gYXBvbG9n
aWVzIGZvciB0aGUgcGFydGlhbCBpbmZvcm1hdGlvbgo+Pj5yZXBvcnQuIFRoZSBzZXR1cCBpcyBh
cyBmb2xsb3c6Cj4+Pgo+Pj4tIHR3byBQQ0kgZGV2aWNlcyBoYXZlIGJlZW4gYXNzaWduZWQgdG8g
YSBIVk0gZ3Vlc3QsIGV2ZXJ5dGhpbmcgaXMgZmluZQo+Pj4tIHJlYm9vdCB0aGUgZ3Vlc3QgZnJv
bSBpbnNpZGUsIGkuZS4gYHJlYm9vdCcgaW4gTGludXgKPj4+LSBhZnRlciB0aGUgcmVib290IGNv
bXBsZXRlcywgb25seSBvbmUgZGV2aWNlIGlzIGFzc2lnbmVkCj4+Pgo+Pj5CZWZvcmUgdGhlIHJl
Ym9vdCwgSSBzZWUgYWxsIHRoZSBhcHByb3ByaWF0ZSB4ZW5zdG9yZSBlbnRyaWVzIGZvciBib3Ro
Cj4+PmRldmljZXMuIEV2ZXJ5dGhpbmcgaXMgZmluZS4gQWZ0ZXIgdGhlIHJlYm9vdCwgSSBjYW4g
b25seSBzZWUgdGhlCj4+PnhlbnN0b3JlIGVudHJpZXMgb2Ygb25lIGRldmljZS4gSXQgaXMgYXMg
aWYgdGhlIG90aGVyIGRldmljZQo+Pj4iZGlzYXBwZWFyZWQiIHdpdGhvdXQgdGhyb3dpbmcgYW55
IGVycm9ycy4KPj4+Cj4+PkhhdmUgeW91IHNlZW4gdGhpcyBiZWZvcmU/IERvIHlvdSBrbm93IGlm
IGl0IGhhcyBiZWVuIGZpeGVkIGluIHN0YWdpbmc/Cj4+Pkkgbm90aWNlZCB0aGlzIGZpeCB3aGlj
aCBzZWVtcyB0byBiZSB2ZXJ5IHJlbGV2YW50Ogo+Pj4KPj4+aHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTExL21zZzAxNjE2Lmh0bWwKPj4+
Cj4+PmJ1dCBpdCBpcyBhbHJlYWR5IGluY2x1ZGVkIGluIDQuMTIuCj4KPlN0ZWZhbm8sIGNvdWxk
IHlvdSBwbGVhc2UgdHJ5IHRoZSBhdHRhY2hlZCBwYXRjaD8gSXQgaXMgb25seSBjb21waWxlCj50
ZXN0ZWQgZm9yIG5vdy4KPgo+Cj5KdWVyZ2VuCgo+RnJvbSBlYTk1ZGNkZmM2MGE4OTVjYzQzYmFm
MzRjOGUwZmIwODhlMTAwMDhkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+RnJvbTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+VG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+Q2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Cj5EYXRlOiBXZWQsIDI2IEp1biAyMDE5IDA4OjE1OjI4ICswMjAw
Cj5TdWJqZWN0OiBbUEFUQ0hdIGxpYnhsOiBmaXggcGNpIGRldmljZSByZS1hc3NpZ25pbmcgYWZ0
ZXIgZG9tYWluIHJlYm9vdAo+Cj5BZnRlciBhIHJlYm9vdCBvZiBhIGd1ZXN0IG9ubHkgdGhlIGZp
cnN0IHBjaSBkZXZpY2UgY29uZmlndXJhdGlvbiB3aWxsCj5iZSByZXRyaWV2ZWQgZnJvbSBYZW5z
dG9yZSByZXN1bHRpbmcgaW4gbG9zcyBvZiBhbnkgZnVydGhlciBhc3NpZ25lZAo+cGFzc2VkIHRo
cm91Z2ggcGNpIGRldmljZXMuCj4KPlRoZSBtYWluIHJlYXNvbiBpcyB0aGF0IGFsbCBwYXNzZWQg
dGhyb3VnaCBwY2kgZGV2aWNlcyByZXNpZGUgdW5kZXIgYQo+Y29tbW9uIHJvb3QgZGV2aWNlICIw
IiBpbiBYZW5zdG9yZS4gU28gd2hlbiB0aGUgZGV2aWNlIGxpc3QgaXMgcmVidWlsdAo+ZnJvbSBY
ZW5zdG9yZSBhZnRlciBhIHJlYm9vdCB0aGUgc3ViLWRldmljZXMgYmVsb3cgdGhhdCByb290IGRl
dmljZQo+bmVlZCB0byBiZSBzZWxlY3RlZCBpbnN0ZWFkIG9mIHVzaW5nIHRoZSByb290IGRldmlj
ZSBudW1iZXIgYXMgYQo+c2VsZWN0b3IuCj4KPkZpeCB0aGF0IGJ5IGFkZGluZyBhIG5ldyBtZW1i
ZXIgdG8gc3RydWN0IGxpYnhsX2RldmljZV90eXBlIHdoaWNoIHdoZW4KPnNldCBpcyB1c2VkIHRv
IGdldCB0aGUgbnVtYmVyIG9mIGRldmljZXMuIEFkZCBzdWNoIGEgbWVtYmVyIGZvciBwY2kgdG8K
PmdldCB0aGUgY29ycmVjdCBudW1iZXIgb2YgcGNpIGRldmljZXMgaW5zdGVhZCBvZiBpbXBseWlu
ZyBpdCBmcm9tIHRoZQo+bnVtYmVyIG9mIHBjaSByb290IGRldmljZXMgKHdoaWNoIHdpbGwgYWx3
YXlzIGJlIDEpLgo+Cj5XaGlsZSBhdCBpdCBmaXggdGhlIHR5cGUgb2YgbGlieGxfX2RldmljZV9w
Y2lfZnJvbV94c19iZSgpIHRvIG1hdGNoCj50aGUgb25lIG9mIHRoZSAuZnJvbV94ZW5zdG9yZSBt
ZW1iZXIgb2Ygc3RydWN0IGxpYnhsX2RldmljZV90eXBlLiBUaGlzCj5maXhlcyBhIGxhdGVudCBi
dWcgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBvZiBhIGZ1bmN0aW9uIHJldHVybmluZwo+dm9p
ZC4KPgo+U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKVGVz
dGVkLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgoKTm90ZSB0aGF0IEkganVzdCB0
ZXN0ZWQgaXQgb24gUkVMRUFTRS00LjEyLjAsIG5vdCBzdGFnaW5nLgoKSSBhbHNvIGZvdW5kIFVT
QiBkZXZpY2Ugd291bGQgbWlzcyBhY3Jvc3MgcmVib290LiBJcyB0aGVyZSBzb21lb25lCndpbGxp
bmcgdG8gZml4IGl0IHRvbz8KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
