Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836913AF13
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:19:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOrj-0002rA-Fq; Tue, 14 Jan 2020 16:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irOrh-0002r0-VZ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:16:25 +0000
X-Inumbo-ID: 339eb800-36e9-11ea-83f4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 339eb800-36e9-11ea-83f4-12813bfff9fa;
 Tue, 14 Jan 2020 16:16:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FB43AB7D;
 Tue, 14 Jan 2020 16:16:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <204006bc-f6ba-bd08-5205-fa3869d52df9@suse.com>
Date: Tue, 14 Jan 2020 17:16:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113175020.32730-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] x86/boot: Rename l?_identmap to
 l?_directmap
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxODo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTaW5jZSBjL3MgZmFh
ODVkNGZiMyAieDg2L2Jvb3Q6IERvbid0IG1hcCAwIGR1cmluZyBib290IiwgbDFfaWRlbnRtYXAg
bm8KPiBsb25nZXIgaGFzIGFuIGFsaWFzIG1hcHBlZCBhdCAwLCBtZWFuaW5nIHRoYXQgbm9uZSBv
ZiB0aGUgbD9faWRlbnRtYXBbXQo+IHBhZ2V0YWJsZXMgYXJlIGFjdHVhbGx5IGFuIGlkZW50aXR5
IG1hcC4KPiAKPiBSZW5hbWUgdGhlbSB0byBsP19kaXJlY3RtYXAsIHdoaWNoIGF2b2lkcyBhbnkg
a2luZCBvZiBpbXBsaWNhdGlvbiB0aGF0IHRoZXkKPiBtaWdodCBiZSBtYXBwZWQgYXQgMC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
