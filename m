Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC8713127A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 14:03:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioS0V-0003ZJ-SS; Mon, 06 Jan 2020 13:01:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ioS0U-0003Z7-LP
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 13:01:18 +0000
X-Inumbo-ID: 967e0df6-3084-11ea-ab01-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 967e0df6-3084-11ea-ab01-12813bfff9fa;
 Mon, 06 Jan 2020 13:01:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 380E6AF33;
 Mon,  6 Jan 2020 13:01:00 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1577733361.git.lars.kurth@citrix.com>
 <1bf177593fcea64b0386a13cdabae24fb0d3cb96.1577733361.git.lars.kurth@citrix.com>
 <d7b5a168-f11f-32f4-08fc-3e4c2aeb70fa@suse.com>
 <3993E270-A44B-4131-9BD9-E3E58C51D8D3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a44c7bac-0e85-46b9-4db9-35ca7a803c99@suse.com>
Date: Mon, 6 Jan 2020 14:00:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3993E270-A44B-4131-9BD9-E3E58C51D8D3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/7] Added Resolving Disagreement
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAgMTM6NTQsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g77u/T24gMDYvMDEv
MjAyMCwgMDc6MjUsICJKw7xyZ2VuIEdyb8OfIiA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAK
PiAgICAgID4rIyMgSXNzdWU6IFNtYWxsIGZ1bmN0aW9uYWwgaXNzdWVzCj4gICAgICA+Kwo+ICAg
ICAgPitUaGUgbW9zdCBjb21tb24gYXJlYSBvZiBkaXNhZ3JlZW1lbnRzIHdoaWNoIGhhcHBlbiBp
biBjb2RlIHJldmlld3MsIGFyZQo+ICAgICAgPitkaWZmZXJpbmcgb3BpbmlvbnMgb24gd2hldGhl
ciBzbWFsbCBmdW5jdGlvbmFsIGlzc3VlcyBpbiBhIHBhdGNoIHNlcmllcyBoYXZlIHRvCj4gICAg
ICA+K2JlIHJlc29sdmVkIG9yIG5vdCBiZWZvcmUgdGhlIGNvZGUgaXMgcmVhZHkgdG8gYmUgc3Vi
bWl0dGVkLiBTdWNoIGRpc2FncmVlbWVudHMKPiAgICAgID4rYXJlIHR5cGljYWxseSBjYXVzZWQg
YnkgZGlmZmVyZW50IGV4cGVjdGF0aW9ucyByZWxhdGVkIHRvIHRoZSBsZXZlbCBvZgo+ICAgICAg
PitwZXJmZWN0aW9uIGEgcGF0Y2ggc2VyaWVzIG5lZWRzIHRvIGZ1bGZpbCBiZWZvcmUgaXQgY2Fu
IGJlIGNvbnNpZGVyZWQgcmVhZHkgdG8KPiAgICAgIAo+ICAgICAgcy9mdWxmaWwvZnVsZmlsbC8K
PiAgICAgIAo+ICAgICAgPitiZSBjb21taXR0ZWQuCj4gICAgICA+Kwo+ICAgICAgPitUbyBleHBs
YWluIHRoaXMgYmV0dGVyLCBJIGFtIGdvaW5nIHRvIHVzZSB0aGUgYW5hbG9neSBvZiBzb21lIGJ1
aWxkaW5nIHdvcmsgdGhhdAo+ICAgICAgPitoYXMgYmVlbiBwZXJmb3JtZWQgYXQgeW91ciBob3Vz
ZS4gTGV0J3Mgc2F5IHRoYXQgeW91IGhhdmUgYSBuZXcgYmF0aHJvb20KPiAgICAgID4raW5zdGFs
bGVkLiBCZWZvcmUgcGF5aW5nIHlvdXIgYnVpbGRlciB0aGUgbGFzdCBpbnN0YWxtZW50LCB5b3Ug
cGVyZm9ybSBhbgo+ICAgICAgCj4gICAgICBzL2luc3RhbG1lbnQvaW5zdGFsbG1lbnQvCj4gCj4g
SGkgSnVlcmdlbjogdGhhbmsgeW91IGZvciBwb2ludGluZyBvdXQgdGhlIHJlbWFpbmluZyB0eXBv
cy4KPiAKPiBJIGZpeGVkIHRoZXNlIGluIG15IGxvY2FsIHRyZWUsIHdpdGggdGhlIGV4Y2VwdGlv
biBvZiB0aGUgdHdvIGluc3RhbmNlcyBhYm92ZS4KPiAKPiBUaGUgdHdvIGlzc3VlcyBhYm92ZSBj
b21lIGRvd24gdG8gVVMgdnMgbm9uLVVTIEVuZ2xpc2gKPiAKPiBodHRwczovL2dyYW1tYXJpc3Qu
Y29tL3NwZWxsaW5nL2Z1bGZpbC1mdWxmaWxsLwo+IGh0dHBzOi8vZ3JhbW1hcmlzdC5jb20vc3Bl
bGxpbmcvaW5zdGFsbG1lbnQtaW5zdGFsbWVudC8KPiAKPiBJIGRpZG4ndCByZWFsbHkgcmV2aWV3
IHRoZSBkb2N1bWVudCBmb3IgY29uc2lzdGVuY3kgd2l0aCByZXNwZWN0IHRvIGEgcGFydGljdWxh
ciBzdHlsZSBvZiBFbmdsaXNoIHNwZWxsaW5nLgo+IEl0IGRvZXMgc2VlbSB0aG91Z2ggdGhhdCBu
b3JtYWxseSBJIHVzZSBVUyBzcGVsbGluZyAoZS5nLiBtaW5pbWl6ZSkgbW9zdGx5IGFuZCBvZiBj
b3Vyc2UgdGhlIENvbnRyaWJ1dG9yCj4gQ292ZW5hbnQgaGFzIGJlZW4gd3JpdHRlbiBVUyBzcGVs
bGluZy4KPiAKPiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgdmlldyBlaXRoZXIgd2F5IGFuZCBjYW4g
aGF2ZSBhIGdvIGF0IG1ha2luZyBpdCBjb25zaXN0ZW50IChlLmcuIGluIFVTIHN0eWxlc3BlbGxp
bmcpCgpJJ20gbm90IHJlYWxseSBmZWVsaW5nIHN0cm9uZyBoZXJlLCBidXQgSSB0aGluayBjb25z
aXN0ZW5jeQpzaG91bGQgYmUgdGhlIHByZWZlcnJlZCB3YXkgdG8gZ28uCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
