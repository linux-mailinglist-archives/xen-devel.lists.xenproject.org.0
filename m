Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61CB127B70
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:01:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiHsO-0002tZ-IP; Fri, 20 Dec 2019 12:59:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiHsN-0002tU-8p
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:59:27 +0000
X-Inumbo-ID: 8d255106-2328-11ea-9353-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d255106-2328-11ea-9353-12813bfff9fa;
 Fri, 20 Dec 2019 12:59:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8CCDAB91;
 Fri, 20 Dec 2019 12:59:25 +0000 (UTC)
To: Aditya Pakki <pakki001@umn.edu>
References: <20191217205356.29172-1-pakki001@umn.edu>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1a59dbf6-5a14-da94-eb90-c2de90e0e191@suse.com>
Date: Fri, 20 Dec 2019 13:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217205356.29172-1-pakki001@umn.edu>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/grant-table: remove multiple BUG_ON
 on gnttab_interface
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMTkgMjE6NTMsIEFkaXR5YSBQYWtraSB3cm90ZToKPiBnbnR0YWJfcmVxdWVzdF92
ZXJzaW9uKCkgYWx3YXlzIHNldHMgdGhlIGdudHRhYl9pbnRlcmZhY2UgdmFyaWFibGUKPiBhbmQg
dGhlIGFzc2VydGlvbnMgdG8gY2hlY2sgZm9yIGVtcHR5IGdudHRhYl9pbnRlcmZhY2UgaXMgdW5u
ZWNlc3NhcnkuCj4gVGhlIHBhdGNoIGVsaW1pbmF0ZXMgbXVsdGlwbGUgc3VjaCBhc3NlcnRpb25z
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkaXR5YSBQYWtraSA8cGFra2kwMDFAdW1uLmVkdT4KClB1
c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS41YgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
