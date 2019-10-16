Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43972D8E44
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:46:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgm3-0001jk-Qx; Wed, 16 Oct 2019 10:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKgm2-0001jc-OW
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:43:22 +0000
X-Inumbo-ID: c557912e-f001-11e9-93b0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c557912e-f001-11e9-93b0-12813bfff9fa;
 Wed, 16 Oct 2019 10:43:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C2EE28;
 Wed, 16 Oct 2019 03:43:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4DC43F6C4;
 Wed, 16 Oct 2019 03:43:18 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
 <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
 <23974.61064.928585.36020@mariner.uk.xensource.com>
 <3f7be099-158d-e10b-7934-19c7fd9e9c75@citrix.com>
 <1531968b-6657-14b4-c740-85995f21b521@arm.com>
 <a41acb21-8390-935f-4897-f1e5ade81a4c@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <96abf31f-80d0-9bc6-d1df-305ff4640124@arm.com>
Date: Wed, 16 Oct 2019 11:43:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a41acb21-8390-935f-4897-f1e5ade81a4c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMTYvMTAvMjAxOSAxMTozOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biAxMC8xNi8xOSAxMTozMSBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxNi8xMC8yMDE5
IDExOjIyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gMTAvMTYvMTkgMTE6MTggQU0sIElh
biBKYWNrc29uIHdyb3RlOgo+Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXMgKCJSZTogW1BB
VENIIGZvci00LjEzXSB4ZW4vYXJtOiBEb24ndCB1c2UKPj4+PiBfZW5kIGluIGlzX3hlbl9maXhl
ZF9tZm4oKSIpOgo+Pj4+PiBNeSBzdWdnZXN0aW9uIGlzIGdvaW5nIHRvIHdvcms6ICJ0aGUgY29t
cGlsZXIgc2VlcyB0aHJvdWdoIGNhc3RzIgo+Pj4+PiByZWZlcnJlZCB0byBjb21wYXJpc29ucyBi
ZXR3ZWVuIHBvaW50ZXJzLCB3aGVyZSB3ZSB0ZW1wb3JhcmlseSBjYXN0ZWQKPj4+Pj4gYm90aCBw
b2ludGVycyB0byBpbnRlZ2VycyBhbmQgYmFjayB0byBwb2ludGVycyB2aWEgYSBNQUNSTy4gVGhh
dCBjYXNlCj4+Pj4+IHdhcyBpZmZ5IGJlY2F1c2UgdGhlIE1BQ1JPIHdhcyBjbGVhcmx5IGEgd29y
a2Fyb3VuZCB0aGUgc3BlYy4KPj4+Pj4KPj4+Pj4gSGVyZSB0aGUgc2l0dWF0aW9uIGlzIGRpZmZl
cmVudC4gRm9yIG9uZSwgd2UgYXJlIGRvaW5nIGFyaXRobWV0aWMuIEFsc28KPj4+Pj4gdmlydF90
b19tYWRkciBhbHJlYWR5IHRha2VzIGEgdmFkZHJfdCBhcyBhcmd1bWVudC4gU28gaW5zdGVhZCBv
ZiBkb2luZwo+Pj4+PiBwb2ludGVycyBhcml0aG1ldGljLCB0aGVuIGNvbnZlcnRpbmcgdG8gdmFk
ZHJfdCwgd2UgYXJlIGNvbnZlcnRpbmcgdG8KPj4+Pj4gdmFkZHJfdCBmaXJzdCwgdGhlbiBkb2lu
ZyBhcml0aG1ldGljcywgd2hpY2ggaXMgZmluZSBib3RoIGZyb20gYSBDOTkKPj4+Pj4gcG9pbnQg
b2YgdmlldyBhbmQgZXZlbiBhIE1JU1JBIEMgcG9pbnQgb2Ygdmlldy4gSSBjYW4ndCBzZWUgYSBw
cm9ibGVtCj4+Pj4+IHdpdGggdGhhdC4gSSBhbSBzdXJlIGFzIEkgcmVhc29uYWJsZSBjYW4gYmUg
Oi0pCj4+Pj4KPj4+PiBGVEFPRCBJIHRoaW5rIHlvdSBhcmUgc3VnZ2VzdGluZyB0aGlzOgo+Pj4+
ICDCoCAtICvCoMKgwqDCoCAobWZuX3RvX21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihfZW5k
IC0gMSkpKQo+Pj4+ICDCoCArICvCoMKgwqDCoCAobWZuX3RvX21hZGRyKG1mbikgPD0gdmlydF90
b19tYWRkcigoKHZhZGRyX3QpX2VuZCAtIDEpKSkKPj4+Pgo+Pj4+IHZpcnRfdG9fbWFkZHIodmEp
IGlzIGEgbWFjcm8gd2hpY2ggZXhwYW5kcyB0bwo+Pj4+ICDCoMKgwqAgX192aXJ0X3RvX21hZGRy
KCh2YWRkcl90KSh2YSkpCj4+Pj4KPj4+PiBTbyB3aGF0IGlzIGhhcHBlbmluZyBoZXJlIGlzIHRo
YXQgdGhlIGNhc3QgdG8gYW4gaW50ZWdlciB0eXBlIGlzIGJlaW5nCj4+Pj4gZG9uZSBiZWZvcmUg
dGhlIHN1YnRyYWN0aW9uLgo+Pj4+Cj4+Pj4gV2l0aG91dCB0aGUgY2FzdCwgeW91IGFyZSBjYWxj
dWxhdGluZyB0aGUgcG9pbnRlciB2YWx1ZSBfZW5kLTEgZnJvbQo+Pj4+IHRoZSB2YWx1ZSBfZW5k
LCB3aGljaCBpcyBVQi7CoCBXaXRoIHRoZSBjYXN0IHlvdSBhcmUgY2FsY3VsYXRpbmcgYW4KPj4+
PiBpbnRlZ2VyIHZhbHVlLsKgIHZhZGRyX3QgaXMgdW5zaWduZWQsIHNvIGFsbCBhcml0aG1ldGlj
IG9wZXJhdGlvbnMgYXJlCj4+Pj4gZGVmaW5lZC7CoCBOb3RoaW5nIGNhc3RzIHRoZSByZXN1bHQg
YmFjayB0byB0aGUgImZvcmJpZGRlbiIgKHdpdGggdGhpcwo+Pj4+IHByb3ZlbmFuY2UpIHBvaW50
ZXIgdmFsdWUsIHNvIGFsbCBpcyB3ZWxsLgo+Pj4+Cj4+Pj4gKFdpdGggdGhlIG1hY3JvIGV4cGFu
c2lvbiB0aGUgY2FzdCBoYXBwZW5zIHR3aWNlLsKgIFRoaXMgaXMgcHJvYmFibHkKPj4+PiBiZXR0
ZXIgdGhhbiB1c2luZyBfX3ZpcnRfdG9fbWFkZHIgaGVyZS4pCj4+Pj4KPj4+PiBJZSwgaW4gdGhp
cyBjYXNlIEkgYWdyZWUgd2l0aCBTdGVmYW5vLsKgIFRoZSBjYXN0IGlzIGJvdGggbmVjZXNzYXJ5
IGFuZAo+Pj4+IHN1ZmZpY2llbnQuCj4+Pgo+Pj4gTWF5YmUgSSBtaXNzZWQgc29tZXRoaW5nLCBi
dXQgd2h5IGFyZSB3ZSB1c2luZyBgPD1gIGF0IGFsbD/CoCBXaHkgbm90IHVzZQo+Pj4gYDxgPwo+
Pj4KPj4+IE9yIGlzIHRoaXMgc29tZSB3ZWlyZCBDIHBvaW50ZXIgY29tcGFyaXNvbiBVQiB0aGlu
Zz8KPj4KPj4gX2VuZCBtYXkgbm90IGJlIG1hcHBlZCBpbiB0aGUgdmlydHVhbCBhZGRyZXNzIHNw
YWNlLiBUaGlzIGlzIHRoZSBjYXNlCj4+IHdoZW4gdGhlIHNpemUgb2YgWGVuIGlzIHBhZ2UtYWxp
Z25lZC4gU28gX2VuZCB3aWxsIHBvaW50IHRvIHRoZSBuZXh0IHBhZ2UuCj4+Cj4+IHZpcnRfdG9f
bWFkZHIoKSBjYW5ub3QgZmFpbCBzbyBpdCBzaG91bGQgb25seSBiZSBjYWxsZWQgb24gdmFsaWQg
dmlydHVhbAo+PiBhZGRyZXNzLiBUaGUgYmVoYXZpb3IgaXMgdW5kZWZpbmVkIGluIGFsbCB0aGUg
b3RoZXIgY2FzZXMuCj4+Cj4+IE9uIHg4NiwgeW91IG1pZ2h0IGJlIGFibGUgdG8gZ2V0IGF3YXkg
YmVjYXVzZSB5b3UgdHJhbnNsYXRlIHRoZSB2aXJ0dWFsCj4+IGFkZHJlc3MgdG8gcGh5c2ljYWwg
YWRkcmVzcyBpbiBzb2Z0d2FyZS4KPj4KPj4gT24gQXJtLCB3ZSBhcmUgdXNpbmcgdGhlIGhhcmR3
YXJlIGluc3RydWN0aW9uIHRvIGRvIHRoZSB0cmFuc2xhdGlvbi4gQXMKPj4gX2VuZCBpcyBub3Qg
YWx3YXlzIG1hcHBlZCwgdGhlbiB0aGUgdHJhbnNsYXRpb24gbWF5IGZhaWwuIEluIG90aGVyIHdv
cmQsCj4+IFhlbiB3aWxsIGNyYXNoLgo+IAo+IE5vbmUgb2YgdGhpcyBleHBsYWlucyBteSBxdWVz
dGlvbi4KPiAKPiBJcyBpdCBub3QgdGhlIGNhc2UgdGhhdCBpZiBgbWZuX3RvX21hZGRyKG1mbikg
PD0gdmlydF90b19tYWRkcihfZW5kLTEpYAo+IGlzIHRydWUsIHRoZW4gYG1mbl90b19tYWRkciht
Zm4pIDwgdmlydF90b19tYWRkcihfZW5kKWAgd2lsbCBiZSB0cnVlLAo+IGFuZCB0aGF0IGlmIGBt
Zm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKF9lbmQtMSlgIGlzIGZhbHNlLCB0aGVu
Cj4gYG1mbl90b19tYWRkcihtZm4pIDwgdmlydF90b19tYWRkcihfZW5kKWAgd2lsbCBhbHNvIGJl
IGZhbHNlPwo+IAo+IFVuZGVyIHdoYXQgY29uZGl0aW9ucyB3b3VsZCB0aGV5IGJlIGRpZmZlcmVu
dD8KPiAKPiBBbmQgaWYgdGhleSdyZSB0aGUgc2FtZSwgdGhlbiB5b3UgY2FuIGp1c3QgdXNlIGA8
YCBpbnN0ZWFkIG9mIGA8PWAsIGFuZAo+IG5vdCBoYXZlIHRvIHdvcnJ5IGFib3V0IGNhc3Rpbmcg
YmVmb3JlIHN1YnRyYWN0aW5nLgoKX2VuZCBpcyBub3QgcGFydCBvZiB0aGUgYmluYXJ5IGJ1dCBw
b2ludHMgb25lIHBhc3QgaXQuIFNvIHRoZXJlIGlzIG5vIGd1YXJhbnRlZSAKdGhpcyBhZGRyZXNz
IHdpbGwgYmUgbWFwcGVkIGluIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuCgpBcyBJIHBvaW50
ZWQgb3V0IGluIG15IHByZXZpb3VzIGUtbWFpbCB0aGUgcmVzdWx0IG9mIHZpcnRfdG9fbWFkZHIo
KSB3aWxsIGJlIAp1bmRlZmluZWQgaW4gdGhpcyBjYXNlLiBPbiBBcm0sIHRoaXMgd2lsbCBhY3R1
YWxseSBjcmFzaCBYZW4uCgpTbyB5b3UgY2FuJ3QgdXNlICc8JyBoZXJlLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
