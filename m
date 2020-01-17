Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE8A141220
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:09:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isXtF-0001Xv-Uc; Fri, 17 Jan 2020 20:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Omz=3G=amazon.com=prvs=2780aa402=elnikety@srs-us1.protection.inumbo.net>)
 id 1isXtE-0001Xq-Ez
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:06:44 +0000
X-Inumbo-ID: e1abe21a-3964-11ea-8e9a-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1abe21a-3964-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 20:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579291604; x=1610827604;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=L94pirbBTd0EaiazX7gRGX/Jsj1uIgXVrbCLV9D2nZw=;
 b=LlbKgT1k3yroz8lD4gWiSeRaAirQVAhpOnc21O5qeTWHHGnvDzKcmYL6
 NYZyPuxA2bITl/ig6jFKfkbDAnMSsuIL5UgShn/4K3RuG2ltBLLZzip2n
 JTz9NY9BMC3FQoAd8upk8ciIFaV8mAILjA5WVEwKalVw+tu0FbS3GaILn A=;
IronPort-SDR: kVt0cOuJ+L2ZhgJ0OUBqdjYIA/U1gtDASAuQxX48ij5VdbBNmXL5HXUM21E8qCGnRyiSdrlPhe
 9gTZTSOTtZCQ==
X-IronPort-AV: E=Sophos;i="5.70,331,1574121600"; d="scan'208";a="11003359"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 17 Jan 2020 20:06:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id BCB22A26C7; Fri, 17 Jan 2020 20:06:28 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 20:06:28 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.161.253) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 20:06:22 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <cf29db3bde903a5788322381ef6eac1a6ed9b2b9.1576630344.git.elnikety@amazon.com>
 <729be010-5721-3eca-8a95-63987b61d897@suse.com>
 <e456ffdd-6c93-8f8c-9385-f169fa984dfb@amazon.com>
 <980abeb1-4c86-2618-9ab2-094af86d47ab@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <3666c417-a263-0333-d3e0-fa83d7341bf2@amazon.com>
Date: Fri, 17 Jan 2020 21:06:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <980abeb1-4c86-2618-9ab2-094af86d47ab@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D03UWC004.ant.amazon.com (10.43.162.49) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/microcode: Support builtin CPU
 microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMTkgMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE5LjEyLjIwMTkgMjM6
MTEsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBPbiAxOC4xMi4xOSAxMzo0MiwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAxOC4xMi4yMDE5IDAyOjMyLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToK
Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS9NYWtl
ZmlsZQo+Pj4+IEBAIC0wLDAgKzEsNDYgQEAKPj4+PiArIyBDb3B5cmlnaHQgKEMpIDIwMTkgQW1h
em9uLmNvbSwgSW5jLiBvciBpdHMgYWZmaWxpYXRlcy4KPj4+PiArIyBBdXRob3I6IEVzbGFtIEVs
bmlrZXR5IDxlbG5pa2V0eUBhbWF6b24uY29tPgo+Pj4+ICsjCj4+Pj4gKyMgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
Pj4+PiArIyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQo+Pj4+ICsjIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247
IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4+Pj4gKyMgKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPj4+PiArIwo+Pj4+ICsjIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+Pj4+ICsjIGJ1
dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mCj4+Pj4gKyMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZQo+Pj4+ICsjIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCj4+Pj4gKwo+Pj4+ICsjIFJlbW92ZSBxdW90ZXMgYW5kIGV4Y2VzcyBzcGFj
ZXMgZnJvbSBjb25maWd1cmF0aW9uIHN0cmluZ3MKPj4+PiArVUNPREVfRElSPSQoc3RyaXAgJChz
dWJzdCAkXCIsLCQoQ09ORklHX0JVSUxUSU5fVUNPREVfRElSKSkpCj4+Pj4gK1VDT0RFX0FNRD0k
KHN0cmlwICQoc3Vic3QgJFwiLCwkKENPTkZJR19CVUlMVElOX1VDT0RFX0FNRCkpKQo+Pj4+ICtV
Q09ERV9JTlRFTD0kKHN0cmlwICQoc3Vic3QgJFwiLCwkKENPTkZJR19CVUlMVElOX1VDT0RFX0lO
VEVMKSkpCj4+Pj4gKwo+Pj4+ICsjIEFNRCBhbmQgSU5URUwgbWljcm9jb2RlIGJsb2JzLiBVc2Ug
J3dpbGRjYXJkJyB0byBmaWx0ZXIgZm9yIGV4aXN0aW5nIGJsb2JzLgo+Pj4+ICthbWQtYmxvYnMg
Oj0gJCh3aWxkY2FyZCAkKGFkZHByZWZpeCAkKFVDT0RFX0RJUiksJChVQ09ERV9BTUQpKSkKPj4+
PiAraW50ZWwtYmxvYnMgOj0gJCh3aWxkY2FyZCAkKGFkZHByZWZpeCAkKFVDT0RFX0RJUiksJChV
Q09ERV9JTlRFTCkpKQo+Pj4+ICsKPj4+PiAraWZuZXEgKCQoYW1kLWJsb2JzKSwpCj4+Pj4gK29i
ai15ICs9IHVjb2RlX2FtZC5vCj4+Pj4gK2VuZGlmCj4+Pj4gKwo+Pj4+ICtpZm5lcSAoJChpbnRl
bC1ibG9icyksKQo+Pj4+ICtvYmoteSArPSB1Y29kZV9pbnRlbC5vCj4+Pj4gK2VuZGlmCj4+Pj4g
Kwo+Pj4+ICtpZmVxICgkKGFtZC1ibG9icykkKGludGVsLWJsb2JzKSwpCj4+Pj4gK29iai15ICs9
IHVjb2RlX2R1bW15Lm8KPj4+PiArZW5kaWYKPj4+PiArCj4+Pj4gK3Vjb2RlX2FtZC5vOiBNYWtl
ZmlsZSAkKGFtZC1ibG9icykKPj4+PiArCWNhdCAkKGFtZC1ibG9icykgPiAkQC5iaW4KPj4+PiAr
CSQoT0JKQ09QWSkgLUkgYmluYXJ5IC1PIGVsZjY0LXg4Ni02NCAtQiBpMzg2Ong4Ni02NCAtLXJl
bmFtZS1zZWN0aW9uIC5kYXRhPS5idWlsdGluX2FtZF91Y29kZSxhbGxvYyxsb2FkLHJlYWRvbmx5
LGRhdGEsY29udGVudHMgJEAuYmluICRACj4+Pj4gKwlybSAtZiAkQC5iaW4KPj4+PiArCj4+Pj4g
K3Vjb2RlX2ludGVsLm86IE1ha2VmaWxlICQoaW50ZWwtYmxvYnMpCj4+Pj4gKwljYXQgJChpbnRl
bC1ibG9icykgPiAkQC5iaW4KPj4+PiArCSQoT0JKQ09QWSkgLUkgYmluYXJ5IC1PIGVsZjY0LXg4
Ni02NCAtQiBpMzg2Ong4Ni02NCAtLXJlbmFtZS1zZWN0aW9uIC5kYXRhPS5idWlsdGluX2ludGVs
X3Vjb2RlLGFsbG9jLGxvYWQscmVhZG9ubHksZGF0YSxjb250ZW50cyAkQC5iaW4gJEAKPj4+PiAr
CXJtIC1mICRALmJpbgo+Pj4KPj4+IFRoaXMgY2FuIGJlIGhhZCB3aXRoIGEgcGF0dGVybiBydWxl
ICh3aXRoIHRoZSB2ZW5kb3IgYmVpbmcgdGhlIHN0ZW0pCj4+PiBhbmQgaGVuY2Ugd2l0aG91dCBk
dXBsaWNhdGlvbiwgSSB0aGluay4KPj4+Cj4+PiBBbHNvIC0gaXMgc2ltcGx5IGNvbmNhdGVuYXRp
bmcgdGhlIGJsb2JzIHJlbGlhYmxlIGVub3VnaD8gVGhlcmUncyBubwo+Pj4gYnVpbGQgdGltZSBk
aWFnbm9zdGljIHRoYXQgdGhlIHJlc3VsdCB3b3VsZCBhY3R1YWxseSBiZSB1bmRlcnN0b29kCj4+
PiBhdCBydW50aW1lLgo+Pj4KPj4KPj4gQ29uY2F0ZW5hdGlvbiBpcyByZWxpYWJsZSAoYXMgbG9u
ZyBhcyB0aGUgaW5kaXZpZHVhbCBtaWNyb2NvZGUgYmxvYnMgYXJlCj4+IG5vdCBtYWxmb3JtZWQs
IGFuZCBpbiB0aGF0IGNhc2UgdGhlIGJ1aWx0aW4gaXMgbm90IG1ha2luZyBtYXR0ZXJzIHdvcnNl
Cj4+IGNvbXBhcmVkIHRvIHByZXNlbnRpbmcgdGhlIG1hbGZvcm1lZCB1cGRhdGUgdmlhIDxpbnRl
Z2VyPiB8IHNjYW4pLgo+IAo+IEEgbWFsZm9ybWVkIHVwZGF0ZSBmb3VuZCB0aGUgb3RoZXIgd2F5
IGlzIGEgYnVnIGluIHRoZSB0b29scwo+IGNvbnN0cnVjdGluZyB0aGUgcmVzcGVjdGl2ZSBpbWFn
ZXMuIEEgbWFsZm9ybWVkIGJ1aWx0LWluCj4gdXBkYXRlIGlzIGEgYnVnIGluIHRoZSBYZW4gYnVp
bGQgc3lzdGVtLiBUaGUgcHV0IHRoZSBxdWVzdGlvbgo+IGRpZmZlcmVudGx5OiBJcyBpdCBzcGVj
aWZpZWQgc29tZXdoZXJlIHRoYXQgdGhlIGJsb2JzIGFsbCBoYXZlCj4gdG8gaGF2ZSBjZXJ0YWlu
IHByb3BlcnRpZXMsIHdoaWNoIHRoZSBzdHJhaWdodCBjb25jYXRlbmF0aW9uCj4gcmVsaWVzIHVw
b24/Cj4gCgpSZWZlciB0byAoIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRp
b24veDg2L21pY3JvY29kZS50eHQgKS4gCkF1dGhlbnRpY0FNRC5iaW4gYW5kIEdlbnVpbmVJbnRl
bC5iaW4gYXJlIGJvdGggY29uY2F0ZW5hdGlvbnMgb2YgCmluZGl2aWR1YWwgbWljcm9jb2RlIGJs
b2JzLgoKPj4+PiArdWNvZGVfZHVtbXkubzogTWFrZWZpbGUKPj4+PiArCSQoQ0MpICQoQ0ZMQUdT
KSAtYyAteCBjIC9kZXYvbnVsbCAtbyAkQDsKPj4+Cj4+PiBTaW5jZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgZG9lc24ndCBleHBsYWluIHdoeSB0aGlzIGlzIG5lZWRlZCwgSQo+Pj4gaGF2ZSB0byBhc2sg
KEkgZ3Vlc3Mgd2Ugc29tZXdoZXJlIGhhdmUgYSBkZXBlbmRlbmN5IG9uICQob2JqLXkpCj4+PiBu
b3QgYmVpbmcgZW1wdHkpLgo+Pgo+PiBZb3VyIGd1ZXNzIGlzIGNvcnJlY3QuIEFsbCBzdWItZGly
ZWN0b3JpZXMgb2YgeGVuL2FyY2gveDg2IGFyZSBleHBlY3RlZAo+PiB0byBwcm9kdWNlIGJ1aWx0
X2luLm8uIElmIHRoZXJlIGFyZSBub3QgYW1kIG5vciBpbnRlbCBtaWNyb2NvZGUgYmxvYnMsCj4+
IHRoZXJlIHdpbGwgYmUgbm8gYnVpbGQgZGVwZW5kZW5jaWVzIGFuZCB0aGUgYnVpbGQgZmFpbHMg
cHJlcGFyaW5nIHRoZQo+PiBidWlsdF9pbi5vCj4gCj4gVGhhdCdzIHJhdGhlciBwb29yLCBidXQg
aXQncyBvZiBjb3Vyc2Ugbm90IHlvdXIgdGFzayB0byBnZXQgdGhpcwo+IGZpeGVkIChpdCBzaG91
bGRuJ3QgYmUgdmVyeSBkaWZmaWN1bHQgdG8gY3JlYXRlIGFuIGVtcHR5Cj4gYnVpbHRfaW4ubyBm
b3IgYW4gZW1wdHkgJChvYmoteSkpLgo+IAo+Pj4gX0lmXyBpdCBpcyBuZWVkZWQsIEkgZG9uJ3Qg
c2VlIHdoeSB5b3UgbmVlZAo+Pj4gaWZlcSgpIGFyb3VuZCBpdHMgdXNlLiBJbiBmYWN0IHlvdSBj
b3VsZCBoYXZlCj4+Pgo+Pj4gb2JqLXkgOj0gdWNvZGUtZHVtbXkubwo+Pj4KPj4+IHJpZ2h0IGF0
IHRoZSB0b3Agb2YgdGhlIGZpbGUuCj4+Pgo+Pj4gRnVydGhlcm1vcmUgSSBkb24ndCByZWFsbHkg
dW5kZXJzdGFuZCB3aHkgeW91IG5lZWQgdGhpcyBpbiB0aGUKPj4+IGZpcnN0IHBsYWNlLiBXaGls
ZSBjYXQgd29uJ3QgZG8gd2hhdCB5b3Ugd2FudCB3aXRoIGFuIGVtcHR5Cj4+PiBhcmd1bWVudCBs
aXN0LCBjYW4ndCB5b3Ugc2ltcGx5IHByZXBlbmQgLyBhcHBlbmQgL2Rldi9udWxsPwo+Pj4KPj4K
Pj4gVG8gbWFrZSBzdXJlIHdlIGFyZSBvbiB0aGUgc2FtZSBwYWdlLiBZb3UgYXJlIHN1Z2dlc3Rp
bmcgdXNpbmcKPj4gIi9kZXYvbnVsbCIgaW4gY2FzZSB0aGVyZSBhcmUgbm8gYW1kL2ludGVsIHVj
b2RlIHRvIGdlbmVyYXRlIHRoZQo+PiB1Y29kZV9hbWQvaW50ZWwubz8gSWYgc28sIG9iamNvcHkg
ZG9lcyBub3QgYWxsb3cgdXNpbmcgL2Rldi9udWxsIGFzCj4+IGlucHV0IChjb21wbGFpbnMgYWJv
dXQgZW1wdHkgYmluYXJ5KS4KPiAKPiBUaGF0J3MgYWdhaW4gcmF0aGVyIHBvb3IsIHRoaXMgdGlt
ZSBvZiB0aGUgdXRpbGl0eSAtIGl0IHNob3VsZCBiZQo+IGVhc3kgZW5vdWdoIHRvIHByb2R1Y2Ug
YW4gb2JqZWN0IHdpdGggYW4gZW1wdHkgLmRhdGEgKG9yIHdoYXRldmVyCj4gaXQgaXMpIHNlY3Rp
b24uIEFzIGFib3ZlIC0gSSdtIGZpbmUgd2l0aCB5b3Uga2VlcGluZyB0aGUgbG9naWMKPiB0aGVu
IGFzIGlzLCBwcm92aWRlZCB5b3Ugc2F5IGluIHRoZSBkZXNjcmlwdGlvbiB3aHkgaXQgY2FuJ3Qg
YmUKPiBzaW1wbGlmaWVkLgoKQWNrLiBXaWxsIGp1c3RpZnkgdGhlIGxvZ2ljIGluIGNvbW1lbnRz
LgoKLS0gRXNsYW0KCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
