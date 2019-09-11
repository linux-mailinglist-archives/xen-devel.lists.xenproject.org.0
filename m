Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711EAFB69
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i80ow-0005zX-Fo; Wed, 11 Sep 2019 11:29:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i80ou-0005zO-R7
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:29:56 +0000
X-Inumbo-ID: 7a74678a-d487-11e9-ac28-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a74678a-d487-11e9-ac28-12813bfff9fa;
 Wed, 11 Sep 2019 11:29:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90D8CAEE1;
 Wed, 11 Sep 2019 11:29:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
Date: Wed, 11 Sep 2019 13:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTM6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTEvMDkvMjAxOSAw
NzoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gdGhlIDIwMTkgWGVuIGRldmVsb3BlciBz
dW1taXQgdGhlcmUgd2FzIGFncmVlbWVudCB0aGF0IHRoZSBYZW4KPj4gaHlwZXJ2aXNvciBzaG91
bGQgZ2FpbiBzdXBwb3J0IGZvciBhIGhpZXJhcmNoaWNhbCBuYW1lLXZhbHVlIHN0b3JlCj4+IHNp
bWlsYXIgdG8gdGhlIExpbnV4IGtlcm5lbCdzIHN5c2ZzLgo+Pgo+PiBUaGlzIGlzIGEgZmlyc3Qg
aW1wbGVtZW50YXRpb24gb2YgdGhhdCBpZGVhIGFkZGluZyB0aGUgYmFzaWMKPj4gZnVuY3Rpb25h
bGl0eSB0byBoeXBlcnZpc29yIGFuZCB0b29scyBzaWRlLiBUaGUgaW50ZXJmYWNlIHRvIGFueQo+
PiB1c2VyIHByb2dyYW0gbWFraW5nIHVzZSBvZiB0aGF0ICJ4ZW4tc3lzZnMiIGlzIGEgbmV3IGxp
YnJhcnkKPj4gImxpYnhlbmZzIiB3aXRoIGEgc3RhYmxlIGludGVyZmFjZS4KPiAKPiBUaGFua3lv
dSBmb3IgbG9va2luZyBpbnRvIHRoaXMuwqAgSXQgaXMgYSBnb29kIHN0ZXAgZm9yd2FyZHMuCj4g
Cj4gRmlyc3Qgb2YgYWxsLCBJJ2Qgc3VnZ2VzdCB0aGF0IHdlIGhhdmUgYSBkb2N1bWVudCBhbG9u
ZyB0aGUgbGluZXMgb2YKPiB4ZW5zdG9yZWQtcGF0aHMgYXMgdGhlIHBvaW50IG9mIGF1dGhvcml0
eSBkZXNjcmliaW5nIHRoZSBwYXRoL2ZpbGUgQUJJLgoKRmluZSB3aXRoIG1lLgoKPiAKPiBTZWNv
bmQsIGlzIHhlbmZzIHJlYWxseSB0aGUgYmVzdCBuYW1lIGhlcmU/wqAgSXQgaXMgYW1iaWd1b3Vz
IHdpdGggdGhlCj4gc3RpbGwtZXNzZW50aWFsIChldmVuIHRob3VnaCBpdCByZWFsbHkgbmVlZHMg
dG8gZGlzYXBwZWFyKSBMaW51eAo+IGZpbGVzeXN0ZW0gYnkgdGhlIG5hbWUgeGVuZnMuCgpZZXMs
IEknbSBhd2FyZSBvZiB0aGF0IGFtYmlndWl0eS4gSSdtIGFic29sdXRlbHkgaW4gZmF2b3Igb2Yg
ZmluZGluZyBhCmJldHRlciBuYW1lLgoKTWF5YmUgeGVuc3lzZnM/Cgo+IAo+Pgo+PiBUaGVyZSBh
cmUgc3RpbGwgc29tZSBwZW5kaW5nIHF1ZXN0aW9ucywgdGhvc2UgYXJlOgo+Pgo+PiAtIGFjY2Vz
cyByaWdodHM6Cj4+ICAgICsgc2hvdWxkIHdlIGFsbG93IGFjY2VzcyB0byBkb20wIG9ubHksIG9y
IHRvIGFsbCBkb21haW5zLCBvciBzaG91bGQKPj4gICAgICB0aGF0IGJlIHBvc3NpYmxlIHRvIHNl
dCBwZXIgZW50cnk/Cj4+ICAgICsgaG93IHRvIGludGVncmF0ZSB3aXRoIHhzbT8KPj4gLSBkeW5h
bWljYWwgZW50cmllczoKPj4gICAgKyBkbyB3ZSB3YW50IHN1cHBvcnQgZm9yIGUuZy4gcGVyLWRv
bWFpbiBhbmQvb3IgcGVyLWNwdXBvb2wgZW50cmllcz8KPj4gICAgKyBkbyB3ZSB3YW50IHN1cHBv
cnQgZm9yIGRlYnVnIGFpZHMgKGxvY2stcHJvZmlsaW5nLCBkZWJ1Z3RyYWNlIC4uKT8KPj4gLSB3
cml0ZSBhY2Nlc3M6Cj4+ICAgICsgcnVudGltZSBwYXJhbWV0ZXJzPwo+PiAgICArIGRlYnVnZ2lu
ZyBhaWRzPwo+IAo+IFRvIGFuc3dlciBzb21lIG9mIHRoZXNlLCB3ZSBjb3VsZCByZWFsbHkgZG8g
d2l0aCBzZXR0aW5nIGV4cGVjdGF0aW9ucyBvbgo+IHRoZSBzY29wZSBvZiB0aGUgd29yay7CoCBG
b3IgcmVhZGluZyBjb25maWd1cmF0aW9uLCBJIHRoaW5rIGlzIGdyZWF0Lgo+IEV2ZW4gZm9yIG1v
ZGlmaWNhdGlvbiBvZiBjb25maWd1cmF0aW9uLCBpdCBsb29rcyB0byBiZSBhIGdvb2QgaW50ZXJm
YWNlCj4gd2hpY2ggd29uJ3QgcmVxdWlyZSBldmVyeSBvcHRpb24gdG8gZ2FpbiBhIG5ldyBhZC1o
b2MgaHlwZXJjYWxsLgoKWWVzLCB0aGF0IHdhcyB0aGUgaWRlYS4KCj4gSG93ZXZlciwgZm9yIGFu
eXRoaW5nIHdoaWNoIGlzIGV4cGVjdGVkIHRvIG9wZXJhdGUgcGVyaW9kaWNhbGx5IChvdXRzaWRl
Cj4gb2YgZGVidWdnaW5nIGNpcmN1bXN0YW5jZXMpLCBJJ20gbm90IHN1cmUgaXRzIHRoZSBiZXN0
IGludGVyZmFjZS4KCkkgY29tcGxldGVseSBhZ3JlZS4KCj4gU3RhdHMgY29sbGVjdGlvbiBpbiBw
YXJ0aWN1bGFyIHdvdWxkIGJlIGJldHRlciB1c2luZyBzaGFyZWQgbWVtb3J5IHBhZ2VzCj4gdGhh
biBjb25zdGFudGx5IHBvbGxpbmcgL2RvbWFpbi8kZG9taWQvc3RhdHMuwqAgKEN1cnJlbnRseSwg
aXRzIGEgc2xldyBvZgo+IERPTUNUTC9ldGMgaHlwZXJjYWxscy7CoCBPbiBzeXN0ZW1zIHdpdGgg
bW9yZSB0aGFuIGEgZG96ZW4gZ3Vlc3RzIG9yIHNvLAo+IHN0YXRzIGNvbGxlY3Rpb24gaXMgdGhl
IHByaW1hcnkgc291cmNlIG9mIGRvbWN0bCBsb2NrIGNvbnRlbnRpb24uKQoKU291bmRzIGxpa2Ug
YW5vdGhlciBuaWNlIHByb2plY3QuIE1heWJlIHNvbWV0aGluZyBmb3Igb3V0cmVhY2h5IG9yCnNv
bWUgc3R1ZGVudCBsb29raW5nIGZvciBhIGxhcmdlciBwcm9qZWN0ICh3YXNuJ3QgdGhlcmUgb25l
IHJlY2VudGx5PykKClRoaXMgY291bGQgcmVzdWx0IGluIHNvbWV0aGluZyBsaWtlIGRlYnVnZnMg
aW4gdGhlIGVuZC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
