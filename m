Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5D14DDFD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:37:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBqE-0008Tr-8o; Thu, 30 Jan 2020 15:34:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixBqC-0008Tk-OL
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:34:48 +0000
X-Inumbo-ID: 0bee2fa5-4376-11ea-8aa3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bee2fa5-4376-11ea-8aa3-12813bfff9fa;
 Thu, 30 Jan 2020 15:34:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB3BFAEFF;
 Thu, 30 Jan 2020 15:34:46 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-146578-mainreport@xen.org>
 <d89fdcee-8e9e-c804-5b00-2b0551eb03ef@suse.com>
 <20200130091853.GC4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8c3c1bd-85c1-d085-bcb4-9f85aeedd9d3@suse.com>
Date: Thu, 30 Jan 2020 16:34:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130091853.GC4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 146578: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxMDoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEph
biAzMCwgMjAyMCBhdCAxMDoxMjozOUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MzAuMDEuMjAyMCAwNDo1Niwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+Pj4gZmxpZ2h0
IDE0NjU3OCB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY1NzgvCj4+Pgo+Pj4gUmVncmVzc2lvbnMg
Oi0oCj4+Pgo+Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcs
Cj4+PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4+ICB0ZXN0LWFt
ZDY0LWFtZDY0LXhsLXFlbXV1LXdpbjctYW1kNjQgIDcgeGVuLWJvb3QgICAgICAgICBmYWlsIFJF
R1IuIHZzLiAxNDY1NjMKPj4KPj4gQWZhaWN0IGl0IGlzIG5vdCAieGVuLWJvb3QiIHdoaWNoIGZh
aWxlZCBoZXJlLCBidXQgdGhlIGdvaW5nCj4+IGRvd24gb2YgdGhlIHByaW9yIG5hdGl2ZSBrZXJu
ZWwgd2hpY2ggd2FzIHVzZWQgdG8gZG8gdGhlCj4+IGluc3RhbGw6Cj4+Cj4+IEphbiAyOSAyMzox
OTozNC4zNzA2NjMgWyAgMTgyLjQ3MjA3M10gZTEwMDBlOiBldGgwIE5JQyBMaW5rIGlzIERvd24K
Pj4gSmFuIDI5IDIzOjE5OjM2LjQ3MDU4NyBbICAxODIuNDc2NzI4XSBrdm06IGV4aXRpbmcgaGFy
ZHdhcmUgdmlydHVhbGl6YXRpb24KPj4gSmFuIDI5IDIzOjE5OjM2LjQ3MDY2MCBbICAxODIuNDgx
NTc0XSBzZCAzOjA6MDowOiBbc2RiXSBTeW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKPj4gSmFuIDI5
IDIzOjE5OjM2LjQ4MjYxNyBbICAxODIuNDg2ODc0XSBzZCAyOjA6MDowOiBbc2RhXSBTeW5jaHJv
bml6aW5nIFNDU0kgY2FjaGUKPj4gSmFuIDI5IDIzOjE5OjM2LjQ4MjY4MyBbICAxODIuNTI4MjYz
XSBlMTAwMGU6IEVFRSBUWCBMUEkgVElNRVI6IDAwMDAwMDAwCj4+IEphbiAyOSAyMzoxOTozNi41
MzA1MTYgWyAgMTgyLjUzNzAzNl0gZTEwMDBlOiBFRUUgVFggTFBJIFRJTUVSOiAwMDAwMDAwMAo+
PiBKYW4gMjkgMjM6MTk6MzYuNTMwNTgyIFsgIDE4Mi41NDQ1MDRdIHVzYiA2LTI6IFVTQiBkaXNj
b25uZWN0LCBkZXZpY2UgbnVtYmVyIDIKPj4gSmFuIDI5IDIzOjE5OjM2LjU0MjU3OSBbICAxODIu
NjI0MTI1XSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtCj4+IEphbiAyOSAyMzoxOTozNi42MTQ1
NTQgWyAgMTgyLjYyNTUyN10gQU1ELVZpOiBFdmVudCBsb2dnZWQgWwo+PiBKYW4gMjkgMjM6MTk6
MzYuNjI2NjcxIFsgIDE4Mi42MjU1MjddIElPX1BBR0VfRkFVTFQgZGV2aWNlPTAwOjEzLjEgZG9t
YWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdCj4+Cj4+
IFRoZXNlIGxhc3QgdHdvIGxpbmVzIHRoZW4gbG9vayB0byByZXBlYXQgaW5kZWZpbml0ZWx5LiBJ
cwo+PiB0aGVyZSBhIG5ldyBrZXJuZWwgdmVyc2lvbiBpbiB1c2Ugd2hpY2ggaGFzIHJlZ3Jlc3Nl
ZCBvbiB0aGlzCj4+IHBhcnRpY3VsYXIgaGFyZHdhcmU/Cj4gCj4gb3NzdGVzdCB3YXMgcmVjZW50
bHkgdXBncmFkZWQgdG8gdXNlIExpbnV4IDQuMTksIGJ1dCB0aGF0IHNlZW1zIHRvIGJlCj4gYSBz
cG9yYWRpYyBmYWlsdXJlLCBvdGhlciB0ZXN0cyBmcm9tIHRoZSB4ZW4tdW5zdGFibGUgYnJhbmNo
IHNlZW0gdG8KPiB3b3JrIGZpbmU6Cj4gCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9yZXN1bHRzL2hvc3QvcGlub3QwLmh0bWwKPiAKPiBNYXliZSB3ZSBjb3Vs
ZCBkaXNhYmxlIHRoZSBpb21tdSBvbiB0aGUgTGludXggY29tbWFuZCBsaW5lIHRvCj4gd29ya2Fy
b3V1bmQgdGhpcz8KCldlbGwsIEkgZG9uJ3Qga25vdyBpbiBob3cgZmFyIHRoZXJlIGlzIGNvbnRy
b2wgb3ZlciBpdC4gSXQncyBhZnRlcgphbGwgbm90IHNvbWV0aGluZyBhY3R1YWxseSBtYXR0ZXJp
bmcgZm9yIHRoZSBpbnRlbmRlZCB0ZXN0aW5nLiBCdXQKeWVzLCBpZiB0aGVyZSBpcyBzdWNoIGNv
bnRyb2wsIHRoZW4gdGhpcyBtaWdodCBiZSBhIChuIHVnbHkpIG9wdGlvbi4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
