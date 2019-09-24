Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC191BCAA9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:54:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmAe-0003K4-JU; Tue, 24 Sep 2019 14:52:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0JDo=XT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCmAd-0003Jz-Co
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:52:03 +0000
X-Inumbo-ID: dde76332-deda-11e9-961f-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by localhost (Halon) with ESMTPS
 id dde76332-deda-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:52:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m18so402502wmc.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 07:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HkPIl4DO7h4s/eqWRCes/nfMNnfmdj+3n4ieyGGM9LE=;
 b=IhjJBN2Kdkr21FzQFX+VU7KLuLvu986Ju2yDRHWEAjcU3awaZU1b0iSw9ZFCyqcoQJ
 tHa5+jO4vIML429hzY5hQkvhYUddwhHxCQ5GoRE4nNCLjGQZxyNhnfXwwlPkE3PYqbln
 Qp+JUe60iroIl7nDwTisY5zFT6Y2GvBpY7NS6z7RDfd6pK5j6V6oNPxk0C3hKCHVEToV
 rweONnRjqp5X+yWEnWqiy6wTSm8kuiIbLDSd3gYdiMH/6DwSoE6abEPFAZtV7s27Cl9m
 6qKbJV9NuegysKtORc07fZpEQVWLp+6dZN8TkqtlyPf6/f8zKR5qC9LdvvyQbZ7p40Vk
 x1aw==
X-Gm-Message-State: APjAAAV9n27bd1Uu2FJQnAKay0iGAEBo/6RcYTPj+a5ATb+VfZTzvKy7
 Mua4J+Rw1BO99Wp8wNI6ptE=
X-Google-Smtp-Source: APXvYqxVIP5aEh0sV5H49olxeVNTUQVU44oagfp/dyhwl06FJWiGW4T8wQk7tqKUzV0kq67pDiQZzg==
X-Received: by 2002:a7b:c949:: with SMTP id i9mr443683wml.136.1569336721503;
 Tue, 24 Sep 2019 07:52:01 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s13sm287910wmc.28.2019.09.24.07.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 07:52:00 -0700 (PDT)
Date: Tue, 24 Sep 2019 15:51:59 +0100
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190924145159.sdddasf4nsf5sctj@debian>
References: <20190924143515.8810-1-julien.grall@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924143515.8810-1-julien.grall@arm.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/2] Errata implementation and
 doc update
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDM6MzU6MTNQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIGFsbCwKPiAKPiBUaGUgdHdvIHBhdGNoZXMgYXJlIG5vdCByZWxhdGVkIGJ1dCB0
aGUgc2Vjb25kIG9uZSBkZXBlbmRlbmRzIG9uIHRoZSBmaXJzdAo+IG9uZS4gU28gSSBkZWNpZGVk
IHRvIG1lcmdlIHRoZW0gdG9nZXRoZXIuCj4gCj4gQ2hlZXJzLAo+IAo+IEp1bGllbiBHcmFsbCAo
Mik6Cj4gICB4ZW4vYXJtOiBJbXBsZW1lbnQgd29ya2Fyb3VuZCBmb3IgQ29ydGV4IEEtNTcgYW5k
IENvcnRleCBBNzIgQVQKPiAgICAgc3BlY3VsYXRlCj4gICBkb2NzOiBSZXBsYWNlIGFsbCBpbnN0
YW5jZSBvZiBBUk0gYnkgQXJtCgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
