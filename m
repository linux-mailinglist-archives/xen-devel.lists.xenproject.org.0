Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA96F433C
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 14:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528552.821868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoh6-0005ly-65; Tue, 02 May 2023 12:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528552.821868; Tue, 02 May 2023 12:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoh6-0005jC-33; Tue, 02 May 2023 12:01:20 +0000
Received: by outflank-mailman (input) for mailman id 528552;
 Tue, 02 May 2023 12:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptoh4-0005j6-7L
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 12:01:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0908c1e4-e8e1-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 14:01:15 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 08:01:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 12:01:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 12:01:07 +0000
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
X-Inumbo-ID: 0908c1e4-e8e1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683028875;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MO9YZe9mZayTlgGSpnI5uZXpludFlQY/Ro+jZvMe6yE=;
  b=dIReUgIAzMymFuirSf32CIN/TrUgaRp2EwNSPSHbLwE5oneFSKbnVnHK
   aUmVBzjQiaqA8syN3IF75MqLrHufVJkjO/XaCh/N7wovxDH/jGKnyR3Ll
   nO0RkZpUhS68yeqdyRkEQBeXZL60y5HPJ2jPncaRxh33oRO59Zoa53ukW
   I=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 107971263
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23://jsZ6CgJ4uPCRVW/wDiw5YqxClBgxIJ4kV8jS/XYbTApDJx0D1Uz
 mRLDD2BOq6NZ2D8eNgjOtzl/RsGsJOAzNBqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3el5WUAS3
 t0iKikzcEC9q8uLy5ehRbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDC7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwnKkAdhMT9VU8NZBkFSyxWBICiQkXEu+neuztxOaQOt2f
 hl8Fi0G6PJaGFaQZt75VhOQqXOcsBoRHdZde8U44gyQzqvf4y6CG3MJCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptXm/oc6i0uWSs45SfHtyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CAhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:kpM9jqyLK1sJV/MNO26yKrPwyb1zdoMgy1knxilNoH1uH/Bw+P
 rOoB1273/JYVUqKRUdcLK7Scq9qBrnnPYfjeZ+AV7IZniChILHFvAB0aLShxfnHDLz7fNQ2J
 pnV6h7BLTLfD9HpNe/5BOnV9UtxNTC96y3n+LT0mpgVmhRGthdxhY8DhyEVk57QAQDHpY3FJ
 f03Ls+mxOwPXAMcIC5Cn0JG/LIr9rNlJXpJQQNAQUq8mC1/FWVwa+/CRKfxRcYXXdEyaov/2
 7fg2XCjJmejw==
X-Talos-CUID: =?us-ascii?q?9a23=3A77BJxGhnQ5s07KuJSTM09DM6jzJuVXLTlFaMCG6?=
 =?us-ascii?q?CC39XVu2rZXat84Z+nJ87?=
X-Talos-MUID: 9a23:T51NuwQ1ExxVFvySRXTHlDhDN8sz4Z2cAVAIrYcMhpSgLhVZbmI=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="107971263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjiK3cgwVFpZFETyuqsDf7Z4ZhTFX3IPoKJen1lTGoe0Dar8CTtcTZGY8CsZypQUs2JmAVNje0tG9hBdWl1ymFBB68+jrdRmS8CfRtFDGzuvXgoPd1h019eKmbTJkOzjBc2lTbL9Ny3C65el3K4M3jvPP2PAxF8y8OjvKB8tf+pHvIUoe3bdAPaUFRyT5vab1hZKCUUq0v5EJ290J/fzSf7o9USCvZW6OhzfzKL2uTsMfoZje+/YPxM5UAhDfVvEiy8czuFHLjKMoZsyoxrLl4BdoqIQrhJSMn6MRvUu/PhRM/2khbuI2wmeAnvSfH0ByS5NmVOv49VxvZ58RiU80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO9YZe9mZayTlgGSpnI5uZXpludFlQY/Ro+jZvMe6yE=;
 b=mkgTl/uH3ccqFUk3Gd/H22GN6i4SPsQVzlVGHPIvTFYlLaFux5WTNTlAX5zbeuE4FSinafJajwbfaLbnWU4PG2fb4oOSTKLNYQqlsYwND/M0DqzLh7RcnYHYxBx4fYoDLnoR4z0SBk/rek1Ir7J9xNt2wSlrWPbGh/OLPhAQZm2vOW7hLOVYvDhoCU7kcFAJsih5lOEaDcoOp9eGzs3uT2cgGhEjkdHbbevRkCexBpEyEwW8V3/Dci/uc3SkiASt9wFtrX+e2ovbMQfdE19MzqF+MguC/SvJ4+8o64lFma63DWKqh+1tS9Sq2BKaSrnKIuunbMls4TRgtCdGBZMDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO9YZe9mZayTlgGSpnI5uZXpludFlQY/Ro+jZvMe6yE=;
 b=kKzwgn2UEyLvgVVmD1kmiWHuUTE7yXFu6K1f/NOEcOKD49BxSMuKf8ETlV4Oun6TAiNXPgmcZA+4VZO5xYJEvBWCdfiZJNNGMbAv0zRXLSadVQHMXP4LuPzgzO8szGMj7jlng/scj7odMejv8UxmpO6c/FznWtxObPGcTFkqVHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <71c0b0a4-caf5-2b60-0e6a-54dfe313e332@citrix.com>
Date: Tue, 2 May 2023 13:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: HAS_CC_CET_IBT misdetected
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
 <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
 <20230502133313.2192eb99.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230502133313.2192eb99.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a327ba5-300e-4f1e-6363-08db4b04e943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6j4PHyszZ79nd8anDnfw2tQDadC4m8CIJPjldIzYZBTaIl+53GbrRcVNbr9IBbykqw+zXUQ8ZwQj8V9DStc71Y2cHIRXCuS97TMUZHpql8AgmiklNi1I8usu//GGO6jNWS8jzdKLT86HqTnZOp7WzsZ6l1wuJqdKDoLHcy0iIv+QL6rhFf/c0W2J0HTyujKpYSAzG7JM1f9QNEYxcV3NTrqmc56NT6FxhambTlY/K7pXqHdBsz2Z3iZBeIqdau42UcrFDUuPXFoxpNLhoQX5NP98V7UYK0i8m6QqVncIGDtmav/T4ewDjTEi3YkyJs5mq+LVhZA6lXZLM0q8xU5al2mZXYKABgjU1fXeKnVsRt8K8hBeY8e803WhzLM+GFcA5BF1L1Mi3d3uM4+A/QTWiGSMwwTHYd22KM9KlPFv324NQvCjAyEUkDDRRfJsty8yztmQ8lgWMVa8GnjS+QoGkmM7w3XrehOqRCiYtURkFTTYPIgdoX1aTO371uEwbOnpU6Y/TqHvsoX501aat6bHy96SdlbD8o0CBDNRf2Jkq6xnoIlJGrSp9wW1RXVimSnzJ5IiErh+rBeEO+ZVKjbrelf67mxVRgcP3fJ4unktETSUb2FOyVjtkT50kazGpyRDy+4wB/HVICQHHlFXrCVSfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(66556008)(66476007)(82960400001)(38100700002)(6506007)(6512007)(31686004)(186003)(316002)(26005)(4326008)(53546011)(66946007)(110136005)(478600001)(41300700001)(7116003)(36756003)(2616005)(6666004)(966005)(86362001)(6486002)(83380400001)(5660300002)(2906002)(8676002)(8936002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXl0WUY2VUZtTE96d0Q0VzBNNUJNYXNyZGtneHA4SlZnSTJYcTkvSENxc1Ju?=
 =?utf-8?B?U2MrS0xQNnhSemVCaExVdjd0U3lNQ3htaklKTnRBZjJTU3A0SGNBNTlRc0xq?=
 =?utf-8?B?L0tHRFVpTm9meFBkWmRJUzBQYzQrR1dYYlI0bmNpeTlKMzhLcmZVTVd3WUxo?=
 =?utf-8?B?VXRLUVN5aGpCYTNpRjl6OWl4UnhXQVJ3ZmZEMDJQMTJNUHdyN0hnUGQ4UEk0?=
 =?utf-8?B?UTUzZ3ZzNjR4T0lKeXloUG9DaTNwdFpBSk1mR3dJcFhzenBnZXpRTVNicm1o?=
 =?utf-8?B?czE3WGlJTk9ERkZjS09ieTdTT25KQXU3bGRwUU9yNnkrbHJmYzF2UTJ1dW9P?=
 =?utf-8?B?a1lHbWkxTmtOamVrTHBDU3JlQXZGbVk4RVNQdGVSQjJBaHFDS0ZXKzV2Z3dE?=
 =?utf-8?B?ak5UalRteWk0ay94OHNsZG5rc3ppa0h2djVyaTFUWWNPT09UNllTVmVhQ1FE?=
 =?utf-8?B?VDIzS0h5VkJpNjNMTGpmSng5cVdjWnlzdkI1dy90K2RjRnhLY2VqSm03akR0?=
 =?utf-8?B?bjQwcU1OSkQzTVUzbTdFWGRiN1Z6cjh5M0JzNThoaW9nMVVYRVBHZUNGTUVF?=
 =?utf-8?B?V1crRlI1Szlqdkc4NWNMdnp5ZStIMDBSUDBmY3pCOU51K2g1MUJXN2hZTEhY?=
 =?utf-8?B?UDJSbEJLN3pRZXd6VE1ncFFxelJScFNYRGkxVzJmK3YzWUpXekxNc1p6TEIv?=
 =?utf-8?B?OC9iUlJ4OW5zM25Db001TTVVQlJKWit4MUxvZHVRMGpBTEsrNGFoWExsZEdp?=
 =?utf-8?B?dmkyL1pnbURNS21iWVFsdFVFWFJneERJK05kcURvY21ZL01tUVlIbDBrS1Mv?=
 =?utf-8?B?WUlpZDZLNFU0VmtWamxCR1VMVS9VOVp6ZkFTeTNFRithUCtOSnc0TklsWXM2?=
 =?utf-8?B?MTVIWlFQOUo1cnBVTHNKZ0hXczJtbktWLy9HM1Y5WkZ6Tk5MQ1g5aHFWVTZz?=
 =?utf-8?B?YXArMEJDdzBxRHhFbkh1d0huekVCcnJZNlN1bVBvYlhhemFEWnFFQXlUVS9I?=
 =?utf-8?B?Z3N3TzM0Si9JOGJrck80S1IzcjR3amxjR2o2MDFJY05wMS9MRS9Hb1BkbkNy?=
 =?utf-8?B?YU1NOXJDK1dUc21PQjFyaTRZdTRoZ2twcjBzaXBqbDJDdzA5clV5MGNUYmFD?=
 =?utf-8?B?YjRpNGZMNEw3ZzRmRmVaejZvTEZiblUwNmtzczJ6WVUrcGFRdzNuMFpyL2NC?=
 =?utf-8?B?SXBHUVJ6WUpKb29xajlHM3ZmOFdoM3IrNzk4TXJBM1YxdFZLaTdzV2krUFgv?=
 =?utf-8?B?V1RFWUczZk5GN2ZqWnY5d2ZYT2VNbVc3eGtVVTNtZjU5RXVEblgyRWRlSDBn?=
 =?utf-8?B?dkhkY0JvMG0zVmZ6VmlTYjhqMFVGeXJ4S0NucHVuOVBxUllZUVV2TzVlaEZp?=
 =?utf-8?B?VHhwdk42SjJqN09zd0ZlY3dGTExSSXZiSmtXSDM4R1RZSzdySkwwekx0dUZt?=
 =?utf-8?B?VkxWTDk0eXhOMXk2cWVBQVJOS3NoK0lBVUUvdVNOOUFrOHgwNWhKNEk1cGx5?=
 =?utf-8?B?QmlqUndDNHQ0SzRYZmF0L2hWSlQ5VkhiUDdKRkdUWUpQemxvbFdGK1JObWdM?=
 =?utf-8?B?djU1eWFLNlRZQ24wdU5RUjllU05ici9kNlhFNkc5aGhiZGlMQVFaZWN1Q0g2?=
 =?utf-8?B?WW82ZSsxTkd4N2JlT2VpL0NqSzZoWXk2RGNMc3AvSVVYMllJWGIrdWQrL2lo?=
 =?utf-8?B?WCsrV003UE5FMTlDTzIyb09MUk9SNFNLelFTdXBObmpybktLSnFvU01EZXFn?=
 =?utf-8?B?ZHlQWHUvdzJFcmd5WkNCWEt2OW9Ma3loRS8rVWJEdC9ITEhHa1k0MllSOUdU?=
 =?utf-8?B?cUEvZnRTRFVtSE1hWm0rUlkyMHBTcE8vMmdnV1VVbkY1S0xHcTZreDgrVVdK?=
 =?utf-8?B?d3J2Q252TWlQSVFxNkxJRkNZcEtDZklLS2VQQUJDY2tlZWVGU2ZLdFErQzBC?=
 =?utf-8?B?b2VTWmtxN0ZZWXVkUFZmYzI0RTc1Q2pGVGM2cCtILzVUWHNHNUJ1Z2dpd3oz?=
 =?utf-8?B?VTJsdm1xekhDZWY0UDlTUFF0WnVSeVlHNHRXcE1xeE1tVFNyNWtaZHdZWHhD?=
 =?utf-8?B?M2x0SlI1b2xmWndhdDdVV21GWFlQeDlRcWoyQllmaGRTZ3VQcW0vajEyM1Vx?=
 =?utf-8?B?SWFrRlErcXdMT3ZNYlBsT3FNSytUM3pKRXRLWkRnbC80OXRJWm1Zei9LRkY5?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Csywnk10FwI9jV3cZBOyb5ImAS/eIadGdeW2eLaKwjPLaMfxRpC2HXw+dz8GMBIYFu7U2uiAYSupXElwMKeRIb+gLFTF8g8bfV437O0tbH1vrFWvZ5Xw3QnI/zje3qZzmAqnFNiatMhNpJnk0gqQOq6HwJCAmyYu/sWh/hNdkEqNOMdGgEQg8wWnegkjgOv4b18UpWpbTqpGFbETn9jYL5iud0Lj9Phi2IeR9sjMR3N+e8JV2cIzBj8p05depYTu4jZ4PG/MQLwWww1cZSKHooRU0qsPTnM53Zzbt3vD5HJ3IA6j6qz/prL/HZXGJyeI++9txlP/uemekK/P/EwyAJAmt45bNYMRuo8CvE+1nrrw/ac6D69lTAeBrR2NDXlfKbYGKSZwOwc0b7Qv4vtY/ElLojnUkxleFoDCCRmP1KxiHPs7Fwhn4fPFMEOLzq71/fPARR309HXfxHCkZuY1ZW4Ydc0l/HLotA3Q66iWK+n8HFwJkkoUmg+kOfbnsQszUWA9FjLmmkyjg/gMR2/EH2qCVwq0f4JnTq4oYuEFluKoSNkrJ9/UP4OiNe2NdJOI1NKXy1s8EqhZunZ3I24Mqcvmkm79Y6/ltVM7uInNWuFMfTvNm/KMFLk1yAh9EbZPBX1yVLvH9UpK+gYO35bSJKO77nkil7x7YbpjVtywrLqzaoBuxAmQMBg8GHi6ec26KrxeLEUlU0EJL2/NAFw7+qbw+t05DBCi8wGbEfHgGb/bjUpv4r076e+FYM84qTOXVfPsaSo+z1YT+PJUI3FbMb13rYcYvS7L4YCnrkyiGEtlvbNdiLt9ViitpROhuy28sMwCKNhnYv3w9pWuQh+//g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a327ba5-300e-4f1e-6363-08db4b04e943
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 12:01:07.1529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9GZs7zyLzzo8aRF1CoWEumd4iExMffPEqehsC3nuSoi5rhBe1ysjRMepMlFVLN4+SuqI7GyC1clkzkjnyuAWled4XQkpBa2rhv3bhtJqk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5888

On 02/05/2023 12:33 pm, Olaf Hering wrote:
> Tue, 2 May 2023 09:31:56 +0200 Jan Beulich <jbeulich@suse.com>:
>
>> How does 2.37 vs 2.39 matter? CET-IBT support is present in gas as of 2.29.
> I have no idea. It turned out, the previous Leap image was based on 15.3, while the current one will be 15.4.
>
> If I run this manually, it appears the error is produced properly:
>
> gcc -Wall -fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern -c -x assembler -o /dev/null - ; echo $?
> gcc: error: unrecognized command line option ‘-fcf-protection=branch’; did you mean ‘-fno-protect-parens’?
> gcc: error: unrecognized command line option ‘-mmanual-endbr’
> 1
>
> An for some reason there is no failure with the refreshed image on gitlab:
>
> https://gitlab.com/xen-project/xen/-/jobs/4210269545/artifacts/external_file/build.log
>
> I will investigate why it failed to build for me.

CET-IBT is far more dependent on the compiler, than it is on binutils.

The minimum version of GCC necessary is 9, but if you've backported the
requisite options then an older GCC will work too.

~Andrew

