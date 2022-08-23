Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0459D4C2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391776.629732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPkt-0000Mx-FW; Tue, 23 Aug 2022 08:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391776.629732; Tue, 23 Aug 2022 08:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPkt-0000KT-BR; Tue, 23 Aug 2022 08:59:27 +0000
Received: by outflank-mailman (input) for mailman id 391776;
 Tue, 23 Aug 2022 08:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuKU=Y3=citrix.com=prvs=227d21510=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQPkr-0000FL-9E
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 08:59:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0f72bfd-22c1-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 10:59:23 +0200 (CEST)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2022 04:59:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5086.namprd03.prod.outlook.com (2603:10b6:208:1a5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 08:59:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 08:59:17 +0000
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
X-Inumbo-ID: e0f72bfd-22c1-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661245163;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V9PhqpGn/KsmYU3j1aKqBBHT7BohlM4/U9f4V+NLOig=;
  b=ZjsGAAvnYKK9W50uCOBudr5dPy7hFOdDHcy2Wxo29rXnwt9/5UWC3AGe
   NoRTJ3hhMfRfEbMNiAhXTIHbQKeSQw7Aksb2biiYxfl7KJ8R0MLeEh1nD
   zscDZrQ9G8szDm5k/epkpyV/EEysVCgaXFXy5CnDqqNOOzpVp/jSxuKkP
   U=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 78699890
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ANU15lql0ozCWPwkzFVe7Dofo5mJPLRO08EFM2?=
 =?us-ascii?q?KgSY1vmP7IAGkQgjxdl23q3D9WdSWsbjYSa9Cl2TjqnBWN9arJuhPrzQlrcm?=
 =?us-ascii?q?afNfOKvFfQ/tuOhZJ+yecuwBSOG/nIFU+v9sTUN9U9gG+QbkrmlMFdhwNkk+?=
 =?us-ascii?q?ZPQdHNzqhxQOHcSKmGKKXGldnKPrsaiqcojRp6wNaxORNB066sGLrj2rJILA?=
 =?us-ascii?q?Z2SZ0ST8myStwg1H93e6B//fplV5GRHJEcfC4tzOwErl76EhCfnclADUquPR?=
 =?us-ascii?q?Vtg50MQtkk1FSVX6TEwmc0kujQ9C6ik9eRSOvk9CzJqB7jjaFxwcPzpkU2cC?=
 =?us-ascii?q?X60lnp8cc6mBDtGuYsSSSYNWuXkv4j4v2OCq3vCPbX5WCfDO2GQEjw/Lep7y?=
 =?us-ascii?q?owV0refCHQBPM2tJhKrHMwvas1EZ/VsM2AAn18t861BeQz2FzxfAyJ49IVE0?=
 =?us-ascii?q?LZfeXMXyHuTl+BLntUjDgL6QMD6ocHVnsm92nLl1R6MuJ6oRI6vTwKW2yjQ3?=
 =?us-ascii?q?RHRJJSDTvZtHCB71Ph0qT45ZEaIHPFBXK936hE+mg3PkZv9DYWKH4Odl3yC4?=
 =?us-ascii?q?JmgRrC9Ch5dQ+YhNyimom2Se3pQgD6DB273yIuUlt7SxccijwZYNos6C7eZk?=
 =?us-ascii?q?jvoyZj8ZUS7B7t7dzR9FjPOvUV98Dc+NGbI2tHDcZpY2c3LLRXraCjRqBKGb?=
 =?us-ascii?q?57/lPE0qFG6qbyLEvyudgiS4IYFo4tIV3GQze6ctx9zq8iIv5lkthaNmKDY2?=
 =?us-ascii?q?LLV3VBkSPHwUHm6sCbmJmB4enT41fi+g7cSQFvpRLCGg9D+d2nIEs2NzdnA6?=
 =?us-ascii?q?KYYMKfJhQrB3NgVzK6ziBL4vzR5jmeVNtGiVfoLl07zG4cdjh/FBKuaWHb8p?=
 =?us-ascii?q?95klJ0IWWdWxHEwf2zRUD+pq5Bg12Q3hRGSz51ihNmTwlSA0yhdIqk3MlggR?=
 =?us-ascii?q?AljvgywURWgEG8kf07ro1A095CZ8IIFk6P+Z9sFQSLYa8lwcZos7prM/5Ecr?=
 =?us-ascii?q?uQqfaP5K23cwH4bguudcyTIf8xNBIVWWLEpNheEy7oU+azQIcEq9RsmWW6KU?=
 =?us-ascii?q?XtoEQJh9NSDLhv45WNf1Hb6i/cCEld8en6lsnZtSfVGih9HLveww2MEerqEy?=
 =?us-ascii?q?BDz44UiIUgYFawDf0/zNeQm6z0hyqY60OY2sDz5GKeMj3iqcbUtLyDyaSh0H?=
 =?us-ascii?q?5Hs7yfGdR0JI5wk3nvbLggW4SSyvy7bnx9pTXmg7pbla/dvbrZNSUTKfz9Al?=
 =?us-ascii?q?W4X2H7OlnT97tT9VxYrlRvX9njfKmPkwK1tn5/JshUXNs8f0PnAV35ww1YVb?=
 =?us-ascii?q?SvHMMuuLZsZnYCNmE6ohK5+gnc6+O4djXdSz5ShTXXcObHaytdNudAr+Bq48?=
 =?us-ascii?q?ti+J/zLHVW0io9S70YYsJ9q4iHK20Q2fu1YoNWIqAi0p5iuxNhEtfEkdQOnF?=
 =?us-ascii?q?eDjtVffG3jd7JaxSYrSbC6k7AubKo5oTUKO4Y8QG13Sv+BGeUdx9RPfyt6ae?=
 =?us-ascii?q?sgu41LFkaNLp6FwQ5VUd3mlmpLNtk1JP2wYk1KXPvGUD7XJQuaI9mWUdWbYh?=
 =?us-ascii?q?3uZbzLUGhDsaXscbLGlVTNWA3XoL+hNpikEyhsdpuhgadhC+WJ1/q0rjQaSF?=
 =?us-ascii?q?5DxGdtZ5a+LEiYtPbvVU3SL3B9xGQbp9u3vn13JlXSCCKUqOH47/sXBbPUNG?=
 =?us-ascii?q?QFPsnn8F3wbBHdW5iiqyLxOuGIcsFfYkFtGKCymYfLevYVFIjLh3rC8Qc5I8?=
 =?us-ascii?q?2G7KmX/8VioKWM0apzxs/oEddCdndsuuvhMAtlQ3g+QL1aBslwwA8ve2Xdr4?=
 =?us-ascii?q?rgjWyd/Wo4TxgSd9DajyM65UsoKhVm0xPWllJkSjf8QTGvy2Ke6IBTtnQedt?=
 =?us-ascii?q?JghPg+3V2/w8pNH4hZduxx9PAPIkdvH/DfIq+cMM1O7yUWMQgvajknSYRirq?=
 =?us-ascii?q?P51164aCa5ifhdXbpIZLKhOoBsY9F11g3dcfi0ZTNkOmbwc7GsnNTkyIwk++?=
 =?us-ascii?q?Qwd5+lxqv4y947KcqJG90JDx6NsN+Jow3znjFeB4bVRPuSyD6fHeOz8LPWaN?=
 =?us-ascii?q?kZGUPiTmsLSbxljqhQDK282gOsCHWXlZ5ShRJSPwWeDkz1d58RWy4WlMJjT7?=
 =?us-ascii?q?Q7OHR/bEfx2H6iVtbhyObUhu1eFWNp7rMaV6cskarDULlPV5iwL/DfpdmRYi?=
 =?us-ascii?q?6wFjCI6a8lkUhpNJ3z5F9S7aAvmwCAf8sNeijuB9tdC2sbsonRF5Ef5vLJyR?=
 =?us-ascii?q?AQPwZO4JMDZV9IQrISHGr4ppskBjWZmtnaHKp12W8aO/ZL+9g+cFVqpIMQ2V?=
 =?us-ascii?q?bVGoG613jwUL2BE85N67dfkaIyt5U9yYuesYCbayWaMKEWrwG8nQZsk+ND1a?=
 =?us-ascii?q?qe52GIWbi6CmY9CNS4FxWi+UgrsBFdyXkATRfWncTqZxEbqW87pxQ8NzIlGS?=
 =?us-ascii?q?L3miN2+DE9rKIHw0KXGhKlKln0HKp9BA/sIbnzjwxkhuYWeo5gcKCJWAWiEe?=
 =?us-ascii?q?cpzIyNG4jjDkAK+EPhJqji3S+EpNkwCbabFIxvrmMbOyxBNEDxFLDViqaAty?=
 =?us-ascii?q?8r9j7Qh5FqzOM0Znu3S6NE2qvqHLwueRV2/4zRGGM3DIFhe2b/eihgMeNd9p?=
 =?us-ascii?q?QMp9zuhEfkCFf9ulXBH11k7B+//i3wwPHEpnewuSBe5Wf6Lp10=3D?=
X-IronPort-AV: E=Sophos;i="5.93,257,1654574400"; 
   d="scan'208";a="78699890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccicQT5b6CGUYwphaAB+QfbwOvk1LqxfgcdLiS7njWMW3H8jvxUagoSpeK51NhxDek+QuX2c5UIdpR8tBLM76ah2C5MTEhd8832LON1oi7j8fOuRteSz5CHcRfOrUf0sHfW+/tmtAYDjp39I0jMbeWTR2FJaYEAt8r1GaE/dWZv7VBFMMuu7QeNRgkZ+RqtVmLn9zRX3GMXqkaVyEZ/ykwQahQeBNVOhSXuRmmf2A3RCc8H7xRMjIo6GAe6/Wd3s6I11MiItxo/RV7aQ3vA+k7BUMTpo6zEKQkSGeboSicxYBHB/nDnXGtXtygzu1Tonbcn163rlTg/WWS+DyjFgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9PhqpGn/KsmYU3j1aKqBBHT7BohlM4/U9f4V+NLOig=;
 b=R9Bx941TCiSCVZyEHM6LJUxNC41gVGH+hmaNYnISK0GW44CJ9vZZOnHl0mwqbc8QALQEynDz5eA1Y7gHc4N/uK5Mom/zL5qmC8KMnfgrrXAwfNTeVfKYPY25CLp87Mc3nUovfO7iax0YA59CmwV4fRkjLzTPSNUxaXI7xTWDk+ijBOxZO37FxpJuK69YtIcn+M3UDbh+0EDl6EhzmthaGmI9t4BsT08GJPeRFNwvfQR3UYT+fPCU+Tv0Wyvk/gP6yc0g3e2ZRuLvJQo4ZxWvuVmJT4iBDu9UW7aUHfzYq66vWNtYltHKKOClL/EKNjv128BjW7KkeM0UN94y3WpUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9PhqpGn/KsmYU3j1aKqBBHT7BohlM4/U9f4V+NLOig=;
 b=HRgA0+WpZ1nWcymv2TTpKtL8r66PRlc5zL17RsPt53FKmc0LrKwssrZsTYZidiDacCRayfyBUVD77POeiJbHNovzLc4n9BSjz2WsL8xw7dd2/8LZCBs03nKofcRmJYjSYiM7MD6qsL99ylxY6hK6RtzRs7gLnhB4mFu0rLYYYZk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Topic: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Index: AQHYtrt8/1v0WOY/4kiCtfQ8qrAcS628L8cA
Date: Tue, 23 Aug 2022 08:59:17 +0000
Message-ID: <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
In-Reply-To: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c8db32f-c08d-4e6c-d8e8-08da84e5c29d
x-ms-traffictypediagnostic: MN2PR03MB5086:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5/eiAk+U1daoBvoeYG3iZ2/hVqkjiApjS72vmO7qvQmvsg4Fl3mg51nfJEWImhvIzQ/Hmgtyve58M1FyxPqBkULohCXu1+Vi3QYhyuksUGULi+jDdcru7ndGep2aRjsCMXL6i0DiCd+n5qAtfZ9brHC6pVZfs+KSeXsPxMo7wYradtZxv7KBLgJmKegEUav4fWmvtTljGFN7vmSAwhTSCDKK0FcCvSApqT/7Qu0fhs0b4S2+Zdy+N9FEyOCkyBcwAqiK5Hi2sdOOGanChTPsek1REH4mmg0+LcL1swx2T23GzRGgBF/YXc7u+h552WYO0oyuBJOT3ZVwHerDHu/z/rwgzC4j64Jh7PbB5McQ1kzhCJk466k3AB/SpzC+VKW5rIIZlg/dkDQeQgS7wHDrvgGLsIsmBA6YXza/g412AEOz1dqBnNuM5uO+xsnUYXVOMq6sHSp74ofm7LpOjbpe6lFQXd+sRjzSY8Iz3ZaROq+pw/LhqkkpP8Mkix4kfeOqOSFkVgL7gjTG6iCkvHXpQDtxLUDUzjTK1gO7NMWUduqluZfQ5eRvd2CS8kf71YNpaF3UQb/Ukl31bKcmhapHDrI66rjwz24qe5ZtXbxUMVfHpQMc4Z156KfAKHjx2v8RFu1aBzheMuUhzPRQkOWVRCsuyR7zd5C4B7uRMDlD2VE4Nve5+DQtbsrpPhumrVXNvdtlrojtPwI9shB6RGSh0ngOGiGty4xvOm9wXwx0BwhAWJKVydbBLnqkqXLF1f88akdq8cq/jlpogUGPVOHnbuO8IF6WI4dIGFKmmSbATmhgGfh8yLpj17NuMcmgCkzfDP5oUtgLxejAKcGWhu+1xL8AaGpJ0upimBUXDBUybX8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(6512007)(6506007)(966005)(6486002)(478600001)(26005)(2616005)(71200400001)(53546011)(186003)(83380400001)(2906002)(41300700001)(8936002)(316002)(76116006)(54906003)(82960400001)(91956017)(110136005)(8676002)(66446008)(66556008)(4326008)(64756008)(5660300002)(38100700002)(31696002)(66946007)(66476007)(86362001)(38070700005)(36756003)(31686004)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzNzSjBYTTBnenNabjNMNmZob3o5OE02MVN0TTZFWng1UlpBUDl6cHhqazV6?=
 =?utf-8?B?THpuNGRER2N2ZTdHOWFtbVN2VlFJSWVYL05nZzh5c2p6aFlyRkRKNmRJTTdU?=
 =?utf-8?B?eVBsYWRad1llSmhpSFFjMFN4bExkSGZ6RDJ0eDFEcEpjdlliRGdpNWdjNjNH?=
 =?utf-8?B?bHIvMGV5VFRHbWlCdVVaMnhueEw1K0RudVhWWlgrSDlPR2lISkxtQ1BOYk9q?=
 =?utf-8?B?NWlCaEd3YkZrSGpYTDRSSXdCVElSQmZWeUFVQ0d1ZTJTa3hBdFhmeHBCZDBu?=
 =?utf-8?B?ZDV2K2ZEUUVCek93T1YvSzFqSExZOS9XQ29CeC82WncwWkdKbjRuU05pU3Y4?=
 =?utf-8?B?aHp0ck5mSnBUYXE5Z3czN0diZXRMMDl2RnNVcE82ZnlKQjlVSjNJNklnVXdT?=
 =?utf-8?B?bUx6OFdlUW5JTHByUU14Mm05czNaVUMyYjVkek12ZFJ3REEwUVM1dUM4Qzc3?=
 =?utf-8?B?VllabGNGeW8reEh0L3ZQWFZMS0hYampma3hEODNxUkYrdnl6MXoxK1hZMHRh?=
 =?utf-8?B?Yzd1Rk5ZdVM3UTltRUNTSHEvcFB6bFZEK1V3M1M5OE8wWllnb21vL0VBMXVD?=
 =?utf-8?B?L0Jzak1FNGMzZGhwSENISGZ2TWhZYzRubXBBSFZzc0I3Q25zNkxOR2VnKzZV?=
 =?utf-8?B?alBCV2V6L0Qrd1VDU2Rtc0ZNVk9vTUpWZXpmOEJYZ1hLMHd4Qkg5TUIydHcx?=
 =?utf-8?B?ekZhTmpYMkMyWjdualVHdzF6aUZoT1pHRk5aRVRjbFl5WUlXMGhWOVA1YzVY?=
 =?utf-8?B?WEhmUWZadnZsVHZIRllOZDVHQ0NsQnRrN2tONWdHTkR6L1BlTUxFUkFzbEhw?=
 =?utf-8?B?YzZUenNtd0hrRTZPS2xxVEt1dE9NVHh4Tzg4SEJ6YjJ0TVlNUXJoNTlBY3Z0?=
 =?utf-8?B?OXU2WkYreEk0a0FvR3RBeS8wYlpZZkMxZm1XWmhxb3g5aTlKSHlNa1hlYzJK?=
 =?utf-8?B?M3lacjczaHVhK01HYUVVc09VN2VJKzRybDlzLzlMRXBrSnFsTjR6VlpOWXFs?=
 =?utf-8?B?MDBGWFB6bjJZQUR2cDRFV1k3L1RTL0JsNUJDVE1vWDdCSlU1YkFNTVp4VEJ3?=
 =?utf-8?B?clNmQVBNUDJGaHFKNytIYlJrR09UdHRTdHhUVnpxL0dsdGhRMlJONzJGbGFE?=
 =?utf-8?B?Vys3eWZPaHB6M2JWdFM3dGZyZUZDRWVXUEFWRzJMY3JyWXlpWk8wTm11N1lB?=
 =?utf-8?B?ODF2bzJMdHVvZ2JsNk1XdGFoTmJyRlRrNFBEVHlPYlpwY3Z5UnVwL2cvOVpi?=
 =?utf-8?B?V3hXY3ZJaGRlVU5vTVRONWJnTERtckNsTThBRHppVHZadlptQnExMFdTQnVB?=
 =?utf-8?B?UU15VHFEemJKMTVLdVZEUndTdEQxekxDWTdQaTRFS2VCaGtERTlKbU9ibmZV?=
 =?utf-8?B?NDd0bGZ0NkJRUHUvT1FZeFRGWU5uQisvU01CUmJZNXA1OEpEUU5aUHZlWS9t?=
 =?utf-8?B?TVprY1hnVXdqY0V1NXB4Rk9qZW9kckhGVmc0Z3g3dk5pVmU4aTE2TGxxRGtR?=
 =?utf-8?B?b1FtV251UElvUTAxVDNsaFV4Yk9OM001dHJ2RHN3NC9KTklIZVJPejdOT25T?=
 =?utf-8?B?UlZxbGRXaW1EbDBkNjZueFFOemdRVm5IY2hCMFR1SnZiMzhqM1VqZHAxQVN2?=
 =?utf-8?B?OXdQWGF4MDNLQVBvZEluYVpjYzhDc1hWOW5vUlBuZ2orNkM0Skx1N1VIOXEw?=
 =?utf-8?B?VnZ2MUFPM2tmT0VySlZhamJQRXJXOGgvOXo5U2VRWUtEa2ltTUpFTCtvOHNv?=
 =?utf-8?B?UlY5RytWMVpJdXNZdmhHZFNJMUYvSEt2TlB3UU5kM3lpQmRNR2J2RFNnQnhZ?=
 =?utf-8?B?VTB0ZGtrcmpNQThzRzNhQ1Ivc1RWWkM0QlhpMnI0cEZRbDVsRk02Njk1S0c1?=
 =?utf-8?B?ZlI0YnZjOFNycnRnOG1IR2pUeWZMd2t5WWZWZ2V0dVFRSno1aGhCM1JXdHNq?=
 =?utf-8?B?ci9aSGxKbmo2NXZBNGVwZnFxV2lacmtGcE1CRzJ3dUJQZFBhcjgvRlRqT1h4?=
 =?utf-8?B?bU82ZWNhcWlIYXo0dnY5MlBtald3V1FDOUsvellpRU1ZZkNqNm16d0NrWU5D?=
 =?utf-8?B?VWVBVEJXRHFrNHNybjYrV0pYdmx2S0YwT3FjeWZRSjZXV0xHSGp6LzBxdDVF?=
 =?utf-8?Q?ohiuqv0PxQU4BxDmeQun9+iOy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD5235C85EA1944AA686C013BDDFBE4D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8db32f-c08d-4e6c-d8e8-08da84e5c29d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 08:59:17.3379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+FQeO/RymMTfH9iAD+WMqhFNSZrO09R+l+NRBLk7ACOTa/V469kdQ9pST1EVu6D/qR1xGOnx5oWeZ8SIOpWH11mCFsbz6B369UzZwKqK/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5086

T24gMjMvMDgvMjAyMiAwNzo0MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlIHRoZSBTRE0g
aXNuJ3QgdmVyeSBjbGVhciBhYm91dCB0aGlzLCBvdXIgcHJlc2VudCBiZWhhdmlvciBtYWtlDQo+
IExpbnV4IDUuMTkgdW5oYXBweS4gQXMgb2YgY29tbWl0IDhhZDdlOGY2OTY5NSAoIng4Ni9mcHUv
eHNhdmU6IFN1cHBvcnQNCj4gWFNBVkVDIGluIHRoZSBrZXJuZWwiKSB0aGV5J3JlIHVzaW5nIHRo
aXMgQ1BVSUQgb3V0cHV0IGFsc28gdG8gc2l6ZQ0KPiB0aGUgY29tcGFjdGVkIGFyZWEgdXNlZCBi
eSBYU0FWRUMuIEdldHRpbmcgYmFjayB6ZXJvIHRoZXJlIGlzbid0IHJlYWxseQ0KPiBsaWtlZCwg
eWV0IGZwciBQViB0aGF0J3MgdGhlIGRlZmF1bHQgb24gY2FwYWJsZSBoYXJkd2FyZTogWFNBVkVT
IGlzbid0DQoNCmZvci4NCg0KPiBleHBvc2VkIHRvIFBWIGRvbWFpbnMuDQo+DQo+IENvbnNpZGVy
aW5nIHRoYXQgdGhlIHNpemUgcmVwb3J0ZWQgaXMgdGhhdCBvZiB0aGUgY29tcGFjdGVkIHNhdmUg
YXJlYSwNCj4gSSB2aWV3IExpbnV4J2VzIGFzc3VtcHRpb24gYXMgYXBwcm9wcmlhdGUgKHNob3J0
IG9mIHRoZSBTRE0gcHJvcGVybHkNCj4gY29uc2lkZXJpbmcgdGhlIGNhc2UpLiBUaGVyZWZvcmUg
d2UgbmVlZCB0byBwb3B1bGF0ZSB0aGUgZmllbGQgYWxzbyB3aGVuDQo+IG9ubHkgWFNBVkVDIGlz
IHN1cHBvcnRlZCBmb3IgYSBndWVzdC4NCg0KVGhpcyBpcyBhIG1lc3MuwqAgVGhlIFNETSBpcyBm
YWlybHkgY2xlYXIgKGJ1dCBvbmx5IGluIFZvbDEpIHRoYXQgdGhpcw0KbGVhZiBpcyBzcGVjaWZp
YyB0byBYU0FWRVMuwqAgVGhlIEFQTSBoYXMgb25seSBhbiBlcXVhdGlvbiwgd2hpY2ggc2hvd3MN
Cml0IGFzIHRoZSBjb21wYWN0ZWQgc2l6ZSB3aXRob3V0IHJlZmVyZW5jZSB0byBpbnN0cnVjdGlv
bnMuDQoNCklkZWFsbHkgSSdkIGxpa2UgdGhlIG9waW5pb24gZnJvbSBzb21lIGFyY2hpdGVjdHMg
YW5kIGEgY2xhcmlmaWNhdGlvbiB0bw0KdGhlIFNETS4uLg0KDQo+IEZpeGVzOiA0NjBiOWE0YjM2
MzAgKCJ4ODYveHNhdmVzOiBlbmFibGUgeHNhdmVzL3hyc3RvcnMgZm9yIGh2bSBndWVzdCIpDQo+
IEZpeGVzOiA4ZDA1MGVkMTA5N2MgKCJ4ODY6IGRvbid0IGV4cG9zZSBYU0FWRVMgY2FwYWJpbGl0
eSB0byBQViBndWVzdHMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQoNCkNDIE1hcmVrLsKgIExvb2tzIGxpa2UgSmFuIGhhcyBmb3VuZCB0aGUgaXNz
dWUgeW91IHJlcG9ydGVkIG9uIElSQy4NCg0KSmFuOiBCZSBhd2FyZSB0aGF0IEkgc3VibWl0dGVk
DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIwODEwMjIxOTA5LjEyNzY4LTEtYW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbS8NCnRvIExpbnV4IHRvIGNvcnJlY3Qgc29tZSBvZiB0aGUg
ZGlhZ25vc3RpY3MuDQoNCj4gLS0tDQo+IEkgYWN0dWFsbHkgd29uZGVyIHdoeSB3ZSBzdXJmYWNl
IHRoZSBYU0FWRVMgZmVhdHVyZSBiaXQgdG8gSFZNIGRvbWFpbnMsDQo+IHdoZW4gd2UgZG9uJ3Qg
c3VwcG9ydCBhbnkgb2YgdGhlIGZlYXR1cmVzLg0KDQpCZWNhdXNlIHRoYXQncyB3aGF0IHdhcyBv
cmlnaW5hbGx5IGFjY2VwdGVkIGludG8gWGVuLCBhbmQgSSBjb3VsZG4ndA0KcmV0cmFjdCBpdCB3
aGVuIGZpeGluZyBDUFVJRCBoYW5kbGluZyBhdCBmaXJzdCBiZWNhdXNlIGl0IHdvdWxkIHJlZ3Jl
c3MNCmFjcm9zcyBtaWdyYXRlIHRvIGEgbmV3ZXIgWGVuLsKgIFdpdGggQ1BVSUQgZGF0YSBub3cg
aW4gdGhlIG1pZ3JhdGlvbg0Kc3RyZWFtLCB3ZSBjb3VsZCBpbiBwcmluY2lwbGUgZml4IGl0LCBi
dXQgYXQgdGhpcyBwb2ludCBpdCdzIGRlZmluaXRlbHkNCm5vdCB3b3J0aCB0aGUgY29tcGxleGl0
eSBvciByaXNrIHRvIGFkanVzdC4NCg0KPiAgSXQncyBzb2xlbHkgYmVjYXVzZSBvZiB0aGlzDQo+
IHRoYXQgYnkgZGVmYXVsdCBvbmx5IFBWIGRvbWFpbnMgYXJlIGFmZmVjdGVkIGJ5IHRoZSBpc3N1
ZSAoSFZNIHdvdWxkIGJlDQo+IGFmZmVjdGVkIG9ubHkgd2hlbiBYU0FWRVMgd2FzIGhpZGRlbiB2
aWEgZ3Vlc3QgY29uZmlnIHNldHRpbmdzKS4NCj4gV291bGRuJ3Qgd2UgYmV0dGVyIG1hc2sgdGhl
IGJpdCAoZS5nLiBpbiByZWNhbGN1bGF0ZV94c3RhdGUoKSkgd2hlbiB3ZQ0KPiBmaW5kIHRoYXQg
bm8gZmVhdHVyZXMgcmVxdWlyaW5nIFhTQVZFUyBhcmUgdmlzaWJsZSB0byB0aGUgZG9tYWluPyBU
aGF0DQo+IHdvdWxkIGxpa2VseSBjb21lIGNsb3NlciB0byByZWFsIGhhcmR3YXJlLCB3aGljaCBw
cmV0dHkgY2VydGFpbmx5IHdvbid0DQo+IG9mZmVyIFhTQVZFUyB3aXRob3V0IGFsc28gb2ZmZXJp
bmcgYXQgbGVhc3Qgb25lIGRlcGVuZGVudCBmZWF0dXJlLg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94
ODYvY3B1aWQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1aWQuYw0KPiBAQCAtMTE0Miw3ICsx
MTQyLDcgQEAgdm9pZCBndWVzdF9jcHVpZChjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdQ0KPiAgICAg
ICAgICBzd2l0Y2ggKCBzdWJsZWFmICkNCj4gICAgICAgICAgew0KPiAgICAgICAgICBjYXNlIDE6
DQo+IC0gICAgICAgICAgICBpZiAoIHAtPnhzdGF0ZS54c2F2ZXMgKQ0KPiArICAgICAgICAgICAg
aWYgKCBwLT54c3RhdGUueHNhdmVjIHx8IHAtPnhzdGF0ZS54c2F2ZXMgKQ0KDQpJZiB3ZSdyZSBk
b2luZyB0aGlzLCB0aGVuIGl0IHdhbnRzIHRvIGJlIHhzYXZlYyBvbmx5LCB3aXRoIHRoZSBjb21t
ZW50DQpiZWluZyBleHRlbmRlZCB0byBleHBsYWluIHdoeS4NCg0KQnV0IHRoaXMgaXMgZ29pbmcg
dG8gZnVydGhlciBjb21wbGljYXRlIG15IHNldmVyYWwteWVhci1vbGQgc2VyaWVzDQp0cnlpbmcg
dG8gZ2V0IFhlbidzIFhTVEFURSBoYW5kbGluZyBpbnRvIGEgcG9zaXRpb24gd2hlcmUgd2UgY2Fu
IHN0YXJ0DQp0byBvZmZlciBzdXBlcnZpc29yIHN0YXRlcy4NCg0KPiAgICAgICAgICAgICAgew0K
PiAgICAgICAgICAgICAgICAgIC8qDQo+ICAgICAgICAgICAgICAgICAgICogVE9ETzogRmlndXJl
IG91dCB3aGF0IHRvIGRvIGZvciBYU1Mgc3RhdGUuICBWVC14IG1hbmFnZXMNCg0K

