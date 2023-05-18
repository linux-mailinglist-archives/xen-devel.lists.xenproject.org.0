Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8870817A
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536326.834541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcvX-0006Ce-Ai; Thu, 18 May 2023 12:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536326.834541; Thu, 18 May 2023 12:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcvX-0006AD-6a; Thu, 18 May 2023 12:40:15 +0000
Received: by outflank-mailman (input) for mailman id 536326;
 Thu, 18 May 2023 12:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzcvV-0006A7-9V
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:40:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f545ec5-f579-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 14:40:10 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 08:40:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5624.namprd03.prod.outlook.com (2603:10b6:5:2d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 12:40:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 12:40:01 +0000
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
X-Inumbo-ID: 1f545ec5-f579-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684413610;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=w5+cf/9p/bZKJjS6STQyiiUqeumHmkyeKCRar8TcDYU=;
  b=CQxG4Khzyom9DVHWYKgYQWvQniIDneTDCqLqox59Gfl8S1CqzpENxiYK
   LgPoiiwSIKuPCwby9o9fjvB7GBBef+gAdXf8Pg2AhulMBS7BjFdLiOWiy
   9NdUFciLvPrEVVjAlg2rdD75EYv/c7vhQV80uZXqJllcoN6U6SCtGoYMc
   4=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 111975285
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6EKYoaxWa2PjSr2RqOx6t+cIxyrEfRIJ4+MujC+fZmUNrF6WrkVRm
 mscUDqFa/iONmb1L4p3Oo61px9QvpfRmN5lTQRk/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KURy3
 NVHcDMfVT+Ou7+IxLCQQ+ptpP12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMpuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aWzHymAtJPfFG+3tBqkGGJ70lNMzI1d2WF+/ykplOGQ/sKf
 iT4/QJr98De7neDdND9Qhn+m3+CsR40UsBVVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsVQIY5/HzrYd1iQjAJuuPC4awh9zxXD31n
 TaDqXFng61J1JFTkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:ZrC0XKlKBDeBsVKuGEpaiTT2l4fpDfOhimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qADnhOdICOgqTMGftWzd1FdAQ7sSibcKrweAJ8SczJ8V6U
 4DSdkYNDSYNzET4qjHCWKDYrUdKay8gcWVbJDlvhVQpG9RC51I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmJm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTojxj78G6Q64bg1eUYpDLT8KoMOCVKsLlVFtzYsHflWG2mYczDgNl6mpDt1L9gqq
 i1n/5pBbUJ15qWRBD8nfKl4Xib7B8i62XpzFeZhXf5u8rkXzg3YvAx+75xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa43ZcjEBS4tL7tUYvI7c2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcKUgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xNfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzvesPcV
 T6ISJlXEIJCj3T4Je1reB2Gzj2MRmAYQg=
X-Talos-CUID: 9a23:KwdeM2+3J352QRBOatSVv2soM+l6Kn7P91jdHxKGDWRCQb6Ua2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AWdDegA2sSim5sAQTKG+s2jRuqTUjzaS+NFoktMs?=
 =?us-ascii?q?9lOqmCxIqPiqxkQyva9py?=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="111975285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLJyq62kejDCQQm1Lps9l/fN6Dus+G3DFLA83dVlFya1yeHPE6o7plQHt4cLE77Enct7e/oHkHudLxMGZaiZHljknHbPDg+YQ5tR3aJunPMhtIbLANumIVJu5qFAjo67mSisg0z1XjRGZlYbBSO9ewzVP1g0byuZIbv9RVZalcCxIK6xTQHLMAj80Wy59STYPNoEslKQFd86X5PQmc4IjUxmI3MHvPchBbrRjyZzVSaQUdMY/3ahfNGtLIH0LQqfaLICsZtLsfpBcT677oCsIEFjui7R/CPwmTWUQU56/D4icNZNigWfoL+PapKVP0LhaGBWOD2HpDJ77GvUox9K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hu38g2+g3pQBwkTaDfCdtR9hZvDiTh0J1xtKp9GaG6k=;
 b=KIj5WOegrrB/bxAJI8wjsvObdQseJZT4C60+hQ8/2s9G3oHJ+4csvVwSUmLueS1NrjA1m3PpHHMmKMhbDlKq5i5ejDBebH0UuJKUEoPX9ybdmkMe12g8vsOUFCXKFAIUGfYBnlF/Q/zEe8MtyW2sdj5aXNrD0Pt/taSjskb2NdscyMSqOzjm6OyQ6oLodgP98I+WtQea2S8g4moKagBb1f06e3r4h7Eml5GoqFvv6dp6+hTDRgp0rTL+O1FABOG/jc/cWgBqbboZFbZkjWwD9C+YdrYkAIOjrdwtRdqwXGxEgX8vMwSTcIb4MLJkbVGHzfv4MSZ5SXicbvXn1wQMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu38g2+g3pQBwkTaDfCdtR9hZvDiTh0J1xtKp9GaG6k=;
 b=qKCXumECclXbnM8ogscLO96ExQM1GZTAgnjOWlbMex3i8T/8RZyY6Y4zwflO5mq+GeBXbqXbVBNaeAQv2Xj3bnLtW7f3mtLinRQtuvt05aCwLaK6rohumK4e2dkjdxG0TVDRXg85FSi3e2R8sJPLyKRG6RIl82VN7gJT1jdRqXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 18 May 2023 14:39:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Message-ID: <ZGYcm6Tr0VUF+NYk@Air-de-Roger>
References: <20230518105738.16695-1-roger.pau@citrix.com>
 <7661952A-477F-46C8-8F8D-AD2D7D81A4EE@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7661952A-477F-46C8-8F8D-AD2D7D81A4EE@arm.com>
X-ClientProxiedBy: LO2P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe695c7-ae82-4d9f-cd44-08db579cff65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJ4bHGDX7D8M8JIQH9PISkdHF3vZ0I4gOWsJ1/qrl8Orid8kWPL5mlWXm618pOzcvH5LHIeEiThe8pT3LLdlJgc1aRlji+KJSlEd8Alk08Pdusvdq72SV0YgqpmNmowOGviMwngYS37kyzYWri+WzcvmQbSIrNyja9Q33gskj6GbZY7heJmI4oCsrTUfjlm/INnc35JxYaGRJ+bTDiQ/J8cNDthRHmtkWePpq9ArcZ5vx8gGp5i3AVSUzNsYMEk2DoQayvtzpctwa33wi8jH1Zk8MpEUsWeQ18qfjbP66X/4lEYdc3Eb+QzgpFQFB/btZs8/GUHHEzlXAmxrfdWbTltqMzRqU9hgnEYUL1pCX6FV5d6m4CK78zD/fnfOavXRZhu9/P+qiXZzDf1GRjdIC5HYmiXKP+3Ocl10Wzuse0zX8JJkvxgHP9ZhnG1i9cnZ3mqQZA9Tgpaw83PRqqxvcOXrfxtRt63e7Y0oJRa92UfEzIWRLMxr1E118ga7m1DKEuedbtxQkapBrbJswtoFoVuxTw6Xc0qXeJKWfXaCmhkFuAvtj5fUHN+RnA7hjhyLtlGte2RkIw5GTdq0Kx1BhqYJVaNofPW8K1MK+5qtLjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(6666004)(15650500001)(6506007)(6512007)(478600001)(53546011)(26005)(9686003)(2906002)(4744005)(6486002)(41300700001)(186003)(85182001)(316002)(54906003)(83380400001)(38100700002)(82960400001)(33716001)(4326008)(86362001)(8936002)(66556008)(5660300002)(8676002)(66476007)(66946007)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VklDREh5clZWY3l2aWMxSDRkeTFOb3ZvVkdtdWhmbE9yR0lySlFISGo1S3B2?=
 =?utf-8?B?Y1dVbDRtaEs5M1Fvd1VSczkrdGlDdnZwL2UrN1N1TjhyYVQ5Vld5R2JvN0lH?=
 =?utf-8?B?UHV5U0RyeC9sREdMUWVpdno0ODZPanJFamtHVEl1RWErcERrYnhXTUNGRklE?=
 =?utf-8?B?Wm94NkMyeXFVN1hYdXpBcnNlVDd2VC9wTGZCYSs1SVFsNDM4OVhxK2JRNWRR?=
 =?utf-8?B?UkR4Z2FkZVNJODBsbVhzb3ZDd21oNHdjS3ZHZWs3NWhablFCQkhFWjRPRXEz?=
 =?utf-8?B?L3RMTFZ0NFN2VGpKblArYys2cFRhUk5lN0NYM1Y3VUZiR3ZSRzZnTmZqSmZh?=
 =?utf-8?B?T0ZyN1R6ajRvTi9LcEFiKzBIYXJkL1RvclVLejdkUTZES3N5cEljNkZkWmtO?=
 =?utf-8?B?ajZkbUFNZjB2TG43NlNNa3BXYTE3eUJkZ21KbEpBMWpZbGVKNTNPNU8zQXBW?=
 =?utf-8?B?b3FrWVZ5eEpyRDU3ajc5TS9leS9Vd05tNG52aVRZcnJjek13dlNwNlZNTitU?=
 =?utf-8?B?bzRzbHVxTWVLOVdZWmZqcW5kL0JyUkdOaHFKRXY5czNjdWNoWkhGemI1eUVz?=
 =?utf-8?B?eTBNWkFIcXBqYnBOY09UOVFYOUQzQzZsWEtqWXVBOHgxSjlPRWN2L2J3Tnhh?=
 =?utf-8?B?SjBxQ1lob0NRd2lEdi9KYUJiT2dDVm1yaHFSanB3a2JRT0ZibUVJb1gzOWZx?=
 =?utf-8?B?L2x3OExqSFJvTERldkVjS3VmMGdUT1RSN1ljbkRJT1RTa3VFUzhsRDhZbm5l?=
 =?utf-8?B?cXhkb0diWWo0M3d0cldER1E0NVZHQXpzd2g2WnJlYVRnRDNFamdUOExSSW1P?=
 =?utf-8?B?Z0RqRlZEKzhpell4bzgrZEVYN1poNnlFUGEyRjBVUXkyVlVhbkxteUpRL3Nk?=
 =?utf-8?B?SFBxaTl2cEpsL3JLWFUyZ2l0dmhpa3VqZXFrd1ZTNXo0d3ovYWFoVHN3eE1U?=
 =?utf-8?B?cnRmVmttWWpSbDFRTElXcGFoNzMvYlZub3Z2VHNzbXA1ME5oWHFFTWw5WXdG?=
 =?utf-8?B?ZUhkOG5jNS83OEFuNStVQTFybnluazB1Q1o3Z0NXNzFkUVFRZEMzQVN1ajRX?=
 =?utf-8?B?blJtdjhpaDVaR1BWNVdTWUZZN2djZmg2M3JIcmZ4UjltNUVZcWxpY1lnaXpM?=
 =?utf-8?B?WlM3TWdhYkQ0Wm9vZWY0WDV0NVZCNWU2S1dzUElmaXdDN25IQlBEUDMwM293?=
 =?utf-8?B?MzRaNTN3MkdsRDh3UmVnS1h3NjlWQnVSRm1xQjFESmJBVjhoLzFYQzlwOWhy?=
 =?utf-8?B?R0ZrOFpqY051VW4wTUYxRGttRkhnd0VxTVRrOStDZFYzOWE1bWticnFvRkJ0?=
 =?utf-8?B?Z1dqU0NKMFFweldRWUp0QTBmcDNQVkVoUldnS1U3TWd6anZHdFlVNnJZUDhu?=
 =?utf-8?B?RGY1clNuc3lUejlJMEx5YnBIYm1GM1hnN0hRWEE1UTZqMDlmT1pQcm1XQUJG?=
 =?utf-8?B?Nmc3eTY3OGcrNVU4cjdGZXMwcmdIanhnS3BmRjlDTTBLRGJzZExsYTFUM3RH?=
 =?utf-8?B?Q3gwYy9vVXB1R2JDT2F2TmpCaFZGejBpS0sxbDhvOTdZWUhSV0pidmhuWnhT?=
 =?utf-8?B?SHRwZkRoWUZzdEo4NGRpVXRhaGk1d2xucUxzRVpBZEFQcTBLOXVUQVhxTVRL?=
 =?utf-8?B?cGxDdXVYdWF4TWpzVThKOFBHekNlTmh4WEx4NE5TbDJmUmFZeTBpZE53SUZV?=
 =?utf-8?B?cHAwNzZzSlZQN2NIY21lbTVYUXBtWEE5YkhrVjdPVUpHN0M2Y2VvTUtidThx?=
 =?utf-8?B?OGtNRGxreTV4TEgvbHVxdFdmK1VRcURGVlVDa3dFbEl2OGpBTnNsUHNkZ2p0?=
 =?utf-8?B?SW1wZUUxbzZiSDA0eU4yNmVxUkVxMG8xS3l5bVJoL0N3ZW5TbVJCTDR4a3Fm?=
 =?utf-8?B?QjBHaE9RK25zQVdiMkJjRnh5T0ZpVXBIb1BRNkxXQ0JVZTk2cXR1N0FhL2NS?=
 =?utf-8?B?djAxVVhHQS9PQkJkRW9FUGowakE3bWdLN3M4d0hZaysyL2JhNUdkcjBCQnVG?=
 =?utf-8?B?c2hKRGlFUjh0anhYRSs1WGF2Ny9nTTBWaGxlNVY1cXpRMmNnZFp6TzZ2NDZt?=
 =?utf-8?B?S0dNU0p4enQ2amlEMC9ZRnAvbmlVb05TNHJqQ0dvVDdGQkVQaWJXbnFvSnhI?=
 =?utf-8?Q?qSywEzCghHum5SrFxcBx2kAh0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	50HT3RIqEW7xEvmgjbGZjy1IykHr4IttFaNLhOHbhUEQAQcjoW7wO4ttaRkS7Sm12sjn4Kimhd25xtAzUVdGjZg4s9lq/oHSF1Ti5ioXPeloqKvrKj2G4NPl1VTI9Iy/OsNfKRSdUm5nwGbf2aNU+ro3zzwCHF7nDzfDC/DZP2dH1e9oyMl7q+86geOHJHeMfdHJGGJ7nu/YmXdWCfSyfPHLxl01qlxOUt27KUTRLHxAAfrjJZKIXNF7j9P6o8cjfNP4bqzN/1EQNqvjSh0/jWD7F6Q67gwf7vKn4qMRBad/ddFKxmGMpiSl0uwHAf+XpHA4R1/eGGdjXCfhPGdcmAwMBSpK+HyzONTyNFk+Gvb/+qmTebvjJpZOnpSwSZmvbGdaKBzuQfRQ8IvRr0pxRAFfpjQxCZ5Mo8UznxGGIsqBs1aGaFMqhNdsH8iVv9s6h0D79hY988zbP9XCXcT0IV+iEC4a7F5mQgxde38ViB166erE96CnZDH2//SMSwjeXV+37wCdQSJQbgv+WmoYH/RVizpQXLlCsLxTHKKIx6B+a+ACw86n4MGI6f25Pcy++AL4zda/GyHJEJQ0trKoMuuvgNUAFlFmkwB4rx1WqPSPzepvEXm7cBalmtueFx55N5VRPibxIEUXzLgaEPMkKs2UX+ecbzjyiD5Sk2L51/xvcMdK0ZSD0IyKW02XTTnPRzB3hUlZIqQykh2WkAzBIVof5pTYOvgBg9uvH/YVzUWonyaoh7vPuMyGdxAPi1uPBamBBx2jnGX9imGst13n8Gih+2ykYpy/EBd7gTjZ1hjt7aYr/KfVE1nxF3pPL6b2A/P/DY1Dhk0V18JW4xNnK10RzNXpRN2hs0HhM19qyHU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe695c7-ae82-4d9f-cd44-08db579cff65
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:40:01.6631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8/hMv7HO2bC+Tk4XwOJP56UgyN0HUbX8vgrJ7T9vgZxTh5MgdrZdRfqKi33wB6qxCw3Er9V5AJo6Zpz+lpt5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5624

On Thu, May 18, 2023 at 12:14:46PM +0000, Rahul Singh wrote:
> Hi Roger,
> 
> > On 18 May 2023, at 11:57 am, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > When a domain parameter is provided to pci_get_pdev() the search
> > function would match against the bdf, without taking the segment into
> > account.
> > 
> > Fix this and also account for the passed segment.
> > 
> > Fixes: 8cf6e0738906 ('PCI: simplify (and thus correct) pci_get_pdev{,_by_domain}()')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>  
> I think the correct fixes tag is:
> Fixes: a37f9ea7a651 ("PCI: fold pci_get_pdev{,_by_domain}()")

I don't think so, a37f9ea7a651 just changed:

         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
-            if ( pdev->bus == bus && pdev->devfn == devfn )
+            if ( pdev->sbdf.bdf == sbdf.bdf )
                 return pdev;

That code was already wrong, a37f9ea7a651 simply switched it to use
the sbdf struct field.

Thanks, Roger.

