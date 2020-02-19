Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090641643D9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:05:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4O4T-0006Kr-Mc; Wed, 19 Feb 2020 12:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4O4S-0006Ke-BJ
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:03:16 +0000
X-Inumbo-ID: ceed0bd0-530f-11ea-833d-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceed0bd0-530f-11ea-833d-12813bfff9fa;
 Wed, 19 Feb 2020 12:03:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w12so241224wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 04:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cfa5lgLQCpYOzv2jWjMSMzuKbj7kARRAFbdt+bRfB9I=;
 b=NZkfAnQwvHAPu5l4agkSt1lAJjd8dBS6icM47aQ4WdfOREFxeQQ9ANU7IHsIadygll
 Kdp5Y/Q2S/3/aF56Hw01kk/jrI1bW8vPW+Ute1FDsAqyZuZ2Z/wzqQpOZkGaxLAoqCEF
 Vlae40pHC30Vpox7RHQHhGTfdBdZxH62VNlo1X7MjxQ7fuveb0otIhKXq7tqDTaDpMfC
 wMxxGVPj4E355Yb0Wqq60SHMVQqQqyTxw14tgOb/X+mvA0nxiWqtibjGJx+7VvLUYxAe
 GHuBb+HzNiX1MWeYIdKqq3dFKDh/T54Sp2CTjOVmHRBwQy8c9mwK/ZKWdVgcU3IxIJx6
 hn2w==
X-Gm-Message-State: APjAAAVB+1pae73riclsTwje08V+VlEKks+z88NqTXOd2Y+BjktZ4USw
 mkjbfC22bEUyTfBxLiHoXQc=
X-Google-Smtp-Source: APXvYqzLCmn020OWhLbDQMzN91l12v/t8l8EIj/88yZgEaMMGXfciK0il6Ds5tVonoVgELaF73bJug==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr36296457wrn.324.1582113794603; 
 Wed, 19 Feb 2020 04:03:14 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id z21sm2708871wml.5.2020.02.19.04.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 04:03:14 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219102256.81594-1-roger.pau@citrix.com>
 <20200219102256.81594-2-roger.pau@citrix.com>
 <c0a6422b-c664-2967-94c9-a4b2698e28c0@xen.org>
 <20200219114118.GZ4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <bd1bd0d6-185d-041d-f303-2e7938a95ef4@xen.org>
Date: Wed, 19 Feb 2020 12:03:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219114118.GZ4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6 1/3] arm: rename BIT_{WORD/MASK/PER_WORD)
 to BITOP_*
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wMi8yMDIwIDExOjQxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFdlZCwg
RmViIDE5LCAyMDIwIGF0IDExOjM1OjE2QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgUm9nZXIsCj4+Cj4+IE9uIDE5LzAyLzIwMjAgMTA6MjIsIFJvZ2VyIFBhdSBNb25uZSB3cm90
ZToKPj4+IFNvIEJJVF9XT1JEIGNhbiBiZSBpbXBvcnRlZCBmcm9tIExpbnV4LiBUaGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIGN1cnJlbnQKPj4+IExpbnV4IGltcGxlbWVudGF0aW9uIG9mIEJJVF9XT1JE
IGlzIHRoYXQgdGhlIHNpemUgb2YgdGhlIHdvcmQgdW5pdCBpcwo+Pj4gYSBsb25nIGludGVnZXIs
IHdoaWxlIHRoZSBYZW4gb25lIGlzIGhhcmRjb2RlZCB0byAzMiBiaXRzLgo+Pj4KPj4+IEN1cnJl
bnQgdXNlcnMgb2YgQklUT1BfV09SRCBvbiBBcm0gKHdoaWNoIGNvbnNpZGVycyBhIHdvcmQgYSBs
b25nCj4+PiBpbnRlZ2VyKSBhcmUgc3dpdGNoZWQgdG8gdXNlIHRoZSBnZW5lcmljIEJJVF9XT1JE
IHdoaWNoIGFsc28gb3BlcmF0ZXMKPj4+IG9uIGxvbmcgaW50ZWdlcnMuCj4+Pgo+Pj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4+Pgo+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgo+Pj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPj4KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+Cj4+Cj4+IERpZCB5b3UgYnVpbGQgdGVzdCBpdCBvbiBBcm0/Cj4gCj4gRGlkIGEgZ2l0bGFi
IHJ1biwgYnVpbGQgd2FzIGZpbmU6Cj4gID4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L3Blb3BsZS9yb3lnZXIveGVuL3BpcGVsaW5lcy8xMTg4Nzg1NDQKClRoYW5rIHlvdSEKCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
