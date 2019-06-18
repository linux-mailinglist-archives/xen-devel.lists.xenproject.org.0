Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031C49F08
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:18:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdC5e-0000RZ-1z; Tue, 18 Jun 2019 11:15:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdC5c-0000RT-Sa
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:15:48 +0000
X-Inumbo-ID: 6b5c932c-91ba-11e9-aa02-d3adad1213e8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6b5c932c-91ba-11e9-aa02-d3adad1213e8;
 Tue, 18 Jun 2019 11:15:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA872B;
 Tue, 18 Jun 2019 04:15:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9AC3F246;
 Tue, 18 Jun 2019 04:17:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-5-git-send-email-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bff15c1a-1eaf-4bde-c5dc-a5ada63b4d9f@arm.com>
Date: Tue, 18 Jun 2019 12:15:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-5-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 05/10] libxl/xl: add memory policy option
 to iomem
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, ian.jackson@eu.citrix.com,
 wei.liu2@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMC8wNC8yMDE5IDIyOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKPiBpbmRleCA4OWZlODBmLi5hNmM1ZTMwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAt
NDE1LDYgKzQxNSwyMSBAQCBzdGF0aWMgdm9pZCBpbml0X2NvbnNvbGVfaW5mbyhsaWJ4bF9fZ2Mg
KmdjLAo+ICAgICAgICAgIE9ubHkgJ2NoYW5uZWxzJyB3aGVuIG1hcHBlZCB0byBjb25zb2xlcyBo
YXZlIGEgc3RyaW5nIG5hbWUuICovCj4gICB9Cj4gICAKPiArc3RhdGljIHVpbnQzMl90IGxpYnhs
X19tZW1vcnlfcG9saWN5X3RvX3hjKGxpYnhsX21lbW9yeV9wb2xpY3kgYykKPiArewo+ICsgICAg
c3dpdGNoIChjKSB7Cj4gKyAgICBjYXNlIExJQlhMX01FTU9SWV9QT0xJQ1lfQVJNX01FTV9XQjoK
PiArICAgICAgICByZXR1cm4gTUVNT1JZX1BPTElDWV9BUk1fTUVNX1dCOwo+ICsgICAgY2FzZSBM
SUJYTF9NRU1PUllfUE9MSUNZX0FSTV9ERVZfTkdSRToKPiArICAgICAgICByZXR1cm4gTUVNT1JZ
X1BPTElDWV9BUk1fREVWX25HUkU7Cj4gKyAgICBjYXNlIExJQlhMX01FTU9SWV9QT0xJQ1lfWDg2
X1VDOgo+ICsgICAgICAgIHJldHVybiBNRU1PUllfUE9MSUNZX1g4Nl9VQzsKPiArICAgIGNhc2Ug
TElCWExfTUVNT1JZX1BPTElDWV9ERUZBVUxUOgo+ICsgICAgZGVmYXVsdDoKCkxvb2tpbmcgYXQg
dGhpcyBhZ2FpbiwgZG9uJ3Qgd2Ugd2FudCB0byBiYWlsIG91dCBpZiB0aGUgcG9saWN5IGlzIHVu
a25vd24/IE15IApjb25jZXJuIGhlcmUgaXMgdGhlIHVzZXIgbWF5IGNvbmZpZ3VyZSB3aXRoIHNv
bWV0aGluZyBpdCBkaWRuJ3QgZXhwZWN0LiBUaGUgcmlzayAKaXMgdGhlIHByb2JsZW0gd2lsbCBi
ZSBoYXJkIHRvIGRlYnVnLgoKSSBhbHNvIGJlbGlldmUgdGhpcyBjb3VsZCBiZSBwYXJ0IG9mIGxp
YnhsX3thcm0seDg2fS5jIGFsbG93aW5nIHVzIHRvIGZpbHRlciAKbWlzdXNlIGVhcmx5LiBJYW4s
IFdlaSwgYW55IG9waW5pb24/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
