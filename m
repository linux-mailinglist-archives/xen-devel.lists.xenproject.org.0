Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446FD1050F6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 12:02:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXk9z-0007YR-AK; Thu, 21 Nov 2019 10:58:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXk9x-0007YM-LA
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:58:01 +0000
X-Inumbo-ID: c8532a10-0c4d-11ea-b678-bc764e2007e4
Received: from mail-lf1-f48.google.com (unknown [209.85.167.48])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8532a10-0c4d-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 10:58:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id l14so2238804lfh.10
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 02:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L0OZVApMy18NRrpRS/10QfAn+QxGbxNQf/OUh5Y4IXY=;
 b=URls8Can8YV1Q7AwDNPIOWHH6cmCjATJJPTSA8Fa06uZSUf7iLJ5xYYGplphdMIdYX
 Rsr/H/nfCWE4+i4t3Pn5m+z7uy++SEJqMOP5VMo2zJXHgndoAqAMZw7j/DxTgrG0cp2L
 gnLs043MslX8WciG2C2Cwe5eYcGdIOPfLkgdNjFY42vjegusa1FN71GvwQWmQNDv1t62
 EmXaaMV6lFD/2FpXGKYdNLSwpHhOnL1H3LOni6h2TLxuY7+LMvPIlvDsy4+TKRWCerap
 f0mkOLD2SSi5MehTzB5LE7ZthCscyJVqZNhitizhISb65AIQlHOTgRVegdhIxt9XqWJ2
 w9Rw==
X-Gm-Message-State: APjAAAWMCHIalIQ0DlGS+3z+qxWqSN9hNqzZRvOE5jzp+CM/eTy20f/N
 18Ys0yMHBii+181YdLFOq4oNwwn+YdE=
X-Google-Smtp-Source: APXvYqykEbPcYudBfukomWN5lSNZVnRS6jd8vUzRO8GF1cJUk1J+O5GvQXPdpbZPRgHAnht6DA9plw==
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr7013816lfn.44.1574333879213;
 Thu, 21 Nov 2019 02:57:59 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id e2sm1063553ljp.48.2019.11.21.02.57.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 02:57:58 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id d5so2710330ljl.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 02:57:58 -0800 (PST)
X-Received: by 2002:a05:651c:305:: with SMTP id
 a5mr7014795ljp.144.1574333878560; 
 Thu, 21 Nov 2019 02:57:58 -0800 (PST)
MIME-Version: 1.0
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
In-Reply-To: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
From: Wei Liu <wl@xen.org>
Date: Thu, 21 Nov 2019 10:57:42 +0000
X-Gmail-Original-Message-ID: <CAK9nU=rP3nUCqS3o-3hMLrLPE1s8+W40W=4HWSkd06Fi+cqzeg@mail.gmail.com>
Message-ID: <CAK9nU=rP3nUCqS3o-3hMLrLPE1s8+W40W=4HWSkd06Fi+cqzeg@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMSBOb3YgMjAxOSBhdCAwNjowNSwgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToKWy4uLl0KPiA0LiBBcmUgdGhlcmUgYW55IGJsb2NrZXJzIGZvciA0LjEzIG90
aGVyIHRoYW4gMS4gYW5kIDIuIChhcGFydCBvZiBhbnkKPiAgICAgcGVuZGluZyBYU0FzKT8KPgoK
RldJVyBJJ3ZlIHB1c2hlZCBhbGwgdGhlIHRvb2xzdGFjayBwYXRjaGVzIHRoYXQgSSdtIGF3YXJl
IG9mLgoKV2VpLgoKPgo+IEp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
