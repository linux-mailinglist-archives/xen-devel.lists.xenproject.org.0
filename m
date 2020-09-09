Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64552262CC4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:01:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwut-0001IO-Rp; Wed, 09 Sep 2020 10:01:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwus-0001ID-On
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:01:26 +0000
X-Inumbo-ID: 0575d301-80fe-4264-8e08-89fc6cbb2595
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0575d301-80fe-4264-8e08-89fc6cbb2595;
 Wed, 09 Sep 2020 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645684;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QKLNJvq/H1lxTlKAwuTi2t0ypSXWvInPgOzCUeEbsKc=;
 b=UXDWd4E8ZB44BPUVP/iueBfwsbC5/42UFNBIvJ4Ckf4s8Q0uxvHiHOjq
 zznemHgROiTEjr0f/sdpCVLsCBoR73+zImlLBRNkOZC7NubmQVz/+Sw7R
 V8MFV2wAux6K7xdwhDKcNaqXEy9L97WhWPfEselP1X/XRGx3g1+Qte4tc U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qmIHu+PTt4mSEW7J79k06rfkXXiM7lzhbM9cQ3PdkhhitbPDucluPScZlMq28JMcLxgYzp3VFG
 abCNtOXUUnmufOFcw3O80PKYr4HwpWBDXNQ3yiu1mGDGSfSA0Gb8k0R70L+u7EtgtjBRVEz+yt
 rFhmZKMn+1RLpv1poMK0fU8xa0wO8k6IQPY0j1mK9SfIhT5/DRUJpx4vheJwDwH03o4CE/22j3
 liQQH+KCHy9D5+P90ut7upOInhxf3UTrO0WLEYPanHOrCtMpM6KhJ0atQIViC4Dx+LuuGDztJ7
 9K4=
X-SBRS: 2.7
X-MesageID: 26404450
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26404450"
Subject: Re: [PATCH v1] libxc: use bitmap_alloc
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200909095344.9462-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9406261f-2c83-7208-726d-bdbacfffd8b9@citrix.com>
Date: Wed, 9 Sep 2020 11:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909095344.9462-1-olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/09/2020 10:53, Olaf Hering wrote:
> Use existing helper to allocate a bitmap.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

