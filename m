Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E458185222
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2020 00:14:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCtTZ-0002xS-LU; Fri, 13 Mar 2020 23:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+q9i=46=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jCtTX-0002xN-Ow
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 23:12:19 +0000
X-Inumbo-ID: 161c682a-6580-11ea-bec1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 161c682a-6580-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 23:12:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A0632074C;
 Fri, 13 Mar 2020 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584141138;
 bh=7grqH/sfbvOx/zRBDttu/hlEj4+6X7/A9fKSS1o118g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=USRvX/aDtoFv8rxmrz0zwMe8dycfr+kLWXd5H+k8fW2+kH4O4PqXew22D/RzsOHzs
 lufUNy0TWJcsUOMNCIU4WYmwyv5u7PuZ3Pwl/G5yGSr8O64ulUCsOD5qeJ9pSlBrGH
 WrJ3VvsGSMbSQZpF7fdLy36TOVPpNQKb/AyDfizo=
Date: Fri, 13 Mar 2020 16:12:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20200309174505.594607-3-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.21.2003131605490.1269@sstabellini-ThinkPad-T480s>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA5IE1hciAyMDIwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBBdCB0aGUgbW9tZW50
LCBlYXJseSBwcmludGsgY2FuIG9ubHkgYmUgY29uZmlndXJlZCBvbiB0aGUgbWFrZSBjb21tYW5k
Cj4gbGluZS4gSXQgaXMgbm90IHZlcnkgaGFuZHkgYmVjYXVzZSBhIHVzZXIgaGFzIHRvIHJlbW92
ZSB0aGUgb3B0aW9uCj4gZXZlcnl0aW1lIGl0IGlzIHVzaW5nIGFub3RoZXIgY29tbWFuZCBvdGhl
ciB0aGFuIGNvbXBpbGluZyB0aGUKPiBoeXBlcnZpc29yLgo+IAo+IEZ1cnRoZXJtb3JlLCBlYXJs
eSBwcmludGsgaXMgb25lIG9mIHRoZSBmZXcgb2RkcyBvbmUgdGhhdCBhcmUgbm90Cj4gdXNpbmcg
S2NvbmZpZy4KPiAKPiBTbyB0aGlzIGlzIGFib3V0IHRpbWUgdG8gbW92ZSBpdCB0byBLY29uZmln
Lgo+IAo+IFRoZSBuZXcga2NvbmZpZ3Mgb3B0aW9ucyBhbGxvdyBhIHVzZXIgdG8gZWF0aGVyIHNl
bGVjdCBhIFVBUlQgZHJpdmVyCj4gdG8gdXNlIGF0IGJvb3QgdGltZSwgYW5kIHNldCB0aGUgcGFy
YW1ldGVycywgb3IgaXQgaXMgc3RpbGwgcG9zc2libGUKPiB0byBzZWxlY3QgYSBwbGF0Zm9ybSB3
aGljaCB3aWxsIHNldCB0aGUgcGFyYW1ldGVycy4KPiAKPiBJZiBDT05GSUdfRUFSTFlfUFJJTlRL
IGlzIHByZXNlbnQgaW4gdGhlIGVudmlyb25tZW50IG9yIG9uIHRoZSBtYWtlCj4gY29tbWFuZCBs
aW5lLCBtYWtlIHdpbGwgcmV0dXJuIGFuIGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gCj4gLS0tCj4gCj4gT3JpZ2luYWwg
cGF0Y2g6Cj4gICAgIFtQQVRDSCBmb3ItNC4xM10geGVuL2FybTogQWRkIFNrZWxldG9uIGZvciB1
c2luZyBjb25maWd1cmluZyBlYXJseSBwcmludGsgdXNpbmcgS2NvbmZpZwo+ICAgICA8MjAxOTA5
MTMxMDM5NTMuODE4Mi0xLWp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+IAo+IE5vdGVzOgo+
ICAgICB2MzoKPiAgICAgLSByZW5hbWUgRUFSTFlfUFJJTksgdG8gQ09ORklHX0VBUkxZX1BSSU5U
SyBpbiBtYWtlZmlsZSBoZXJlICh3aGljaAo+ICAgICAgIHNlbGVjdCB3aGljaCBvYmplY3QgdG8g
YnVpbGQpLgo+ICAgICAtIHJlbmFtZSBFQVJMWV9VQVJUX0JBVURfUkFURSB0byBFQVJMWV9VQVJU
X1BMMDExX0JBVURfUkFURQo+ICAgICAtIHR5cG9zCj4gICAgIC0gZHJvcCB0aGUgbGlzdCBvZiBh
bGlhc2VzIGluIGVhcmx5LXByaW50ay50eHQuIEtjb25maWcgY2hvaWNlIG1lbnUKPiAgICAgICBz
aG91bGQgYmUgZW5vdWdoLgo+ICAgICAtIHJld29yZCBlYXJseS1wcmludGsudHh0Lgo+ICAgICAt
IHJld29yayBob3cgRUFSTFlfUFJJTlRLIGlzIHNldCB0byBZCj4gICAgICAgYW5kIHVzZSB0aGF0
IGluc3RlYWQgb2YgYSBsaXN0IG9mIGFsbCBFQVJMWV9VQVJUXyoKPiAgICAgLSBBZGQgYSBjaGVj
ayB0byBhc2sgdXNlciB0byB1c2UgS2NvbmZpZyB0byBzZXQgZWFybHkgcHJpbnRrLgo+ICAgICAt
IHJld29yayB0aGUgcG9zc2libGUgY2hvaWNlIHRvIGhhdmUgYWxsIHVhcnQgZHJpdmVyIGFuZCBw
bGF0Zm9ybQo+ICAgICAgIHNwZWNpZmljIG9wdGlvbiB0b2dldGhlci4KPiAgICAgLSBoYXZlIGFk
ZGVkIG9yIHJld29yZCBwcm9tcHQgYW5kIGhlbHAgbWVzc2FnZXMgb2YgdGhlIGRpZmZlcmVudAo+
ICAgICAgIG9wdGlvbnMuIFRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb24gZG9uJ3QgaGF2ZSBl
eHRlbmRlZCBoZWxwLCB0aGUKPiAgICAgICBwcm9tcHQgaXMgcHJvYmFibHkgZW5vdWdoLgo+ICAg
ICAgIChUaGUgbm9uLXBsYXRmb3JtIHNwZWNpZmljIG9wdGlvbnMgaGF2ZSB0aGUgaGVscCBtZXNz
YWdlIHRoYXQgSnVsaWVuCj4gICAgICAgaGF2ZSB3cml0dGVuIGluIHRoZSBmaXJzdCB2ZXJzaW9u
LikKPiAgICAgLSBoYXZlIG1hZGUgRUFSTFlfVUFSVF9JTklUIGRlcGVuZGVudCBvbiB0aGUgdmFs
dWUgb2YKPiAgICAgICBFQVJMWV9VQVJUX1BMMDExX0JBVURfUkFURSBzbyB0aGF0IHRoZXJlIGlz
IG5vIG5lZWQgdG8gZXhwb3NlIF9JTklUIHRvCj4gICAgICAgdXNlcnMuCj4gCgpUaGUgcGF0Y2gg
aXMgZmluZSBieSBtZS4gSSBvbmx5IGhhdmUgb25lIHZlcnkgbWlub3IgY29tbWVudCBiZWxvdy4K
Cgo+ICsJY29uZmlnIEVBUkxZX1VBUlRfQ0hPSUNFX0NBREVOQ0UKPiArCQlzZWxlY3QgRUFSTFlf
VUFSVF9DQURFTkNFCj4gKwkJZGVwZW5kcyBvbiBBUk1fNjQKPiArCQlib29sICJFYXJseSBwcmlu
dGsgdmlhIENhZGVuY2UgVUFSVCIKPiArCQloZWxwCj4gKwkJCVNheSBZIGhlcmUgaWYgeW91IHdp
c2ggdGhlIGVhcmx5IHByaW50ayB0byBkaXJlY3QgdGhlaXIKPiArCQkJb3V0cHV0IHRvIGEgQ2Fk
ZW5jZSBVQVJULiBZb3UgY2FuIHVzZSB0aGlzIG9wdGlvbiB0bwo+ICsJCQlwcm92aWRlIHRoZSBw
YXJhbWV0ZXJzIGZvciB0aGUgQ2FkZW5jZSBVQVJUIHJhdGhlciB0aGFuCj4gKwkJCXNlbGVjdGlu
ZyBvbmUgb2YgdGhlIHBsYXRmb3JtIHNwZWNpZmljIG9wdGlvbnMgYmVsb3cgaWYKPiArCQkJeW91
IGtub3cgdGhlIHBhcmFtZXRlcnMgZm9yIHRoZSBwb3J0Lgo+ICsKPiArCQkJVGhpcyBvcHRpb24g
aXMgcHJlZmVycmVkIG92ZXIgdGhlIHBsYXRmb3JtIHNwZWNpZmljCj4gKwkJCW9wdGlvbnM7IHRo
ZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb25zIGFyZSBkZXByZWNhdGVkCj4gKwkJCWFuZCB3aWxs
IHNvb24gYmUgcmVtb3ZlZC4KClsuLi5dCgo+ICsJY29uZmlnIEVBUkxZX1BSSU5US19aWU5RTVAK
PiArCQlib29sICJFYXJseSBwcmludGsgd2l0aCBDYWRlbmNlIFVBUlQgZm9yIFhpbGlueCBaeW5x
TVAgU29DcyIKPiArCQlzZWxlY3QgRUFSTFlfVUFSVF9DQURFTkNFCj4gKwkJZGVwZW5kcyBvbiBB
Uk1fNjQKPiArZW5kY2hvaWNlCgpbLi4uXQoKPiArY29uZmlnIEVBUkxZX1VBUlRfQkFTRV9BRERS
RVNTCj4gKwlkZXBlbmRzIG9uIEVBUkxZX1BSSU5USwo+ICsJaGV4ICJFYXJseSBwcmludGssIHBo
eXNpY2FsIGJhc2UgYWRkcmVzcyBvZiBkZWJ1ZyBVQVJUIgo+ICsJZGVmYXVsdCAweEYwNDBBQjAw
IGlmIEVBUkxZX1BSSU5US19CUkNNCj4gKwlkZWZhdWx0IDB4NDgwNkEwMDAgaWYgRUFSTFlfUFJJ
TlRLX0RSQTcKPiArCWRlZmF1bHQgMHgxYzA5MDAwMCBpZiBFQVJMWV9QUklOVEtfRkFTVE1PREVM
Cj4gKwlkZWZhdWx0IDB4MTJjMjAwMDAgaWYgRUFSTFlfUFJJTlRLX0VYWU5PUzUyNTAKPiArCWRl
ZmF1bHQgMHhmZmYzMjAwMCBpZiBFQVJMWV9QUklOVEtfSElLRVk5NjAKPiArCWRlZmF1bHQgMHg3
ZmY4MDAwMCBpZiBFQVJMWV9QUklOVEtfSlVOTwo+ICsJZGVmYXVsdCAweGU2ZTYwMDAwIGlmIEVB
UkxZX1BSSU5US19MQUdFUgo+ICsJZGVmYXVsdCAweGZmZjM2MDAwIGlmIEVBUkxZX1BSSU5US19N
SURXQVkKPiArCWRlZmF1bHQgMHhkMDAxMjAwMCBpZiBFQVJMWV9QUklOVEtfTVZFQlUKPiArCWRl
ZmF1bHQgMHg0ODAyMDAwMCBpZiBFQVJMWV9QUklOVEtfT01BUDU0MzIKPiArCWRlZmF1bHQgMHhl
NmU4ODAwMCBpZiBFQVJMWV9QUklOVEtfUkNBUjMKPiArCWRlZmF1bHQgMHhlMTAxMDAwMCBpZiBF
QVJMWV9QUklOVEtfU0VBVFRMRQo+ICsJZGVmYXVsdCAweDAxYzI4MDAwIGlmIEVBUkxZX1BSSU5U
S19TVU42SQo+ICsJZGVmYXVsdCAweDAxYzI4MDAwIGlmIEVBUkxZX1BSSU5US19TVU43SQo+ICsJ
ZGVmYXVsdCAweDg3ZTAyNDAwMDAwMCBpZiBFQVJMWV9QUklOVEtfVEhVTkRFUlgKPiArCWRlZmF1
bHQgMHgxYzA5MDAwMCBpZiBFQVJMWV9QUklOVEtfVkVYUFJFU1MKPiArCWRlZmF1bHQgMHgxYzAy
MTAwMCBpZiBFQVJMWV9QUklOVEtfWEdFTkVfTUNESVZJVFQKPiArCWRlZmF1bHQgMHgxYzAyMDAw
MCBpZiBFQVJMWV9QUklOVEtfWEdFTkVfU1RPUk0KPiArCWRlZmF1bHQgMHhmZjAwMDAwMCBpZiBF
QVJMWV9QUklOVEtfWllOUU1QCgpUb2RheSB3ZSBvbmx5IGhhdmUgb25lIGJvYXJkIHdpdGggQ0FE
RU5DRSBVQVJUIHdoaWNoIGlzIFp5bnFNUC4gSG93ZXZlciwKb25seSBpZiBFQVJMWV9QUklOVEtf
WllOUU1QIGlzIHNlbGVjdGVkIHRoZSBCQVNFX0FERFJFU1MgaXMgZGVmYXVsdCB0bwoweGZmMDAw
MDAwLgoKSWRlYWxseSwgQkFTRV9BRERSRVNTIHdvdWxkIGRlZmF1bHQgdG8gMHhmZjAwMDAwMCBp
ZiBFQVJMWV9QUklOVEtfWllOUU1QCm9yIGlmIEVBUkxZX1VBUlRfQ0FERU5DRS4gKFRoZXJlIGlz
IG9uZSBtb3JlIHNpbWlsYXIgZXhhbXBsZSB3aGljaCBpcwpFQVJMWV9VQVJUX0VYWU5PUzQyMTAu
KQoKSSBkb24ndCBrbm93IGlmIGl0IGlzIHdvcnRoIG9wdGltaXppbmcsIEknbGwgbGV0IHlvdSBh
bmQgSnVsaWVuIGRlY2lkZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
