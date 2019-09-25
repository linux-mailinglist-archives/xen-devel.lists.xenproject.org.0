Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD5BD88B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 08:53:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD17C-0006KK-El; Wed, 25 Sep 2019 06:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD17A-0006KF-C1
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 06:49:28 +0000
X-Inumbo-ID: 9d6101a2-df60-11e9-962b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9d6101a2-df60-11e9-962b-12813bfff9fa;
 Wed, 25 Sep 2019 06:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 575BAB60A;
 Wed, 25 Sep 2019 06:49:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-8-jgross@suse.com>
 <19409170-4a99-e336-dae3-b439db509111@suse.com>
 <6e7b8475-bd13-94fc-2715-1d8b4f510eb4@suse.com>
 <630b1a32-20a5-e2c2-8dd9-60504f8fc6f2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <37e39ca2-95a9-9554-da4f-7e534230dfcc@suse.com>
Date: Wed, 25 Sep 2019 08:49:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <630b1a32-20a5-e2c2-8dd9-60504f8fc6f2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 07/47] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTQ6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTM6
NDEsIErDvHJnZW4gR3Jvw58gIHdyb3RlOgo+PiBSZWdhcmRpbmcgdG8gcmVuYW1lICJzZCIgdG8g
InNyIjogSSBhZ3JlZSB0aGlzIHdvdWxkIGJlIGEgc2Vuc2libGUKPj4gY2hhbmdlLiBPVE9IIEkn
ZCBsaWtlIHRvIGJlIGNvbnNpc3RlbnQsIHNvIEknZCBsaWtlIHRvIGRlZmVyIHRoYXQgdG8KPj4g
dGhlIHBsYW5uZWQgc2NoZWR1bGluZyBjbGVhbnVwIHNlcmllcy4KPiAKPiBTZWVpbmcgYW5vdGhl
ciBpbnRyb2R1Y3Rpb24gb2YgInNkIiBpbiBhcyBsYXRlIGFzIHBhdGNoIDM3LCBJIHJlYWxseQo+
IHdvbmRlciBpZiB0aGlzIGFwcHJvYWNoIChhbmQgdGhlIHJlc3VsdGluZyBleHRyYSBjb2RlIGNo
dXJuKSBpcwo+IGluZGVlZCBiZXR0ZXIgdGhhbiBuYW1pbmcgYXQgbGVhc3QgbmV3IHZhcmlhYmxl
IGluc3RhbmNlcyBwcm9wZXJseQo+IHJpZ2h0IGF3YXkuCgpBbmQgYWZ0ZXIgcmVuYW1pbmcgbmV3
IGluc3RhbmNlcyBvZiAic2QiIHRvICJzciIgdGhlcmUgd2VyZSBzbyBmZXcgInNkInMKbGVmdCB0
aGF0IEkgcmVuYW1lZCB0aGVtIHJpZ2h0IGF3YXkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
