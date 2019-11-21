Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB7105777
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:50:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpcr-0004Ka-0h; Thu, 21 Nov 2019 16:48:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXpcp-0004KV-8P
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:48:11 +0000
X-Inumbo-ID: b347192a-0c7e-11ea-a33d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b347192a-0c7e-11ea-a33d-12813bfff9fa;
 Thu, 21 Nov 2019 16:48:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4718AF78;
 Thu, 21 Nov 2019 16:48:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <8c734852-b260-06c1-2bb1-fd2f1bc6ce86@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d93dc70-9de0-1a56-6503-2f708cf4a48b@suse.com>
Date: Thu, 21 Nov 2019 17:48:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8c734852-b260-06c1-2bb1-fd2f1bc6ce86@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNzoyMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAieGVuL3ZjcHU6IFNh
bml0aXNlIFZDUFVPUF9pbml0aWFsaXNlIGNhbGwgaGllcmFjaHkiLsKgIFRoaXMgaXMgWFNBLTI5
Ngo+IGZvbGxvd3VwIGFuZCBSRkMgZm9yLTQuMTMgd2l0aCBubyBjb21tZW50cyBmb3IvYWdhaW5z
dC7CoCBUaGlzIGhhcyBhbHNvCj4gc3RhbGxlZCB3aXRoIG5vIGFja3MsIG5vIGNvbmNyZXRlIHN1
Z2dlc3Rpb24gZm9yIGNoYW5nZXMgb3Igd2F5cyBmb3J3YXJkLgoKT24gdGhlIDR0aCBJIHJlcGxp
ZWQKCiJJIGNhbiBzZWUgdGhlIG1lcml0cyBvZiB0aGlzLCBidXQgSSBjYW4gYWxzbyB1bmRlcnN0
YW5kIEp1bGllbidzCiByZXNlcnZhdGlvbnMuIEhlbmNlIEkgZ3Vlc3Mgd2hldGhlciB0byBhY2sg
dGhpcyB3aWxsIGRlcGVuZCBvbiB0aGUKIGRpc2N1c3Npb24gd2l0aCBoaW0gZ2V0dGluZyBzZXR0
bGVkLiIKCkkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gYWNrIGEgcGF0Y2ggd2hlcmUgaXQncyBub3Qg
Y2xlYXIgd2hldGhlcgpjb25jZXJucyBoYXZlIGJlZW4gYWRkcmVzc2VkLiBGcm9tIEp1bGllbidz
IGxhdGVzdCByZXBseSBJIGNhbid0Cmp1ZGdlIHdoZXJlIGhlIHdhcyBoYXBweSB3aXRoIHlvdXIg
cHJpb3IgYW5zd2VyOyBpdCBtb3JlIGxvb2tlZApsaWtlIHRoYXQgaGUgd2Fzbid0LgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
