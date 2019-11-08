Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE74F4D6D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 14:45:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT4X5-0005wQ-Au; Fri, 08 Nov 2019 13:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iT4X3-0005wL-Mw
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 13:42:33 +0000
X-Inumbo-ID: 9c8bcc4a-022d-11ea-a1d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c8bcc4a-022d-11ea-a1d5-12813bfff9fa;
 Fri, 08 Nov 2019 13:42:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B819AB24D;
 Fri,  8 Nov 2019 13:42:30 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
 <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
 <27b45462accc4ababbcbe5aa48ea670c@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dab56edd-3df4-b622-b866-108128c39598@suse.com>
Date: Fri, 8 Nov 2019 14:42:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <27b45462accc4ababbcbe5aa48ea670c@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] max_grant_frames/max_maptrack_frames
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMjAxOSAxMzozMywgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+IFNlbnQ6IDA4IE5vdmVtYmVyIDIwMTkgMTE6MzgKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBk
dXJyYW50QGFtYXpvbi5jb20+Cj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIG1heF9ncmFudF9mcmFtZXMvbWF4X21hcHRyYWNr
X2ZyYW1lcwo+Pgo+PiBPbiAwOC4xMS4yMDE5IDA5OjQ1LCAgRHVycmFudCwgUGF1bCAgd3JvdGU6
Cj4+PiBXaGVuIHBlci1kb21haW4gb3B0aW9ucyBmb3IgbWF4aW11bSBncmFudCBhbmQgbWFwdHJh
Y2sgZnJhbWVzIGNhbWUgaW4KPj4gKGluIDQuMTA/KSBYZW4ncyBiZWhhdmlvdXIgdy5yLnQuIHRv
IHRoZSBnbG9iYWwgY29tbWFuZCBsaW5lIHZhbHVlcwo+PiAoZ250dGFiX21heF9mcmFtZXMgYW5k
IGdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzIHJlc3BlY3RpdmVseSkgcmVncmVzc2VkCj4+Pgo+
Pj4gRm9yIGV4YW1wbGUsIGEgaG9zdCBydW5uaW5nIGEgcHJpb3IgdmVyc2lvbiBvZiBYZW4gd2l0
aCBhIGNvbW1hbmQgbGluZQo+PiBzZXR0aW5nIGdudHRhYl9tYXhfZnJhbWVzPTEyOCB3b3VsZCBo
YXZlIGFsbCBvZiBpdHMgZG9tVXMgcnVubmluZyB3aXRoIDEyOAo+PiBmcmFtZXMuIEhvd2V2ZXIs
IGFmdGVyIHVwZGF0ZSB0byBhIG5ld2VyIFhlbiwgdGhleSB3aWxsIG9ubHkgZ2V0IDMyIGZyYW1l
cwo+PiAodW5sZXNzIHRoZSBob3N0IGlzIHBhcnRpY3VsYXJseSBsYXJnZSwgaW4gd2hpY2ggY2Fz
ZSB0aGV5IHdpbGwgZ2V0IDY0KS4KPj4gV2h5IGlzIHRoaXM/IEl0J3MgYmVjYXVzZSBuZWl0aGVy
IHhsLmNmZyBmaWxlcywgbm9yIHhsLmNvbmYsIHdpbGwgc3BlY2lmeQo+PiB2YWx1ZXMgKGJlY2F1
c2UgdGhlIHNjZW5hcmlvIGlzIGFuIHVwZGF0ZSBmcm9tIGFuIG9sZGVyIGluc3RhbGxhdGlvbikg
YW5kCj4+IHNvIHRoZSBoYXJkY29kZWQgMzIvNjQgZGVmYXVsdCBhcHBsaWVzLiBIZW5jZSBzb21l
IGRvbVVzIHdpdGggbGFyZ2UKPj4gbnVtYmVycyBvZiBQViBkZXZpY2VzIHN0YXJ0IGZhaWxpbmcg
KG9yIGF0IGxlYXN0IHN1YnN0YW50aWFsbHkgc2xvdyBkb3duKQo+PiBhbmQgYWRtaW5zIHN0YXJ0
IHdvbmRlcmluZyB3aGF0J3MgZ29pbmcgb24uCj4+Pgo+Pj4gU28gaG93IGJlc3QgdG8gZml4IHRo
aXM/Cj4+Pgo+Pj4gRm9yIHRoZSBzYWtlIG9mIGEgcXVpY2sgZml4IGZvciB0aGUgcmVncmVzc2lv
biwgYW5kIGVhc2Ugb2YgYmFjay0KPj4gcG9ydGluZywgSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0
IHRvIGFkZCBhIGNoZWNrIGluIGRvbWFpbl9jcmVhdGUoKSBhbmQKPj4gY3JlYXRlIHRoZSBncmFu
dCB0YWJsZSB3aXRoIHBhcmFtZXRlcnMgd2hpY2ggYXJlIHRoZSBsYXJnZXIgb2YgdGhlCj4+IHRv
b2xzdGFjayBjb25maWd1cmVkIHZhbHVlIGFuZCB0aGUgY29ycmVzcG9uZGluZyBjb21tYW5kIGxp
bmUgdmFsdWUuCj4+Cj4+IEhvdyBhYm91dCBwZW9wbGUgc2ltcGx5IHNldHRpbmcgdGhlIHZhbHVl
IGluIHhsLmNvbmYsIGlmIGluZGVlZCBpbiBjYW4gYmUKPj4gc2V0IHRoZXJlPwo+IAo+IEl0IGNv
dWxkIGJlIHNldCB0aGVyZSwgYnV0IHRoYXQncyByZWFsbHkgbm90IHRoZSByaWdodCBzb2x1dGlv
bi4gQSBzZXQgb2YgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMgdGhhdCBhcHByb3ByaWF0ZWx5IGNv
bmZpZ3VyZWQgdGhlIGhvc3Qgb24gYW4gb2xkZXIgWGVuIHJlYWxseSBvdWdodCB0byBjb250aW51
ZSB0byBkbyB0aGUgc2FtZSBhZnRlciBpbnN0YWxsYXRpb24gb2YgdGhlIG5ld2VyIFhlbiwgd2l0
aG91dCBhbnkgYWRkaXRpb25hbCBjb25maWcgcmVxdWlyZW1lbnRzLgoKSSBndWVzcyBpdCBkZXBl
bmRzIG9uIHRoZSBwZXJzcGVjdGl2ZSB5b3UgdGFrZTogV2hpbGUgcXVpdGUgbGlrZWx5IHRoZQpz
aXR1YXRpb24gY291bGQgaGF2ZSBiZWVuIGF2b2lkZWQgaGVyZSwgaXQgb3VnaHQgdG8gYmUgcGVy
bWlzc2libGUgZm9yCnVzIHRvIGRlY2lkZSB0aGF0IHdlIGludGVudGlvbmFsbHkgd2FudCB0byBj
aGFuZ2UgdGhlIG1lYW5pbmcgb2YgYQpjb21tYW5kIGxpbmUgb3B0aW9uICh3aGljaCBpbmNsdWRl
cyBwb3NzaWJseSBpZ25vcmluZyBpdCBpbiBjZXJ0YWluCmNhc2VzKS4gU3VjaCBhIGRlY2lzaW9u
IHdvdWxkIGJldHRlciBiZSBkb2N1bWVudGVkIGluIHRoZSByZWxlYXNlCm5vdGVzLCB5ZXMsIGJ1
dCBpdCBtYXkgc3RpbGwgaW1wbHkgb3RoZXIgYWRqdXN0bWVudHMgZm9yIGhvc3QgYWRtaW5zCnRv
IG1ha2UgZHVyaW5nIGEgdmVyc2lvbiB1cGdyYWRlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
