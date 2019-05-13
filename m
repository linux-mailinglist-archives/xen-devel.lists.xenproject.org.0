Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0EA1BA54
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQD8Z-0002Jr-Mi; Mon, 13 May 2019 15:45:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQD8Y-0002Jh-Kc
 for xen-devel@lists.xen.org; Mon, 13 May 2019 15:45:10 +0000
X-Inumbo-ID: 165ab6f5-7596-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 165ab6f5-7596-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:45:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E534B341;
 Mon, 13 May 2019 08:45:08 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB14B3F71E;
 Mon, 13 May 2019 08:45:07 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
 <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
 <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
 <3fcde39c-5cda-b1b6-156c-48bae16a7c83@gmail.com>
 <449bd563-f256-432f-a542-110d9eae0d73@arm.com>
 <30412929-eae5-a013-5962-8b0874c8a3e2@gmail.com>
 <96bd557f-29c4-f0b7-3ccb-d00664ed9ff0@arm.com>
 <66a079a8-8bab-535c-1795-b831e927ea5d@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cb7753a4-5e83-ab0c-90c4-b80072685a9b@arm.com>
Date: Mon, 13 May 2019 16:45:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <66a079a8-8bab-535c-1795-b831e927ea5d@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuCgpPbiA1LzEzLzE5IDQ6NDIgUE0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gCj4gT24gMTMu
MDUuMTkgMTg6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gwqBGcm9tIG15IHVuZGVyc3RhbmRp
bmcsIGlmIHlvdSB3YW50IGNvbnNpc3RlbmN5LCB0aGVuIHNldHRpbmcgdGhlIAo+PiBhZmZpbml0
eSB3aWxsIGRlZmluaXRlbHkgaGVscC4gT3RoZXJ3aXNlLCB5b3UgbWF5IGhhdmUgdGhlIHNjaGVk
dWxlciAKPj4gdG8ga2ljayB1cCBhbmQgYWxzbyBiYWxhbmNpbmcuCj4gU29ycnksIGRvIHlvdSBt
ZWFuIHNldHRpbmcgYWZmaW5pdHkgZm9yIGRkIHByb2Nlc3Nlcywgb3IgRG9tMCBWQ1BVcywgb3Ig
Cj4gYm90aD8KCkkgd2FzIHNwZWFraW5nIGFib3V0IGRkIHByb2Nlc3MuIEJ1dCBEb20wIHZDUFVz
IG1pZ2h0IGFsc28gYmUgYSBnb29kIGlkZWEuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
