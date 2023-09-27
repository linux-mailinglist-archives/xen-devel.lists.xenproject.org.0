Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E92F7B05DA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 15:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608941.947769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlUzx-00050H-2D; Wed, 27 Sep 2023 13:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608941.947769; Wed, 27 Sep 2023 13:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlUzw-0004x6-Up; Wed, 27 Sep 2023 13:54:40 +0000
Received: by outflank-mailman (input) for mailman id 608941;
 Wed, 27 Sep 2023 13:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlUzu-0004x0-SQ
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 13:54:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 641d6208-5d3d-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 15:54:36 +0200 (CEST)
Received: from mail-sn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 09:54:30 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7485.namprd03.prod.outlook.com (2603:10b6:510:2f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 13:54:25 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 13:54:24 +0000
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
X-Inumbo-ID: 641d6208-5d3d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695822876;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+DJkNwNagVsyNt44UxymKEZSGYTYGBwzmWtJys5IXMc=;
  b=fLyCQTy7JYVxExZvXK9vnIKsYXCm5Q6PS2oqs1AMi/ovPGt4QVF6dVU0
   5x6ateTRfXAAhaf7g64k99QZ1vvjwGQQ9IKOo6nEmX2axpx5rlRtu0DQI
   U+7/Ug2Bur36nfU4LCjQ74DQbyd9+7ku3zjyvyPI4QDK3R8DorbuehSTf
   8=;
X-CSE-ConnectionGUID: 9ICtexG0RDaR+GjTNA81sw==
X-CSE-MsgGUID: oYjugZF3QVyZ4M+QTmXuRw==
X-IronPort-RemoteIP: 104.47.57.40
X-IronPort-MID: 122591016
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RkO4nK/VdOTcrMHQoOubDrUDWn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WNMWD2EMvnZYzT0ct8laIji/R8BupSGzNM2SgA6qig8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdmNKoU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkf1
 NcEJSAiNiqvjtj177CHbMA83988eZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilApuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WVwHKiANtMfFG+3vlbgkCc9EJIMSMHZwee4sCFj36jYc0Kf
 iT4/QJr98De7neDUtD4VgaQvH2AsxgTStdUVeY97WmlyKDZ/gKYDWgsVSNaZZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8f4j8YYWtsQLf9awYcN7fSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:fNKeLaF6X/vWoWGMpLqE68eALOsnbusQ8zAXPo5KOHtom62j5q
 aTdZEgvyMc5wxhO03I9erhBEDiexLhHPxOkOss1N6ZNWGMhILCFvAG0WKN+UyFJ8Q8zIJgPG
 VbHpSWxOeeMbGyt6jH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3ArPrZ82labxvgzCEA2C5H/ImbEt3XOSz852vdM2D?=
 =?us-ascii?q?gM0pgcv66S2O20fM9iNU7zg=3D=3D?=
X-Talos-MUID: 9a23:F1F6xAtWizkgHxmt282ngwBgKchazf+XNlE/zbBFgvWBBTFKJGLI
X-IronPort-AV: E=Sophos;i="6.03,181,1694750400"; 
   d="scan'208";a="122591016"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+gl3SKQkkRA+5c4s4EJC2RolY5xQqYc5opD0+SbIdk8SmfSIH+4k9BKqf1Q4JKLFz+enCInkE7IZrELx1K/6pD/Z8i1r0PLHL+Dv+9Vb9ib85IwbiVRLZXyWRwZ+c/75hzIdVJ7NxeO6+o8y0n1gMzJ/UuIIgfo59wmXcjWzIq8+pVDYM7DMULRogY2QHCgD5zQbwR9tOrjzsfsNsiI8nNB9xfKHkdwfhw+ERGHh8I3vdHn+1HZnSmAL7wp32/Jx+mimiaYKccF1NA734c3oMO2CCoF3Mq6T65GPQiR5FVVhAqQ2Bn5/unbFmQ6jdkbXcLZv7V0gVqOqEUQJGftQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDbyBJpiMd8kNmCykIwb2h2wZOzB8phmMsnkxLLAnUM=;
 b=dLwMNIcVhoM5D514kuuvnweMWjq0n9o6mZCVIkK0e65/TtV3dH27PWW0DwXoQ+v32etwOo3l8QXbVffCU2thzKOEMiq89CW3MEY7trxYKWzfjE66gJZ6X0mnOf8c68vak+mQ6gCMHs/dmwvkigwlnCesn6axBUGWfFX9W3bXEbpFOunJ4zdxk3AA8sjqOrDWql9uqNr9iJymkVdGdjG75BGIKxkgXPHLr5THzED/Mn6pmmcngJS1X2691zpvNO3T8yQnzXwNpsHZzvc35UG99BK+IJ2qabNum/5S4qKME9cElvrWgBqT8p3hE4XUZ79xLxPxlODRcSo003Lyccz+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDbyBJpiMd8kNmCykIwb2h2wZOzB8phmMsnkxLLAnUM=;
 b=tKIEF4VqHOCrse6HWWfPDJa7zZvacDDQZFnAw4CPkAqrOdlTxnScXBrx41+LYSzULSuKjjm6zh5xeHu9VDAsJR82Np9WI17R4x65TJ2/a/UBQHXNN955jcNXFR0wsY8s35GSqrf10AI88V+erWgYDBSwGXq3hZrdDn0Enqv4oj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 15:54:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRQ0C78jy5P2ghnn@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
 <ZRQNHyggOFD1FuMD@MacBookPdeRoger>
 <CABfawhkn1xXA+qEjB4-HtOVUZHONDE6ngMJZPe3fSPtoAtmg+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhkn1xXA+qEjB4-HtOVUZHONDE6ngMJZPe3fSPtoAtmg+Q@mail.gmail.com>
X-ClientProxiedBy: LO3P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e07ffc-2f60-482d-8e86-08dbbf61420b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pSEGMgzqmLS3BNq6t7F7kDFeN7ufRuxHos1qldReRHQyiWUk11gJTWiMaJmF+E/YwbUV2afJjqbZpiFvdsyC524EoXobU0kjrnPxM0tKgjLq/wx9CtVsZOho+fIlsvsxWq29cMXTTctPwj2N0JJsnlI7YhiwbnWw81gDW+QwOPfx6WwHbU/43EzPny0BTMRmn+6wfYS4Ig+Pp5vO1HwS/fhXAVZ1yTFKfNQ3jr6hAmJOn7gAK7Q4mhKLqzn9zX2jVfkromBnzQolNAgVCTDSYg68K9+4FNqQSMm+/XZnoDssOkKKsZAN733koXlec/NzSsVrQK6g234XJYvLO8P6wKC23H5GIP3Xcy6JGyFh2BywTPc0cNCFbgEAXM64BEaE3QYFAl29yrGY4PoaDLdyY34I20Z3xCC+bNJB+jtziYjQknu/1BoFlIaEdCmdoWmVuCRnWMbyW1nweByk7SxUtPAfuD9tu1PMIapfpKSipL/a9JLDB7041fOeNhRsr+796XjVgKwLruNHwfBDrQMEdYyqdOMcnu1qcYGwqE0LNQAzo6cAF2M83z4eUQwDdFzO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(2906002)(5660300002)(66476007)(54906003)(66556008)(33716001)(478600001)(6666004)(66899024)(6512007)(53546011)(9686003)(66946007)(6486002)(26005)(6506007)(6916009)(8936002)(316002)(83380400001)(4326008)(8676002)(41300700001)(85182001)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTJWK3RoMm5UT3hJU2dicGRYMk44NURwaVhlL3RSSVF0dW1hL2tKRGtPMk5v?=
 =?utf-8?B?OTdmL0NCOVdWUW5XNEQ2VEkxcmFTTy83ZW1rRnNLNWRTaW1EajJBTUpiSUJT?=
 =?utf-8?B?VjFvZk5YOWlSbG5UY0RFMFFhQ1BTTWI3ZlhKU0s4TFJINzJTYzY2NU9tWjh0?=
 =?utf-8?B?Vm5EZzIyblhOS0RqdzlyQk5RKy9Wb0s4OVJRS1l2emEzTGtNQm82VnN1VVVP?=
 =?utf-8?B?bS85K3RvQklwMWhYQ0tEK3VSQ21TWjRDTWZBYmM0NEJGZEhIZzBMZURiK2xt?=
 =?utf-8?B?QUwxUjdyWFE1dk5XTFNqcVJCZFpJOTJiT2tOc3pLK3pTNW5BSnE5RlpZd2Qv?=
 =?utf-8?B?NVBNMVBxdGs2YzFEam10QjZUbXVPcWVkRW5jR0pxekRweTRrVllBeklteFF6?=
 =?utf-8?B?dFh0dk5oVHNGMnRqUnpBVG9KY3ZHY1BaMStqVk9hM2xTVzh1N2tTbkVtSm5W?=
 =?utf-8?B?NGNzb0tIK1doZ25ac1ZVVUFaVWZDVEhLaUpVZ1J5WklrV3ZWVTFBTTJWUzlx?=
 =?utf-8?B?U3hZdTZQNWcxM0F2QWlaSTVlWXNCSlNsaFFNVG5oSmxEQWFvdHZTUkl0bFI3?=
 =?utf-8?B?MGZDbThvVFBkaHNleXlWcDBaZ0xjc3BWQkNwTFZSSHd0ak5PdnVqKzF1Y1hv?=
 =?utf-8?B?WEdOSmR4bm1VQmpWVEhjbThGNm1BRmhqakRHcEdFdTZtZXVMRzZSUGdDWjBX?=
 =?utf-8?B?NGpRRjhSd21wK2pLZi93Nm5EZHFSMGloT2FFVDlES2d3WGY1M0dYM3lGVkhY?=
 =?utf-8?B?OE9VOWpXRmtESFRjd3VBbnFKaUpHK2lBUUl0R1RtT3ZoYm0raHM0aDBZK0Zx?=
 =?utf-8?B?RkhtYXIyZ0lieXIvUHB2TmVESmlwUm9iS1hUdnMzdXJoTm80bDd5bDRsRElK?=
 =?utf-8?B?Z3NzRmF2UmdFN2s0cFV1VHRPdU9Db2x5Z0NIK1ZuUlBYL1AzdlJQTkp6UHpv?=
 =?utf-8?B?bXltQkdFQktNMHlSS1FxYjE1WnZOd2E5WFFTdG9LWmpyd3c2cm42WWJpcGtG?=
 =?utf-8?B?R2hMU3hOa1pLNWdTdUNhK1NiS2lZWDUwV0xsQVA0eUhBWldna1grWW1Zdkln?=
 =?utf-8?B?UjB3WXpkWG5zNTVzL2N4N0QrM0VjcHNvZVFML3BpM0djMEFrcnZGdkdDdVZy?=
 =?utf-8?B?a3pENFQ1MTE2eWNPeWpTTVdmUVE3SXFmcmNCaHhCMHJCbStBRUt0TndIMEt2?=
 =?utf-8?B?cVFqUTN0bVFzRWRXUWtpRjM3a09DR05MZldPSDVoWDQvUEw3d3ZpK3p5aEo5?=
 =?utf-8?B?NDNmR3N0eEZITVFLNjBxdjZ3eURRbXdkN2xrZE40VnRzMjdSQzlMRGs4TVdQ?=
 =?utf-8?B?NUlXMmFaejR5eHNFaG53NXFIcEIrMWFQRnNsTWJTZit2QzBtUlJEbzNxcS9k?=
 =?utf-8?B?Z0l3Nk41UXlzS2xnQnRSK2VVNVVPdEtQWWljakE0cm94T3RKUmtVUWxEaGdC?=
 =?utf-8?B?ZGlRV3g0enlNNDRwTTZzWWQxY2VScUowUEwzcVFjUkR0ajYrZVlGamVhc0ZF?=
 =?utf-8?B?ZWM5ZUNDMDV3L3FTZC9nbG1zNWJmam5FNW9vUm4xbm1ocXBtWk52dUFlTS94?=
 =?utf-8?B?azB5WFROVGdHek5CaUQrZmJLOG1keEhJcEJwRzE5VUJ4elBrUGNXZFplWjBx?=
 =?utf-8?B?UWFkVVMrakhjS0k4RlRkcE9mcHRjSGk5M2M0S1h3Wmp6VVFsK1k3OHhwVEY0?=
 =?utf-8?B?Y1ZmemtpQnM4eTQ1cUd5MVpsSE1NZHkzaEV6M3FXaVRkV3ZUYWVCTDJ0SVJa?=
 =?utf-8?B?UTNnc2JQTGhBWHZzV1hvaGs5U2xtS3huTlMzaHJjTHJEbEtKKzBNbSs0RkhX?=
 =?utf-8?B?Q1g1K3VIUUkva05iS1pXYVg5SWd1TWdpbVF1L3hsUk9WcmEzR243eExWN0RS?=
 =?utf-8?B?YWZyM1U0V2JKT2d2YkRWaUJxY1l2WE1IU0V0Sm1ZQW83aXhVZi92VWlEMm9V?=
 =?utf-8?B?aTJWZlVJVEJiVU9nYzRsTkd0VlRvdXMrZ3pQZnBxT0VDbG1VWUd6K3RWSGNm?=
 =?utf-8?B?enhPazRHNW5oQzQzdUE5aGJwcGZuZUNCSWpyQXJpSCtqbFdWTEJ4UFlBSWJH?=
 =?utf-8?B?QWNURWhQd0JrWjloRUhnZVdYOU85cGZsWUQrdzRuai9jaWZlWEtwUFkwRi9z?=
 =?utf-8?B?UzAvVHJ0WmpZMFRjRzNtNUhOSDRQM1NET2EvdzBBMDlIVGpxc3oya1djdVJ1?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EdeVoiMszbZZVlnJsdbpugld8r03ZLy6IhnjFXDw2BfioimTWz5EbSWTIjuyvVC7MaAoJ+fBqOY25fofdE36pXG7zzz4YTaAKBAqahKMYnPlAeKGI8/6iaevl8+3n5Lu3Bfucd/XEPrthCpbml8NhYqfkP6RNf3+QlVjEtqthg/+UTLDrxbtUwhmBQ+6T9XJI0laYaEQqPeftYT3OJuiAYhoql2p8VIDGPIiQhjjy1gAtDIv5qY6KiILOcKrCGFoOzNqydyUto3V9AzKqm5Qm3xogWhpbPKDCrbK2NZ3H9meWjnEqrUHrYkgLk317nxHLbzpzWlwobGkUZzfAuvJZukcqaIdLIZqpbJMT0KpfM9b3bw5nPcOD0mmGSYTLXtadHz1dLWLGFfH1yFDeS8P5GE0Y/ASdzfrb6PHwKkuvkBExLMQAqcPJp0IDrQuYsW/SuZ+wBypWGAKykUzLbq1rpUxhgNqjbDBDVZ4rpfLL/puSVHGwGV3Q39D+XrP4+w0bVA2y/aoRWu5PVyN2Ypgym1jXc9hPyIaRntGUOpBGPiE8k53J1XfXlO++JPiT5udPxDalF6NnrIB+iO3QojL4bvlYFrT+7Ui9gckPjBR/pBjJun3J4NiEttTnz2SY90S2TaBgBqvLK+fgpNHXNZJLF/oy7yR2yVL24urlLHwIbEGaM4VYawvuQaVZ7NRh/PsTPGzy1axB9y5h8aQ4xnIXxfnhN1Awuce9DivjC7znhcjaovmTerpANdBp2SQ+6bK9y0bGZyxE0qyWH8EtOEpIo8L3kaPZP2X+YNUsl2P6ZQk958o6ICtMnhsDwjSRCjic54EzgpKsG/Hxsz3Fo+qFNqJfVHfXrcve4izNOFb3pSz2vArYkTmHiGkFTRA8JkkPnMmM2M0VrR/mPHFXZj5Gg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e07ffc-2f60-482d-8e86-08dbbf61420b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:54:24.6607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddoFNKU3ZVRH3DckFpwU/rUtLJMJg4APYd1l1HZGg2vthW+lXWe4+ONpz5yGFQqXx8hhCucMkAdJv400msSDeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7485

On Wed, Sep 27, 2023 at 07:43:26AM -0400, Tamas K Lengyel wrote:
> On Wed, Sep 27, 2023 at 7:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, May 03, 2023 at 05:56:46PM +0200, Jan Beulich wrote:
> > > In preparation of the introduction of new vCPU operations allowing to
> > > register the respective areas (one of the two is x86-specific) by
> > > guest-physical address, add the necessary fork handling (with the
> > > backing function yet to be filled in).
> > >
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Given the very limited and specific usage of the current Xen forking
> > code, do we really need to bother about copying such areas?
> >
> > IOW: I doubt that not updating the runstate/time areas will make any
> > difference to the forking code ATM.
> 
> The current implementation of forking allows for fully functional VM
> forks to be setup, including launching the dm for them. The toolstack
> side hasn't been merged for that into Xen but that doesn't mean it's
> not available or used already. So any internal changes to Xen that
> create guest-states that could potentially be interacted with and
> relied on by a guest should get properly wired in for forking. So I'm
> happy Jan took the initiative here for wiring this up, even if the
> use-case seems niche.

But there are still some bits missing in Xen, seeing the comment in
copy_vcpu_settings().  If we don't copy the timers already then I'm
unsure whether copying the runstate/time shared areas is very
relevant.

> >
> > > ---
> > > v3: Extend comment.
> > >
> > > --- a/xen/arch/x86/mm/mem_sharing.c
> > > +++ b/xen/arch/x86/mm/mem_sharing.c
> > > @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
> > >      hvm_set_nonreg_state(cd_vcpu, &nrs);
> > >  }
> > >
> > > +static int copy_guest_area(struct guest_area *cd_area,
> > > +                           const struct guest_area *d_area,
> > > +                           struct vcpu *cd_vcpu,
> > > +                           const struct domain *d)
> > > +{
> > > +    mfn_t d_mfn, cd_mfn;
> > > +
> > > +    if ( !d_area->pg )
> > > +        return 0;
> > > +
> > > +    d_mfn = page_to_mfn(d_area->pg);
> > > +
> > > +    /* Allocate & map a page for the area if it hasn't been already. */
> > > +    if ( !cd_area->pg )
> > > +    {
> > > +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> > > +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> > > +        p2m_type_t p2mt;
> > > +        p2m_access_t p2ma;
> > > +        unsigned int offset;
> > > +        int ret;
> > > +
> > > +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> > > +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> > > +        {
> > > +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> > > +
> > > +            if ( !pg )
> > > +                return -ENOMEM;
> > > +
> > > +            cd_mfn = page_to_mfn(pg);
> > > +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> > > +
> > > +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> > > +                                 p2m->default_access, -1);
> > > +            if ( ret )
> > > +                return ret;
> > > +        }
> > > +        else if ( p2mt != p2m_ram_rw )
> > > +            return -EBUSY;
> >
> > Shouldn't the populate of the underlying gfn in the fork case
> > be done by map_guest_area itself?
> 
> Would seem more logical, I agree, but then the call should be
> map_guest_area first, which conditionally calls down into a
> mem_sharing_copy_guest_area if the domain is a fork.
> 
> >
> > What if a forked guest attempts to register a new runstate/time info
> > against an address not yet populated?
> 
> Unpopulated memory will get forked from the parent for all access
> paths currently in existence, including access to a forked VMs memory
> from dom0/dm and the various internal Xen access paths. If the memory
> range is not mapped in the parent registering on that range ought to
> fail by I assume existing checks that validate that the memory is
> present during registration.

What I'm trying to say is that map_guest_area() already has to deal
with forked guests, and hence the populating of the gfn shouldn't be
needed as map_guest_area() must know how to deal with such guest
anyway.

Thanks, Roger.

