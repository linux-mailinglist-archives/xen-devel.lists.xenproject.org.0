Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC35B504
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 08:24:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhph8-0001Zs-67; Mon, 01 Jul 2019 06:21:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mUtp=U6=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hhph6-0001Zn-A3
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 06:21:40 +0000
X-Inumbo-ID: 7af0e65b-9bc8-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [217.70.182.73])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7af0e65b-9bc8-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 06:21:37 +0000 (UTC)
Received: from diconico07.gandi.net (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id 548521603CC;
 Mon,  1 Jul 2019 06:21:36 +0000 (UTC)
Date: Mon, 1 Jul 2019 08:21:36 +0200
From: Nicolas Belouin <nicolas.belouin@gandi.net>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190701062136.bb7eu3vrcsatrqov@diconico07.gandi.net>
References: <20190628083148.1747-1-nicolas.belouin@gandi.net>
 <18891f93-aedc-e67c-3e50-6583de3f2202@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18891f93-aedc-e67c-3e50-6583de3f2202@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] golang/xenlight: Fix type issues with
 recent Go version
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDYgMTg6MDUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gNi8yOC8xOSA5OjMxIEFN
LCBOaWNvbGFzIEJlbG91aW4gd3JvdGU6Cj4gPiBOZXdlciB2ZXJzaW9ucyBvZiBHbyBoYXZlIGJl
Y29tZSBzdHJpY3RlciBvbiBlbmZvcmNpbmcgdGhlIG5vIGltcGxpY2l0Cj4gPiBjb252ZXJzaW9u
cyBwb2xpY3kgd2hlbiB1c2luZyBDR28uCj4gPiBTcGVjaWZpY2FsbHksIHRoZSBmb2xsb3dpbmcg
dHdvIGNvbnZlcnNpb25zIGFyZSBubyBsb25nZXIgYWxsb3dlZDoKPiA+IAo+ID4gLSB1bnNhZmUu
UG9pbnRlciBiZWluZyBhdXRvbWF0aWNhbGx5IGNhc3QgdG8gYW55IEMgcG9pbnRlcgo+ID4gLSBB
IHBvaW50ZXIgdHlwZSBvdGhlciB0aGFuIHVuc2FmZS5Qb2ludGVyIGJlaW5nIGF1dG9tYXRpY2Fs
bHkgY2FzdCB0byBDCj4gPiB2b2lkICoKPiA+IAo+ID4gRml4IHRoaXMgYnkgYWRkaW5nIGV4cGxp
Y2l0IGNhc3RzIHdoZXJlIG5lY2Vzc2FyeS4KPiAKPiBUaGlzIGxvb2tzIGdvb2QsIGV4Y2VwdCBu
b3cgdGhlIGNvbW1pdCBtZXNzYWdlIGlzIHdyb25nOiBXZSdyZSBubyBsb25nZXIKPiBzaW1wbHkg
YWRkaW5nIGNhc3RzOyB3ZSdyZSBjaGFuZ2luZyBDb250ZXh0LmxvZ2dlciBmcm9tCj4gKkMueGVu
dG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0gdG8gKkMueGVudG9vbGxvZ19sb2dnZXIuICBUaGF0
IG5lZWRzIHRvCj4gYmUgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiAKPiBJIHRo
aW5rIGdpdmVuIHdoYXQgeW91IHNhaWQgYWJvdXQgYXV0b21hdGljIHBvaW50ZXIgY29udmVyc2lv
bgo+IHRoZW9yZXRpY2FsbHkgbmV2ZXIgYmVpbmcgT0ssIEkgbWlnaHQgc2F5IHRoaXMgaW5zdGVh
ZDoKPiAKPiAtLS0KPiBUaGVvcmV0aWNhbGx5IEdvIGhhcyBuZXZlciBhbGxvd2VkIGF1dG9tYXRp
YyBwb2ludGVyIGNvbnZlcnNpb25zOyBidXQgaW4KPiBwcmFjdGljZSBlYXJsaWVyIHZlcnNpb25z
IGxldCBzb21lIGNvbnZlcnNpb25zIHNsaWRlLiAgTmV3ZXIgY29tcGlsZXJzCj4gYXJlIG1vcmUg
c3RyaWN0LCBzbyBtYWtlIHN1cmUgdGhhdCBhbGwgcG9pbnRlcnMgYXJlIGNvbnZlcnRlZCBleHBs
aWNpdGx5Cj4gdGhlIGFwcHJvcHJpYXRlIHR5cGVzLgo+IAo+IENoYW5nZSBDb250ZXh0LmxvZ2dl
cidzIHR5cGUgdG8gKkMueGVudG9vbGxvZ19sb2dnZXIsIGFzIHRoYXQncyB0aGUgbW9yZQo+IGdl
bmVyaWMgdHlwZSwgYW5kIHJlc3VsdHMgaW4gZmV3ZXIgbWFudWFsIHBvaW50ZXIgY29udmVyc2lv
bnMuCj4gLS0tCj4gCj4gSWYgeW91J3JlIE9LIHdpdGggdGhlIGFib3ZlIEkgY2FuIGNoYW5nZSBp
dCBvbiBjaGVjay1pbi4KCkknbSBPSyB3aXRoIHRoZSBjaGFuZ2UsIHRoYW5rcy4KCj4gCj4gT3Ro
ZXJ3aXNlOgo+IAo+IFJldmlld2VkLWJ5OiAgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
