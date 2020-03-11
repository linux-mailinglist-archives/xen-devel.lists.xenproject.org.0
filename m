Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94800181121
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 07:51:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBv9i-0006P9-DP; Wed, 11 Mar 2020 06:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBv9h-0006P4-Mr
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 06:47:49 +0000
X-Inumbo-ID: 388d534c-6364-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 388d534c-6364-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 06:47:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10A52AAFD;
 Wed, 11 Mar 2020 06:47:47 +0000 (UTC)
To: Joe Perches <joe@perches.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, "David S. Miller" <davem@davemloft.net>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <cover.1583896344.git.joe@perches.com>
 <93cb221f897e6d5d37539d9a8dcf8be7797bd401.1583896348.git.joe@perches.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cae76ab2-e626-e8ee-4d14-2badc68711b1@suse.com>
Date: Wed, 11 Mar 2020 07:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <93cb221f897e6d5d37539d9a8dcf8be7797bd401.1583896348.git.joe@perches.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH -next 020/491] XEN HYPERVISOR INTERFACE: Use
 fallthrough; 
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
Cc: linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAgMDU6NTEsIEpvZSBQZXJjaGVzIHdyb3RlOgo+IENvbnZlcnQgdGhlIHZhcmlv
dXMgdXNlcyBvZiBmYWxsdGhyb3VnaCBjb21tZW50cyB0byBmYWxsdGhyb3VnaDsKPiAKPiBEb25l
IHZpYSBzY3JpcHQKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2I1NjYwMmZj
Zjc5Zjg0OWU3MzNlN2I1MjFiYjBlMTc4OTVkMzkwZmEuMTU4MjIzMDM3OS5naXQuam9lLmNvbS8K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgoKUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
