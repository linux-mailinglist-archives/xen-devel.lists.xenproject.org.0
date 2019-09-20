Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27BB8CF9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:33:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBEHT-00035B-Nb; Fri, 20 Sep 2019 08:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBEHS-00034u-9l
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:28:42 +0000
X-Inumbo-ID: a3d281fc-db80-11e9-9686-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3d281fc-db80-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 08:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4FF1B634;
 Fri, 20 Sep 2019 08:28:35 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
 <e75f5253-df1d-2d47-6724-df06d1a33448@suse.com>
 <8571e4db-d3dc-6a58-8711-2947c97f8953@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12a5fc3c-8ded-21f9-3cb6-ea7caa8d585a@suse.com>
Date: Fri, 20 Sep 2019 10:28:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8571e4db-d3dc-6a58-8711-2947c97f8953@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMjAxOSAyMzozOCwgSm9lIEppbiB3cm90ZToKPiBPbiA5LzE5LzE5IDM6MjQgQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+PiBXaGF0J3MKPj4gc3RpbGwgbWlzc2luZyBpcyB0aGUgZnVy
dGhlciB1cGRhdGluZyBvZiBwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkCj4+IChhcyBleHBs
YWluZWQgYmVmb3JlLCBzdGlsbCB2aXNpYmxlIGluIGNvbnRleHQgYWJvdmUpLgo+Pgo+IAo+ICA0
MjIKPiAgNDIzICAgICAgICAgZGVzdF92Y3B1X2lkID0gaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQo
ZCwgZGVzdCwgZGVzdF9tb2RlKTsKPiAgNDI0ICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmRlc3Rf
dmNwdV9pZCA9IGRlc3RfdmNwdV9pZDsKPiAKPiBkZXN0X3ZjcHVfaWQgdXBkYXRlZCBsYXRlciBi
eSBhYm92ZSBjb2RlLCBkbyBJIG1pc3NlZCBzb21ldGhpbmc/CgpUaGlzIHBpZWNlIG9mIGNvZGUK
CiAgICAgICAgaWYgKCBpb21tdV9pbnRwb3N0ICkKICAgICAgICB7CiAgICAgICAgICAgIGlmICgg
ZGVsaXZlcnlfbW9kZSA9PSBkZXN0X0xvd2VzdFByaW8gKQogICAgICAgICAgICAgICAgdmNwdSA9
IHZlY3Rvcl9oYXNoaW5nX2Rlc3QoZCwgZGVzdCwgZGVzdF9tb2RlLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmd2ZWMpOwogICAgICAg
ICAgICBpZiAoIHZjcHUgKQogICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLnBvc3RlZCA9
IHRydWU7CiAgICAgICAgfQoKdXBkYXRlcyB0aGUgdkNQVSB0byBiZSBkZWxpdmVyZWQgdG8uIFJp
Z2h0IG5vdywgd2hlbiB0aGUgInBvc3RlZCIKZmxhZyBpcyBzZXQsIHRoZSBkZXN0X3ZjcHVfaWQg
ZmllbGQgaXMgdW51c2VkIChhcyBmYXIgYXMgSSB3YXMKYWJsZSB0byB0ZWxsKSwgYW5kIGhlbmNl
IGRpZG4ndCBuZWVkIHNldHRpbmcuIFRoZSB3YXkgeW91IGludGVuZAp0byBjaGFuZ2UgdGhpbmdz
LCB5b3Ugd2FudCB0byB1c2UgdGhlIGZpZWxkIGFsc28gaW4gdGhlICJwb3N0ZWQiCmNhc2UsIGFu
ZCBoZW5jZSB5b3UgYWxzbyBzaG91bGQgdXBkYXRlIGl0IGluIHRoZSBjb2RlIHBhdGggYWJvdmUu
CgpCdXQgcGxlYXNlIGRvdWJsZSBjaGVjayBhbGwgb2YgdGhpcy4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
