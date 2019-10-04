Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F287CB3EA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 06:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFDq-0002Qt-ER; Fri, 04 Oct 2019 04:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFDo-0002Qo-JX
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 04:29:40 +0000
X-Inumbo-ID: 92e61072-e65f-11e9-973e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92e61072-e65f-11e9-973e-12813bfff9fa;
 Fri, 04 Oct 2019 04:29:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8960DAE37;
 Fri,  4 Oct 2019 04:29:36 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
References: <20191002072745.24919-1-jgross@suse.com>
 <b62b6f30-589b-e155-25a2-5000eb869ecb@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <591be856-c4f5-43e9-8d2c-b523406d1870@suse.com>
Date: Fri, 4 Oct 2019 06:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b62b6f30-589b-e155-25a2-5000eb869ecb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 00/20] xen: add core scheduling support
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMTkgMTE6NDcsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGkgSnVlcmdlbiwKPiAK
PiBMb29rcyBsaWtlIHdlJ3ZlIGhpdCB0aGUgZmlyc3QgWGVuIGNyYXNoIHdpdGggY29yZSBzY2hl
ZHVsaW5nIHBhdGNoZXMgYXBwbGllZC4KPiBUaGUgbG9nIGlzIGJlbG93LiBGcm9tIG15IGFuYWx5
c2lzIGl0IHNlZW1zIHRoYXQgQ1NDSEVEX1BDUFUgaXMgTlVMTC4KPiBJIHN1c3BlY3QgdGhpcyBp
cyBjb25uZWN0ZWQgdG8gY29tbWl0IGIwMDAwYjEyOGFkYgo+ICgic2NoZWQ6IHBvcHVsYXRlIGNw
dXBvb2wwIG9ubHkgYWZ0ZXIgYWxsIGNwdXMgYXJlIHVwIikKPiAKPiBDb3VsZCB5b3UgdGFrZSBh
IGxvb2ssIHBsZWFzZT8KClRoZSBtYWluIHJlYXNvbiBpcyB0aGF0IHNjaGVkX3RpY2tfcmVzdW1l
KCkgc2hvdWxkIGNhbGwKc2NoZWRfZG9fdGlja19yZXN1bWUoKSBvbmx5IHdpdGggdGhlIHNjaGVk
dWxpbmcgbG9jayBoZWxkLgoKVGhpcyBoYXMgYmVlbiBhIGxhdGVudCBidWcgc2luY2UgYWdlcywg
YnV0IG15IHBhdGNoZXMgKGVzcGVjaWFsbHkKInNjaGVkOiBhZGQgbWluaW1hbGlzdGljIGlkbGUg
c2NoZWR1bGVyIGZvciBmcmVlIGNwdXMiIGluIGNvbWJpbmF0aW9uCndpdGggInNjaGVkOiBwb3B1
bGF0ZSBjcHVwb29sMCBvbmx5IGFmdGVyIGFsbCBjcHVzIGFyZSB1cCIpIGlzCnRyaWdnZXJpbmcg
aXQgbXVjaCBlYXNpZXIgbm93LgoKSW4gdGhlIHBhc3QgeW91J2QgbmVlZCB0byByZW1vdmUgYSBj
cHUgZnJvbSBhIGNwdXBvb2wgd2l0aCBudWxsLCBydCBvcgphcmluYzY1MyBzY2hlZHVsZXIgd2l0
aCBkZWZhdWx0IHNjaGVkdWxlciBiZWluZyBjcmVkaXQgaW4gb3JkZXIgdG8gaGF2ZQphIGNoYW5j
ZSBoaXR0aW5nIHRoZSBidWcuCgpJJ2xsIHNlbmQgYSBwYXRjaC4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
