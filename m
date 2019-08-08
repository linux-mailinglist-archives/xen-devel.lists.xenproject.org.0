Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECFD86C29
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 23:16:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvpiP-000365-BX; Thu, 08 Aug 2019 21:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oW8A=WE=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1hvpiO-000360-3Q
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 21:12:52 +0000
X-Inumbo-ID: 4627092c-ba21-11e9-89e7-afaaa257bfd2
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4627092c-ba21-11e9-89e7-afaaa257bfd2;
 Thu, 08 Aug 2019 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJBoospY5/k1hp3DMrzjQBNmx7sirtgwxdRwAiEt2ps=; b=DM0SQcnTO9aeZX0huJ2XtnuCQY
 DWynuwbz7a9psyQvIr422+Rj7+YvVCW+VTQnkoXcrvjEQI/1Wka6bqVcGeuZ2xBi+fn95xe9qg8fT
 KcSO4FZRCSFooN4WnVOI/84dpS5LcdbcMf6bfzdo6YWXeUZ9ZHVCDacnv8Ves3Hbjjnk=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:44100
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1hvpiO-0002Ol-Hf; Thu, 08 Aug 2019 23:12:52 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
Date: Thu, 8 Aug 2019 23:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Xen-unstable staging build broken
 by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAyMzowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8wOC8yMDE5
IDIxOjU5LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IEhpIEFuZHJldywKPj4KPj4gSXQg
c2VlbXMgdGhlIHB2c2hpbSBwYXRjaGVzIGluIHhlbi11bnN0YWJsZSBzdGFnaW5nIGJyZWFrIHRo
ZSBidWlsZCBvbiBteSBtYWNoaW5lLgo+PiBJIGNsb25lZCBhIGZyZXNoIHRyZWUgdG8gYmUgc3Vy
ZSwgaGF2ZW4ndCBjaGVja2VkIHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBjYXVzZXMgaXQ6Cj4+
IDA2MGY0ZWVlMGZiNDA4YjMxNjU0ODc3NWFiOTIxZTE2YjdhY2QwZTAgb3IgMzJiMWQ2Mjg4N2Qw
MWY4NWYwYzFkMmUwMTAzZjY5Zjc0ZTFmNmZhMwo+Pgo+PiAtLQo+PiBTYW5kZXIKPj4KPj4KPj4K
Pj4gWyAtZCAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVu
c3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLWQgLW0wNzU1
IC1wIC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdAo+PiBbIC1kIC8vdXNyL2xvY2FsL2xpYi9kZWJ1
Zy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90
b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vz
ci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2FsL2xpYi94ZW4vYm9vdAo+PiBbICEgLWUgaHZtbG9h
ZGVyL2h2bWxvYWRlciBdIHx8IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdh
cmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgaHZtbG9hZGVyL2h2bWxvYWRl
ciAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKPj4gL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90
b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1tMDY0NCAtcCBzZWFiaW9z
LWRpci9vdXQvYmlvcy5iaW4gLy91c3IvbG9jYWwvbGliL3hlbi9ib290L3NlYWJpb3MuYmluCj4+
IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jv
c3MtaW5zdGFsbCAtbTA2NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9sb2NhbC9saWIveGVu
L2Jvb3QveGVuLXNoaW0KPj4gaW5zdGFsbDogY2Fubm90IHN0YXQgJ3hlbi1kaXIveGVuLXNoaW0n
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+IG1ha2VbNF06ICoqKiBbTWFrZWZpbGU6NTI6
IGluc3RhbGxdIEVycm9yIDEKPj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUnCj4+IG1ha2VbM106ICoqKiBbL3Vzci9z
cmMvbmV3L3hlbi11bnN0YWJsZS90b29scy8uLi90b29scy9SdWxlcy5tazoyMzc6IHN1YmRpci1p
bnN0YWxsLWZpcm13YXJlXSBFcnJvciAyCj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcv
dXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwo+PiBtYWtlWzJdOiAqKiogWy91c3Ivc3Jj
L25ldy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MjMyOiBzdWJkaXJzLWlu
c3RhbGxdIEVycm9yIDIKPj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25l
dy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzM6IGluc3Rh
bGxdIEVycm9yIDIKPj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94
ZW4tdW5zdGFibGUvdG9vbHMnCj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTMxOiBpbnN0YWxsLXRv
b2xzXSBFcnJvciAyCj4gCj4gVGhhdCdzIHdlaXJkLgo+IAo+IERvIHlvdSBoYXZlIHRoZSBmdWxs
IGxvZz/CoCBUaGUgcmVhbCBmYWlsdXJlIHdhcyBzb21ld2hlcmUgZWFybGllciB3aGVyZQo+IHhl
bi1zaGltIGRpZG4ndCBnZXQgc3RhcnRlZC4KPiAKPiB+QW5kcmV3Cj4gCgpIbW0gaWYgZm9yZ290
IGFuZCB0aHVzIGZvcmdvdCB0byBtZW50aW9uIG15IGJ1aWxkIHNjcmlwdCBkaXNhYmxlcyBzb21l
IHN0dWZmOgouL2NvbmZpZ3VyZSAtLWRpc2FibGUtcWVtdS10cmFkaXRpb25hbCAtLWRpc2FibGUt
c3R1YmRvbSAtLWRpc2FibGUtZG9jcyAtLWRpc2FibGUtcm9tYmlvcwoKQ291bGQgYmUgdGhhdCBv
bmUgb2YgdGhvc2UgZG9lc24ndCB3b3JrIGFueW1vcmUuCgotLQpTYW5kZXIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
