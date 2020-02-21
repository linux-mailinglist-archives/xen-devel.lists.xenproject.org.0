Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1E167D06
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 13:02:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j56xA-0000Uk-Ag; Fri, 21 Feb 2020 11:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aa0I=4J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j56x8-0000Uf-Ke
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 11:58:42 +0000
X-Inumbo-ID: 804055c6-54a1-11ea-862d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 804055c6-54a1-11ea-862d-12813bfff9fa;
 Fri, 21 Feb 2020 11:58:40 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j56x4-0001IW-N9; Fri, 21 Feb 2020 11:58:38 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j56x4-0006gy-Dl; Fri, 21 Feb 2020 11:58:38 +0000
Date: Fri, 21 Feb 2020 11:58:35 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200221115835.zwcqdt527g7ptg26@debian>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-8-pdurrant@amazon.com>
 <24115.4689.88393.840303@mariner.uk.xensource.com>
 <07859eefc91d43859bb12e59eb6298cf@EX13D32EUC003.ant.amazon.com>
 <38d14767-eca0-6343-799c-49167271c9e7@citrix.com>
 <20200131160748.anvywpswgmps36aq@debian>
 <3db7099ec7564d9ebda632c8c51d4dcb@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3db7099ec7564d9ebda632c8c51d4dcb@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBGZWIgMDEsIDIwMjAgYXQgMTE6NTY6MTlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ID4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE2OjA4Cj4gPiBUbzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBJYW4gSmFja3Nvbgo+ID4gPGlhbi5qYWNrc29uQGNp
dHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhl
bi0KPiA+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+
ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCA3LzddIHhsOiBhbGxvdyBkb21p
ZCB0byBiZSBwcmVzZXJ2ZWQgb24KPiA+IHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlCj4gPiAKPiA+
IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDA2OjIwOjA4UE0gKzAwMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4gPiA+IE9uIDMwLzAxLzIwMjAgMTc6NDIsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4g
PiA+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4+IEZyb206IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgo+ID4gPiA+PiBTZW50OiAzMCBKYW51YXJ5IDIw
MjAgMTc6MjkKPiA+ID4gPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51
az4KPiA+ID4gPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8
d2xAeGVuLm9yZz47IEFudGhvbnkKPiA+IFBlcmFyZAo+ID4gPiA+PiA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPiA+ID4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA3LzddIHhsOiBhbGxv
dyBkb21pZCB0byBiZSBwcmVzZXJ2ZWQgb24KPiA+ID4gPj4gc2F2ZS9yZXN0b3JlIG9yIG1pZ3Jh
dGUKPiA+ID4gPj4KPiA+ID4gPj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCA3Lzdd
IHhsOiBhbGxvdyBkb21pZCB0byBiZSBwcmVzZXJ2ZWQKPiA+IG9uCj4gPiA+ID4+IHNhdmUvcmVz
dG9yZSBvciBtaWdyYXRlIik6Cj4gPiA+ID4+PiBUaGlzIHBhdGNoIGFkZHMgYSAnLUQnIGNvbW1h
bmQgbGluZSBvcHRpb24gdG8gc2F2ZSBhbmQgbWlncmF0ZSB0bwo+ID4gYWxsb3cKPiA+ID4gPj4+
IHRoZSBkb21haW4gaWQgdG8gYmUgaW5jb3Jwb3JhdGVkIGludG8gdGhlIHNhdmVkIGRvbWFpbiBj
b25maWd1cmF0aW9uCj4gPiBhbmQKPiA+ID4gPj4+IGhlbmNlIGJlIHByZXNlcnZlZC4KPiA+ID4g
Pj4gVGhhbmtzLgo+ID4gPiA+Pgo+ID4gPiA+PiBJbiByZXNwb25zZSB0byB2MyA2LzYgSSB3cm90
ZToKPiA+ID4gPj4KPiA+ID4gPj4gICBJIHdvbmRlciBpZiB0aGlzIHNob3VsZCBiZSBkb25lIG1v
cmUgaW4gbGlieGwuICBTaG91bGQgdGhpcyBiZSBhCj4gPiA+ID4+ICAgZG9tYWluIHByb3BlcnR5
ID8gIFdlaSwgQW50aG9ueSA/Cj4gPiA+ID4+Cj4gPiA+ID4+IFRoaXMgcXVlc3Rpb24gcmVtYWlu
cyB1bmFuc3dlcmVkLiAgSSdtIHNvcnJ5IHRoYXQgbmVpdGhlciBXZWkgbm9yCj4gPiA+ID4+IEFu
dGhvbnkgaGFkIGEgY2hhbmNlIHRvIGFuc3dlciB5ZXQuLi4KPiA+ID4gPj4KPiA+ID4gPj4gUGF1
bCwgZG8geW91IGhhdmUgYSByZWFzb24gZm9yIGRvaW5nIGl0IHRoaXMgd2F5ID8gIE15IGluY2xp
bmF0aW9uIGlzCj4gPiA+ID4+IHRoYXQgdGhpbmsgZG9pbmcgaXQgYXQgdGhlIGxpYnhsIGxheWVy
IHdvdWxkIG1ha2UgbW9yZSBzZW5zZS4gIERvIHlvdQo+ID4gPiA+PiB0aGluayB0aGF0IHdvdWxk
IGJlIHBvc3NpYmxlID8KPiA+ID4gPj4KPiA+ID4gPiBJJ20gbm90IHN1cmUgaG93IGl0IHdvdWxk
IHdvcmsgYXQgdGhlIGxpYnhsIGxldmVsIGFzIHRoZSBkb21pZCBpcwo+ID4gPiA+IHBhcnQgb2Yg
Y3JlYXRlX2luZm8gYW5kIHRoYXQgaXQgdHJhbnNmZXJyZWQgYnkgeGwgb24gbWlncmF0aW9uLiBJ
SVVDCj4gPiA+ID4gd2UnZCBuZWVkIGEgbmV3IGxpYnhsIHNhdmUgcmVjb3JkIHRvIHRyYW5zZmVy
IGl0IGF0IHRoYXQgbGV2ZWwsIGFuZAo+ID4gPiA+IHRoZW4gSSdtIG5vdCBzdXJlIHdoZXRoZXIg
d2UnZCBoaXQgYW4gb3JkZXJpbmcgcHJvYmxlbSBhcyB3ZSdkIGhhdmUKPiA+ID4gPiB0byBkaWcg
dGhhdCBzYXZlIHJlY29yZCBvdXQgYmVmb3JlIHdlIGNvdWxkIGFjdHVhbGx5IGNyZWF0ZSB0aGUK
PiA+ID4gPiBkb21haW4uCj4gPiA+Cj4gPiA+IFRoZXJlIGlzIGRlZmluaXRlbHkgYW4gb3JkZXJp
bmcgcHJvYmxlbS4KPiA+ID4KPiA+ID4gSSBhZ3JlZSB0aGF0IGl0IHNob3VsZCBsb2dpY2FsbHkg
YmUgcGFydCBvZiB0aGUgbGlieGwgbGV2ZWwgb2YgdGhlCj4gPiA+IHN0cmVhbSwgYnV0IG5vbmUg
b2YgdGhhdCBpcyBldmVuIHBhcnNlZCB1bnRpbCBhZnRlciB0aGUgZG9tYWluIGhhcyBiZWVuCj4g
PiA+IGNyZWF0ZWQgb24gdGhlIGRlc3RpbmF0aW9uIHNpZGUuCj4gPiA+Cj4gPiA+IEkgaGF2ZSBu
byBpZGVhIGhvdyBlYXN5L2RpZmZpY3VsdCBpdCB3b3VsZCBiZSB0byByZWFycmFuZ2UgbGlieGwg
dG8KPiA+ID4gc3RhcnQgcGFyc2luZyB0aGUgbWlncmF0aW9uIHN0cmVhbSBiZWZvcmUgY3JlYXRp
bmcgdGhlIGRvbWFpbi7CoCBJIHRoaW5rCj4gPiA+IHRoZXJlIHdpbGwgYmUgYSBsb3Qgb2YgY29k
ZSByZWx5aW5nIG9uIHRoZSBkb21pZCBhbHJlYWR5IGJlaW5nIHZhbGlkLgo+ID4gCj4gPiBUaGlz
Lgo+ID4gCj4gPiBUaGUgb3RoZXIgd2F5IEkgY2FuIHRoaW5rIG9mIGlzIHRvIHNwZWNpZnkgc29t
ZXRoaW5nIChkb21pZCBwb2xpY3k/PykgaW4KPiA+IGNyZWF0ZV9pbmZvIGFuZCBhcHBseSBpdCBk
dXJpbmcgZG9tYWluIGNyZWF0aW9uLiBCdXQgdGhhdCByZWVrcyBsaWtlIGEKPiA+IGxheWVyaW5n
IHZpb2xhdGlvbiB0byBtZS4KPiA+IAo+IAo+IFRoYXQncyBiYXNpY2FsbHkgd2hhdCB0aGlzIHNl
cmllcyBkb2VzLCBidXQgSSBkb24ndCBzZWUgaXQgYXMgYQo+IGxheWVyaW5nIHZpb2xhdGlvbi4g
SXQgaGFzIGFsd2F5cyBiZWVuIHRoZSBjYXNlIHRoYXQgeGwgaXMgaW4gY29udHJvbAo+IG9mIHRo
ZSBkb21haW4gY3JlYXRpb24gYW5kIHRoZW4gcGFzc2VzIHRoZSBtaWdyYXRpb24gc3RyZWFtIGlu
dG8KPiBsaWJ4bC4gUGFzc2luZyBpbiBhICdkb21pZCBwb2xpY3knIChzcGVjaWZpYyB2YWx1ZSwg
J3JhbmRvbScsIG9yCj4gJ2FsbG9jYXRlZCBieSBYZW4nKSBhcyBwYXJ0IG9mIGNyZWF0ZV9pbmZv
LCBhbmQgbm90IG1lc3Npbmcgd2l0aCB0aGUKPiBsaWJ4bCBtaWdyYXRpb24gZGF0YSwgc2VlbXMg
bGlrZSB0aGUgcmlnaHQgYXBwcm9hY2ggdG8gbWUuLi4gd2hpY2ggaXMKPiB3aHkgSSd2ZSBkb25l
IGl0IHRoYXQgd2F5LgoKR29pbmcgdGhyb3VnaCB0aGUgY29kZSBtb3JlIGNhcmVmdWxseSBJIHRo
aW5rIHlvdXIgaW1wbGVtZW50YXRpb24gc2hvdWxkCmJlIGZpbmUuCgpXZWkuCgo+IAo+ICAgUGF1
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
