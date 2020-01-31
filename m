Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBA14E993
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 09:29:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixRdv-0002ds-Io; Fri, 31 Jan 2020 08:27:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixRdu-0002dn-9n
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 08:27:10 +0000
X-Inumbo-ID: 7873c6ce-4403-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7873c6ce-4403-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 08:27:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4840AE06;
 Fri, 31 Jan 2020 08:27:07 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <9a84d6bd-2aa0-e97f-a517-3c51aabdfe27@citrix.com>
 <b898ca9e-d1dd-5091-d182-a3b0c5a7f88e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d961303d-d198-8f46-f0d9-a70e3d4e1b87@suse.com>
Date: Fri, 31 Jan 2020 09:26:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b898ca9e-d1dd-5091-d182-a3b0c5a7f88e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen clocksource and PV shim
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAwNDowMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMzAvMDEvMjAy
MCAyMzoxNCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IEkgd2FzIGRlYnVnZ2luZyBjb25zdGFu
dCBmcmVlemVzIG9mIFBWIHNoaW0gb24gQU1EIGhhcmR3YXJlCj4+IGFmdGVyIGdvaW5nIG91dCBv
ZiBhIGxvbmcgc3VzcGVuZC4KCldoYXQgaXMgInN1c3BlbmQiIGhlcmU/IFMzPyBJZiBzbywgLi4u
Cgo+PiBBcyBpdCB0dXJuZWQgb3V0IHRoZSByb290IGNhdXNlCj4+IG9mIHRoaXMgaXMgcGxhdGZv
cm0gdGltZSBqdW1waW5nIGZvcndhcmQgdG8gdGhlIGFtb3VudCBvZiB0aW1lCj4+IHNwZW50IGlu
IHN1c3BlbmRlZCBzdGF0ZS4gT24gSW50ZWwgdGhpcyBpc3N1ZSBpcyBwYXBlcmVkIG92ZXIKPj4g
YnkgQ09OU1RBTlRfVFNDIGJlaW5nIHNldCB3aGljaCBhdm9pZHMgQ1BVIHRpbWUgc3luYyB3aXRo
Cj4+IHBsYXRmb3JtIHRpbWUuCj4+Cj4+IFVwb24gZnVydGhlciBleGFtaW5hdGlvbiBpdCBhcHBl
YXJzIHRoYXQganVtcGluZyBpcyBiYWtlZAo+PiBpbnRvIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBM
MCBYZW4gYW5kIHRoZXJlIGlzIG5vIHNlZW1pbmdseQo+PiBzdHJhaWdodCBmb3J3YXJkIHdheSB0
byBleHRyYWN0IHN0YWJsZSBjb250aW51b3VzIHJhdGUgb3V0Cj4+IG9mIHdoYXQgd2UgaGF2ZS4K
Pj4KPj4gSSBleHBlY3QgdGhpcyBpcyBhIGtub3duIGlzc3VlIHdpdGggWGVuIFBWIGNsb2NrIGFz
IEkgZm91bmQKPj4gdGhpcyBhbG1vc3QgaW1tZWRpYXRlbHk6IGh0dHBzOi8vd2lraS5kZWJpYW4u
b3JnL1hlbi9DbG9ja3NvdXJjZQo+PiBDdXJyZW50bHkgSSBkb24ndCB1bmRlcnN0YW5kIGhvdyBp
biB0aGF0IGNhc2UgWGVuIGNsb2NrIHNvdXJjZQo+PiBjb3VsZCBiZSBzdWl0YWJsZSBhcyBhIHBs
YXRmb3JtIHRpbWVyIGZvciBuZXN0ZWQgWGVuLgo+Pgo+PiBJcyBteSB1bmRlcnN0YW5kaW5nIG9m
IHRoZSBzaXR1YXRpb24gY29ycmVjdD8gQ291bGQgaXQgYmUKPj4gZml4ZWQgaW4gTDAgWGVuIG9y
IGl0J3MgYWxyZWFkeSBiYWNrZWQgaW50byB0aGUgQUJJPyBTaG91bGQKPj4gd2Uga2VlcCBYZW4g
cGxhdGZvcm0gdGltZXIgaW4gdGhlIHNvdXJjZSBjb2RlIHRoZW4/IERvZXMgdXNpbmcKPj4gYWx0
ZXJuYXRpdmUgY2xvY2sgc291cmNlIGZvciBQViBzaGltIG1ha2Ugc2Vuc2U/Cj4gCj4gLi4uIE9r
LCBJIHNlZW0gdG8gZ2V0IGxvc3QgaW4gdGhlIHdlZWRzIG9mIHRpbWVrZWVwaW5nIGNvZGUgLQo+
IHBsYXRmb3JtIHRpbWVyIGluZnJhc3RydWN0dXJlIGlzIGFscmVhZHkgcHJlcGFyZWQgZm9yIHRo
aXMgc29ydAo+IG9mIHNjZW5hcmlvIHdoaWxlIGV4aXRpbmcgUzMuIEkganVzdCBuZWVkIHRvIGNh
bGwgcmVzdW1lX3BsYXRmb3JtX3RpbWVyKCkKPiBmcm9tIGh5cGVydmlzb3JfcmVzdW1lKCkgb3Ig
c29tZXRoaW5nIHNpbWlsYXIuIFBhdGNoIHdpbGwgZm9sbG93LgoKLi4uIHdoeSB3b3VsZCB0aW1l
X3Jlc3VtZSgpIG5vdCBiZSBjYWxsZWQ/IE9oLCBwdl9zaGltX3NodXRkb3duKCkKdXNlcyBQViBt
ZWNoYW5pc21zIHRvIGRvIHRoZSBzdXNwZW5kL3Jlc3VtZS4gSSB3b25kZXIgd2hhdCBlbHNlLApi
ZXNpZGVzIHRpbWVfcmVzdW1lKCksIGlzIG1pc3NpbmcgdGhlcmUuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
