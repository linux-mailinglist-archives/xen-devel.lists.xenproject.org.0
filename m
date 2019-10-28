Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6AE701D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:06:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP2oC-0002kc-To; Mon, 28 Oct 2019 11:03:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ZfN=YV=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iP2oA-0002kW-SC
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:03:35 +0000
X-Inumbo-ID: 9447fe0a-f972-11e9-94f3-12813bfff9fa
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9447fe0a-f972-11e9-94f3-12813bfff9fa;
 Mon, 28 Oct 2019 11:03:32 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 6E097240107
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 12:03:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1572260611; bh=txI7WqiTmLDLFDbQE7rRVOwN1X+bPsa2j54e6MZfsTU=;
 h=Subject:To:Cc:From:Date:From;
 b=rP8i5oR+jBvUnV8UfvlHNoiHZ9Km8HmoanppUv1Fz/s3SSKkzP/DgRK8BYXzB3/St
 zuIA01LEZ9ShQXXJjPim089Y+9utAaZCoKB/3EtpDXDhW95H7Tmq8/aCGgc7AGGBq4
 kTF8MpAaM1Q1aQS3cYArY6KZN4UEYWLOqRekrR72QayPEFnDzFBvCIYn27wxUcpHvq
 LcSDAUWbimnDsqaJF8UK9KslN6Vv+8BduvQ8yBqEbx3Cxxn9tZppxE78+NT6d8+mxZ
 Jk+zHvSyeetG1hed+finFfD+FWtTqwFfoN8sNunTFVh7sEA8Z3VR/kd7zwjam3FKZg
 Tu7QOLG7K3+Ng==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 471sJx2CTtz9rxG;
 Mon, 28 Oct 2019 12:03:29 +0100 (CET)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh
 <netwiz@crc.id.au>, xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <JGross@suse.com>, Jan Beulich <JBeulich@suse.com>
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <cc16902a-bbad-00fe-291c-0b01c8231b60@posteo.de>
Date: Mon, 28 Oct 2019 12:03:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gQWxsLAoKPiBodHRwczovL3d3dy5yZWRkaXQuY29tL3IvQW1kL2NvbW1lbnRzL2NrcjVm
NC9hbWRfcnl6ZW5fMzAwMF9zZXJpZXNfbGludXhfc3VwcG9ydF9hbmQvCj4gaXMgY29uY2Vybmlu
ZyBLVk0sIGJ1dCBpdCBpZGVudGlmaWVkIHRoYXQgdGhlIFRPUE9FWFQgZmVhdHVyZSB3YXMKPiBp
bXBvcnRhbnQgdG8gZ2V0dGluZyB3aW5kb3dzIHRvIGJvb3QuCgpJIGp1c3QgdHJpZWQgcWVtdSAz
LjEuMSB3aXRoIEtWTSAoa2VybmVsIDUuMS4yMSkgb24gYSBSeXplbiAzNzAwWCBhbmQgCnN0YXJ0
ZWQgcWVtdSB3aXRoICItY3B1IGhvc3QsLXRvcG9leHQiIGFuZCBpdCBzdGlsbCB3b3JrcyBwZXJm
ZWN0bHkuIFNvIAppdCBzZWVtcyB0aGF0IFRPUE9FWFQgaXMgbm90IHJlbGV2YW50LgoKUmVnYXJk
cyBBbmRyZWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
