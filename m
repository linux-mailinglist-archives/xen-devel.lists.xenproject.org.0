Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A885116D43
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:43:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieIJM-00069r-00; Mon, 09 Dec 2019 12:38:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zX1n=Z7=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ieIJK-00069l-IA
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:38:46 +0000
X-Inumbo-ID: d6d763bc-1a80-11ea-87c9-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6d763bc-1a80-11ea-87c9-12813bfff9fa;
 Mon, 09 Dec 2019 12:38:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so16032627wrh.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 04:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1FPLFTEVOBeKChXWE0aFTyZ/y6UyvGazpGA7Ni2ItR4=;
 b=B9QAgRQfoz9WtFUD6UrqkxDRik7MYvURx7xUL4dhDm4CzxuS5C62xvsKQZFAmsRHsX
 FkddT9vkXJXKkDJcE0DLcIdgMWpeDMC4sHmENM/TtU7eogTyNkiRQRacfQ/NaQCt0VwQ
 u/XPnzSB0Qx/TC3DwrmVQgbYUQuKq/1sonwJit1W9fZWDet+AdTAjJiQmXofHZG7gy5X
 m3fLn+JdA6PEbN1J6k2hV0HDZ/3PWuaDaVMOOWM+r0VmcNX9m7CvIgkgdNgACBdmIBN/
 80wcXUYJrS3FxrKbexDSL1c1cK1aTGRbrMxS9edZ4Qr0O71YySEovMWNAqRwfkIaayO3
 IqoA==
X-Gm-Message-State: APjAAAXgkIWT90SduAOWcYKYM/UhpxiCvyrooY2+JA54JC/SrR5ETC34
 9LwGx5peY8qWhA7CvIEykWg=
X-Google-Smtp-Source: APXvYqx1PpWVKC48JNODZ13XBBTGMrjQynTWPCi/p35MPuudjKQr+aqIAaQODbpJQSHtWSixImOleg==
X-Received: by 2002:adf:82e7:: with SMTP id 94mr2021758wrc.60.1575895124735;
 Mon, 09 Dec 2019 04:38:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id n16sm27243226wro.88.2019.12.09.04.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 04:38:44 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
 <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
 <6ca0c51b-eb61-338f-4592-e7dd6ea3dc61@citrix.com>
 <17af65cf-fdbe-928e-e018-ee3dad31b59d@suse.com>
 <18da6d78-aac2-6a94-9b06-17a138c4aa64@citrix.com>
 <2b241b5b-7ca3-e2ae-3642-0d921797a6cd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <42d4c701-dd1e-2d0a-5cc3-56506bb19893@xen.org>
Date: Mon, 9 Dec 2019 12:38:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2b241b5b-7ca3-e2ae-3642-0d921797a6cd@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDkvMTIvMjAxOSAxMjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYu
MTIuMjAxOSAyMjowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMTEvMjAxOSAxNDow
MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBCb3R0b20gbGluZSAtIEknbSBoYWxmIGNvbnZpbmNl
ZCBhbmQgd2lsbGluZyB0byBnaXZlIG15IGFjaywgYnV0Cj4+PiBJJ20gbm90IGNvbnZpbmNlZCB5
b3UgdHJ1bHkgdGhvdWdodCB0aHJvdWdoIHRoZSBsb25nZXIgdGVybQo+Pj4gY29uc2VxdWVuY2Vz
LiBJJ2QgdGhlcmVmb3JlIGJlIGZhciBoYXBwaWVyIHRvIHNlZSB0aGlzIHBhdGNoCj4+PiBzcGxp
dCBpbnRvIGEgbm9uLWNvbnRyb3ZlcnNpYWwgcGFydCAoYW55dGhpbmcgdGhhdCdzIG5vdCB0aWVk
IHRvCj4+PiB0aGUgQUNQSSBhbmQgRUZJIGhlYWRlciBpbXBvcnRzKSwgYW4gQUNQSSwgYW5kIGFu
IEVGSSBwYXJ0Lgo+Pgo+PiBJIGRvIG5vdCB3YW50IHRvIHdyaXRpbmcgdGhlIHNhbWUgcGF0Y2gg
YWdhaW4gaW4gJE4geWVhcnMgdGltZSBiZWNhdXNlCj4+IHJldmlldyBhbmQgQ0kgbWlzc2VkIGl0
IGNyZWVwaW5nIGJhY2sgaW4uCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhbiB1bnJlYXNv
bmFibGUgcG9zaXRpb24gdG8gdGFrZS4KPiAKPiBJdCBmb3Igc3VyZSBpc24ndC4gWWV0IEkgYWxz
byBkb24ndCB0aGluayB0aG91Z2ggbXkgcmVxdWVzdCBob3cgdG8KPiBzcGxpdCB0aGluZ3MgaXMu
IEJ5IGFza2luZyBmb3IgdGhlIHNwbGl0IEknbSBpbXBseWluZyB0aGF0IHdlIG1heQo+IHN0aWxs
IHJlYWNoIGFncmVlbWVudCBvbiB0aGUgY29udHJvdmVyc2lhbCBwYXJ0cywgZmFvZC4gU2FkbHkg
b25jZQo+IGFnYWluIHRoZXJlIGFyZSBubyBvdGhlciBvcGluaW9ucyBoZWxwaW5nIHRvIHNvcnQg
d2hpY2ggcm91dGUgbWF5Cj4gYmUgdGhlIG92ZXJhbGwgcHJlZmVycmVkIG9uZS4KCldlbGwsIGZv
ciBhIGZpcnN0LCBJIGRvbid0IHRoaW5rIEkgaGF2ZSBzZWVuIGFueSBleHBsaWNpdCByZXF1ZXN0
IGZvciAKb3BpbmlvbiBzbyBmYXIgYW5kIG5vdCBhbGwgdGhlIHJlbGV2YW50IG1haW50YWluZXJz
IGhhdmUgYmVlbiBDQ2VkIGhlcmUuCgpJbiBnZW5lcmFsLCBJIHRlbmQgdG8gc3RheSBjbGVhciBm
cm9tIGFyZ3VtZW50IGJldHdlZW4geW91IGFuZCBBbmRyZXcgdG8gCmF2b2lkIGJlZW4gZHJhZ2dl
ZCBpbnRvIGJpa2VzaGVkZGluZy4KCkFueXdheSwgd2hpbGUgSSB1bmRlcnN0YW5kIHRoYXQgd2Ug
d2FudCB0byBrZWVwIGFzIGNsb3NlIGFzIHVwc3RyZWFtLCAKdGhvc2UgaGVhZGVycyBhcmUgbm90
IHJlc3luYyB2ZXJ5IG9mdGVuIGFuZCB0aGUgY2hhbmdlcyBhcmUgbWluaW1hbC4gVGhlIApsb25n
IHRlcm0gY29uc2VxdWVuY2UgaXMgbm90IGFib3V0IHJlc3luYyBidXQga2VlcGluZyBib2d1cyBj
b2RlIHRoYXQgCmNhbiBiZSB1c2VkIGJ5IGV2ZXJ5b25lLgoKU28gdGhlIHBhdGNoIGl0c2VsZiBp
cyBhIGdvb2Qgc3RlcCBmb3J3YXJkIHRvIG1ha2UgWGVuIGJldHRlci4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
