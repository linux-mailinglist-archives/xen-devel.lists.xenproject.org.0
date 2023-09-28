Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264D7B1F36
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 16:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609872.949030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlrh6-0007em-GL; Thu, 28 Sep 2023 14:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609872.949030; Thu, 28 Sep 2023 14:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlrh6-0007cx-CJ; Thu, 28 Sep 2023 14:08:44 +0000
Received: by outflank-mailman (input) for mailman id 609872;
 Thu, 28 Sep 2023 14:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlrh3-0007cr-Vw
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 14:08:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84cb6656-5e08-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 16:08:38 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 10:08:32 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7346.namprd03.prod.outlook.com (2603:10b6:806:382::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 14:08:27 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 14:08:27 +0000
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
X-Inumbo-ID: 84cb6656-5e08-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695910119;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AUiYQwJ67v0Xx4SFfRPihqBzXghz4nyDPkyDzsrdACA=;
  b=huPlOaHjgWgEARZZl3Dhvgat0iUkjTpvm9xUz5YUzrm+ut7GIRr3nJE6
   4MZ7zAsjYKagp7x2DyzYP/XHTVjGFc1REBu+Phb87kTvDI4SMgkY7UzPb
   B0UBX6sK+yAvb7JLAe+e3NVrSMOLmmkNAthHspNLfJiJ29uFSEerMx36l
   o=;
X-CSE-ConnectionGUID: 6p4IEvxvTx+IGtai8wSpDg==
X-CSE-MsgGUID: Lpl47fXhTmOY08IFPoBuQQ==
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 123332610
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:pwp2MK3zNZyUXpmhHvbD5SVwkn2cJEfYwER7XKvMYLTBsI5bpzRSm
 GoZDWGPPKqNNmHxKIh1b9m1ox4AvMPUzNFqHgZlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5g1kNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfX3kS1
 NEGOC4xflOiqP6/weKkcfFAiZF2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv23bSUx32iAOr+EpWc7vo231OjxlAWLyxOBXqVmf6Tl3eHDoc3x
 0s8v3BGQbIJ3FCiS9DmdwG7pHOCsQ8RX5xbFOhSwAOHx7fQ4g2ZLnMZVTMHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv42k+XjXjjTqoYLGJiYV6wPNTySa5wV2TIe/Ysqj7l2z0BpbBIOQT13Eu
 WdencGbtboKFcvVyHTLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCHCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:k6rFTKrWQ0Q+SBFIokEMlu8aV5oJeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MBThHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaerIGuP3iJxAWN2uqUuFkTsaEJ2IMT0JdzpyfSVNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3APfbiPGuMQqUQLFzarWDiOn7X6It7aiH84WnAPXO?=
 =?us-ascii?q?oSkdGVLSUGUCr4I9rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A88utcQxbPJXVOqvpCbVWNf7d6KaaqIC2DBxSn6U?=
 =?us-ascii?q?Gh8yjBHQgGhmlix6qe7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,184,1694750400"; 
   d="scan'208";a="123332610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nM/BOliumtzQoSicvnXC+BScUZM/8oukFahXJgGnllnk3UReHovoTr7EMMBOTpj7T/WUzF/L7RRtdJRr/l09JTHab15+dlZeagwxJtNwfH2L1oonqBmks3Lkau6j25mR01J9FFH6g/QF4D47vPLvqzNre3Dy8aer2EpxUIKD3O0AXgEJ1RZa/9Vgp+5IoQWrlex5qtkoCplYM//h5KddfHZOkgO4klOSCeppMWyg2q30ODm72ubUhPZFxrQ+poVieJYC/Y3GfO3THYTHmBjJz+EzW3X2iNnxGM/DP/n+CdFljc4J/KDeQHJmACN7DSJ9P7mWozTO3qoK4ztgY7n2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ09ZLM2bWVt/zqEhBwLTLGEgTmQ6io+0t023Q+v9ZU=;
 b=P5koBy62Jf//Y/G8j2X878NFRW6jntTmsz3rW4UEjZXprFSpiVrunvC+OcnqJdsmoSVtCQfzTR2uZRuCzV9zOoMbWagn0yJtyvT/5a3ckf42AyzmtOdeNj40GX2dU5g5rEqSmg+Odhs00X1Ne9jooI3cpZds75jB+193sAvB1rJP8ribnB3IfLJWa3XzqDZ3hfdxXY497avxpofsrj4N+eu/frsoHcZP/K8gtREryczGv8FIeTGcasaJO5cWdGe7hKsBpRJC5lbrbqlSxiurVO394s6PZ4EbP/CK20NIV+SevKyfhW13L8Miv6duDN7qSoZ1EdcWl5nfKNbz7jDG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ09ZLM2bWVt/zqEhBwLTLGEgTmQ6io+0t023Q+v9ZU=;
 b=EKksKwDxlghF/mCG7JzXZPh9kx7IDuZQ1O6qFd5lMHdORUs+hYFjrSb268J9VTTFKTxeWkCDvBRBc6gdc1eLjgyDmD8J7FP3QRir6Jk9hD5O+jwowXJj1TVXyMvjkU8LE4YVFjUQct1p3Okq31jKolXWjBE6zNgi18b+Hjr9Dls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 16:08:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRWI1vGscL9ItRMk@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
 <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
 <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
 <ZRVeiAFlyf1LJ2qR@MacBookPdeRoger>
 <CABfawhmAZGTaKZfmwY4t8599i6qKaTOJ-fngFmtvS4LhJMh7iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmAZGTaKZfmwY4t8599i6qKaTOJ-fngFmtvS4LhJMh7iA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: abb8b6f6-f91a-4d69-61e0-08dbc02c62c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aXitKEg0+mUlp5wieIgyZzll5bfDqBj+MPfDXTvsfXHwVFeRlhYMlOm4a9d723Ptsv2BE9frbv5Odg35ilTViNq8n6q6U66JvJT+B26NyvJNL3Aue62WTzY4Iz4vSjFI9wN+u6d6PT/C0kp0pUin6qHEC291cvipC+GJdDjyQBSeQ2E1ak/9Hu3/DOD9GeBP4yHkuMhmm51DQbK0X1Vc77L5V6JVrzLJvZoJ60pvd6IeAnw1IjZblwcPy2LMeMeajhRDO6S9l2oCL0ByfynxX30pGo+7cGOzxYthHk72iccfZnt9ldwzj+TfElabel2iSC/fHNrCUWICBmsxVvVmJMdWUjEgCQXfmdBn877jQoFmFPFbC3OhrpIYwyf6DTAwsPIMTFcFp29kLLXZauodwKxHroKdSUoj1sfSwkOqBzVhPbx5/0K0xwH+eFA69xZJyF9m7CNFLnZt7FUtdbcP86pFpQ+/OGdBSvxQjGMKAvzoGg473jo0/eWrjZ8l5tiahMqb82QuEqro8r+fmo1LSv6Lln5P3nj5OnMyPgm1sapc0ZCFI4jJzya+ath1mF+8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(26005)(6486002)(478600001)(66899024)(85182001)(33716001)(83380400001)(86362001)(82960400001)(38100700002)(5660300002)(53546011)(6506007)(6512007)(8676002)(9686003)(2906002)(4326008)(41300700001)(316002)(6916009)(54906003)(66946007)(66476007)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJscSt1UVVZYzFXT3oyMFBKZlNPZm9remxmaGd4SEZuWDNzaksyN2JaRWRp?=
 =?utf-8?B?Z3diNzkyNWZ2bmc0cGFKTElvYXIwOUE3QmN1NWlCcFYvVkpKcFlNMzU5SExB?=
 =?utf-8?B?V2x1ZFlRbG9KWFJWNDNBbnJYUldqcmZ6bzdXaUZYQ0VBcVdyYW5oNDhSTXJM?=
 =?utf-8?B?T2pXQWxrWmtmdVRrVnBVRkxWYUtaRHJybXZYQjl5dDgzSEZJQWE0ZEcyQXFS?=
 =?utf-8?B?b1R0YUZrTk1SMTJpdWQrdjBsblc5UEErdjh5WW9ZdWozTnNZcGs3RFlybVM3?=
 =?utf-8?B?Q3pYVTZsd1p3SVYrTEdDWE9Ka2dldTJVU2ZYWWFFMU1vT2lmV2lQMVVoaWVn?=
 =?utf-8?B?RTZsd25MNjlXdEdnTmVYeTZSc0xtRGd4ekRzZ0pEeVlpZ1FXcDYrYVZLRCs0?=
 =?utf-8?B?d0UrKzRuenVVWUN2QzhVb0lUbWlrWllNWU5ZSVZBSmpEUXNuY2ZENE5YU0o1?=
 =?utf-8?B?TGkvclJBNTA1eHdNNExSSDVZb1FDS3I3dVJpQlZhMjBtS0ZFai9pSGk3Nlcr?=
 =?utf-8?B?amxzQnhlOWNVUVI3TUZsRmtjSGh6MW1maU9WaXR0NkxtQ3l6YjVQWlpkdGFU?=
 =?utf-8?B?WG52OUxDQ0hPRzg1TTdnTFZ1OGhqWmEydUtpa0dWUUdjWjF4TzExRXhNRWxo?=
 =?utf-8?B?V2NHY29RUTRXVGNwRjY3VDRKenU4aFRDRUhQS2U4M2hpUzBMV3ZQenI5VkJu?=
 =?utf-8?B?ekdFakQyQXI2OEFEbUYwTmU5MytqK3ZxUHZ5b1ZrZWdWZHB3QnBvcWwxVzVV?=
 =?utf-8?B?VXNZTW5Jc0hNbVM3TC9MZ3hxTWxMcWhERXp4VTdLYUVwUU5XVG1Sd05vTklz?=
 =?utf-8?B?SVBrWGhHSFd2YlU3SFBiY3E3b1Q3K0I2alhoT21XZmZRaHhINUl6YUQrLzVj?=
 =?utf-8?B?VFNVQVhMdUZZQndNZHNOcUNjYnNzVEZKMitiUVlLdERDT3UzV1pEbEZJamVP?=
 =?utf-8?B?dGdVNnNvUUVuNWJRTkV0MEI1d1p3OWw3TkhOamdRUnJlcmpqWk0zbjRVeGpi?=
 =?utf-8?B?OHkyam5kYjV6cUpiYnJDYTRpWVdMNWlWc09BWFdDVWVKMEZQNERjY2hPNDIr?=
 =?utf-8?B?NFIyZjhiZFFCZDdYV1NPV0EyU1BmSkI3R3lJbkdYOE9ha2p3YWZSNkd4VjJK?=
 =?utf-8?B?alN0MHhPY2FNUVZySjNwbTRNSUNib2FMTmZWVWg0SDdsSzMya01kWUpKWUZo?=
 =?utf-8?B?TWZYSTNoQUY2TGNmWFlUOS9VT3dGNjFzcFlUQU1BaWQ3NUNZZCt2QTJqQVF3?=
 =?utf-8?B?dlBjWHRPZll5ZE9Pb0J1eCtNUThjVXRmS29UU2owU2pJcFg2SGsxVExQZHNG?=
 =?utf-8?B?WWNaSjIwQTVDK09kazNNN2pXQVk1MlRDN0haVUl4eEtZL0MrNjJEWWZBTDQx?=
 =?utf-8?B?ZGZld1BxTzZKZmtsalBPb0VYZ2RYUjFvUTVOOEI3cFN5S3Q3M0pPZnlZTjdM?=
 =?utf-8?B?SUlnQXBPcExJWmNCbUZFa0I1QWg0aXdGcWVGQTNEUDBlVzdEalpmWGlxWEFS?=
 =?utf-8?B?dDR2dVl0ME5WR3VwS1V6eExuRTNKbHdLVFJYOG1MS3RERDQ0TUhnNit3bExI?=
 =?utf-8?B?R2FzV3p6QUtmSUZSenlhTHMyVHBwRXVjQjRDVmtGUTdTWXl4Y2Z6Z0R4S2Yv?=
 =?utf-8?B?bG1YeUhjVkJ2VUxldFdkQ3o5aWh5UTJQL2dNSXNOR1M0VVgwRDZGdFFqODcy?=
 =?utf-8?B?aWtyMGtHTFJleFZ5cGhjSEJ1d2RkdVorMGNEZHFKWVNtTlV5RTBRUk8yVlFB?=
 =?utf-8?B?Wi80MHNIS0VkUFZubDJoZC9tb3pjUzZiZkhBSXZQL0oveXJ6M0U2dlVlTWhX?=
 =?utf-8?B?Tnl1OHlxbGJQMWpENTIzRFBoL2UzSjVtTXRFVUh6TUxBTnVVU2RENnE4MTVJ?=
 =?utf-8?B?K3BMektiQ1ZnNHhOOG5TbTArSE51L1hmcFY1TFU1TnRlT1E3OW16SFk4SThx?=
 =?utf-8?B?a1VIblFsS09rYnlzR3hlR3BrYlF0dzJnWlcrbXJBa1dIMm9oTGIzRjJrREgz?=
 =?utf-8?B?blpKYXJlaHI1QXdWaUVTbHNtTDlWdHFKR3NzdlN5bUgxcmVkTWVQSldFMytT?=
 =?utf-8?B?aU9LZUZ2cUhaeExoT1VsUUlPUUt2Z2c3b3BTZG55WEs0bHQzb3ZJVzhNYm9O?=
 =?utf-8?B?Q0NocUltZm44NE5qbmJEZ0NWRmI4K0JvUWNxTmw5NEk2V0hWR0hua3ZZYkc2?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a2jBREmW1c4+eQu3JbHhTvbmRQ+65BwwSTedopZlgpnYouDQb8qpxRS80G0M5QRuNCAKX3h5jclnUEZDKPXBDxQUFKDlZHnARo5Tg7UlcXMIU9LHevTqrmzlgICh0jouZ9331mYNvXprKQzKJ5/eGvTdtSphfKMBlZP8noUMw/chGE/71vVEuxr+SXEbJ9hE+yOVHW0wowVFZDPlHLNKwEevHiJRuwvSTPqM7b6OwWJUmfDuFDdxlRcJKarhMWNZHxI/JOOzTGUvLFOKmv2bQyQNEpGW1gP6ZFoBCbM022S6zfTRUoeWNgbswtaVe+ltueDGKsbBJ7tSmcFKjqmunUJqutVNMEX6aWcPHZjfCfpD1JWNqkwokVi7NVso4s2apCUb75Rg/ZrDE/LpShq7GVlCemqJVqWaLQsDQiS5Cz3b/Pyot2gdP/R3R4k7qwy7JlcfEVG0o4P+gB6MjkByAw4ySMXiS2WBlrvATadghIcWyhsfFIBmhxHsrC0/WgpVwYipznV1PeGJqFafWheyu3Ufa/vYpAGqSezqzNZp832QOdyCASkguvVV+cBitfMpxNH1mtmIXPYuaqdtHrFo8pXkdBn/ZEyrSIe+aucNwK7shQQSIzkUoQZINQbW4BzBP2NJ5lLTocOfT6OlHZwfyN6qDEXeIzP5VRPWm7gq3u+nn0hiRIe2h4660eY93X1oG/ftA4RRCOzT3halsFzWiwiXu90/ut4uROtIdUHyPQDBzn23DqYBO3HOpwzuRKR5iwnVwyK0OVbW7deozOvSE4lIdxChj7ZG0lcm5MZY09FJma4gz2D0s7MR3Z/0nSwxu/TX7tG/1u17Vi6CWEJCTuQgTnEqkDxo2U3R4Y8zBmzVUsx/wpp08/lokESDKpkw0zf9K3fZEvgHSb66Yf/rqy3ekNatX52vkRVLVqfzg+Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb8b6f6-f91a-4d69-61e0-08dbc02c62c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 14:08:27.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RN3mE/97FtmmGQP5uPQRC1pxpDX97ZFMZTKIR+keBlM/7oXYduTOj/Bm2N0ohO7etqTc+cTWR1DX5jkyrfUiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7346

On Thu, Sep 28, 2023 at 08:57:04AM -0400, Tamas K Lengyel wrote:
> On Thu, Sep 28, 2023 at 7:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Sep 28, 2023 at 12:11:02PM +0200, Jan Beulich wrote:
> > > On 28.09.2023 11:51, Roger Pau Monné wrote:
> > > > On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
> > > >> --- a/xen/arch/x86/mm/mem_sharing.c
> > > >> +++ b/xen/arch/x86/mm/mem_sharing.c
> > > >> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
> > > >>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> > > >>  }
> > > >>
> > > >> +static int copy_guest_area(struct guest_area *cd_area,
> > > >> +                           const struct guest_area *d_area,
> > > >> +                           struct vcpu *cd_vcpu,
> > > >> +                           const struct domain *d)
> > > >> +{
> > > >> +    mfn_t d_mfn, cd_mfn;
> > > >> +
> > > >> +    if ( !d_area->pg )
> > > >> +        return 0;
> > > >> +
> > > >> +    d_mfn = page_to_mfn(d_area->pg);
> > > >> +
> > > >> +    /* Allocate & map a page for the area if it hasn't been already. */
> > > >> +    if ( !cd_area->pg )
> > > >> +    {
> > > >> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> > > >> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> > > >> +        p2m_type_t p2mt;
> > > >> +        p2m_access_t p2ma;
> > > >> +        unsigned int offset;
> > > >> +        int ret;
> > > >> +
> > > >> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> > > >> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> > > >> +        {
> > > >> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> > > >> +
> > > >> +            if ( !pg )
> > > >> +                return -ENOMEM;
> > > >> +
> > > >> +            cd_mfn = page_to_mfn(pg);
> > > >> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> > > >> +
> > > >> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> > > >> +                                 p2m->default_access, -1);
> > > >> +            if ( ret )
> > > >> +                return ret;
> > > >> +        }
> > > >
> > > > I'm still unsure why map_guest_area() shouldn't be able to deal with a
> > > > forked child needing the page to be mapped.  What happens when a
> > > > forked child executes the hypercall to map such areas against not yet
> > > > populated gfns?
> > > >
> > > > Shouldn't map_guest_area() be capable of handling those calls and
> > > > populating on demand?
> > >
> > > Funny you should use this wording: P2M_ALLOC will deal with populating
> > > PoD slots, yes, but aiui forks don't fill their p2m with all PoD slots,
> > > but rather leave them empty. Yet again I need to leave it to Tamas to
> > > confirm or prove me wrong.
> >
> > If the child p2m populating is only triggered by guest accesses then a
> > lot of hypercalls are likely to not work correctly on childs.
> 
> That's not what's happening. As I said before, ALL access paths, be
> that from the guest, dom0 or Xen trigger page population. If there is
> a hole and P2M_ALLOC is set we do the following in
> p2m_get_gfn_type_access:
> 
>     /* Check if we need to fork the page */
>     if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
>          !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
>         mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> 
> Depending on the type of access we either populate the hole with a
> shared memory entry or a copy.

Then the code here is redundant, as the call to get_page_from_gfn(...,
P2M_UNSHARE) in map_vcpu_info() will already take care of populating
the child p2m and copy the parents page contents?

Thanks, Roger.

