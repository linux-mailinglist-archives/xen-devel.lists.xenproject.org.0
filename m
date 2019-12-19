Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E709126096
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:12:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtgw-00044T-8S; Thu, 19 Dec 2019 11:10:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihtgu-000405-Uz
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:10:00 +0000
X-Inumbo-ID: 18b78a42-2250-11ea-9187-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18b78a42-2250-11ea-9187-12813bfff9fa;
 Thu, 19 Dec 2019 11:10:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B0FEB15F;
 Thu, 19 Dec 2019 11:09:59 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191218160926.12538-1-pdurrant@amazon.com>
 <f72c26d5-ba96-5804-126a-865af62ceff1@citrix.com>
 <671333aff34f4e92bded1ad705264e02@EX13D32EUC003.ant.amazon.com>
 <0a4f237a-b744-50f8-7bd2-e53ddffea78e@citrix.com>
 <80696690f8874a4da7a6c2f724cc78b4@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58aa0364-6ca0-8489-91aa-8f2fcc3d61af@suse.com>
Date: Thu, 19 Dec 2019 12:10:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <80696690f8874a4da7a6c2f724cc78b4@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxMjowNiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPj4gU2VudDogMTkgRGVjZW1iZXIgMjAxOSAxMDo1Mgo+PiBUbzogRHVycmFudCwg
UGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIXSB4ODYvc2F2ZTogcmVzZXJ2ZSBIVk0gc2F2ZSBy
ZWNvcmQgbnVtYmVycwo+PiB0aGF0IGhhdmUgYmVlbiBjb25zdW1lZC4uLgo+Pgo+PiBPbiAxOS8x
Mi8yMDE5IDA4OjUyLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mCj4+Pj4gQW5kcmV3IENvb3Blcgo+Pj4+IFNlbnQ6
IDE4IERlY2VtYmVyIDIwMTkgMTk6NDUKPj4+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRA
YW1hem9uLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4+IENjOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIg
UGF1Cj4+IE1vbm7DqQo+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+PiBTdWJqZWN0OiBS
ZTogW1hlbi1kZXZlbF0gW1BBVENIXSB4ODYvc2F2ZTogcmVzZXJ2ZSBIVk0gc2F2ZSByZWNvcmQK
Pj4gbnVtYmVycwo+Pj4+IHRoYXQgaGF2ZSBiZWVuIGNvbnN1bWVkLi4uCj4+Pj4KPj4+PiBPbiAx
OC8xMi8yMDE5IDE2OjA5LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+IC4uLmZvciBwYXRjaGVz
IG5vdCAoeWV0KSB1cHN0cmVhbS4KPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCBpcyBzaW1wbHkgcmVz
ZXJ2aW5nIHNhdmUgcmVjb3JkIG51bWJlciBzcGFjZSB0byBhdm9pZCB0aGUKPj4+Pj4gcmlzayBv
ZiBjbGFzaGVzIGJldHdlZW4gZXhpc3RlbnQgZG93bnN0cmVhbSBjaGFuZ2VzIG1hZGUgYnkgQW1h
em9uIGFuZAo+Pj4+PiBmdXR1cmUgdXBzdHJlYW0gY2hhbmdlcyB3aGljaCBtYXkgYmUgaW5jb21w
YXRpYmxlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGFtYXpvbi5jb20+Cj4+Pj4gSXMgdGhpcyAieW91J3ZlIGFscmVhZHkgdXNlZCBzb21lIG9mIHRo
ZXNlIiwgb3IgeW91IHBsYW4gdG8/Cj4+PiBBbHJlYWR5IHVzZWQgaW4gY29kZSB0aGF0IGhhcyBi
ZWVuIGRlcGxveWVkLCBhbHRob3VnaCBJIGhhdmUgbGVmdCBzb21lCj4+IGhlYWRyb29tIGJlY2F1
c2UgSSBrbm93IHRoZXJlIGlzIGNvZGUgaW4gZGV2ZWxvcG1lbnQgd2hpY2ggaXMgdXNpbmcgbmV3
Cj4+IG9uZXMuCj4+Pgo+Pj4gV2hlcmUgcmVjb3JkcyBjYW4gYmUgdXBzdHJlYW1lZCBpbiBhIHdh
eSB0aGF0IGlzIGNvbXBhdGlibGUgd2l0aAo+PiBkb3duc3RyZWFtIHVzZSwgd2Ugd2lsbCBrZWVw
IHRoZSBleGlzdGluZyBudW1iZXIuIElmIGluY29tcGF0aWJsZSBjaGFuZ2VzCj4+IGFyZSBuZWNl
c3NhcnkgdG8gZ2V0IHRoZSBjb2RlIHVwc3RyZWFtIHRoZW4gd2Ugd2lsbCBoYXZlIHRvIHVzZSBh
IG5ldwo+PiBudW1iZXIgYW5kIG1haW50YWluIGRvd25zdHJlYW0gY29tcGF0aWJpbGl0eSBwYXRj
aGVzLgo+Pgo+PiBFdmVyeSBidW1wIHRvIHRoaXMgbnVtYmVyIGlzIG1vcmUgd2FzdGVkIG1lbW9y
eSBpbiBYZW4uCj4gCj4gSG93IG11Y2ggbW9yZSBtZW1vcnk/CgpJdCBpcywgYnR3LCBub3QganVz
dCBtZW1vcnksIGJ1dCBhbHNvIGEgaGlnaGVyIG51bWJlciBvZiBsb29wCml0ZXJhdGlvbnMuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
