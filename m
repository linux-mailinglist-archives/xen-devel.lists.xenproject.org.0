Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA14CFEB7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 18:15:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHs6f-0000fF-2X; Tue, 08 Oct 2019 16:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHs6d-0000fA-27
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 16:12:59 +0000
X-Inumbo-ID: 7e18efe0-e9e6-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e18efe0-e9e6-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 16:12:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94B06AE61;
 Tue,  8 Oct 2019 16:12:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <osstest-142383-mainreport@xen.org>
 <b155b2f9-9664-7366-cdd0-10fac5c3ab3b@suse.com>
 <20191008111530.GD66437@Air-de-Roger>
 <ccad4619-0366-a117-28ba-0e4eccd550b3@suse.com>
Message-ID: <cda5e87c-d911-dab5-6555-1b3dfd94571c@suse.com>
Date: Tue, 8 Oct 2019 18:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ccad4619-0366-a117-28ba-0e4eccd550b3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 142383: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxMzozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDguMTAuMjAxOSAx
MzoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+IE9uIFR1ZSwgT2N0IDA4LCAyMDE5IGF0
IDEyOjQyOjI1UE0gKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAwNy4xMC4xOSAy
Mjo1Niwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+Pj4+IGZsaWdodCAxNDIzODMgeGVu
LXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4+Pj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9sb2dzLzE0MjM4My8KPj4+Pgo+Pj4+IFJlZ3Jlc3Npb25zIDotKAo+Pj4+
Cj4+Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+Pj4g
aW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4+Pj4gICB0ZXN0LWFtZDY0
LWFtZDY0LWxpYnZpcnQtcGFpciAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9ob3N0IGZh
aWwgUkVHUi4gdnMuIDE0MTgyMgo+Pj4+ICAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAy
MiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9ob3N0IGZhaWwgUkVHUi4gdnMuIDE0MTgyMgo+
Pj4KPj4+IEhtbSwgdGVzdCBsb2cgc2F5cyB0aGUgZ3Vlc3QgZGlkbid0IHN1c3BlbmQuCj4+Pgo+
Pj4gQ291bGQgdGhhdCBiZSByZWxhdGVkIHRvIGNvbW1pdCBiMTgzZTE4MGJjZTkzMDMgPwo+Pgo+
PiBUaGUgbGlidmlydCBsaWJ4bCBkYWVtb24gc3BpdHM6Cj4+Cj4+IDIwMTktMTAtMDcgMTI6MzE6
MDkuOTUzKzAwMDA6IGxpYnhsLXNhdmUtaGVscGVyOiBzdGFydGluZyBzYXZlOiBTdWNjZXNzCj4+
IDIwMTktMTAtMDcgMTI6MzE6MDkuOTUzKzAwMDA6IHhjOiBmZCA0MCwgZG9tIDEsIGZsYWdzIDEs
IGh2bSAwCj4+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTU0KzAwMDA6IHhjOiBTYXZpbmcgZG9tYWlu
IDEsIHR5cGUgeDg2IFBWCj4+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTU0KzAwMDA6IHhjOiA2NCBi
aXRzLCA0IGxldmVscwo+PiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1OSswMDAwOiB4YzogbWF4X21m
biAweDI4MDAwMAo+PiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1OSswMDAwOiB4YzogcDJtIGxpc3Qg
ZnJvbSAweGZmZmZjOTAwMDAwMDAwMDAgdG8gMHhmZmZmYzkwMDAwMGZmZmZmLCByb290IGF0IDB4
MjdkZTBhCj4+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTU5KzAwMDA6IHhjOiBtYXhfcGZuIDB4MWZm
ZmYsIHAybV9mcmFtZXMgMjU2Cj4+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTYwKzAwMDA6IHhjOiBG
YWlsZWQgdG8gZW5hYmxlIGxvZ2RpcnR5OiAyMiwwLDIyICgyMiA9IEludmFsaWQgYXJndW1lbnQp
OiBJbnRlcm5hbCBlcnJvcgo+PiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk2MCswMDAwOiB4YzogU2F2
ZSBmYWlsZWQgKDIyID0gSW52YWxpZCBhcmd1bWVudCk6IEludGVybmFsIGVycm9yCj4+IDIwMTkt
MTAtMDcgMTI6MzE6MDkuOTgxKzAwMDA6IGxpYnhsLXNhdmUtaGVscGVyOiBjb21wbGV0ZSByPS0x
OiBJbnZhbGlkIGFyZ3VtZW50Cj4+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTgzKzAwMDA6IGxpYnhs
OiBsaWJ4bC5jOjc1MjpsaWJ4bF9fZmRfZmxhZ3NfcmVzdG9yZTogZm5jdGwgRl9TRVRGTCBvZiBm
ZCA0MCB0byAweDIKPj4gMjAxOS0xMC0wNyAxMjozMTowOS45ODMrMDAwMDogbGlieGw6IGxpYnhs
X2V2ZW50LmM6MTg3MzpsaWJ4bF9fYW9fY29tcGxldGU6IGFvIDB4N2Y3NjBjMDAyMTEwOiBjb21w
bGV0ZSwgcmM9LTgKPj4gMjAxOS0xMC0wNyAxMjozMTowOS45ODMrMDAwMDogbGlieGw6IGxpYnhs
X2V2ZW50LmM6MTg0MjpsaWJ4bF9fYW9fX2Rlc3Ryb3k6IGFvIDB4N2Y3NjBjMDAyMTEwOiBkZXN0
cm95Cj4+Cj4+IFdoaWNoIHNlZW0gdG8gYmUgcmVsYXRlZCB0byB0aGUgcmVjZW50IGlvbW11IGNo
YW5nZXMsIEkgd291bGQgc2F5IGl0J3MKPj4gbGlrZWx5IGhpdHRpbmcgdGhlIGlzX2lvbW11X2Vu
YWJsZWQgY2hlY2sgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUKPj4gYW5kIGhlbmNlIHJldHVy
bmluZyBFSU5WQUwuCj4+Cj4+IEFkZGluZyBQYXVsIGFuZCBKYW4gd2hvIHdvcmtlZCBvbiB0aGUg
c2VyaWVzLgo+IAo+IFdlbGwsIGFzIG1lbnRpb25lZCBpbiByZXBseSB0byBQYXVsJ3MgcGF0Y2gg
ZWFybGllciB0b2RheSwgSSBpbnRlbmQKPiB0byBjb21taXQgdGhlIGFncmVlZCB1cG9uIGhhbGYg
b2YgaXQgbGF0ZXIgdG9kYXkuCgpBY3R1YWxseSBJIGNhbid0IC0gdGhlIHBhdGNoIHdhbnRzIGFu
IGFjayBmcm9tIEdlb3JnZSBmaXJzdC4gSSd2ZQpzdWJtaXR0ZWQgdjMgZm9yIHRoaXMgcmVhc29u
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
