Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2A154458
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 13:56:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izgf0-0008H8-0a; Thu, 06 Feb 2020 12:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izgey-0008GF-2W
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 12:53:32 +0000
X-Inumbo-ID: ad293f6c-48df-11ea-8952-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad293f6c-48df-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 12:53:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4FEB8B145;
 Thu,  6 Feb 2020 12:53:30 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200206121024.21803-1-wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48fc06c1-4db6-4eb5-aabc-cc29d121f787@suse.com>
Date: Thu, 6 Feb 2020 13:53:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206121024.21803-1-wl@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: make it clear range is inclusive when
 printing e820 range
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxMzoxMCwgV2VpIExpdSB3cm90ZToKPiBDaGFuZ2UgdGhlIGZvcm1hdCBz
dHJpbmcgdG8gdXNlICJbLF0iIGFuZCBzdWJ0cmFjdCAxIGZyb20gdGhlIGVuZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
