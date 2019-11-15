Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB9FD6BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 08:08:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVVfE-0008U9-4j; Fri, 15 Nov 2019 07:05:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVVfC-0008Ty-8j
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 07:05:02 +0000
X-Inumbo-ID: 3d49c37e-0776-11ea-a25f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d49c37e-0776-11ea-a25f-12813bfff9fa;
 Fri, 15 Nov 2019 07:05:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24E4FAD77;
 Fri, 15 Nov 2019 07:05:00 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>, xen-devel@lists.xenproject.org
References: <CAMmSBy_RrrjWdH1-4F97K7AxW8+r9BPVJ0uxfvOqtANhdwbXVg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ffc932a5-5f84-d10a-cbaf-cf379ab9087f@suse.com>
Date: Fri, 15 Nov 2019 08:04:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_RrrjWdH1-4F97K7AxW8+r9BPVJ0uxfvOqtANhdwbXVg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [TESTDAY] Test report
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMDM6MzksIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gKiBTb2Z0d2FyZTog
WGVuIDQuMTMgUkMyCj4gKiBIYXJkd2FyZTogRGVsbCBJb1QgR2F0ZXdheSAzMDAwIHNlcmllcwo+
ICogU29mdHdhcmU6IFByb2plY3QgRVZFCj4gKiBHdWVzdCBvcGVyYXRpbmcgc3lzdGVtczogQWxw
aW5lIExpbnV4Cj4gKiBGdW5jdGlvbmFsaXR5IHRlc3RlZDogY29tcGlsaW5nLCBpbnN0YWxsaW5n
LCBCb290aW5nIHdpdGggZG9tMD1wdgo+ICogQ29tbWVudHM6IEFsbCB3b3JrcywgYXNpZGUgZnJv
bSB4bCBjcmVhdGUgb2Z0ZW4gdGltaW5nIG91dAo+IAo+IFRoZSB0aW1lb3V0IGhhcHBlbnMgd2hl
biBlaXRoZXIgZG9pbmcgeGwgY3JlYXRlIG9yCj4geGwgY3JlYXRpbmcgaW4gYSBwYXVzZWQgc3Rh
dGUgKHdpdGggLXApIGFuZCBsYXRlciByZXN1bWluZy4KPiBUaGUgZXJyb3IgbWVzc2FnZSBpcyBi
ZWxvdzoKPiAgICAgbGlieGw6IGVycm9yOiBsaWJ4bF9kb21fc3VzcGVuZC5jOjYwOTpkbV9yZXN1
bWVfZG9uZTogRG9tYWluCj4gMzpGYWlsZWQgdG8gcmVzdW1lIGRldmljZSBtb2RlbDogcmM9LTkK
PiAKPiBXZSd2ZSBhY3R1YWxseSB0cmFja2VkIHRoaXMgaXNzdWUgZG93biB0byB0aGlzIHBpZWNl
IG9mIGNvZGU6Cj4gICAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0
O2E9YmxvYjtmPXRvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmM7aD0yNDhkYmMzM2UzODRh
ZTAwOGU0YWI5Y2U4ZmI1NzNiZTA2ZGRkZDcyO2hiPUhFQUQjbDUxNQo+IAo+IEN1cmlvdXNseSBl
bm91Z2ggaXQgc2VlbXMgdG8gYmUgdGhlIG9ubHkgcGxhY2UgKGFzaWRlIGZyb20KPiBsaWJ4bF9f
d2FpdF9mb3JfZGV2aWNlX21vZGVsX2RlcHJlY2F0ZWQpIHRoYXQgdXNlcyB0aGUKPiB0aW1lb3V0
IHZhbHVlIHRoYXQgbG93LiBFdmVyeXdoZXJlIGVsc2UgaXQgc2VlbXMgdG8gYmUKPiAgICAgIExJ
QlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMAoKVGhhbmtzIGZvciB0aGUgdGhv
cm91Z2ggYW5hbHlzaXMuCgpJdCdzIGNsZWFybHkgYSByZWdyZXNzaW9uLiBQYXRjaCBzZW50LgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
