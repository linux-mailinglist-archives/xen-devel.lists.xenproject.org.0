Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C618F10F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 09:43:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGIdx-0007aH-Dd; Mon, 23 Mar 2020 08:41:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGIdv-0007a9-Ua
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 08:41:07 +0000
X-Inumbo-ID: 08fbff7a-6ce2-11ea-827b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08fbff7a-6ce2-11ea-827b-12813bfff9fa;
 Mon, 23 Mar 2020 08:41:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6EE80AE19;
 Mon, 23 Mar 2020 08:41:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec3973b5-9eb8-a7e8-21a0-66f5cebfe26a@suse.com>
Date: Mon, 23 Mar 2020 09:41:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320212453.21685-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/4] x86/ucode: Cleanup - Part 2/n
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAyMjoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUd28gbWlub3IgYnVn
Zml4ZXMsIGFuZCB0d28gbWlub3IgY2xlYW51cHMgd2l0aCBtaW5vciBiZW5lZml0cyB0byBvdGhl
ciBjb2RlCj4gYXMgd2VsbC4KPiAKPiBUaGVyZSBpcyBubyBkZXBlbmRlbmN5IG9uIHRoZSByZW1h
aW5pbmcgcGllY2VzIG9mIHRoZSBQYXJ0IDEgc2VyaWVzLgo+IAo+IEFuZHJldyBDb29wZXIgKDQp
Ogo+ICAgeDg2L3Vjb2RlL2FtZDogRml4IGFzc2VydGlvbiBpbiBjb21wYXJlX3BhdGNoKCkKPiAg
IHg4Ni91Y29kZTogRml4IGVycm9yIHBhdGhzIGluIGFwcGx5X21pY3JvY29kZSgpCj4gICB4ZW46
IERyb3AgcmF3X3NtcF9wcm9jZXNzb3JfaWQoKQoKRkFPRCBmZWVsIGZyZWUgdG8gdGhyb3cgaW4g
d2l0aCBXZWkncyBSLWIsIGlkZWFsbHkgd2l0aCB0aGUgc21hbGwKYWRqdXN0bWVudCBzdWdnZXN0
ZWQgZm9yIHBhdGNoIDIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
