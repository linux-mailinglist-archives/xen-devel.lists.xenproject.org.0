Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A515F0D84
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 16:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414264.658449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeH0E-000140-Vx; Fri, 30 Sep 2022 14:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414264.658449; Fri, 30 Sep 2022 14:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeH0E-00011k-T5; Fri, 30 Sep 2022 14:28:34 +0000
Received: by outflank-mailman (input) for mailman id 414264;
 Fri, 30 Sep 2022 14:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6brQ=2B=citrix.com=prvs=265c464c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oeH0D-00011e-NO
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 14:28:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26e916af-40cc-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 16:28:32 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 10:28:27 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6677.namprd03.prod.outlook.com (2603:10b6:510:a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 14:28:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 14:28:24 +0000
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
X-Inumbo-ID: 26e916af-40cc-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664548112;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yN8aX2w6ysv9gmyusSCXRZ8DxvHaYjoSo/jbbLk8qS4=;
  b=HiA+4RkYoi4jpDGbQAnjWYg/ewL/V4sZBXEKHV7WeLfGTc4SfBlUQsmN
   4z24+gNbMwGzJIKt9oWaab/BEw3lS6E6bqbMo+jXCOSxgnCrnQKHo9GSo
   A62VUZT0ANKWa6TE9FAljkbHDmlA+jUlXSTYV2YLRa2NB5yG/9I5QgH5q
   w=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 81704191
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TDaCMaIF9JurQFdOFE+RRJQlxSXFcZb7ZxGr2PjKsXjdYENSgzVVy
 TcYXziPP6yPYGGmKIx1a9m19htUvZ/Xx4U2TQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj42tA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fb9J071tB1hqz
 qQRczcqbSm4l/i60YvuH4GAhux7RCXqFKU2nyg5iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T/PVui4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWPaqi7117ancSXTSI1LF6/i5vpRvVCtlmohLgY7flCwmKzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neWm/v5CDopt6eaIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 TeOqyQvgqQJusQC3a674FPvjiqlo97CSQtdzg/aRH6/5wV1IousfZW16EPz5OxFao2eSzGpn
 HUCgdnY0+kIArmEjinLS+IIdIxF/N6AOTzYxFJqQZ8o8m30/2b5JN8JpjZjOE1uL8AIPyfzZ
 1Pesh9Q45kVO2a2aahwYMS6DMFCIbXcKOkJn8v8NrJmCqWdvifclM2yTSZ8B1zQrXU=
IronPort-HdrOrdr: A9a23:q8VeZK+nROn2tnuLlPtuk+E9db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlGl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFfJccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiT7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri+knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYd099RrBmc8a+d
 RVfY/hDK48SyLaU5mZhBgl/DWUZAV+Iv/cKXJy+vB80FBt7QNEJgUjtY8id0w7heMAoql/lp
 v525tT5c9zp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81704191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLoqPYdS9HvAqttfBdixfa/FGkRKO4GohRKI4hPA+sKCe0IhqqLJiSIrhCubsiSX7EgduTxC9JZNBjl++IgHxADM1IeY1KJMa/WhwS/oBnGx9/LLxaUNtaNt+RdNUutrZ/46+lYCxisgT3qxTTb1881zjtKgjNikVkToA33DAwx7Qbs5cSzfPH1rX4e009JLxKSd2feSk5DbpE4BjaswufLx/FckuxNlqBsf1uRmoVI5lQqB0t6APqZG1lYNRMpiOkoye9HhpijELgAcrZi0jQRhTDOEgHxdxINoC3WtzKfrQGpzkaFdpLhGjDETxvOst7ZtrJMd1YHD1EoRO2eyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwhTf2lz/q61mjjxjbo1LO93Bx7bYXQd6Hzs+E5lv/o=;
 b=NtyyJHlBr5NKSupaoRaYrD2678NL9RJtsn7ZHudC40PcndmXo4yXOGgRmgo02yjUUdEyE1qXcQnB6PK1G2IA8Srm/MzytUxw0hWxYZ+nx+t2SaVcK8p0NTFe1AH+dyi9KtUjyyOFPM2nEARyCN6I9VlW61TABP2VSHRRD+RUcowcrEUMOPiilzPj7f8QPSxUyAgME5YpT6SZHqiFPznbBnSkBrrx4RSo66A+6dAE6SXidejtYe7QFBDHn2jVM9Wy65ovzYTLYw5/l1RDYyXW5DHknWtp1cP61JQOQBvEp24l2EDVaDhBTRTBUSKZKjG4pt9t6LIfrY68DyHhR8Z4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwhTf2lz/q61mjjxjbo1LO93Bx7bYXQd6Hzs+E5lv/o=;
 b=w5TmR9HmZmaqc3cuf67XopjZpu/Xys8ynmiZqLB4APJBT15qHtmvozgiFjUpYxAK3dfQwOCducqBU/MKsI1A9v6ee1KC2r/4sqPfc/AIDTNq1WOGFbw4dbV6lpjSLVMgVGhD/EEgS9BPRNaQCkjHi54tPm794KnVYE5yS++V2jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Sep 2022 16:28:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
X-ClientProxiedBy: LO4P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 60782ad2-fba1-49fc-8921-08daa2f008a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eG0y9hnBU8B/JBeniYurLiIQKKOuNTuDmUeiDxmV0EyoDiSuXYk2fhNFJVTN3bflFUbAYZbE/ndnKEaNzmyscJdUzsgVslO7xZ5a+MsarnfiV+TJgHFgeLIi5+vN+UpR1YhpgtEDDtWvT2syZR5X0WtIKL05PP1LCOtKXECvRXDL3jJhxGMT331CfjdDkY7qrtArLdW9ilgF4kkxolEeJ0nlpL64d7NwVstRZmPYfL1BvigZv3go7Kb4ihERhPfuEzyXR4LPbAEWm4Ag+Wb0hL2KlRf6rNK6x1PsaRyt14kTQlCeb4zLrFVqj+wy5mMvCI24YN+GccFBmXoaI5O/tofljiEiDeTfdqiZWNNKGpGE7gX4DapxNtH4EJuV+03OM/P5FPol6q2pb+Am4Fxni0cUX4dC27ui1obwgHyXS17sLQE2baR+sPMoa5N/4xOS+t9pqGKTFgMlOpI6DOFzTbVsIjHIvYNBngUbGkqJQ+KneN0xUU3uEPCuQq0zGZVBY+zV9aNUkAxeHQMftBkQydZYE5WG88vwYyo/wUdRC4fWEgUF4BHj9P/7E9OsGkY4NwrhWSczULuBPwZ6zbOV6zrcmCCMnT/iqEsHCrEn/UAtX6Hk0Nx/1bdnQkWGgRDmUkL6PzkyC8r7swhg/XTS01EWU+aJImVqMVuK4rrKDbwhHiaGVqrQrQDvfKq+GVy7JLx2hEHExEwVCYC+i/yRcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(82960400001)(186003)(6916009)(316002)(66556008)(54906003)(9686003)(26005)(5660300002)(6512007)(6666004)(4326008)(66476007)(6506007)(66946007)(85182001)(2906002)(8936002)(8676002)(41300700001)(4744005)(38100700002)(6486002)(478600001)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0hWNFBJS1pod2l0VUdxVm5ZQ0xRWHpkaWtSM1p3WDYrQ1h0Ymg0U2d6M2FS?=
 =?utf-8?B?LzF1RDE1ZEVjY2pEK0wyYkZCOElqUEtPdjFMS0hmNi9RWGV5M1M4Nm11dFhH?=
 =?utf-8?B?dWo3TkhQT25VYjlTZWNSUmE4V3U2TWpJcUh3djdKQVVQT2hPbWVqNzhjbjRL?=
 =?utf-8?B?OW8zbEdsanNSckdCdHYwVzhQMGg5UjVuT3ZBUmZRUUhMeVUzRUppbEk3K0Mw?=
 =?utf-8?B?WHZiSG9ib1dyQytaeEd3ejFRSDhPYlJVM2RLc1hsVjI5TEVISzZMdnlPWXJp?=
 =?utf-8?B?VXp4K2NwVDNwMEVmZlBxcEd2WG9vc1liRjcwYUM0N2l6UmJXTUx3d25kNTBT?=
 =?utf-8?B?dzJmSXNNbFBEZEFwNXV4dEpjNFVRME4zb1VTZW4rMUpHVEZGbFVUeEMrdlU5?=
 =?utf-8?B?b2VHNi8rWFJXOEpDWHJZV2MyK2dDei9yeHhvRStyZ2VUNnNxbDFra3dNMk1C?=
 =?utf-8?B?Y0drcXZmYXlaT21TQ0t5TjdBdXhkeUlsL1FFSzNmb2JodW1NUDhtTDFwd2VH?=
 =?utf-8?B?R0VoNnV6QmduYXNaYU8wNWdDaGVFZTBNNnNVUTFEWmVDU1lBRlgzVzJ5UkRq?=
 =?utf-8?B?ejNKZTR2Um44MFhjM0VvMmlJSlFrM2h6K01VOG9pcjM3Skd3SVdhY1hhYWJv?=
 =?utf-8?B?TmFOOXFWbjJwUUZGSTVuYzBmNVdIbUlZeXVlcnJpWldGQWhwY0JQZG1kMGw3?=
 =?utf-8?B?ZDlNdnNNcWdVZlkrdWllMGt3aHZmUm53ckd0bS93MTFvcUZsN0pGaHFrK2VP?=
 =?utf-8?B?V0w2RXRCZUVZQ1ByUHFKNmZ5eWluZXJRMFFVWHJRUW1uZ1NhV2w3STBkWmV5?=
 =?utf-8?B?Q2ZBZTlpUEIwUVlWdHZHYTcwcU02REZXYzJ0dnZqS1JtNXVkTWtnU0hkcmQ3?=
 =?utf-8?B?bkhrVDZlZURQRmFwUnhCZ2srRkVMRGYyalRnRDI3RWVKTkN6N2xFK0JEUHJo?=
 =?utf-8?B?NWN6VlVUNjJrcmpxK21VZmVFbEJ1TDYxU3FRS1oxaG9vL0Q4dGlHTWltZVVC?=
 =?utf-8?B?ZUNHc2xVcENITjlhZmtoVzBuVC9Cb3ppZW1ITjVkUzBZOWJkdTY5YXI2dmtz?=
 =?utf-8?B?NGt2bjNQdXpxdC9EZ0dST2dKbnJ2K3JWYXVUaFZVR29rYTVsYXF1VGZQbE1I?=
 =?utf-8?B?cWVpVnJUdDNheUloV25OSU1qTEl5Q1UwSklIRTZzMlZTTnlSTWJJRW83Y0xV?=
 =?utf-8?B?RkF0UTZqMmpETGVSSzcxWWF1dGhhcFZXUzR2OWNndUQ5aVBsdWI1SThZKzlr?=
 =?utf-8?B?Ym5JcXRRelhpQ0ZveDdiemtBMDRNbjJVMXNvMmxYOTh5ZnluRmFDVTNDcHkz?=
 =?utf-8?B?TVl0VmYrTkRGdHNPcktpOEJKTVRlTE5LWmlSbnpzcXFOUUJETEc3eEZYQ0l5?=
 =?utf-8?B?V1lLcjZGWk96Z1B5S2hBRmFRVVZOOGY0cnJ6djZ6RUVpK1FpRzVTdjZSU0FO?=
 =?utf-8?B?a09uQ2hSZXljdWtwc0NzLytzQWZHQncyR0luOXpNdURjanltRFAxRFF1M1RJ?=
 =?utf-8?B?ckVGMlUweThQTEV3VTRkajMwaE1jZHUwSVRPamVuRTRSVnZ5SmJZSGxtR1BZ?=
 =?utf-8?B?cWdsLzVmUTRXbmJ3YUxKYUljdnBLdksySjBKYm9mSmQraUFydlQyak1sYm9J?=
 =?utf-8?B?L0praFl5L3lreHB2RmNCeFRob2t3SldYWUw0bi9vT0pzYXJ6RWNtaVR2dVdV?=
 =?utf-8?B?U3J6aFZNekdSTjhFRmpXVE1aRHlkQXIwRlgzVzI0L2pYbEpxZlljUVJ2R3I0?=
 =?utf-8?B?TWo5R1RXazZhbnZQUzMwYS9NbnJkZ1hsSS9zVUV3azB1ZU1maU41NHlFamdQ?=
 =?utf-8?B?U2xXcUV4NGRPRGRnQkY3NEhVejQycHJyOEpRcURlc3hhZFNEbEtnKzg5UlNu?=
 =?utf-8?B?Nmhpa3IzaitrWXlqc25UbjRFc0pIbjZOaUR6M3U5KzlrbE9lcVNYTk8ranJY?=
 =?utf-8?B?RG1zY3N2TDdneXdSTmpQN1JRVUl5c0ZpK1J4QzBXdlNLN1E0Q1gzSU90TzJs?=
 =?utf-8?B?VDB0WEZVcGJaQXFmYUJEOTRDV3AyaUo2eWpnSCs2cFhqNDFQS21BdTRJNFgz?=
 =?utf-8?B?clQ0NHdwOE5vRlh6V1oyQTY0R1RhdTlmaUh1dWZqU3U1c2hhT3hMNWN0U2JJ?=
 =?utf-8?B?UlBKNTBMRXlnNGRqYUM4Q2M4ZU1ERjJYQnk0SG5ra3JXNS8rTHBFcmpGOExR?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60782ad2-fba1-49fc-8921-08daa2f008a7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 14:28:24.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkSILGrbc9jS4unwl+2Sar2Ns7D2uGWy+6bi1ofAMxDwqEp5cnc5YcdbGvtWPsn0N/M/aWzC3fjEXsrDqT6LFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6677

On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> higher priority than the type of the range. To avoid accessing memory at
> runtime which was re-used for other purposes, make
> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> E820_ACPI memory there and hence that type's handling can be left alone.

What about dom0?  Should it be translated to E820_RESERVED so that
dom0 doesn't try to use it either?  I guess using E820_RESERVED
could also confuse dom0 about ACPI data placement.

Thanks, Roger.

