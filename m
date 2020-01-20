Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4D14284D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 11:38:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itUP5-0007yS-VF; Mon, 20 Jan 2020 10:35:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itUP4-0007yN-O0
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 10:35:30 +0000
X-Inumbo-ID: 92339ae4-3b70-11ea-b947-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92339ae4-3b70-11ea-b947-12813bfff9fa;
 Mon, 20 Jan 2020 10:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BF592ABBD;
 Mon, 20 Jan 2020 10:35:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
 <20200117204223.30076-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d5bed04-6133-d376-f3b1-f755a404a68c@suse.com>
Date: Mon, 20 Jan 2020 11:35:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117204223.30076-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/5] x86/boot: Drop explicit %fs uses
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

T24gMTcuMDEuMjAyMCAyMTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgdHJhbXBvbGlu
ZSByZWxvY2F0aW9uIGNvZGUgdXNlcyAlZnMgZm9yIGFjY2Vzc2luZyBYZW4sIGFuZCB0aGlzIGNv
bWVzIHdpdGgKPiBhbiBhcmJpdHJhcnkgMTZNIGxpbWl0YXRpb24uICBXZSBjb3VsZCBhZGp1c3Qg
dGhlIGxpbWl0LCBidXQgdGhlIGJvb3QgY29kZSBpcwo+IGEgY29uZnVzaW5nIG1peCBvZiAlZHMv
JWVzaS1iYXNlZCBhbmQgJWZzLWJhc2VkIGFjY2Vzc2VzLCBhbmQgdGhlIHVzZSBvZiAlZnMKPiBp
cyBsb25nZXIgdG8gZW5jb2RlLCBhbmQgaW5jdXJzIGFuIGFkZHJlc3MgZ2VuZXJhdGlvbiBvdmVy
aGVhZC4KPiAKPiBSZXdyaXRlIHRoZSBsb2dpYyB0byB1c2UgJWRzLCBmb3IgYmV0dGVyIGNvbnNp
c3RlbmN5IHdpdGggdGhlIHN1cnJvdW5kaW5nCj4gY29kZSwgYW5kIGEgbWFyZ2luYWwgcGVyZm9y
bWFuY2UgaW1wcm92ZW1lbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
