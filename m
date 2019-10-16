Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EFD8E03
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgas-0000cb-SR; Wed, 16 Oct 2019 10:31:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKgas-0000cW-68
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:31:50 +0000
X-Inumbo-ID: 287349bc-f000-11e9-93ad-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 287349bc-f000-11e9-93ad-12813bfff9fa;
 Wed, 16 Oct 2019 10:31:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABE1B28;
 Wed, 16 Oct 2019 03:31:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3DC03F6C4;
 Wed, 16 Oct 2019 03:31:45 -0700 (PDT)
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
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1531968b-6657-14b4-c740-85995f21b521@arm.com>
Date: Wed, 16 Oct 2019 11:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f7be099-158d-e10b-7934-19c7fd9e9c75@citrix.com>
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

SGkgR2VvcmdlLAoKT24gMTYvMTAvMjAxOSAxMToyMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biAxMC8xNi8xOSAxMToxOCBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IFN0ZWZhbm8gU3RhYmVs
bGluaSB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEzXSB4ZW4vYXJtOiBEb24ndCB1c2UgX2Vu
ZCBpbiBpc194ZW5fZml4ZWRfbWZuKCkiKToKPj4+IE15IHN1Z2dlc3Rpb24gaXMgZ29pbmcgdG8g
d29yazogInRoZSBjb21waWxlciBzZWVzIHRocm91Z2ggY2FzdHMiCj4+PiByZWZlcnJlZCB0byBj
b21wYXJpc29ucyBiZXR3ZWVuIHBvaW50ZXJzLCB3aGVyZSB3ZSB0ZW1wb3JhcmlseSBjYXN0ZWQK
Pj4+IGJvdGggcG9pbnRlcnMgdG8gaW50ZWdlcnMgYW5kIGJhY2sgdG8gcG9pbnRlcnMgdmlhIGEg
TUFDUk8uIFRoYXQgY2FzZQo+Pj4gd2FzIGlmZnkgYmVjYXVzZSB0aGUgTUFDUk8gd2FzIGNsZWFy
bHkgYSB3b3JrYXJvdW5kIHRoZSBzcGVjLgo+Pj4KPj4+IEhlcmUgdGhlIHNpdHVhdGlvbiBpcyBk
aWZmZXJlbnQuIEZvciBvbmUsIHdlIGFyZSBkb2luZyBhcml0aG1ldGljLiBBbHNvCj4+PiB2aXJ0
X3RvX21hZGRyIGFscmVhZHkgdGFrZXMgYSB2YWRkcl90IGFzIGFyZ3VtZW50LiBTbyBpbnN0ZWFk
IG9mIGRvaW5nCj4+PiBwb2ludGVycyBhcml0aG1ldGljLCB0aGVuIGNvbnZlcnRpbmcgdG8gdmFk
ZHJfdCwgd2UgYXJlIGNvbnZlcnRpbmcgdG8KPj4+IHZhZGRyX3QgZmlyc3QsIHRoZW4gZG9pbmcg
YXJpdGhtZXRpY3MsIHdoaWNoIGlzIGZpbmUgYm90aCBmcm9tIGEgQzk5Cj4+PiBwb2ludCBvZiB2
aWV3IGFuZCBldmVuIGEgTUlTUkEgQyBwb2ludCBvZiB2aWV3LiBJIGNhbid0IHNlZSBhIHByb2Js
ZW0KPj4+IHdpdGggdGhhdC4gSSBhbSBzdXJlIGFzIEkgcmVhc29uYWJsZSBjYW4gYmUgOi0pCj4+
Cj4+IEZUQU9EIEkgdGhpbmsgeW91IGFyZSBzdWdnZXN0aW5nIHRoaXM6Cj4+ICAgLSArICAgICAo
bWZuX3RvX21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihfZW5kIC0gMSkpKQo+PiAgICsgKyAg
ICAgKG1mbl90b19tYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFkZHIoKCh2YWRkcl90KV9lbmQgLSAx
KSkpCj4+Cj4+IHZpcnRfdG9fbWFkZHIodmEpIGlzIGEgbWFjcm8gd2hpY2ggZXhwYW5kcyB0bwo+
PiAgICAgX192aXJ0X3RvX21hZGRyKCh2YWRkcl90KSh2YSkpCj4+Cj4+IFNvIHdoYXQgaXMgaGFw
cGVuaW5nIGhlcmUgaXMgdGhhdCB0aGUgY2FzdCB0byBhbiBpbnRlZ2VyIHR5cGUgaXMgYmVpbmcK
Pj4gZG9uZSBiZWZvcmUgdGhlIHN1YnRyYWN0aW9uLgo+Pgo+PiBXaXRob3V0IHRoZSBjYXN0LCB5
b3UgYXJlIGNhbGN1bGF0aW5nIHRoZSBwb2ludGVyIHZhbHVlIF9lbmQtMSBmcm9tCj4+IHRoZSB2
YWx1ZSBfZW5kLCB3aGljaCBpcyBVQi4gIFdpdGggdGhlIGNhc3QgeW91IGFyZSBjYWxjdWxhdGlu
ZyBhbgo+PiBpbnRlZ2VyIHZhbHVlLiAgdmFkZHJfdCBpcyB1bnNpZ25lZCwgc28gYWxsIGFyaXRo
bWV0aWMgb3BlcmF0aW9ucyBhcmUKPj4gZGVmaW5lZC4gIE5vdGhpbmcgY2FzdHMgdGhlIHJlc3Vs
dCBiYWNrIHRvIHRoZSAiZm9yYmlkZGVuIiAod2l0aCB0aGlzCj4+IHByb3ZlbmFuY2UpIHBvaW50
ZXIgdmFsdWUsIHNvIGFsbCBpcyB3ZWxsLgo+Pgo+PiAoV2l0aCB0aGUgbWFjcm8gZXhwYW5zaW9u
IHRoZSBjYXN0IGhhcHBlbnMgdHdpY2UuICBUaGlzIGlzIHByb2JhYmx5Cj4+IGJldHRlciB0aGFu
IHVzaW5nIF9fdmlydF90b19tYWRkciBoZXJlLikKPj4KPj4gSWUsIGluIHRoaXMgY2FzZSBJIGFn
cmVlIHdpdGggU3RlZmFuby4gIFRoZSBjYXN0IGlzIGJvdGggbmVjZXNzYXJ5IGFuZAo+PiBzdWZm
aWNpZW50Lgo+IAo+IE1heWJlIEkgbWlzc2VkIHNvbWV0aGluZywgYnV0IHdoeSBhcmUgd2UgdXNp
bmcgYDw9YCBhdCBhbGw/ICBXaHkgbm90IHVzZQo+IGA8YD8KPiAKPiBPciBpcyB0aGlzIHNvbWUg
d2VpcmQgQyBwb2ludGVyIGNvbXBhcmlzb24gVUIgdGhpbmc/CgpfZW5kIG1heSBub3QgYmUgbWFw
cGVkIGluIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuIFRoaXMgaXMgdGhlIGNhc2Ugd2hlbiB0
aGUgCnNpemUgb2YgWGVuIGlzIHBhZ2UtYWxpZ25lZC4gU28gX2VuZCB3aWxsIHBvaW50IHRvIHRo
ZSBuZXh0IHBhZ2UuCgp2aXJ0X3RvX21hZGRyKCkgY2Fubm90IGZhaWwgc28gaXQgc2hvdWxkIG9u
bHkgYmUgY2FsbGVkIG9uIHZhbGlkIHZpcnR1YWwgCmFkZHJlc3MuIFRoZSBiZWhhdmlvciBpcyB1
bmRlZmluZWQgaW4gYWxsIHRoZSBvdGhlciBjYXNlcy4KCk9uIHg4NiwgeW91IG1pZ2h0IGJlIGFi
bGUgdG8gZ2V0IGF3YXkgYmVjYXVzZSB5b3UgdHJhbnNsYXRlIHRoZSB2aXJ0dWFsIGFkZHJlc3Mg
CnRvIHBoeXNpY2FsIGFkZHJlc3MgaW4gc29mdHdhcmUuCgpPbiBBcm0sIHdlIGFyZSB1c2luZyB0
aGUgaGFyZHdhcmUgaW5zdHJ1Y3Rpb24gdG8gZG8gdGhlIHRyYW5zbGF0aW9uLiBBcyBfZW5kIGlz
IApub3QgYWx3YXlzIG1hcHBlZCwgdGhlbiB0aGUgdHJhbnNsYXRpb24gbWF5IGZhaWwuIEluIG90
aGVyIHdvcmQsIFhlbiB3aWxsIGNyYXNoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
