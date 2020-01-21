Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678D314397D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 10:30:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itpp2-0000IG-WF; Tue, 21 Jan 2020 09:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itpp1-0000IB-Es
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 09:27:43 +0000
X-Inumbo-ID: 450f39bb-3c30-11ea-ba4f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 450f39bb-3c30-11ea-ba4f-12813bfff9fa;
 Tue, 21 Jan 2020 09:27:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 631FEAC79;
 Tue, 21 Jan 2020 09:27:41 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
 <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
 <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
 <d93d5931-6b59-649b-c989-9263c3c9a913@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3f0f684-2520-e7de-870a-7d7be40f66b2@suse.com>
Date: Tue, 21 Jan 2020 10:27:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d93d5931-6b59-649b-c989-9263c3c9a913@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
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

T24gMjEuMDEuMjAyMCAwMDo1MCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMjAuMDEuMjAg
MDk6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNy4wMS4yMDIwIDIwOjA2LCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IE9uIDIwLjEyLjE5IDEwOjUzLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAxOS4xMi4yMDE5IDIyOjA4LCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4+Pj4gT24g
MTguMTIuMTkgMTI6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMTIuMjAxOSAw
MjozMiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+Pj4+Pj4gRGVjb3VwbGUgdGhlIG1pY3JvY29k
ZSByZWZlcmVuY2luZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVCIHRvIHRoYXQKPj4+Pj4+PiB3
aGVuIHVzaW5nIEVGSS4gVGhpcyBhbGxvd3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmllZCBl
ZmZlY3QiIG9mCj4+Pj4+Pj4gdXNpbmcgYDxpbnRlZ2VyPiB8IHNjYW5gIGFsb25nIHhlbi5lZmku
Cj4+Pj4+Pgo+Pj4+Pj4gSSBndWVzcyAidW5zcGVjaWZpZWQgZWZmZWN0IiBpbiB0aGUgZG9jIHdh
cyBwcmV0dHkgcG9pbnRsZXNzIC0gc3VjaAo+Pj4+Pj4gb3B0aW9ucyBoYXZlIGJlZW4gaWdub3Jl
ZCBiZWZvcmU7IGluIGZhY3QgLi4uCj4+Pj4+Pgo+Pj4+Pj4+IFdpdGggdGhhdCwgWGVuIGNhbiBl
eHBsaWNpdGx5Cj4+Pj4+Pj4gaWdub3JlIHRob3NlIG5hbWVkIG9wdGlvbnMgd2hlbiB1c2luZyBF
RkkuCj4+Pj4+Pgo+Pj4+Pj4gLi4uIEkgZG9uJ3Qgc2VlIHRoaW5ncyBiZWNvbWluZyBhbnkgbW9y
ZSBleHBsaWNpdCAobm90IGV2ZW4gcGFyc2luZwo+Pj4+Pj4gdGhlIG9wdGlvbnMgd2FzIHF1aXRl
IGV4cGxpY2l0IHRvIG1lKS4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEkgYWdyZWUgdGhhdCB0aG9zZSBv
cHRpb25zIGhhdmUgYmVlbiBpZ25vcmVkIHNvIGZhciBpbiB0aGUgY2FzZSBvZiBFRkkuCj4+Pj4+
IFRoZSBkb2N1bWVudGF0aW9uIGNvbnRyYWRpY3RzIHRoYXQgaG93ZXZlci4gVGhlIGRvY3VtZW50
YXRpb246Cj4+Pj4+ICogc2F5cyA8aW50ZWdlcj4gaGFzIHVuc3BlY2lmaWVkIGVmZmVjdC4KPj4+
Pj4gKiBkb2VzIG5vdCBtZW50aW9uIGFueXRoaW5nIGFib3V0IHNjYW4gYmVpbmcgaWdub3JlZC4K
Pj4+Pj4KPj4+Pj4gV2l0aCB0aGlzIHBhdGNoLCBpdCBpcyBleHBsaWNpdCBpbiBjb2RlIGFuZCBp
biBkb2N1bWVudGF0aW9uIHRoYXQgYm90aAo+Pj4+PiBvcHRpb25zIGFyZSBpZ25vcmVkIGluIGNh
c2Ugb2YgRUZJLgo+Pj4+Cj4+Pj4gQnV0IGlzbid0IGl0IHJhdGhlciB0aGF0IHVjb2RlPXNjYW4g
Y291bGQgKGFuZCBoZW5jZSBwZXJoYXBzIHNob3VsZCkKPj4+PiBhbHNvIGhhdmUgaXRzIHZhbHVl
IG9uIEVGST8KPj4+Pgo+Pj4KPj4+IEkgZG8gbm90IHNlZSAidWNvZGU9c2NhbiIgYXBwbGljYWJs
ZSBpbiBhbnl3YXkgaW4gdGhlIGNhc2Ugb2YgRUZJLiBJbgo+Pj4gRUZJLCB0aGVyZSBhcmUgbm90
ICJtb2R1bGVzIiB0byBzY2FuIHRocm91Z2gsIGJ1dCByYXRoZXIgdGhlIGVmaSBjb25maWcKPj4+
IHBvaW50cyBleGFjdGx5IHRvIHRoZSBtaWNyb2NvZGUgYmxvYi4KPj4KPj4gV2hhdCB3b3VsZCBi
ZSB3cm9uZyB3aXRoIHRoZSBFRkkgY29kZSB0byBhbHNvIGluc3BlY3Qgd2hhdGV2ZXIgaGFzIGJl
ZW4KPj4gc3BlY2lmaWVkIHdpdGggcmFtZGlzaz0gaWYgdGhlcmUgd2FzIG5vIHVjb2RlPSA/Cj4g
Cj4gSSBzZWUsIGludGVyZXN0aW5nLiBUaGlzIHNvdW5kcyBsaWtlIGEgbGVnaXRpbWF0ZSB1c2Ug
Y2FzZSBpbmRlZWQuIEkgCj4gd29uZGVyLCB3b3VsZCBJIGJlIGJyZWFraW5nIGFueXRoaW5nIGlm
IEkgc2ltcGx5IGFsbG93IHRoZSBleGlzdGluZyBjb2RlIAo+IHRoYXQgaXRlcmF0ZXMgb3ZlciBt
b2R1bGVzIHRvIGtpY2sgaW4gd2hlbiB1Y29kZT1zY2FuIGlycmVzcGVjdGl2ZSBvZiAKPiBFRkkg
b3IgbGVnYWN5IGJvb3Q/CgpJIGRvbid0IHRoaW5rIHNvLCBubywgYnV0IGl0IHdvdWxkIG5lZWQg
ZG91YmxlIGNoZWNraW5nIChhbmQKbWVudGlvbmluZyBpbiB0aGUgZGVzY3JpcHRpb24gYW5kL29y
IGRvY3VtZW50YXRpb24pLgoKPiBBbHNvLCBpdCBzZWVtcyB0byBtZSB0aGF0IHRoZSB1Y29kZT0g
c3BlY2lmaWVkIGJ5IAo+IGVmaS5jZmcgd291bGQgdGFrZSBwcmVjZWRlbmNlIG92ZXIgdGhlIHVj
b2RlPXNjYW4uIERvIG5vdCB5b3UgdGhpbms/CgpJIGd1ZXNzIHdlIG5lZWQgdG8gc2V0dGxlIG9u
IHdoYXQgd2Ugd2FudCB0byB0YWtlIHByZWNlZGVuY2UgYW5kCnRoZW4gbWFrZSBzdXJlIGNvZGUg
YWxzbyBiZWhhdmVzIHRoaXMgd2F5LiBCdXQgeWVzLCBJIHRoaW5rIHVjb2RlPQpmcm9tIHRoZSAu
Y2ZnIHNob3VsZCBzdXBlcnNlZGUgdWNvZGU9c2NhbiBvbiB0aGUgY29tbWFuZCBsaW5lLiBBCnBv
c3NpYmx5IHVzZWZ1bCBhZGp1c3RtZW50IHRvIHRoaXMgbWlnaHQgYmUgdG8gZGlzdGluZ3Vpc2gg
d2hldGhlcgp0aGUgdWNvZGU9c2NhbiB3YXMgaW4gYSBzcGVjaWZpYyAuY2ZnIHNlY3Rpb24gd2hp
bGUgdGhlIHVjb2RlPSB3YXMKaW4gW2dsb2JhbF0gKGkuZS4gc29ydCBvZiBhIGRlZmF1bHQpLCBp
biB3aGljaCBjYXNlIG1heWJlIHRoZQp1Y29kZT1zY2FuIHNob3VsZCB3aW4uIFRob3VnaHRzPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
