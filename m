Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5BBAEAC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 09:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCJ1z-0001n2-5c; Mon, 23 Sep 2019 07:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCJ1x-0001mx-Hw
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 07:45:09 +0000
X-Inumbo-ID: 0fc80646-ddd6-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fc80646-ddd6-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 07:45:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E3BAAFFC;
 Mon, 23 Sep 2019 07:45:06 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190920161902.1353598-1-anthony.perard@citrix.com>
 <20190920170054.GX1308@perard.uk.xensource.com>
 <23941.2337.713234.62031@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <252a2100-32e6-5aaa-c31f-a2aa37a812bd@suse.com>
Date: Mon, 23 Sep 2019 09:45:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23941.2337.713234.62031@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Build fix following libxl API
 changes
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 DavidScott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxOToxNSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW50aG9ueSBQRVJBUkQg
d3JpdGVzICgiUmU6IFtQQVRDSF0gdG9vbHMvb2NhbWw6IEJ1aWxkIGZpeCBmb2xsb3dpbmcgbGli
eGwgQVBJIGNoYW5nZXMiKToKPj4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDU6MTk6MDJQTSAr
MDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+PiBUaGUgZm9sbG93aW5nIGxpYnhsIEFQSSBi
ZWNhbWUgYXN5bmNocm9ub3VzIGFuZCBnYWluZWQgYW4gYWRkaXRpb25hbAo+Pj4gYGFvX2hvdycg
cGFyYW1ldGVyOgo+Pj4gICAgIGxpYnhsX2RvbWFpbl9wYXVzZSgpCj4+PiAgICAgbGlieGxfZG9t
YWluX3VucGF1c2UoKQo+Pj4gICAgIGxpYnhsX3NlbmRfdHJpZ2dlcigpCj4+Pgo+Pj4gQWRhcHQg
dGhlIG9jYW1sIGJpbmRpbmcuCj4+Pgo+Pj4gQnVpbGQgdGVzdGVkIG9ubHkuCj4+Pgo+Pj4gRml4
ZXM6IGVkYWE2MzFkZGNlZTY2NWNkZmFlMWNmNmJjNzQ5MmM3OTFlMDFlZjQKPj4+IEZpeGVzOiA5
NTYyN2I4N2MzMTU5OTI4NDU4ZWU1ODZlOGM1YzU5M2JkZDI0OGQ4Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+IC0tLQo+Pj4K
Pj4+IE5vdGVzOgo+Pj4gICAgIEN1cnJlbnRseSwgYWxsIGxpYnhsIEFQSSB0aGF0IHRha2VzIGFu
IGBhb19ob3dgIGhhdmUgYD9hc3luYzonYSAtPiB1bml0YAo+Pj4gICAgIGluIHRoZSBvY2FtbCBk
ZWZpbml0aW9uIChhbmQgYW4gZXh0cmEgdW51c2VkIHZhbHVlIHVuaXQgaW4gdGhlIGMgc3R1Ygo+
Pj4gICAgIGZpbGUpLCBpcyB0aGF0IGB1bml0YCBuZWVkZWQgPwo+Pj4gICAgIAo+Pj4gICAgIEkg
dHJpZWQgdG8gYWRkIGl0LCBidXQgdGhlbiBmb3Igc3R1Yl94bF9zZW5kX3RyaWdnZXIoKSBJIGhh
ZCB0byB1c2UKPj4+ICAgICBDQU1McGFyYW02LCBhbmQgdGhhdCBkb2Vzbid0IGV4aXN0Lgo+Pgo+
PiBJIGRpc2NvdmVyZWQgQ0FNTHhwYXJhbTEgbWFjcm8sIGJ1dCB0aGF0J3Mgbm90IGJldHRlcjoK
Pj4gICAgIEZpbGUgInhlbmxpZ2h0Lm1sIiwgbGluZSAxNzM1LCBjaGFyYWN0ZXJzIDI1LTg0Ogo+
PiAgICAgRXJyb3I6IEFuIGV4dGVybmFsIGZ1bmN0aW9uIHdpdGggbW9yZSB0aGFuIDUgYXJndW1l
bnRzIHJlcXVpcmVzIGEgc2Vjb25kIHN0dWIgZnVuY3Rpb24KPj4gICAgICAgICAgICBmb3IgbmF0
aXZlLWNvZGUgY29tcGlsYXRpb24KPiAKPiBJbiBvcmRlciB0byB1bmJyZWFrIHRoZSBidWlsZCBJ
IGhhdmUgYWNrZWQgYW5kIHB1c2hlZCB0aGlzIHBhdGNoIHJpZ2h0Cj4gYXdheSwgYnV0IElNTyBh
IHJldmlldyBmcm9tIGFuIG9jYW1sIG1haW50YWluZXIgaXMgcXVpdGUgaW1wb3J0YW50Cj4gaGVy
ZS4KCkFjY29yZGluZyB0byBvc3N0ZXN0IHJlc3VsdHMgYWNjdW11bGF0ZWQgb3ZlciB0aGUgd2Vl
a2VuZCBhbmQgdGhlCnN0YXRlIG9mIHRoZSB0cmVlLCBkaWQgeW91IHBlcmhhcHMgY29tbWl0IHRo
ZSBjaGFuZ2UgYnV0IGZvcmdvdAp0byBhY3R1YWxseSBwdXNoIGl0PwoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
