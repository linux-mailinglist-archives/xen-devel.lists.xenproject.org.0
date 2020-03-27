Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C74195BA3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 17:54:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHsC5-0005YS-Et; Fri, 27 Mar 2020 16:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RsLI=5M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHsC3-0005YN-5r
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 16:50:51 +0000
X-Inumbo-ID: 1d186b1c-704b-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d186b1c-704b-11ea-a6c1-bc764e2007e4;
 Fri, 27 Mar 2020 16:50:50 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id cf14so11981983edb.13
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 09:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39BD7JAcCkiccId5bTypZFLaykl3NAcEK/G2gk4adME=;
 b=udC7CZZsDBOu9aB14H52WhkoNm/IoxBQcUQsYphkd8yqCQTqCt0GveBI/jT/ltIub0
 8jSdDEYonrlUsbMUWYK1OAa9jnQ9coiLTvCw2fg6ex9HwlAOIRcPVBMz2lZtFui6I4mM
 Y7GT7D4Fe+t+SdO6JnMs+8M5qBp1f/8oNXbjYm+fIcrPGZjpXg1430rGsU3JFNHyrsCR
 xyreaRbn0MI3G/8ESzPnW+qTOOaZ6GatH22cn6+ZP6aXb3K/GAmk3QMwtXSuxtpfpEiS
 X6inoo1m45Bq/w1oq/hGhx0yw0q8kGLiFxuYBzfweTwOLkVMsd7uC0b4hyugH8wOeuxE
 yaDg==
X-Gm-Message-State: ANhLgQ1nDRbUrzdxjPiI/fdm0aOvc+zEfC0Rq8ysFZ7k0igqz6qVw0d4
 uL5h71lpo0XUyt/O3iP7+e+iI+pQ8r4=
X-Google-Smtp-Source: ADFU+vtZMpiGTAFHWUkO2EUuzxkg9OGSO6UCK+iFj1W8aqp5dGk/HhFmPDkvzpw5hqHpOyiexfXdeg==
X-Received: by 2002:a17:906:b88c:: with SMTP id
 hb12mr12378112ejb.210.1585327849715; 
 Fri, 27 Mar 2020 09:50:49 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id z13sm943022edj.81.2020.03.27.09.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 09:50:49 -0700 (PDT)
To: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@citrix.com>
References: <20200327142256.3256-1-olaf@aepfle.de>
 <24190.3426.470473.335250@mariner.uk.xensource.com>
 <20200327143735.GA4443@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <aa774ea3-6901-65d1-dc4c-d2d26bd84284@xen.org>
Date: Fri, 27 Mar 2020 16:50:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327143735.GA4443@aepfle.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v1] libxl: remove limit for default number
 of event channels
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 27/03/2020 14:37, Olaf Hering wrote:
> On Fri, Mar 27, Ian Jackson wrote:
> 
>> This seems likely to be right, but: what is the default in Xen ?  Is
>> it sufficiently tight to stop a guest using too many resources ?
> 
> The value of d->max_evtchns will be either 4k or 128k.
> AFAICS no extra resources are allocated with the changed value.

Event channels are allocated using buckets. Everytime you will a bucket, 
a new bucket will be allocated.

By increasing the limit, you effectively increase the number of buckets 
than can be allocated.

So while I agree that the default allocation will be the same, you 
effectively allow the guest to use more resource in Xen. Therefore I 
don't think this is acceptable to lift the limits for all the guests.

Cheers,

-- 
Julien Grall

