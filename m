Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2BBE276
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:29:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDA8i-0007u7-4F; Wed, 25 Sep 2019 16:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDA8g-0007t2-Kj
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:27:38 +0000
X-Inumbo-ID: 62e46343-dfb1-11e9-9638-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id 62e46343-dfb1-11e9-9638-12813bfff9fa;
 Wed, 25 Sep 2019 16:27:37 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r5so7660603wrm.12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 09:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BsgJ8uVSFrKQuLrWc8t+NfLUa8lB+K5eTk7j6pks0Dc=;
 b=cMwsneDN8tKY8wpeyMsxVrfkXQSMF3npmPIG77oqLe21HhmQ3JUuGQ5IRrvjXBGomY
 PFgLIvib75SfNobeYbOuQFVCPU9WHQ5NXgeT251xhn+pR+JVf+YWer0ZiYl+MMMpRkRt
 NfpC3rUehZXklTZOYrhD5SCLCqykBn4Cp3Xsic8rHo6F8ybtbukI75y//9GxCtiloBUb
 zhgbB/0n1LQ4Nh66xblo3xpKEmmpXnz+gW6sq6WVqqVOVeLnMfqymMYQB5N7RkD7m3Ea
 mWZtrntxBVN50daVuIDcqm+8OU8v/cHJnYDoYx3VHM4augvrPNMfSLDD9PFHxdUTp1ur
 p4wQ==
X-Gm-Message-State: APjAAAXd1ZAEZ2C4xhnn2VOG7WeFVzjF2Y5qAmBIeMFvIaZY5jobJasg
 NcUd4ZwOxq1aJmojJlNXyyQ=
X-Google-Smtp-Source: APXvYqyffeZ+Uz7DiA+PuU6No2FqWnFrqTBq7WQBTZ5HYA8rBAPZDSlYAtyYJ6mJdepE/4WTvpQq2Q==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr9844796wrn.291.1569428857014; 
 Wed, 25 Sep 2019 09:27:37 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id x2sm7548281wrn.81.2019.09.25.09.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 09:27:36 -0700 (PDT)
Date: Wed, 25 Sep 2019 17:27:35 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20190925162735.pgi2a3hqwpwtlpn3@debian>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
 <c5b510ea5712ea8922cc9ccc617ee6a7fe1c2606.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5b510ea5712ea8922cc9ccc617ee6a7fe1c2606.1569425745.git.tamas.lengyel@intel.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH for-next 03/18] tools/libxc: clean up
 memory sharing files
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDg6NDg6NDFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
