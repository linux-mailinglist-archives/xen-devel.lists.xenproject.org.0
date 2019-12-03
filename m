Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A21102FE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 17:57:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBS1-00046K-83; Tue, 03 Dec 2019 16:55:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1icBS0-00046E-14
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 16:55:00 +0000
X-Inumbo-ID: a403d85e-15ed-11ea-81e2-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a403d85e-15ed-11ea-81e2-12813bfff9fa;
 Tue, 03 Dec 2019 16:54:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so4563443wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 08:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E2acuhUnbN/XiQnnu8OGRhTAWN7u0emnZqkA8QS0BJM=;
 b=S2lfyJu61qDA652OTjqMdwwM0lHNS2KPv8227hVYmg23oPEuZAlAyKo/tya3uCG8x5
 AgzRB7aBar4GjW3DXzJR+exK0AUlUtPhKABaNKV08EN8KQRDkeAuzxP7EkWriLVSyQIg
 5AoVPoOAerQOYj0IAxJpwYmr8k5PLCZHsSiqv9lXf9bFd7FOGPwxD3NgRqVOjjl8SxWH
 TJpUovmylUold1RdF5uTYs92lV2Ar3ftPvXNkxm6nmp+lJ396vsJ5lrUbHruqFB/+1CX
 SpaLN2BoUm6qtXBtuJoJSfRqA+dZeAwmUEbewx3VrK0wl6ujadfbqddIb/HzwFSwk4xp
 r7kA==
X-Gm-Message-State: APjAAAX/ixx4+OXUTefsYB/I54jIehpIyd2+j/ypDmw9c+FjyXzo+qiA
 XKwGevChAmJPRYbRGpxKw88fVtPVnlMLZw==
X-Google-Smtp-Source: APXvYqwZIcHIO0/IZBPSQoiSO9PT5xuRX0Iru0DXSE9OaOXT3qJWeuw/zcjoESVLBEo4YV3fPDgLhg==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr5851758wre.58.1575392098741; 
 Tue, 03 Dec 2019 08:54:58 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id n3sm4168272wrs.8.2019.12.03.08.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:54:57 -0800 (PST)
Date: Tue, 3 Dec 2019 16:54:56 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20191203165456.d2iionvilao7z2uj@debian>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-9-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191130115737.15752-9-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 8/8] x86: introduce CONFIG_HYPERV and
 detection code
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTE6NTc6MzdBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
Wy4uLl0KPiArICovCj4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+ICsKPiArI2luY2x1ZGUgPGFz
bS9ndWVzdC5oPgo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBoeXBl
cnZfb3BzID0gewoKU2luY2UgeGdfb3BzIGhhcyBsb3N0IGl0cyB4Z18gcHJlZml4LCBJIGFsc28g
dGFrZSB0aGUgbGliZXJ0eSB0byBkcm9wCnRoZSBoeXBlcnZfIHByZWZpeCBoZXJlIHRvIG1ha2Ug
dGhpbmdzIG1vcmUgY29uc2lzdGVudC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
