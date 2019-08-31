Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E37A4530
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2019 17:58:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i45hh-0001F3-UY; Sat, 31 Aug 2019 15:54:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iJxP=W3=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
 id 1i45hg-0001Ey-O6
 for xen-devel@lists.xenproject.org; Sat, 31 Aug 2019 15:54:16 +0000
X-Inumbo-ID: 952ed4d0-cc07-11e9-ae98-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 952ed4d0-cc07-11e9-ae98-12813bfff9fa;
 Sat, 31 Aug 2019 15:54:15 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m44so11427628edd.9
 for <xen-devel@lists.xenproject.org>; Sat, 31 Aug 2019 08:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AKTao77VaiaPvCbgcc+WiGV1j5w0joNictAVXbGzljc=;
 b=Z7U8G374XV6eWO4Nnm4aY4++WUwpg10LvidVKKGqUuT1EdSdkK1Gtu/MCGJYkXrsqf
 qXRiwa8IEzXUiqO0/qL/hHHoSF1es5b/2TzJZthQet+inxhgFRso/7jGPrjBKL1R6Zix
 ZHcg1+XJyBu4JzgYenEJESBvftH/Z8iI4F/V1GprDQYJX0NKyUXW+YnsmrvWmo2a2QeX
 w2t7rPtf67DZ4NRTv2eG0Pv/UKYxIzBYKD9TBguT6VwB2Lgtkse/CqC/4ydn4u1GtA31
 ozdZ4O0SCWeXb5x3qUupyWhu5mIVADzWopURsKgrnobR29BM1aI61fB9v0bfgUuYWJZy
 7L5g==
X-Gm-Message-State: APjAAAUpSSVG2ts6iCLWSxqBOWMH7kekoNeIN/n+K/RdV+42hPkS94j2
 mqjF3vxSxkD62JKl6i+vXI0=
X-Google-Smtp-Source: APXvYqyUxiSvMtW/KeHJ5cA0AWsETqOjW7ApTaHBEHBAazWa/5cJ0LHfDHET8v0+ffDbuRqUR6oAiw==
X-Received: by 2002:a05:6402:154e:: with SMTP id
 p14mr21582628edx.101.1567266854794; 
 Sat, 31 Aug 2019 08:54:14 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.gmail.com with ESMTPSA id i19sm1234644ejf.7.2019.08.31.08.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2019 08:54:14 -0700 (PDT)
To: Markus Elfring <Markus.Elfring@web.de>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
 <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
From: Denis Efremov <efremov@linux.com>
Message-ID: <689c8baf-2298-f086-3461-5cd1cdd191c6@linux.com>
Date: Sat, 31 Aug 2019 18:54:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 01/11] checkpatch: check for nested
 (un)?likely() calls
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMS4wOC4yMDE5IDEyOjE1LCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPj4gKyMgbmVzdGVk
IGxpa2VseS91bmxpa2VseSBjYWxscwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCRsaW5lID1+IC9c
Yig/Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIoPzpfT1JfTlVMTHxfVkFMVUUp
P3xXQVJOKS8pIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgV0FSTigiTElLRUxZX01JU1VT
RSIsCj4gCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHNwZWNpZmljYXRpb24g
4oCcKD86SVNfRVJSKD86Xyg/Ok9SX05VTEx8VkFMVUUpKT98V0FSTinigJ0KPiBpbiB0aGlzIHJl
Z3VsYXIgZXhwcmVzc2lvbj8KCkhtbSwgCig/OiAgIDwtIENhdGNoIGdyb3VwIGlzIHJlcXVpcmVk
IGhlcmUsIHNpbmNlIGl0IGlzIHVzZWQgaW4gZGlhZ25vc3RpYyBtZXNzYWdlLAogICAgICAgICBz
ZWUgJDEKICAgSVNfRVJSCiAgICg/Ol8gPC0gQW5vdGhlciBhdG9taWMgZ3JvdXAganVzdCB0byBz
aG93IHRoYXQgJ18nIGlzIGEgY29tbW9uIHByZWZpeD8KICAgICAgICAgICBJJ20gbm90IHN1cmUg
YWJvdXQgdGhpcy4gVXN1YWxseSwgUGVybCBpbnRlcnByZXRlciBpcyB2ZXJ5IGdvb2QgYXQgb3B0
aW1pemluZyBzdWNoIHRoaW5ncy4KICAgICAgICAgICBZb3UgY291bGQgc2VlIHRoaXMgb3B0aW1p
emF0aW9uIGlmIHlvdSBydW4gcGVybCB3aXRoIC1NcmU9ZGVidWcuCiAgICAgKD86T1JfTlVMTHxW
QUxVRSkpP3xXQVJOKQoKUmVnYXJkcywKRGVuaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
