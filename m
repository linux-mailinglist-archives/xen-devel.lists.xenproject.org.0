Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDA814F075
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:11:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYpm-0004oX-Qu; Fri, 31 Jan 2020 16:07:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixYpl-0004oS-00
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:07:53 +0000
X-Inumbo-ID: d593b78e-4443-11ea-8be0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d593b78e-4443-11ea-8be0-12813bfff9fa;
 Fri, 31 Jan 2020 16:07:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYpj-0006kP-5M; Fri, 31 Jan 2020 16:07:51 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYpi-0006RZ-Sm; Fri, 31 Jan 2020 16:07:51 +0000
Date: Fri, 31 Jan 2020 16:07:48 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200131160748.anvywpswgmps36aq@debian>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-8-pdurrant@amazon.com>
 <24115.4689.88393.840303@mariner.uk.xensource.com>
 <07859eefc91d43859bb12e59eb6298cf@EX13D32EUC003.ant.amazon.com>
 <38d14767-eca0-6343-799c-49167271c9e7@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38d14767-eca0-6343-799c-49167271c9e7@citrix.com>
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
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, "Durrant, Paul" <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDY6MjA6MDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMC8wMS8yMDIwIDE3OjQyLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+Cj4gPj4gU2VudDogMzAgSmFudWFyeSAyMDIwIDE3OjI5Cj4gPj4gVG86
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiA+PiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50aG9ueSBQZXJh
cmQKPiA+PiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDcvN10geGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZCBvbgo+ID4+IHNhdmUv
cmVzdG9yZSBvciBtaWdyYXRlCj4gPj4KPiA+PiBQYXVsIER1cnJhbnQgd3JpdGVzICgiW1BBVENI
IHY0IDcvN10geGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZCBvbgo+ID4+IHNhdmUvcmVz
dG9yZSBvciBtaWdyYXRlIik6Cj4gPj4+IFRoaXMgcGF0Y2ggYWRkcyBhICctRCcgY29tbWFuZCBs
aW5lIG9wdGlvbiB0byBzYXZlIGFuZCBtaWdyYXRlIHRvIGFsbG93Cj4gPj4+IHRoZSBkb21haW4g
aWQgdG8gYmUgaW5jb3Jwb3JhdGVkIGludG8gdGhlIHNhdmVkIGRvbWFpbiBjb25maWd1cmF0aW9u
IGFuZAo+ID4+PiBoZW5jZSBiZSBwcmVzZXJ2ZWQuCj4gPj4gVGhhbmtzLgo+ID4+Cj4gPj4gSW4g
cmVzcG9uc2UgdG8gdjMgNi82IEkgd3JvdGU6Cj4gPj4KPiA+PiAgIEkgd29uZGVyIGlmIHRoaXMg
c2hvdWxkIGJlIGRvbmUgbW9yZSBpbiBsaWJ4bC4gIFNob3VsZCB0aGlzIGJlIGEKPiA+PiAgIGRv
bWFpbiBwcm9wZXJ0eSA/ICBXZWksIEFudGhvbnkgPwo+ID4+Cj4gPj4gVGhpcyBxdWVzdGlvbiBy
ZW1haW5zIHVuYW5zd2VyZWQuICBJJ20gc29ycnkgdGhhdCBuZWl0aGVyIFdlaSBub3IKPiA+PiBB
bnRob255IGhhZCBhIGNoYW5jZSB0byBhbnN3ZXIgeWV0Li4uCj4gPj4KPiA+PiBQYXVsLCBkbyB5
b3UgaGF2ZSBhIHJlYXNvbiBmb3IgZG9pbmcgaXQgdGhpcyB3YXkgPyAgTXkgaW5jbGluYXRpb24g
aXMKPiA+PiB0aGF0IHRoaW5rIGRvaW5nIGl0IGF0IHRoZSBsaWJ4bCBsYXllciB3b3VsZCBtYWtl
IG1vcmUgc2Vuc2UuICBEbyB5b3UKPiA+PiB0aGluayB0aGF0IHdvdWxkIGJlIHBvc3NpYmxlID8K
PiA+Pgo+ID4gSSdtIG5vdCBzdXJlIGhvdyBpdCB3b3VsZCB3b3JrIGF0IHRoZSBsaWJ4bCBsZXZl
bCBhcyB0aGUgZG9taWQgaXMKPiA+IHBhcnQgb2YgY3JlYXRlX2luZm8gYW5kIHRoYXQgaXQgdHJh
bnNmZXJyZWQgYnkgeGwgb24gbWlncmF0aW9uLiBJSVVDCj4gPiB3ZSdkIG5lZWQgYSBuZXcgbGli
eGwgc2F2ZSByZWNvcmQgdG8gdHJhbnNmZXIgaXQgYXQgdGhhdCBsZXZlbCwgYW5kCj4gPiB0aGVu
IEknbSBub3Qgc3VyZSB3aGV0aGVyIHdlJ2QgaGl0IGFuIG9yZGVyaW5nIHByb2JsZW0gYXMgd2Un
ZCBoYXZlCj4gPiB0byBkaWcgdGhhdCBzYXZlIHJlY29yZCBvdXQgYmVmb3JlIHdlIGNvdWxkIGFj
dHVhbGx5IGNyZWF0ZSB0aGUKPiA+IGRvbWFpbi4KPiAKPiBUaGVyZSBpcyBkZWZpbml0ZWx5IGFu
IG9yZGVyaW5nIHByb2JsZW0uCj4gCj4gSSBhZ3JlZSB0aGF0IGl0IHNob3VsZCBsb2dpY2FsbHkg
YmUgcGFydCBvZiB0aGUgbGlieGwgbGV2ZWwgb2YgdGhlCj4gc3RyZWFtLCBidXQgbm9uZSBvZiB0
aGF0IGlzIGV2ZW4gcGFyc2VkIHVudGlsIGFmdGVyIHRoZSBkb21haW4gaGFzIGJlZW4KPiBjcmVh
dGVkIG9uIHRoZSBkZXN0aW5hdGlvbiBzaWRlLgo+IAo+IEkgaGF2ZSBubyBpZGVhIGhvdyBlYXN5
L2RpZmZpY3VsdCBpdCB3b3VsZCBiZSB0byByZWFycmFuZ2UgbGlieGwgdG8KPiBzdGFydCBwYXJz
aW5nIHRoZSBtaWdyYXRpb24gc3RyZWFtIGJlZm9yZSBjcmVhdGluZyB0aGUgZG9tYWluLsKgIEkg
dGhpbmsKPiB0aGVyZSB3aWxsIGJlIGEgbG90IG9mIGNvZGUgcmVseWluZyBvbiB0aGUgZG9taWQg
YWxyZWFkeSBiZWluZyB2YWxpZC4KClRoaXMuCgpUaGUgb3RoZXIgd2F5IEkgY2FuIHRoaW5rIG9m
IGlzIHRvIHNwZWNpZnkgc29tZXRoaW5nIChkb21pZCBwb2xpY3k/PykgaW4KY3JlYXRlX2luZm8g
YW5kIGFwcGx5IGl0IGR1cmluZyBkb21haW4gY3JlYXRpb24uIEJ1dCB0aGF0IHJlZWtzIGxpa2Ug
YQpsYXllcmluZyB2aW9sYXRpb24gdG8gbWUuCgpXZWkuCgo+IAo+IH5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
