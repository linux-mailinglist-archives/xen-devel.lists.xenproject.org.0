Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20752254455
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBG9b-0004c1-Bw; Thu, 27 Aug 2020 11:33:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBG9a-0004bw-0Y
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:33:14 +0000
X-Inumbo-ID: b93581b3-b5be-4981-bced-82f63a95af0b
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b93581b3-b5be-4981-bced-82f63a95af0b;
 Thu, 27 Aug 2020 11:33:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u18so4837432wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9ZPhpEUUibhjM7bWqEjgeQkiTIIS6x3pDYIyQorKjPc=;
 b=CJc2prwHg+kNWj/w9HSWZ6A+EEFohxDggvQJu+oJfmYyPEzzDuWrZPcMTW0y9dC2WL
 6CLqVLFofOFDFVdpj5w1TRfl4+S+axn1kxjq+YoZXYxrUunHn9iqMwN/gQ53L3Sgjp+S
 rKqhZRAwl9vDzuxMX6CSp5qV7toeBFHW8I9Q4TzAEPyqxEBErO3XkT3Bn/YQ5JFik57V
 RBnu2pTht2fr1euaCq6LhJYoTM8oZsGeL3nDDVj/kS3T/Ce03QX3BaA55oj29TdW41mK
 5kSV7Lwl4i9Y7cSj+iRKV78vjw8aS0xcwax65WiSAYOfxsiyIbe/qKgsgEoJ9PlzOfQq
 Xw3A==
X-Gm-Message-State: AOAM531vZYReSqj6iXEe0xdPViWEfN+jYrKvxm0lh9ra4oAFIe32+15w
 tyAtyEIK3coLGewRdXPiuRQ=
X-Google-Smtp-Source: ABdhPJz0JcgDAi8ghNvbmmZrip9/wHlBIV1LNv/421sz9eipFpSW1jQyZyjcQmEMDRu2Nl2mcWMK7Q==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr11758450wmb.77.1598527992221; 
 Thu, 27 Aug 2020 04:33:12 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f125sm4384081wmf.48.2020.08.27.04.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:33:11 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:33:10 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 26/38] tools: move libxenctrl below tools/libs
Message-ID: <20200827113310.ctvlzurstmonmdn7@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-27-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-27-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:07AM +0200, Juergen Gross wrote:
> Today tools/libxc needs to be built after tools/libs as libxenctrl is
> depending on some libraries in tools/libs. This in turn blocks moving
> other libraries depending on libxenctrl below tools/libs.
> 
> So carve out libxenctrl from tools/libxc and move it into
> tools/libs/ctrl.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org> (stubdom parts)

Acked-by: Wei Liu <wl@xen.org>

