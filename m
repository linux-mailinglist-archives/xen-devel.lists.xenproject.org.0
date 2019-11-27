Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1610B3FE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:01:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0eI-0001kL-10; Wed, 27 Nov 2019 16:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ia0eH-0001kG-1g
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:58:41 +0000
X-Inumbo-ID: 290728a0-1137-11ea-a3ba-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 290728a0-1137-11ea-a3ba-12813bfff9fa;
 Wed, 27 Nov 2019 16:58:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 49B8EAB89;
 Wed, 27 Nov 2019 16:58:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191126150112.12704-1-andrew.cooper3@citrix.com>
 <20191126150112.12704-2-andrew.cooper3@citrix.com>
 <20191127091910.GL980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ea2e6b2-d4cd-bf8c-fc73-6c97cd54feac@suse.com>
Date: Wed, 27 Nov 2019 17:58:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127091910.GL980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] AMD/IOMMU: Always print IOMMU errors
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMDoxOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBO
b3YgMjYsIDIwMTkgYXQgMDM6MDE6MTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
VW5oYW5kbGVkIElPTU1VIGVycm9ycyAoaS5lLiBub3QgSU9fUEFHRV9GQVVMVCkgc2hvdWxkIHN0
aWxsIGJlIHByaW50ZWQsIGFuZAo+PiBub3QgaGlkZGVuIGJlaGluZCBpb21tdT1kZWJ1Zy4KPj4K
Pj4gV2hpbGUgYWRqdXN0aW5nIHRoaXMsIGZhY3RvciBvdXQgdGhlIHN5bWJvbGljIG5hbWUgaGFu
ZGxpbmcgdG8ganVzdCBvbmUKPj4gbG9jYXRpb24gZXhwb3NpbmcgaXRzIG9mZi1ieS1vbmUgbmF0
dXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29taT4KPiAKPiBMR1RNOgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cgo+IEkgd29uZGVyIGhvd2V2ZXIgd2hldGhlciBYRU5MT0dfR19FUlIgc2hvdWxk
IGJlIHVzZWQgaW5zdGVhZCBvZgo+IFhFTkxPR19FUlIgaW4gb3JkZXIgdG8gcmF0ZSBsaW1pdCBJ
T01NVSBmYXVsdHMgdHJpZ2dlcmVkIGJ5IGd1ZXN0cy4KCklPX1BBR0VfRkFVTFQgdXNlcyBYRU5M
T0dfRVJSIGFzIHdlbGwsIHNvIEknZCBzdGljayB0byBpdC4gSWYgdGhlcmUKYXJlIHJlYWxseSBt
YXNzaXZlIGFtb3VudHMgb2YgZmF1bHRzLCBsb2cgc3BhbSB3b24ndCBiZSBvdXIgb25seQpwcm9i
bGVtLCBJIHRoaW5rLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
