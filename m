Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA27FCAAD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 17:22:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVHrd-0002sH-EZ; Thu, 14 Nov 2019 16:20:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVHrb-0002sC-Vg
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 16:20:56 +0000
X-Inumbo-ID: bb1c43a2-06fa-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb1c43a2-06fa-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 16:20:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6634FAF6A;
 Thu, 14 Nov 2019 16:20:53 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-144091-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29c593c2-0621-4f93-5074-d2d568ead829@suse.com>
Date: Thu, 14 Nov 2019 17:21:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <osstest-144091-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 144091: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxNjo1Miwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDQwOTEgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDA5MS8KPiAKPiBSZWdyZXNzaW9ucyA6LSgK
PiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNs
dWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1pMzg2LXhs
LXFlbXV1LWRtcmVzdHJpY3QtYW1kNjQtZG1yZXN0cmljdCAxMiBndWVzdC1zdGFydC9kZWJpYW5o
dm0ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDE0NDA0Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXFlbXV1
LW5lc3RlZC1pbnRlbCAxNyBkZWJpYW4taHZtLWluc3RhbGwvbDEvbDIgZmFpbCBSRUdSLiB2cy4g
MTQ0MDQyCgpJJ3ZlIHRha2VuIGFub3RoZXIgbG9vaywgYW5kIEkgbm93IHRoaW5rIHRoZSBMMiBn
dWVzdCBkb2Vzbid0IGV2ZW4KbWFrZSBpdCB0byB0aGUgYm9vdGxvYWRlci4gVGFraW5nIHRvZ2V0
aGVyCgooZDEpIFNlYUJJT1MgKHZlcnNpb24gcmVsLTEuMTIuMS0wLWdhNWNhYjU4LVhlbikKKGQx
KSBCVUlMRDogZ2NjOiAoRGViaWFuIDYuMy4wLTE4K2RlYjl1MSkgNi4zLjAgMjAxNzA1MTYgYmlu
dXRpbHM6IChHTlUgQmludXRpbHMgZm9yIERlYmlhbikgMi4yOAooZDEpIAooZDEpIEZvdW5kIFhl
biBoeXBlcnZpc29yIHNpZ25hdHVyZSBhdCA0MDAwMDAwMAooZDEpIFJ1bm5pbmcgb24gUUVNVSAo
aTQ0MGZ4KQooZDEpIHhlbjogY29weSBlODIwLi4uCihkMSkgUmVsb2NhdGluZyBpbml0IGZyb20g
MHgwMDBkN2MyMCB0byAweDJmN2FiZDgwIChzaXplIDgyNDAwKQoKYW5kCgooWEVOKSAqKioqKioq
KioqKiBWTUNTIEFyZWFzICoqKioqKioqKioqKioqCihYRU4pIAooWEVOKSA+Pj4gRG9tYWluIDEg
PDw8CihYRU4pIAlWQ1BVIDAKKFhFTikgKioqIEd1ZXN0IFN0YXRlICoqKgooWEVOKSBDUjA6IGFj
dHVhbD0weDAwMDAwMDAwMDAwMDAwMzEsIHNoYWRvdz0weDAwMDAwMDAwMDAwMDAwMTEsIGdoX21h
c2s9ZmZmZmZmZmZmZmZmZmZmZgooWEVOKSBDUjQ6IGFjdHVhbD0weDAwMDAwMDAwMDAwMDIwNTAs
IHNoYWRvdz0weDAwMDAwMDAwMDAwMDAwMDAsIGdoX21hc2s9ZmZmZmZmZmZmZmY4Zjg3MAooWEVO
KSBDUjMgPSAweDAwMDAwMDAwMDA0MDAwMDAKKFhFTikgUlNQID0gMHgwMDAwMDAwMDAwMDA2ZmE0
ICgweDAwMDAwMDAwMDAwMDZmYTQpICBSSVAgPSAweDAwMDAwMDAwMmY3YmE5ZjQgKDB4MDAwMDAw
MDAyZjdiYTlmNCkKCmFuZCBzaW1pbGFybHkgaW4gdGhlIEwwIGxvZwoKKFhFTikgUlNQID0gMHgw
MDAwMDAwMDAwMDA2ZmE0ICgweDAwMDAwMDAwMDAwMDZmYTQpICBSSVAgPSAweDAwMDAwMDAwMmY3
YmE5ZjQgKDB4MDAwMDAwMDAyZjdiYTlmNCkKCkkgaW5zdGVhZCB0aGluayBpdCdzIHN0aWxsIGlu
IFNlYUJJT1MgY29kZS4gSSdsbCBzZWUgaWYgSSBjYW4KZGVyaXZlIHdoZXJlIGV4YWN0bHkgaXQn
cyBzaXR0aW5nLiBJbiBhbnkgZXZlbnQgdGhlIG1vc3QgcmVjZW50CmV4aXQgcmVhc29uIHRvIEww
IHdhcyBFUFRfVklPTEFUSU9OIHdpdGggYSBxdWFsaWZpY2F0aW9uIG9mIDB4MTljCihmZXRjaCwg
ZWZmX3JlYWQsIGVmZl93cml0ZSwgZ2xhX3ZhbGlkLCBnbGFfZmF1bHQpLCB3aGljaCBJIGRvbid0
CnRoaW5rIHdvdWxkIGFsbG93IHRoZSBndWVzdCB0byBjb250aW51ZSB3aXRob3V0IGFuIGFkanVz
dG1lbnQgdG8KaXRzIEVQVCBwZXJtaXNzaW9ucy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
