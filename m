Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82361EB245
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jftzx-0006tS-VX; Mon, 01 Jun 2020 23:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jftzw-0006t6-L5
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:37:40 +0000
X-Inumbo-ID: e1b666d8-a460-11ea-8993-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1b666d8-a460-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 23:37:40 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s10so4211369pgm.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
 b=FatqtVOR5hD/fcjlHQiJxex0C6zQusiasYEb/yEipsUHJ8XYLQsy5xfoCZP0e+yu2k
 iuyeevu0q7AhEwUlWsJu32GG5SazukklQ7e67apLyPFjt5a/kRoa7XobmxW3KegBIMKP
 ENP/BSizdgxJ2u8Tvh8iFJAyCgLU5iLwR4aQ1m509XvSedk9+fo6MComm8rgpnGt+o0N
 Q98WvROsPGMZBjMcvm6JrmLaNrnVanswonOdPV+SMxS43AgLRfuApjZXh5bhpv+tDGdz
 MMCTMQ66HTYSfiIMqxA5Ki+niSFNrxoUK9Dpm02g07u76J4kojC7ItRwfO6gs62s6NM6
 DARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
 b=RFa/WiI4Pybh8QrzXQrUoril5f/v0xgaja7BzjBcfTKoDu9JcKnhdvOnpOD9laF1DI
 AfskaIN+/pUTdyUU+owFKyiGamHmKGLAvG36Hnci+YhXsojRMUBbC08rF685MwzK8Pob
 vyWIMOGd3Raa8TZQ9WRWfibaHidHCFb87c/6IA5bWuKabHx0ChXbIxA67CEMYQ6YUODL
 4DeD/6Y3ysyfSq4Bc7eHE4srVxfHGLrrBiy39s3IPpbh4VxDzbASE70F9JyyJDRgwi27
 l5+4QQAJ3B6XEOTfMvNy6XtzKTERhIMMzJs83fIQT+zDj9jkEaCQ0Fsn7dXVxf+M4Ms8
 df2Q==
X-Gm-Message-State: AOAM531wFXMFLSlrg6wt3IO6cYsohJyfx8xJKhh9tYA2VMsdM/7BcArR
 9+OJAqabBLgg0rzy3PXdU2ekQQ==
X-Google-Smtp-Source: ABdhPJxhd+PX2dAfPlV44Fx/pz/N3NFXKQtVkApW6bgZq/7EFs6cRCLgC6WvnR+4RiTgTsBqwCGGXQ==
X-Received: by 2002:a63:6345:: with SMTP id x66mr20915001pgb.156.1591054659488; 
 Mon, 01 Jun 2020 16:37:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id g19sm415680pfo.209.2020.06.01.16.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:38 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <403c7efe-bfa4-c6e3-7ab7-0592bc16bfc8@linaro.org>
Date: Mon, 1 Jun 2020 16:37:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/xen/xen-hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


