Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A15B1FC0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 15:33:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8le9-0006Dm-IV; Fri, 13 Sep 2019 13:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8le7-0006Dg-VV
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 13:29:55 +0000
X-Inumbo-ID: 9224e57c-d62a-11e9-95ab-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9224e57c-d62a-11e9-95ab-12813bfff9fa;
 Fri, 13 Sep 2019 13:29:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6384CAB7D;
 Fri, 13 Sep 2019 13:29:53 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
 <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
 <1f1fbba50d5b4dbd812f90b17d69c457@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2df93f64-40e4-6947-dbfe-9abbfcadba03@suse.com>
Date: Fri, 13 Sep 2019 15:29:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1f1fbba50d5b4dbd812f90b17d69c457@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11.1 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 AnthonyPerard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxMzo0NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEzIFNlcHRlbWJlciAyMDE5IDEyOjEwCj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENj
OiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldwo+PiBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT47IENocmlzdGlhbiBMaW5kaWcKPj4gPGNocmlzdGlhbi5saW5kaWdAY2l0cml4
LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwCj4+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsKPj4gU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgRGF2aWQKPj4gU2NvdHQgPGRhdmVAcmVj
b2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpTGl1IDx3bEB4ZW4ub3Jn
Pgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjExLjEgMy82XSBzeXNjdGwgLyBsaWJ4bDogcmVwb3J0IHdo
ZXRoZXIgSU9NTVUvSEFQIHBhZ2UgdGFibGUgc2hhcmluZyBpcyBzdXBwb3J0ZWQKPj4KPj4gVGhp
cyBwYXRjaCBkZWZpbmVzIGEgbmV3IGJpdCByZXBvcnRlZCBpbiB0aGUgaHdfY2FwIGZpZWxkIG9m
IHN0cnVjdAo+PiB4ZW5fc3lzY3RsX3BoeXNpbmZvIHRvIGluZGljYXRlIHdoZXRoZXIgdGhlIHBs
YXRmb3JtIHN1cHBvcnRzIHNoYXJpbmcgb2YKPj4gSEFQIHBhZ2UgdGFibGVzIChpLmUuIHRoZSBQ
Mk0pIHdpdGggdGhlIElPTU1VLiBUaGlzIGluZm9ybXMgdGhlIHRvb2xzdGFjawo+PiB3aGV0aGVy
IHRoZSBkb21haW4gbmVlZHMgZXh0cmEgbWVtb3J5IHRvIHN0b3JlIGRpc2NyZXRlIElPTU1VIHBh
Z2UgdGFibGVzCj4+IG9yIG5vdC4KPj4KPj4gTk9URTogVGhpcyBwYXRjaCBtYWtlcyBzdXJlIGlv
bW11X2hhcF9wdF9zaGFyZWQgaXMgY2xlYXIgaWYgSEFQIGlzIG5vdAo+PiAgICAgICBzdXBwb3J0
ZWQgb3IgdGhlIElPTU1VIGlzIGRpc2FibGVkLCBhbmQgZGVmaW5lcyBpdCB0byBmYWxzZSBpZgo+
PiAgICAgICAhQ09ORklHX0hWTS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFu
LmxpbmRpZ0BjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgoKVGhhbmtzLgoKPiAuLi53aXRoIG9uZSBvYnNlcnZhdGlvbi4u
Lgo+IAo+IFtzbmlwXQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPj4gQEAgLTQ5LDcgKzQ5LDEx
IEBAIGludDhfdCBfX2h3ZG9tX2luaXRkYXRhIGlvbW11X2h3ZG9tX3Jlc2UKPj4gICAqIGRlZmF1
bHQgdW50aWwgd2UgZmluZCBhIGdvb2Qgc29sdXRpb24gdG8gcmVzb2x2ZSBpdC4KPj4gICAqLwo+
PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cG9zdDsKPj4gLWJvb2xfdCBfX3JlYWRf
bW9zdGx5IGlvbW11X2hhcF9wdF9zaGFyZSA9IDE7Cj4+ICsKPj4gKyNpZm5kZWYgaW9tbXVfaGFw
X3B0X3NoYXJlCj4+ICtib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfaGFwX3B0X3NoYXJlID0gdHJ1
ZTsKPj4gKyNlbmRpZgo+PiArCj4+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9kZWJ1ZzsK
Pj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAgPSAxOwo+
Pgo+PiBAQCAtMTAyLDggKzEwNiwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9pb21tdV9w
YXJhbShjb25zCj4+ICAgICAgICAgICAgICBpb21tdV9od2RvbV9wYXNzdGhyb3VnaCA9IHZhbDsK
Pj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb20wLXN0cmljdCIs
IHMsIHNzKSkgPj0gMCApCj4+ICAgICAgICAgICAgICBpb21tdV9od2RvbV9zdHJpY3QgPSB2YWw7
Cj4+ICsjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZQo+PiAgICAgICAgICBlbHNlIGlmICggKHZh
bCA9IHBhcnNlX2Jvb2xlYW4oInNoYXJlcHQiLCBzLCBzcykpID49IDAgKQo+PiAgICAgICAgICAg
ICAgaW9tbXVfaGFwX3B0X3NoYXJlID0gdmFsOwo+PiArI2VuZGlmCj4+ICAgICAgICAgIGVsc2UK
Pj4gICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPj4KPiAKPiBXaXRoIHRoaXMgY2hhbmdlIHRo
ZXJlIHdpbGwgYmUgYSBjb21tYW5kIGxpbmUgcGFyc2UgZXJyb3IgaWYgJ25vLXNoYXJlcHQnIGlz
IHBhc3NlZCBvbiB0aGUgY29tbWFuZCBsaW5lIHRvIGEgaHlwZXJ2aXNvciBidWlsdCB3aXRob3V0
IENPTkZJR19IVk0uIEkgZG9uJ3Qga25vdyB3aGV0aGVyIHlvdSByZWFsbHkgd2FudCB0aGF0IGJl
aGF2aW91ciwgd2hpY2ggaXMgd2h5IG15IHBhdGNoIGRpZDoKPiAKPiBAQCAtMTAzLDcgKzEwNywx
NCBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9pb21tdV9wYXJhbShjb25zdCBjaGFyICpzKQo+
ICAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigiZG9tMC1zdHJpY3QiLCBz
LCBzcykpID49IDAgKQo+ICAgICAgICAgICAgICBpb21tdV9od2RvbV9zdHJpY3QgPSB2YWw7Cj4g
ICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzaGFyZXB0Iiwgcywgc3Mp
KSA+PSAwICkKPiArICAgICAgICB7Cj4gKyNpZm5kZWYgaW9tbXVfaGFwX3B0X3NoYXJlCj4gICAg
ICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IHZhbDsKPiArI2Vsc2UKPiArICAgICAgICAg
ICAgaWYgKHZhbCAhPSBpb21tdV9oYXBfcHRfc2hhcmUpCj4gKyAgICAgICAgICAgICAgICByYyA9
IC1FSU5WQUw7Cj4gKyNlbmRpZgo+ICsgICAgICAgIH0KPiAgICAgICAgICBlbHNlCj4gICAgICAg
ICAgICAgIHJjID0gLUVJTlZBTDsKClllcywgSSBkaWQgY2hhbmdlIHRoaXMgaW50ZW50aW9uYWxs
eSwgYXMgSSB0aGluayB0aGUgInNoYXJlcHQiIG9wdGlvbgooaW4gaXRzIHBvc2l0aXZlIG9yIG5l
Z2F0aXZlIGZvcm0pIHNob3VsZCBub3QgYmUgc3BlY2lmaWVkIHRvIFhlbgpidWlsdCB3aXRoIHRo
aXMgdGllZCB0byBhIGZpeGVkIHZhbHVlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
