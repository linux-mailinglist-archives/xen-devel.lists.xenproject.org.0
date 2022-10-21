Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8360759F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 13:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427610.676857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpsm-0005o5-3x; Fri, 21 Oct 2022 11:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427610.676857; Fri, 21 Oct 2022 11:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpsl-0005lK-W7; Fri, 21 Oct 2022 11:08:07 +0000
Received: by outflank-mailman (input) for mailman id 427610;
 Fri, 21 Oct 2022 11:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mzs=2W=citrix.com=prvs=28632f022=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olpsk-0005l8-2T
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 11:08:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0591d95-5130-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 13:08:03 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 07:07:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5611.namprd03.prod.outlook.com (2603:10b6:806:bf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 11:07:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 11:07:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a0591d95-5130-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666350483;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1q+SXao/O4tCvCbHRfo58mEzeauQ/uzK8NowfFpLEns=;
  b=P5kG0A5pWTieCK3MpdcYajF6CMrdxzWI8WuGVwFFcoVn8Gvupch5i8T7
   RDrTo/eWyJRHz8ud1ky4xtZZVDlSqeUz//FwQ1W2Kjrl+aeB3hHLdLhQC
   6Jc7nayJwVqeQ9laEUGZU3fvrXkqhim1/TM14ylXEkAVa3x7URlG1rQ//
   A=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 83254189
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AqzwhEaAMU5XdMhVWkefolAYPlx7EJoYKDSr04?=
 =?us-ascii?q?L1icEF8aCcT4heQU07ArUqNFxZbRdHnUmJwcRT8AexJdDrOOQsxw/KwnzBVt?=
 =?us-ascii?q?Y21JjzeJeG6eYGzdhbNoMhgYURaVpsw33cKaHaoaMlynJCRidbIOQfu5N3kt?=
 =?us-ascii?q?2qZvhJLVypltq6FC2hH7nhEi9dx9x+WE5ojWKRqpH4B5jJY6h4mzY0UBGZn/?=
 =?us-ascii?q?pwxs9m2z+ZQo3RRQKvgW60uC579f/57hSLsZRZULv6HhIxr7eCJhnSxC2SB7?=
 =?us-ascii?q?+qhAur3ncYQj8IWyMnsRQnviIhUWp/jUyRHdlicUy1vexzbVXDeL0oYObD6Q?=
 =?us-ascii?q?GLtQ+UQIbJwJ9RaD6rxMb/Wnwc5DRpALBxO/nCkPF3LHUXTrfheoXn8ePOzw?=
 =?us-ascii?q?FNjmpCAdaTI4JKsRjm41WANWcEVitZLJbQmmVMVTtTc/Qfofs4t0A7N6AI7e?=
 =?us-ascii?q?Zf78c53fYtB5fB1xVQE67XFsXCSSVsqUsSAqqYe0d+VOYpkMgfipCSqJUCmS?=
 =?us-ascii?q?xnSN8jwHwryjwE9h9JfAl9s9p+sBrlhJv2qDo9R9AN9xr0cm5rB8mCPOYxYn?=
 =?us-ascii?q?N+8ILdfuIU47vVDEPwlxWmzL4gXB9EuZ4odsfGJVTL2VSefS0EGPogJOUTfM?=
 =?us-ascii?q?A+DqovWSY41DSLI16VT5M91Vij8vCnUrUII4cniTvHPE2oB07/jkIRULQT4O?=
 =?us-ascii?q?VMKx2M4x0DKEBaLQ4RtE3/UjyyXcYavCzo8ufuS7e2LivCIcu60YhKcBqz42?=
 =?us-ascii?q?Uf+hjW6FpsorbPaP07g5vO30s18lAgvpkkid8ZmnjRiRQHsv89MaqZ1mJruv?=
 =?us-ascii?q?tiskKa+KxTImAxvm07Nfi/ZPr4vGtgZsehbH2UThllHGZ6J9+eh8yi8rt8Ms?=
 =?us-ascii?q?PSYmHH7TFCSxcPtBAmQOB38f5vW0Wshk5jXemJc6nEfuBxjNZ3CyC9yqtSwc?=
 =?us-ascii?q?bSnndBZMjWGs2+6vSzppYh/1BSTV7voly2dljEAT25wBFDXVxWedXeg4kMEO?=
 =?us-ascii?q?7hdDX/lF6wg13tngZgcoJWFOvBmH4U5MJXkRw8Z8oww/kZYVci46B7ffXWY7?=
 =?us-ascii?q?iDXfddhc381wcwg7u1gt5iSdFFRDho1OzkkIh9lIDvCquZ1podUZrsBlDvh0?=
 =?us-ascii?q?BeCDoX+xT8MYCL8ALWv1II3Oa6bdtiyzXBbXAAyS/bMF3l2qvz+ZdqfAgEtK?=
 =?us-ascii?q?t2wxSWMZOYObbHhocyt8e9SNOxw6t9PSrgkNcXBk9KIagXb9rNtT/Z5IbpWH?=
 =?us-ascii?q?eoh0UQ0VLS47uxwvcxFIWNt30aYLF/mySE0WIjqv/rDWpgqKg7+Z56YC/Z/k?=
 =?us-ascii?q?0p+Q2TFZwnNNPTYqI73bBJBfcimJvdLKb0V96mbeGJZR4G+FvKOM1bMqyBxE?=
 =?us-ascii?q?iPCoDPCNL134JNrKcSjfD0qwUapXvl7vi6H10NVORsd+mjQ8HLJ42thi3uvv?=
 =?us-ascii?q?/j4BLxzlg+K4K9PKs4GoeXK2GrbylM3FHbXQJMPJJQIYzEyyayskTZyNJyUO?=
 =?us-ascii?q?DmCGoIk0nOmMKYi8vzyR7pPBg3O19XeM9GIDS1a/dEDJsMVpdfBsRranj/ux?=
 =?us-ascii?q?dQSaOML+1TRg3GPoR6GMVnnTr1ZWg2GNv6x2JSAhJnKsJ9TaSr8KI66Fb6v/?=
 =?us-ascii?q?hRIDP2HX/888b0h5CVs7dvzIkgnEaMHPox+fdzDVStEZLWayeP24QNeQec5n?=
 =?us-ascii?q?ZNZ9fzwqmiSFoF6S15Vs2gjXVeqcSLvHzer5k6orpkXFUTdFMK0s3zx6JUPu?=
 =?us-ascii?q?Jo+CKGAUnBI17vA7K6lkAwAodwiWwi6sKR+Ld9VkKTZ0lDtTn6Samaa+cy8C?=
 =?us-ascii?q?YSnCrzSQUlvWgBz0L1mN+T9RNZMNpTkX1CPJv+5Dps2YFLDciRtUirZ1QJV0?=
 =?us-ascii?q?lzr6opISJV9AWoN7rUuXLFBAHqcJ6Km+1t+g06hiAB/wrfr829jwkRGqliLv?=
 =?us-ascii?q?+5V0nbu/7Yh4pYAhlscUG43JX8wbZfU6WvaE1TxQASet0eALPm4LDUDCg6is?=
 =?us-ascii?q?h6q1U913nnjk8tHWpy+KPTCTb25Enw/bkqZBf0IoLp2CuW3uxs8ei+CKdhc4?=
 =?us-ascii?q?J5yvO0shUvQIMRjMHzRGaxcjPE1wtq6/7aoay66M+K5TudoZ3kOKRReWDPgd?=
 =?us-ascii?q?n+NO537NtJ0D47WMTdUQDRgU3udMlFmZKL4Amm8py7ZhAuVRcboZLB5l4zqb?=
 =?us-ascii?q?EQl+YLTMPtlvMTpI1GQFI9G5+0rMAyRUj5dNd0t71bU91qhvLe4lCFqz9XMo?=
 =?us-ascii?q?HAxbQ7a8QyHQV0KVlpzN1R382P26dhIcCgrOqLqeKVF8LECMNNnW6MWx3P33?=
 =?us-ascii?q?mOIeX9CuNpsA+IOvu7q4V8bXTM9AJkCrulhF32rcv2fyWD9mGPJRFD7FEAWS?=
 =?us-ascii?q?rHoZGkoQz6GcV07jMcSvzI2kySueKKen27jNWNhAolv2YMl+7kyDLvK0r2Wh?=
 =?us-ascii?q?QUcm2BFuNjQ3h19e6/2KHoVLruRupTe6vRhRm6eP8dwu+xeO57JcQAzPxtop?=
 =?us-ascii?q?u5Eyj27SBs3BsHkObYNNXscrGcOMo+KU5eb+KTmW0SQmFcHs0VmFMiVGExE7?=
 =?us-ascii?q?rRLunUFVD8UPSE4nfx7iHPVoA815yKitEG8iSTJc24/jMF05xCsD1lTZok0r?=
 =?us-ascii?q?v8050/YZ0aWKTSOv5/G/Ygx5TQxp6a5p9ncoUsaMDqiYGfUoWDyu3RPEu7RW?=
 =?us-ascii?q?6kAUUNfm8iNrqJMnkvCpkIlJ4iKw2PyKFcROKs4LS6nOMF+jI47VvFbpkz76?=
 =?us-ascii?q?PEWlAAgL+i0QaMzUhHV+zDG7VV71OXPzlnL3M04gAZklsu85hah6YB0J9KTF?=
 =?us-ascii?q?nq4nwBbHbwaf/T5Z/jmNvT9ZM7lRUQyF+t40npJyCggaJrhBhv4i6F8l+UA/?=
 =?us-ascii?q?+fz3FM=3D?=
X-IronPort-AV: E=Sophos;i="5.95,200,1661832000"; 
   d="scan'208";a="83254189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/ERgk/FasxgZcVEB+upE40um5GXefiekg/B3ZYlnIquwvGsvffRSMAvi4VlptkG4TmUrR6FSHjTYG4Y/kCNjiFHDmSSxaWcA2vJesXStho1lyG9P4nURu/71p1yFkmnlnVqBLXzPjytDFWSD+7KzliO29c0UoP9zFd4ys936qV91VKg61muoDU2JW85HoAlOIHH/pNepK0mbetBvYXffRm5WyRmR+6RghhIx8CHjmLsH5GqOSL3aGJimjgVrH0RtfkSs2IJxVbfiUi5zQBXZmTwNUnCrhYgLqhJPhFqDOMGPri75N2ijruI/BXVw0QZon+8CgG7+3pYf1T7f+lULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q+SXao/O4tCvCbHRfo58mEzeauQ/uzK8NowfFpLEns=;
 b=aiz/W5fMVbaaWb6V8IJcxvnk+s9sZ0GfaZGOHbfuLcYhbu/h6IN2sXDfHp+1P4giLvxw0BWolHxsMuLyBcz96ZRISDn143BaJwFSe/sgk8W2sMKqxoNvn+rf6c3o/9ozPK25hQkMT7rFBuMVwLhIg7es+bwO7diIFVGbOlGfNN5yFyL1f020kZ8C9+wrtBxBLyFBxRSpVFMAxtPlDwB72b1OozIMGr7bMuhOwJviZsmxv0P8CP0wKCj17aBEERFKwlBjw9zX8uabMctMkh8QvkkDN9JzOG5t8Slm9LnYztU4kUFObaHm7H/vPIqjiV5seM7WUxzM3qV5DymVEj+Z1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q+SXao/O4tCvCbHRfo58mEzeauQ/uzK8NowfFpLEns=;
 b=k7jSz4XBgSzKxsXwZqRW/3y9AzC3iP2k5jF1pEGGrdzUG1CIPZ23Z832YGaWkF4Ge8IKv9TXVBPjX9tCXCNNWgYMePkbn0naWkQo5/mQk1Fa5RACPA5RmVUlSG7e2lr6pi27rGyt/nqqFeygAqLksAwUesaFY+zVq53GnXK24LQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli
	<dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] xen/sched: fix restore_vcpu_affinity() by removing it
Thread-Topic: [PATCH v2] xen/sched: fix restore_vcpu_affinity() by removing it
Thread-Index: AQHY5TsCDBxhIyGpEE69vEHtm4vF364YsEgA
Date: Fri, 21 Oct 2022 11:07:56 +0000
Message-ID: <5ff6c502-dfd2-c0f8-9776-c6a974aa2bb1@citrix.com>
References: <20221021105026.16186-1-jgross@suse.com>
In-Reply-To: <20221021105026.16186-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5611:EE_
x-ms-office365-filtering-correlation-id: 90d45a00-e8a5-48f7-3cf0-08dab35481f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pri6W66VGOyRwrNlBx7Pws/uQY9MbNXEG0242Iobhk3i2VpnaqNSYBRhJ/NYfMxNYf+BK6BhOQusNTcZ5iaRO41CXyVyRE2PEVAvcJANwLnpNOHcU6paIGNMEoOn8L0KUa6i6q2uMq0gQMx2kC329dCoe4D+xjguCkkEx26RZK1Pg6dQWgWtilMyjnZnfks2YRTFD4m4mYady+mfQU/IRufZl0jsKDCkxHDs40bjJrk2EjhoRM2XVYooZSfzh1hGnLV2Rx/U2qPvtAcsrp2pGPxBeOljVYVF2IIQNpjFsa0kD1lzMHJztwpVAqiHQnqUY/ikk7QVNDZ8QoiFtwcyinudYHHMBhoHan0i/s8DhrOk+Q06avSRz4mR/088Cbg7h28ZMO7tlBrhjOVJdFLUpHWcNUmn6AfW5tTKz3cAwGkSuDztsmlglr77FAb9NgyUHbtJGsUOWCxKvHKPty89F6Dstse5FP7lz4D8JQIuYtq9yKdkHKm5jsOfXe5KLarOV3FehkSxXg/dY43CLz7GD8rCIDpxo2KTGpg71PvHu5ZbGuoeX3nZFtFPA1/9ZDsQbMZZLF+2u3sVidn57852k9LX67YPkruwo8F765NepKXgmomSehjBDnK752p0lFtI9cIahYjoI1UXoVgvJHT3uqsrng813i55SdkAsT79pSPqf0kGlIlpRUaBiWSVvr+8ST9aIP1aGrkf530tWDQ3Jo27TiptH5s+CsA8Is8LUu2ZlAp2EoMC16MMlhRqtPrSLIxIXk0s8OX3V6woVgjIUIG+DCdw1xfda56vhCNtcPBCKuzyMZwnGrTRP7rW3lMkFCMGF3eUb92fxtHGG8VgXg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(186003)(66574015)(31686004)(36756003)(86362001)(31696002)(71200400001)(2906002)(122000001)(38070700005)(38100700002)(82960400001)(83380400001)(26005)(2616005)(53546011)(6512007)(6506007)(8676002)(41300700001)(316002)(66556008)(4326008)(91956017)(6486002)(478600001)(64756008)(66446008)(110136005)(8936002)(66476007)(76116006)(66946007)(54906003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXJPN0JxM2dGaVE4dnBrcHQwNjM3Um56SEwxRE9sUDd0U0gzaEt4dDNDeXhC?=
 =?utf-8?B?VHVQL285RE1oRWJuejdaR2RKYUhyMGZJQVlYeG82TUo5a2ZacXlsV0Y0YzA0?=
 =?utf-8?B?WllwU2VlQ29XV2E1ci81anVDTkhPYU02TW9jTXo0clJCTjZoYlVKYWlVTjAr?=
 =?utf-8?B?U0MydHNMc3RGMmVqZzVqdlRNeXBoT0NwQ3dMek9EaXBxWFkzTkd1OHFsajNu?=
 =?utf-8?B?TlRCZTUvd0tGVm1SMXZVSFRYM0poTmlxbGIzckF1QzhzSHI5TWhpOGp2c3BP?=
 =?utf-8?B?ZXB0Ynh4TFNlOXM5R291Y0RabFJEZDVyVGJvc0lIR09EK0h3Uklpb3J6aFNm?=
 =?utf-8?B?eFg3YTd1V2NXc3N2WVVsK2VMOTF0N3hyUks0S3F1UHRBeFdidWltVWxtY1hm?=
 =?utf-8?B?dllwK281bk5HOXNRbmczYlFwRmhrY3AySVRDRVZ2dW9QbFVNOG5JZ1RBSU8r?=
 =?utf-8?B?Q1UyNVlXK0VMY09OWGxUV2RPVVFMc0JjVnZhUGxKcUhkOWU5WDQ0akN4eHYz?=
 =?utf-8?B?VmplVW5nS0kwUks1T0tsWmNtS2kzTktYcXlUd0VjMW81UHBjM2p4bXZiQzhq?=
 =?utf-8?B?SlhWaU9nOSt4R2srQ0hnN0YzT2JNZDluK3NuZjRRcmh0dTA5TUpCUURhVDdY?=
 =?utf-8?B?eS8rdXlYcm8wNlNkZjFONVpzOXFHR2hUUjlpdUU5SEg3SVJUdzdVdWZLUkFq?=
 =?utf-8?B?eTY4OS9tZ29xVUZQSng2YU9UMklSZy9Pb29GRU80NkNBZGxiOUhIOHFMd0hX?=
 =?utf-8?B?Znc0bVdaYktld2pleFdoaHRpL1MvYkIyMHdkeEM2c1pHLytSOHllYVZpMVd4?=
 =?utf-8?B?a1VSWGRxamhaSzF4ZFhjTTBSemE2YmkvMEUrL3NleHBKMDRlcDQyWFhvSzFF?=
 =?utf-8?B?Q0FLSmNRZmU0NTh1NkhYTmZYeGRuOGFBZGhCd2I3TE5kcndvQjYxbUV3TzNy?=
 =?utf-8?B?a2dyR2JTalRJY0g5OVpGZXJ4MWNLRDBzdTkvWXI4L0o2N3pjSGhxb01nenFl?=
 =?utf-8?B?Nnk2cUhmSjB1cmpCa29nT0YzbjBCbWFWUzlpK3liYkhFVXhTdmxoYmFoaHUw?=
 =?utf-8?B?UnMxZlJ2N29ZSEljVWEwa1hFTFdmcTlBZmw1c3UrRDYxc0JkaGY3TTBmdjY3?=
 =?utf-8?B?SjhnYjJVT1VoZTVpc1R6N1Y3UGtDam5Ha1dpNTltNjlBRXJlWi9KaXZiMmNr?=
 =?utf-8?B?cmZhcmpwbHhNcmh1WWxMR3FIbHRSVzRVTXVmZTVOTjRJaU1RMUsrVDN2RGJz?=
 =?utf-8?B?QXpnSUxQN3RoTE5yZVBrNktBT0VueG0zNDVSbVVqZE9rV1ZiRlFiVTRIZWps?=
 =?utf-8?B?aHd5Rm84Sk5ld2ZKRHRhS2dGKzIzemYxaVdHVW9lcWFKSi9DcDdBcUhJVTJQ?=
 =?utf-8?B?VXF2Y05UYWVEaXR4elpGbmJYUDBSYVQ4aVB1bUdzcE1EbGNzYytPV0tsU1RY?=
 =?utf-8?B?VG9SemMvQTJXd0VLRzJsaHV1Zm85UytodDNYZEpheDhFQWtmK3hKV1M0Qk1Q?=
 =?utf-8?B?Ky9wZytrd3dpSVNlQ2huSS9FcnJUbjk1aEhodGdEak0zU0ZrN3JaY1FqRUVJ?=
 =?utf-8?B?QWtqZjdyVWVPMS9CZi9FdVFzYktwRE1BdmpZV2VWNStPeEs3VHRJRFlVd0Ny?=
 =?utf-8?B?T0RNbVoxUi9jdGtlUTFuVm81a1FVR1YvODlTdW9Va1o3VE5UaUNzUFl4Sjlm?=
 =?utf-8?B?UklRQkhaRzNXZzE0TE5TeDVxQlhjeERZL3ZzTlNHS25hektBMjhydU1IaTI5?=
 =?utf-8?B?V0JSU2VjaHVyTk5uMng3eUZvU2NIQmRpcnBvdkxPcUtwdTNOQ2hyMUhsUnRU?=
 =?utf-8?B?ZXdSek80QjZiUlZzcEI0eG1kYzJCUUk3VVZCaGdETmR3WWhnb1JBNUNYakcy?=
 =?utf-8?B?Q1B0M3RocW8xZ216TkxNdWE2cUJIM2lpNVhuWUJ0SXZSRUNmNDdBWTJxWFZP?=
 =?utf-8?B?ZUNzMitBYkZOdnM3dEx2b0pnenc5UWJ3Mi9KNkkrMHNKcktuYWhnTy9sRmZh?=
 =?utf-8?B?TTRSb1hoMWFHekNiS1h2Mk1MeW9TalQvTjhqd3JBY1hrZmdvYmNtS1RpUTBy?=
 =?utf-8?B?VUxKYy9XSWlhdWJYMndUNEJZTjRwRjJwbGFMVXlQNnhQeXVwaXFXeGRPcnZV?=
 =?utf-8?B?NFlDZlllOEV0dytJc2lzdVhmOGtrL3lYcmY3NjJsbTBFZUNpN2ZyWCtMdExK?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FFE6FCF997E37439A383C38399E61BD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d45a00-e8a5-48f7-3cf0-08dab35481f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 11:07:56.4326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NYY6vGrD+Cxj8iO4h0+5VkTMlIa9xmSskLQC/JF9bXMqLISwb+vYBik1j8AxUxj5SYdMofulMnBTeUGjrDC+LnZ3WL89GbEvEzVnpMhItU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5611

T24gMjEvMTAvMjAyMiAxMTo1MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gV2hlbiB0aGUgc3lz
dGVtIGlzIGNvbWluZyB1cCBhZnRlciBoYXZpbmcgYmVlbiBzdXNwZW5kZWQsDQo+IHJlc3RvcmVf
dmNwdV9hZmZpbml0eSgpIGlzIGNhbGxlZCBmb3IgZWFjaCBkb21haW4gaW4gb3JkZXIgdG8gYWRq
dXN0DQo+IHRoZSB2Y3B1J3MgYWZmaW5pdHkgc2V0dGluZ3MgaW4gY2FzZSBhIGNwdSBkaWRuJ3Qg
Y29tZSB0byBsaXZlIGFnYWluLg0KPg0KPiBUaGUgd2F5IHJlc3RvcmVfdmNwdV9hZmZpbml0eSgp
IGlzIGRvaW5nIHRoYXQgaXMgd3JvbmcsIGJlY2F1c2UgdGhlDQo+IHNwZWNpZmljIHNjaGVkdWxl
ciBpc24ndCBiZWluZyBpbmZvcm1lZCBhYm91dCBhIHBvc3NpYmxlIG1pZ3JhdGlvbiBvZg0KPiB0
aGUgdmNwdSB0byBhbm90aGVyIGNwdS4gQWRkaXRpb25hbGx5IHRoZSBtaWdyYXRpb24gaXMgb2Z0
ZW4gZXZlbg0KPiBoYXBwZW5pbmcgaWYgYWxsIGNwdXMgYXJlIHJ1bm5pbmcgYWdhaW4sIGFzIGl0
IGlzIGRvbmUgd2l0aG91dCBjaGVjaw0KPiB3aGV0aGVyIGl0IGlzIHJlYWxseSBuZWVkZWQuDQo+
DQo+IEFzIGNwdXBvb2wgbWFuYWdlbWVudCBpcyBhbHJlYWR5IGNhbGxpbmcgY3B1X2Rpc2FibGVf
c2NoZWR1bGVyKCkgZm9yDQo+IGNwdXMgbm90IGhhdmluZyBjb21lIHVwIGFnYWluLCBhbmQgY3B1
X2Rpc2FibGVfc2NoZWR1bGVyKCkgaXMgdGFraW5nDQo+IGNhcmUgb2YgZXZlbnR1YWxseSBuZWVk
ZWQgdmNwdSBtaWdyYXRpb24gaW4gdGhlIHByb3BlciB3YXksIHRoZXJlIGlzDQo+IHNpbXBseSBu
byBuZWVkIGZvciByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoKS4NCj4NCj4gU28ganVzdCByZW1vdmUg
cmVzdG9yZV92Y3B1X2FmZmluaXR5KCkgY29tcGxldGVseSwgdG9nZXRoZXIgd2l0aCB0aGUNCj4g
bm8gbG9uZ2VyIHVzZWQgc2NoZWRfcmVzZXRfYWZmaW5pdHlfYnJva2VuKCkuDQo+DQo+IEZpeGVz
OiA4YTA0ZWFhOGVhODMgKCJ4ZW4vc2NoZWQ6IG1vdmUgc29tZSBwZXItdmNwdSBpdGVtcyB0byBz
dHJ1Y3Qgc2NoZWRfdW5pdCIpDQo+IFJlcG9ydGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IEFja2VkLWJ5OiBEYXJp
byBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPg0KPiBSZWxlYXNlLWFja2VkLWJ5OiBIZW5y
eSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KRm9yIHdob21ldmVyIGNvbW1pdHMgdGhpcywgTWFyZWsn
cyBULWJ5IG9uIHYxIHNwZWNpZmljYWxseSBpbmNsdWRlZCB0aGUNCmRlbHRhIGluY2x1ZGluZyBp
biB2MiwgYW5kIGlzIHRoZXJlZm9yZSBzdGlsbCBhcHBsaWNhYmxlLg0KDQp+QW5kcmV3DQoNCj4g
LS0tDQo+IFYyOg0KPiAtIGFsc28gcmVtb3ZlIHNjaGVkX3Jlc2V0X2FmZmluaXR5X2Jyb2tlbigp
IChKYW4gQmV1bGljaCkNCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jIHwgIDMg
LS0NCj4gIHhlbi9jb21tb24vc2NoZWQvY29yZS5jICAgfCA3OCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgfCAgMSAt
DQo+ICAzIGZpbGVzIGNoYW5nZWQsIDgyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMNCj4g
aW5kZXggMWJiNGQ3ODM5Mi4uYjc2ZjY3M2FjYiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2
L2FjcGkvcG93ZXIuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jDQo+IEBAIC0x
NTksMTAgKzE1OSw3IEBAIHN0YXRpYyB2b2lkIHRoYXdfZG9tYWlucyh2b2lkKQ0KPiAgDQo+ICAg
ICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOw0KPiAgICAgIGZvcl9lYWNoX2Rv
bWFpbiAoIGQgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgcmVzdG9yZV92Y3B1X2FmZmluaXR5KGQp
Ow0KPiAgICAgICAgICBkb21haW5fdW5wYXVzZShkKTsNCj4gLSAgICB9DQo+ICAgICAgcmN1X3Jl
YWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+ICB9DQo+ICANCj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gaW5k
ZXggODM0NTVmYmRlMS4uMjNmYTY4NDVhOCAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMNCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gQEAgLTExODgsODQg
KzExODgsNiBAQCBzdGF0aWMgYm9vbCBzY2hlZF9jaGVja19hZmZpbml0eV9icm9rZW4oY29uc3Qg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpDQo+ICAgICAgcmV0dXJuIGZhbHNlOw0KPiAgfQ0KPiAg
DQo+IC1zdGF0aWMgdm9pZCBzY2hlZF9yZXNldF9hZmZpbml0eV9icm9rZW4oY29uc3Qgc3RydWN0
IHNjaGVkX3VuaXQgKnVuaXQpDQo+IC17DQo+IC0gICAgc3RydWN0IHZjcHUgKnY7DQo+IC0NCj4g
LSAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1bml0LCB2ICkNCj4gLSAgICAgICAgdi0+
YWZmaW5pdHlfYnJva2VuID0gZmFsc2U7DQo+IC19DQo+IC0NCj4gLXZvaWQgcmVzdG9yZV92Y3B1
X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpDQo+IC17DQo+IC0gICAgdW5zaWduZWQgaW50IGNw
dSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsNCj4gLSAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsN
Cj4gLQ0KPiAtICAgIEFTU0VSVChzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX3Jlc3VtZSk7DQo+
IC0NCj4gLSAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7DQo+IC0NCj4gLSAg
ICBmb3JfZWFjaF9zY2hlZF91bml0ICggZCwgdW5pdCApDQo+IC0gICAgew0KPiAtICAgICAgICBz
cGlubG9ja190ICpsb2NrOw0KPiAtICAgICAgICB1bnNpZ25lZCBpbnQgb2xkX2NwdSA9IHNjaGVk
X3VuaXRfbWFzdGVyKHVuaXQpOw0KPiAtICAgICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnJl
czsNCj4gLQ0KPiAtICAgICAgICBBU1NFUlQoIXVuaXRfcnVubmFibGUodW5pdCkpOw0KPiAtDQo+
IC0gICAgICAgIC8qDQo+IC0gICAgICAgICAqIFJlLWFzc2lnbiB0aGUgaW5pdGlhbCBwcm9jZXNz
b3IgYXMgYWZ0ZXIgcmVzdW1lIHdlIGhhdmUgbm8NCj4gLSAgICAgICAgICogZ3VhcmFudGVlIHRo
ZSBvbGQgcHJvY2Vzc29yIGhhcyBjb21lIGJhY2sgdG8gbGlmZSBhZ2Fpbi4NCj4gLSAgICAgICAg
ICoNCj4gLSAgICAgICAgICogVGhlcmVmb3JlLCBoZXJlLCBiZWZvcmUgYWN0dWFsbHkgdW5wYXVz
aW5nIHRoZSBkb21haW5zLCB3ZSBzaG91bGQNCj4gLSAgICAgICAgICogc2V0IHYtPnByb2Nlc3Nv
ciBvZiBlYWNoIG9mIHRoZWlyIHZDUFVzIHRvIHNvbWV0aGluZyB0aGF0IHdpbGwNCj4gLSAgICAg
ICAgICogbWFrZSBzZW5zZSBmb3IgdGhlIHNjaGVkdWxlciBvZiB0aGUgY3B1cG9vbCBpbiB3aGlj
aCB0aGV5IGFyZSBpbi4NCj4gLSAgICAgICAgICovDQo+IC0gICAgICAgIGxvY2sgPSB1bml0X3Nj
aGVkdWxlX2xvY2tfaXJxKHVuaXQpOw0KPiAtDQo+IC0gICAgICAgIGNwdW1hc2tfYW5kKGNwdW1h
c2tfc2NyYXRjaF9jcHUoY3B1KSwgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHksDQo+IC0gICAgICAg
ICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKGQpKTsNCj4gLSAgICAg
ICAgaWYgKCBjcHVtYXNrX2VtcHR5KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkgKQ0KPiAtICAg
ICAgICB7DQo+IC0gICAgICAgICAgICBpZiAoIHNjaGVkX2NoZWNrX2FmZmluaXR5X2Jyb2tlbih1
bml0KSApDQo+IC0gICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICAgICAgc2NoZWRfc2V0X2Fm
ZmluaXR5KHVuaXQsIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5X3NhdmVkLCBOVUxMKTsNCj4gLSAg
ICAgICAgICAgICAgICBzY2hlZF9yZXNldF9hZmZpbml0eV9icm9rZW4odW5pdCk7DQo+IC0gICAg
ICAgICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB1bml0LT5j
cHVfaGFyZF9hZmZpbml0eSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVwb29s
X2RvbWFpbl9tYXN0ZXJfY3B1bWFzayhkKSk7DQo+IC0gICAgICAgICAgICB9DQo+IC0NCj4gLSAg
ICAgICAgICAgIGlmICggY3B1bWFza19lbXB0eShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpICkN
Cj4gLSAgICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgICAgICAvKiBBZmZpbml0eSBzZXR0aW5n
cyBvZiBvbmUgdmNwdSBhcmUgZm9yIHRoZSBjb21wbGV0ZSB1bml0LiAqLw0KPiAtICAgICAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfREVCVUcgIkJyZWFraW5nIGFmZmluaXR5IGZvciAlcHZcbiIs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVuaXQtPnZjcHVfbGlzdCk7DQo+IC0gICAgICAg
ICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVuaXQsICZjcHVtYXNrX2FsbCwgTlVMTCk7DQo+
IC0gICAgICAgICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB1
bml0LT5jcHVfaGFyZF9hZmZpbml0eSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
cHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayhkKSk7DQo+IC0gICAgICAgICAgICB9DQo+IC0g
ICAgICAgIH0NCj4gLQ0KPiAtICAgICAgICByZXMgPSBnZXRfc2NoZWRfcmVzKGNwdW1hc2tfYW55
KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkpOw0KPiAtICAgICAgICBzY2hlZF9zZXRfcmVzKHVu
aXQsIHJlcyk7DQo+IC0NCj4gLSAgICAgICAgc3Bpbl91bmxvY2tfaXJxKGxvY2spOw0KPiAtDQo+
IC0gICAgICAgIC8qIHYtPnByb2Nlc3NvciBtaWdodCBoYXZlIGNoYW5nZWQsIHNvIHJlYWNxdWly
ZSB0aGUgbG9jay4gKi8NCj4gLSAgICAgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEo
dW5pdCk7DQo+IC0gICAgICAgIHJlcyA9IHNjaGVkX3BpY2tfcmVzb3VyY2UodW5pdF9zY2hlZHVs
ZXIodW5pdCksIHVuaXQpOw0KPiAtICAgICAgICBzY2hlZF9zZXRfcmVzKHVuaXQsIHJlcyk7DQo+
IC0gICAgICAgIHNwaW5fdW5sb2NrX2lycShsb2NrKTsNCj4gLQ0KPiAtICAgICAgICBpZiAoIG9s
ZF9jcHUgIT0gc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCkgKQ0KPiAtICAgICAgICAgICAgc2NoZWRf
bW92ZV9pcnFzKHVuaXQpOw0KPiAtICAgIH0NCj4gLQ0KPiAtICAgIHJjdV9yZWFkX3VubG9jaygm
c2NoZWRfcmVzX3JjdWxvY2spOw0KPiAtDQo+IC0gICAgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmlu
aXR5KGQpOw0KPiAtfQ0KPiAtDQo+ICAvKg0KPiAgICogVGhpcyBmdW5jdGlvbiBpcyB1c2VkIGJ5
IGNwdV9ob3RwbHVnIGNvZGUgdmlhIGNwdSBub3RpZmllciBjaGFpbg0KPiAgICogYW5kIGZyb20g
Y3B1cG9vbHMgdG8gc3dpdGNoIHNjaGVkdWxlcnMgb24gYSBjcHUuDQo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IGluZGV4
IDU1N2IzMjI5ZjYuLjA3MmU0ODQ2YWEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IEBAIC0xMDE5LDcgKzEw
MTksNiBAQCB2b2lkIHZjcHVfc2V0X3BlcmlvZGljX3RpbWVyKHN0cnVjdCB2Y3B1ICp2LCBzX3Rp
bWVfdCB2YWx1ZSk7DQo+ICB2b2lkIHNjaGVkX3NldHVwX2RvbTBfdmNwdXMoc3RydWN0IGRvbWFp
biAqZCk7DQo+ICBpbnQgdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoc3RydWN0IHZjcHUgKnYsIHVu
c2lnbmVkIGludCBjcHUsIHVpbnQ4X3QgcmVhc29uKTsNCj4gIGludCB2Y3B1X3NldF9oYXJkX2Fm
ZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBjcHVtYXNrX3QgKmFmZmluaXR5KTsNCj4gLXZv
aWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpOw0KPiAgaW50IHZjcHVf
YWZmaW5pdHlfZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGNtZCwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF92Y3B1YWZmaW5pdHkgKnZjcHVh
ZmYpOw0KPiAgDQoNCg==

