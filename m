Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71C74E0A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:19:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqcfk-0001Dx-5I; Thu, 25 Jul 2019 12:16:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HEBQ=VW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqcfi-0001Ds-M9
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:16:34 +0000
X-Inumbo-ID: 0a653dd8-aed6-11e9-b022-9f1c50dd6a70
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a653dd8-aed6-11e9-b022-9f1c50dd6a70;
 Thu, 25 Jul 2019 12:16:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE8C128;
 Thu, 25 Jul 2019 05:16:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA9F33F71F;
 Thu, 25 Jul 2019 05:16:31 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
References: <8d0e9ac7-0b27-8690-a3a6-41900b4028a7@arm.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com>
Date: Thu, 25 Jul 2019 13:16:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d0e9ac7-0b27-8690-a3a6-41900b4028a7@arm.com>
Content-Language: en-US
Subject: [Xen-devel] [xen-summit-2019] Virtio Design Session
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Juergen Gross <jgross@suse.com>,
 "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpTb3JyeSBJIGZvcmdvdCB0aGUgQ0MgeGVuLWRldmVsLgoKT24gMjUvMDcvMjAxOSAxMzox
NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBJIGRvbid0IGhhdmUgdGhlIGUt
bWFpbCBhZGRyZXNzIG9mIGFsbCB0aGUgYXR0ZW5kZWVzLiBGZWVsIGZyZWUgdG8gQ0MvZm9yd2Fy
ZCB0byAKPiBhbnlvbmUgdGhhdCBzaG91bGQgYmUgaW52b2x2ZWQuCj4gCj4gRmlyc3QgYWxsIHRo
YW5rIHlvdSBBcnRlbSBmb3IgdGFraW5nIHRoZSBub3Rlcy4gSSB0cmllZCB0byBzdW1tYXJpemUg
dGhlbSBiZWxvdy4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbWlzc2VkIGFueXRoaW5nIG9y
IHdyb25nbHkgc3VtbWFyaXplZC4KPiAKPiBUaGVyZSB3YXMgc29tZSBpbnRlcmVzdCB0byBnZXQg
dmlydGlvIHJ1bm5pbmcgb24gWGVuLiBUaGUgc2NvcGUgd2FzIEhWTS9QVkgvQVJNIAo+IGd1ZXN0
cyBzbyBleGlzdGluZyB0cmFuc3BvcnQgKE1NSU8vUENJKSBjYW4gYmUgcmUtdXNlZC4KPiAKPiBU
aGUgdG9waWNzIGRpc2N1c3NlZCB3ZXJlOgo+IAo+ICDCoMKgICogUmVzdHJpY3RpbmcgdmlydGlv
IGJhY2tlbmQgZm9yIGd1ZXN0IG1lbW9yeSBhY2Nlc3MKPiAKPiBBdCB0aGUgbW9tZW50LCB2aXJ0
aW8gYmFja2VuZCBoYXMgZnVsbCBhY2Nlc3MgdG8gdGhlIGd1ZXN0IG1lbW9yeS4gU29tZSAKPiBz
dGFrZWhvbGRlcnMgdXNpbmcgWGVuIChvciBvdGhlciBoeXBlcnZpc29ycykgYXJlIGNvbmNlcm4g
YWJvdXQgdGhlIHNlY3VyaXR5IAo+IGltcGFjdC4gVHdvIHNvbHV0aW9ucyBoYXZlIGJlZW4gc3Vn
Z2VzdGVkIGhlcmU6Cj4gIMKgwqDCoMKgwqAgLSBJbXBsZW1lbnQgdXNpbmcgZ3JhbnQtdGFibGUg
KFN1Z2dlc3RlZCBieSBKdWVyZ2VuIEdyb3NzKQo+ICDCoMKgwqDCoMKgIC0gVXNlIFZpcnRpby1J
T01NVSBvciBhIFhlbiBQViBJT01NVQo+IERhdmUgV29vZGhvdXNlLCB3b3VsZCBiZSBpbnRlcmVz
dGVkIHRvIHNlZSBhIGRpYWdyYW0gZm9yIFBWIElPTU1VIHRvIGRvIAo+IHRyYW5zbGF0aW9uLiBU
aGUgYmFja2VuZCBmb3IgUFYgSU9NTVUgd291bGQgaGF2ZSB0byByZXNpZGUgaW4gWGVuLgo+IAo+
IEEgY3Jvc3MtaHlwZXJ2aXNvciBzb2x1dGlvbiB3b3VsZCBiZSBpZGVhbC4gV2UgbmVlZCB0byBp
bnZvbHZlIHBlb3BsZSBvdXRzaWRlIG9mIAo+IFhlbiAoR2VuZXZpPyBNYXR0aT8gR3VubmFyPykg
YW5kIHZpcnRpbyBzcGVjaWFsaXN0cyBmcm9tIExpbnV4IGtlcm5lbCAoUGFvbG8gCj4gQm9uemlu
aT8gTWljaGFlbCBUc2lya2luPykKPiAKPiAgwqAgKiBWaXJ0aW8gZnJvbnRlbmQgaW4gTGludXgg
YnktcGFzc2luZyB0aGUgRE1BIEFQSQo+IAo+IEluIG9yZGVyIHRvIGltcGxlbWVudCBhIHZpcnR1
YWwgSU9NTVUsIHZpcnRpbyB3b3VsZCBoYXZlIHRvIHVzZSBETUEgQVBJLiBEYXZpZCAKPiBXb29k
aG91c2Ugc3VnZ2VzdGVkIHRoaXMgd2FzIGZpeCBpbiByZWNlbnQga2VybmVsLiBXZSBuZWVkIHRv
IGNoZWNrIGlmIHRoaXMgdGhlIAo+IGNhc2Ugb3IgZml4IGl0Lgo+IAo+ICDCoCAqIEJhY2tlbmQg
bWVtb3J5IGV4aGF1c3Rpb24gKFhTQS0zMDApCj4gCj4gV2hpbGUgdGhpcyBpcyBub3QgdmlydGlv
IHNwZWNpZmljLCB0aGlzIGlzIGEgYmxvY2tlciBmb3IgZ2VuZXJhbCB1c3VhYmlsaXR5IG9uIAo+
IEFybSBhbmQgeDg2IFBWSCBkb20wLgo+IAo+ICDCoCAqIFN0YXRlIG9mIEFydAo+IAo+IFhlbiB4
ODYgY29udGFpbnMgbW9zdCBvZiB0aGUgcGllY2VzIHRvIGJlIGFibGUgdG8gdXNlIGJhc2ljIHZp
cnRpbyBNTUlPL1BDSS4gVGhlIAo+IHJlbWFpbmluZyBiaXRzIGFyZSB0b29scyBzdXBwb3J0IGZv
ciB0aGUgY29uZmlndXJhdGlvbgo+IAo+IFhlbiBBcm0gcmVxdWlyZXMgaW1wbGVtZW50YXRpb24g
dG8gZm9yd2FyZCBndWVzdCBNTUlPIGFjY2VzcyB0byBhIGRldmljZSBtb2RlbCAKPiAoYWthIElP
UkVRKS4gTW9zdCBvZiB0aGUgY29kZSBjb3VsZCBiZSByZS11c2VkIGZyb20geDg2LiBJIGhhdmUg
YSBQb0MgZm9yIHRoaXMgCj4gd2hpY2ggaGFzIGJlZW4gc2hhcmVkIHByaXZhdGVseSB3aXRoIEVQ
QU0gc28gZmFyLgo+IAo+IAo+ICDCoCAqIE5leHQgU3RlcHMvQWN0aW9ucwo+IAo+ICDCoMKgwqDC
oCAtIFNlbmQgb3V0IEFybSBJT1JFUSBzdXBwb3J0Cj4gIMKgwqDCoMKgLSBQYXJ0aWFsIFBDSSBl
bXVsYXRvciBmb3IgQXJtCj4gIMKgwqDCoMKgLSBYZW4gdG9vbHMgc3VwcG9ydCBmb3IgY29uZmln
dXJhdGlvbgo+ICDCoMKgwqDCoC0gU3RhcnQgZGlzY3Vzc2lvbiBvbiBzZWN1cml0eSBzaWRlIGlu
dm9sdmluZyBwZW9wbGUgb3V0c2lkZSBYZW4uCj4gCj4gQ2hlZXJzLAo+IAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
