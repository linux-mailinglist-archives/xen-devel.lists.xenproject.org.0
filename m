Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F97D8570
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 17:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623862.972122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1rS-0000DA-Ka; Thu, 26 Oct 2023 15:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623862.972122; Thu, 26 Oct 2023 15:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1rS-0000BU-Ha; Thu, 26 Oct 2023 15:01:26 +0000
Received: by outflank-mailman (input) for mailman id 623862;
 Thu, 26 Oct 2023 15:01:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qw1rR-0000BO-Mi
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 15:01:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8616686b-7410-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 17:01:23 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 11:01:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5705.namprd03.prod.outlook.com (2603:10b6:806:11a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 26 Oct
 2023 15:01:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 15:01:17 +0000
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
X-Inumbo-ID: 8616686b-7410-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698332482;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bhiBSiZ8ANQUMSQ2n9opVzW8IMkCJu4LWO+QZ+GGAkk=;
  b=dBPeJmz6IegVed2EsJVx+utj0NKC8TWK+dtk7ibYRNHeaBFwvYBbO/87
   oqxMrZXPBbRPyafneR6a+3sau1Jtakt3JmNmjbJdV140bGWpn90mVdCeo
   2zzFAYBUs5ntb8ciQ+2/XGuL9Pfgjhd0/kcWQibZj2uawrsXdWxqVCnRm
   M=;
X-CSE-ConnectionGUID: PIZmUUAuSSuPMi1wmJU7zg==
X-CSE-MsgGUID: y7Km290YQQ6woHKlkv8e6A==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 126607275
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:/iKJgKvZz3+V8MuibxNjZOf6w+fnVG5fMUV32f8akzHdYApBsoF/q
 tZmKW3XOfmPYmXzet9wao7k9UoDvJLWnNNkQVBt+3hkEilH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeEySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEBE/ay2+rv+N+6+Db+g1mcEBEZb5M9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtxMTOLiqaMCbFu71zMwDUdHDWqCmKemjW6dX9FBe
 0FK0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufB2FCVDdOadUqvcwxWBQj0
 1PPlNTsbRRwtJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7jbNDi8cOjvy/5Qqe3WLqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:8SkKQa2ITWXXxllH3Q5wfwqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:hjetymHZI5QOL4g1qmJf1XwRJ/0Mb0bm0U/1IhanDERUF6+aHAo=
X-Talos-MUID: 9a23:34zh2AV8tPeKwtjq/C6zpzQ4ZZ9Z2p3wF0ctspEFpZmJawUlbg==
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="126607275"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PROMREl+ZdSwjah8lDvL0ytiNFw0pQqEc+DIjBy+yyuQNMQ4ZWQhGpoPeaRk6V3RdA/7ia+Vs2PvHMzq73jAivGirsJ3qr24/9lohMtmUs7iyh7h7g5/zPys5YDh2pKpOkTWfvpaTP9b2hrHvz5IX8DRloTziDfw3vS+Bz/sCoVNQwME7EDyGczMMd6FByY2eMdKcn242iQVNztCeGAQ0sQRcss5LL+QxG1bw/Lemx86HwYScH/CCNv3WHQU8sPudo59LWTrTCM1laPkjU8y2CRUSnwfljY6ifaTOroAHPJSI5bf5WHsWiv+a7WLPIdOcd4S6x2W2iEr8g3Ppd76wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IpCgNH5RqMHZohsvHgkSJbO0lIuThLj+MyHfzmm2Gg=;
 b=ZKCvwFMwDNRKXksxpZHgKxYSdx75TX4AyRhKsVvVByzwoKeRbjujJ8bqcUNhh+kVDIt7mowyg/IQjDsuwcfBmCXgh7criKONTUWeQ+pJcW33ynQjtEWWaAMqB9RWyD0DbP51SvAsIyq8fVFMN/XmSCPo6vHVMm0TAiISYisuOcp7GL/gYIOoKG24/8ui+d7i27U+3LGHULN06eE7SwAZKdGHlqZJ5e0iaQWapbiCjaOmp1oKOlehNVyI4NQuh5LV02SUNZO0BXGoW8qLl6g/3adSsinv/Css4gf3HywGRLFEVjyT/cMSCfbGEfxAK2ES4snd4WoI5xf1QuwUbwuILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IpCgNH5RqMHZohsvHgkSJbO0lIuThLj+MyHfzmm2Gg=;
 b=YemC4F5e25nn2QH4AbsFPcd4Mn4PYQuSefbzItXXk5yxFArHNV1Sno4Cj7EqjwdalYgzEugGuG2orIHJh2+x+jw7+W8Owr43iHIN7+g00GmDM6zDZfQ2Kz/mZ0Xasy++pHXHx2DbwZoYQlVWq2S8J/goizhvDg3YnSAYqCsPPA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 17:01:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Message-ID: <ZTp_OW0wgdC5U6Qd@macbook>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
 <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
 <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
 <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
 <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
 <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
 <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
X-ClientProxiedBy: LO4P123CA0619.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 5037227a-a2a0-4766-c225-08dbd63467b8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ihKjb1Rs1gILsGFhQRlKVaDVn5iKTHsT/N1ph6aU6KO+o7t+wLVhJbzCLM0Yg7qVMxfwX+nmR2x4y8ucFQsAurNvEkGlpH0XRPuc1hjz4XQq+4a9F+ju8G5uvHDvRxltHmXs+GazAmLUlvFJuDtomslSNCMsTXVyrRfRHi0FuWnaaYCkHc+aWPXvvsHPUoGuFyApTjoIhJP2ZdvtcQm8yEgcFqPs5zPSnSoGXSUOqqRDoCpCtIyH8vsDhJaPpQhYe+sqWQCUQh7nRhgMQ0G6XWlVwHRXeEIWj9KBqh/aLN1lAslVJ6mvE2SLhDaGOh77xnr4SBt9whO3DKJ9aPRru/MHlhdG6VvE1f/L3foKU14IFKLHks+rxHxxkdJLAcixa7IrAVXHHtVXYiCW5r007/iW5HVqYZwGCuYCimw4pqImYSXMZfBKi6naLEC1MeCCQKtarMw4ROkcr5IFxb+SILrtsFI8GGP7HiR/3s3V8oiFgL5BscnHtrLAIiMUCbr9zgwd0E3GUfSengqPrNWYzhnBX1SRQzbiaf8Jsgh5UVhkq+XuniF25iFFf7BaRUVl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(346002)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(5660300002)(66899024)(6666004)(66946007)(66556008)(8936002)(6916009)(54906003)(316002)(6486002)(478600001)(66476007)(38100700002)(4326008)(41300700001)(86362001)(85182001)(53546011)(26005)(8676002)(83380400001)(82960400001)(6512007)(6506007)(9686003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXZIUFFNdkZDUGRmczVGREp6WnVkc2xHb0xXK1VIelg4Q00vYUx6eTk2b1N6?=
 =?utf-8?B?VThicjA5TWgxVE5NSmR6UVlzQVlMSUNjZzVHbE96VmZId0p5V0J4QndCRDBG?=
 =?utf-8?B?TzhxaEFHTTRmcDhuZ0VGNVZXTWpFZHRZdCt4K2w0Rmw5WVNzL090Q1NXU0dW?=
 =?utf-8?B?Vk53MHJDVWhSOXc2N0JWem5LZW1uRFpOcEJ0VEpSM1dmeEt4RTNJREFlcmhx?=
 =?utf-8?B?TmsyVUFUQ3M5YnV6bXlwZm1nSEZqem9DNmQ0MmNXY2NQeXVqN1VKVVN3ZmhY?=
 =?utf-8?B?aEdPKzJEN3YzQzJkc2czbTE1NDNZWTJOaTg2OHRNRUhnWHBOY3dyeE5Gdnhp?=
 =?utf-8?B?ekl4L1ZFSmVSZVVLcWlDUi9VMUNRRWRlSGo1K1lDTWkzQmJtQlE1ZElXOG12?=
 =?utf-8?B?MDhMNVY2amxyUC85S0J3YmczNE5WZGdIR2ZMSk1PRHhxTEFkQURhS1pjejNj?=
 =?utf-8?B?bGZlSkIxeHlSUHFNSno4ZlBBTC92RmVLZnFOdkZSNVBISTBHay9QYkhZdG11?=
 =?utf-8?B?UVlGdkt4TVB4eXZidDM0SGpJOHBwbmVtRlpGS0tQREFzeGxrQitVcENTNUVy?=
 =?utf-8?B?SDZtZEI4KzIyVXpCVzJmVThKZHFUZEJYa2VTNmt6UjQ3aEN6bENOaVhUMWQv?=
 =?utf-8?B?VG1wQlFYVWwzSE8yaHJUZU5BcVc2dVJLOXFHaXYvaGF4ZGR5V1RUUS9CMXZk?=
 =?utf-8?B?QjY2ZkV2R0t5R0FBM1IveU1TbXpNeHI3WkxwM2FTUWJYMklhMVQrM0tRbnBX?=
 =?utf-8?B?UTQyS0tTYk1CZDd5NGhIaTJrYTlJR1FRQXh4NURIelBEMjVQMVNVa0M3T0NM?=
 =?utf-8?B?bElDQmJMTFFZRjhSWmxvVkxqTC85dEdEd25MaUtrM0x4WEdpWE9VeUhrczE1?=
 =?utf-8?B?ZVFZNG5xOG1ZWlo3Q0RPQkJhcDlnVlh6b3FkN3BhS1hMUGRQYWNnZHp2ZTRL?=
 =?utf-8?B?MlVUY1NpenJ3OFFzcks0clRxdHg5dXdHUU9ZS1RMRk1VZksyZytFNndpS3Bi?=
 =?utf-8?B?emNkeVJMQy9mdjlOdzRBcU13V1NkRnNGZWxhWTdHcTBnbEVxZFJ0TWkxck5O?=
 =?utf-8?B?YWUzL3RwM1EydVZOOTJWU2R1NmRHSzd3d1Q4RDM2TlBlOGdRZGd6UGFUekJB?=
 =?utf-8?B?d29FWWU4VUZEbTFRSzFhbXBMTmozNWpCTm1SVGhmZEpnU0pYdlNvUHJYRlRw?=
 =?utf-8?B?T3NPTHVPMGJzZG9aL2VnekVpZzBJdS8yUUl6aUNGaGtMTklGVXo5T1hWRFF1?=
 =?utf-8?B?SmVQV3ZhMVREbjZYa3BhQy9tYjZwenFkM0F3Q2FOZkprQmlkN0NuMUxicVB4?=
 =?utf-8?B?MmxHWVlnbjM5QXdoMU1ld0xtSTJUeDRkYTViR1QvSmU0N0gwenBnOHAxVDJQ?=
 =?utf-8?B?blFqWlltSlJHRzN6aW4vY0NmTGoydXk3ZWYzek1jRDNjdGtZNVZnU2JteTdy?=
 =?utf-8?B?WUJMY2U4ZHN6Q3g0RWdKVTU1M3ZMajZMZnRRdlVVeHJTbjFHcmNYaTRQY3BS?=
 =?utf-8?B?ZHcyV0Q0NEhiWU1MQWlQNVBxOVVub1NoU09UaHlPQ09LVlhVSlhWWG9CYzNL?=
 =?utf-8?B?NjVvR2NLMDhFeFFIR1gxbEVRZjFWUktLUVdiU3FaamczUlYzMmhGQmJOWEV4?=
 =?utf-8?B?VDB5cjR0am81Y1h0Q1JPT2JwMGIwbEQzWDBKSElRSzVoRCs2aC9zZmlnbzg4?=
 =?utf-8?B?aWpKZHc2RVhHcnVSb0NQV210SmJ4RkMvWmd4cTl4NVU5ZTYyUjQxck81Y05M?=
 =?utf-8?B?SlkzeWZEZHE1RXd4SUxIUW9NVWRiQUxkNVZUSkhZN1owTWFZcmNsRFlSakRU?=
 =?utf-8?B?Z2FzS01lZXY4dHNhamR1Z0xKQVAvakFNMFJveHloMmdKQUdKU2ptRDQ5ZEZi?=
 =?utf-8?B?bGpKSmVYa3JEN3F6dXU4c2RVSFo0QjdtUXFaTkRjSFR3K1VGVnB3QkF6THU4?=
 =?utf-8?B?RFVPN3p2NXh0ZHFRL0tvRHpYMjVJem5LeUJqc2QwWWdKOTltUG1JVGFhMnc3?=
 =?utf-8?B?Y0ZuMnF4VGxjQXA4UWZKZEtHVHdMZVcrV2FDeitKUG5xYUFqckNQUjh6V09a?=
 =?utf-8?B?QUZWcm9zdFoyaEFkcnh3bGpXWUJHaDIyajBaa3RJazNOUjdEOFZZZ1p4aGIw?=
 =?utf-8?B?WGtiZklqYUIwdFg0Z3hZVG1IM2dFM01PNFpiQW4wUlA4cUJHNmJIbXpPVzZW?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LZRuZAZoHlq1doSZFHbBrjVhyyiyiDlvId/yaebjuNpiNudZyWz80U6NFrE88M0tALIWMSAhw8dkaGPY3kD6zJ8jQt4iXdNYePfMuYJ8ZRgqYYRhnL5NAmZzdFsO/L7BvvfMVWjA1CCBdohM31LY4RN2OpQrs9uVHQj5rBmuayXjK7K202W4DRW4sJP5r1Y2UxDL5HVJNswE8scaP5KrRH1uXbhAAg/yLgO2EdFB9Q0hO5em70fmX2jqZIy8ekOfY5EU2iMA6HIJTXKKQlAEkFs+IlMjfYYnUi3U+wCmAu67hjHnb9qvJwRkaJhdQ+7wJuiZDEnSyom2gSfiJoMq51FS/urGZjtBg13dWh9AS+g0oLrpfHu3FHfo0cMtCtlVzmX6kU3Or3a2MnpCakQGT5tlW91cn61U2LXQYbJYWUpWXUUHT6lxxdnYr98fGiXICfnGqBg/i8bvix6oYdFRmdqJ8e2O8qZ7rmoveELzNfP/0HG+R44l13etWRpEyjptaX8xR+GwLEN0DlKqWgDqg+NFJqLcMnI5j8FhhFcII+OErMgdt4/VaoeD8GAy+14cyAcRrKYu8aOLzzqdGi0gW7/cJs4QOD7Q2qq6NsVpoN+T5XDKzhdnocfBHDWbqfcpneetpcZjqYP60XmAL9lUHbKs1Khclryh9vlNe0J4mNIwMaekDl3huqjtXKWb4Dq3Ntyyq0gplBs59O7mDdTqEBr9REd1e4EusnHNzitHalTxYMN/yWkVNFhT3PMlYL3VTw8m+j+agjcS9yRcgBhoqwwYKAs+Z6US2++VkHzX5OZd4G2iaEUfIuU3qudkvukSn/sSbBhqDYmZCXXok5pGneGCcadKEm2lnryA/qhyE3o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5037227a-a2a0-4766-c225-08dbd63467b8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:01:17.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnbiLslqPuzQxPiaC79M3FJlxbfG9BCVEAi3lzaUfl1IIb8NPgKPuNnWtBY1MFrkZXKJQmDfMX1kIHE1h1gueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5705

On Thu, Oct 26, 2023 at 04:55:36PM +0200, Jan Beulich wrote:
> On 26.10.2023 15:58, Xenia Ragiadakou wrote:
> > 
> > On 26/10/23 15:37, Jan Beulich wrote:
> >> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
> >>>
> >>>
> >>> On 26/10/23 14:51, Jan Beulich wrote:
> >>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
> >>>>> On 26/10/23 11:45, Jan Beulich wrote:
> >>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
> >>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
> >>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
> >>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
> >>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
> >>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
> >>>>>>>>>              if ( end <= kernel_start || start >= kernel_end )
> >>>>>>>>>                  ; /* No overlap, nothing to do. */
> >>>>>>>>>              /* Deal with the kernel already being loaded in the region. */
> >>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
> >>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
> >>>>>>>> What meaning has the sum of the start and end of either range? I can't
> >>>>>>>> figure how comparing those two values will be generally correct / useful.
> >>>>>>>> If the partial-overlap case needs handling in the first place, I think
> >>>>>>>> new conditionals need adding (and the existing one needs constraining to
> >>>>>>>> "kernel range fully contained") to use
> >>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
> >>>>>>>>       if the kernel range is fully contained,
> >>>>>>>> - the tail of the range when the overlap is at the start,
> >>>>>>>> - the head of the range when the overlap is at the end.
> >>>>>>> Yes it is not quite straight forward to understand and is based on the
> >>>>>>> assumption that end > kernel_start and start < kernel_end, due to
> >>>>>>> the first condition failing.
> >>>>>>>
> >>>>>>> Both cases:
> >>>>>>> (start < kernel_start && end < kernel_end) and
> >>>>>>> (kernel_start - start > end - kernel_end)
> >>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
> >>>>>>>
> >>>>>>> And both the cases:
> >>>>>>> (start > kernel_start && end > kernel_end) and
> >>>>>>> (end - kernel_end > kernel_start - start)
> >>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
> >>>>>>>
> >>>>>>> ... unless of course I miss a case
> >>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
> >>>>>> original expression and your replacement are identical anyway. But
> >>>>>> overflow needs to be taken into consideration, and hence there is a
> >>>>>> (theoretical only at this point) risk with the replacement expression
> >>>>>> as well. As a result I still think that ...
> >>>>>>
> >>>>>>>> That said, in the "kernel range fully contained" case it may want
> >>>>>>>> considering to use the tail range if it is large enough, rather than
> >>>>>>>> the larger of the two ranges. In fact when switching to that model, we
> >>>>>>>> ought to be able to get away with one less conditional, as then the
> >>>>>>>> "kernel range fully contained" case doesn't need treating specially.
> >>>>>> ... this alternative approach may want considering (provided we need
> >>>>>> to make a change in the first place, which I continue to be
> >>>>>> unconvinced of).
> >>>>> Hmm, I see your point regarding the overflow.
> >>>>> Given that start < kernel_end and end > kernel_start, this could
> >>>>> be resolved by changing the above condition into:
> >>>>> if ( kernel_end - start > end - kernel_start )
> >>>>>
> >>>>> Would that work for you?
> >>>>
> >>>> That would look quite a bit more natural, yes. But I don't think it covers
> >>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
> >>>> If we consider kernel range crossing E820 region boundaries, we also need
> >>>> to take that possibility into account, I think.
> >>>
> >>> You are right, this case is not handled and can lead to either of the
> >>> issues mentioned in commit message.
> >>> Maybe we should check whether end > start before proceeding with
> >>> checking the size.
> >>
> >> It looks like it all boils down to the alternative I did sketch out.
> > 
> > I 'm not sure I fully understood the alternative.
> > Do you mean sth in the lines below?
> > 
> >           if ( end <= kernel_start || start >= kernel_end )
> >               ; /* No overlap, nothing to do. */
> >           /* Deal with the kernel already being loaded in the region. */
> > -        else if ( kernel_start - start > end - kernel_end )
> > +        else if ( start < kernel_start && end > kernel_end ) {
> > +            if ( kernel_start - start > end - kernel_end )
> > +                end = kernel_start;
> > +            else
> > +                start = kernel_end;
> > +        }
> > +        else if ( start < kernel_start )
> >               end = kernel_start;
> > -        else
> > +        else if ( end > kernel_end )
> >               start = kernel_end;
> > +        else
> > +            continue;
> > 
> >           if ( end - start >= size )
> >               return start;
> 
> Not exactly, no, because this still takes the size into account only
> in this final if().
> 
> > You wouldn't like to consider this approach?
> 
> I'm happy to consider any other approach. Just that ...
> 
> >           if ( end <= kernel_start || start >= kernel_end )
> >               ; /* No overlap, nothing to do. */
> >           /* Deal with the kernel already being loaded in the region. */
> > -        else if ( kernel_start - start > end - kernel_end )
> > +        else if ( kernel_end - start > end - kernel_start )
> >               end = kernel_start;
> >           else
> >               start = kernel_end;
> > 
> > -        if ( end - start >= size )
> > +        if ( end > start && end - start >= size )
> >               return start;
> >       }
> 
> ... I'm afraid this doesn't deal well with the specific case I was
> mentioning: If the E820 region is fully contained in the kernel range,
> it looks to me as if this approach would ignore the E820 altogether,
> since you either move end ahead of start or start past end then. Both
> head and tail regions may be large enough in this case, and if this
> was the only region above 1M, there'd be no other space to fall back
> to.

I think the only sane option and more robust if we have to start
supporting kernels with a set of scattered program headers physical
addresses is to populate a rangeset with all the RAM ranges,
subtract all memory used by the kernel and then find a suitable
region for the metadata.

Roger.

