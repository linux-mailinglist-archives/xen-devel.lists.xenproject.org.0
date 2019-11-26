Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D5109A35
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 09:34:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZWFB-0007YS-71; Tue, 26 Nov 2019 08:30:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZWF9-0007YN-Ug
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 08:30:43 +0000
X-Inumbo-ID: 08c1d038-1027-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08c1d038-1027-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 08:30:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A81EACD9;
 Tue, 26 Nov 2019 08:30:42 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian> <20191125155931.GA980@Air-de-Roger>
 <20191125170704.etgloq6y2e7j6ewg@debian> <20191125172704.GB980@Air-de-Roger>
 <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
 <20191125174956.GC980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33faac3c-ab0f-0f1e-7444-4cd8cc9fb12c@suse.com>
Date: Tue, 26 Nov 2019 09:30:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125174956.GC980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
 GeorgeDunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxODo0OSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBO
b3YgMjUsIDIwMTkgYXQgMDU6MzQ6MTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
T24gMjUvMTEvMjAxOSAxNzoyNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIE1vbiwg
Tm92IDI1LCAyMDE5IGF0IDA1OjA3OjA0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4+Pj4gT24g
TW9uLCBOb3YgMjUsIDIwMTkgYXQgMDQ6NTk6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPj4+PiBbLi4uXQo+Pj4+PiBXaGljaCBJIHRoaW5rIGl0J3MgZXhwZWN0ZWQsIHdlIGFs
cmVhZHkga25ldyBjbGFuZyBoYWQgYSBsb3Qgb2YKPj4+Pj4gZHVwbGljYXRlIHN5bWJvbHMuIFRo
ZSBvbmx5IHdheSBJIGtub3cgdG8gd29ya2Fyb3VuZCB0aGlzIEFUTSBpcyB0bwo+Pj4+PiB1c2Ug
YGdtYWtlIHhlbiBjbGFuZz15IENPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xTPW5gLiBJdCdz
IG9uIG15Cj4+Pj4+IHBpbGUgb2Ygc3R1ZmYgdG8gbG9vayBpbnRvLCBidXQgSSdtIG5vdCBzdXJl
IHdoZW4gSSB3aWxsIGdldCB0byBpdC4KPj4+PiBJbiB0aGF0IGNhc2Ugd2Ugc2hvdWxkIG1ha2Ug
R2l0bGFiIENJIHVzZSB0aGUgbmV3IGNvbmZpZ3VyYXRpb24gb3B0aW9uLgo+Pj4gSU1PIHRoZSBi
dWlsZCBzaG91bGQgd29yayBvdXQgb2YgdGhlIGJveCwgc28gd2Ugc2hvdWxkIGRpc2FibGUKPj4+
IENPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xTIGF1dG9tYXRpY2FsbHkgaWYgY2xhbmcgaXMg
ZGV0ZWN0ZWQuCj4+Cj4+IEtjb25maWcgaW4gNC4xMyBpc24ndCBpbiBhIHBvc2l0aW9uIHRvIGtu
b3cgdGhpcy7CoCAoSXQgd2lsbCBiZSBpbiA0LjE0Cj4+IHdpdGggQW50aG9ueSdzIHJlZnJlc2gg
Y29tbWl0dGVkKS4KPiAKPiBXZSBhbHJlYWR5IGhhdmUgS2NvbmZpZyBvcHRpb25zIHRoYXQgZGVw
ZW5kIG9uIHRvb2xjaGFpbiBmZWF0dXJlcywKPiBsaXZlcGF0Y2ggaXRzZWxmIHdpbGwgYmUgZW5h
YmxlZCBpZiBidWlsZCBpZCBpcyBzdXBwb3J0ZWQgYnkgdGhlCj4gbGlua2VyLCB3aHkgbm90IHVz
ZSBzb21ldGhpbmcgbGlrZToKCkknbSBzb3JyeSB0byBzYXkgdGhpcywgYnV0IHN1Z2dlc3Rpbmcg
d29ya2Fyb3VuZHMgbGlrZSB0aGlzIHdoZW4KdGhlcmUncyBhIHNvbHV0aW9uIHRvIHRoZSBwcm9i
bGVtIFsxXSBmZWVscyBhYnN1cmQuCgpKYW4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTEvbXNnMDAzNTcuaHRtbAoKPiBkaWZm
IC0tZ2l0IGEvQ29uZmlnLm1rIGIvQ29uZmlnLm1rCj4gaW5kZXggZDhmOTBkNzViMy4uMDA5YWJk
YTIyNSAxMDA2NDQKPiAtLS0gYS9Db25maWcubWsKPiArKysgYi9Db25maWcubWsKPiBAQCAtMTU3
LDYgKzE1Nyw4IEBAIGlmbmRlZiBYRU5fSEFTX0NIRUNLUE9MSUNZCj4gICAgICBleHBvcnQgWEVO
X0hBU19DSEVDS1BPTElDWQo+ICBlbmRpZgo+ICAKPiArZXhwb3J0IFhFTl9CVUlMRF9XSVRIX0NM
QU5HID0gJChjbGFuZykKPiArCj4gICMgYXMtaW5zbjogQ2hlY2sgd2hldGhlciBhc3NlbWJsZXIg
c3VwcG9ydHMgYW4gaW5zdHJ1Y3Rpb24uCj4gICMgVXNhZ2U6IGNmbGFncy15ICs9ICQoY2FsbCBh
cy1pbnNuLENDIEZMQUdTLCJpbnNuIixvcHRpb24teWVzLG9wdGlvbi1ubykKPiAgYXMtaW5zbiA9
ICQoaWYgJChzaGVsbCBlY2hvICd2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAkKDIpICk7
IH0nIFwKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29u
ZmlnCj4gaW5kZXggZjc1NDc0MTk3Mi4uMDk3OTk2ZmM2YyAxMDA2NDQKPiAtLS0gYS94ZW4vY29t
bW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtODAsNiArODAsMTAg
QEAgY29uZmlnIEhBU19DSEVDS1BPTElDWQo+ICAJc3RyaW5nCj4gIAlvcHRpb24gZW52PSJYRU5f
SEFTX0NIRUNLUE9MSUNZIgo+ICAKPiArY29uZmlnIEJVSUxEX1dJVEhfQ0xBTkcKPiArCXN0cmlu
Zwo+ICsJb3B0aW9uIGVudj0iWEVOX0JVSUxEX1dJVEhfQ0xBTkciCj4gKwo+ICBtZW51ICJTcGVj
dWxhdGl2ZSBoYXJkZW5pbmciCj4gIAo+ICBjb25maWcgU1BFQ1VMQVRJVkVfSEFSREVOX0FSUkFZ
Cj4gQEAgLTM1MCw3ICszNTQsNyBAQCBjb25maWcgQ1JZUFRPCj4gIGNvbmZpZyBMSVZFUEFUQ0gK
PiAgCWJvb2wgIkxpdmUgcGF0Y2hpbmcgc3VwcG9ydCIKPiAgCWRlZmF1bHQgWDg2Cj4gLQlkZXBl
bmRzIG9uIEhBU19CVUlMRF9JRCA9ICJ5Igo+ICsJZGVwZW5kcyBvbiBIQVNfQlVJTERfSUQgPSAi
eSIgJiYgQlVJTERfV0lUSF9DTEFORyAhPSAieSIKPiAgCS0tLWhlbHAtLS0KPiAgCSAgQWxsb3dz
IGEgcnVubmluZyBYZW4gaHlwZXJ2aXNvciB0byBiZSBkeW5hbWljYWxseSBwYXRjaGVkIHVzaW5n
Cj4gIAkgIGJpbmFyeSBwYXRjaGVzIHdpdGhvdXQgcmVib290aW5nLiBUaGlzIGlzIHByaW1hcmls
eSB1c2VkIHRvIGJpbmFyaWx5Cj4gCj4gVGhpcyBXRk0gd2l0aCBGcmVlQlNEIGFuZCBjbGFuZy4K
PiAKPiBUaGFua3MsIFJvZ2VyLgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
