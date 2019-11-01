Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4FECA16
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 22:01:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQdyS-0003UX-CZ; Fri, 01 Nov 2019 20:56:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIYi=YZ=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1iQdyR-0003UO-7N
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 20:56:47 +0000
X-Inumbo-ID: 1a78cf66-fcea-11e9-956e-12813bfff9fa
Received: from mail.zytor.com (unknown [198.137.202.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a78cf66-fcea-11e9-956e-12813bfff9fa;
 Fri, 01 Nov 2019 20:56:41 +0000 (UTC)
Received: from hanvin-mobl2.amr.corp.intel.com ([192.55.55.45])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id xA1Ku1Hi3597880
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 1 Nov 2019 13:56:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com xA1Ku1Hi3597880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019091901; t=1572641763;
 bh=3An007NMR3t5lhDsOPVJ9K0dkZrEaxbrM0ul5cfaPa4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kC/rRorYzspNXKHbAH3qWGpvmB1CgN+djkae1LWKmc8pl5Ljhbbx+OZuXSlpKJreR
 EtmIjUtI1/wXaD16smKcAatpd3ZUb8CuJ/ILid1PZ2Djqz0Qx0r6nOFq8dQOwkznxf
 meW8aP0YNx/p8Q2yGS61OPbIZg9oM3EASsRzsoYDoHaVVnQRdA+c+cCtFu5850FuJR
 D526P2FtSBEK7HnfjwYPQsBOcJrcpTFR7lxr9RQkbnCcQTcPgVXF6iTqho0EyR/+Sw
 IHfFNPB1eD3Mt7/NSMPdZojleTYu7yXr2Ti9Qo4IPDL30WRUfLF98uXYQNLpUGPHjs
 ePcOqSIqHfEDg==
To: Daniel Kiper <daniel.kiper@oracle.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
References: <20191024114814.6488-1-daniel.kiper@oracle.com>
 <20191024114814.6488-3-daniel.kiper@oracle.com>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <e094a1cf-6bf2-1e8a-94c7-47767d66138e@zytor.com>
Date: Fri, 1 Nov 2019 13:55:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024114814.6488-3-daniel.kiper@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
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
Cc: jgross@suse.com, eric.snowberg@oracle.com, ard.biesheuvel@linaro.org,
 konrad.wilk@oracle.com, corbet@lwn.net, peterz@infradead.org,
 ross.philipson@oracle.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, rdunlap@infradead.org, luto@kernel.org,
 kanth.ghatraju@oracle.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMC0yNCAwNDo0OCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IFRoaXMgZmllbGQgY29u
dGFpbnMgbWF4aW1hbCBhbGxvd2VkIHR5cGUgZm9yIHNldHVwX2RhdGEuCj4gCj4gTm93IGJ1bXAg
dGhlIHNldHVwX2hlYWRlciB2ZXJzaW9uIGluIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMuCgpQbGVh
c2UgZG9uJ3QgYnVtcCB0aGUgcHJvdG9jb2wgcmV2aXNpb24gaGVyZSwgb3RoZXJ3aXNlIHdlIHdv
dWxkIGNyZWF0ZQphIHZlcnkgb2RkIHBzZXVkby1yZXZpc2lvbiBvZiB0aGUgcHJvdG9jb2w6IDIu
MTUgd2l0aG91dCBTRVRVUF9JTkRJUkVDVApzdXBwb3J0LCBzaG91bGQgcGF0Y2ggMy8zIGVuZCB1
cCBnZXR0aW5nIHJldmVydGVkLgoKKEl0IGlzIHBvc3NpYmxlIHRvIGRldGVjdCwgb2YgY291cnNl
LCBidXQgSSBmZWVsIHByZXR0eSBzdXJlIGluIHNheWluZwp0aGF0IGJvb3Rsb2FkZXJzIHdvbid0
IGdldCBpdCByaWdodC4pCgpPdGhlciB0aGFuIHRoYXQ6CgpSZXZpZXdlZC1ieTogSC4gUGV0ZXIg
QW52aW4gKEludGVsKSA8aHBhQHp5dG9yLmNvbT4KCgktaHBhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
