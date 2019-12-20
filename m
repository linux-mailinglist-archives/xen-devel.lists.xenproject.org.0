Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5E128299
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiNa5-0000np-LS; Fri, 20 Dec 2019 19:04:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DXd/=2K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iiNa4-0000nk-Da
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:04:56 +0000
X-Inumbo-ID: 9bffbd00-235b-11ea-93df-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bffbd00-235b-11ea-93df-12813bfff9fa;
 Fri, 20 Dec 2019 19:04:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so10384933wrj.12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=40iJCzne3eFLVf60skORpiBFwDotHWhZMXiR9+KnN44=;
 b=Bk8G7Y5rTD5nUcDPqeb6hT9xPHLlTMyINZwW+uU/SfjdtJTnpUlyLmBUHVmVyvloNE
 ivOR+Hen3vKSyZPmukphN0vuEShkjd1LFKYtINP9I15VIYMpNze2Ijwb5z0G+WmtJUFp
 pHZpdHlcMFV5BOoeQQfVcY7SX4BC5JKl5NFB/E6mZ5kHIyJ1ELz/dnYBVUgdczjQ2CbR
 a7tmEmXZ46piHNzAZNFJKNpCtS+ywv8Q+jHhHFyU8xljJ6YBuCJEjxwjPhi66DeD4GNr
 pTgYkAFbDgJmtcrxgkcwWR7q+PsQiuumG4wVObZEWmwhDOeY/2Lxowc1nOiHOkClsT1n
 5oVw==
X-Gm-Message-State: APjAAAUnjng3gy44PIl+aTVZ8766fWDCu8YLt0iZG/EMrosKEVYOILOX
 lipgs6yEi/G4MztKTqkY/vw=
X-Google-Smtp-Source: APXvYqy9MOh5ePcOHkEsLS1ZKcg+qmcuEnP/VYWhD4pgUAP6+CDwBK95y8Na4gW7SVuOkL/7Ucboog==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr13620744wrq.206.1576868695192; 
 Fri, 20 Dec 2019 11:04:55 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id n14sm10465721wmi.26.2019.12.20.11.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 11:04:54 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191220173502.15615-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <67ae9a19-01a9-9282-a104-432433319dfa@xen.org>
Date: Fri, 20 Dec 2019 19:04:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191220173502.15615-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain
 types
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGZvcmdvdCB0byBtZW50aW9uIHRoZSB0eXBlIGluIHRoZSBjb21taXQgdGl0bGU6Cgpz
L3VuaW1wbGVtbmV0ZWQvaW1wbGVtZW50ZWQvCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
