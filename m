Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F356D9774
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 14:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518893.805881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkP9Q-0007tN-8l; Thu, 06 Apr 2023 12:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518893.805881; Thu, 06 Apr 2023 12:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkP9Q-0007qb-5G; Thu, 06 Apr 2023 12:55:40 +0000
Received: by outflank-mailman (input) for mailman id 518893;
 Thu, 06 Apr 2023 12:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkP9P-0007qV-Cf
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 12:55:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52aa5002-d47a-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 14:55:37 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 08:55:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6055.namprd03.prod.outlook.com (2603:10b6:208:31b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 12:55:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 12:55:31 +0000
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
X-Inumbo-ID: 52aa5002-d47a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680785737;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f0e7cYEDAEpcNAwlYi35VuHziRZ/GApB1egynoWXhLI=;
  b=JpWNA7JuCchMq+xDqoaiTaPh/Rw43ySfeJqR2l0IzUYDHN6dsu82MEI9
   veddTKGXveBx/j2mzjt+o+XxiWtKUA9AQlVIZpVpktjndYsZ/q9B8tLN9
   SpWZKHlmTyvr0Nvnl0MS2mTRgOZGQ2nvX54vN2fXbPChNTIKCdbdjGG1E
   g=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 104589109
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RVZPYqCNr+ZYZxVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApG521WRVy
 TFNC2+DOv2Ma2XzcookbYW2/BxU68TTnIU1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwqqFSWmdh8
 NchKzVRNg2OrfCTkYKnY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwX6rCdtKRdVU8NZFkEWR6EFLEiYXXGepm9eX1nCTQ+l2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1V5dDm+ds3lkiWEY8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:Os7Ei6sch0mc3oz00g0C2zYP7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104589109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUl88M0CGOehIOeLZBqa0+8IhsJFsbvuaoMkk4f6wSIj/pI+CEqsiG3nCdrScsxSJr1g1Ma7rLhNeOvQ3L4zIIawx7aPnbwgiyOuM3n5OvDkM7nhFyLh7TOepL8F4/BjSKT/b+dEBWTQLztdoqBbX8u/Nawlo6StY0TzIoR/e+dgIbTCOCJoWaBL8Gqho4fbrddMh3BxlnvL3DpKJAwcqzk6t3dSgCkBvjxUn2kiOfQQWqhExrp5v6XlwYTiOaXuT1sXsdhvkPkWfs2UqWef793HiQdT6ttP/rq6D6ESQ5b465ChkfSKCvM8/qufgV9qvqFyVRFwqLntsfeZisPttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD9k4AldTQrQV43R4LFqH4lhnBEpEDFokua341KF7u8=;
 b=XF+9+XqB50Z/+jemjJeTYFhUDENUX8smR8S8FXqMHa60qtf6nnow/zUU6yWLDLXUDjQ5NPmxE9ushx+NJuD1yAxO1lCjpGDSLjT4UYbW0g1ZL78PynIPFlOJgHRSXZ2oHrasA2lCj8aL3nO9e2+j3nvXwjQcJP9j70KDGIO+Vc+7J7RuLeTruGMdPzjnGRoi4ZGpDd8ds3WWlq/OQzZOEME4CSD1N3T7vemQJeDQ6vvPBcRCybIJhkBmOo46ZoXjzwbIjh0a76HjODTd64dQrQRBySB9G5j6ccSwDLYRLnBtzVc6djceF9gLV14Fpt+dCheBW2ruDbPjY9UnfSzhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD9k4AldTQrQV43R4LFqH4lhnBEpEDFokua341KF7u8=;
 b=MFFgN0JZCyL4NzJBxx8oSHirl2NgLX/r8++MV4Z+r4ERhxDwxi59PcmlqwW1iY/9frAeIqlRZ4o8qbT0yGmsWH8CLpQyBqf4Mph4+KD/7GsJk/AyBMmznduIf3FTHiQNlN5QCLOKQRnouzKRMbJFywPQ07CrbPZBnyCyFblmVWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <18f32ddf-a62f-d3b9-5b57-f808b5b72f06@citrix.com>
Date: Thu, 6 Apr 2023 13:55:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/emul: Use existing X86_EXC_* constants
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230406121753.2205968-1-andrew.cooper3@citrix.com>
 <44079a26-4631-135e-6593-78f7c2d2319f@suse.com>
In-Reply-To: <44079a26-4631-135e-6593-78f7c2d2319f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0462.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1e6a28-400b-4ad4-1972-08db369e346c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xcwu7DNNlSK7wdJ/RRGnfFtLnOTRtB0HI+U95GoiYsHhIEkGRxJHhiOj3bxqFqkHBShyX0HrkMVFeNY5J6WnuUyM673FbQiBhcX1mx73ouW+/1Sv2pUvyVsANHvIp3BNJYIFCwAHGxeWFmiFoyOkbAPgbxXgHCk99sbs3jxqWCcKMir6zHOGLKJ9W+ZtgBykFrqKaU1HQs8mS4EdCe2rsAugwV17oxFXdFi4eUAsli7HTxyUJYhQE/YHKz394AwxzQ+elomBN69DXkaH+P21ffxkVKb4WN3dfCuZbVra+l9+zfEeCWMDxCqxqySO2MKGorC8eYtqSx3sdqroBQsh3SJadVCd02nyUUJW63wDrIyApq1TWPUg+QD591aN4qbHt0fPMiXWhR+xtu4pXY3hfh1q5mZ4Y00FsLK59JpcQ+62v/+dyWTGrj32oqgyo//o/nQ0R3pxDk5d+XEaj1tDoTcacFDaayzSAJJSgjHTaerxBKEFfDmPrHIVjETj0+BlbZEmUmyVBMC8Pw0m+8BiSaAfBrwopx8K/tjGxdzOx8vVyWV8TamfQkWhPQX/Mh78eOTay2srjJ7sdLxbmfwLMJLMceCEA2XrGGUZ/0EsVxn77rf3pgakJzb91cmebjlLfI9Xhl9vg2WlVQclsoT4lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(6666004)(26005)(6506007)(53546011)(6512007)(31686004)(8936002)(186003)(2616005)(6486002)(478600001)(38100700002)(41300700001)(66946007)(66476007)(2906002)(66556008)(36756003)(6916009)(31696002)(316002)(5660300002)(4326008)(4744005)(8676002)(86362001)(54906003)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXFEVThnanY5S0kwZmZuZG1MaG9uUzl0R2VodlF3dk9DbEM4aXMwRUd2b2Zw?=
 =?utf-8?B?MEcrZERZcHdGRm9iOVBWTWZRMnZjeGdyY3gvcGhiQUE0TWVWWkpPaEZSOWFw?=
 =?utf-8?B?Wk9hNGFnY1ltRnhaSkhiS0ZHSFMwV3ViMWl0a094S0YzQVlOb01Cc2RkK0da?=
 =?utf-8?B?Njd0NndmRUs3UGs2bFJPcjJMNWNrV0J0QjVhd0N0N0F4SEMvOGtCRExSUFg3?=
 =?utf-8?B?SEhxUDZkNWJqdG5yVlJtb09yUTZ1a25IY3JpcytvTEE5SG1zUnFQM1Mrcldq?=
 =?utf-8?B?SUxnNWJOOFIwMkN0OWIrYStMZW9tNlg3OEJtSTQwVW9US2pVc0VvVk1sOTRP?=
 =?utf-8?B?bGQwempDOHRrOVFUU2FUQU5oNzdMbW5mQlI5NWd4bXcvRjVSL1h6Sk9qOXNU?=
 =?utf-8?B?QUd2RkNiK05LTENSTXdRYkQxV3AwUVFEYlZsTFZ2RmlPbGNhL3pmS005bjY2?=
 =?utf-8?B?VDE3bzZyQkUxQlVQMmdJb3JqZ1RzYkJyZXVKcGhZWjVtSUI3UFRYK28vdnpX?=
 =?utf-8?B?UlZITEZEeVBlcGtHL3RvQmpZWTgxZ2NzdVkyVVFORUJIclRsSm8zcjJNbzIr?=
 =?utf-8?B?OU1hcTlYK1UwNEJnVHpCcGZib1EzK2ZyZDc5Y0hXNFU2a0R3WjBSNzR0T05s?=
 =?utf-8?B?b0NnRXUvTStxcEhyaWVxbTFLTkxiZHplcUhCdmxyS1VtdDZ4UXg5dkhSMHBX?=
 =?utf-8?B?cW1zTGZ2bHdxTmlTLytxaHJXUllrdGhQdlpvclpySzlhbGRveUJ3cFY3UHNa?=
 =?utf-8?B?VFRyanZuOFNia2lPc1VjRVdHWDhpTDl6M21tYTZXMHZranZFcXppODczUTlR?=
 =?utf-8?B?UTFPVERNekYvS290K21VUCtTZmV4WTVSVWVBaDNCcEpQMkhwbXBhZGp5L29q?=
 =?utf-8?B?UG51TkFEcGZOVmROdk5FWDhsSnEyZE9ReWo3UnZqbTRnYmhnamlNWlZiYjUx?=
 =?utf-8?B?MEpWQ2U5dXV5dk5aSThqVDZLczl5WkhTdmtuSWYrOXFPdFVSbTVtVkZoZEZs?=
 =?utf-8?B?TUtaQ283R3gvOTRCalp2Y21Nc0crS25zNmZ4ejR5eHBDMjJ0dktSdTRIV1Ji?=
 =?utf-8?B?YnMvWE9semZYQmlieThCVEZnTXp2NEtUbjZWc0VwenYxWXU2VDNXU29wVG95?=
 =?utf-8?B?MDVlcEY3NngwaEZzY3M5RmVSQWx5TXMyb2VIcTFIUmVLNWlKT3FQMEI5M0Ra?=
 =?utf-8?B?R2lpamI3aUZ0N3pWZW5pNzlTenBWQWFFdTZ1d2xYZ2lnZVR2SWlKdGxPbDlG?=
 =?utf-8?B?ZHM3aVRWdUU5V2UxSkZCNDErdDNuMWw5cUJLaWViajlnUkNmOTEzTGc3dlJQ?=
 =?utf-8?B?Y1pDTjZUT1BZZVlwZXNTSnFzaW40di81VU14NXNhcjRGVTFHWmpFOHE1SCtj?=
 =?utf-8?B?dlBuMGM5TjZMNHRQcy9XdEt5MW8wWjh3cmdTWEp0Mk1GWXRqTkpDL1VwWVpI?=
 =?utf-8?B?VmhidG1ac3VTOEFkTm5aVXYwSHlINHlPTmJ3ZThJdHhkZGRPZmVwbkdkNTBQ?=
 =?utf-8?B?QzFyekRPRUlsVHNnTUM0U0JqR1I3RzgwTS9TNlN4QVdnNk1TT1ZxV2hOVnN5?=
 =?utf-8?B?Q0tRSHZQQkFGSFdXQzU4Z3ZHNlgyM3c4ZGhDZWlYbkx3N20veXlIWmhDSy9G?=
 =?utf-8?B?eGY1a2JjWWpxbFZuaFYrNUw2K0dNZnNGeFYyZjBMUUhmaERIRVlDTTZldUdj?=
 =?utf-8?B?VEpXNUo5bnRaUkZXMW1mZG5HOURzUnRTYzRmc3dqaDVwS3RDOTJIY1UxbGh0?=
 =?utf-8?B?bk1DVzJ1SUptN082alJtQnRpcnYvd3liQzlZQzNHelNwUWhWMHlMZEU2TmU5?=
 =?utf-8?B?dlYyQmVYd3BpRFRtTlFkc3hRVzU1T0pIUEJmQTd4dzM5by9Hb3E2RWFTTUY0?=
 =?utf-8?B?dWdjRUpXemhCc0EwRzhyS1VjQ2lldEJucGgwZFNXQmhaMmxFV20xc0ZMYytY?=
 =?utf-8?B?U1p3WEFyQ0JWcnV3TFQyTEM3SjdiZUVoRlk3MFBuS0ZIS0xrdU5aK0o1S3Fq?=
 =?utf-8?B?ZTk5OEZHMit5M1RoNzlGR3pmQURUc1QxUXZGZHQ1UXNiZ1dmMmlXZlBNeFdP?=
 =?utf-8?B?RTRqdHgreU1DMUNHZXJBem0wYXg5bHJNVVNhZkYvSThNYklvOVpRZTR0bjZt?=
 =?utf-8?B?NFllY1pXblJqaXhDR1lXN3kxdTBUT0dXWE5jM0xPcHBEREIxMG1GWU9OVDVq?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	09jt7/srIb0/6oUes9oVLsW2Auddca0z5UaISgb55FoHhVuwhBcmqfETzGq7j7XUpn/QWo9a0WOWuH1Mos2HXLqH+UeTEG2duS5M9Y7OjKNgOGM1D4DctXVw37HaNDkzjSBoV539Klv1GlOfNxHJy10vDGhy8KzhAAHk1eZavsZBB0WK/GEtAwAP2louTpWIhAG0TZ2ZBA99rd5ofcm49+OFc3X5ZIT4HOoTqJkiCt+ekrW7LX/DshVmyskcSyAwHKJk0a+06znFteCsxdr8QxK4nhQx4ogsgRtQddcYQR1K5JTmxE/54rI5EjkIeXQz+NzDWHW+pLIlFUu3gu2IBFc9Z7LDw1eVaO6NNhvbJWssQnwp9xYEqvb9/YYovd2VcBPlqRAhKYoPpvM1w1WHa4RoiccIaEMdIbR7PcpmFdwHOd3PvPL88fkJlaCewrZgFKnoUndWlIDJG2uUIduL0FgalyjRhDJs9Tyb7dipO2PZKbVGCElR1HrWaKL1ISSlBjORFScsySFb9tOrzrloxW37mWEyFoJTk8mZwVERiXs9VLWZObLKl79HkgWHbDMIRRXElvrLqxOwFreQhSFr302tI7LhNePbONlbdkAQI5wGtvu0K9wHVV6dBZb2/HfNO0CuXZg9nunGgQKSTll4W62nOoiBrGdZDpCyQA1H90XvRtaNmKNt6aexVwU9JfuA9ClOVREfv+TCYGLgUU4ldxTQyP38Wd+tpVP2X8YOFYY39kqxGg5wvs8mnQQw3cwWDLW0vkvbH/O45a93U7lasfH8u/KbZ6n13xXVIosSWgaYLFkq3DIdbzrRichdIsOe
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1e6a28-400b-4ad4-1972-08db369e346c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 12:55:31.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHHVWUkwyw7kuyPpqCAq8/uRNLNHAxFsaSWyFj4o99tHnrWIyHnC+lMeRvlZe3Y52iaMbBk6j0nLvqL7VrCUdG3ZbebBEvhz2w98KZabgGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6055

On 06/04/2023 1:50 pm, Jan Beulich wrote:
> On 06.04.2023 14:17, Andrew Cooper wrote:
>> ... rather than having separate definitions locally.  EXC_HAS_EC in particular
>> is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Yet more re-basing for me to do ...

And me... I'm somewhat alarmed with how may branch collisions I've had
with the TRAP_* change.

>  But yes, it needs to happen at some
> point, and I guess there never really is a good time.

Yeah, but doing it together with the TRAP_* change is going to be least
disruptive (overall) to others.

~Andrew

