Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCAA2438EE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 12:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Any-00045y-Iz; Thu, 13 Aug 2020 10:49:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6du=BX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k6Anx-00045s-1Q
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 10:49:53 +0000
X-Inumbo-ID: a5d48a8e-ed4d-43f8-9e41-55bf88ae330a
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5d48a8e-ed4d-43f8-9e41-55bf88ae330a;
 Thu, 13 Aug 2020 10:49:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c15so4813391wrs.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 03:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yRt180X45kgnvPHtfW7+9lf1geEYXtrtk50GfYbMfh4=;
 b=b/mVzELaxSzgn3Z5EyPWgkaPhWeyTxFqvpwZh1uO9PteUrpWljk4gEU9CP0rwsXpuN
 ndcTW7CWTTndgjuxctIhKW1aQ5ivZf1agnoDCQIjAusgUgFsoiDLU6z/UwKAi7W+xMVX
 ur6AmN2TSM6WzrmUNa4JCRl1QoV2c8v+/zwV6YgXwGtCRxA+gkCI31rti3DUClEjdb9/
 W5zmCKU3KmLKWW14P+4xF1IM7O3Lyrtdu6GsZQ4J5gav5Fp2Ij0vZsa4CXhTM4MFmg4t
 ikg/zpeEHWx7KSr/SOwejIGehkqsm2/LUjT/o9mHvnxFbBD279KykKIolK7rZrml91C0
 KuVg==
X-Gm-Message-State: AOAM531W2wRL5Oe93hx8+DRM0RiSTZwYkjD7KOdB2f9qEfIkKeCq9+gf
 jvv6FDpu2Csvpyo/1APXU9Q=
X-Google-Smtp-Source: ABdhPJzohISv9BMmVc0FjLlFb6whjt3AU3su8DZGpZYb3sm6Eabs+YH5SPJgslfpqW47ISs5YiWGZQ==
X-Received: by 2002:adf:90d1:: with SMTP id i75mr3342367wri.278.1597315791384; 
 Thu, 13 Aug 2020 03:49:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m16sm9065943wrr.71.2020.08.13.03.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 03:49:50 -0700 (PDT)
Date: Thu, 13 Aug 2020 10:49:49 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86 / viridian: remove the viridian_vcpu msg_pending
 bit mask
Message-ID: <20200813104949.cfllpdvmh5tfupi3@liuwe-devbox-debian-v2>
References: <20200813103553.29177-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200813103553.29177-1-paul@xen.org>
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

On Thu, Aug 13, 2020 at 11:35:53AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The mask does not actually serve a useful purpose as we only use the SynIC
> for timer messages. Dropping the mask means that the EOM MSR handler
> essentially becomes a no-op. This means we can avoid setting 'message_pending'
> for timer messages and hence avoid a VMEXIT for the EOM.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: "Roger Pau Monné" <roger.pau@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

