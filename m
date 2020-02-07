Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C615536C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 09:03:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izyXq-0001WB-Hs; Fri, 07 Feb 2020 07:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izyXp-0001W6-0n
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 07:59:21 +0000
X-Inumbo-ID: be75bdae-497f-11ea-b10b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be75bdae-497f-11ea-b10b-12813bfff9fa;
 Fri, 07 Feb 2020 07:59:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BDB24ADDA;
 Fri,  7 Feb 2020 07:59:18 +0000 (UTC)
To: Jason Andryuk <jandryuk@gmail.com>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <e77ce9c5-455a-56c4-32b2-01d73dea33c1@suse.com>
 <CAKf6xpt85LYgd3EfWgmKOhpTp1xz+6g9j=6UgiAUfby6YTQ8sg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be36e446-5558-f63a-0477-0262a1ae986e@suse.com>
Date: Fri, 7 Feb 2020 08:59:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAKf6xpt85LYgd3EfWgmKOhpTp1xz+6g9j=6UgiAUfby6YTQ8sg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] VT-d: adjust logging of RMRRs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxOTo0NiwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBUaHUsIEZlYiA2
LCAyMDIwIGF0IDg6MzMgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToK
Pj4KPj4gQ29uc2lzdGVudGx5IHVzZSBbLF0gcmFuZ2UgcmVwcmVzZW50YXRpb24sIHNocmluayBs
ZWFkaW5nIGRvdWJsZSBibGFua3MKPj4gdG8gYSBzaW5nbGUgb25lLCBhbmQgc2xpZ2h0bHkgYWRq
dXN0IHRleHQgaW4gc29tZSBjYXNlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92
dGQvZG1hci5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKPj4g
QEAgLTU2MSw3ICs1NjEsNyBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX29uZV9ybXJyKHN0cnVjdCBh
Y3BpCj4+ICAgICAgICAgIHsKPj4gICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX1dBUk5JTkcg
VlREUFJFRklYLAo+PiAgICAgICAgICAgICAgICAgICAgICAiIE5vbi1leGlzdGVudCBkZXZpY2Ug
KCUwNHg6JTAyeDolMDJ4LiV1KSBpcyByZXBvcnRlZCIKPj4gLSAgICAgICAgICAgICAgICAgICAg
IiBpbiBSTVJSICglIlBSSXg2NCIsICUiUFJJeDY0IikncyBzY29wZSFcbiIsCj4+ICsgICAgICAg
ICAgICAgICAgICAgICIgaW4gUk1SUiBbJSJQUkl4NjQiLCUiUFJJeDY0IildJ3Mgc2NvcGUhXG4i
LAo+IAo+IE1pc3NlZCByZW1vdmluZyB0aGUgIikiLgo+IAo+IFdpdGggdGhhdCBmaXhlZCwgUmV2
aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KCk9oLCBpbmRlZWQg
LSB0aGFua3MgZm9yIG5vdGljaW5nIQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
