Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C895D6E3EB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoPjU-0001jA-7o; Fri, 19 Jul 2019 10:03:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfBs=VQ=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hoPjS-0001j4-CH
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:03:18 +0000
X-Inumbo-ID: 6b70097e-aa0c-11e9-8203-03503a90d263
Received: from gandi.net (unknown [217.70.182.73])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b70097e-aa0c-11e9-8203-03503a90d263;
 Fri, 19 Jul 2019 10:03:13 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id 8D9F416052F;
 Fri, 19 Jul 2019 10:03:12 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>
References: <20190718215428.6727-1-george.dunlap@citrix.com>
 <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
 <643C0338-ACDB-4581-A16C-0DFCC22C7C07@citrix.com>
 <FBF82058-59FC-40B7-859C-A42D6756CC05@citrix.com>
From: Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <3591522b-2724-61d5-3ab2-240f41a2e2ce@gandi.net>
Date: Fri, 19 Jul 2019 12:03:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <FBF82058-59FC-40B7-859C-A42D6756CC05@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3LzE5LzE5IDEwOjUwIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Cj4+IE9uIEp1bCAx
OSwgMjAxOSwgYXQgOTo0NyBBTSwgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPiB3cm90ZToKPj4KPj4KPj4KPj4+IE9uIEp1bCAxOSwgMjAxOSwgYXQgODozNCBBTSwgTmlj
b2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0PiB3cm90ZToKPj4+Cj4+Pgo+
Pj4KPj4+IE9uIDcvMTgvMTkgMTE6NTQgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4gVGhl
IEdvIGJpbmRpbmdzIGZvciBsaWJ4bCBtaXNzIGZ1bmN0aW9ucyBmcm9tIGxpYnhsX3V0aWxzLCBs
ZXQncyBzdGFydAo+Pj4+IHdpdGggdGhlIHNpbXBsZSBsaWJ4bF9kb21pZF90b19uYW1lIGFuZCBp
dHMgY291bnRlcnBhcnQKPj4+PiBsaWJ4bF9uYW1lX3RvX2RvbWlkLgo+Pj4+Cj4+Pj4gTkIgdGhh
dCBDLkdvU3RyaW5nKCkgd2lsbCByZXR1cm4gIiIgaWYgaXQncyBwYXNzZWQgYSBOVUxMOyBzZWUK
Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8zMjczNCNpc3N1ZWNvbW1l
bnQtNTA2ODM1NDMyCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIEJlbG91aW4gPG5p
Y29sYXMuYmVsb3VpbkBnYW5kaS5uZXQ+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+Pj4+IC0tLQo+Pj4+IHYzOgo+Pj4+IC0gV2ly
ZSBpbnRvIGJ1aWxkIHN5c3RlbQo+Pj4+IC0gQWRkIHJlZmVyZW5jZSB0byBDLkdvU3RyaW5nKCkg
aGFuZGxpbmcgTlVMTCB0byBjb21taXQgbWVzc2FnZQo+Pj4+Cj4+Pj4gTmljb2xhcywgY291bGQg
eW91IHRlc3QgdG8gc2VlIGlmIHRoaXMgYWN0dWFsbHkgd29ya3MgZm9yIHlvdT8KPj4+IFRlc3Rl
ZCBpdCwgaXQgd29ya3MuCj4+Pgo+Pj4gSSBtdXN0IGNvbmZlc3MgSSBkbyBub3QgdXNlIHRoYXQg
aW1wb3J0IHBhdGggYXMgdGhlIG5ldyBtb2R1bGVzIG1lY2hhbmlzbQo+Pj4gaW50cm9kdWNlZCBp
biBHbzEuMTEgZG93bmxvYWRzIGFuZCBjb21waWxlIGEgdmVyc2lvbmVkIGNvcHkgb2YgZXZlcnkK
Pj4+IGRlcGVuZGVuY3kgcGVyIHByb2plY3QsIGFuZCB0aGlzIGJlaGF2aW9yIGlzIGluY29tcGF0
aWJsZSB3aXRoIHRoZSBidWlsZAo+Pj4gc3lzdGVtIHVzZWQgaGVyZS4KPj4gSXTigJlzIHBvc3Np
YmxlIHRoYXQgc29tZXRoaW5nIGZ1bmRhbWVudGFsbHkgaGFzIGNoYW5nZWQsIGJ1dCBJIHN1c3Bl
Y3QgdGhhdCByYXRoZXIgeW91IGRvbuKAmXQgcXVpdGUgdW5kZXJzdGFuZCBob3cgdGhlIGN1cnJl
bnQgYnVpbGQgc3lzdGVtIGlzIHN1cHBvc2VkIHRvIHdvcmsuICAoSW4gd2hpY2ggY2FzZSBhIHdy
aXRlLXVwIGluIHRoZSB0cmVlIHdvdWxkIHByb2JhYmx5IGJlIHVzZWZ1bC4pCj4+Cj4+IEdvIGhh
cyBhbHdheXMgaW5zaXN0ZWQgdGhhdCB0aGVyZSBiZSBubyBiaW5hcnkgY29tcGF0aWJpbGl0eSBi
ZXR3ZWVuIHZlcnNpb25zOyBzbyBpdOKAmXMgYWx3YXlzIGJlZW4gbmVjZXNzYXJ5IHRvIHJlLWNv
bXBpbGUgYWxsIHlvdXIgbGlicmFyaWVzIHdoZW4gdXBncmFkaW5nIGZyb20gKHNheSkgMS44IHRv
IDEuOS4gIFdoaWNoIG1lYW5zIHRoYXQgYW55IHVzZWFibGUgZGlzdHJpYnV0aW9uIG11c3QgYWxz
byBpbmNsdWRlIGFsbCB0aGUgc291cmNlIGZpbGVzIG5lY2Vzc2FyeSB0byByZWNvbXBpbGUgd2hl
biB5b3UgYnVtcCB0aGUgdmVyc2lvbiBudW1iZXIuCj4+Cj4+IFNvIHRoZSBjb3JlIG1lY2hhbmlz
bSBvZiB0aGUg4oCcaW5zdGFsbOKAnSBpcyBhY3R1YWxseSB0byBjb3B5IGFsbCB0aGUgc291cmNl
IGZpbGVzIG5lY2Vzc2FyeSBpbnRvIHRoZSByaWdodCBsb2NhbCBkaXJlY3Rvcnkgc3VjaCB0aGF0
IHRoZSBnbyBjb21waWxlciBjYW4gZmluZCB0aGVtOyBBVE0gdGhpcyBpcyAvdXNyL3NoYXJlL2dv
Y29kZS9nb2xhbmcueGVucHJvamVjdC5vcmcveGVubGlnaHQKPiBOaXQ6ICBUaGlzIG9mIGNvdXJz
ZSBzaG91bGQgaGF2ZSBhIGBzcmMvYCBiZXR3ZWVuIGBnb2NvZGUvYCBhbmQgYGdvbGFuZy54ZW5w
cm9qZWN0Lm9yZy9gLgo+Cj4gTkIgYWxzbyB0aGF0IHRoaXMgbmFtaW5nIHNjaGVtZSB3YXMgZGVz
aWduZWQgc28gdGhhdCBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUsIHdlIGNvdWxkIGFjdHVh
bGx5IGhvc3QgdGhlIHhlbmxpZ2h0IHBhY2thZ2VzIGF0IHRoZSBVUkwgcHJvdmlkZWQuCj4KPiAg
LUdlb3JnZQo+CgpUaGlzIG5ldyBtZWNoYW5pc20gb2YgbW9kdWxlcyBpcyBkZXNjcmliZWQgaGVy
ZToKaHR0cHM6Ly9nb2xhbmcub3JnL2NtZC9nby8jaGRyLU1vZHVsZXNfX21vZHVsZV92ZXJzaW9u
c19fYW5kX21vcmUKClRoZSBtb2R1bGUgc3lzdGVtIGlzIGludGVuZGVkIHRvIHN1cGVyc2VkZSB0
aGUgR09QQVRIIGFwcHJvYWNoIGFuZApwcm92aWRlIGEgd2F5IHRvIGdldCB2ZXJzaW9uZWQgZGVw
ZW5kZW5jaWVzLCBhcyBzdWNoCml0IGRvZXMgbm90IHJlbHkgb24gR09QQVRIIGF0IGFsbCBhbmQg
ZG9lc24ndCB1c2Ugc291cmNlcyBvciBjb21waWxlZApwYWNrYWdlcyBwcmVzZW50IGluIEdPUEFU
SCBlbGVtZW50cyBzdWNoIGFzIC91c3Ivc2hhcmUvZ29jb2RlCmFuZCBzeXN0ZW1hdGljYWxseSBm
ZXRjaCAoYXQgdGhlIGFza2VkIHZlcnNpb24pIGFuZCBjb21waWxlIGEgY29weSBvZgp0aGUgZGVw
ZW5kZW5jeSBhcyBpdCBtaWdodCBiZSBhIGRpZmZlcmVudCB2ZXJzaW9uIGZyb20gdGhlIG9uZQpp
biBHT1BBVEguCgpBcyBmYXIgYXMgSSB0cmllZCwgSSBoYXZlIGJlZW4gdW5hYmxlIHRvIGJ1aWxk
IG15IG1vZHVsZSBldmVuIHdpdGggdGhlCmxpYnJhcnkgaW5zdGFsbGVkLgpJIGhhdmUgdG8gdXNl
IHhlbmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0L3Rvb2xzL2dvbGFuZy94ZW5saWdodCAo
b3IKb25lIG9mIGl0cyBtaXJyb3IpIGluIG9yZGVyIHRvIGJ1aWxkIHRoZSBtb2R1bGUgdXNpbmcg
dGhlIG5ldwptZWNoYW5pc20gKHRoZSBnb2xhbmcueGVucHJvamVjdC5vcmcveGVubGlnaHQgd29y
a3Mgd2hlbiBidWlsZGluZyB3aXRoCm1vZHVsZXMgbW9kZSBkaXNhYmxlZCkuCgpOaWNvbGFzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
