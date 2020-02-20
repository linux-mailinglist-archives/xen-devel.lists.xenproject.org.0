Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF9165CE9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:45:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kEz-0000Zn-3W; Thu, 20 Feb 2020 11:43:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4kEx-0000Zh-Sv
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:43:35 +0000
X-Inumbo-ID: 3a4416aa-53d6-11ea-850a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a4416aa-53d6-11ea-850a-12813bfff9fa;
 Thu, 20 Feb 2020 11:43:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kEw-0007EP-Cj; Thu, 20 Feb 2020 11:43:34 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kEw-00084U-3P; Thu, 20 Feb 2020 11:43:34 +0000
Date: Thu, 20 Feb 2020 11:43:31 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220114331.m6yolb4hoyfvfmsa@debian>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
 <2a9a998e-f2d0-3c07-e85e-7fdda18b506e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a9a998e-f2d0-3c07-e85e-7fdda18b506e@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 5/5] libxl/PCI: align reserved device memory
 boundary for HAP guests
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDQ6NDc6NDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQXMgdGhlIGNvZGUgY29tbWVudCBzYXlzLCB0aGlzIHdpbGwgYWxsb3cgdXNlIG9mIGEg
Mk1iIHN1cGVyIHBhZ2UKPiBtYXBwaW5nIGF0IHRoZSBlbmQgb2YgImxvdyIgbWVtb3J5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0g
YS90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+
IEBAIC01NjMsNiArNTYzLDEzIEBAIGludCBsaWJ4bF9fZG9tYWluX2RldmljZV9jb25zdHJ1Y3Rf
cmRtKGwKPiAgICAgICAgICAvKiBKdXN0IGNoZWNrIGlmIFJETSA+IG91ciBtZW1vcnkgYm91bmRh
cnkuICovCj4gICAgICAgICAgaWYgKHJkbV9zdGFydCA+IHJkbV9tZW1fYm91bmRhcnkpIHsKPiAg
ICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogRm9yIEhBUCBndWVzdHMgcm91bmQgZG93
biB0byBhIDJNYiBib3VuZGFyeSB0byBhbGxvdyB1c2UKPiArICAgICAgICAgICAgICogb2YgbGFy
Z2UgcGFnZSBtYXBwaW5ncy4KPiArICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgIGlmIChs
aWJ4bF9kZWZib29sX3ZhbChkX2NvbmZpZy0+Y19pbmZvLmhhcCkKPiArICAgICAgICAgICAgICAg
ICYmIHJkbV9zdGFydCA+IDB4MjAwMDAwKQoKUGxlYXNlIHVzZSBNQigyKSBoZXJlLgoKV2l0aCB0
aGlzIGZpeGVkOgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
