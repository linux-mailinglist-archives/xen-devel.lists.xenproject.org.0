Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5D4E07C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heCoT-0006qN-41; Fri, 21 Jun 2019 06:14:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heCoR-0006qI-Vm
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:14:16 +0000
X-Inumbo-ID: c8e9c108-93eb-11e9-9a17-1fb0a0ef692e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8e9c108-93eb-11e9-9a17-1fb0a0ef692e;
 Fri, 21 Jun 2019 06:14:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:14:10 -0600
Message-Id: <5D0C75AD0200007800239EC2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:14:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth@citrix.com>
References: <6250372b05e95412cfd0f8e6f558f2376c4f3d94.1558719481.git.lars.kurth@citrix.com>
 <5CEBB0A30200007800232BBE@prv1-mh.provo.novell.com>
 <EFBDC501-4BF5-49FA-B313-111DBF30CE9C@citrix.com>
In-Reply-To: <EFBDC501-4BF5-49FA-B313-111DBF30CE9C@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA2LjE5IGF0IDE2OjE4LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiDvu79PbiAyNy8wNS8yMDE5LCAxMDo0MSwgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+IAo+ICAgICA+Pj4gT24gMjQuMDUuMTkgYXQgMTk6NDQsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOgo+ICAgICA+IEZvbGxvd2luZyB0aGUgcmVjZW50IGRpc2N1c3Np
b24sIHdlIGhhZCBvbiBJUkMgYW5kIHRoZSBhY3Rpb24gSSBoYWQgaW4gCj4gICAgID4gdGhlIE1h
cmNoIGNvbW11bml0eSBjYWxsLCB0aGlzIGZpbGUgcHJvdmlkZXMgYSBmaWxlIGZvcm1hdCB0aGF0
IAo+ICAgICA+IGVuYWJsZXMgd3JpdGluZyBhbiBhdXRvbWF0ZWQgdGVzdCB0byBjaGVjayB3aGV0
aGVyIGZpbGVzIGFyZSBvdXQgb2Ygc3luYy4gCj4gICAgID4gCj4gICAgID4gQW4gZXhhbXBsZSwg
d2hhdCBmaWxlIGNvbnRlbnQgbWF5IGxvb2sgbGlrZSBpcyBlbWJlZGRlZCBiZWxvdwo+ICAgICA+
IHJlcG86IGxpbnV4LXRvcnZhbGRzIGdpdCAKPiAgICAgPiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQgCj4gICAgID4gZmls
ZTogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyBsaW51eC10b3J2YWxkcyAKPiAg
ICAgPiBsaW51eC9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMgYjc3Y2YxMWYwOTQxMzYKPiAgICAg
PiAKPiAgICAgPiBPbmNlIHRoZSBmaWxlIGZvcm1hdCBpcyBhZ3JlZSwgSSB3aWxsIHdyaXRlIGEg
dGVzdCBvciBzY3JpcHQuCj4gICAgID4gCj4gICAgID4gSSBhbHNvIG5lZWQgc29tZSBtb3JlIGNv
cnJlY3QgdGVzdCBkYXRhLCBha2EgZW50cmllcyBpbiB0aGUgZmlsZSBmcm9tCj4gICAgID4gY29t
bWl0dGVycyBsb29raW5nIGFmdGVyIHRoZSBmb2xsb3dpbmcgZmlsZXMKPiAgICAgPiBbSmFuXQo+
ICAgICA+IHhlbi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5jIAo+ICAgICA+IFtTdGVmYW5vLCBK
dWxpZW4gLSB0aGlzIGhhcyB0byBiZSBmaW5hbGl6ZWRdCj4gICAgID4geGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3NtbXUuYwo+ICAgICA+IHhlbi9hcmNoL2FybS92Z2ljLyoKPiAgICAgPiB4
ZW4vaW5jbHVkZS9hc20tYXJtL2RpdjY0LmgKPiAgICAgPiB4ZW4vZHJpdmVycy9jaGFyL21lc29u
LXVhcnQuYwo+ICAgICA+IHhlbi9hcmNoL2FybS9hcm0zMi9saWIvKgo+ICAgICA+IHhlbi9hcmNo
L2FybS9hcm02NC9saWIvKgo+ICAgICA+IHhlbi9hcmNoL2FybS9hcm02NC9jYWNoZS5TCj4gICAg
ID4geGVuL2FyY2gvYXJtL2FybTY0L2JwaS5TCj4gICAgID4geGVuL2luY2x1ZGUvYXNtLWFybS9z
eXN0ZW0uaAo+ICAgICA+IHhlbi9hcmNoL2FybS9hcm02NC9pbnNuLmMKPiAgICAgPiBbT3RoZXJz
P10KPiAgICAgPiB4ZW4vY29tbW9uL3JidHJlZS5jCj4gICAgID4gCj4gICAgID4gTm90ZSB0aGF0
IGluIHNvbWUgY2FzZXMgTGludXggaGFzIGRpdmVyZ2VkIGFuZCBzb21lIExpbnV4IGZpbGVzIGhh
dmUgZGlzYXBwZWFyZWQuIAo+ICAgICA+IEp1bGllbiBhbHNvIHJhaXNlZCB0aGUgcG9pbnQsIHRo
YXQgaW4gc29tZSBjYXNlcyBvbmx5IGEgc3Vic2V0IG9mIGNvZGUgZnJvbSAKPiAgICAgPiBMaW51
eCBYZW4gZmlsZXMgd2FzIGFwcGxpZWQgb3IgdGhhdCBvbmx5IHNvbWUgZnVuY3Rpb25zIGdldCBt
b3ZlZCBhY3Jvc3MgdG8gCj4gICAgID4gWGVuLgo+ICAgICA+IAo+ICAgICA+IEkgYmVsaWV2ZSB0
aGF0IGlzIGVudGlyZWx5IE9LLiBUaGUgd29ya2Zsb3cgd291bGQgYmUgaW4gbW9zdCBjYXNlcyB0
aGF0Ogo+ICAgICA+IC0gV2UgdXNlIGEgTGludXggKHNvdXJjZSkgY29tbWl0IGFzIGEgYmVuY2ht
YXJrIGFuZCByZWNvcmQgdGhlIGNvbW1pdCBJRAo+ICAgICA+IC0gSWYgdGhlcmUgaXMgYSBjaGFu
Z2UgaW4gTGludXggdGhlIHRlc3Qgd2lsbCBmYWlsCj4gICAgID4gLSBUaGUgY29tbWl0dGVyIGxv
b2tzIGF0IHRoZSBkaWZmIGFuZCBlaXRoZXIKPiAgICAgPiAgIC0gRGVjaWRlcyB0byBpZ25vcmUg
aXQgYW5kIGJ1bXBzIHRoZSBjb21taXQgSUQgaW4gdGhpcyBmaWxlCj4gICAgID4gICAtIERlY2lk
ZXMgdGhlIGNoYW5nZSBpcyBuZWVkZWQsIGludGVncmF0ZXMgaXQgaW50byBYZW4gYW5kIHRoZW4g
Cj4gICAgID4gICAgIGJ1bXBzIHRoZSBjb21taXQgSUQgaW4gdGhpcyBmaWxlCj4gICAgIAo+ICAg
ICBXaXRoIHRoaXMgLi4uCj4gICAgIAo+ICAgICA+IENoYW5nZXMgc2luY2UgdjEKPiAgICAgPiAq
IFJlcXVpcmUgYSBjb2xvbiBhZnRlciByZXBvOiwgZmlsZTosIC4uLiBrZXl3b3Jkcwo+ICAgICA+
ICogUmVwbGFjZSBtYW51YWw6fGF1dG86IHdpdGggZmlsZTogYXMgdGhlcmUgYXV0bzogdXNlLWNh
c2Ugd2FzIGludmFsaWQKPiAgICAgPiAqIEFkZGVkIG1vcmUgdmVyYm9zZSBkZXNjcmlwdGlvbiBv
ZiBmb3JtYXQKPiAgICAgPiAKPiAgICAgPiBDaGFuZ2VzIHNpbmNlIHYyCj4gICAgID4gKiBDaGFu
Z2VkIHNvbWUgZm9ybWF0dGluZwo+ICAgICA+ICogUmVtb3ZlZCBleGFtcGxlcwo+ICAgICA+ICog
UmVtb3ZlZCByZWZlcmVuY2VzIHRvIGh0dHBzCj4gICAgIAo+ICAgICAuLi4gbW92ZSBwYXN0IHRo
ZSBmaXJzdCAtLS0gc2VwYXJhdG9yIC4uLgo+ICAgICAKPiAgICAgPiBTaWduZWQtb2ZmLWJ5OiBM
YXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4gICAgIAo+ICAgICBBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ICAgICAKPiBBcmUgYW55IGV4dHJhIEFD
S3MgbmVlZGVkPyAgCgpJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSBzdHJpY3QgcmVxdWlyZW1lbnQg
Zm9yIG1vcmUsIGJ1dCBJIHRoaW5rIGl0CndvdWxkIGJlIG5pY2UgdG8gYXQgbGVhc3QgZ2V0IHdo
b2V2ZXIgYnJvdWdodCB1cCB0aGUgdHJhY2tpbmcKaWRlYSB0byBhY2tub3dsZWRnZSB0aGF0IHRo
aXMgYXBwcm9hY2ggaXMgbGlrZWx5IGdvaW5nIHRvIGZpdC4KVW5sZXNzIG9mIGNvdXJzZSBpdCB3
YXMgeW91cnNlbGYgdG8gYnJpbmcgdGhpcyB1cCBmaXJzdCAuLi4KCkphbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
