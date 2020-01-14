Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C513A4FF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:08:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJ4c-0001Nr-NG; Tue, 14 Jan 2020 10:05:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tlDM=3D=amazon.com=prvs=2759622f1=jgrall@srs-us1.protection.inumbo.net>)
 id 1irJ4b-0001Nf-IP
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:05:21 +0000
X-Inumbo-ID: 5e2d5809-36b5-11ea-8361-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e2d5809-36b5-11ea-8361-12813bfff9fa;
 Tue, 14 Jan 2020 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578996319; x=1610532319;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wKAaZexLf5OQWOmPJPEDr9SJJlRsxTVsEanP3cntyWc=;
 b=mnnXWGYbblYvC5NhXN6hz8WBgHfTqin/3aYRgC9y2bfD33TLSM4Zomaw
 frVFzIG2EHZz0zdQ+JEBmqPk784+rlOcT0mzJ6sL+usydZBqsX/Ic0Chk
 NlwWP4bIrKoSo8RNclmfKiARjFvWocZnN2Bt9a5wND2liD87Ri9SPBWw4 8=;
IronPort-SDR: dtBqMSlTy04NL23UUFuzqf7hI57Y6m+70FORJ0xtEgZmO2yy6Dh/HQngFZwBSmrgsistyMKKYS
 Rxrp1TBPuaxg==
X-IronPort-AV: E=Sophos;i="5.69,432,1571702400"; d="scan'208";a="12873014"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 14 Jan 2020 10:05:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id C49BBA212B; Tue, 14 Jan 2020 10:05:16 +0000 (UTC)
Received: from EX13D19UEA004.ant.amazon.com (10.43.61.134) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 10:05:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D19UEA004.ant.amazon.com (10.43.61.134) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 10:05:10 +0000
Received: from a483e7b01a66.ant.amazon.com (10.55.230.32) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Tue, 14 Jan 2020 10:05:09 +0000
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-2-julien@xen.org>
 <f5dcdf24-f71c-164b-e770-594ea01bbe1e@suse.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <15d8bf61-5648-ea6b-2c65-f9ed28c349c0@amazon.com>
Date: Tue, 14 Jan 2020 10:05:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <f5dcdf24-f71c-164b-e770-594ea01bbe1e@suse.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/4] xen/x86: Remove unused forward
 declaration in asm-x86/irq.h
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDEvMjAyMCAwOTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMu
MDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgo+Pgo+PiBOb25lIG9mIHRoZSBwcm90b3R5cGVzIHdpdGhpbiB0
aGUgaGVhZGVyIGFzbS14ODYvaXJxLmggYWN0dWFsbHkgcmVxdWlyZXMKPj4gdGhlIGZvcndhcmQg
ZGVjbGFyYXRpb24gb2YgInN0cnVjdCBwaXJxIi4gU28gcmVtb3ZlIGl0Lgo+Pgo+PiBObyBmdW5j
dGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAKPiBJdCBpcyBnZW5lcmFsbHkgbmljZSB0byBpZGVudGlmeSBpZiB0aGlz
IHdhcyBtaXNzZWQgY2xlYW51cCAodGhlCj4gbmVlZCBpbmRlZWQgd2VudCBhd2F5IGluIDQuMTIp
LCBvciBpZiBzdWNoIGhhcyBuZXZlciByZWFsbHkgYmVlbgo+IG5lZWRlZC4KClllcyBpdCBpcyBu
aWNlIHRvIGhhdmUgYnV0IHRoaXMgaXMgYSBiZXN0IGVmZm9ydCBiYXNpcyBmb3IgY2xlYW51cC4g
VGhleSAKYXJlIG5vdCBmaXhlcyBhbmQgdGhlcmVmb3JlIG5vdCBnb2luZyB0byBiZSBiYWNrcG9y
dGVkLiBTbyBJIGRvbid0IGZlZWwgCnRoZSBuZWVkIHRvIGJyb3dzZSBtb3JlIHRoYW4gMTUgeWVh
cnMgd29ydGggb2YgaGlzdG9yeSBhbmQgY2hlY2sgd2hldGhlciAKYSBjbGVhbnVwIHdlcmUgbWlz
c2VkLgoKV2hhdCBtYXR0ZXIgZm9yIGNsZWFudXAgaXMgdGhlIGN1cnJlbnQgY29udGV4dCBhbmQg
d2hldGhlciB0aGV5IG1ha2UgCnNlbnNlIG5vdy4KCkFueXdheSwgSSB3b3VsZCBiZSBoYXBweSB0
byBhZGQgYSB3b3JkIGluIHRoZSBjb21taXQgbWVzc2FnZSBpZiB5b3UgCnBvaW50IG1lIHRvIHRo
ZSBjb21taXQgcmVtb3ZpbmcgdGhlIG5lZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
