Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88C11A9B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:58:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCCe-0007mS-53; Thu, 02 May 2019 13:56:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMCCb-0007mJ-VF
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:56:45 +0000
X-Inumbo-ID: 196eac64-6ce2-11e9-8e51-a74dc4596b44
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 196eac64-6ce2-11e9-8e51-a74dc4596b44;
 Thu, 02 May 2019 13:56:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:56:35 -0600
Message-Id: <5CCAF70E020000780022B4A1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:56:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
 <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
In-Reply-To: <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDUvMjAxOSAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAy
LjA1LjE5IGF0IDE0OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAwMi8wNS8yMDE5IDEzOjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jCj4+Pj4gQEAgLTE0NTAsMTcgKzE0NTAsMzYgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2
aWNlKHN0cnVjdCBkb21haW4gKgo+Pj4+ICAgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQt
PnBsYXRmb3JtX29wcyApCj4+Pj4gICAgICAgICAgcmV0dXJuIDA7Cj4+Pj4gIAo+Pj4+IC0gICAg
LyogUHJldmVudCBkZXZpY2UgYXNzaWduIGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2
ZSBiZWVuIAo+Pj4+IC0gICAgICogZW5hYmxlZCBmb3IgdGhpcyBkb21haW4gKi8KPj4+PiAtICAg
IGlmICggdW5saWtlbHkoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fAo+Pj4+IC0g
ICAgICAgICAgICAgICAgICB2bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykg
fHwKPj4+PiArICAgIGRvbWFpbl9sb2NrKGQpOwo+Pj4+ICsKPj4+PiArICAgIC8qCj4+Pj4gKyAg
ICAgKiBQcmV2ZW50IGRldmljZSBhc3NpZ25tZW50IGlmIGFueSBvZgo+Pj4+ICsgICAgICogLSBt
ZW0gcGFnaW5nCj4+Pj4gKyAgICAgKiAtIG1lbSBzaGFyaW5nCj4+Pj4gKyAgICAgKiAtIHRoZSBw
Mm1fcmFtX3JvIHR5cGUKPj4+PiArICAgICAqIC0gZ2xvYmFsIGxvZy1kaXJ0eSBtb2RlCj4+PiBY
ZW5TZXJ2ZXIgaGFzIHdvcmtpbmcgbGl2ZSBtaWdyYXRpb24gd2l0aCBHUFVzLCB3aGljaCB0aGlz
IGNoYW5nZSB3b3VsZAo+Pj4gcmVncmVzcy4KPj4+Cj4+PiBCZWhpbmQgdGhlIHNjZW5lcywgd2Ug
Y29tYmluZSBYZW4ncyBsb2dkaXJ0eSBiaXRtYXAgd2l0aCBvbmUgcHJvdmlkZWQgYnkKPj4+IHRo
ZSBHUFUsIHRvIGVuc3VyZSB0aGF0IGFsbCBkaXJ0eSB1cGRhdGVzIGFyZSB0cmFja2VkLgo+PiBC
dXQgdGhpcyBzYXlzIG5vdGhpbmcgZm9yIHRoZSBwYXRjaCBoZXJlLgo+IAo+IFllcyBpdCBkb2Vz
LgoKV2VsbCwgb2theSwgdGhlbiB0aGUgd29yZGluZyBvZiB5b3VyIHJlcGx5IHBsdXMgbWUganVz
dCBhZGRpbmcKYSBjb21tZW50IGZvciBhIHByZS1leGlzdGluZyBjaGVjayBoYXMgbWlzbGVhZCBt
ZS4KCj4gVGhlcmUgaXMgbm90aGluZyBpbmhlcmVudCBhYm91dCBnbG9iYWwgbG9nLWRpcnR5IG1v
ZGUgd2hpY2ggaXMKPiBpbmNvbXBhdGlibGUgd2l0aCBwYXNzdGhyb3VnaCB3aGVuIHRoZSBJT01N
VSBwYWdldGFibGVzIGFyZSBub3Qgc2hhcmVkCj4gd2l0aCBFUFQuCj4gCj4+IEFzIGxvbmcgYXMg
aXQgZG9lc24ndCB3b3JrIGluIHRoZSBzdGFnaW5nIHRyZWUsIGl0IHNob3VsZCBiZSBwcmV2ZW50
ZWQuCj4gCj4gLi4uIGJ1dCBpdCBkb2VzIHdvcmsuCgpOb3RlIGhvdyAoYXMgc2FpZCBhYm92ZSkg
dGhlIHBhdGNoIGRvZXMgX25vdF8gYWRkIGFueQotPmdsb2JhbF9sb2dkaXJ0eSBjaGVjaywgaXQg
bWVyZWx5IGFkZHMgYSBjb21tZW50IGVudW1lcmF0aW5nCmV2ZXJ5dGhpbmcgdGhhdCdzIGdldHRp
bmcgY2hlY2tlZC4gSSdtIGFmcmFpZCBJIGRvbid0IHNlZSBob3cKYWRkaW5nIGEgY29tbWVudCB0
byBzdGF0ZSBob3cgdGhpbmdzIGFyZSBjYW4gcmVncmVzcyBhbnl0aGluZy4KClRoZSBvbmx5IGNo
ZWNrIHRoZSBwYXRjaCBhZGRzIGlzIHRoYXQgb2YgdGhlIG5ldwpwMm1fcmFtX3JvX3VzZWQgZmxh
Zy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
