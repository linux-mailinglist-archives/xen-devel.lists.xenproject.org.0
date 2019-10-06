Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99213CCFC6
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2019 11:04:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iH2Pe-0004SK-PJ; Sun, 06 Oct 2019 09:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PE/n=X7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iH2Pd-0004SF-Me
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2019 09:01:09 +0000
X-Inumbo-ID: d45f2cfa-e817-11e9-978f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d45f2cfa-e817-11e9-978f-12813bfff9fa;
 Sun, 06 Oct 2019 09:01:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2ED12AF68;
 Sun,  6 Oct 2019 09:01:05 +0000 (UTC)
To: Andy Smith <andy@strugglers.net>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191006051907.GY12975@bitfolk.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <07e968fc-4b3f-8f26-927d-3c0f349ba3f5@suse.com>
Date: Sun, 6 Oct 2019 11:01:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191006051907.GY12975@bitfolk.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Xen-users] xenstat_domain_cpu_ns() occasionally
 returns a huge value
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
Cc: xen-users@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTAuMTkgMDc6MTksIEFuZHkgU21pdGggd3JvdGU6Cj4gSGksCj4gCj4gSSB3YXMgd3Jp
dGluZyBhIGxpdHRsZSB1dGlsaXR5IHRvIGR1bXAgb3V0IGRvbWFpbiBDUFUgdGltZXMgYW5kIEkK
PiBub3RpY2VkIHRoYXQgb2NjYXNpb25hbGx5IHhlbnN0YXRfZG9tYWluX2NwdV9ucygpIHJldHVy
bnMgYW4KPiBlcnJvbmVvdXMgaHVnZSB2YWx1ZSBsaWtlIDkyMjM0ODgwMzQ0Nzc0NTcwMTMuCj4g
Cj4gQXR0YWNoZWQgaXMgYSBzbWFsbCB0ZXN0IHByb2dyYW0gdGhhdCBqdXN0IHJlcXVlc3RzIGV2
ZXJ5IGRvbWFpbidzCj4gQ1BVIHRpbWUgaW4gYSB0aWdodCBsb29wOyBpdCByZWNlaXZlZCBzdWNo
IGEgcmVzdWx0IGFmdGVyIGxlc3MgdGhhbgo+IDMgbWludXRlcyBydW5uaW5nIGluIGRvbTAgb2Yg
YSBob3N0IHdpdGggb25seSBkb20wIGFuZCB0d28gb3RoZXIgUFYKPiBkb21haW5zIHJ1bm5pbmc6
Cj4gCj4gJCBtYWtlIGNwdV90aW1lX3Rlc3QKPiBjYyAtV2FsbCAgLWx4ZW5zdGF0IC1seWFqbCAt
V2wsLXJwYXRoLC91c3IvbGliL3hlbi00LjEyL2xpYiAtTC91c3IvbGliL3hlbi00LjEyL2xpYiAg
Y3B1X3RpbWVfdGVzdC5jICAgLW8gY3B1X3RpbWVfdGVzdAo+ICQgc3VkbyB0aW1lIC4vY3B1X3Rp
bWVfdGVzdAo+IEdvdCBhIHdlaXJkIENQVSB0aW1lIDkyMjM0ODgxMDguODY3MzA1ID4xMDAgeWVh
cnMgKGNwdV9ucz05MjIzNDg4MTA4ODY3MzA0ODE4KQo+IENvbW1hbmQgZXhpdGVkIHdpdGggbm9u
LXplcm8gc3RhdHVzIDEKPiA4NC4wN3VzZXIgNDEuOTBzeXN0ZW0gMjo0MC4yMGVsYXBzZWQgNzgl
Q1BVICgwYXZndGV4dCswYXZnZGF0YSAzOTc4MG1heHJlc2lkZW50KWsKPiAwaW5wdXRzKzBvdXRw
dXRzICgwbWFqb3IrOTU0MW1pbm9yKXBhZ2VmYXVsdHMgMHN3YXBzCj4gCj4gVGhlIGVycm9uZW91
cyByZXN1bHRzIGFyZSBhbHdheXMgc29tZXdoZXJlIGFib3ZlIDkyMnh4eHh4eHh4eHh4eHh4eHgK
PiBuYW5vc2Vjb25kcyAoc29tZSAyODUgeWVhcnMgb2YgQ1BVIHRpbWUgaWYgaXQgd2VyZSBnZW51
aW5lISkuIFRoZW4KPiB0aGUgbmV4dCByZWFkaW5nIHdpbGwgYmUgbm9ybWFsLiBWZXJ5IG9jY2Fz
aW9uYWxseSBJJ3ZlIHNlZW4gdHdvIGluCj4gYSByb3cuIEkgc2VlIHRoaXMgb24gYm90aCA0LjEy
IGFuZCA0LjEwLgo+IAo+IE15IEMgaXMgdmVyeSBydXN0eSBzbyBJJ3ZlIHByb2JhYmx5IG1hZGUg
YSBzaW1wbGUgZXJyb3IgYW5kIGRvbid0Cj4gd2FudCB0byBib3RoZXIgeGVuLWRldmVsIHdpdGgg
aXQ7IGNhbiBzb21lb25lIGZhbWlsaWFyIHdpdGggdXNpbmcKPiB0aGUgeGVuc3RhdCBpbnRlcmZh
Y2UgcGxlYXNlIHRlbGwgbWUgd2hhdCBJJ3ZlIGRvbmUgd3JvbmcgaGVyZT8KCkkgYmVsaWV2ZSBj
aGFuY2VzIGFyZSByYXRoZXIgaGlnaCB0aGlzIGlzIHRoZSBidWcgd2hpY2ggd2FzIGNvcnJlY3Rl
ZApyZWNlbnRseSB3aXRoIFhlbiBjb21taXQgZjI4YzRjNGMxMGJkYWNiLgoKQW5keSwgeW91IGNh
biBlYXNpbHkgYXZvaWQgdGhhdCBwcm9ibGVtIGJ5IHJlbW92aW5nIHRoZSBoaWdoZXN0IGJpdApv
ZiB0aGUgcnVudGltZSB2YWx1ZSwgZS5nLgoKICAgIGNvcnJlY3RfdmFsdWUgPSByZXBvcnRlZF9y
dW50aW1lICYgfigxVUxMIDw8IDYzKTsKCkphbiwgSSB0aGluayB0aGF0IHBhdGNoIHNob3VsZCBi
ZSBpbmNsdWRlZCBpbiBzdGFibGUgdmVyc2lvbnMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
