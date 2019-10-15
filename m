Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6BAD7C41
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:47:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPwn-0007wA-BC; Tue, 15 Oct 2019 16:45:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKPwm-0007w4-C6
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:45:20 +0000
X-Inumbo-ID: 2c298584-ef6b-11e9-9397-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2c298584-ef6b-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:45:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FC4F337;
 Tue, 15 Oct 2019 09:45:19 -0700 (PDT)
Received: from [10.37.13.17] (unknown [10.37.13.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60D653F68E;
 Tue, 15 Oct 2019 09:45:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20190815172944.14163-1-julien.grall@arm.com>
 <062d7e11-1933-37ab-5f04-555c9c36d04f@arm.com>
Message-ID: <f6d2664a-3869-fd1e-5557-f1e0522f0596@arm.com>
Date: Tue, 15 Oct 2019 17:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <062d7e11-1933-37ab-5f04-555c9c36d04f@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: domain_build: Print the correct
 domain in dtb_load()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCkdlbnRsZSBwaW5nLgoKQ2hlZXJzLAoKT24gMTAvMTAvMTkgMzo0MyBQTSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IEhtbSwgaXQgbG9va3MgbGlrZSBJIGZvcmdv
dCB0aGlzIHBhdGNoIGJlZm9yZSB0aGUgZnJlZXplLiBKdWVyZ2VuLCBhcmUgCj4geW91IGhhcHB5
IHdpdGggdGhpcyB0byBnbyBpbiBYZW4gNC4xMz8KPiAKPiBDaGVlcnMsCj4gCj4gT24gMTUvMDgv
MjAxOSAxODoyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBkdGJfbG9hZCgpIGNhbiBiZSBjYWxs
ZWQgYnkgb3RoZXIgZG9tYWluIHRoYW4gZG9tMC4gVG8gYXZvaWQgY29uZnVzaW9uCj4+IGluIHRo
ZSBsb2csIHByaW50IHRoZSBjb3JyZWN0IGRvbWFpbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gLS0tCj4+IMKgwqDCoMKgIENo
YW5nZXMgaW4gdjI6Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBGaXggdGhlIHNlY29uZCBwcmludCBp
biB0aGUgZnVuY3Rpb24gYXMgd2VsbC4KPj4gLS0tCj4+IMKgIHhlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyB8IDggKysrKystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+PiBpbmRleCA0ZTUxZTIyOTI3
Li4xMjYzNzRmNjAzIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+IEBAIC0xNzg3LDE1ICsxNzg3
LDE3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkdGJfbG9hZChzdHJ1Y3Qga2VybmVsX2luZm8gCj4+
ICpraW5mbykKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbGVmdDsKPj4gLcKg
wqDCoCBwcmludGsoIkxvYWRpbmcgZG9tMCBEVEIgdG8gMHglIlBSSXBhZGRyIi0weCUiUFJJcGFk
ZHIiXG4iLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAga2luZm8tPmR0Yl9wYWRkciwga2luZm8t
PmR0Yl9wYWRkciArIAo+PiBmZHRfdG90YWxzaXplKGtpbmZvLT5mZHQpKTsKPj4gK8KgwqDCoCBw
cmludGsoIkxvYWRpbmcgJXBkIERUQiB0byAweCUiUFJJcGFkZHIiLTB4JSJQUklwYWRkciJcbiIs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBraW5mby0+ZCwga2luZm8tPmR0Yl9wYWRkciwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIGtpbmZvLT5kdGJfcGFkZHIgKyBmZHRfdG90YWxzaXplKGtp
bmZvLT5mZHQpKTsKPj4gwqDCoMKgwqDCoCBsZWZ0ID0gY29weV90b19ndWVzdF9waHlzX2ZsdXNo
X2RjYWNoZShraW5mby0+ZCwga2luZm8tPmR0Yl9wYWRkciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBraW5mby0+ZmR0LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZkdF90b3RhbHNpemUoa2luZm8tPmZkdCkpOwo+PiDCoMKgwqDCoMKgIGlmICggbGVmdCAh
PSAwICkKPj4gLcKgwqDCoMKgwqDCoMKgIHBhbmljKCJVbmFibGUgdG8gY29weSB0aGUgRFRCIHRv
IGRvbTAgbWVtb3J5IChsZWZ0ID0gJWx1IAo+PiBieXRlcylcbiIsIGxlZnQpOwo+PiArwqDCoMKg
wqDCoMKgwqAgcGFuaWMoIlVuYWJsZSB0byBjb3B5IHRoZSBEVEIgdG8gJXBkIG1lbW9yeSAobGVm
dCA9ICVsdSAKPj4gYnl0ZXMpXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2lu
Zm8tPmQsIGxlZnQpOwo+PiDCoMKgwqDCoMKgIHhmcmVlKGtpbmZvLT5mZHQpOwo+PiDCoCB9Cj4+
Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
