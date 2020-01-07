Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB449132748
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:11:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioobl-00034O-Nt; Tue, 07 Jan 2020 13:09:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioobk-00034G-0l
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:09:16 +0000
X-Inumbo-ID: e2d1fc9c-314e-11ea-bf56-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d1fc9c-314e-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 13:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF47DAC45;
 Tue,  7 Jan 2020 13:09:06 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
 <20200107121335.nqb3kx4eos3yfiwb@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a9b7abc-6898-968b-a202-446e5d8cdc41@suse.com>
Date: Tue, 7 Jan 2020 14:09:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107121335.nqb3kx4eos3yfiwb@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86: move some xen mm function
 declarations
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxMzoxMywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAwNywgMjAy
MCBhdCAxMjowNjo0M1BNICswMDAwLCBIb25neWFuIFhpYSB3cm90ZToKPj4gRnJvbTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4KPj4gVGhleSB3ZXJlIHB1dCBpbnRvIHBhZ2UuaCBi
dXQgbW0uaCBpcyBtb3JlIGFwcHJvcHJpYXRlLgo+Pgo+PiBUaGUgcmVhbCByZWFzb24gaXMgdGhh
dCBJIHdpbGwgYmUgYWRkaW5nIHNvbWUgbmV3IGZ1bmN0aW9ucyB3aGljaAo+PiB0YWtlcyBtZm5f
dC4gSXQgdHVybnMgb3V0IGl0IGlzIGEgYml0IGRpZmZpY3VsdCB0byBkbyBpbiBwYWdlLmguCj4+
Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IAo+IEkgd2lsbCBjb21taXQgdGhpcyB0cml2aWFsIHBhdGNoIHNvb24taXNoIHRv
IHJlZHVjZSBIb255YW4ncyBwYXRjaCBxdWV1ZQo+IGxlbmd0aC4KCkxvb2tzIGxpa2UgSSBzaW1w
bHkgZm9yZ290IGV2ZXJ5IHRpbWUgSSB3ZW50IHRocm91Z2ggbXkgbGlzdCBvZgpwZW5kaW5nIChm
b3IgdGhlIHZhcmlvdXMgc3RhZ2VzIG9mIHByb2Nlc3NpbmcpIHBhdGNoZXMuIEkgZ3Vlc3MKcGF0
Y2hlcyAzIGFuZCA0IGFyZSBhbHNvIGluZGVwZW5kZW50IG9mIHBhdGNoIDIgYW5kIGhlbmNlIGNv
dWxkCmdvIGluIGFzIHdlbGwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
