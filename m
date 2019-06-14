Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740D45819
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 11:01:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbi2q-0002jn-Bf; Fri, 14 Jun 2019 08:58:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbi2p-0002ji-JW
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 08:58:47 +0000
X-Inumbo-ID: 9dcf8be7-8e82-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9dcf8be7-8e82-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 08:58:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 02:58:45 -0600
Message-Id: <5D0361C1020000780023836C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 02:58:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ashok Raj" <ashok.raj@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp> <20190611160416.GB44426@otc-nc-03>
 <5D00ABF70200007800237502@prv1-mh.provo.novell.com>
 <20190613140524.GA2355@gao-cwp>
 <5D0258EE0200007800237EEB@prv1-mh.provo.novell.com>
 <20190613174708.GA30122@araj-mobl1.jf.intel.com>
In-Reply-To: <20190613174708.GA30122@araj-mobl1.jf.intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 09/10] microcode: remove
 microcode_update_lock
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE5OjQ3LCA8YXNob2sucmFqQGludGVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6MDg6NDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxMy4wNi4xOSBhdCAxNjowNSwgPGNoYW8uZ2FvQGludGVsLmNvbT4gd3Jv
dGU6Cj4+ID4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6Mzg6MzFBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+ID4+Pj4+IE9uIDExLjA2LjE5IGF0IDE4OjA0LCA8YXNob2sucmFqQGlu
dGVsLmNvbT4gd3JvdGU6Cj4+ID4+PiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwODo0NjowNFBN
ICswODAwLCBDaGFvIEdhbyB3cm90ZToKPj4gPj4+PiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAw
ODo1Mzo0NkFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+PiA+Cj4+ID4+Pj4gPj4g
QEAgLTMwNyw4ICszMDMsNyBAQCBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29kZShjb25zdCBzdHJ1
Y3QgbWljcm9jb2RlX3BhdGNoIAo+IAo+PiA+Pj4gKnBhdGNoKQo+PiA+Pj4+ID4+ICAKPj4gPj4+
PiA+PiAgICAgIG1jX2ludGVsID0gcGF0Y2gtPm1jX2ludGVsOwo+PiA+Pj4+ID4+ICAKPj4gPj4+
PiA+PiAtICAgIC8qIHNlcmlhbGl6ZSBhY2Nlc3MgdG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1T
UiAweDc5ICovCj4+ID4+Pj4gPj4gLSAgICBzcGluX2xvY2tfaXJxc2F2ZSgmbWljcm9jb2RlX3Vw
ZGF0ZV9sb2NrLCBmbGFncyk7Cj4+ID4+Pj4gPj4gKyAgICBCVUdfT04obG9jYWxfaXJxX2lzX2Vu
YWJsZWQoKSk7Cj4+ID4+Pj4gPj4gIAo+PiA+Pj4+ID4+ICAgICAgLyoKPj4gPj4+PiA+PiAgICAg
ICAqIFdyaXRlYmFjayBhbmQgaW52YWxpZGF0ZSBjYWNoZXMgYmVmb3JlIHVwZGF0aW5nIG1pY3Jv
Y29kZSB0byBhdm9pZAo+PiA+Pj4+ID4KPj4gPj4+PiA+VGhpbmtpbmcgYWJvdXQgaXQgLSB3aGF0
IGhhcHBlbnMgaWYgd2UgaGl0IGFuIE5NSSBvciAjTUMgaGVyZT8KPj4gPj4+PiA+d2F0Y2hkb2df
ZGlzYWJsZSgpLCBhIGNhbGwgdG8gd2hpY2ggeW91IGFkZCBpbiBhbiBlYXJsaWVyIHBhdGNoLAo+
PiA+Pj4+ID5kb2Vzbid0IHJlYWxseSBzdXBwcmVzcyB0aGUgZ2VuZXJhdGlvbiBvZiBOTUlzLCBp
dCBvbmx5IHRlbGxzIHRoZQo+PiA+Pj4+ID5oYW5kbGVyIG5vdCB0byBsb29rIGF0IHRoZSBhY2N1
bXVsYXRlZCBzdGF0aXN0aWNzLgo+PiA+Pj4+IAo+PiA+Pj4+IEkgdGhpbmsgdGhleSBzaG91bGQg
YmUgc3VwcHJlc3NlZC4gQXNob2ssIGNvdWxkIHlvdSBjb25maXJtIGl0Pwo+PiA+Pj4gCj4+ID4+
PiBJIHRoaW5rIHRoZSBvbmx5IHNvdXJjZXMgd291bGQgYmUgdGhlIHdhdGNoZG9nIGFzIHlvdSBw
b2ludGVkIG91dAo+PiA+Pj4gd2hpY2ggd2UgYWxyZWFkeSB0b3VjaCB0byBrZWVwIGl0IGZyb20g
ZXhwaXJpbmcuIFRoZSBwZXJmIGNvdW50ZXJzCj4+ID4+PiBpJ20gbm90IGFuIGV4cGVydCBpbiwg
YnV0IGknbGwgY2hlY2suIFdoZW4gd2UgYXJlIGluIHN0b3BfbWFjaGluZSgpIHR5cGUKPj4gPj4+
IGZsb3csIGl0cyBub3QgY2xlYXIgaWYgYW55IG9mIHRob3NlIHdvdWxkIGZpcmUuIChJIG1pZ2h0
IGJlIHdyb25nLCBidXQgbGV0Cj4+ID4+PiBtZSBjaGVjaykuCj4+ID4+Cj4+ID4+V2VsbCwgd2l0
aG91dCBkaXNhcm1pbmcgdGhlIHdhdGNoZG9nIE5NSSBhdCB0aGUgTEFQSUMgLyBJTy1BUElDLAo+
PiA+PmhvdyB3b3VsZCBpdCBfbm90XyBwb3RlbnRpYWxseSBmaXJlPwo+PiA+IAo+PiA+IFdlIHBs
YW4gbm90IHRvIHByZXZlbnQgTk1JIGJlaW5nIGZpcmVkLiBJbnN0ZWFkLCBpZiBvbmUgdGhyZWFk
IG9mIGEgY29yZQo+PiA+IGlzIHVwZGF0aW5nIG1pY3JvY29kZSwgb3RoZXIgdGhyZWFkcyBvZiB0
aGlzIGNvcmUgd291bGQgc3RvcCBpbiB0aGUKPj4gPiBoYW5kbGVyIG9mIE5NSSB1bnRpbCB0aGUg
dXBkYXRlIGNvbXBsZXRpb24uIElzIHRoaXMgYXBwcm9hY2ggYWNjZXB0YWJsZT8KPj4gCj4+IFdl
bGwsIEkgaGF2ZSB0byByZXR1cm4gdGhlIHF1ZXN0aW9uOiBJdCBpcyB5b3Ugd2hvIGtub3dzIHdo
YXQgaXMgb3IKPj4gaXMgbm90IGFjY2VwdGFibGUgd2hpbGUgYW4gdWNvZGUgdXBkYXRlIGlzIGlu
IHByb2dyZXNzLiBJbiBwYXJ0aWN1bGFyCj4+IGl0IG9idmlvdXNseSBtYXR0ZXJzIGhvdyBtdWNo
IHVjb2RlIGlzIGludm9sdmVkIGluIHRoZSBkZWxpdmVyeSBvZgo+PiBhbiBOTUkgKGFuZCBpbiBh
bGxvd2luZyB0aGUgaGFuZGxlciB0byBnZXQgdG8gdGhlIHBvaW50IHdoZXJlIHlvdSdkCj4+ICJz
dG9wIiBpdCkuCj4+IAo+PiBJZiB0aGUgYXBwcm9hY2ggeW91IHN1Z2dlc3QgaXMgZmluZSBmb3Ig
dGhlIE5NSSBjYXNlLCBJJ2QgdGhlbiB3b25kZXIKPj4gaWYgaXQgY291bGRuJ3QgYWxzbyBiZSB1
c2VkIGZvciB0aGUgI01DIG9uZS4KPiAKPiBBcmNoaXRlY3R1cmFsbHkgb25seSBvbmUgI01DIGNh
biBiZSBhY3RpdmUgaW4gdGhlIHN5c3RlbS4gSWYgYSBuZXcgI01DIAo+IGNvbmRpdGlvbiBoYXBw
ZW5zIHdoZW4gTUNHX1NUQVRVUy5NQ0lQIGlzIGFscmVhZHkgc2V0LCB0aGF0IHdvdWxkIGNhdXNl
IAo+IHNwb250YW5lb3VzIAo+IHNodXRkb3duLgoKVGhhdCdzIHVuZGVyc3Rvb2QuCgo+IElmIGFu
b3RoZXIgTk1JIGFycml2ZXMgb24gdGhlIENQVSBkb2luZyB0aGUgd3Jtc3IsIGl0IHdpbGwgYmUg
cGVuZGVkCj4gaW4gdGhlIGxhcGljIGFuZCBkZWxpdmVyZWQgYWZ0ZXIgdGhlIHdybXNyIHJldHVy
bnMuIHdybXNyIGZsb3cKPiBjYW4ndCBiZSBpbnRlcnJ1cHRlZC4gCgpPZiBjb3Vyc2UuCgpOZWl0
aGVyIHBhcnQgb2YgeW91ciByZXNwb25zZSBpcyBhbiBhcmd1bWVudCBhZ2FpbnN0IGFkZGluZyB0
aGUgc2FtZQoiZGVmZW5zZSIgdG8gdGhlICNNQyBoYW5kbGVyLCB0aG91Z2guIFdoaWxlIGxpa2Vs
eSAjTUMgd2lsbCBiZSBmYXRhbAp0byB0aGUgc3lzdGVtIGFueXdheSwgd2Ugc2hvdWxkIHRyeSB0
byBhdm9pZCBtYWtpbmcgdGhpbmdzIHdvcnNlCndoZW4gd2UgY2FuLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
