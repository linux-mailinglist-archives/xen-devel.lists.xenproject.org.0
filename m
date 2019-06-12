Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1341936
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 02:05:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haqiM-0000Qc-VT; Wed, 12 Jun 2019 00:02:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haqiL-0000QX-9B
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 00:02:05 +0000
X-Inumbo-ID: 4d4484c2-8ca5-11e9-bc1f-a326d407fa68
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d4484c2-8ca5-11e9-bc1f-a326d407fa68;
 Wed, 12 Jun 2019 00:02:02 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Jun
 2019 07:58:50 +0800
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <7ff3b338c811b5dbbd087428753f6e11@sslemail.net>
 <0973b477-d339-f3f2-7482-36589b93804e@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <e450249f-cc22-0e97-9de9-ef82ab2ae8d5@mxnavi.com>
Date: Wed, 12 Jun 2019 08:01:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0973b477-d339-f3f2-7482-36589b93804e@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/scheduler: remove 'name' from 'struct
 scheduler'
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMTg6MDQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gNi8xMS8xOSAyOjM1
IEFNLCBCYW9kb25nIENoZW4gd3JvdGU6Cj4+ICdzdHJ1Y3Qgc2NoZWR1bGVyJyBhbHJlYWR5IGhh
cyBtZW1iZXIgJ29wdF9uYW1lJyBhbmQgJ3NjaGVkX2lkJywKPj4gdGh1cyAnbmFtZScgaXMgYSBs
aXR0bGUgcmVkdW5kYW50LCBzbyByZW1vdmUgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJhb2Rv
bmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPiBJdCdzIG5vdCByZWR1bmRhbnQ7IG9u
ZSBpcyBhIGxvbmdlci1mb3JtIGh1bWFuLXJlYWRhYmxlIGRlc2NyaXB0aW9uLAo+IGFub3RoZXIg
aXMgYSBzaG9ydGhhbmQgIm9wdGlvbiIgZGVzY3JpcHRpb24uCj4KPiBZb3UgY2FuJ3QgYmUgc2F2
aW5nIG1vcmUgdGhhbiB3aGF0LCA1MDAgYnl0ZXMgaGVyZT8gIEkgdW5kZXJzdGFuZCB5b3UncmUK
PiB0cnlpbmcgdG8gY3V0IHRoaW5ncyBkb3duIGFzIHNtYWxsIGFzIHlvdSBjYW4sIGJ1dCB0aGlz
IHNlZW1zIGEgYml0Cj4gZXhjZXNzaXZlLgoKSGVsbG8gR2VvcmdlLAoKUm9nZXIgdGhhdC4KCkkg
dGhvdWdodCBiZXNpZGVzICduYW1lJywgYm90aCAnb3B0X25hbWUnIGFuZCAnc2NoZWRfaWQnIGNh
biBpZGVudGlmeQoKdGhlIHNjaGVkdWxlciBhbmQgdGhlICduYW1lJyBtYWlubHkgdXNlZCBpbiBs
b2dzLCB0aHVzIGNhbiBiZSByZW1vdmVkLgoKQXMgeW91ciBzdWdnZXN0aW9uLCBjYW4gbGVhdmUg
aXQgYXMgaXQgaXMuCgo+ICAgLUdlb3JnZQo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
