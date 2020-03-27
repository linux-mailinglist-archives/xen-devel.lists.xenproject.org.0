Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5C195BC4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 18:01:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHsIm-0005rb-KU; Fri, 27 Mar 2020 16:57:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RsLI=5M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHsIk-0005rW-Lm
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 16:57:46 +0000
X-Inumbo-ID: 13c5d33c-704c-11ea-89e0-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13c5d33c-704c-11ea-89e0-12813bfff9fa;
 Fri, 27 Mar 2020 16:57:44 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e5so12066238edq.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 09:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BSR+vpmZtFJYqI6CX0Sc74IW7SVwEnYomy2ab6mR5X8=;
 b=aUnhPN254OKVPR6BkCW8SOhCrOQGUi+XcH4qigPwH9DZW5c+jZPOtqwvItSqjNyIJl
 UV9qlst5SqtQePGiN8IEAIbpNYYpQ8boRmSADbKIcOp14o7aj9rMjH9cF8KUgssEdT19
 lSYES7QZRXudkBDqZku8Ux9hwevW1tZRb1wf8r0rDHabukoy1Ne5e9MdgGmJ2ickKa53
 3WKBqAu4HpRsZmuCFzdIX2chY2vq3u5wHHQyBJBonz6lHGsPYUxpTjB4xXdJOHUK8A3W
 +VRJKWVhZC6xvmHa7PZlvOBeZmmgDPbKDCsGcf5AmGZlR6oKkmYjJA8AqsoxbQNeK6Wv
 eL0Q==
X-Gm-Message-State: ANhLgQ2Uths1N3JSwT/844pmT2zx2bTBI5fydJFrvAswLJgSgaGzIpNy
 1j3eylaqs6M87692dAJMIww=
X-Google-Smtp-Source: ADFU+vvq2TN+7H3Sfz2wv8+zKCufEPHH0FYiPyruvtHoBWltnwh99OY8JECFVU5818EOiSa+U1dWMA==
X-Received: by 2002:a17:906:2419:: with SMTP id
 z25mr3027128eja.155.1585328263672; 
 Fri, 27 Mar 2020 09:57:43 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id v1sm837256ejj.87.2020.03.27.09.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 09:57:43 -0700 (PDT)
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200327134610.23387-1-paul@xen.org>
 <20200327134610.23387-3-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c19b5f08-4afc-547f-b589-0401395a4a6a@xen.org>
Date: Fri, 27 Mar 2020 16:57:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327134610.23387-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v8 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 27/03/2020 13:46, Paul Durrant wrote:
> +The semantics of this are similar to the domain issuing
> +TRANSACTION_START and receiving the specified <transid> as the response.
> +The main difference is that the transaction will be immediately marked as
> +'conflicting' such that when the domain isses TRANSACTION_END T|, it will

NIT: s/isses/issues/

Acked-by: Julien Grall <jgrall@amazon.com>

I can fix the typo while committing the patch series.

Cheers,

-- 
Julien Grall

