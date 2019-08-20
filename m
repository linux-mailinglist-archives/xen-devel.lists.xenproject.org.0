Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B396846
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 20:07:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i08Tn-000576-Jy; Tue, 20 Aug 2019 18:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YXB6=WQ=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1i08Tl-000571-PG
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 18:03:34 +0000
X-Inumbo-ID: d141a61e-c374-11e9-9ab1-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d141a61e-c374-11e9-9ab1-bc764e2007e4;
 Tue, 20 Aug 2019 18:03:31 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id B8D7B2400FC
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 20:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1566324209; bh=6FTe5vzz2GnnPSvO9bMD053JLTuETef8FZAaSZSH2rk=;
 h=To:From:Subject:Date:From;
 b=A9QlayFErtpv5/tMcCcRyEE9BiQaYAnd4bb7t6nNx6OcMnEEfRdrA9Cca9PdB0GuC
 blD/Dxqx65krs2ZcHRl2XagFtM083SjMrU5VVXydZVbKZ4RskE0VBxxv6xPbfd/Qa4
 5AJ0ziuIYJsUfdxZiLDGBN+nPLZy/H7FU1OaZtc7WM5to0OXowm78DZk5RVucDa/Bq
 d5MTTysDBh0M+r+iFU/wFXvhbJIl+lNmNwX7N1+hrHR7BHhRE8LKcssQ6fyzkjM3w8
 ST09uP9HqMhQYjBwX0/v01tdWaQn22qfSi85sDv0pQ3HJi6vRkDmlF/ujHpcTLUJxN
 1VMF3Goo81iUw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46CdvN4J7tz9rxV;
 Tue, 20 Aug 2019 20:03:28 +0200 (CEST)
To: xen-devel@lists.xenproject.org, Paul.Durrant@citrix.com
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
Date: Tue, 20 Aug 2019 20:03:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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

V2hpbGUgQU1EIFJ5emVuIDI3MDBYIHdhcyB3b3JraW5nIHBlcmZlY3RseSBpbiBteSB0ZXN0cyB3
aXRoIFdpbmRvd3MgMTAsIAp0aGUgbmV3IDM3MDBYIGRvZXMgbm90IGV2ZW4gYm9vdCBhIFdpbmRv
d3MgSFZNLiBXaXRoIHZpcmlkaWFuPTEgeW91IGdldCAKQlNPRCBIQUxfTUVNT1JZX0FMTE9DQVRJ
T04gYW5kIHdpdGggdmlyaWRpYW49MCB5b3UgZ2V0ICJtdWx0aXByb2Nlc3NvciAKY29uZmlnIG5v
dCBzdXBwb3J0ZWQiLgoKeGwgZG1lc2cgc2F5czoKKFhFTikgZDF2MCBWSVJJRElBTiBDUkFTSDog
YWMgMCBhMGEwIGZmZmZmODA2NWMwNmJmODggYmY4CihYRU4pIGQydjAgVklSSURJQU4gQ1JBU0g6
IGFjIDAgYTBhMCBmZmZmZjgwMzViMDQ5Zjg4IGJmOAoKTGludXggZG9tVXMgd2l0aCBQViBhbmQg
UFZIIHNlZW0gdG8gd29yayBzbyBmYXIuCgpYZW4gdmVyc2lvbiA0LjEwLjIuIGRvbTAga2VybmVs
IDQuMTMuMTYuIFRoZSBCSU9TIHZlcnNpb24gaXMgdW5jaGFuZ2VkIApmcm9tIDI3MDBYICh3b3Jr
aW5nKSB0byAzNzAwWCAoY3Jhc2hpbmcpLgoKSXMgaXQgYSBrbm93biBwcm9ibGVtPyBEaWQgc29t
ZW9uZSB0ZXN0IHRoZSBuZXcgRVBZQ3M/CgpSZWdhcmRzIEFuZHJlYXMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
