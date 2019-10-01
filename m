Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DEEC311B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFBP-0002Uc-Lv; Tue, 01 Oct 2019 10:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFFBN-0002Tp-VT
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:15:01 +0000
X-Inumbo-ID: 53d38950-e434-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 53d38950-e434-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 10:15:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18B70B1B2;
 Tue,  1 Oct 2019 10:15:00 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
Date: Tue, 1 Oct 2019 12:15:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMTozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMDoxOQo+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUKPj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBXZWkgTGl1Cj4+
IDx3bEB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEz
XSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24KPj4KPj4gT24gMDEuMTAu
MjAxOSAxMDo1MiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNl
bnQ6IDAxIE9jdG9iZXIgMjAxOSAwOTo0Ngo+Pj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPgo+Pj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9u
bmUKPj4+PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGNpdHJpeC5jb20+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Owo+PiBXZWkK
Pj4+PiBMaXUgPHdsQHhlbi5vcmc+Cj4+Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SC1mb3ItNC4xM10geDg2L21tOiBkb24ndCBuZWVkbGVzc2x5IHZldG8gbWlncmF0aW9uCj4+Pj4K
Pj4+PiBPbiAwMS4xMC4yMDE5IDEwOjI4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+IE5vdyB0
aGF0IHhsLmNmZyBoYXMgYW4gb3B0aW9uIHRvIGV4cGxpY2l0bHkgZW5hYmxlIElPTU1VIG1hcHBp
bmdzIGZvciBhCj4+Pj4+IGRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9l
ZCBkdWUgdG8gdGhlIGNoZWNrIG9mCj4+Pj4+IGlzX2lvbW11X2VuYWJsZWQoKSBpbiBwYWdpbmdf
bG9nX2RpcnR5X2VuYWJsZSgpLgo+Pj4+PiBUaGVyZSBpcyBhY3R1YWxseSBubyBuZWVkIHRvIHBy
ZXZlbnQgbG9nZGlydHkgZnJvbSBiZWluZyBlbmFibGVkIHVubGVzcwo+Pj4+PiBkZXZpY2VzIGFy
ZSBhc3NpZ25lZCB0byBhIGRvbWFpbiBhbmQgdGhhdCBkb21haW4gaXMgc2hhcmluZyBIQVAgbWFw
cGluZ3MKPj4+Pj4gd2l0aCB0aGUgSU9NTVUgKGluIHdoaWNoIGNhc2UgZGlzYWJsaW5nIHdyaXRl
IHBlcm1pc3Npb25zIGluIHRoZSBQMk0gbWF5Cj4+Pj4+IGNhdXNlIERNQSBmYXVsdHMpLgo+Pj4+
Cj4+Pj4gQnV0IHRoYXQncyB0YWtpbmcgaW50byBhY2NvdW50IG9ubHkgaGFsZiBvZiB0aGUgcmVh
c29uIG9mIHRoZQo+Pj4+IGV4Y2x1c2lvbi4gVGhlIG90aGVyIGhhbGYgaXMgdGhhdCBhc3NpZ25l
ZCBkZXZpY2VzIG1heSBjYXVzZSBwYWdlcwo+Pj4+IHRvIGJlIGRpcnRpZWQgYmVoaW5kIHRoZSBi
YWNrIG9mIHRoZSBsb2ctZGlydHkgbG9naWMuCj4+Pgo+Pj4gQnV0IHRoYXQncyBubyByZWFzb24g
dG8gdmV0byBsb2dkaXJ0eS4gU29tZSBkZXZpY2VzIGhhdmUgZHJpdmVycyAoaW4gZG9tMCkKPj4+
IHdoaWNoIGNhbiBleHRyYWN0IERNQSBkaXJ0eWluZyBpbmZvcm1hdGlvbiBhbmQgc2V0IGRpcnR5
IHRyYWNraW5nCj4+PiBpbmZvcm1hdGlvbiBhcHByb3ByaWF0ZWx5Lgo+Pgo+PiBJdCBzdGlsbCBu
ZWVkcyBhIHBvc2l0aXZlIGlkZW50aWZpY2F0aW9uIHRoZW46IFN1Y2ggZHJpdmVycyBzaG91bGQg
dGVsbAo+PiBYZW4gZm9yIHdoaWNoIHNwZWNpZmljIGRldmljZXMgc3VjaCBpbmZvcm1hdGlvbiBp
cyBnb2luZyB0byBiZSBwcm92aWRlZC4KPiAKPiBXaHkgZG9lcyB0aGUgaHlwZXJ2aXNvciBuZWVk
IGhhdmUgdGhlIHJpZ2h0IG9mIHZldG8gdGhvdWdoPyBTdXJlbHkgaXQgaXMKPiB0aGUgdG9vbHN0
YWNrIHRoYXQgc2hvdWxkIGRlY2lkZSB3aGV0aGVyIGEgVk0gaXMgbWlncmF0YWJsZSBpbiB0aGUK
PiBwcmVzZW5jZSBvZiBhc3NpZ25lZCBoL3cuIFhlbiBuZWVkIG9ubHkgYmUgY29uY2VybmVkIHdp
dGggdGhlIGludGVncml0eQo+IG9mIHRoZSBob3N0LCB3aGljaCBpcyB3aHkgdGhlIGNoZWNrIGZv
ciBFVFAgc2hhcmluZyByZW1haW5zLgoKV2hpbGUgdGhlIHRvb2wgc3RhY2sgaXMgdG8gZGVjaWRl
LCB0aGUgaHlwZXJ2aXNvciBpcyBleHBlY3RlZCB0byBndWFyYW50ZWUKY29ycmVjdCBkYXRhIGNv
bWluZyBiYWNrIGZyb20gWEVOX0RPTUNUTF9TSEFET1dfT1Bfe1BFRUssQ0xFQU59LgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
