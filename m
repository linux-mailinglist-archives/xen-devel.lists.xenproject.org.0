Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDE26F2625
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 22:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527693.820363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psqkt-0004JM-Tw; Sat, 29 Apr 2023 20:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527693.820363; Sat, 29 Apr 2023 20:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psqkt-0004Ge-Qz; Sat, 29 Apr 2023 20:01:15 +0000
Received: by outflank-mailman (input) for mailman id 527693;
 Sat, 29 Apr 2023 20:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqU=AU=citrix.com=prvs=4767ec71a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psqks-0004GY-Az
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 20:01:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a9f410-e6c8-11ed-8611-37d641c3527e;
 Sat, 29 Apr 2023 22:01:09 +0200 (CEST)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2023 16:01:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5869.namprd03.prod.outlook.com (2603:10b6:a03:2d4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Sat, 29 Apr
 2023 20:00:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Sat, 29 Apr 2023
 20:00:59 +0000
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
X-Inumbo-ID: 94a9f410-e6c8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682798469;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z0477FqDiZXn9zUb4PFl911Gg9UxC9omPfnirEG+BOo=;
  b=FKkUc1b0ZlkAwtBgw33Js/Lb04GvG4Ko8HXzMvMcgIzikF4G3XzQLLxF
   +H1HxKarnKUBrR2dun9Q/g1D4wnpbgsbu7udl6Ujc00trTpqQ01WoO1Ji
   tzu+U8otoHWQhbS5yUNuRdeoeTwGPmZc9Im3MUMcElJnIseUKeS7RfonN
   4=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 106665322
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MjyAN6AhVXm9ThVW//jiw5YqxClBgxIJ4kV8jS/XYbTApDInhDdRz
 WZLWG+OOa6DYGPxfNBzaoyyp00PuJaEz9JjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3M1LAV4N0
 uEkJDEnQBalgMyZ27+/Y7w57igjBJGD0II3nFhFlW2cIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxrvQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eRw32mA9hIfFG+3qB60E2Y6TBIMwdIThijgaGYiA2iYN0Kf
 iT4/QJr98De7neDS9DnWhSirX2svxgCWsFRGek39AGMzKXP5w+TQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAeJHUOYiIsRgIf797u5oo0i3rnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqY2O76T+FnGh3ego8bPRwttugHPBDr5sEV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRfHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:E5tkOaFb/woCy8BtpLqE0seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5IUtQ/+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpwHIKmnT8fNcyL
 clU4UWMqyWMbGit7eZ3OBvKadE/OW6
X-Talos-CUID: 9a23:Tw42S27Q7Zgk56X/s9ss0mUoGv9mVWDhwHb6DUmeDkhGU7CRYArF
X-Talos-MUID: 9a23:n2z1ZwYgFSWI1OBT6S+8lDpNaJxT+fq1S1gtybQE+NW/Onkl
X-IronPort-AV: E=Sophos;i="5.99,237,1677560400"; 
   d="scan'208";a="106665322"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF1SccVHTZjv/P9YHzzvEh89TPiIDZ2DkGcrNaUybeDnK6ZcpC6YbLqsWNMv+1Feli/uZasTsN9WFTGl3NXmObsjXDD5OVaNpF2sEBcQmVp6w1mhoHecMRCPYo40afuBhSJie89OL5g8FZCFoiPyux/3yH3aEIdET8JC09Ga0aNfmDtLxTEVipzVZPUoo4zD/CQrEip8MMuCSBsI4+f5Ivd/6uDJ2GIAg9IZPlWHobvhi6Al0HX8bk4vGR0XdTVhGbguLSrLoMzkBh2qaSa4FsUKkil3k6epxhwtpU3znQ1xDxTGZc7EBRAWI4h1YjAKt01pxBKFvslb9aGPRfci9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0477FqDiZXn9zUb4PFl911Gg9UxC9omPfnirEG+BOo=;
 b=kiI5l2YVkAXjMVF9gGtm1N9CRFHlOJzExeag72hhxG9ZqCkJvlIusy1sTvPHFzMv/UesHIFFfPOnnR5tMaolSb4arMuqfzD0NgTv1ztl+MaOkj7RGAKroLKw5K5F1qmsZROThXgUM0aon8pnMs+HM4eLVjPla+/lSkYqZXvw6ZbKQnUXe8Z6UOI9ImfOEOwxfnZ4oK0kD6w+lLpn9JU0XeRRPlshuu1NYHm+GxsObBOT1HOxiXk8zqxUN7p9MSutrb2maQj3NpcG2FSBGv2X9OPgnzpCx8n5XOLG3zIiwl0J59Np1ezzevu2wJWmZgObEiuKyJZNeVPdmpfE6cTvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0477FqDiZXn9zUb4PFl911Gg9UxC9omPfnirEG+BOo=;
 b=n7bXwHrkFZCmba0fZNyDf9wTr1NPimH+AaU20dFBPOjweGp/+jXqoqFPHHeN4kO/+E7i+O+YctUf4YxhpUR4XuUEuWW5xH22tB82imkEdhcWmXgm0QLHNmhY6V47BHEdJ7tN+N/oS+mfw8gBvmG099yBMgOkp8IZl/r7ZLOC+5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a2d1b46-9ea4-ace5-f26f-d373685956e9@citrix.com>
Date: Sat, 29 Apr 2023 21:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] automation: optimize build jobs order
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230429142707.176299-1-marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230429142707.176299-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7d9e2e-989b-405d-8948-08db48ec736d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GsqdjgDR43OEawL0nLSWXwRQ53vShyXWs902uwJX/r3uG0j0q0Lk9PznfryriDP3TwiHVqZ06TsIq0vMvBjz31heuJfPhROZYvLnb1LoJa+9mLyWf0EdFQIeyjylXCbEcS3HmIAoJQ1eVnHDAUFwe1SWi6KmeccEkCWRnRt8c9oT2sAc211OFUC/qTALq2CpAPyhmZqgp00mpf5koJFSNhNQNzQppzwllJTtitCPHWXWugk+M66rpYhPFfYB3tujNucij3x53zhzYbjUkOFFe/j9wPqlG0kbAuM/o4nJ640mwC6SGlNiQM078HH5ZZkM8CRpxBWyMZYnwvXhfrjQdXqxR2RmIYxAjwKTz1tjQG1sD8WO+STW0kkXuXvjsqKCl1ITNMmcKOdu5T2EHtMo+K750jb2QNkUufk4D7DHo7lTd58Mn1JvN45p3O6398yk5jJO4Neg0s/NKbsen341eGB2TU13bPrh0UZNNxTSzx0P/NhsLVNJRE3BX1sFFbW00SmHtv7wnhL3kezu0l+RronrZ0uCNInl0IZFBwx/f/foeLCHNcxFGuSm+p1bs3A+34JQL+buJhOwyZqlmceetwi5xZdOcmzf8+PCk+kuZYPR5D+PPXe+zRUiR5gpu9qaVuZjJTgsD3WYiYuoqBBl1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36756003)(86362001)(31696002)(82960400001)(38100700002)(5660300002)(66946007)(66556008)(66476007)(4326008)(8936002)(8676002)(316002)(41300700001)(2906002)(83380400001)(2616005)(6666004)(6486002)(54906003)(478600001)(53546011)(6512007)(6506007)(26005)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDdmRzhQUlZrZWErVDhkb2NOZEYxMS9IMVBibk1DWDZPbS9YQnZXNFR1UFQ0?=
 =?utf-8?B?UFI4OGFRaHJ1d3JEVDlSYnJ5K0kybUFxT1greGREL2dqWHdlb3ZpbGd6OFRk?=
 =?utf-8?B?VFlFeHgyNjIxNHhJa0hxWGtEcVVWRGx0a09DbHJacmhURE00cTdJbENIeGRj?=
 =?utf-8?B?SHJsYlNrcmJkMklHWktWbnF6QW5iQ0NiaFJqd2krbjlSZ2dwMkx1aUk2cStE?=
 =?utf-8?B?VjJpVnp1SG5LenBBWUU2ZjJPcXF1L1BvTndWajJRZGQ1SGVPQ013TnZiNGU4?=
 =?utf-8?B?NmlMMStUcmRkN1RFMzJBcnFMcEl0NGM3MkFLU1dPM01uTzR6QXVRN2FGQ2FZ?=
 =?utf-8?B?NnpTVU5wZ3hXVzI3dzVsWjYrMUxvbTBQdFJZUXk2bGdSV3lpdDB3L3lnMzMz?=
 =?utf-8?B?RitZVGRwUHBtV2J1OXI2Ukx6bW5JVko2N1MxQjl3eTNCdXlYVlVDL2ROcm05?=
 =?utf-8?B?UW9YeitBbm1rbDV0MWl1TTRNWEFmb09jWnIxUnA0aGtHMlBXdjhBeW5yVmNm?=
 =?utf-8?B?U09NMUFKMEs4UjhHb2o0MlpsQVBreVRHRlI3bU1POHlyRVkzc2R5THVWRjJo?=
 =?utf-8?B?RGZUTzBLQ3QrT0Z2cS9GbkNzQTVrRmRza3BMdElxUWlHSnhOdk5yQnVxWm5Q?=
 =?utf-8?B?ZXZ4TVQvWUFjTytRdnJHOXdKUWFhWHkwNStJN2Z5TDZPY2p0T1Z6SFdXZ1Ew?=
 =?utf-8?B?SmNtaHllZGMybk82dDU1enN1dURIT2VTaWJJakNjc29DTWQvb20zNGhVd0Jp?=
 =?utf-8?B?K0pMUldSUzlSTlhHNE1vTXhzM2xISjNJcUtLMXF0SmRadHppeGcyNEFKSnl6?=
 =?utf-8?B?Vk41OWRhbjhMSS83THlXcWloR2tGbFp3elhsRnRhVndQYjZ3VEV6TUJzVEJD?=
 =?utf-8?B?WmFkb05UUkFPVHd5T0puTWtTVlNCdnBxQ0lpc3Z1OGhVZEE1ZHlkRlgwRHRo?=
 =?utf-8?B?RDgyelV2U0MrYXBOM3ZFMXpORVZRVUNJSGhTcE1zdHdPUGxHY1Bwcnh0VDFi?=
 =?utf-8?B?bEJObzUya0trc2RESWhaVjd3dmVTeFV4Q2V4b3NvdWpPdEx6SW5BRTlYWEYx?=
 =?utf-8?B?Q3QraWFNN0VmY3c0MkxLd0hYZG1CbFhYcUJHTnU5VmxrTm8xNDRJdlJZTE53?=
 =?utf-8?B?WXR4bG5CaXZSN1ZEamtNRWZmTmdMMlV5Vk83bFBGTkxLUERXbi91TjVqV01q?=
 =?utf-8?B?M1hGSUFYRE1yRTJxckFOcnNhVTU3aWdUTFNPMWJuYm45d1E0cjlodUtzUFZh?=
 =?utf-8?B?cExGRGhuY3lNTFFVdHpIZ3hlYWtZLzEzYXMzMnBKTHMzS3AyaHVhWmd2ZUdx?=
 =?utf-8?B?M25EWGRuaGZzcm85WHZkRCtaTTZQRURsQTkrNmxCcWJBU1NEanVTKy9GNVcv?=
 =?utf-8?B?NDQ5YlBDNkFJTEJEUExKZ3hSTFhCeXN6YzJqK2Nmd3ZLTGxFaXhSZCtyYUV5?=
 =?utf-8?B?VWs3NVRQY1Z5blc3ZSt5NVYzZ2ZnVE0ycFBqdUNCcEYwT3NCcHhiQkdua3hS?=
 =?utf-8?B?a3B2VnJESTlDRlFkNWc0YXAvWG1qQTFBMW9LVnQ3eFdEcG1iOE9pWGdCS2Fj?=
 =?utf-8?B?azlvSUExaVhqOEtoSGNUUUNmdVVWN1doUlViRDYwazBoWStua2MrajlNUHVx?=
 =?utf-8?B?UVlNZVh4RWlLK1l6bDd0UGRlQkttRzMrbWF1bE9XMUlrUmQrSytvazNHcnBy?=
 =?utf-8?B?WlI0dFhvUHp6TklSRDFxL1g5NjJLR3hwSXRSKzVUQUxQT2JUSkFOSUVYeXVo?=
 =?utf-8?B?eGVZaUJwVHY0YjlUcjVHc3lVZEk2ZTU4ek5MWFJTS0pUaGxjVlhWWlpvYTlK?=
 =?utf-8?B?TGdlVVlLVUdhREs4S2ltWU15b3hMQTlCZzEvZHlia2x5UXk4aU5ROHpPNzFD?=
 =?utf-8?B?NnpCckl2dFQxZVpmWlVXSnAxQ25jSGV6a1ZvcXdFMVd5MkpoQnZ3ZGw2UUR0?=
 =?utf-8?B?VkptTTNmMXVjaGVKcE9pU2Z5VVV2RzJDYWxHYndJNVVUdVFJRXo2ODVEbEx5?=
 =?utf-8?B?SnJEVWlnREJETkYxNEtCUzFHUkFSdS9ObS8xdWNnaEhyM213Z2NFQzJVbmts?=
 =?utf-8?B?dG5WNEpYUExRcGNOMnZEMUFvdys2UFJVc21PeWQ1b3BSNDQ5ZEVRUm1iREhQ?=
 =?utf-8?B?US9mZjg0NE1QTnBDam1tcGNTaXNZcmRrd0JGR2gxS2t0V3FyYnJOdEl6WkhK?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hlVRK7dtHQmT12TQFIcOOXoysMlxJPFWWKaZ1wUgBuvQFOMnhFvdnrW3vGArAkr/7ege95BmojYAJRfLeBmP9DGzfuRAmazy8/XG7R+RAvRCgNCd0XAt+pfjQw1a6cJMaziQX0yS7mpldeQdFL7w4CHQfEh4EW16/cakFyUg0aNpRWBTHeKUxf2Pq2VYYVrOA0qbBJyeb6t+qrEq5O2pm7KUdTXZBua5ouCvsRC1l5GtaxZoHe12yn8//oCX9Yow7+cw/pyX4KLesAPTi9W00wKAO+R7EwWCGbKeTpvQ4My63JxU1eYagmFZ2zIkjp3fpsm/4KmSWOFZfHp4EcFMqPJXVD0LnqxXgYqtYe/UrHZztn6CkfJmTlLeiCOnYSTMCnF285EX993gmKq0v3O2XLUguSn2Eb6HHfjCI6NPMf6/YA4hGrS7DkyFbT/hydrKZdeZLf1guT7uyVq3G7xjUVM8e54dvzSjoqRgRilflmBoYymcOlJ9Vgm8SKwOYKQ3OHUvyJAl/fkIhUE5rtMBRPrxviASGa74pRALSOq8Xkb9hvyQQAzrLR0wQdrURo66RY45x8epTPlydBPFp/GpXyczAU1Gklh6wtnAT9AH3VcDR0msOL0YCdA8BTVIOLuvbA05ekjcuOkoO6Y3fwXgupSuQdtZ3k/o00UqOD0lZhbTFQMDazzwVXN3ip2bYJtmOZXpuWB5htx6jGI13sVK9n6jo9BaVybQdhjQKUIJKhSMK3C1sxvT8vBNkWpHgiMYGVChH/yJErrVQ56vdsBWVHobh0bbMSX8rZJgsBh4LGH36i9L8F8qHvX44h7l17fFWNzL0KLpmFJMvlIHr+DdVgyNs6Wyh8SCMmuGzOoiD552CbjJfjRL/aVo1Lq6R20U79+mDgEzYP2eP8SH68CeFQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7d9e2e-989b-405d-8948-08db48ec736d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 20:00:59.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrEKk+idNtDIh8QCb5Oyf0HCqU5EIuUxnkplExIu1n+clbouvsx9v+lMIgMX6P8PP8jxOnG9/cWLKLKXP8U5VjeKQ+/brmww4/h7Hwa3YGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5869

On 29/04/2023 3:27 pm, Marek Marczykowski-Górecki wrote:
> Put jobs that are needed for (any) test earlier, so the tests can start
> running in parallel to builds.
> This commits splits only x86 build jobs into two sections (one on top
> and one on bottom), but keep ARM build jobs in one section, as most of
> them have some test connected and the few that do not are not worth
> reducing readability of the file.
>
> And also, put artifacts jobs at the very beginning, not the very end.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This made the pipeline to complete within 45 minutes. This isn't big
> improvement on its own, but should make adding more runners more
> beneficial. While looking at it in real time, most jobs were really
> waiting for available runners and not stuck on dependencies anymore.

That's still 1/4 better than before.  I'd say that's a good improvement
all on its own.

As for the patch, Its not the easiest to review.

The test artefacts section is new, and is just moving various jobs
forwards in the file.

I suspect that if you split the patch into two, first forming the test
artefacts section, and second rearranging the existing x86 tests, the
result might be readable (or at least, more readable).

The key (I think) will be to keep the # Jobs below this line, and
following archlinux tests unmodified in patch 1, at which point the diff
ought to render as one block insertion, then scattered deletions.

I suspect the second patch is going to be a mess however you try to
rearrange it, so I wouldn't worry too much if this approach doesn't work.

~Andrew

