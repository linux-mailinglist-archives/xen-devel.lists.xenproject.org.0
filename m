Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B32ACCE
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 03:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hV4QZ-0004NO-DV; Mon, 27 May 2019 01:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzIa=T3=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1hV4QX-0004Mb-Q5
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 01:27:49 +0000
X-Inumbo-ID: a0cd2e70-801e-11e9-ad4a-afa7d326c47d
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0cd2e70-801e-11e9-ad4a-afa7d326c47d;
 Mon, 27 May 2019 01:27:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 18:27:44 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga006.fm.intel.com with ESMTP; 26 May 2019 18:27:44 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 26 May 2019 18:27:44 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.7]) with mapi id 14.03.0415.000;
 Mon, 27 May 2019 09:27:42 +0800
From: "Chen, Farrah" <farrah.chen@intel.com>
To: M A Young <m.a.young@durham.ac.uk>
Thread-Topic: [Xen-devel] Compiling Xen error on RedHat8.0
Thread-Index: AdUR8RM5qkBjzIyFQfa26WrS1bY2pv//qYgA//s1HSA=
Date: Mon, 27 May 2019 01:27:41 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3E2993EC@SHSMSX104.ccr.corp.intel.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
 <alpine.LFD.2.21.1905240850290.15178@algedi.dur.ac.uk>
In-Reply-To: <alpine.LFD.2.21.1905240850290.15178@algedi.dur.ac.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjAxOGMxNTItYjUzYy00N2M2LWI3OWYtN2Q4NDM3MjVlZTBkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR3QzbGtrQUVGXC9UVnU3bGVDYU4wSnpjZ3FDRjVEMUVPTThOaGptcEtqbTVQVkpKZHhoYXJ3enQxXC9QeUF5QktHIn0=
x-ctpclassification: CTP_NT
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] Compiling Xen error on RedHat8.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmsgeW91IGZvciB0aGUgaW5mbyEKCgpUaGFua3MsCkZhbgoKCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCkZyb206IE0gQSBZb3VuZyBbbWFpbHRvOm0uYS55b3VuZ0BkdXJoYW0uYWMudWtd
IApTZW50OiBGcmlkYXksIE1heSAyNCwgMjAxOSA0OjE2IFBNClRvOiBDaGVuLCBGYXJyYWggPGZh
cnJhaC5jaGVuQGludGVsLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
SGFvLCBYdWRvbmcgPHh1ZG9uZy5oYW9AaW50ZWwuY29tPgpTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gQ29tcGlsaW5nIFhlbiBlcnJvciBvbiBSZWRIYXQ4LjAKCk9uIEZyaSwgMjQgTWF5IDIwMTks
IENoZW4sIEZhcnJhaCB3cm90ZToKCj4gSGksCj4gCj4gSSBtZXQgc29tZSBweXRob24gcmVsYXRl
ZCBpc3N1ZXMgd2hlbiBidWlsZGluZyBYZW4gb24gUmVkSGF0OC4wLgo+IE9uIFJlZEhhdDguMCwg
dGhlIGRlZmF1bHQgcHl0aG9uIHZlcnNpb24gaXMgcHl0aG9uMywgYW5kIEkgZm91bmQgWGVuIGhh
cyBzb21lIHB5dGhvbjIgY29kZXMsIHNvIEkgdHJpZWQgdG8gYnVpbGQgeGVuIHVzaW5nIHB5dGhv
bjIuCj4gT24gUmVkSGF0OC4wLCBubyAicHl0aG9uIiwganVzdCAicHl0aG9uMiIgYW5kICJweXRo
b24zIjoKPiAKPiBscyAvdXNyL2Jpbi9weXRob24qCj4gL3Vzci9iaW4vcHl0aG9uMiAgICAvdXNy
L2Jpbi9weXRob24yLjctY29uZmlnICAvdXNyL2Jpbi9weXRob24zICAgIC91c3IvYmluL3B5dGhv
bjMuNi1jb25maWcgIC91c3IvYmluL3B5dGhvbjMuNm0tY29uZmlnICAgICAgICAgL3Vzci9iaW4v
cHl0aG9uMy1jb25maWcKPiAvdXNyL2Jpbi9weXRob24yLjcgIC91c3IvYmluL3B5dGhvbjItY29u
ZmlnICAgIC91c3IvYmluL3B5dGhvbjMuNiAgL3Vzci9iaW4vcHl0aG9uMy42bSAgICAgICAgL3Vz
ci9iaW4vcHl0aG9uMy42bS14ODZfNjQtY29uZmlnCj4gCj4gU28gSSBjcmVhdGVkIGEgc29mdCBs
aW5rICJweXRob24iIHRvICJweXRob24yIjoKPiAKPiBsbCAvdXNyL2Jpbi9weXRob24KPiBscnd4
cnd4cnd4IDEgcm9vdCByb290IDE2IE1heSAyNCAxMzowOCAvdXNyL2Jpbi9weXRob24gLT4gCj4g
L3Vzci9iaW4vcHl0aG9uMgo+IAo+IFRoZW4gSSB0cmllZCB0byBidWlsZCB4ZW46Cj4gCj4gY2Qg
eGVuCj4gLi9jb25maWd1cmUgLS1lbmFibGUtb3ZtZgo+IC4uLi4uLi4uLgo+IGNoZWNraW5nIGZv
ciB1bmlzdGQuaC4uLiB5ZXMKPiBjaGVja2luZyBmb3IgcHl0aG9uLWNvbmZpZy4uLiBubwo+IGNo
ZWNraW5nIFB5dGhvbi5oIHVzYWJpbGl0eS4uLiB5ZXMKPiBjaGVja2luZyBQeXRob24uaCBwcmVz
ZW5jZS4uLiB5ZXMKPiBjaGVja2luZyBmb3IgUHl0aG9uLmguLi4geWVzCj4gY2hlY2tpbmcgZm9y
IFB5QXJnX1BhcnNlVHVwbGUuLi4gbm8KPiBjb25maWd1cmU6IGVycm9yOiBVbmFibGUgdG8gZmlu
ZCBhIHN1aXRhYmxlIHB5dGhvbiBkZXZlbG9wbWVudCBsaWJyYXJ5Cj4gY29uZmlndXJlOiBlcnJv
cjogLi9jb25maWd1cmUgZmFpbGVkIGZvciB0b29scwo+IAo+IElmIEkgdXNlIHB5dGhvbjMoY3Jl
YXRlIGEgc29mdCBsaW5rICJweXRob24iIHRvICJweXRob24zIiApLCBpdCByZXBvcnRlZCBzeW50
YXggZXJyb3IuCj4gCj4gY2hlY2tpbmcgZm9yIHVuaXN0ZC5oLi4uIHllcwo+IGNoZWNraW5nIGZv
ciBweXRob24tY29uZmlnLi4uIG5vCj4gICBGaWxlICI8c3RyaW5nPiIsIGxpbmUgMQo+ICAgICBp
bXBvcnQgZGlzdHV0aWxzLnN5c2NvbmZpZzsgICAgICAgICBwcmludCAiLUkiICsgZGlzdHV0aWxz
LnN5c2NvbmZpZy5nZXRfY29uZmlnX3ZhcigiSU5DTFVERVBZIikKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IFN5bnRheEVycm9yOiBpbnZhbGlk
IHN5bnRheAo+IGNoZWNraW5nIFB5dGhvbi5oIHVzYWJpbGl0eS4uLiBubwo+IGNoZWNraW5nIFB5
dGhvbi5oIHByZXNlbmNlLi4uIG5vCj4gY2hlY2tpbmcgZm9yIFB5dGhvbi5oLi4uIG5vCj4gY29u
ZmlndXJlOiBlcnJvcjogVW5hYmxlIHRvIGZpbmQgUHl0aG9uIGRldmVsb3BtZW50IGhlYWRlcnMK
PiBjb25maWd1cmU6IGVycm9yOiAuL2NvbmZpZ3VyZSBmYWlsZWQgZm9yIHRvb2xzCj4gCj4gVG8g
cmVzb2x2ZSAiVW5hYmxlIHRvIGZpbmQgYSBzdWl0YWJsZSBweXRob24gZGV2ZWxvcG1lbnQgbGli
cmFyeSIsIEkgaW5zdGFsbGVkIHB5dGhvbjItZGV2ZWwqLCBweXRob24yLWxpYiosIHB5dGhvbjMt
ZGV2ZWwqLCBweXRob24zLWxpYiosIHB5dGhvbjItc2l4LCBweXRob24zLXNpeCwgYnV0IHRoaXMg
ZXJyb3Igc3RpbGwgZXhpc3RzLgo+IEluIFJlZEhhdDcsIHRoZXNlIHBhY2thZ2VzIGFyZSBjYWxs
ZWQgInB5dGhvbi1kZXZlbCosIHB5dGhvbi1saWIqIiwgYnV0IGluIFJlZEhhdDgsIHRoZXNlIHBh
Y2thZ2VzIGRvbid0IGV4aXN0cywgUmVkSGF0OCBoYXMgb25seSAicHl0aG9uMi1kZXZlbCosIHB5
dGhvbjItbGliKiwgcHl0aG9uMy1kZXZlbCosIHB5dGhvbjMtbGliKiIsIG1heWJlIFhlbiBjb2Rl
cyBjYW5ub3QgaWRlbnRpZnkgdGhlbS4KPiAKPiBEbyB5b3UgaGF2ZSBhbnkgYWR2aWNlIG9uIGJ1
aWxkaW5nIFhlbiBvbiBSZWRIYXQ4PyBUaGFua3MgYSBsb3QhCgpJZiB5b3Ugd2FudCB0byBnbyBk
b3duIHRoZSBweXRob24zIHBhdGggdGhlcmUgYXJlIGEgYnVuZGxlIG9mIHB5dGhvbjMgcGFja2Fn
ZXMgKGZyb20gdGhlIHhlbiBtYXN0ZXIgYnJhbmNoKSBpbiB0aGUgRmVkb3JhIGJ1aWxkIG9mIHhl
bi00LjEyLjAgYXQgaHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvcnBtcy94ZW4vYmxvYi9t
YXN0ZXIvZi94ZW4ucHl0aG9uMy5wYXRjaAp3aGljaCBtaWdodCBiZSB1c2VmdWwgdG8gYXBwbHkg
b3IgcmVmZXIgdG8gZ2l2ZW4gdGhhdCBSSEVMIDggaXMgbG9vc2VseSBiYXNlZCBvbiBGZWRvcmEu
CgpBbHNvIFJIRUwgOCBoYXMgcHl0aG9uMzYtZGV2ZWwgYW5kIHB5dGhvbjItZGV2ZWwgd2hpY2gg
eW91IG1pZ2h0IG5lZWQgZm9yIGEgcHl0aG9uMyBvciBweXRob24yIGJ1aWxkLgoKCU1pY2hhZWwg
WW91bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
